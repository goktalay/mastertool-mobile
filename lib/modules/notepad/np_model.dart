// Notepad Master veri modeli — senkron `data` şeması masaüstüyle birebir (notepadmaster/src/account.js CONN_FIELDS, defaults.js):
// kind connection {createdAt, name, kind ssh|ftp|local|file, host, port, username, protocol, loginMethod normal|anonymous,
//                  authType password|key, comments, folderId, color, rootDir, nameEncoding auto|utf8|ascii, showHidden, exclude,
//                  restoreTabs, editorMode global|custom, editor {EDITOR_DEFAULTS}, hostKey, password, passphrase, privateKey}
// kind folder {name, parentId}; kind settings (id "settings") {appTheme, language, editor}.
// Yerel (senkron dışı): keyPath, localPath, openTabs, activeTab. Bilinmeyen alanlar korunur.
import 'dart:ui';

import '../ftp/ftp_model.dart' show FtpSite, kFtpProtocols;
import '../ssh/ssh_model.dart' show parseHex;

const kNpLocalOnly = {'keyPath', 'localPath', 'openTabs', 'activeTab'};
const kNpMaxFileBytes = 50 * 1024 * 1024;

/// Editör ayarlarının varsayılanları (defaults.js EDITOR_DEFAULTS'un TAMAMI; mobilde anlamsız olanlar da veri olarak korunur).
const kNpEditorDefaults = <String, dynamic>{
  'encoding': 'auto', 'fallbackEncoding': 'windows-1254', 'newEncoding': 'utf8', 'eol': 'auto', 'newEol': 'lf',
  'tabSize': 4, 'insertSpaces': true, 'detectIndentation': true, 'autoIndent': true, 'wordWrap': false,
  'fontFamily': "'Cascadia Code', 'Cascadia Mono', Consolas, 'Courier New', monospace", 'fontSize': 14, 'lineHeight': 0,
  'theme': 'auto', 'language': 'auto', 'renderWhitespace': 'none', 'renderControlChars': false, 'lineNumbers': true,
  'minimap': true, 'highlightLine': true, 'indentGuides': true, 'folding': true, 'bracketColors': true, 'autoClose': true,
  'smartHighlight': true, 'rulers': '', 'trimTrailing': false, 'finalNewline': false, 'checkRemoteChange': true, 'autoSave': 0,
};

/// Kodlamalar (defaults.js ENCODINGS): anahtar → etiket
const kNpEncodings = <(String, String)>[
  ('utf8', 'UTF-8'), ('utf8bom', 'UTF-8 BOM'), ('utf16le', 'UTF-16 LE BOM'), ('utf16be', 'UTF-16 BE BOM'),
  ('windows-1254', 'ANSI — Windows-1254 (Türkçe)'), ('iso-8859-9', 'ISO-8859-9 (Türkçe)'), ('windows-1252', 'ANSI — Windows-1252 (Batı)'),
  ('iso-8859-1', 'ISO-8859-1 (Latin-1)'), ('windows-1251', 'Windows-1251 (Kiril)'), ('windows-1256', 'Windows-1256 (Arapça)'),
];

const kNpThemes = <(String, String)>[
  ('mastertool-dark', 'Mastertool Gece'), ('mastertool-light', 'Mastertool Gündüz'), ('obsidian', 'Obsidian'), ('monokai', 'Monokai'),
  ('vs-dark', 'Visual Studio Dark'), ('vs', 'Visual Studio Light'), ('solarized-light', 'Solarized Light'), ('hc-black', 'High Contrast'),
];

/// Monaco dil kimlikleri (Notepad++ "Dil" menüsü)
const kNpLanguages = <(String, String)>[
  ('plaintext', 'Normal Text'), ('bat', 'Batch'), ('c', 'C'), ('cpp', 'C++'), ('csharp', 'C#'), ('css', 'CSS'),
  ('dart', 'Dart'), ('dockerfile', 'Dockerfile'), ('go', 'Go'), ('graphql', 'GraphQL'), ('handlebars', 'Handlebars'),
  ('html', 'HTML'), ('ini', 'INI / Config'), ('java', 'Java'), ('javascript', 'JavaScript'), ('json', 'JSON'),
  ('kotlin', 'Kotlin'), ('less', 'LESS'), ('lua', 'Lua'), ('markdown', 'Markdown'), ('mysql', 'MySQL'),
  ('objective-c', 'Objective-C'), ('pascal', 'Pascal'), ('perl', 'Perl'), ('pgsql', 'PostgreSQL'), ('php', 'PHP'),
  ('powershell', 'PowerShell'), ('python', 'Python'), ('r', 'R'), ('razor', 'Razor'), ('ruby', 'Ruby'), ('rust', 'Rust'),
  ('scss', 'SCSS'), ('shell', 'Shell (bash/sh)'), ('sql', 'SQL'), ('swift', 'Swift'), ('twig', 'Twig'),
  ('typescript', 'TypeScript'), ('vb', 'Visual Basic'), ('xml', 'XML'), ('yaml', 'YAML'),
];

