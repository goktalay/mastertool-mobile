// SQL Server sürücüsü (`mssql_connection` 3.x: Dart FFI + FreeTDS DB-Lib). Masaüstü core/providers/mssql.ts davranışı:
// sslMode → encrypt/trustServerCertificate eşlemesi (disable: şifresiz; prefer: FreeTDS varsayılanı; require: TLS, sertifika
// doğrulanmaz; verify-full: TLS + sertifika doğrulama), veritabanı değişimi USE ile, oturum düzeyinde salt okunur kip yok
// (sınıflandırıcı korur). Yalnız Android: paket Flutter eklentisi olmadığından iOS'ta statik FreeTDS kitaplıkları bağlanmaz;
// Android'de de libsybdb.so/libct.so'nun uygulama jniLibs'ine alınması gerekir (bkz. rapor). Sınırlar: sonuç kümesi FreeTDS
// tarafında tümüyle belleğe alınır (satır sınırı sonradan uygulanır), yalnız ilk sonuç kümesi gelir, iptal desteklenmez.
import 'dart:async';
import 'dart:convert';
import 'dart:ffi';
import 'dart:io';

import 'package:mssql_connection/mssql_connection.dart' show SQLException;
// MssqlClient dışa aktarılmıyor; dışa aktarılan MssqlConnection tekil (singleton) olduğundan bağlantı başına örnek için iç sınıf kullanılır
// ignore: implementation_imports
import 'package:mssql_connection/src/mssql_client.dart';

import '../sql_dialect.dart';
import '../sql_lexer.dart';
import 'sql_driver.dart';

// Türkçe sabit metinler (ARB'ye henüz eklenmedi)
const kMssqlNativeMissing = 'SQL Server yerel kitaplığı (FreeTDS libsybdb.so) uygulamaya paketlenmemiş. Android derlemesine mssql_connection jniLibs dizini eklenmeli.';
const kMssqlConnectFailed = 'SQL Server bağlantısı kurulamadı. Sunucu adresi, port, kullanıcı/parola ve TLS kipini denetleyin (ayrıntı için cihaz günlüğünde "MssqlClient").';
const kMssqlIosUnsupported = 'SQL Server sürücüsü iOS\'ta henüz desteklenmiyor (FreeTDS kitaplığı paketlenmiyor).';

final _numericType = RegExp(r'^(int|bigint|smallint|tinyint|decimal|numeric|float|real|money|smallmoney|bit)', caseSensitive: false);

class MssqlError implements Exception {
  MssqlError(this.message);
  final String message;
  @override
  String toString() => message;
}

class MssqlDriver implements SqlDriver {
  MssqlDriver({required this.host, required this.port, required this.user, required this.password, required this.database, required this.sslMode, required this.readOnly});
  final String host, user, password, database, sslMode;
  final int port;
  bool readOnly;
  MssqlClient? _c;
  String? _currentDb;
  bool _tls = false;
  ServerInfo _info = const ServerInfo(product: 'SQL Server', version: '');

  @override
  SqlDialect get dialect => 'mssql';
  @override
  ServerInfo get serverInfo => _info;

  /// Bu platformda sürücü kullanılabilir mi
  static bool get supported => Platform.isAndroid;

  String _qi(String s) => quoteIdent(s, dialect);
  String _lit(String s) => literal(s, dialect);

  MssqlClient get client => _c ?? (throw StateError('not connected'));

