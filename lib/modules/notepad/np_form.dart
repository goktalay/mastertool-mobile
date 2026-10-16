// Notepad Master bağlantı formu — masaüstü (renderer/app.js) ile aynı 3 sekme: Bağlantı (tür kartları SSH / FTP / Lokal / Dosya,
// ad, protokol + dosya adı kodlaması, sunucu, port, giriş yöntemi, kullanıcı, şifre / anahtar, proje klasörü + "Klasör seç",
// klasör, renk, notlar) · Proje (çalışma kopyası notu, açık sekmeleri hatırla, gizli dosyalar, ağaçta gösterme) ·
// Editör (Notepad++) (genel / bağlantıya özel + editör ayarları). "Bağlantıyı dene" gerçek bağlantı kurar; "Kaydet", "Kaydet ve aç".
// Lokal Klasör = cihazda uygulama belgeleri altında bir klasör; Proje Dosyası = dosya seçiciyle içe aktarılan yerel kopya.
import 'dart:convert';
import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';

import '../../core/l10n/gen/mt_strings.dart';
import '../../core/sync.dart' show newItemId;
import '../../core/theme.dart';
import '../../widgets/mt_widgets.dart';
import '../ftp/ftp_model.dart' show kFtpProtocols;
import '../ssh/ssh_model.dart' show kCardColors, parseHex;
import 'np_editor_form.dart';
import 'np_model.dart';
import 'np_remote.dart';

/// Cihazdaki yerel proje kökü: `belgeler/Notepad Master`
Future<Directory> npLocalRoot() async {
  final d = Directory('${(await getApplicationDocumentsDirectory()).path}/Notepad Master');
  await d.create(recursive: true);
  return d;
}

class NpFormScreen extends StatefulWidget {
  const NpFormScreen({super.key, this.existing, required this.folders, this.folderId, this.initialKind});
  final NpConnection? existing;
  final List<(String, String)> folders;
  final String? folderId;
  final String? initialKind;
  @override
  State<NpFormScreen> createState() => _NpFormScreenState();
}

class _NpFormScreenState extends State<NpFormScreen> with SingleTickerProviderStateMixin {
  late final Map<String, dynamic> d = widget.existing != null ? Map<String, dynamic>.from(widget.existing!.raw) : NpConnection.blank(kind: widget.initialKind ?? 'ssh');
  late final _tabs = TabController(length: 3, vsync: this);
  late String _kind = _s('kind', 'ssh');
  late final _name = TextEditingController(text: _s('name')), _host = TextEditingController(text: _s('host'));
  late final _port = TextEditingController(text: (d['port'] ?? 22).toString()), _user = TextEditingController(text: _s('username'));
  late final _pw = TextEditingController(text: _s('password')), _key = TextEditingController(text: _s('privateKey'));
  late final _pass = TextEditingController(text: _s('passphrase')), _comments = TextEditingController(text: _s('comments'));
  late final _rootDir = TextEditingController(text: _s('rootDir')), _exclude = TextEditingController(text: _s('exclude'));
  late final _localName = TextEditingController(text: _localRel());
  late String _protocol = _s('protocol', 'ftp') == 'null' ? 'ftp' : _s('protocol', 'ftp'), _login = _s('loginMethod', 'normal'), _auth = _s('authType', 'password');
  late String _nameEnc = _s('nameEncoding', 'auto'), _editorMode = _s('editorMode', 'global');
  late String? _folder = widget.folderId;
  late String _color = _s('color', '#22d3ee');
  late bool _showHidden = d['showHidden'] != false, _restoreTabs = d['restoreTabs'] != false;
  late Map<String, dynamic> _editor = npSanitizeEditor((d['editor'] as Map?)?.cast<String, dynamic>());
  late String _localPath = _s('localPath');
  bool _hide = true, _testing = false, _testOk = false;
  String? _testMsg, _fp;

  String _s(String k, [String def = '']) => (d[k] ?? def).toString();
  String _localRel() {
    final lp = _s('localPath');
    final i = lp.indexOf('/Notepad Master/');
    return i < 0 ? '' : lp.substring(i + 16);
  }

  bool get _isRemote => _kind == 'ssh' || _kind == 'ftp';
  bool get _sftp => _kind == 'ssh' || _protocol == 'sftp';

