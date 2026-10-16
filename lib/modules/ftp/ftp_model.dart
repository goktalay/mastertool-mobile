// FTP Masters veri modeli — senkron `data` şeması masaüstüyle birebir (ftpmasters/src/account.js:240-266):
// kind site {createdAt, name, host, port, protocol ftp|ftps-implicit|ftps-ssl|ftps-tls|sftp, username, loginMethod normal|anonymous,
//            authType password|key, comments, folderId, color, remoteDir, rememberLastDir, cacheMode, uploadCase, transferType, timezone,
//            siteOptions global|custom, retryAttempts, retryDelay, maxConcurrent, conflict, encoding, hostKey, password, passphrase, privateKey}
// kind folder {name, parentId}; kind settings (id "settings") {appTheme, language, speedLimitOn, speedLimitKB, maxConcurrent,
//            retryAttempts, retryDelay, transferType, conflict}. Yerel: keyPath, localDir, lastLocalDir, lastRemoteDir.
import '../ssh/ssh_model.dart' show parseHex;
import 'dart:ui';

const kFtpProtocols = <String, (String, int)>{
  'ftp': ('FTP', 21), 'ftps-implicit': ('FTPS Implicit (990)', 990), 'ftps-ssl': ('FTPS AUTH SSL', 21), 'ftps-tls': ('FTPS AUTH TLS', 21), 'sftp': ('SFTP (SSH)', 22),
};

class FtpSite {
  FtpSite(this.id, this.raw);
  final String id;
  final Map<String, dynamic> raw;

  String get name => (raw['name'] ?? '').toString();
  String get host => (raw['host'] ?? '').toString();
  String get protocol => (raw['protocol'] ?? 'ftp').toString();
  int get port => (raw['port'] as num?)?.toInt() ?? (kFtpProtocols[protocol]?.$2 ?? 21);
  String get username => (raw['username'] ?? '').toString();
  String get loginMethod => (raw['loginMethod'] ?? 'normal').toString();
  bool get anonymous => loginMethod == 'anonymous';
  String get authType => (raw['authType'] ?? 'password').toString();
  String get password => (raw['password'] ?? '').toString();
  String get passphrase => (raw['passphrase'] ?? '').toString();
  String get privateKey => (raw['privateKey'] ?? '').toString();
  String get comments => (raw['comments'] ?? '').toString();
  String? get folderId => raw['folderId'] as String?;
  String get color => (raw['color'] ?? '#22d3ee').toString();
  Color get colorValue => parseHex(color);
  String get remoteDir => (raw['remoteDir'] ?? '').toString();
  bool get rememberLastDir => raw['rememberLastDir'] == true;
  String get transferType => (raw['transferType'] ?? 'global').toString();
  int get timezone => (raw['timezone'] as num?)?.toInt() ?? 0;
  String get encoding => (raw['encoding'] ?? 'auto').toString();
  String get conflict => (raw['conflict'] ?? 'overwrite').toString();
  int get maxConcurrent => (raw['maxConcurrent'] as num?)?.toInt() ?? 4;
  int get retryAttempts => (raw['retryAttempts'] as num?)?.toInt() ?? 3;
  int get retryDelay => (raw['retryDelay'] as num?)?.toInt() ?? 10;
  String? get hostKey => raw['hostKey'] as String?;
  bool get isSftp => protocol == 'sftp';
  bool get usesKey => isSftp && authType == 'key';

  static Map<String, dynamic> blank() => {
        'createdAt': DateTime.now().millisecondsSinceEpoch, 'name': '', 'host': '', 'port': 21, 'protocol': 'ftp', 'username': '',
        'loginMethod': 'normal', 'authType': 'password', 'comments': '', 'folderId': null, 'color': '#22d3ee', 'remoteDir': '',
        'rememberLastDir': false, 'cacheMode': 'session', 'uploadCase': 'preserve', 'transferType': 'global', 'timezone': 0,
        'siteOptions': 'global', 'retryAttempts': 3, 'retryDelay': 10, 'maxConcurrent': 4, 'conflict': 'overwrite', 'encoding': 'auto',
        'hostKey': null, 'password': '', 'passphrase': '', 'privateKey': '',
      };
}

class FtpFolder {
  FtpFolder(this.id, this.raw);
  final String id;
  final Map<String, dynamic> raw;
  String get name => (raw['name'] ?? '').toString();
  String? get parentId => raw['parentId'] as String?;
}

/// Uzak dizin girdisi (FTP ve SFTP ortak)
class RemoteEntry {
  RemoteEntry({required this.name, required this.isDir, this.size = 0, this.modified, this.isLink = false, this.perms});
  final String name;
  final bool isDir, isLink;
  final int size;
  final DateTime? modified;
  final String? perms;
}
