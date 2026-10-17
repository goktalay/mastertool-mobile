// Proje ekranı (masaüstü renderer/project.js + project.css): üst çubuk 46 px (ağaç düğmesi, durum noktası, ad + mono alt satır,
// tür etiketi, yeniden bağlan, ayarlar) · araç çubuğu 36 px (yeni dosya, kaydet, tümünü kaydet | geri al, yinele | bul, değiştir,
// satıra git | satır kaydır, ağaç | yakınlaştır, uzaklaştır | kodlama) · gövde: sol klasör ağacı 300 px (panel başlığı 34 px:
// KÖK ADI, yeni dosya / klasör / yenile / daralt) + sekmeli editör (sekme çubuğu 36 px) · durum çubuğu 28 px (yol · Sat/Süt ·
// Boşluk/Sekme · kodlama · satır sonu · dil). Telefonda ağaç ve editör ayrı sayfa gibi (geri tuşu ağaca döner).
// Kaydet = sunucuya yükle (çakışma koruması: boyut + mtime ±1,5 sn); Farklı kaydet; yeni dosya / klasör; yeniden adlandır; sil;
// açık sekmeler yerel olarak hatırlanır (openTabs / activeTab); otomatik kaydetme; kodlama / satır sonu / dil değiştirme.
import 'dart:async';

import 'package:flutter/material.dart';
import 'package:re_editor/re_editor.dart';

import '../../core/l10n/gen/mt_strings.dart';
import '../../core/sync.dart';
import '../../core/theme.dart';
import '../../widgets/mt_widgets.dart';
import '../ftp/ftp_model.dart' show kFtpProtocols;
import 'np_editor.dart';
import 'np_lang.dart';
import 'np_form.dart' show npDocumentsRoot;
import 'np_model.dart';
import 'np_remote.dart';
import 'np_session.dart';
import 'np_textcodec.dart';
import 'np_tree.dart';

class NpTab {
  NpTab({required this.path, required this.controller, required this.encoding, required this.bom, required this.eol, required this.lang, required this.langForced,
      required this.mtime, required this.size, required this.cachePath, this.metaDirty = false});
  String path;
  final CodeLineEditingController controller;
  late final CodeFindController find = CodeFindController(controller);
  final CodeScrollController scroll = CodeScrollController();
  final FocusNode focus = FocusNode();
  String encoding, lang, cachePath;
  bool bom, langForced, metaDirty, saving = false, textDirty = false;
  String eol;
  int mtime, size;
  String savedText = '';
  Timer? autoTimer;
  bool? wrapOverride;
  String get name => npBaseName(path);
  bool get dirty => metaDirty || textDirty;

  void dispose() {
    autoTimer?.cancel();
    find.dispose();
    controller.dispose();
    focus.dispose();
  }
}

class NpProjectScreen extends StatefulWidget {
  const NpProjectScreen({super.key, required this.conn, required this.engine, required this.onHostKey, this.cacheDir, this.onOpenSettings});
  final NpConnection conn;
  final SyncEngine engine;
  final ValueChanged<String> onHostKey;
  final String? cacheDir;
  final VoidCallback? onOpenSettings;
  @override
  State<NpProjectScreen> createState() => _NpProjectScreenState();
}

class _NpProjectScreenState extends State<NpProjectScreen> {
  NpProject? _proj;
  late final NpTreeController _tree = NpTreeController(list: (d) => _proj!.list(d), filter: widget.conn.filter);
  NpStatus _status = NpStatus.connecting;
  String? _error;
  String _root = '';
  String? _docs; // belgeler kökü: yerel yollar "Belgeler/Notepad Master/…" olarak kısaltılır
  String _short(String p) => _isRemote ? p : npShortLocalPath(p, docsRoot: _docs, label: MtStrings.of(context).npMobDocumentsRoot);
  final List<NpTab> _tabs = [];
  NpTab? _active;
  bool _showTree = true;
  bool _treeOpen = true;
  int _zoom = 0;

  NpConnection get conn => widget.conn;
  Map<String, dynamic> get _settings => (widget.engine.library.items['settings']?.$2) ?? const {};
  Map<String, dynamic> eff() => npEffectiveEditor(conn, _settings);
  bool get _isRemote => conn.isRemote;

  @override
  void initState() {
    super.initState();
    _tree.errorText = (t) => t;
    widget.engine.addListener(_onEngine);
    Future.microtask(_init);
  }

  void _onEngine() => setState(() {});

  @override
  void dispose() {
    widget.engine.removeListener(_onEngine);
    _persistTimer?.cancel();
    for (final t in _tabs) {
      t.dispose();
    }
    _proj?.close();
    super.dispose();
  }

  Future<void> _init() async {
    if (!mounted) return;
    final s = MtStrings.of(context);
    try {
      final cache = widget.cacheDir ?? await NpProject.defaultCacheDir();
      final p = NpProject(conn: conn, cacheDir: cache, onHostKey: widget.onHostKey, onStatus: (st) { if (mounted) setState(() => _status = st); });
      _proj = p;
      final (root, _) = await p.open();
      _root = root;
      if (!_isRemote) _docs = await npDocumentsRoot();
      _tree.errorText = (t) => t;
      if (!mounted) return;
      setState(() => _error = null);
      await _tree.setRoot(root, conn.kind == 'file' ? npDirName(root) : npBaseName(root).isEmpty ? root : npBaseName(root));
      if (conn.kind == 'file') {
        await _openFile(conn.localPath);
      } else if (conn.restoreTabs && conn.openTabs.isNotEmpty) {
        for (final p in conn.openTabs.take(50)) {
          await _openFile(p, activate: false, quiet: true);
        }
        final a = conn.activeTab;
        final t = _tabs.where((t) => t.path == a).firstOrNull ?? _tabs.firstOrNull;
        if (t != null) _activate(t);
      }
    } catch (e) {
      if (mounted) setState(() { _error = npErrorText(s, e); _status = NpStatus.off; });
    }
  }

  Future<void> _reconnect() async {
    final s = MtStrings.of(context);
    final p = _proj;
    if (p == null) return _init();
    try {
      await p.connect();
      if (mounted) mtToast(context, s.npProjReconnected, type: 'ok');
      await _tree.refresh();
      setState(() => _error = null);
    } catch (e) {
      if (mounted) { setState(() => _status = NpStatus.off); mtToast(context, s.npProjConnectFail, sub: npErrorText(s, e), type: 'err'); }
    }
  }

