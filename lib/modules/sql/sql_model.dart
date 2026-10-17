// SQL Master veri modeli — senkron `data` şeması masaüstüyle birebir (sqlmaster/src/main/account/library.ts CONN_FIELDS +
// store.ts normalize): kind connection {name, provider postgres|mssql|mysql|sqlite|duckdb, host, port, database, user, filePath,
// sslMode disable|prefer|require|verify-full, readOnly (varsayılan true), savePassword, color, folderId, comments, createdAt,
// ssh {enabled, host, port 22, user, auth key|password|agent, hostKey}, password, sshPassword, sshPassphrase, sshPrivateKey (PEM)};
// kind folder {name, parentId}; kind settings (id "settings") {appTheme, language, rowLimit 10000, previewRows 100, editorFontSize 13}.
// Yerel (senkron dışı): filePath (cihaz dosyası), ssh.keyPath, lastUsedAt. Bilinmeyen alanlar korunur.
import 'dart:io';
import 'dart:ui';

import '../ssh/ssh_model.dart' show parseHex;

/// Yerelde kalan alanlar (ModuleHost.open localOnly)
const kSqlLocalOnly = {'filePath', 'lastUsedAt'};

/// Seçilen veritabanı/veri dosyalarının kopyalandığı alt dizin (uygulama belgeler dizini altında)
const kSqlDocsSubdir = 'SQL Master/Belgeler';

class ProviderMeta {
  const ProviderMeta({required this.id, required this.name, required this.short, required this.kind, required this.dialect, this.defaultPort, this.defaultUser, required this.color, this.fileExtensions = const [], this.mobileAndroid = true, this.mobileIos = true});
  final String id, name, short, kind, dialect, color;
  final int? defaultPort;
  final String? defaultUser;
  final List<String> fileExtensions;
  /// Platform başına mobil sürücü var mı (SQL Server: FreeTDS kitaplığı yalnız Android'de paketlenebiliyor)
  final bool mobileAndroid, mobileIos;
  /// Bu cihazda sürücü var mı
  bool get mobile => Platform.isIOS ? mobileIos : mobileAndroid;
  bool get isFile => kind == 'file';
  Color get colorValue => parseHex(color);
}

/// Masaüstü shared/providers.ts PROVIDERS
const kProviders = <ProviderMeta>[
  ProviderMeta(id: 'postgres', name: 'PostgreSQL', short: 'PG', kind: 'server', dialect: 'postgres', defaultPort: 5432, defaultUser: 'postgres', color: '#3b82f6'),
  ProviderMeta(id: 'mssql', name: 'SQL Server', short: 'MSSQL', kind: 'server', dialect: 'mssql', defaultPort: 1433, defaultUser: 'sa', color: '#ef4444', mobileIos: false),
  ProviderMeta(id: 'mysql', name: 'MySQL / MariaDB', short: 'MySQL', kind: 'server', dialect: 'mysql', defaultPort: 3306, defaultUser: 'root', color: '#f97316'),
  ProviderMeta(id: 'sqlite', name: 'SQLite', short: 'SQLite', kind: 'file', dialect: 'sqlite', color: '#22d3ee', fileExtensions: ['db', 'sqlite', 'sqlite3', 'db3']),
  ProviderMeta(id: 'duckdb', name: 'DuckDB / Dosyalar (CSV, Parquet, JSON, Excel)', short: 'DuckDB', kind: 'file', dialect: 'duckdb', color: '#fbbf24', fileExtensions: ['duckdb', 'db', 'csv', 'tsv', 'parquet', 'json', 'jsonl', 'ndjson', 'xlsx']),
];

ProviderMeta providerMeta(String id) => kProviders.firstWhere((p) => p.id == id, orElse: () => kProviders[0]);

const kSslModes = ['prefer', 'require', 'verify-full', 'disable'];

class SqlConnection {
  SqlConnection(this.id, this.raw);
  final String id;
  final Map<String, dynamic> raw;

  String get name => (raw['name'] ?? '').toString();
  String get provider => kProviders.any((p) => p.id == raw['provider']) ? raw['provider'] as String : 'postgres';
  ProviderMeta get meta => providerMeta(provider);
  String get host => (raw['host'] ?? '').toString();
  int get port => (raw['port'] as num?)?.toInt() ?? meta.defaultPort ?? 0;
  String get database => (raw['database'] ?? '').toString();
  String get user => (raw['user'] ?? '').toString();
  String get userOrDefault => user.isNotEmpty ? user : (meta.defaultUser ?? '');
  String get filePath => (raw['filePath'] ?? '').toString();
  String get sslMode => kSslModes.contains(raw['sslMode']) ? raw['sslMode'] as String : 'prefer';
  bool get readOnly => raw['readOnly'] != false;
  bool get savePassword => raw['savePassword'] != false;
  String get color => (raw['color'] ?? '#22d3ee').toString();
  Color get colorValue => parseHex(color);
  String? get folderId => raw['folderId'] as String?;
  String get comments => (raw['comments'] ?? '').toString();
  int get createdAt => (raw['createdAt'] as num?)?.toInt() ?? 0;
  String get password => (raw['password'] ?? '').toString();
  String get sshPassword => (raw['sshPassword'] ?? '').toString();
  String get sshPassphrase => (raw['sshPassphrase'] ?? '').toString();
  String get sshPrivateKey => (raw['sshPrivateKey'] ?? '').toString();

  Map<String, dynamic> get ssh => (raw['ssh'] as Map?)?.cast<String, dynamic>() ?? const {};
  bool get sshEnabled => !meta.isFile && ssh['enabled'] == true;
  String get sshHost => (ssh['host'] ?? '').toString();
  int get sshPort => (ssh['port'] as num?)?.toInt() ?? 22;
  String get sshUser => (ssh['user'] ?? '').toString();
  String get sshAuth => const ['key', 'password', 'agent'].contains(ssh['auth']) ? ssh['auth'] as String : 'key';
  String? get sshHostKey => ssh['hostKey'] as String?;

  /// Kart alt satırı: user@host:port · dosya adı · "Bellek içi"
  String subtitle(String inMemory) {
    if (meta.isFile) return filePath.isEmpty ? inMemory : filePath.split(RegExp(r'[\\/]')).last;
    return '$userOrDefault@$host:$port';
  }

  static Map<String, dynamic> blank({String? folderId, String color = '#22d3ee'}) => {
        'name': '', 'provider': 'postgres', 'host': 'localhost', 'port': null, 'database': '', 'user': '', 'filePath': '', 'sslMode': 'prefer',
        'readOnly': true, 'savePassword': true, 'color': color, 'folderId': folderId, 'comments': '', 'createdAt': DateTime.now().millisecondsSinceEpoch,
        'ssh': {'enabled': false, 'host': '', 'port': 22, 'user': '', 'auth': 'key', 'hostKey': null},
        'password': '', 'sshPassword': '', 'sshPassphrase': '', 'sshPrivateKey': '',
      };
}

/// Ayar öğesi (id "settings")
class SqlSettings {
  SqlSettings(this.raw);
  final Map<String, dynamic> raw;
  int get rowLimit => ((raw['rowLimit'] as num?)?.toInt() ?? 10000).clamp(100, 1000000);
  int get previewRows => ((raw['previewRows'] as num?)?.toInt() ?? 100).clamp(10, 100000);
  double get editorFontSize => ((raw['editorFontSize'] as num?)?.toDouble() ?? 13).clamp(9, 24);
  static Map<String, dynamic> blank() => {'appTheme': null, 'language': null, 'rowLimit': 10000, 'previewRows': 100, 'editorFontSize': 13};
}