  Map<String, dynamic>? _collect(MtStrings s) {
    final host = _host.text.trim();
    if (_isRemote && host.isEmpty) { mtToast(context, s.npMainErrHost, type: 'err'); _tabs.animateTo(0); return null; }
    if (_isRemote && !(_kind == 'ftp' && _login == 'anonymous') && _user.text.trim().isEmpty) { mtToast(context, s.npMainErrUser, type: 'err'); _tabs.animateTo(0); return null; }
    if (_kind == 'file' && _localPath.isEmpty) { mtToast(context, s.npMainErrNoLocal, type: 'err'); _tabs.animateTo(0); return null; }
    final anon = _kind == 'ftp' && _login == 'anonymous';
    final name = _name.text.trim().isNotEmpty ? _name.text.trim() : _isRemote ? host : _kind == 'file' ? npBaseName(_localPath) : (_localName.text.trim().isEmpty ? 'Proje' : _localName.text.trim());
    return {
      ...d, 'name': name, 'kind': _kind, 'host': _isRemote ? host : '', 'port': _isRemote ? (int.tryParse(_port.text.trim()) ?? (_kind == 'ssh' ? 22 : kFtpProtocols[_protocol]!.$2)) : null,
      'protocol': _kind == 'ssh' ? 'sftp' : _kind == 'ftp' ? _protocol : null, 'username': anon ? 'anonymous' : _user.text.trim(),
      'loginMethod': _kind == 'ftp' ? _login : 'normal', 'authType': _sftp && _isRemote ? _auth : 'password',
      'password': anon ? '' : _pw.text, 'privateKey': _isRemote && _sftp && _auth == 'key' ? _key.text.trim() : '', 'passphrase': _isRemote && _sftp && _auth == 'key' ? _pass.text : '',
      'comments': _comments.text, 'folderId': _folder, 'color': _color, 'rootDir': _isRemote ? _rootDir.text.trim() : '',
      'nameEncoding': _nameEnc, 'showHidden': _showHidden, 'exclude': _exclude.text.trim(), 'restoreTabs': _restoreTabs,
      'editorMode': _editorMode, 'editor': _editor, 'hostKey': _fp ?? d['hostKey'], 'localPath': _localPath,
    };
  }

  void _onKind(String k) => setState(() {
        _kind = k;
        if (k == 'ssh' && (_port.text.trim().isEmpty || _port.text.trim() == kFtpProtocols[_protocol]!.$2.toString())) _port.text = '22';
        if (k == 'ftp' && (_port.text.trim().isEmpty || _port.text.trim() == '22')) _port.text = kFtpProtocols[_protocol]!.$2.toString();
        _testMsg = null;
      });

  void _onProtocol(String p) => setState(() {
        final old = kFtpProtocols[_protocol]!.$2;
        _protocol = p;
        if (_port.text.trim() == old.toString() || _port.text.trim().isEmpty) _port.text = kFtpProtocols[p]!.$2.toString();
      });

  Future<void> _pickKey() async {
    final r = await FilePicker.pickFiles();
    final f = r.firstOrNull;
    if (f == null) return;
    final bytes = await f.readAsBytes();
    if (mounted) setState(() => _key.text = utf8.decode(bytes, allowMalformed: true));
  }

  /// Proje Dosyası: seçilen dosya cihazdaki belgeler altına kopyalanır (yerel kopya; yol senkronlanmaz)
  Future<void> _pickFile() async {
    final r = await FilePicker.pickFiles();
    final f = r.firstOrNull;
    if (f == null) return;
    final dir = Directory('${(await npLocalRoot()).path}/files/${newItemId()}');
    await dir.create(recursive: true);
    final dst = File('${dir.path}/${f.name}');
    await dst.writeAsBytes(await f.readAsBytes(), flush: true);
    if (!mounted) return;
    setState(() {
      _localPath = dst.path;
      if (_name.text.trim().isEmpty) _name.text = f.name;
    });
  }