  @override
  Future<void> connect() async {
    if (!supported) throw MssqlError(Platform.isIOS ? kMssqlIosUnsupported : kMssqlNativeMissing);
    // Yerel kitaplık paketlenmiş mi: MssqlClient.connect her hatayı "false" olarak yutar, ayrımı burada yapıyoruz
    try {
      DynamicLibrary.open('libsybdb.so');
    } catch (e) {
      throw MssqlError('$kMssqlNativeMissing\n$e');
    }
    final c = MssqlClient(
      server: '$host:$port', username: user, password: password,
      encrypt: switch (sslMode) { 'disable' => false, 'prefer' => null, _ => true },
      trustServerCertificate: sslMode != 'verify-full',
      tdsVersion: '7.4',
    );
    final ok = await c.connect(loginTimeoutSeconds: 15);
    if (!ok) throw MssqlError(kMssqlConnectFailed);
    _c = c;
    _tls = sslMode != 'disable';
    try {
      if (database.isNotEmpty) {
        await _q('USE ${_qi(database)}');
        _currentDb = database;
      }
      final r = await _q("select cast(serverproperty('ProductVersion') as nvarchar(64)) v, @@version ver, db_name() db, suser_sname() u");
      final row = r.rows.firstOrNull ?? const {};
      try {
        final e = await _q('select encrypt_option enc from sys.dm_exec_connections where session_id = @@spid');
        final enc = e.rows.firstOrNull?['enc'];
        if (enc != null) _tls = '$enc'.toUpperCase() == 'TRUE';
      } catch (_) {/* yetki yok */}
      final year = RegExp(r'Microsoft SQL Server (\d{4})').firstMatch('${row['ver'] ?? ''}')?.group(1);
      _currentDb = row['db']?.toString() ?? _currentDb;
      _info = ServerInfo(product: 'SQL Server ${year ?? ''} ${row['v'] ?? ''}'.replaceAll(RegExp(r'\s+'), ' ').trim(), version: '${row['v'] ?? ''}', database: row['db']?.toString(), user: row['u']?.toString(), tls: _tls);
    } catch (_) {
      await close();
      rethrow;
    }
  }

  @override
  Future<void> close() async {
    final c = _c;
    _c = null;
    try { await c?.close(); } catch (_) {}
  }

  @override
  Future<void> setReadOnly(bool on) async => readOnly = on; // oturum düzeyinde yok; sınıflandırıcı korur

  @override
  Future<void> cancel() async {/* FreeDTS DB-Lib sarmalayıcısında iptal yok */}

  Future<void> _use(String? db) async {
    if (db == null || db.isEmpty || db == _currentDb) return;
    await _q('USE ${_qi(db)}');
    _currentDb = db;
  }

  /// Ham sonuç: {columns, rows (Map), affected}
  Future<_Res> _q(String sql) async {
    final String raw;
    try {
      raw = await client.execute(sql);
    } on SQLException catch (e) {
      throw MssqlError(e.message);
    }
    final m = jsonDecode(raw) as Map<String, dynamic>;
    if (m['error'] != null) throw MssqlError('${m['error']}');
    return _Res(
      columns: [for (final c in (m['columns'] as List? ?? const [])) '$c'],
      rows: [for (final r in (m['rows'] as List? ?? const [])) (r as Map).cast<String, dynamic>()],
      affected: (m['affected'] as num?)?.toInt(),
    );
  }

  @override
  Future<List<String>> databases() async {
    final r = await _q('select name from sys.databases where state = 0 and has_dbaccess(name) = 1 order by case when database_id <= 4 then 1 else 0 end, name');
    final list = [for (final x in r.rows) '${x['name']}'];
    list.sort((a, b) => a == database ? -1 : b == database ? 1 : 0);
    return list;
  }

  @override
  Future<List<String>> schemas(String db) async {
    final d = _qi(db);
    final r = await _q("select s.name from $d.sys.schemas s where s.name not in ('sys','INFORMATION_SCHEMA','guest') and s.name not like 'db[_]%' "
        "and (s.name = 'dbo' or exists (select 1 from $d.sys.objects o where o.schema_id = s.schema_id)) order by case when s.name = 'dbo' then 0 else 1 end, s.name");
    return [for (final x in r.rows) '${x['name']}'];
  }

  @override
  Future<List<TableInfo>> tables(String db, String schema) async {
    final d = _qi(db);
    final r = await _q('select o.name, o.type t, (select sum(p.rows) from $d.sys.partitions p where p.object_id = o.object_id and p.index_id in (0,1)) rws '
        "from $d.sys.objects o join $d.sys.schemas s on s.schema_id = o.schema_id where s.name = ${_lit(schema)} and o.type in ('U','V') and o.is_ms_shipped = 0 order by o.type desc, o.name");
    return [
      for (final x in r.rows)
        TableInfo(name: '${x['name']}', kind: '${x['t']}'.trim() == 'U' ? 'table' : 'view', rowEstimate: '${x['t']}'.trim() == 'U' ? (x['rws'] as num?)?.toInt() : null),
    ];
  }