const kNpEols = <(String, String)>[('crlf', 'Windows (CR LF)'), ('lf', 'Unix (LF)'), ('cr', 'Macintosh (CR)')];

String npEncodingLabel(String enc, {bool bom = false}) {
  if (enc == 'utf8' && bom) enc = 'utf8bom';
  for (final e in kNpEncodings) {
    if (e.$1 == enc) return e.$2;
  }
  return enc;
}

String npLanguageLabel(String id) {
  for (final l in kNpLanguages) {
    if (l.$1 == id) return l.$2;
  }
  return id;
}

String _oneOf(dynamic v, List<String> list, String def) => v is String && list.contains(v) ? v : def;
int _num(dynamic v, int def, int min, int max) {
  final n = v is num ? v.round() : int.tryParse(v?.toString() ?? '');
  return n == null ? def : n.clamp(min, max);
}

bool _bool(dynamic v, bool def) => v is bool ? v : def;

/// defaults.js sanitizeEditor: gelen (formdan ya da senkrondan) ayar nesnesini güvenli hale getirir; eksikler varsayılanla dolar.
Map<String, dynamic> npSanitizeEditor(Map<String, dynamic>? e, [Map<String, dynamic>? base]) {
  final d = {...kNpEditorDefaults, ...?base};
  e ??= const {};
  final encs = [for (final x in kNpEncodings) x.$1];
  final lang = e['language'];
  return {
    'encoding': _oneOf(e['encoding'], ['auto', ...encs], d['encoding']),
    'fallbackEncoding': _oneOf(e['fallbackEncoding'], encs.where((x) => !x.startsWith('utf')).toList(), d['fallbackEncoding']),
    'newEncoding': _oneOf(e['newEncoding'], encs, d['newEncoding']),
    'eol': _oneOf(e['eol'], ['auto', 'crlf', 'lf', 'cr'], d['eol']),
    'newEol': _oneOf(e['newEol'], ['crlf', 'lf', 'cr'], d['newEol']),
    'tabSize': _num(e['tabSize'], d['tabSize'], 1, 16),
    'insertSpaces': _bool(e['insertSpaces'], d['insertSpaces']),
    'detectIndentation': _bool(e['detectIndentation'], d['detectIndentation']),
    'autoIndent': _bool(e['autoIndent'], d['autoIndent']),
    'wordWrap': _bool(e['wordWrap'], d['wordWrap']),
    'fontFamily': e['fontFamily'] is String && (e['fontFamily'] as String).trim().isNotEmpty ? (e['fontFamily'] as String).substring(0, (e['fontFamily'] as String).length.clamp(0, 200)) : d['fontFamily'],
    'fontSize': _num(e['fontSize'], d['fontSize'], 6, 48),
    'lineHeight': _num(e['lineHeight'], d['lineHeight'], 0, 80),
    'theme': _oneOf(e['theme'], ['auto', for (final t in kNpThemes) t.$1], d['theme']),
    'language': lang is String && RegExp(r'^[\w.+-]{1,40}$').hasMatch(lang) ? lang : d['language'],
    'renderWhitespace': _oneOf(e['renderWhitespace'], ['none', 'boundary', 'trailing', 'all'], d['renderWhitespace']),
    'renderControlChars': _bool(e['renderControlChars'], d['renderControlChars']),
    'lineNumbers': _bool(e['lineNumbers'], d['lineNumbers']),
    'minimap': _bool(e['minimap'], d['minimap']),
    'highlightLine': _bool(e['highlightLine'], d['highlightLine']),
    'indentGuides': _bool(e['indentGuides'], d['indentGuides']),
    'folding': _bool(e['folding'], d['folding']),
    'bracketColors': _bool(e['bracketColors'], d['bracketColors']),
    'autoClose': _bool(e['autoClose'], d['autoClose']),
    'smartHighlight': _bool(e['smartHighlight'], d['smartHighlight']),
    'rulers': e['rulers'] is String ? (e['rulers'] as String).replaceAll(RegExp(r'[^\d,\s]'), '').substring(0, (e['rulers'] as String).replaceAll(RegExp(r'[^\d,\s]'), '').length.clamp(0, 40)) : d['rulers'],
    'trimTrailing': _bool(e['trimTrailing'], d['trimTrailing']),
    'finalNewline': _bool(e['finalNewline'], d['finalNewline']),
    'checkRemoteChange': _bool(e['checkRemoteChange'], d['checkRemoteChange']),
    'autoSave': _num(e['autoSave'], d['autoSave'], 0, 3600),
  };
}