  Future<void> _test() async {
    final s = MtStrings.of(context);
    final data = _collect(s);
    if (data == null) return;
    setState(() { _testing = true; _testMsg = null; });
    NpFs? fs;
    try {
      final conn = NpConnection('test', data);
      if (conn.isLocal) {
        final lp = conn.kind == 'file' ? conn.localPath : await _localDirPath(create: false);
        final ok = lp.isNotEmpty && await FileSystemEntity.type(lp) != FileSystemEntityType.notFound;
        setState(() { _testOk = ok; _testMsg = ok ? '${s.npFormTestOk}\n${s.npFormHomeDir(lp)}' : '${s.npFormTestFail}: ${s.npMainErrNoLocal}'; });
        return;
      }
      fs = npCreateFs(conn);
      await fs.connect();
      final home = await fs.pwd();
      var msg = '${s.npFormTestOk}\n${s.npFormHomeDir(home)}';
      final root = data['rootDir'].toString();
      if (root.isNotEmpty) {
        try {
          await fs.list(root);
        } catch (_) {
          msg += '\n${s.npFormRootMissing}';
        }
      }
      final fp = fs.fingerprint;
      if (fp != null) { _fp = fp; msg += '\n${s.npFormHostKey(fp)}'; }
      setState(() { _testOk = true; _testMsg = msg; });
    } catch (e) {
      setState(() { _testOk = false; _testMsg = '${s.npFormTestFail}: ${npErrorText(s, e)}'; });
    } finally {
      await fs?.close();
      if (mounted) setState(() => _testing = false);
    }
  }