  // ---- sekmeler ------------------------------------------------------------
  Timer? _persistTimer;
  Future<void> _persistChain = Future.value();

  /// Açık sekmeler yerel alandır (senkronlanmaz): kitaplıkta tutulur, dosyaya gecikmeli ve sırayla yazılır.
  void _persistTabs() {
    final lib = widget.engine.library;
    final cur = lib.items[conn.id];
    if (cur == null) return;
    lib.items[conn.id] = (cur.$1, {...cur.$2, 'openTabs': [for (final t in _tabs.take(50)) t.path], 'activeTab': _active?.path});
    _persistTimer?.cancel();
    _persistTimer = Timer(const Duration(milliseconds: 400), () => _persistChain = _persistChain.then((_) => lib.save()).catchError((_) {}));
  }

  void _activate(NpTab? t) {
    setState(() { _active = t; if (t != null) _showTree = false; });
    _persistTabs();
  }

  Future<NpTab?> _openFile(String path, {bool activate = true, bool isNew = false, bool quiet = false, String? encoding}) async {
    final s = MtStrings.of(context);
    final existing = _tabs.where((t) => t.path == path).firstOrNull;
    if (existing != null) { if (activate) _activate(existing); return existing; }
    final e = eff();
    final p = _proj;
    if (p == null) return null;
    NpReadResult r;
    try {
      r = await p.read(path, encoding: encoding ?? e['encoding'], fallback: e['fallbackEncoding']);
    } catch (err) {
      if (mounted && !quiet) mtToast(context, s.npProjOpenFail(npBaseName(path)), sub: npErrorText(s, err), type: 'err');
      return null;
    }
    if (!mounted) return null;
    if (r.tooLarge) { if (!quiet) mtToast(context, s.npProjTooLarge(npBaseName(path), npFmtSize(r.size)), type: 'err'); return null; }
    if (r.binary) { if (!quiet) mtToast(context, s.npProjBinary(npBaseName(path)), sub: r.cachePath, type: 'err'); return null; }
    var enc = r.encoding, bom = r.bom;
    var eol = r.eol;
    var text = r.text;
    if (text.isEmpty && (isNew || e['encoding'] == 'auto')) {
      final ne = e['newEncoding'] as String;
      enc = ne == 'utf8bom' ? 'utf8' : ne;
      bom = ne == 'utf8bom' || ne.startsWith('utf16');
    }
    eol ??= e['newEol'] as String;
    var metaDirty = false;
    if (e['eol'] != 'auto' && eol != e['eol']) { eol = e['eol'] as String; metaDirty = text.isNotEmpty; }
    text = npConvertEol(text, 'lf');
    final firstLine = text.length > 200 ? text.substring(0, 200).split('\n').first : text.split('\n').first;
    final forced = e['language'] != 'auto';
    final lang = forced ? e['language'] as String : npLanguageFor(path, firstLine);
    final ctl = CodeLineEditingController.fromText(text, CodeLineOptions(lineBreak: TextLineBreak.lf, indentSize: (e['tabSize'] as num).toInt()));
    final tab = NpTab(path: path, controller: ctl, encoding: enc, bom: bom, eol: eol, lang: lang, langForced: forced, mtime: r.mtime, size: r.size, cachePath: r.cachePath, metaDirty: metaDirty)
      ..savedText = text;
    ctl.addListener(() => _onContentChange(tab));
    _tabs.add(tab);
    if (activate || _active == null) {
      _activate(tab);
    } else {
      setState(() {});
      _persistTabs();
    }
    return tab;
  }

  void _onContentChange(NpTab tab) {
    final c = tab.controller;
    final pre = c.preValue;
    if (pre != null && pre.codeLines.equals(c.codeLines)) return; // yalnız seçim değişti
    final small = tab.savedText.length < 262144;
    final dirty = small ? c.text != tab.savedText : true;
    if (dirty != tab.textDirty) setState(() => tab.textDirty = dirty);
    final sec = (eff()['autoSave'] as num).toInt();
    if (sec > 0) {
      tab.autoTimer?.cancel();
      tab.autoTimer = Timer(Duration(seconds: sec), () { if (tab.dirty && _tabs.contains(tab) && mounted) _save(tab, auto: true); });
    }
  }

  String _textForSave(NpTab tab) => npConvertEol(tab.controller.text, tab.eol);

  void _applySaveTransforms(NpTab tab) {
    final e = eff();
    if (e['trimTrailing'] != true && e['finalNewline'] != true) return;
    var text = tab.controller.text;
    final orig = text;
    if (e['trimTrailing'] == true) text = text.replaceAll(RegExp(r'[ \t]+$', multiLine: true), '');
    if (e['finalNewline'] == true && text.isNotEmpty && !text.endsWith('\n')) text = '$text\n';
    if (text != orig) tab.controller.text = text;
  }

  Future<bool> _save(NpTab tab, {bool auto = false, bool force = false, bool allowLossy = false}) async {
    final s = MtStrings.of(context);
    final p = _proj;
    if (p == null || tab.saving) return false;
    if (!force && !allowLossy) _applySaveTransforms(tab);
    final e = eff();
    final text = tab.controller.text;
    setState(() => tab.saving = true);
    NpSaveResult res;
    try {
      res = await p.save(tab.path, _textForSave(tab), encoding: tab.encoding, bom: tab.bom, expect: e['checkRemoteChange'] == true ? (tab.size, tab.mtime) : null, force: force, allowLossy: allowLossy);
    } catch (err) {
      if (mounted) { setState(() => tab.saving = false); mtToast(context, s.npProjSaveFail(tab.name), sub: npErrorText(s, err), type: 'err'); }
      return false;
    }
    if (!mounted) return false;
    setState(() => tab.saving = false);
    if (res.lossy) {
      final ok = await _confirm(s.npProjLossyTitle, _plain(s.npProjLossyMsg(npEncodingLabel(tab.encoding, bom: tab.bom))), okText: s.npProjSaveAnyway);
      return ok ? _save(tab, force: force, allowLossy: true) : false;
    }
    if (res.conflict) {
      if (auto) { mtToast(context, s.npProjConflictAuto(tab.name), type: 'err'); return false; }
      final choice = await showDialog<String>(context: context, builder: (ctx) => AlertDialog(
            title: Row(children: [Icon(Icons.info_outline, size: 18, color: MtColors.of(ctx).accent), const SizedBox(width: 8), Text(s.npProjConflictTitle)]),
            content: Text(_plain(s.npProjConflictMsg(tab.name)), style: MtText.body.copyWith(color: MtColors.of(ctx).text2, height: 1.5)),
            actionsPadding: const EdgeInsets.fromLTRB(22, 0, 22, 18),
            actions: [
              MtButton(label: s.npProjConflictReload, onPressed: () => Navigator.pop(ctx, 'reload')),
              MtButton(label: s.commonCancel, onPressed: () => Navigator.pop(ctx)),
              MtButton(label: s.npProjConflictOverwrite, kind: MtBtnKind.primary, onPressed: () => Navigator.pop(ctx, 'overwrite')),
            ],
          ));
      if (choice == 'overwrite') return _save(tab, force: true, allowLossy: allowLossy);
      if (choice == 'reload') { tab.metaDirty = false; tab.textDirty = false; await _reload(tab); }
      return false;
    }
    setState(() { tab.savedText = text; tab.textDirty = false; tab.metaDirty = false; tab.mtime = res.mtime; tab.size = res.size; tab.cachePath = res.cachePath; });
    if (!auto) mtToast(context, _isRemote ? s.npProjSavedRemote(tab.name) : s.npProjSaved(tab.name), type: 'ok');
    return true;
  }

