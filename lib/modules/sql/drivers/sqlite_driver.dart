// SQLite sürücüsü (`sqlite3`, cihaz dosyası). Masaüstü core/providers/sqlite.ts davranışı: salt okunur kip
// "PRAGMA query_only" ile (dosya hiç değiştirilmez), boş yol = bellek içi, PRAGMA foreign_keys = ON. Sorgular imleçle
// satır satır okunur; iptal parçalar arasında yapılır.
import 'dart:async';

import 'package:sqlite3/sqlite3.dart';

import '../sql_dialect.dart';
import '../sql_lexer.dart';
import 'sql_driver.dart';

class SqliteDriver implements SqlDriver {
  SqliteDriver({required this.path, required this.readOnly});
  final String path;
  bool readOnly;
  Database? _db;
  bool _cancelled = false;
  ServerInfo _info = const ServerInfo(product: 'SQLite', version: '');

  @override
  SqlDialect get dialect => 'sqlite';
  @override
  ServerInfo get serverInfo => _info;

  Database get db => _db ?? (throw StateError('not connected'));

  @override
  Future<void> connect() async {
    final d = path.isEmpty ? sqlite3.openInMemory() : sqlite3.open(path);
    _db = d;
    d.execute('PRAGMA foreign_keys = ON');
    if (readOnly) d.execute('PRAGMA query_only = ON');
    final v = d.select('select sqlite_version() v').first.columnAt(0).toString();
    _info = ServerInfo(product: 'SQLite $v', version: v, database: path.isEmpty ? ':memory:' : path.split(RegExp(r'[\\/]')).last);
  }

  @override
  Future<void> close() async {
    _db?.close();
    _db = null;
  }

  @override
  Future<void> setReadOnly(bool on) async {
    readOnly = on;
    db.execute('PRAGMA query_only = ${on ? 'ON' : 'OFF'}');
  }

  @override
  Future<List<String>> databases() async => [for (final r in db.select('PRAGMA database_list')) if (r['name'] != 'temp') r['name'].toString()];

  @override
  Future<List<String>> schemas(String dbName) async => [dbName];

  String _master(String schema) => '${quoteIdent(schema, dialect)}.sqlite_master';

  @override
  Future<List<TableInfo>> tables(String dbName, String schema) async {
    final r = db.select("select name, type from ${_master(schema)} where type in ('table','view') and name not like 'sqlite_%' order by type, name");
    return [for (final x in r) TableInfo(name: x['name'].toString(), kind: x['type'].toString())];
  }

  @override
  Future<List<ColumnInfo>> columns(String dbName, String schema, String table) async {
    final r = db.select('select name, type, "notnull", pk from pragma_table_info(${literal(table, dialect)}, ${literal(schema, dialect)})');
    return [for (final x in r) ColumnInfo(name: x['name'].toString(), type: (x['type'] ?? '').toString().isEmpty ? 'ANY' : x['type'].toString(), numeric: kNumericType.hasMatch((x['type'] ?? '').toString()), notNull: x['notnull'] == 1, pk: (x['pk'] as num? ?? 0) > 0)];
  }

  @override
  Future<List<IndexInfo>> indexes(String dbName, String schema, String table) async {
    final r = db.select("select name, sql from ${_master(schema)} where type = 'index' and tbl_name = ${literal(table, dialect)} order by name");
    return [for (final x in r) IndexInfo(name: x['name'].toString(), detail: (x['sql'] ?? '').toString().toUpperCase().contains('UNIQUE') ? 'UNIQUE' : x['sql'] == null ? 'AUTO' : null)];
  }

  @override
  Stream<QueryEvent> query(String sql, {String? database, int? limit}) async* {
    _cancelled = false;
    final stmt = db.prepare(sql);
    try {
      final cur = stmt.selectCursor();
      final names = cur.columnNames;
      if (names.isEmpty) {
        while (cur.moveNext()) {}
        yield QCommand(command: commandTag(sql), rowsAffected: db.updatedRows);
        return;
      }
      // Kolon tipleri ilk satırın Dart tiplerinden (decltype yok); kolon olayı ilk parçadan önce bir kez yayınlanır
      var sentCols = false;
      var buf = <List<Object?>>[];
      var n = 0;
      var truncated = false;
      while (cur.moveNext()) {
        if (_cancelled) throw SqlCancelled();
        if (limit != null && n >= limit) { truncated = true; break; }
        final row = [for (var i = 0; i < names.length; i++) cur.current.columnAt(i)];
        if (!sentCols) {
          sentCols = true;
          yield QColumns([for (var i = 0; i < names.length; i++) ColumnMeta(name: names[i], type: _typeOf(row[i]), numeric: row[i] is num)]);
        }
        buf.add(row);
        n++;
        if (buf.length >= kChunkRows) { yield QRows(buf); buf = []; }
      }
      if (!sentCols) yield QColumns([for (final nm in names) ColumnMeta(name: nm, type: '')]);
      if (buf.isNotEmpty) yield QRows(buf);
      yield QEnd(rowCount: n, truncated: truncated);
    } finally {
      stmt.close();
    }
  }

  static String _typeOf(Object? v) => switch (v) { null => '', int _ => 'INTEGER', double _ => 'REAL', String _ => 'TEXT', List<int> _ => 'BLOB', _ => '' };

  @override
  Future<QCommand> execute(String sql, {String? database}) async {
    db.execute(sql);
    return QCommand(command: commandTag(sql), rowsAffected: db.updatedRows);
  }

  @override
  Future<void> cancel() async => _cancelled = true;
}