/// Bağlantının geçerli editör ayarları: "Genel ayarları kullan" ise uygulama (settings öğesi) ayarları.
Map<String, dynamic> npEffectiveEditor(NpConnection? conn, Map<String, dynamic>? settings) {
  final g = npSanitizeEditor((settings?['editor'] as Map?)?.cast<String, dynamic>());
  if (conn == null || conn.editorMode != 'custom') return g;
  return npSanitizeEditor(conn.editor, g);
}

class NpConnection {
  NpConnection(this.id, this.raw);
  final String id;
  final Map<String, dynamic> raw;

  String get name => (raw['name'] ?? '').toString();
  String get kind => (raw['kind'] ?? 'ssh').toString();
  String get host => (raw['host'] ?? '').toString();
  String get protocol => kind == 'ssh' ? 'sftp' : (raw['protocol'] ?? 'ftp').toString();
  int get port => (raw['port'] as num?)?.toInt() ?? (kFtpProtocols[protocol]?.$2 ?? 22);
  String get username => (raw['username'] ?? '').toString();
  String get loginMethod => (raw['loginMethod'] ?? 'normal').toString();
  bool get anonymous => kind == 'ftp' && loginMethod == 'anonymous';
  String get authType => (raw['authType'] ?? 'password').toString();
  String get password => (raw['password'] ?? '').toString();
  String get passphrase => (raw['passphrase'] ?? '').toString();
  String get privateKey => (raw['privateKey'] ?? '').toString();
  String get comments => (raw['comments'] ?? '').toString();
  String? get folderId => raw['folderId'] as String?;
  String get color => (raw['color'] ?? '#22d3ee').toString();
  Color get colorValue => parseHex(color);
  String get rootDir => (raw['rootDir'] ?? '').toString();
  String get nameEncoding => (raw['nameEncoding'] ?? 'auto').toString();
  bool get showHidden => raw['showHidden'] != false;
  String get exclude => (raw['exclude'] ?? '').toString();
  bool get restoreTabs => raw['restoreTabs'] != false;
  String get editorMode => (raw['editorMode'] ?? 'global').toString();
  Map<String, dynamic> get editor => (raw['editor'] as Map?)?.cast<String, dynamic>() ?? const {};
  String? get hostKey => raw['hostKey'] as String?;
  String get localPath => (raw['localPath'] ?? '').toString();
  List<String> get openTabs => ((raw['openTabs'] as List?) ?? const []).map((x) => x.toString()).toList();
  String? get activeTab => raw['activeTab'] as String?;
  int get createdAt => (raw['createdAt'] as num?)?.toInt() ?? 0;

  bool get isLocal => kind == 'local' || kind == 'file';
  bool get isRemote => !isLocal;
  bool get isSftp => kind == 'ssh' || (kind == 'ftp' && protocol == 'sftp');
  bool get usesKey => isSftp && authType == 'key';

  /// Dosya listeleme / aktarım için FTP Masters istemcisine uygun site kaydı (SSH projesi → SFTP).
  FtpSite toFtpSite() => FtpSite(id, {
        'name': name, 'host': host, 'port': port, 'protocol': protocol, 'username': anonymous ? 'anonymous' : username,
        'loginMethod': anonymous ? 'anonymous' : 'normal', 'authType': isSftp ? authType : 'password', 'password': password,
        'passphrase': passphrase, 'privateKey': privateKey, 'hostKey': hostKey, 'encoding': nameEncoding == 'ascii' ? 'ascii' : nameEncoding == 'utf8' ? 'utf8' : 'auto',
      });

  /// Dosya adı süzgeci (project.js makeFilter): gizli dosyalar ve hariç tutma kalıpları (node_modules, .git, *.log …)
  bool Function(String name) get filter {
    final pats = exclude.split(RegExp(r'[,;\n]+')).map((s) => s.trim()).where((s) => s.isNotEmpty).map((p) =>
        RegExp('^${p.replaceAllMapped(RegExp(r'[.+^${}()|[\]\\]'), (m) => '\\${m[0]}').replaceAll('*', '.*').replaceAll('?', '.')}\$', caseSensitive: false)).toList();
    final hidden = showHidden;
    return (name) {
      if (!hidden && name.startsWith('.')) return false;
      return !pats.any((re) => re.hasMatch(name));
    };
  }