  Future<void> _saveAll() async {
    for (final t in _tabs.where((t) => t.dirty).toList()) {
      if (!await _save(t)) break;
    }
  }

  Future<void> _saveAs(NpTab tab) async {
    final s = MtStrings.of(context);
    final name = await _ask(s.npMobSaveAsTitle, s.npTreeFileName, initial: tab.name);
    if (name == null || name.isEmpty || name.contains('/')) { if (name != null && mounted) mtToast(context, s.npTreeBadName, type: 'err'); return; }
    final dir = npDirName(tab.path);
    final newPath = npJoin(dir, name);
    final p = _proj!;
    try {
      final res = await p.save(newPath, _textForSave(tab), encoding: tab.encoding, bom: tab.bom, force: true, allowLossy: true);
      if (!mounted) return;
      setState(() { tab.path = newPath; tab.savedText = tab.controller.text; tab.textDirty = false; tab.metaDirty = false; tab.mtime = res.mtime; tab.size = res.size; tab.cachePath = res.cachePath; });
      _persistTabs();
      await _tree.refresh(dir);
      if (mounted) mtToast(context, _isRemote ? s.npProjSavedRemote(name) : s.npProjSaved(name), type: 'ok');
    } catch (e) {
      if (mounted) mtToast(context, s.npProjSaveFail(name), sub: npErrorText(s, e), type: 'err');
    }
  }

  Future<void> _reload(NpTab tab, {String? encoding}) async {
    final s = MtStrings.of(context);
    if (tab.dirty) {
      final ok = await _confirm(s.npProjReload, _plain(s.npProjReloadMsg(tab.name)), okText: s.npProjReload);
      if (!ok) return;
    }
    final e = eff();
    NpReadResult r;
    try {
      r = await _proj!.read(tab.path, encoding: encoding ?? (tab.encoding == 'utf8' && tab.bom ? 'utf8bom' : tab.encoding), fallback: e['fallbackEncoding']);
    } catch (err) {
      if (mounted) mtToast(context, s.npProjOpenFail(tab.name), sub: npErrorText(s, err), type: 'err');
      return;
    }
    if (!mounted) return;
    if (r.binary || r.tooLarge) { mtToast(context, s.npProjBinary(tab.name), type: 'err'); return; }
    final text = npConvertEol(r.text, 'lf');
    tab.controller.text = text;
    setState(() { tab.savedText = text; tab.encoding = r.encoding; tab.bom = r.bom; tab.mtime = r.mtime; tab.size = r.size; tab.metaDirty = false; tab.textDirty = false; });
  }

  Future<bool> _closeTab(NpTab tab) async {
    final s = MtStrings.of(context);
    if (tab.dirty) {
      final r = await showDialog<String>(context: context, builder: (ctx) => AlertDialog(
            title: Text(s.npProjUnsavedTitle), content: Text(_plain(s.npProjUnsavedMsg(tab.name))),
            actionsPadding: const EdgeInsets.fromLTRB(22, 0, 22, 18),
            actions: [
              MtButton(label: s.npProjDontSave, kind: MtBtnKind.danger, onPressed: () => Navigator.pop(ctx, 'discard')),
              MtButton(label: s.commonCancel, onPressed: () => Navigator.pop(ctx)),
              MtButton(label: s.npProjSave, kind: MtBtnKind.primary, onPressed: () => Navigator.pop(ctx, 'save')),
            ],
          ));
      if (r == null) return false;
      if (r == 'save' && !await _save(tab)) return false;
    }
    final i = _tabs.indexOf(tab);
    _tabs.remove(tab);
    tab.dispose();
    if (_active == tab) _active = _tabs.isEmpty ? null : _tabs[i.clamp(0, _tabs.length - 1)];
    if (mounted) setState(() { if (_active == null) _showTree = true; });
    _persistTabs();
    return true;
  }

  Future<void> _closeOthers(NpTab keep) async {
    for (final t in _tabs.where((t) => t != keep).toList()) {
      if (!await _closeTab(t)) return;
    }
  }

  Future<bool> _closeAll() async {
    for (final t in _tabs.toList()) {
      if (!await _closeTab(t)) return false;
    }
    return true;
  }

  // ---- ağaç eylemleri --------------------------------------------------------
  Future<void> _newFile([String? dir]) async {
    final s = MtStrings.of(context);
    final target = dir ?? _tree.targetDir();
    final name = await _ask(s.npTreeNewFile, s.npTreeFileName);
    if (name == null || name.isEmpty) return;
    if (name.contains('/') || name == '.' || name == '..') { if (mounted) mtToast(context, s.npTreeBadName, type: 'err'); return; }
    final path = npJoin(target, name);
    try {
      await _proj!.createFile(path);
      await _tree.refresh(target);
      await _tree.reveal(path);
      await _openFile(path, isNew: true);
    } catch (e) {
      if (mounted) mtToast(context, s.npTreeCreateFail, sub: npErrorText(s, e), type: 'err');
    }
  }

  Future<void> _newFolder([String? dir]) async {
    final s = MtStrings.of(context);
    final target = dir ?? _tree.targetDir();
    final name = await _ask(s.commonNewFolder, s.commonFolderName);
    if (name == null || name.isEmpty) return;
    if (name.contains('/') || name == '.' || name == '..') { if (mounted) mtToast(context, s.npTreeBadName, type: 'err'); return; }
    try {
      await _proj!.mkdir(npJoin(target, name));
      await _tree.refresh(target);
    } catch (e) {
      if (mounted) mtToast(context, s.npTreeCreateFail, sub: npErrorText(s, e), type: 'err');
    }
  }

