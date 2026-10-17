// DuckDB sürücüsü (`dart_duckdb`, yerel libduckdb + FFI; sorgular paketin kendi isolate'inde çalışır). Masaüstü
// core/providers/duckdb.ts davranışı: filePath boş → bellek içi; filePath bir veri dosyasıysa (csv/tsv/parquet/json/jsonl/
// ndjson/xlsx) bellek içi veritabanında dosya adıyla bir VIEW açılır; SQL içinde `SELECT * FROM 'x.csv'` doğrudan çalışır.
// Salt okunur kip dosya veritabanında açılış seçeneğiyle (access_mode READ_ONLY; değiştirmek yeniden açar), bellek içinde
// sınıflandırıcı korur. Sonuçlar 500'lük parçalarla yayınlanır; iptal: duckdb_interrupt + parçalar arasında bayrak.
import 'dart:async';
import 'dart:io';
import 'dart:typed_data';

import 'package:dart_duckdb/dart_duckdb.dart' as dk;

import '../sql_dialect.dart';
import '../sql_lexer.dart';
import 'sql_driver.dart';

/// Doğrudan sorgulanabilen veri dosyaları (masaüstü FILE_EXT)
final kDuckDataFileExt = RegExp(r'\.(csv|tsv|parquet|json|jsonl|ndjson|xlsx)$', caseSensitive: false);

// Türkçe sabit metinler (ARB'ye henüz eklenmedi)
const kDuckExcelNote = 'Excel (.xlsx) dosyaları DuckDB "excel" eklentisini gerektirir; eklenti cihazda yüklenemiyorsa açılış hata verir. CSV, Parquet ve JSON ek kurulum istemez.';
const kDuckExcelUnsupported = 'Excel dosyası açılamadı: DuckDB "excel" eklentisi bu cihazda yüklenemedi. Dosyayı CSV olarak kaydedip tekrar deneyin.';
const kDuckFileNotFound = 'Dosya bulunamadı';
const kDuckNativeMissing = 'DuckDB yerel kitaplığı (libduckdb) yüklenemedi. Uygulama bu platform için DuckDB ikilisi olmadan derlenmiş olabilir.';
const _dml = {'INSERT', 'UPDATE', 'DELETE', 'MERGE', 'COPY', 'UPSERT'};
const _systemDbs = "('system','temp')";

/// Sürücü hatası: DuckDB mesajı (yığın izi olmadan)
class DuckDbError implements Exception {
  DuckDbError(this.message);
  final String message;
  @override
  String toString() => message;
}

class DuckDbDriver implements SqlDriver {
  DuckDbDriver({required this.path, required this.readOnly});
  final String path;
  bool readOnly;
  dk.Database? _db;
  dk.Connection? _conn;
  String? _currentDb;
  bool _cancelled = false;
  ServerInfo _info = const ServerInfo(product: 'DuckDB', version: '');

  @override
  SqlDialect get dialect => 'duckdb';
  @override
  ServerInfo get serverInfo => _info;

  dk.Connection get conn => _conn ?? (throw StateError('not connected'));

  static bool isDataFile(String p) => kDuckDataFileExt.hasMatch(p.trim());
  static bool _isXlsx(String p) => p.trim().toLowerCase().endsWith('.xlsx');

  /// Dosya için FROM ifadesi: 'x.csv' ya da read_xlsx('x.xlsx')
  static String readerFor(String p) => _isXlsx(p) ? "read_xlsx(${literal(p, 'duckdb')})" : literal(p, 'duckdb');

  /// Dosya adından görünüm adı (uzantısız, [^A-Za-z0-9_] → _)
  static String viewNameFor(String p) {
    final base = p.split(RegExp(r'[\\/]')).last.replaceFirst(RegExp(r'\.[^.]+$'), '').replaceAll(RegExp(r'[^A-Za-z0-9_]'), '_');
    return base.isEmpty ? 'veri' : base;
  }

  /// Açılacak veritabanı yolu (veri dosyası → bellek içi)
  String get dbPath {
    final f = path.trim();
    return f.isEmpty || isDataFile(f) ? ':memory:' : f;
  }