  Future<String> _localDirPath({bool create = true}) async {
    final root = await npLocalRoot();
    final rel = _localName.text.trim().isEmpty ? (_name.text.trim().isEmpty ? 'Proje' : _name.text.trim()) : _localName.text.trim();
    final dir = Directory('${root.path}/${rel.replaceAll(RegExp(r'[\\:*?"<>|]'), '_').replaceAll('..', '_')}');
    if (create) await dir.create(recursive: true);
    return dir.path;
  }

  Future<void> _browse() async {
    final s = MtStrings.of(context);
    final data = _collect(s);
    if (data == null) return;
    final picked = await showDialog<String>(context: context, builder: (_) => NpBrowseDialog(conn: NpConnection('browse', data), start: _rootDir.text.trim()));
    if (picked != null && mounted) setState(() => _rootDir.text = picked);
  }

  Future<void> _save({bool open = false}) async {
    final s = MtStrings.of(context);
    final data = _collect(s);
    if (data == null) return;
    if (_kind == 'local') data['localPath'] = await _localDirPath();
    if (!mounted) return;
    Navigator.of(context).pop((data, open));
  }

  @override
  Widget build(BuildContext context) {
    final s = MtStrings.of(context);
    final col = MtColors.of(context);
    final wide = MtBreak.wide(context);
    final kinds = [('ssh', s.npKindSsh, s.npKindSshHint, Icons.terminal), ('ftp', s.npKindFtp, s.npKindFtpHint, Icons.dns_outlined),
      ('local', s.npKindLocal, s.npKindLocalHint, Icons.folder_outlined), ('file', s.npKindFile, s.npKindFileHint, Icons.description_outlined)];
    final kindCards = [
      for (final k in kinds)
        InkWell(
          onTap: () => _onKind(k.$1), borderRadius: BorderRadius.circular(10),
          child: Container(
            padding: const EdgeInsets.fromLTRB(12, 10, 10, 10),
            decoration: BoxDecoration(color: _kind == k.$1 ? col.accent.withValues(alpha: .08) : col.bg2, borderRadius: BorderRadius.circular(10),
                border: Border.all(color: _kind == k.$1 ? col.accent : col.border, width: _kind == k.$1 ? 1.5 : 1)),
            child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              Icon(k.$4, size: 18, color: col.accent), const SizedBox(height: 10),
              Text(k.$2, style: MtText.cardTitle.copyWith(color: col.text, fontSize: 13.5)), const SizedBox(height: 3),
              Text(k.$3, style: MtText.tiny.copyWith(color: col.text3, height: 1.3)),
            ]),
          ),
        ),
    ];
    final anon = _kind == 'ftp' && _login == 'anonymous';

    final connTab = ListView(padding: const EdgeInsets.fromLTRB(22, 18, 22, 24), children: [
      wide
          ? IntrinsicHeight(child: Row(crossAxisAlignment: CrossAxisAlignment.stretch, children: [for (var i = 0; i < 4; i++) ...[if (i > 0) const SizedBox(width: 8), Expanded(child: kindCards[i])]]))
          : Column(children: [
              IntrinsicHeight(child: Row(crossAxisAlignment: CrossAxisAlignment.stretch, children: [Expanded(child: kindCards[0]), const SizedBox(width: 8), Expanded(child: kindCards[1])])),
              const SizedBox(height: 8),
              IntrinsicHeight(child: Row(crossAxisAlignment: CrossAxisAlignment.stretch, children: [Expanded(child: kindCards[2]), const SizedBox(width: 8), Expanded(child: kindCards[3])])),
            ]),
      const SizedBox(height: 16),
      MtField(label: s.npFormName, child: TextField(controller: _name, decoration: InputDecoration(hintText: s.npFormNamePh))),
      if (_kind == 'ftp') ...[
        const SizedBox(height: 14),
        _row(wide, [
          MtField(label: s.npTypeProtocol, child: _select<String>(_protocol, [for (final e in kFtpProtocols.entries) (e.key, _protoLabel(s, e.key))], (v) => _onProtocol(v!))),
          MtField(label: s.npOptEncoding, child: MtSegment<String>(value: _nameEnc, onChanged: (v) => setState(() => _nameEnc = v), items: [('auto', s.npOptEncAuto, null), ('utf8', 'UTF-8', null), ('ascii', 'ASCII', null)])),
        ]),
        const SizedBox(height: 10),
        MtBox(_protoNote(s), icon: Icons.lock_outline),
      ],
      if (_isRemote) ...[
        const SizedBox(height: 14),
        _row(wide, [
          MtField(label: s.npFormHost, child: TextField(controller: _host, keyboardType: TextInputType.url, autocorrect: false, textDirection: TextDirection.ltr, decoration: InputDecoration(hintText: s.npFormHostPh))),
          MtField(label: s.npFormPort, child: TextField(controller: _port, keyboardType: TextInputType.number, textDirection: TextDirection.ltr)),
        ], flex: const [3, 1]),
        if (_kind == 'ftp') ...[
          const SizedBox(height: 14),
          MtField(label: s.npFormLoginMethod, child: MtSegment<String>(value: _login, onChanged: (v) => setState(() => _login = v), items: [('normal', s.npFormLoginNormal, Icons.person_outline), ('anonymous', s.npFormLoginAnon, Icons.public)])),
        ],
        if (!anon) ...[
          const SizedBox(height: 14),
          _row(wide, [
            MtField(label: s.npFormUser, child: TextField(controller: _user, autocorrect: false, textDirection: TextDirection.ltr)),
            if (!_sftp || _auth == 'password')
              MtField(label: s.npFormPassword, child: TextField(controller: _pw, obscureText: _hide,
                  decoration: InputDecoration(suffixIcon: MtIconButton(icon: _hide ? Icons.visibility_outlined : Icons.visibility_off_outlined, onPressed: () => setState(() => _hide = !_hide)))))
            else
              const SizedBox(),
          ]),
          if (_sftp) ...[
            const SizedBox(height: 14),
            MtField(label: s.npFormAuth, child: MtSegment<String>(value: _auth, onChanged: (v) => setState(() => _auth = v), items: [('password', s.npFormPassword, Icons.password), ('key', s.npFormPrivateKey, Icons.key)])),
            if (_auth == 'key') ...[
              const SizedBox(height: 14),
              MtField(label: s.npFormKeyFile, child: Column(crossAxisAlignment: CrossAxisAlignment.stretch, children: [
                TextField(controller: _key, maxLines: 5, minLines: 3, style: MtText.mono, textDirection: TextDirection.ltr, decoration: const InputDecoration(hintText: '-----BEGIN OPENSSH PRIVATE KEY-----')),
                const SizedBox(height: 8),
                Align(alignment: AlignmentDirectional.centerStart, child: MtButton(label: s.npMainPickKey, small: true, icon: Icons.upload_file, onPressed: _pickKey)),
              ])),
              const SizedBox(height: 14),
              MtField(label: s.npFormPassphrase, hint: s.npFormPassEmpty, child: TextField(controller: _pass, obscureText: true)),
            ],
          ],
        ],
        const SizedBox(height: 14),
        MtField(label: s.npFormRootDir, hint: s.npFormBrowseHint, child: Row(children: [
          Expanded(child: TextField(controller: _rootDir, textDirection: TextDirection.ltr, autocorrect: false, decoration: InputDecoration(hintText: _kind == 'ssh' ? '/var/www/html' : '/public_html'))),
          const SizedBox(width: 8),
          MtButton(label: s.npFormBrowse, icon: Icons.folder_open_outlined, height: MtDim.inputH, onPressed: _testOk ? _browse : null),
        ])),
      ],
      if (_kind == 'local') ...[
        const SizedBox(height: 14),
        MtField(label: s.npFormFolderPath, hint: '${s.npFormLocalPathHint} (${_localPath.isEmpty ? 'Belgeler/Notepad Master/…' : _localPath})',
            child: TextField(controller: _localName, textDirection: TextDirection.ltr, decoration: InputDecoration(hintText: s.npFormNamePh))),
      ],
      if (_kind == 'file') ...[
        const SizedBox(height: 14),
        MtField(label: s.npFormFilePath, hint: s.npFormLocalPathHint, child: Row(children: [
          Expanded(child: Container(
            height: MtDim.inputH, padding: const EdgeInsets.symmetric(horizontal: 12), alignment: AlignmentDirectional.centerStart,
            decoration: BoxDecoration(color: col.bg2, border: Border.all(color: col.border), borderRadius: BorderRadius.circular(MtDim.radiusSm)),
            child: Text(_localPath.isEmpty ? '—' : npBaseName(_localPath), maxLines: 1, overflow: TextOverflow.ellipsis, textDirection: TextDirection.ltr, style: MtText.body.copyWith(color: _localPath.isEmpty ? col.text3 : col.text)),
          )),
          const SizedBox(width: 8),
          MtButton(label: s.npFormFilePath, icon: Icons.upload_file, height: MtDim.inputH, onPressed: _pickFile),
        ])),
      ],
      const SizedBox(height: 14),
      _row(wide, [
        MtField(label: s.npFormFolder, child: _select<String?>(_folder, [(null, s.npAppRootFolder), for (final f in widget.folders) (f.$1, f.$2)], (v) => setState(() => _folder = v))),
        MtField(label: s.npFormColor, child: Wrap(spacing: 8, runSpacing: 8, children: [
          for (final h in kCardColors) InkWell(onTap: () => setState(() => _color = h), borderRadius: BorderRadius.circular(999), child: Container(width: 26, height: 26,
              decoration: BoxDecoration(color: parseHex(h), shape: BoxShape.circle, border: Border.all(color: _color == h ? col.text : Colors.transparent, width: 2)))),
        ])),
      ]),
      const SizedBox(height: 14),
      MtField(label: s.npFormComments, child: TextField(controller: _comments, maxLines: 3, minLines: 2)),
      if (_testMsg != null) ...[const SizedBox(height: 14), MtBox(_testMsg!, kind: _testOk ? MtBoxKind.info : MtBoxKind.error, icon: _testOk ? Icons.check_circle_outline : Icons.error_outline)],
    ]);

    final projTab = ListView(padding: const EdgeInsets.fromLTRB(22, 18, 22, 24), children: [
      MtBox(s.npFormCacheNote, icon: Icons.info_outline),
      const SizedBox(height: 14),
      MtCheck(value: _restoreTabs, onChanged: (v) => setState(() => _restoreTabs = v), label: s.npFormRestoreTabs, hint: s.npFormRestoreTabsHint),
      const SizedBox(height: 6),
      MtCheck(value: _showHidden, onChanged: (v) => setState(() => _showHidden = v), label: s.npFormShowHidden, hint: s.npFormShowHiddenHint),
      const SizedBox(height: 14),
      MtField(label: s.npFormExclude, hint: s.npFormExcludeHint, child: TextField(controller: _exclude, textDirection: TextDirection.ltr, autocorrect: false, decoration: const InputDecoration(hintText: 'node_modules, .git, *.log'))),
    ]);

    final edTab = ListView(padding: const EdgeInsets.fromLTRB(22, 18, 22, 24), children: [
      MtField(label: s.npFormEditorMode, child: _select<String>(_editorMode, [('global', s.npFormEdGlobal), ('custom', s.npFormEdCustom)], (v) => setState(() => _editorMode = v!))),
      NpEditorForm(values: _editor, enabled: _editorMode == 'custom', onChanged: (v) => _editor = v),
    ]);

    return Scaffold(
      backgroundColor: col.surface,
      appBar: AppBar(
        backgroundColor: col.surface,
        title: Row(children: [Icon(Icons.link, size: 18, color: col.accent), const SizedBox(width: 8),
            Expanded(child: Text(widget.existing == null ? s.npFormTitleNew : s.npFormTitleEdit(widget.existing!.name), maxLines: 1, overflow: TextOverflow.ellipsis, style: MtText.h2.copyWith(color: col.text)))]),
        bottom: TabBar(controller: _tabs, isScrollable: !wide, tabAlignment: wide ? TabAlignment.fill : TabAlignment.start, labelColor: col.text, unselectedLabelColor: col.text2,
            indicatorColor: col.accent, labelStyle: MtText.body.copyWith(fontWeight: FontWeight.w600),
            tabs: [Tab(text: s.npFormTabConn), Tab(text: s.npFormTabProject), Tab(text: s.npFormTabEditor)]),
      ),
      body: SafeArea(child: Column(children: [
        Expanded(child: Center(child: ConstrainedBox(constraints: const BoxConstraints(maxWidth: 760), child: TabBarView(controller: _tabs, children: [connTab, projTab, edTab])))),
        Container(
          padding: const EdgeInsets.fromLTRB(22, 14, 22, 18),
          decoration: BoxDecoration(border: Border(top: BorderSide(color: col.border))),
          child: wide
              ? Row(children: [
                  MtButton(label: s.npFormTest, icon: Icons.bolt, busy: _testing, onPressed: _test),
                  const Spacer(),
                  MtButton(label: s.commonCancel, onPressed: () => Navigator.of(context).pop()),
                  const SizedBox(width: 8),
                  MtButton(label: s.npFormSaveOpen, onPressed: () => _save(open: true)),
                  const SizedBox(width: 8),
                  MtButton(label: s.commonSave, kind: MtBtnKind.primary, onPressed: () => _save()),
                ])
              : Column(crossAxisAlignment: CrossAxisAlignment.stretch, children: [
                  MtButton(label: s.commonSave, kind: MtBtnKind.primary, expand: true, onPressed: () => _save()),
                  const SizedBox(height: 8),
                  Row(children: [
                    Expanded(child: MtButton(label: s.npFormTest, icon: Icons.bolt, busy: _testing, expand: true, onPressed: _test)),
                    const SizedBox(width: 8),
                    Expanded(child: MtButton(label: s.npFormSaveOpen, expand: true, onPressed: () => _save(open: true))),
                  ]),
                ]),
        ),
      ])),
    );
  }