  Future<void> _renameNode(NpNode n) async {
    final s = MtStrings.of(context);
    final prefix = n.isDir ? '${n.path}/' : n.path;
    if (_tabs.any((t) => t.dirty && (t.path == prefix || t.path.startsWith(prefix)))) { mtToast(context, s.npTreeRenameDirty, type: 'err'); return; }
    final name = await _ask(s.commonRename, s.commonNewName, initial: n.name);
    if (name == null || name.isEmpty || name == n.name) return;
    if (name.contains('/')) { if (mounted) mtToast(context, s.npTreeBadName, type: 'err'); return; }
    final to = npJoin(npDirName(n.path), name);
    try {
      await _proj!.rename(n.path, to);
      for (final t in _tabs) {
        if (t.path == n.path) {
          t.path = to;
        } else if (n.isDir && t.path.startsWith(prefix)) {
          t.path = to + t.path.substring(n.path.length);
        }
      }
      setState(() {});
      _persistTabs();
      await _tree.refresh(npDirName(n.path));
    } catch (e) {
      if (mounted) mtToast(context, s.npTreeRenameFail, sub: npErrorText(s, e), type: 'err');
    }
  }

  Future<void> _deleteNode(NpNode n) async {
    final s = MtStrings.of(context);
    final ok = await _confirm(s.npTreeDeleteTitle, _plain(n.isDir ? s.npTreeDeleteDirMsg(n.name) : s.npTreeDeleteMsg(n.name)), okText: s.commonDelete, danger: true);
    if (!ok) return;
    try {
      await _proj!.remove(n.path, n.isDir);
      final prefix = '${n.path}/';
      for (final t in _tabs.where((t) => t.path == n.path || (n.isDir && t.path.startsWith(prefix))).toList()) {
        _tabs.remove(t);
        t.dispose();
        if (_active == t) _active = _tabs.firstOrNull;
      }
      setState(() {});
      _persistTabs();
      await _tree.refresh(npDirName(n.path));
    } catch (e) {
      if (mounted) mtToast(context, s.npTreeDeleteFail, sub: npErrorText(s, e), type: 'err');
    }
  }

  Future<void> _treeMenu(NpNode? n, Offset pos) async {
    final s = MtStrings.of(context);
    final c = MtColors.of(context);
    Widget mi(IconData i, String t, {bool danger = false}) => Row(children: [Icon(i, size: 16, color: danger ? c.err : null), const SizedBox(width: 10), Text(t)]);
    final r = await showMenu<String>(context: context, position: RelativeRect.fromLTRB(pos.dx, pos.dy, pos.dx, pos.dy), items: [
      if (n != null && !n.isDir) PopupMenuItem(value: 'open', child: mi(Icons.open_in_new, s.commonOpen)),
      PopupMenuItem(value: 'newFile', child: mi(Icons.note_add_outlined, s.npTreeNewFile)),
      PopupMenuItem(value: 'newFolder', child: mi(Icons.create_new_folder_outlined, s.commonNewFolder)),
      if (n != null) PopupMenuItem(value: 'rename', child: mi(Icons.drive_file_rename_outline, s.commonRename)),
      PopupMenuItem(value: 'refresh', child: mi(Icons.refresh, s.commonRefresh)),
      if (n != null) const PopupMenuDivider(),
      if (n != null) PopupMenuItem(value: 'del', child: mi(Icons.delete_outline, s.commonDelete, danger: true)),
    ]);
    if (!mounted || r == null) return;
    final dir = n == null ? _root : n.isDir ? n.path : npDirName(n.path);
    switch (r) {
      case 'open': await _openFile(n!.path);
      case 'newFile': await _newFile(dir);
      case 'newFolder': await _newFolder(dir);
      case 'rename': await _renameNode(n!);
      case 'refresh': await _tree.refresh(dir);
      case 'del': await _deleteNode(n!);
    }
  }

  Future<void> _tabMenu(NpTab t, Offset pos) async {
    final s = MtStrings.of(context);
    final c = MtColors.of(context);
    Widget mi(IconData i, String x, {bool danger = false}) => Row(children: [Icon(i, size: 16, color: danger ? c.err : null), const SizedBox(width: 10), Text(x)]);
    final r = await showMenu<String>(context: context, position: RelativeRect.fromLTRB(pos.dx, pos.dy, pos.dx, pos.dy), items: [
      PopupMenuItem(value: 'close', child: mi(Icons.close, s.npProjCloseTab)),
      PopupMenuItem(value: 'others', child: mi(Icons.tab_unselected, s.npProjCloseOthers)),
      PopupMenuItem(value: 'all', child: mi(Icons.clear_all, s.npProjCloseAll)),
      const PopupMenuDivider(),
      PopupMenuItem(value: 'reload', child: mi(Icons.refresh, s.npProjReload)),
      PopupMenuItem(value: 'saveAs', child: mi(Icons.save_as_outlined, s.npMobSaveAs)),
      PopupMenuItem(value: 'reveal', child: mi(Icons.account_tree_outlined, s.npProjRevealTree)),
    ]);
    if (!mounted || r == null) return;
    switch (r) {
      case 'close': await _closeTab(t);
      case 'others': await _closeOthers(t);
      case 'all': await _closeAll();
      case 'reload': await _reload(t);
      case 'saveAs': await _saveAs(t);
      case 'reveal': await _tree.reveal(t.path); setState(() => _showTree = true);
    }
  }