  /// Seçili veri dosyası (varsa)
  String? get dataFile => isDataFile(path) ? path.trim() : null;

  @override
  Future<void> connect() async {
    final p = dbPath;
    if (p != ':memory:' && readOnly && !File(p).existsSync()) throw DuckDbError('$kDuckFileNotFound: $p');
    final settings = <String, String>{
      'access_mode': p != ':memory:' && readOnly ? 'READ_ONLY' : 'AUTOMATIC',
      'autoinstall_known_extensions': 'true',
      'autoload_known_extensions': 'true',
    };
    dk.Database db;
    try {
      try {
        db = await dk.duckdb.open(p, settings: settings);
      } on dk.DuckDBException catch (e) {
        // Eklenti ayarları bu derlemede yoksa yalnız erişim kipiyle aç
        if (!e.message.contains('config')) rethrow;
        db = await dk.duckdb.open(p, settings: {'access_mode': settings['access_mode']!});
      }
    } on ArgumentError catch (e) {
      throw DuckDbError('$kDuckNativeMissing\n$e');
    } on dk.DuckDBException catch (e) {
      throw DuckDbError(e.message.trim());
    }
    _db = db;
    try {
      _conn = await dk.duckdb.connect(db);
      final f = dataFile;
      if (f != null) {
        try {
          await _exec('CREATE VIEW ${quoteIdent(viewNameFor(f), dialect)} AS SELECT * FROM ${readerFor(f)}');
        } on DuckDbError catch (e) {
          if (_isXlsx(f) && RegExp('excel|extension|read_xlsx', caseSensitive: false).hasMatch(e.message)) throw DuckDbError('$kDuckExcelUnsupported\n${e.message}');
          rethrow;
        }
      }
      final r = await _rows('select version() v, current_database() d');
      final v = '${r.first[0]}';
      _currentDb = '${r.first[1]}';
      _info = ServerInfo(product: 'DuckDB $v', version: v, database: path.trim().isEmpty ? ':memory:' : path.split(RegExp(r'[\\/]')).last);
    } catch (_) {
      await close();
      rethrow;
    }
  }

  @override
  Future<void> close() async {
    final c = _conn, d = _db;
    _conn = null;
    _db = null;
    try { await c?.dispose(); } catch (_) {}
    try { await d?.dispose(); } catch (_) {}
  }

  @override
  Future<void> setReadOnly(bool on) async {
    if (on == readOnly) return;
    readOnly = on;
    // Dosya veritabanında erişim kipi yalnız açılışta belirlenir: yeniden aç; bellek içinde sınıflandırıcı korur
    if (dbPath == ':memory:') return;
    await close();
    await connect();
  }

  Future<void> _use(String? db) async {
    if (db == null || db.isEmpty || db == _currentDb) return;
    await _exec('USE ${quoteIdent(db, dialect)}');
    _currentDb = db;
  }

  DuckDbError _wrap(Object e) => e is dk.DuckDBException ? DuckDbError(e.message.trim()) : e is DuckDbError ? e : DuckDbError(e.toString());

  Future<void> _exec(String sql) async {
    try {
      await conn.execute(sql);
    } catch (e) {
      throw _wrap(e);
    }
  }

  Future<List<List<Object?>>> _rows(String sql) async {
    final dk.ResultSet rs;
    try {
      rs = await conn.query(sql);
    } catch (e) {
      throw _wrap(e);
    }
    try {
      return rs.fetchAll().map((r) => r.map(cell).toList()).toList();
    } finally {
      await rs.dispose();
    }
  }

  @override
  Future<List<String>> databases() async {
    final r = await _rows('select database_name from duckdb_databases() where not internal and database_name not in $_systemDbs order by database_name');
    final list = [for (final x in r) '${x[0]}'];
    final cur = _currentDb;
    if (cur != null) list.sort((a, b) => a == cur ? -1 : b == cur ? 1 : 0);
    return list;
  }