  static Map<String, dynamic> blank({String kind = 'ssh'}) => {
        'createdAt': DateTime.now().millisecondsSinceEpoch, 'name': '', 'kind': kind, 'host': '', 'port': kind == 'ssh' ? 22 : 21,
        'protocol': kind == 'ssh' ? 'sftp' : kind == 'ftp' ? 'ftp' : null, 'username': '', 'loginMethod': 'normal', 'authType': 'password',
        'comments': '', 'folderId': null, 'color': '#22d3ee', 'rootDir': '', 'nameEncoding': 'auto', 'showHidden': true, 'exclude': '',
        'restoreTabs': true, 'editorMode': 'global', 'editor': Map<String, dynamic>.from(kNpEditorDefaults), 'hostKey': null,
        'password': '', 'passphrase': '', 'privateKey': '',
      };
}

/// Uzantıya göre dosya simgesi rengi (tree.js EXT_COLORS)
const kNpExtColors = <String, int>{
  'js': 0xFFFACC15, 'mjs': 0xFFFACC15, 'cjs': 0xFFFACC15, 'jsx': 0xFF38BDF8, 'ts': 0xFF3B82F6, 'tsx': 0xFF38BDF8, 'json': 0xFFFBBF24,
  'php': 0xFFA78BFA, 'py': 0xFF60A5FA, 'rb': 0xFFF87171, 'go': 0xFF22D3EE, 'rs': 0xFFFB923C, 'java': 0xFFF97316, 'kt': 0xFFA855F7, 'cs': 0xFF8B5CF6,
  'c': 0xFF60A5FA, 'h': 0xFF60A5FA, 'cpp': 0xFF3B82F6, 'hpp': 0xFF3B82F6, 'html': 0xFFFB923C, 'htm': 0xFFFB923C, 'css': 0xFF38BDF8, 'scss': 0xFFEC4899,
  'less': 0xFF6366F1, 'md': 0xFF94A3B8, 'sql': 0xFFF472B6, 'sh': 0xFF34D399, 'bash': 0xFF34D399, 'ps1': 0xFF60A5FA, 'bat': 0xFF34D399,
  'yml': 0xFFF87171, 'yaml': 0xFFF87171, 'xml': 0xFFFB923C, 'ini': 0xFF94A3B8, 'conf': 0xFF94A3B8, 'env': 0xFFFBBF24, 'vue': 0xFF34D399, 'twig': 0xFFA3E635,
  'txt': 0xFF94A3B8, 'log': 0xFF64748B, 'svg': 0xFFFBBF24, 'lua': 0xFF3B82F6, 'pl': 0xFF60A5FA, 'swift': 0xFFFB923C, 'dart': 0xFF22D3EE,
};

Color? npExtColor(String name) {
  final i = name.lastIndexOf('.');
  if (i < 0) return null;
  final v = kNpExtColors[name.substring(i + 1).toLowerCase()];
  return v == null ? null : Color(v);
}

String npBaseName(String p) {
  final s = p.endsWith('/') ? p.substring(0, p.length - 1) : p;
  final i = s.lastIndexOf('/');
  return i < 0 ? s : s.substring(i + 1);
}

String npDirName(String p) {
  final s = p.endsWith('/') && p.length > 1 ? p.substring(0, p.length - 1) : p;
  final i = s.lastIndexOf('/');
  if (i < 0) return '';
  return i == 0 ? '/' : s.substring(0, i);
}

/// Cihazdaki yerel yolu belgeler köküne göre kısaltır: `Belgeler/Notepad Master/ad/…` ([docsRoot] = uygulama belgeleri dizini;
/// bilinmiyorsa "/Notepad Master/" parçasından kırpılır). Belgeler altında değilse olduğu gibi döner.
String npShortLocalPath(String p, [String? docsRoot]) {
  if (p.isEmpty) return p;
  if (docsRoot != null && docsRoot.isNotEmpty) {
    final r = docsRoot.endsWith('/') ? docsRoot.substring(0, docsRoot.length - 1) : docsRoot;
    if (p == r) return 'Belgeler';
    if (p.startsWith('$r/')) return 'Belgeler/${p.substring(r.length + 1)}';
  }
  final i = p.indexOf('/Notepad Master/');
  return i < 0 ? p : 'Belgeler${p.substring(i)}';
}

String npJoin(String dir, String name) => dir.endsWith('/') ? '$dir$name' : '$dir/$name';

String npFmtSize(int n) => n < 1024 ? '$n B' : n < 1048576 ? '${(n / 1024).toStringAsFixed(1)} KB' : n < 1073741824 ? '${(n / 1048576).toStringAsFixed(1)} MB' : '${(n / 1073741824).toStringAsFixed(2)} GB';