  String _protoLabel(MtStrings s, String k) => switch (k) {
        'ftp' => s.npTypeFtp, 'ftps-implicit' => s.npTypeFtpsImplicit, 'ftps-ssl' => s.npTypeFtpsSsl, 'ftps-tls' => s.npTypeFtpsTls, _ => s.npTypeSftp };
  String _protoNote(MtStrings s) => switch (_protocol) {
        'ftp' => s.npTypeNoteFtp, 'ftps-implicit' => s.npTypeNoteFtpsImplicit, 'ftps-ssl' => s.npTypeNoteFtpsSsl, 'ftps-tls' => s.npTypeNoteFtpsTls, _ => s.npTypeNoteSftp };

  Widget _row(bool wide, List<Widget> children, {List<int>? flex}) => wide
      ? Row(crossAxisAlignment: CrossAxisAlignment.start, children: [
          for (var i = 0; i < children.length; i++) ...[if (i > 0) const SizedBox(width: 14), Expanded(flex: flex?[i] ?? 1, child: children[i])],
        ])
      : Column(crossAxisAlignment: CrossAxisAlignment.stretch, children: [for (var i = 0; i < children.length; i++) ...[if (i > 0 && children[i] is! SizedBox) const SizedBox(height: 14), children[i]]]);

  Widget _select<T>(T value, List<(T, String)> items, ValueChanged<T?> onChanged) {
    final col = MtColors.of(context);
    return Container(
      height: MtDim.inputH, padding: const EdgeInsets.symmetric(horizontal: 12),
      decoration: BoxDecoration(color: col.bg2, border: Border.all(color: col.border), borderRadius: BorderRadius.circular(MtDim.radiusSm)),
      child: DropdownButtonHideUnderline(child: DropdownButton<T>(value: value, isExpanded: true, style: MtText.body.copyWith(color: col.text), dropdownColor: col.surface2,
          items: [for (final it in items) DropdownMenuItem(value: it.$1, child: Text(it.$2, maxLines: 1, overflow: TextOverflow.ellipsis))], onChanged: onChanged)),
    );
  }
}

