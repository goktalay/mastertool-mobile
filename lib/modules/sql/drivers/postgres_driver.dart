// PostgreSQL sürücüsü (`postgres` ^3). Masaüstü core/providers/postgres.ts davranışı: veritabanı başına ayrı bağlantı,
// sslMode eşlemesi (prefer: TLS dene, sunucu desteklemiyorsa şifresiz), salt okunur kip SET SESSION CHARACTERISTICS ile,
// sorgular basit protokolle (çoklu tip güvenli), tip adları pg_type'tan önbelleğe alınır. İptal: bağlantı zorla kapatılır.
import 'dart:async';

import 'package:postgres/postgres.dart' as pg;

import '../sql_dialect.dart';
import '../sql_lexer.dart';
import 'sql_driver.dart';

const _numericOids = {20, 21, 23, 26, 700, 701, 790, 1700};
const _sysSchemas = "('pg_catalog','information_schema','pg_toast')";

class PostgresDriver implements SqlDriver {
  PostgresDriver({required this.host, required this.port, required this.user, required this.password, required this.database, required this.sslMode, required this.readOnly});
  final String host, user, password, database, sslMode;
  final int port;
  bool readOnly;
  final Map<String, pg.Connection> _conns = {};
  final Map<String, Map<int, String>> _types = {};
  bool _tls = false;
  late String _defaultDb;
  ServerInfo _info = const ServerInfo(product: 'PostgreSQL', version: '');
  bool _cancelled = false;

  @override
  SqlDialect get dialect => 'postgres';
  @override
  ServerInfo get serverInfo => _info;

  Future<pg.Connection> _open(String db) async {
    Future<pg.Connection> tryOpen(pg.SslMode mode) => pg.Connection.open(
          pg.Endpoint(host: host, port: port, database: db, username: user, password: password),
          settings: pg.ConnectionSettings(sslMode: mode, applicationName: 'SQL Master', connectTimeout: const Duration(seconds: 15), queryMode: pg.QueryMode.simple),
        );
    pg.Connection c;
    final mode = switch (sslMode) { 'disable' => pg.SslMode.disable, 'verify-full' => pg.SslMode.verifyFull, _ => pg.SslMode.require };
    try {
      c = await tryOpen(mode);
      _tls = mode != pg.SslMode.disable;
    } catch (e) {
      // "prefer": sunucu TLS desteklemiyorsa şifresiz bağlan (arayüz uyarı gösterir)
      final m = e.toString().toLowerCase();
      if (sslMode != 'prefer' || !(m.contains('does not support ssl') || m.contains('ssl') && m.contains('not'))) rethrow;
      c = await tryOpen(pg.SslMode.disable);
      _tls = false;
    }
    if (readOnly) await c.execute('SET SESSION CHARACTERISTICS AS TRANSACTION READ ONLY');
    return c;
  }

  Future<pg.Connection> _conn([String? db]) async {
    final k = db ?? _defaultDb;
    final e = _conns[k];
    if (e != null && e.isOpen) return e;
    final c = await _open(k);
    _conns[k] = c;
    return c;
  }

  Future<pg.Result> _q(String sql, [String? db]) async => (await _conn(db)).execute(sql, queryMode: pg.QueryMode.simple);

  @override
  Future<void> connect() async {
    _defaultDb = database.isNotEmpty ? database : 'postgres';
    final r = await _q("select current_setting('server_version') v, current_database() db, current_user u");
    final row = r.first;
    _info = ServerInfo(product: 'PostgreSQL ${row[0]}', version: '${row[0]}', database: '${row[1]}', user: '${row[2]}', tls: _tls);
  }

  @override
  Future<void> close() async {
    for (final c in _conns.values) {
      await c.close(force: true).catchError((_) {});
    }
    _conns.clear();
  }

  @override
  Future<void> setReadOnly(bool on) async {
    readOnly = on;
    final sql = on ? 'SET SESSION CHARACTERISTICS AS TRANSACTION READ ONLY' : 'SET SESSION CHARACTERISTICS AS TRANSACTION READ WRITE';
    for (final c in _conns.values) {
      if (c.isOpen) await c.execute(sql);
    }
  }

  @override
  Future<List<String>> databases() async {
    final r = await _q('select datname from pg_database where not datistemplate and datallowconn order by datname');
    final list = r.map((x) => '${x[0]}').toList();
    list.sort((a, b) => a == _defaultDb ? -1 : b == _defaultDb ? 1 : 0);
    return list;
  }