  // ---- durum çubuğu eylemleri ------------------------------------------------
  Future<void> _encodingDialog(NpTab tab) async {
    final s = MtStrings.of(context);
    var convert = tab.encoding == 'utf8' && tab.bom ? 'utf8bom' : tab.encoding;
    String? reopen;
    final encs = [for (final e in kNpEncodings) if (npCodecSupported(e.$1)) e];
    final ok = await showDialog<bool>(context: context, builder: (ctx) => StatefulBuilder(builder: (ctx, setD) => AlertDialog(
          title: Row(children: [Icon(Icons.layers_outlined, size: 18, color: MtColors.of(ctx).accent), const SizedBox(width: 8), Expanded(child: Text(s.npProjEncTitle(tab.name), maxLines: 1, overflow: TextOverflow.ellipsis))]),
          content: SizedBox(width: 480, child: Column(mainAxisSize: MainAxisSize.min, crossAxisAlignment: CrossAxisAlignment.stretch, children: [
            MtField(label: s.npProjEncConvert, hint: s.npProjEncConvertHint, child: _select<String>(ctx, convert, encs, (v) => setD(() => convert = v))),
            const SizedBox(height: 14),
            MtField(label: s.npProjEncReopen, hint: s.npProjEncReopenHint, child: _select<String?>(ctx, reopen, [(null, '—'), ...encs], (v) => setD(() => reopen = v))),
          ])),
          actionsPadding: const EdgeInsets.fromLTRB(22, 0, 22, 18),
          actions: [MtButton(label: s.commonCancel, onPressed: () => Navigator.pop(ctx, false)), MtButton(label: s.commonOk, kind: MtBtnKind.primary, onPressed: () => Navigator.pop(ctx, true))],
        )));
    if (ok != true || !mounted) return;
    if (reopen != null) { await _reload(tab, encoding: reopen); return; }
    final enc = convert == 'utf8bom' ? 'utf8' : convert;
    final bom = convert == 'utf8bom' || convert.startsWith('utf16');
    if (enc != tab.encoding || bom != tab.bom) setState(() { tab.encoding = enc; tab.bom = bom; tab.metaDirty = true; });
  }

  Future<void> _eolMenu(NpTab tab, Offset pos) async {
    final r = await showMenu<String>(context: context, position: RelativeRect.fromLTRB(pos.dx, pos.dy - 120, pos.dx, pos.dy), items: [
      for (final e in kNpEols) CheckedPopupMenuItem(value: e.$1, checked: tab.eol == e.$1, child: Text(MtStrings.of(context).npProjEolTo(e.$2))),
    ]);
    if (r != null && r != tab.eol && mounted) setState(() { tab.eol = r; tab.metaDirty = true; });
  }

  Future<void> _langDialog(NpTab tab) async {
    final s = MtStrings.of(context);
    var q = '';
    final r = await showDialog<String>(context: context, builder: (ctx) => StatefulBuilder(builder: (ctx, setD) {
          final items = kNpLanguages.where((l) => q.isEmpty || l.$2.toLowerCase().contains(q.toLowerCase()) || l.$1.contains(q.toLowerCase())).toList();
          return AlertDialog(
            title: Text(s.npProjLangTitle),
            content: SizedBox(width: 420, height: 400, child: Column(children: [
              TextField(autofocus: true, decoration: InputDecoration(hintText: s.npProjLangSearch, prefixIcon: const Icon(Icons.search, size: 18)), onChanged: (v) => setD(() => q = v)),
              const SizedBox(height: 8),
              Expanded(child: ListView(children: [
                for (final l in items) ListTile(dense: true, visualDensity: VisualDensity.compact, selected: l.$1 == tab.lang, title: Text(l.$2), subtitle: Text(l.$1, style: MtText.tiny), onTap: () => Navigator.pop(ctx, l.$1)),
              ])),
            ])),
            actionsPadding: const EdgeInsets.fromLTRB(22, 0, 22, 18),
            actions: [MtButton(label: s.commonCancel, onPressed: () => Navigator.pop(ctx))],
          );
        }));
    if (r != null && mounted) setState(() { tab.lang = r; tab.langForced = true; });
  }

  Future<void> _goto(NpTab tab) async {
    final s = MtStrings.of(context);
    final v = await _ask(s.npProjGoto, '1 – ${tab.controller.lineCount}');
    final n = int.tryParse(v ?? '');
    if (n == null) return;
    final idx = (n - 1).clamp(0, tab.controller.lineCount - 1);
    tab.controller.selection = CodeLineSelection.collapsed(index: idx, offset: 0);
    tab.scroll.makeCenterIfInvisible(CodeLinePosition(index: idx, offset: 0));
    tab.focus.requestFocus();
  }

  // ---- yardımcılar --------------------------------------------------------------
  static String _plain(String html) => html.replaceAll(RegExp(r'<[^>]+>'), '').replaceAll('<br>', '\n');

  Future<String?> _ask(String title, String hint, {String initial = ''}) {
    final s = MtStrings.of(context);
    final ctl = TextEditingController(text: initial);
    return showDialog<String>(context: context, builder: (ctx) => AlertDialog(
          title: Text(title),
          content: TextField(controller: ctl, autofocus: true, textDirection: TextDirection.ltr, autocorrect: false, decoration: InputDecoration(hintText: hint), onSubmitted: (v) => Navigator.pop(ctx, v.trim())),
          actionsPadding: const EdgeInsets.fromLTRB(22, 0, 22, 18),
          actions: [MtButton(label: s.commonCancel, onPressed: () => Navigator.pop(ctx)), MtButton(label: s.commonOk, kind: MtBtnKind.primary, onPressed: () => Navigator.pop(ctx, ctl.text.trim()))],
        ));
  }

  Future<bool> _confirm(String title, String msg, {required String okText, bool danger = false}) async {
    final s = MtStrings.of(context);
    return await showDialog<bool>(context: context, builder: (ctx) => AlertDialog(
          title: Text(title), content: Text(msg), actionsPadding: const EdgeInsets.fromLTRB(22, 0, 22, 18),
          actions: [MtButton(label: s.commonCancel, onPressed: () => Navigator.pop(ctx, false)), MtButton(label: okText, kind: danger ? MtBtnKind.dangerPrimary : MtBtnKind.primary, onPressed: () => Navigator.pop(ctx, true))],
        )) ?? false;
  }

  Widget _select<T>(BuildContext ctx, T value, List<(T, String)> items, ValueChanged<T> onChanged) {
    final col = MtColors.of(ctx);
    final has = items.any((x) => x.$1 == value);
    return Container(
      height: MtDim.inputH, padding: const EdgeInsets.symmetric(horizontal: 12),
      decoration: BoxDecoration(color: col.bg2, border: Border.all(color: col.border), borderRadius: BorderRadius.circular(MtDim.radiusSm)),
      child: DropdownButtonHideUnderline(child: DropdownButton<T>(value: has ? value : items.first.$1, isExpanded: true, style: MtText.body.copyWith(color: col.text), dropdownColor: col.surface2,
          items: [for (final it in items) DropdownMenuItem(value: it.$1, child: Text(it.$2, maxLines: 1, overflow: TextOverflow.ellipsis))], onChanged: (v) => onChanged(v as T))),
    );
  }