/// "Sunucuda klasör seçin" — bağlantı testi başarılı olunca sunucuda gezinerek proje klasörü seçme (ekran 04).
class NpBrowseDialog extends StatefulWidget {
  const NpBrowseDialog({super.key, required this.conn, this.start = ''});
  final NpConnection conn;
  final String start;
  @override
  State<NpBrowseDialog> createState() => _NpBrowseDialogState();
}

class _NpBrowseDialogState extends State<NpBrowseDialog> {
  NpFs? _fs;
  String _home = '/', _cwd = '/';
  List<NpEntry> _dirs = const [];
  bool _loading = true;
  String? _error;

  @override
  void initState() {
    super.initState();
    _connect();
  }

  @override
  void dispose() {
    _fs?.close();
    super.dispose();
  }

  Future<void> _connect() async {
    final s = MtStrings.of(context);
    try {
      final fs = npCreateFs(widget.conn);
      await fs.connect();
      _fs = fs;
      _home = await fs.pwd();
      await _go(widget.start.isNotEmpty ? widget.start : _home, fallback: _home);
    } catch (e) {
      if (mounted) setState(() { _loading = false; _error = npErrorText(s, e); });
    }
  }

  Future<void> _go(String path, {String? fallback}) async {
    final s = MtStrings.of(context);
    setState(() => _loading = true);
    try {
      final list = await _fs!.list(path);
      final dirs = list.where((e) => e.isDir).toList()..sort((a, b) => a.name.toLowerCase().compareTo(b.name.toLowerCase()));
      if (!mounted) return;
      setState(() { _cwd = path; _dirs = dirs; _loading = false; _error = null; });
    } catch (e) {
      if (fallback != null && fallback != path) return _go(fallback);
      if (mounted) setState(() { _loading = false; _error = npErrorText(s, e); });
    }
  }

