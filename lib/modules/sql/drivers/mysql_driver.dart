// MySQL / MariaDB sürücüsü (`mysql_client`). Masaüstü core/providers/mysql.ts davranışı: sslMode prefer → TLS dene, sunucu
// desteklemiyorsa şifresiz; require/verify-full → TLS (sürücü sertifika doğrulamaz); salt okunur kip SET SESSION TRANSACTION
// READ ONLY; veritabanı değişimi USE ile; okuma sorguları akış (iterable) halinde, komutlar düz execute. İptal: bağlantı kapatılır.
import 'dart:async';

import 'package:mysql_client/mysql_client.dart';

import '../sql_classify.dart';
import '../sql_dialect.dart';
import '../sql_lexer.dart';
import 'sql_driver.dart';

const _typeNames = <int, String>{
  0: 'decimal', 1: 'tinyint', 2: 'smallint', 3: 'int', 4: 'float', 5: 'double', 6: 'null', 7: 'timestamp', 8: 'bigint', 9: 'mediumint',
  10: 'date', 11: 'time', 12: 'datetime', 13: 'year', 14: 'date', 15: 'varchar', 16: 'bit', 245: 'json', 246: 'decimal', 247: 'enum',
  248: 'set', 249: 'tinyblob', 250: 'mediumblob', 251: 'longblob', 252: 'blob', 253: 'varchar', 254: 'char', 255: 'geometry',
};
const _numericCodes = {0, 1, 2, 3, 4, 5, 8, 9, 13, 246};
const _systemDbs = {'information_schema', 'performance_schema', 'mysql', 'sys'};

class MysqlDriver implements SqlDriver {
  MysqlDriver({required this.host, required this.port, required this.user, required this.password, required this.database, required this.sslMode, required this.readOnly});
  final String host, user, password, database, sslMode;
  final int port;
  bool readOnly;
  MySQLConnection? _c;
  String? _currentDb;
  bool _tls = false;
  bool _cancelled = false;
  ServerInfo _info = const ServerInfo(product: 'MySQL', version: '');

  @override
  SqlDialect get dialect => 'mysql';
  @override
  ServerInfo get serverInfo => _info;

  static bool _isNoSsl(Object e) => RegExp('does not support (secure|SSL)|SSL connection error|HANDSHAKE_NO_SSL_SUPPORT', caseSensitive: false).hasMatch(e.toString());

  Future<MySQLConnection> _open(bool secure) async {
    final c = await MySQLConnection.createConnection(host: host, port: port, userName: user, password: password, secure: secure, databaseName: database.isEmpty ? null : database);
    await c.connect(timeoutMs: 15000);
    return c;
  }

  Future<MySQLConnection> _conn() async {
    final e = _c;
    if (e != null && e.connected) return e;
    MySQLConnection c;
    final secure = sslMode != 'disable';
    try {
      c = await _open(secure);
      _tls = secure;
    } catch (err) {
      if (sslMode != 'prefer' || !_isNoSsl(err)) rethrow;
      c = await _open(false);
      _tls = false;
    }
    _c = c;
    _currentDb = database.isEmpty ? null : database;
    if (readOnly) await c.execute('SET SESSION TRANSACTION READ ONLY');
    return c;
  }

  Future<void> _use(String? db) async {
    if (db == null || db.isEmpty || db == _currentDb) return;
    await (await _conn()).execute('USE ${quoteIdent(db, dialect)}');
    _currentDb = db;
  }

  Future<List<List<String?>>> _rows(String sql, [String? db]) async {
    await _use(db);
    final r = await (await _conn()).execute(sql);
    return [for (final row in r.rows) [for (var i = 0; i < row.numOfColumns; i++) row.colAt(i)]];
  }

  @override
  Future<void> connect() async {
    final r = await _rows('select version() v, database() db, current_user() u');
    final v = r.first[0] ?? '';
    final product = v.toLowerCase().contains('mariadb') ? 'MariaDB $v' : 'MySQL $v';
    _info = ServerInfo(product: product, version: v, database: r.first[1], user: r.first[2], tls: _tls);
  }

  @override
  Future<void> close() async {
    final c = _c;
    _c = null;
    if (c != null) await c.close().catchError((_) {});
  }