  @override
  Future<List<String>> schemas(String db) async {
    final r = await _q("select nspname from pg_namespace where nspname not in $_sysSchemas and nspname not like 'pg_temp_%' and nspname not like 'pg_toast_temp_%' order by nspname = 'public' desc, nspname", db);
    return r.map((x) => '${x[0]}').toList();
  }

  @override
  Future<List<TableInfo>> tables(String db, String schema) async {
    final r = await _q("select c.relname, c.relkind, c.reltuples::bigint est from pg_class c join pg_namespace n on n.oid = c.relnamespace where n.nspname = ${literal(schema, dialect)} and c.relkind in ('r','p','v','m','f') and not c.relispartition order by c.relkind in ('r','p') desc, c.relname", db);
    return [
      for (final x in r)
        TableInfo(name: '${x[0]}', kind: const ['r', 'p'].contains('${x[1]}') ? 'table' : 'view', rowEstimate: const ['r', 'p'].contains('${x[1]}') && (x[2] as num).toInt() >= 0 ? (x[2] as num).toInt() : null),
    ];
  }

  @override
  Future<List<ColumnInfo>> columns(String db, String schema, String table) async {
    final r = await _q('select a.attname, format_type(a.atttypid, a.atttypmod) t, ty.typcategory cat, a.attnotnull nn, '
        'exists (select 1 from pg_index i where i.indrelid = c.oid and i.indisprimary and a.attnum = any(i.indkey)) pk '
        'from pg_attribute a join pg_class c on c.oid = a.attrelid join pg_namespace n on n.oid = c.relnamespace join pg_type ty on ty.oid = a.atttypid '
        'where n.nspname = ${literal(schema, dialect)} and c.relname = ${literal(table, dialect)} and a.attnum > 0 and not a.attisdropped order by a.attnum', db);
    return [for (final x in r) ColumnInfo(name: '${x[0]}', type: '${x[1]}', numeric: '${x[2]}' == 'N', notNull: x[3] == true || '${x[3]}' == 't', pk: x[4] == true || '${x[4]}' == 't')];
  }

  @override
  Future<List<IndexInfo>> indexes(String db, String schema, String table) async {
    final r = await _q('select ic.relname, i.indisunique uniq, i.indisprimary prim from pg_index i join pg_class ic on ic.oid = i.indexrelid join pg_class c on c.oid = i.indrelid '
        'join pg_namespace n on n.oid = c.relnamespace where n.nspname = ${literal(schema, dialect)} and c.relname = ${literal(table, dialect)} order by ic.relname', db);
    bool b(Object? v) => v == true || '$v' == 't';
    return [for (final x in r) IndexInfo(name: '${x[0]}', detail: b(x[2]) ? 'PRIMARY' : b(x[1]) ? 'UNIQUE' : null)];
  }

  Future<String> _typeName(String db, int oid) async {
    var m = _types[db];
    if (m == null) {
      final r = await _q('select oid::int, typname from pg_type', db);
      m = {for (final x in r) (x[0] as num).toInt(): '${x[1]}'};
      _types[db] = m;
    }
    return m[oid] ?? 'oid:$oid';
  }

  @override
  Stream<QueryEvent> query(String sql, {String? database, int? limit}) async* {
    _cancelled = false;
    final db = database ?? _defaultDb;
    final pg.Result r;
    try {
      r = await _q(sql, db);
    } catch (e) {
      if (_cancelled) throw SqlCancelled();
      rethrow;
    }
    if (r.schema.columns.isEmpty) {
      final cmd = commandTag(sql);
      yield QCommand(command: cmd, rowsAffected: const ['INSERT', 'UPDATE', 'DELETE', 'MERGE', 'COPY', 'SELECT', 'MOVE', 'FETCH'].contains(cmd) ? r.affectedRows : null);
      return;
    }
    final cols = <ColumnMeta>[];
    for (var i = 0; i < r.schema.columns.length; i++) {
      final c = r.schema.columns[i];
      cols.add(ColumnMeta(name: c.columnName ?? 'c${i + 1}', type: await _typeName(db, c.typeOid), numeric: _numericOids.contains(c.typeOid)));
    }
    yield* chunked(cols, r.map((row) => row.map(_cell).toList()), limit: limit);
  }

  Object? _cell(Object? v) => v is pg.UndecodedBytes ? (v.isBinary ? v.bytes : v.encoding.decode(v.bytes)) : v;

  @override
  Future<QCommand> execute(String sql, {String? database}) async {
    final r = await _q(sql, database);
    return QCommand(command: commandTag(sql), rowsAffected: r.affectedRows);
  }

  @override
  Future<void> cancel() async {
    _cancelled = true;
    await close();
  }
}