  @override
  Future<List<ColumnInfo>> columns(String db, String schema, String table) async {
    final d = _qi(db);
    final r = await _q('select c.name, '
        "case when t.name in ('varchar','char','varbinary','binary') then t.name + '(' + case when c.max_length = -1 then 'max' else cast(c.max_length as varchar(10)) end + ')' "
        "when t.name in ('nvarchar','nchar') then t.name + '(' + case when c.max_length = -1 then 'max' else cast(c.max_length / 2 as varchar(10)) end + ')' "
        "when t.name in ('decimal','numeric') then t.name + '(' + cast(c.precision as varchar(5)) + ',' + cast(c.scale as varchar(5)) + ')' "
        "when t.name in ('datetime2','time','datetimeoffset') then t.name + '(' + cast(c.scale as varchar(5)) + ')' else t.name end typ, "
        'c.is_nullable nul, t.name cat, '
        'case when exists (select 1 from $d.sys.index_columns ic join $d.sys.indexes i on i.object_id = ic.object_id and i.index_id = ic.index_id '
        'where i.is_primary_key = 1 and ic.object_id = c.object_id and ic.column_id = c.column_id) then 1 else 0 end pk '
        'from $d.sys.columns c join $d.sys.types t on t.user_type_id = c.user_type_id join $d.sys.objects o on o.object_id = c.object_id '
        'join $d.sys.schemas s on s.schema_id = o.schema_id where s.name = ${_lit(schema)} and o.name = ${_lit(table)} order by c.column_id');
    bool b(Object? v) => v == true || v == 1 || '$v' == '1' || '$v'.toLowerCase() == 'true';
    return [for (final x in r.rows) ColumnInfo(name: '${x['name']}', type: '${x['typ']}', numeric: _numericType.hasMatch('${x['cat']}'), notNull: !b(x['nul']), pk: b(x['pk']))];
  }

  @override
  Future<List<IndexInfo>> indexes(String db, String schema, String table) async {
    final d = _qi(db);
    final r = await _q('select i.name, i.is_primary_key pk, i.is_unique uq, i.type_desc td from $d.sys.indexes i where i.object_id = '
        '(select o.object_id from $d.sys.objects o join $d.sys.schemas s on s.schema_id = o.schema_id where s.name = ${_lit(schema)} and o.name = ${_lit(table)}) and i.name is not null order by i.name');
    bool b(Object? v) => v == true || v == 1 || '$v' == '1' || '$v'.toLowerCase() == 'true';
    return [for (final x in r.rows) IndexInfo(name: '${x['name']}', detail: b(x['pk']) ? 'PRIMARY KEY' : b(x['uq']) ? 'UNIQUE' : '${x['td'] ?? ''}'.toLowerCase())];
  }

  @override
  Stream<QueryEvent> query(String sql, {String? database, int? limit}) async* {
    await _use(database);
    final r = await _q(sql);
    final tag = commandTag(sql);
    if (r.columns.isEmpty) {
      yield QCommand(command: tag, rowsAffected: const ['INSERT', 'UPDATE', 'DELETE', 'MERGE'].contains(tag) ? r.affected : null);
      return;
    }
    // Kolon tipleri ilk satırın Dart tiplerinden (DB-Lib sarmalayıcısı tip adı vermez)
    final first = r.rows.firstOrNull;
    final cols = [for (final c in r.columns) ColumnMeta(name: c, type: _typeOf(first?[c]), numeric: first?[c] is num)];
    yield* chunked(cols, r.rows.map((row) => [for (final c in r.columns) row[c]]), limit: limit);
  }

  static String _typeOf(Object? v) => switch (v) { null => '', bool _ => 'bit', int _ => 'int', double _ => 'float', String _ => 'nvarchar', _ => 'sql_variant' };

  @override
  Future<QCommand> execute(String sql, {String? database}) async {
    await _use(database);
    final r = await _q(sql);
    return QCommand(command: commandTag(sql), rowsAffected: r.affected);
  }
}

class _Res {
  const _Res({required this.columns, required this.rows, this.affected});
  final List<String> columns;
  final List<Map<String, dynamic>> rows;
  final int? affected;
}
