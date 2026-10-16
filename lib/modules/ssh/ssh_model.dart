// SSH Master veri modeli — senkron `data` şeması masaüstüyle birebir (sshmasters/src/account.js:386-405):
// kind connection {name, host, port, username, authType password|key, password, passphrase, privateKey, folderId, color, theme,
//                  rememberLastDir, lastDir, hostKey, notes, createdAt}; kind folder {name, parentId}; kind shortcut {name, command, enter, order}.
// Ayar öğesi yok; keyPath yerel. Bilinmeyen alanlar korunur (ileri uyumluluk).
import 'dart:ui';

class SshConnection {
  SshConnection(this.id, this.raw);
  final String id;
  final Map<String, dynamic> raw;

  String get name => (raw['name'] ?? '').toString();
  String get host => (raw['host'] ?? '').toString();
  int get port => (raw['port'] as num?)?.toInt() ?? 22;
  String get username => (raw['username'] ?? '').toString();
  String get authType => (raw['authType'] ?? 'password').toString();
  String get password => (raw['password'] ?? '').toString();
  String get passphrase => (raw['passphrase'] ?? '').toString();
  String get privateKey => (raw['privateKey'] ?? '').toString();
  String? get folderId => raw['folderId'] as String?;
  String get color => (raw['color'] ?? '#22d3ee').toString();
  String get theme => (raw['theme'] ?? 'sshmaster').toString();
  bool get rememberLastDir => raw['rememberLastDir'] == true;
  String get lastDir => (raw['lastDir'] ?? '').toString();
  String? get hostKey => raw['hostKey'] as String?;
  String get notes => (raw['notes'] ?? '').toString();
  int get createdAt => (raw['createdAt'] as num?)?.toInt() ?? 0;

  Color get colorValue => parseHex(color);

  static Map<String, dynamic> blank() => {
        'name': '', 'host': '', 'port': 22, 'username': '', 'authType': 'password', 'password': '', 'passphrase': '', 'privateKey': '',
        'folderId': null, 'color': '#3b82f6', 'theme': 'sshmaster', 'rememberLastDir': false, 'lastDir': '', 'hostKey': null, 'notes': '',
        'createdAt': DateTime.now().millisecondsSinceEpoch,
      };
}

class SshFolder {
  SshFolder(this.id, this.raw);
  final String id;
  final Map<String, dynamic> raw;
  String get name => (raw['name'] ?? '').toString();
  String? get parentId => raw['parentId'] as String?;
}

class SshShortcut {
  SshShortcut(this.id, this.raw);
  final String id;
  final Map<String, dynamic> raw;
  String get name => (raw['name'] ?? '').toString();
  String get command => (raw['command'] ?? '').toString();
  bool get enter => raw['enter'] != false;
  int get order => (raw['order'] as num?)?.toInt() ?? 0;
}

Color parseHex(String s) {
  var h = s.replaceAll('#', '').trim();
  if (h.length == 3) h = h.split('').map((c) => '$c$c').join();
  final v = int.tryParse(h, radix: 16) ?? 0x22D3EE;
  return Color(0xFF000000 | v);
}

String toHex(Color c) => '#${(c.toARGB32() & 0xFFFFFF).toRadixString(16).padLeft(6, '0')}';

/// Konsol paletleri — sshmasters/src/renderer/themes.js (ad, zemin, yazı, imleç)
const kSshThemes = <String, (String, int, int, int)>{
  'sshmaster': ('SSH Master', 0xFF0B0F17, 0xFFD6DEEB, 0xFF22D3EE),
  'campbell': ('Campbell (Windows)', 0xFF0C0C0C, 0xFFCCCCCC, 0xFFFFFFFF),
  'ubuntu': ('Ubuntu', 0xFF300A24, 0xFFEEEEEC, 0xFFEEEEEC),
  'dracula': ('Dracula', 0xFF282A36, 0xFFF8F8F2, 0xFFF8F8F2),
  'onedark': ('One Dark', 0xFF282C34, 0xFFABB2BF, 0xFF528BFF),
  'monokai': ('Monokai', 0xFF272822, 0xFFF8F8F2, 0xFFF8F8F0),
  'nord': ('Nord', 0xFF2E3440, 0xFFD8DEE9, 0xFFD8DEE9),
  'gruvbox': ('Gruvbox Dark', 0xFF282828, 0xFFEBDBB2, 0xFFEBDBB2),
  'tokyonight': ('Tokyo Night', 0xFF1A1B26, 0xFFC0CAF5, 0xFFC0CAF5),
  'solarized': ('Solarized Dark', 0xFF002B36, 0xFF839496, 0xFF93A1A1),
  'matrix': ('Matrix', 0xFF000000, 0xFF33FF66, 0xFF33FF66),
  'solarizedlight': ('Solarized Light', 0xFFFDF6E3, 0xFF657B83, 0xFF586E75),
  'github': ('GitHub Light', 0xFFFFFFFF, 0xFF24292F, 0xFF0969DA),
};

/// Kart renk seçenekleri (masaüstü renk etiketi)
const kCardColors = ['#3b82f6', '#22d3ee', '#6366f1', '#a855f7', '#ec4899', '#f97316', '#fbbf24', '#34d399', '#64748b'];
