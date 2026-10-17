// Sürücü soyutlaması: bağlantı ekranı hiçbir veritabanı paketini doğrudan tanımaz. Her motor SqlDriver'ı uygular.
// Sorgu sonucu akış halinde gelir (kolonlar → 500'lük satır parçaları → son); komutlar etkilenen satır sayısını döndürür.
// SSH tüneli: dartssh2 ile yerel port yönlendirme (sunucu motorlarında ssh.enabled ise önce tünel, sürücü 127.0.0.1:<port>'a bağlanır).
import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:crypto/crypto.dart' as c;
import 'package:dartssh2/dartssh2.dart';

import '../../../core/l10n/gen/mt_strings.dart';
import '../sql_dialect.dart';
import '../sql_grid_query.dart';
import '../sql_lexer.dart';
import '../sql_model.dart';
import 'duckdb_driver.dart';
import 'mssql_driver.dart';
import 'mysql_driver.dart';
import 'postgres_driver.dart';
import 'sqlite_driver.dart';

export '../sql_grid_query.dart' show ColumnMeta;

const kChunkRows = 500;

/// Tek bir ifadenin akışı
sealed class QueryEvent {
  const QueryEvent();
}

class QColumns extends QueryEvent {
  const QColumns(this.columns);
  final List<ColumnMeta> columns;
}

class QRows extends QueryEvent {
  const QRows(this.rows);
  final List<List<Object?>> rows;
}

class QEnd extends QueryEvent {
  const QEnd({required this.rowCount, required this.truncated});
  final int rowCount;
  final bool truncated;
}

class QCommand extends QueryEvent {
  const QCommand({required this.command, this.rowsAffected});
  final String command;
  final int? rowsAffected;
}

class TableInfo {
  const TableInfo({required this.name, required this.kind, this.rowEstimate});
  final String name;
  /// table | view
  final String kind;
  final int? rowEstimate;
}

class ColumnInfo {
  const ColumnInfo({required this.name, required this.type, this.numeric = false, this.notNull = false, this.pk = false});
  final String name, type;
  final bool numeric, notNull, pk;
  ColumnMeta get meta => ColumnMeta(name: name, type: type, numeric: numeric);
}

class IndexInfo {
  const IndexInfo({required this.name, this.detail});
  final String name;
  final String? detail;
}

class ServerInfo {
  const ServerInfo({required this.product, required this.version, this.database, this.user, this.tls});
  final String product, version;
  final String? database, user;
  final bool? tls;
}

class SqlCancelled implements Exception {}

abstract class SqlDriver {
  SqlDialect get dialect;
  Future<void> connect();
  Future<void> close();
  ServerInfo get serverInfo;
  /// Sunucu altındaki veritabanları (ilk öğe bağlantının veritabanı)
  Future<List<String>> databases();
  /// Veritabanındaki şemalar (MySQL/SQLite: tek öğe = veritabanı)
  Future<List<String>> schemas(String db);
  /// Tablolar + görünümler (yaklaşık satır sayısı varsa)
  Future<List<TableInfo>> tables(String db, String schema);
  Future<List<ColumnInfo>> columns(String db, String schema, String table);
  Future<List<IndexInfo>> indexes(String db, String schema, String table);
  /// Tek ifade; [limit] satırdan sonra kesilir (truncated). Parçalar [kChunkRows] satır.
  Stream<QueryEvent> query(String sql, {String? database, int? limit});
  /// Sonuç kümesi beklenmeyen ifade
  Future<QCommand> execute(String sql, {String? database});
  Future<void> cancel();
  Future<void> setReadOnly(bool on);
}

/// SQL'in ilk sözcüğü (komut etiketi)
String commandTag(String sql) {
  for (final t in tokenize(sql, 'postgres')) {
    if (t.kind == TokenKind.word) return t.upper!;
  }
  return 'OK';
}

/// Hücre metni (NULL ayrı gösterilir)
String cellText(Object? v) {
  if (v == null) return '';
  if (v is DateTime) return v.toIso8601String().replaceFirst('T', ' ').replaceFirst(RegExp(r'\.000(Z?)$'), r'$1');
  if (v is List<int> && v is! List<String>) return 'bytes[${v.length}]';
  if (v is Map || v is List) return jsonEncode(v);
  return v.toString();
}

/// SSH tüneli: yerel dinleyici → SSH → hedef host:port
class SshTunnel {
  SshTunnel(this.conn, {this.onHostKey});
  final SqlConnection conn;
  final void Function(String fp)? onHostKey;
  SSHClient? _client;
  ServerSocket? _server;
  String? fingerprint;
  int get localPort => _server?.port ?? 0;

  Future<void> open(String targetHost, int targetPort) async {
    final sock = await SSHSocket.connect(conn.sshHost, conn.sshPort, timeout: const Duration(seconds: 15));
    String? keyErr;
    final client = SSHClient(sock, username: conn.sshUser,
        onPasswordRequest: () => conn.sshAuth == 'password' ? conn.sshPassword : null,
        identities: conn.sshAuth == 'key' && conn.sshPrivateKey.isNotEmpty ? SSHKeyPair.fromPem(conn.sshPrivateKey, conn.sshPassphrase.isEmpty ? null : conn.sshPassphrase) : null,
        onVerifyHostKey: (type, key) {
          final fp = 'SHA256:${base64.encode(c.sha256.convert(key).bytes).replaceAll('=', '')}';
          fingerprint = fp;
          final saved = conn.sshHostKey;
          if (saved != null && saved.isNotEmpty && saved != fp) {
            keyErr = 'SSH host key mismatch: $fp';
            return false;
          }
          if (saved == null || saved.isEmpty) onHostKey?.call(fp);
          return true;
        });
    _client = client;
    try {
      await client.authenticated.timeout(const Duration(seconds: 20));
    } catch (e) {
      client.close();
      throw SshTunnelError(keyErr ?? e.toString(), auth: keyErr == null);
    }
    final server = await ServerSocket.bind(InternetAddress.loopbackIPv4, 0);
    _server = server;
    server.listen((local) async {
      try {
        final fwd = await client.forwardLocal(targetHost, targetPort);
        unawaited(local.cast<List<int>>().pipe(fwd.sink).catchError((_) {}));
        unawaited(fwd.stream.cast<List<int>>().pipe(local).catchError((_) {}));
      } catch (_) {
        local.destroy();
      }
    });
  }