  Future<bool> _canLeave() async {
    if (!_tabs.any((t) => t.dirty)) return true;
    final s = MtStrings.of(context);
    final r = await showDialog<String>(context: context, builder: (ctx) => AlertDialog(
          title: Text(s.npProjUnsavedTitle), content: Text(s.npMainCloseDirty),
          actionsPadding: const EdgeInsets.fromLTRB(22, 0, 22, 18),
          actions: [
            MtButton(label: s.npMainCloseDiscard, kind: MtBtnKind.danger, onPressed: () => Navigator.pop(ctx, 'discard')),
            MtButton(label: s.commonCancel, onPressed: () => Navigator.pop(ctx)),
            MtButton(label: s.npProjSaveAll, kind: MtBtnKind.primary, onPressed: () => Navigator.pop(ctx, 'save')),
          ],
        ));
    if (r == 'discard') return true;
    if (r == 'save') { await _saveAll(); return !_tabs.any((t) => t.dirty); }
    return false;
  }

  // ---- görünüm -------------------------------------------------------------------
  @override
  Widget build(BuildContext context) {
    final s = MtStrings.of(context);
    final c = MtColors.of(context);
    final wide = MtBreak.wide(context);
    final e = eff();
    final theme = npResolveTheme(context, e['theme'] as String);
    final tab = _active;
    final (Color dot, String dotTip) = switch (_status) { NpStatus.on => (c.ok, s.npProjStatusOn), NpStatus.off => (c.err, s.npProjStatusOff), _ => (c.warn, s.npProjStatusConnecting) };
    final kindLabel = switch (conn.kind) { 'ssh' => 'SSH', 'ftp' => kFtpProtocols[conn.protocol]?.$1.split(' ').first ?? 'FTP', 'local' => s.npKindLocal, _ => s.npKindFile };
    final sub = _isRemote ? '${conn.anonymous ? 'anonymous' : conn.username}@${conn.host}:${_root.isEmpty ? conn.rootDir : _root}' : _short(_root.isEmpty ? conn.localPath : _root);
    final showTreeNow = wide ? _treeOpen : _showTree;

    final topBar = Container(
      height: 46, padding: const EdgeInsetsDirectional.only(start: 4, end: 10),
      decoration: BoxDecoration(color: c.bg2, border: Border(bottom: BorderSide(color: c.border)), boxShadow: [BoxShadow(color: conn.colorValue.withValues(alpha: .55), offset: const Offset(0, -2), blurRadius: 0, spreadRadius: 0)]),
      child: Row(children: [
        MtIconButton(icon: Icons.arrow_back, onPressed: () async { if (!wide && !_showTree && _active != null) { setState(() => _showTree = true); return; } if (await _canLeave() && context.mounted) Navigator.of(context).pop(); }),
        MtIconButton(icon: Icons.view_sidebar_outlined, tooltip: s.npProjToggleTree, color: showTreeNow ? c.accent : null, onPressed: () => setState(() { if (wide) { _treeOpen = !_treeOpen; } else { _showTree = !_showTree; } })),
        const SizedBox(width: 6),
        Tooltip(message: dotTip, child: Container(width: 9, height: 9, decoration: BoxDecoration(color: dot, shape: BoxShape.circle, boxShadow: [BoxShadow(color: dot.withValues(alpha: .15), spreadRadius: 3)]))),
        const SizedBox(width: 10),
        Expanded(child: wide
            ? Row(crossAxisAlignment: CrossAxisAlignment.baseline, textBaseline: TextBaseline.alphabetic, children: [
                Text(conn.name, style: const TextStyle(fontSize: 14, fontWeight: FontWeight.w700)), const SizedBox(width: 10),
                Flexible(child: Text(sub, maxLines: 1, overflow: TextOverflow.ellipsis, textDirection: TextDirection.ltr, style: MtText.mono.copyWith(color: c.text3))),
              ])
            : Column(crossAxisAlignment: CrossAxisAlignment.start, mainAxisAlignment: MainAxisAlignment.center, children: [
                Text(conn.name, maxLines: 1, overflow: TextOverflow.ellipsis, style: const TextStyle(fontSize: 14, fontWeight: FontWeight.w700)),
                Text(sub, maxLines: 1, overflow: TextOverflow.ellipsis, textDirection: TextDirection.ltr, style: MtText.tiny.copyWith(color: c.text3, fontFamily: 'monospace')),
              ])),
        if (wide) ...[const SizedBox(width: 10), _tag(c, Icons.lock_outline, kindLabel)],
        if (_status == NpStatus.off && _isRemote) ...[const SizedBox(width: 6), MtButton(label: s.npProjReconnect, small: true, kind: MtBtnKind.ghost, icon: Icons.refresh, onPressed: _reconnect)],
        if (!wide) ...[
          MtIconButton(icon: Icons.save_outlined, tooltip: s.npProjSave, onPressed: tab == null || tab.saving ? null : () => _save(tab)),
          MtIconButton(icon: Icons.search, tooltip: s.npProjFind, onPressed: tab == null ? null : () { setState(() => _showTree = false); tab.find.findMode(); }),
          _moreMenu(s, tab),
        ] else if (widget.onOpenSettings != null) MtIconButton(icon: Icons.settings_outlined, tooltip: s.npAppSettings, onPressed: widget.onOpenSettings),
      ]),
    );

    Widget tb(IconData i, String tip, VoidCallback? f, {bool active = false}) => Tooltip(message: tip, child: Material(
          color: active ? c.accent.withValues(alpha: .1) : Colors.transparent, borderRadius: BorderRadius.circular(7),
          child: InkWell(borderRadius: BorderRadius.circular(7), onTap: f, child: Opacity(opacity: f == null ? .35 : 1, child: SizedBox(width: 30, height: 28, child: Icon(i, size: 17, color: active ? c.accent : c.text2)))),
        ));
    Widget sep() => Container(width: 1, height: 18, margin: const EdgeInsets.symmetric(horizontal: 6), color: c.border);
    final wrapOn = tab?.wrapOverride ?? (e['wordWrap'] == true);
    final toolbar = Container(
      height: 36, padding: const EdgeInsets.symmetric(horizontal: 8),
      decoration: BoxDecoration(color: c.surface, border: Border(bottom: BorderSide(color: c.border))),
      child: Row(children: [
        tb(Icons.note_add_outlined, s.npTreeNewFile, _proj == null ? null : () => _newFile()),
        tb(Icons.save_outlined, s.npProjSave, tab == null || tab.saving ? null : () => _save(tab)),
        tb(Icons.save_alt_outlined, s.npProjSaveAll, _tabs.any((t) => t.dirty) ? _saveAll : null),
        sep(),
        tb(Icons.undo, s.npProjUndo, tab == null ? null : () => tab.controller.undo()),
        tb(Icons.redo, s.npProjRedo, tab == null ? null : () => tab.controller.redo()),
        sep(),
        tb(Icons.search, s.npProjFind, tab == null ? null : () => tab.find.findMode()),
        tb(Icons.find_replace, s.npProjReplace, tab == null ? null : () => tab.find.replaceMode()),
        tb(Icons.subdirectory_arrow_right, s.npProjGoto, tab == null ? null : () => _goto(tab)),
        sep(),
        tb(Icons.wrap_text, s.npEdWordWrap, tab == null ? null : () => setState(() => tab.wrapOverride = !wrapOn), active: wrapOn),
        tb(Icons.view_sidebar_outlined, s.npProjToggleTree, () => setState(() => _treeOpen = !_treeOpen), active: _treeOpen),
        sep(),
        tb(Icons.zoom_out, s.npProjZoomOut, () => setState(() => _zoom = (_zoom - 1).clamp(-6, 20))),
        tb(Icons.zoom_in, s.npProjZoomIn, () => setState(() => _zoom = (_zoom + 1).clamp(-6, 20))),
        sep(),
        tb(Icons.layers_outlined, s.npEdEncoding, tab == null ? null : () => _encodingDialog(tab)),
      ]),
    );

    final treePanel = Container(
      color: c.bg2,
      child: Column(children: [
        Container(
          height: 34, padding: const EdgeInsetsDirectional.only(start: 10, end: 6),
          decoration: BoxDecoration(color: c.surface, border: Border(bottom: BorderSide(color: c.border))),
          child: Row(children: [
            Icon(conn.isRemote ? Icons.dns_outlined : Icons.folder_outlined, size: 15, color: c.accent), const SizedBox(width: 6),
            Expanded(child: Text((_tree.root?.name ?? conn.name).toUpperCase(), maxLines: 1, overflow: TextOverflow.ellipsis, style: TextStyle(fontSize: 11.5, fontWeight: FontWeight.w700, letterSpacing: .7, color: c.text2))),
            MtIconButton(icon: Icons.note_add_outlined, size: 22, tooltip: s.npTreeNewFile, onPressed: _proj == null ? null : () => _newFile()),
            MtIconButton(icon: Icons.create_new_folder_outlined, size: 22, tooltip: s.commonNewFolder, onPressed: _proj == null ? null : () => _newFolder()),
            MtIconButton(icon: Icons.refresh, size: 22, tooltip: s.commonRefresh, onPressed: _proj == null ? null : () => _tree.refresh()),
            MtIconButton(icon: Icons.unfold_less, size: 22, tooltip: s.npTreeCollapseAll, onPressed: _tree.collapseAll),
          ]),
        ),
        Expanded(child: _error != null
            ? Center(child: Padding(padding: const EdgeInsets.all(20), child: Column(mainAxisSize: MainAxisSize.min, children: [
                MtBox(_error!, kind: MtBoxKind.error, icon: Icons.error_outline), const SizedBox(height: 12),
                MtButton(label: s.npProjReconnect, icon: Icons.refresh, kind: MtBtnKind.primary, onPressed: _reconnect),
              ])))
            : NpFileTree(controller: _tree, onOpen: (n) => _openFile(n.path), onContext: _treeMenu, isOpen: (p) => _tabs.any((t) => t.path == p))),
      ]),
    );

    final tabsBar = Container(
      height: 36, decoration: BoxDecoration(color: c.bg2, border: Border(bottom: BorderSide(color: c.border))),
      child: ListView(scrollDirection: Axis.horizontal, children: [
        for (final t in _tabs)
          GestureDetector(
            onLongPressStart: (d) => _tabMenu(t, d.globalPosition), onSecondaryTapDown: (d) => _tabMenu(t, d.globalPosition),
            child: Material(
              color: t == tab ? c.bg : Colors.transparent,
              child: InkWell(
                onTap: () => _activate(t),
                child: Container(
                  constraints: const BoxConstraints(maxWidth: 240), padding: const EdgeInsetsDirectional.only(start: 12, end: 4),
                  decoration: BoxDecoration(border: Border(top: BorderSide(color: t == tab ? c.accent : Colors.transparent, width: 2), right: BorderSide(color: c.border))),
                  child: Row(mainAxisSize: MainAxisSize.min, children: [
                    Icon(Icons.description_outlined, size: 14, color: c.accent), const SizedBox(width: 7),
                    Flexible(child: Text(t.name, maxLines: 1, overflow: TextOverflow.ellipsis, textDirection: TextDirection.ltr,
                        style: TextStyle(fontSize: 12.5, color: t == tab ? c.text : c.text2, fontStyle: t.dirty ? FontStyle.italic : null))),
                    const SizedBox(width: 4),
                    t.saving
                        ? Padding(padding: const EdgeInsets.all(5), child: MtSpinner(size: 12, color: c.accent))
                        : MtIconButton(icon: t.dirty ? Icons.circle : Icons.close, size: 16, color: t.dirty ? c.accent : c.text3, onPressed: () => _closeTab(t)),
                  ]),
                ),
              ),
            ),
          ),
      ]),
    );

    final statusBar = Container(
      height: 28, padding: const EdgeInsetsDirectional.only(start: 12, end: 8),
      decoration: BoxDecoration(color: c.bg2, border: Border(top: BorderSide(color: c.border))),
      child: Row(children: [
        Expanded(child: Tooltip(message: tab?.path ?? '', child: Text(tab == null ? '' : _short(tab.path), maxLines: 1, overflow: TextOverflow.ellipsis, textDirection: TextDirection.ltr, style: TextStyle(fontSize: 11.5, fontFamily: 'monospace', color: c.text3)))),
        if (tab != null) ...[
          ValueListenableBuilder<CodeLineEditingValue>(valueListenable: tab.controller, builder: (_, v, _) {
            final sel = v.selection;
            final n = tab.controller.selectedText.length;
            return _st(c, '${s.npProjPos((sel.extentOffset + 1).toString(), (sel.extentIndex + 1).toString())}${n > 0 ? ' (${s.npProjSel(n.toString())})' : ''}', null);
          }),
          if (wide) _st(c, e['insertSpaces'] == true ? s.npProjSpaces(e['tabSize'].toString()) : s.npProjTabWidth(e['tabSize'].toString()), null),
          _st(c, npEncodingLabel(tab.encoding, bom: tab.bom).split(' — ').last.split(' (').first, () => _encodingDialog(tab)),
          Builder(builder: (ctx) => _st(c, tab.eol.toUpperCase(), () { final b = ctx.findRenderObject() as RenderBox; final p = b.localToGlobal(Offset.zero); _eolMenu(tab, p); })),
          _st(c, npLanguageLabel(tab.lang), () => _langDialog(tab)),
          if (_zoom != 0) _st(c, '${(100 + _zoom * 10)}%', () => setState(() => _zoom = 0), accent: true),
        ],
      ]),
    );

    Widget editorArea() {
      if (tab == null) {
        return Container(color: c.bg, child: Center(child: Padding(padding: const EdgeInsets.all(30), child: Column(mainAxisSize: MainAxisSize.min, children: [
          const AppIcon('np', size: 72),
          const SizedBox(height: 14),
          Text(conn.name, style: TextStyle(fontSize: 18, fontWeight: FontWeight.w700, color: c.text)),
          const SizedBox(height: 8),
          ConstrainedBox(constraints: const BoxConstraints(maxWidth: 440), child: Text(_error != null ? s.npProjInitFail : conn.kind == 'file' ? s.npProjEmptyFile : s.npProjEmptyHint, textAlign: TextAlign.center, style: MtText.body.copyWith(color: c.text3, height: 1.5))),
        ]))));
      }
      final ed = {...e, 'fontSize': ((e['fontSize'] as num).toInt() + _zoom).clamp(6, 48), 'wordWrap': wrapOn};
      return NpCodeEditor(key: ValueKey(tab.path), controller: tab.controller, findController: tab.find, scrollController: tab.scroll, focusNode: tab.focus,
          language: tab.lang, theme: theme, editor: ed);
    }

    final editorCol = Column(children: [tabsBar, Expanded(child: editorArea()), statusBar]);

    final body = wide
        ? Column(children: [
            topBar, toolbar,
            Expanded(child: Row(children: [
              if (_treeOpen) ...[SizedBox(width: 300, child: treePanel), Container(width: 1, color: c.border)],
              Expanded(child: editorCol),
            ])),
          ])
        : Column(children: [topBar, Expanded(child: _showTree ? treePanel : editorCol)]);

    return PopScope(
      canPop: false,
      onPopInvokedWithResult: (didPop, _) async {
        if (didPop) return;
        if (!wide && !_showTree && _active != null) { setState(() => _showTree = true); return; }
        if (await _canLeave() && context.mounted) Navigator.of(context).pop();
      },
      child: Scaffold(backgroundColor: c.bg, body: SafeArea(child: body)),
    );
  }