  @override
  Future<List<String>> schemas(String db) async {
    final r = await _rows("select schema_name from duckdb_schemas() where database_name = ${literal(db, dialect)} and schema_name not in ('information_schema','pg_catalog') order by schema_name = 'main' desc, schema_name");
    return [for (final x in r) '${x[0]}'];
  }

  String _where(String db, String schema) => 'database_name = ${literal(db, dialect)} and schema_name = ${literal(schema, dialect)}';

  @override
  Future<List<TableInfo>> tables(String db, String schema) async {
    final w = _where(db, schema);
    final t = await _rows('select table_name, estimated_size from duckdb_tables() where $w and not internal order by table_name');
    final v = await _rows('select view_name from duckdb_views() where $w and not internal order by view_name');
    return [
      for (final x in t) TableInfo(name: '${x[0]}', kind: 'table', rowEstimate: (x[1] as num?)?.toInt()),
      for (final x in v) TableInfo(name: '${x[0]}', kind: 'view'),
    ];
  }

  @override
  Future<List<ColumnInfo>> columns(String db, String schema, String table) async {
    final w = _where(db, schema);
    final r = await _rows('select column_name, data_type, is_nullable from duckdb_columns() where $w and table_name = ${literal(table, dialect)} order by column_index');
    final pkRows = await _rows("select constraint_column_names from duckdb_constraints() where $w and table_name = ${literal(table, dialect)} and constraint_type = 'PRIMARY KEY'");
    final pk = <String>{for (final x in pkRows) if (x[0] is List) ...(x[0] as List).map((e) => '$e')};
    return [
      for (final x in r)
        ColumnInfo(name: '${x[0]}', type: '${x[1]}', numeric: kDuckNumericType.hasMatch('${x[1]}'), notNull: x[2] == false, pk: pk.contains('${x[0]}')),
    ];
  }

  @override
  Future<List<IndexInfo>> indexes(String db, String schema, String table) async {
    final r = await _rows('select index_name, is_unique from duckdb_indexes() where ${_where(db, schema)} and table_name = ${literal(table, dialect)} order by index_name');
    return [for (final x in r) IndexInfo(name: '${x[0]}', detail: x[1] == true ? 'UNIQUE' : null)];
  }

  @override
  Stream<QueryEvent> query(String sql, {String? database, int? limit}) async* {
    _cancelled = false;
    await _use(database);
    final dk.ResultSet rs;
    try {
      rs = await conn.query(sql);
    } catch (e) {
      if (_cancelled || e.toString().contains('INTERRUPT')) throw SqlCancelled();
      throw _wrap(e);
    }
    try {
      final tag = commandTag(sql);
      final n = rs.columnCount;
      if (n == 0) {
        yield QCommand(command: tag);
        return;
      }
      // DML tek "Count" kolonu döndürür: etkilenen satır sayısı
      if (n == 1 && rs.columnNames.first == 'Count' && _dml.contains(tag)) {
        final row = rs.fetchOne();
        yield QCommand(command: tag, rowsAffected: (row?[0] as num?)?.toInt());
        return;
      }
      yield QColumns([for (var i = 0; i < n; i++) _meta(rs.columnNames[i], rs.columnDataType(i))]);
      var buf = <List<Object?>>[];
      var count = 0;
      var truncated = false;
      await for (final row in rs.fetchAllStream()) {
        if (_cancelled) throw SqlCancelled();
        if (limit != null && count >= limit) { truncated = true; break; }
        buf.add(row.map(cell).toList());
        count++;
        if (buf.length >= kChunkRows) { yield QRows(buf); buf = []; }
      }
      if (buf.isNotEmpty) yield QRows(buf);
      yield QEnd(rowCount: count, truncated: truncated);
    } finally {
      await rs.dispose();
    }
  }

  @override
  Future<QCommand> execute(String sql, {String? database}) async {
    QCommand? out;
    await for (final ev in query(sql, database: database)) {
      if (ev is QCommand) out = ev;
    }
    return out ?? QCommand(command: commandTag(sql));
  }

  @override
  Future<void> cancel() async {
    _cancelled = true;
    try { await _conn?.interrupt(); } catch (_) {}
  }