  @override
  Widget build(BuildContext context) {
    final s = MtStrings.of(context);
    final c = MtColors.of(context);
    return AlertDialog(
      title: Row(children: [Icon(Icons.folder_open_outlined, size: 18, color: c.accent), const SizedBox(width: 8), Text(s.npFormBrowseTitle)]),
      contentPadding: const EdgeInsets.fromLTRB(22, 10, 22, 0),
      content: SizedBox(width: 520, height: 380, child: Column(children: [
        Row(children: [
          MtIconButton(icon: Icons.arrow_upward, tooltip: s.npTreeUp, onPressed: _fs == null || _cwd == '/' ? null : () => _go(npDirName(_cwd).isEmpty ? '/' : npDirName(_cwd))),
          MtIconButton(icon: Icons.home_outlined, tooltip: s.npTreeHome, onPressed: _fs == null ? null : () => _go(_home)),
          const SizedBox(width: 4),
          Expanded(child: Container(
            height: 30, padding: const EdgeInsets.symmetric(horizontal: 10), alignment: AlignmentDirectional.centerStart,
            decoration: BoxDecoration(color: c.bg2, borderRadius: BorderRadius.circular(MtDim.radiusSm), border: Border.all(color: c.border)),
            child: Text(_cwd, maxLines: 1, overflow: TextOverflow.ellipsis, textDirection: TextDirection.ltr, style: MtText.mono.copyWith(color: c.text)),
          )),
        ]),
        const SizedBox(height: 8),
        Expanded(child: Container(
          decoration: BoxDecoration(color: c.bg2, borderRadius: BorderRadius.circular(MtDim.radiusSm), border: Border.all(color: c.border)),
          child: _error != null
              ? Padding(padding: const EdgeInsets.all(12), child: MtBox(_error!, kind: MtBoxKind.error, icon: Icons.error_outline))
              : _loading
                  ? const Center(child: MtSpinner(size: 20))
                  : _dirs.isEmpty
                      ? Center(child: Text(s.npFormBrowseEmpty, style: MtText.small.copyWith(color: c.text3)))
                      : ListView.builder(itemCount: _dirs.length, itemBuilder: (_, i) => ListTile(
                          dense: true, visualDensity: VisualDensity.compact,
                          leading: const Icon(Icons.folder_outlined, size: 18, color: Color(0xFFFBBF24)),
                          title: Text(_dirs[i].name, textDirection: TextDirection.ltr, style: MtText.body.copyWith(color: c.text)),
                          onTap: () => _go(_dirs[i].path))),
        )),
      ])),
      actionsPadding: const EdgeInsets.fromLTRB(22, 10, 22, 18),
      actions: [
        MtButton(label: s.commonCancel, onPressed: () => Navigator.pop(context)),
        MtButton(label: s.npFormBrowseSelect, kind: MtBtnKind.primary, onPressed: _fs == null ? null : () => Navigator.pop(context, _cwd)),
      ],
    );
  }
}