  Widget _moreMenu(MtStrings s, NpTab? tab) => PopupMenuButton<String>(
        icon: Icon(Icons.more_vert, size: 18, color: MtColors.of(context).text2),
        onSelected: (v) async {
          switch (v) {
            case 'newFile': await _newFile();
            case 'newFolder': await _newFolder();
            case 'saveAll': await _saveAll();
            case 'saveAs': if (tab != null) await _saveAs(tab);
            case 'undo': tab?.controller.undo();
            case 'redo': tab?.controller.redo();
            case 'replace': if (tab != null) { setState(() => _showTree = false); tab.find.replaceMode(); }
            case 'goto': if (tab != null) await _goto(tab);
            case 'wrap': if (tab != null) setState(() => tab.wrapOverride = !(tab.wrapOverride ?? (eff()['wordWrap'] == true)));
            case 'zoomIn': setState(() => _zoom = (_zoom + 1).clamp(-6, 20));
            case 'zoomOut': setState(() => _zoom = (_zoom - 1).clamp(-6, 20));
            case 'reload': if (tab != null) await _reload(tab);
            case 'reconnect': await _reconnect();
            case 'settings': widget.onOpenSettings?.call();
          }
        },
        itemBuilder: (_) => [
          PopupMenuItem(value: 'newFile', child: Text(s.npTreeNewFile)),
          PopupMenuItem(value: 'newFolder', child: Text(s.commonNewFolder)),
          PopupMenuItem(value: 'saveAll', enabled: _tabs.any((t) => t.dirty), child: Text(s.npProjSaveAll)),
          PopupMenuItem(value: 'saveAs', enabled: tab != null, child: Text(s.npMobSaveAs)),
          const PopupMenuDivider(),
          PopupMenuItem(value: 'undo', enabled: tab != null, child: Text(s.npProjUndo)),
          PopupMenuItem(value: 'redo', enabled: tab != null, child: Text(s.npProjRedo)),
          PopupMenuItem(value: 'replace', enabled: tab != null, child: Text(s.npProjReplace)),
          PopupMenuItem(value: 'goto', enabled: tab != null, child: Text(s.npProjGoto)),
          PopupMenuItem(value: 'wrap', enabled: tab != null, child: Text(s.npEdWordWrap)),
          PopupMenuItem(value: 'zoomIn', child: Text(s.npProjZoomIn)),
          PopupMenuItem(value: 'zoomOut', child: Text(s.npProjZoomOut)),
          const PopupMenuDivider(),
          PopupMenuItem(value: 'reload', enabled: tab != null, child: Text(s.npProjReload)),
          if (_isRemote) PopupMenuItem(value: 'reconnect', child: Text(s.npProjReconnect)),
          if (widget.onOpenSettings != null) PopupMenuItem(value: 'settings', child: Text(s.npAppSettings)),
        ],
      );

  Widget _tag(MtColors c, IconData i, String t) => Container(
        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 3),
        decoration: BoxDecoration(color: c.surface2, borderRadius: BorderRadius.circular(20), border: Border.all(color: c.border)),
        child: Row(mainAxisSize: MainAxisSize.min, children: [Icon(i, size: 12, color: c.ok), const SizedBox(width: 5), Text(t, style: TextStyle(fontSize: 11, fontWeight: FontWeight.w700, letterSpacing: .3, color: c.text2))]),
      );

  Widget _st(MtColors c, String t, VoidCallback? onTap, {bool accent = false}) => Material(
        color: Colors.transparent,
        child: InkWell(
          onTap: onTap, borderRadius: BorderRadius.circular(5),
          child: Container(height: 22, padding: const EdgeInsets.symmetric(horizontal: 8), alignment: Alignment.center,
              child: Text(t, maxLines: 1, style: TextStyle(fontSize: 11.5, color: accent ? c.accent : c.text2, fontFeatures: const [FontFeature.tabularFigures()]))),
        ),
      );
}