  Future<void> close() async {
    await _server?.close();
    _client?.close();
    _server = null;
    _client = null;
  }
}

class SshTunnelError implements Exception {
  SshTunnelError(this.message, {this.auth = false});
  final String message;
  final bool auth;
  @override
  String toString() => message;
}

class UnsupportedProvider implements Exception {
  UnsupportedProvider(this.provider);
  final String provider;
  @override
  String toString() => 'unsupported provider: $provider';
}

/// Motor sürücüsünü kurar; [hostOverride]/[portOverride] SSH tüneli için.
SqlDriver createDriver(SqlConnection conn, {String? hostOverride, int? portOverride, String? password}) {
  final host = hostOverride ?? conn.host;
  final port = portOverride ?? conn.port;
  final pw = password ?? conn.password;
  return switch (conn.provider) {
    'postgres' => PostgresDriver(host: host, port: port, user: conn.userOrDefault, password: pw, database: conn.database, sslMode: conn.sslMode, readOnly: conn.readOnly),
    'mysql' => MysqlDriver(host: host, port: port, user: conn.userOrDefault, password: pw, database: conn.database, sslMode: conn.sslMode, readOnly: conn.readOnly),
    'sqlite' => SqliteDriver(path: conn.filePath, readOnly: conn.readOnly),
    'duckdb' => DuckDbDriver(path: conn.filePath, readOnly: conn.readOnly),
    'mssql' when MssqlDriver.supported => MssqlDriver(host: host, port: port, user: conn.userOrDefault, password: pw, database: conn.database, sslMode: conn.sslMode, readOnly: conn.readOnly),
    _ => throw UnsupportedProvider(conn.provider),
  };
}

/// Hata metni (masaüstü errors.ts eşlemesi)
String sqlErrorText(MtStrings s, Object e) {
  if (e is UnsupportedProvider) return s.sqMobUnsupportedMobile;
  // Sürücü mesajları zaten kullanıcıya dönük (DuckDB "Catalog Error: …", FreeTDS iletisi, yerel kitaplık uyarıları)
  if (e is DuckDbError || e is MssqlError) return e.toString().trim();
  if (e is ArgumentError && e.toString().toLowerCase().contains('failed to load dynamic library')) return kDuckNativeMissing;
  if (e is SshTunnelError) return e.auth ? s.sqErrSshAuth : e.message;
  if (e is SqlCancelled) return s.sqResCancelled;
  final m = e.toString();
  final low = m.toLowerCase();
  if (e is SocketException) {
    final os = e.osError?.errorCode ?? 0;
    if (os == 111 || low.contains('refused')) return s.sqErrRefused;
    if (os == 110 || low.contains('timed out') || low.contains('timeout')) return s.sqErrTimeout;
    if (os == 104 || low.contains('reset')) return s.sqErrReset;
    if (os == 113 || os == 101 || low.contains('unreachable')) return s.sqErrUnreach;
    if (low.contains('failed host lookup') || low.contains('nodename') || low.contains('name or service')) return s.sqErrDns;
  }
  if (e is TimeoutException) return s.sqErrTimeout;
  if (e is HandshakeException || e is TlsException || low.contains('ssl') && low.contains('error') || low.contains('certificate')) return s.sqErrTls(m);
  if (low.contains('refused')) return s.sqErrRefused;
  if (low.contains('failed host lookup')) return s.sqErrDns;
  final cleaned = m.replaceFirst(RegExp(r'^\w*(Exception|Error)[^:]*: '), '').trim();
  return cleaned.isEmpty ? s.sqErrUnknown : cleaned;
}

/// Sayısal türler için ortak metin testi (SQLite / MySQL)
final kNumericType = RegExp(r'^(tinyint|smallint|mediumint|int|integer|bigint|decimal|numeric|float|double|real|year|bit|number|money|serial)', caseSensitive: false);

/// Satırları [kChunkRows] parçalara bölerek yayan yardımcı
Stream<QueryEvent> chunked(List<ColumnMeta> cols, Iterable<List<Object?>> rows, {int? limit}) async* {
  yield QColumns(cols);
  var buf = <List<Object?>>[];
  var n = 0;
  var truncated = false;
  for (final r in rows) {
    if (limit != null && n >= limit) { truncated = true; break; }
    buf.add(r);
    n++;
    if (buf.length >= kChunkRows) { yield QRows(buf); buf = []; }
  }
  if (buf.isNotEmpty) yield QRows(buf);
  yield QEnd(rowCount: n, truncated: truncated);
}

String qualifiedName(SqlDialect d, {String? database, String? schema, required String name}) => qualified(TableRef(database: database, schema: schema, name: name), d);