  static ColumnMeta _meta(String name, dk.DatabaseType t) {
    final nt = t is dk.DatabaseTypeNative ? t : null;
    return ColumnMeta(name: name, type: nt == null ? '' : _typeNames[nt] ?? nt.name.toUpperCase(), numeric: t.isNumeric || nt == dk.DatabaseTypeNative.decimal);
  }

  /// Hücre değeri: ızgara ve dışa aktarma için güvenli Dart tipleri (DuckDB özel tipleri metne)
  static Object? cell(Object? v) => switch (v) {
        null || bool _ || int _ || double _ || String _ || DateTime _ || Uint8List _ => v,
        List _ => [for (final x in v) _nested(x)],
        Map _ => {for (final e in v.entries) '${e.key}': _nested(e.value)},
        _ => v.toString(),
      };

  static Object? _nested(Object? v) => switch (v) {
        null || bool _ || int _ || double _ || String _ => v,
        DateTime _ => v.toIso8601String(),
        Uint8List _ => 'bytes[${v.length}]',
        List _ => [for (final x in v) _nested(x)],
        Map _ => {for (final e in v.entries) '${e.key}': _nested(e.value)},
        _ => v.toString(),
      };
}

/// Sayısal DuckDB türleri (masaüstü NUMERIC)
final kDuckNumericType = RegExp(r'^(TINYINT|SMALLINT|INTEGER|BIGINT|HUGEINT|UTINYINT|USMALLINT|UINTEGER|UBIGINT|UHUGEINT|FLOAT|DOUBLE|DECIMAL|REAL)', caseSensitive: false);

const _typeNames = <dk.DatabaseTypeNative, String>{
  dk.DatabaseTypeNative.boolean: 'BOOLEAN', dk.DatabaseTypeNative.tinyInt: 'TINYINT', dk.DatabaseTypeNative.smallInt: 'SMALLINT', dk.DatabaseTypeNative.integer: 'INTEGER',
  dk.DatabaseTypeNative.bigInt: 'BIGINT', dk.DatabaseTypeNative.uTinyInt: 'UTINYINT', dk.DatabaseTypeNative.uSmallInt: 'USMALLINT', dk.DatabaseTypeNative.uInteger: 'UINTEGER',
  dk.DatabaseTypeNative.uBigInt: 'UBIGINT', dk.DatabaseTypeNative.float: 'FLOAT', dk.DatabaseTypeNative.double: 'DOUBLE', dk.DatabaseTypeNative.timestamp: 'TIMESTAMP',
  dk.DatabaseTypeNative.date: 'DATE', dk.DatabaseTypeNative.time: 'TIME', dk.DatabaseTypeNative.interval: 'INTERVAL', dk.DatabaseTypeNative.hugeInt: 'HUGEINT',
  dk.DatabaseTypeNative.varchar: 'VARCHAR', dk.DatabaseTypeNative.blob: 'BLOB', dk.DatabaseTypeNative.decimal: 'DECIMAL', dk.DatabaseTypeNative.timestampS: 'TIMESTAMP_S',
  dk.DatabaseTypeNative.timestampMS: 'TIMESTAMP_MS', dk.DatabaseTypeNative.timestampNS: 'TIMESTAMP_NS', dk.DatabaseTypeNative.enumeration: 'ENUM', dk.DatabaseTypeNative.list: 'LIST',
  dk.DatabaseTypeNative.structure: 'STRUCT', dk.DatabaseTypeNative.map: 'MAP', dk.DatabaseTypeNative.uuid: 'UUID', dk.DatabaseTypeNative.union: 'UNION',
  dk.DatabaseTypeNative.bitString: 'BIT', dk.DatabaseTypeNative.timeTz: 'TIMETZ', dk.DatabaseTypeNative.timestampTz: 'TIMESTAMPTZ', dk.DatabaseTypeNative.uHugeInt: 'UHUGEINT',
  dk.DatabaseTypeNative.array: 'ARRAY', dk.DatabaseTypeNative.any: 'ANY', dk.DatabaseTypeNative.varInt: 'VARINT', dk.DatabaseTypeNative.invalid: '',
};