  @override
  Future<void> setReadOnly(bool on) async {
    readOnly = on;
    await (await _conn()).execute(on ? 'SET SESSION TRANSACTION READ ONLY' : 'SET SESSION TRANSACTION READ WRITE');
  }

  @override
  Future<List<String>> databases() async {
    final r = await _rows('SHOW DATABASES');
    final dbs = r.map((x) => x[0] ?? '').where((d) => !_systemDbs.contains(d.toLowerCase())).toList();
    dbs.sort((a, b) => a == database ? -1 : b == database ? 1 : a.compareTo(b));
    return dbs;
  }

  @override
  Future<List<String>> schemas(String db) async => [db];

  @override
  Future<List<TableInfo>> tables(String db, String schema) async {
    final r = await _rows("select table_name, table_type, table_rows from information_schema.tables where table_schema = ${literal(db, dialect)} and table_type in ('BASE TABLE','VIEW') order by table_type, table_name");
    return [for (final x in r) TableInfo(name: x[0] ?? '', kind: x[1] == 'VIEW' ? 'view' : 'table', rowEstimate: x[1] == 'VIEW' ? null : int.tryParse(x[2] ?? ''))];
  }

  @override
  Future<List<ColumnInfo>> columns(String db, String schema, String table) async {
    final r = await _rows('select column_name, column_type, data_type, is_nullable, column_key from information_schema.columns where table_schema = ${literal(db, dialect)} and table_name = ${literal(table, dialect)} order by ordinal_position');
    return [for (final x in r) ColumnInfo(name: x[0] ?? '', type: x[1] ?? '', numeric: kNumericType.hasMatch(x[2] ?? ''), notNull: x[3] == 'NO', pk: x[4] == 'PRI')];
  }

  @override
  Future<List<IndexInfo>> indexes(String db, String schema, String table) async {
    final r = await _rows('select index_name, min(non_unique) from information_schema.statistics where table_schema = ${literal(db, dialect)} and table_name = ${literal(table, dialect)} group by index_name order by index_name');
    return [for (final x in r) IndexInfo(name: x[0] ?? '', detail: x[0] == 'PRIMARY' ? 'PRIMARY' : x[1] == '0' ? 'UNIQUE' : null)];
  }

  List<ColumnMeta> _cols(IResultSet r) => [for (final c in r.cols) ColumnMeta(name: c.name, type: _typeNames[c.type.intVal] ?? '${c.type.intVal}', numeric: _numericCodes.contains(c.type.intVal))];

  @override
  Stream<QueryEvent> query(String sql, {String? database, int? limit}) async* {
    _cancelled = false;
    await _use(database);
    final c = await _conn();
    final read = classify(sql, dialect).kind == StatementKind.read;
    if (!read) {
      final r = await c.execute(sql);
      if (r.numOfColumns == 0) {
        yield QCommand(command: commandTag(sql), rowsAffected: r.affectedRows.toInt());
        return;
      }
      yield* chunked(_cols(r), r.rows.map((row) => [for (var i = 0; i < row.numOfColumns; i++) row.colAt(i)]), limit: limit);
      return;
    }
    final IResultSet r;
    try {
      r = await c.execute(sql, null, true);
    } catch (e) {
      if (_cancelled) throw SqlCancelled();
      rethrow;
    }
    if (r.numOfColumns == 0) {
      yield QCommand(command: commandTag(sql), rowsAffected: null);
      return;
    }
    yield QColumns(_cols(r));
    var buf = <List<Object?>>[];
    var n = 0;
    var truncated = false;
    await for (final row in r.rowsStream) {
      if (_cancelled) throw SqlCancelled();
      if (limit != null && n >= limit) { truncated = true; continue; } // akış sonuna dek tüketilir (bağlantı bozulmasın)
      buf.add([for (var i = 0; i < row.numOfColumns; i++) row.colAt(i)]);
      n++;
      if (buf.length >= kChunkRows) { yield QRows(buf); buf = []; }
    }
    if (buf.isNotEmpty) yield QRows(buf);
    yield QEnd(rowCount: n, truncated: truncated);
  }

  @override
  Future<QCommand> execute(String sql, {String? database}) async {
    await _use(database);
    final r = await (await _conn()).execute(sql);
    return QCommand(command: commandTag(sql), rowsAffected: r.affectedRows.toInt());
  }

  @override
  Future<void> cancel() async {
    _cancelled = true;
    await close();
  }
}
