// SSH Master kitaplık ekranı — masaüstü app.css birebir: üst çubukta arama (38 px, yarıçap 10, ≤520), "Yeni klasör",
// "Yeni bağlantı" (geçişli); gezinti yolu; "KLASÖRLER" (84 px yatay kart, sarı klasör avatarı, "{n} bağlantı") ve
// "BAĞLANTILAR" (132 px kart, solda 4 px renk şeridi, 36 px avatar, ad 14.5/600, mono user@host:port, etiket hapları);
// kesik kenarlıklı "Yeni" kartı; karşılama boş durumu. Uzun basma: Düzenle · Kopyasını oluştur · Klasöre taşı · Sil.
import 'package:flutter/material.dart';

import '../../core/account.dart';
import '../../core/l10n/gen/mt_strings.dart';
import '../../core/module_host.dart';
import '../../core/sync.dart';
import '../../core/theme.dart';
import '../../widgets/mt_widgets.dart';
import 'ssh_form.dart';
import 'ssh_model.dart';
import 'ssh_terminal.dart';

class SshLibraryScreen extends StatefulWidget {
  const SshLibraryScreen({super.key, required this.host, required this.account});
  final ModuleHost host;
  final AccountService account;
  @override
  State<SshLibraryScreen> createState() => _SshLibraryScreenState();
}

class _SshLibraryScreenState extends State<SshLibraryScreen> {
  SyncEngine? _engine;
  String? _folderId;
  String _q = '';
  final _search = TextEditingController();

  @override
  void initState() {
    super.initState();
    widget.host.open('sm').then((e) {
      if (!mounted) return;
      setState(() => _engine = e);
      e.addListener(_onSync);
    });
  }

  @override
  void dispose() {
    _engine?.removeListener(_onSync);
    _search.dispose();
    super.dispose();
  }

  void _onSync() => setState(() {});

  LocalLibrary get lib => _engine!.library;

  List<SshConnection> get _conns => [for (final e in lib.items.entries) if (e.value.$1 == 'connection') SshConnection(e.key, e.value.$2)];
  List<SshFolder> get _folders => [for (final e in lib.items.entries) if (e.value.$1 == 'folder') SshFolder(e.key, e.value.$2)];
  Set<String> get _folderIds => _folders.map((f) => f.id).toSet();
  int _cmp(String a, String b) => a.toLowerCase().compareTo(b.toLowerCase());

  Future<void> _save(String id, String kind, Map<String, dynamic> data) async {
    lib.items[id] = (kind, data);
    setState(() {});
    await _engine!.onLocalChange();
  }

  Future<void> _delete(String id) async {
    lib.items.remove(id);
    setState(() {});
    await _engine!.onLocalChange();
  }

  Future<void> _newFolder() async {
    final s = MtStrings.of(context);
    final name = await _askText(s.smAppNewSubfolder, s.smAppFolderPh);
    if (name == null || name.trim().isEmpty) return;
    await _save(newItemId(), 'folder', {'name': name.trim(), 'parentId': _folderId});
  }

  Future<String?> _askText(String title, String hint, {String initial = ''}) {
    final s = MtStrings.of(context);
    final ctl = TextEditingController(text: initial);
    return showDialog<String>(
      context: context,
      builder: (ctx) => AlertDialog(
        title: Text(title),
        content: TextField(controller: ctl, autofocus: true, decoration: InputDecoration(hintText: hint), onSubmitted: (v) => Navigator.pop(ctx, v)),
        actionsPadding: const EdgeInsets.fromLTRB(22, 0, 22, 18),
        actions: [MtButton(label: s.commonCancel, onPressed: () => Navigator.pop(ctx)), MtButton(label: s.commonSave, kind: MtBtnKind.primary, onPressed: () => Navigator.pop(ctx, ctl.text))],
      ),
    );
  }

  Future<bool> _confirm(String title, String msg, {bool danger = true}) async {
    final s = MtStrings.of(context);
    return await showDialog<bool>(
          context: context,
          builder: (ctx) => AlertDialog(
            title: Text(title), content: Text(msg), actionsPadding: const EdgeInsets.fromLTRB(22, 0, 22, 18),
            actions: [MtButton(label: s.commonCancel, onPressed: () => Navigator.pop(ctx, false)),
                      MtButton(label: s.commonDelete, kind: danger ? MtBtnKind.dangerPrimary : MtBtnKind.primary, onPressed: () => Navigator.pop(ctx, true))],
          ),
        ) ??
        false;
  }

  Future<void> _edit(SshConnection? c) async {
    final r = await Navigator.of(context).push<SshFormResult>(MaterialPageRoute(builder: (_) => SshFormScreen(
        existing: c, folders: _folders, folderId: c?.folderId ?? _folderId)));
    if (r == null) return;
    final id = c?.id ?? newItemId();
    await _save(id, 'connection', r.data);
    if (r.connect && mounted) _open(SshConnection(id, r.data));
  }

  void _open(SshConnection c) => Navigator.of(context).push(MaterialPageRoute(builder: (_) => SshTerminalScreen(conn: c, engine: _engine!,
      onLastDir: (dir) => _save(c.id, 'connection', {...c.raw, 'lastDir': dir}),
      onHostKey: (fp) => _save(c.id, 'connection', {...c.raw, 'hostKey': fp}))));

  Future<void> _connMenu(SshConnection c, Offset pos) async {
    final s = MtStrings.of(context);
    final r = await showMenu<String>(context: context, position: RelativeRect.fromLTRB(pos.dx, pos.dy, pos.dx, pos.dy), items: [
      PopupMenuItem(value: 'open', child: _mi(Icons.play_arrow, s.commonConnect)),
      PopupMenuItem(value: 'edit', child: _mi(Icons.edit_outlined, s.commonEdit)),
      PopupMenuItem(value: 'dup', child: _mi(Icons.copy_outlined, s.smAppDuplicate)),
      PopupMenuItem(value: 'move', child: _mi(Icons.drive_file_move_outlined, s.smAppMoveToFolder)),
      if (c.lastDir.isNotEmpty) PopupMenuItem(value: 'resetDir', child: _mi(Icons.restart_alt, s.smAppResetLastDir)),
      const PopupMenuDivider(),
      PopupMenuItem(value: 'del', child: _mi(Icons.delete_outline, s.smAppDeleteConn, danger: true)),
    ]);
    if (!mounted) return;
    switch (r) {
      case 'open': _open(c);
      case 'edit': _edit(c);
      case 'dup': await _save(newItemId(), 'connection', {...c.raw, 'name': '${c.name}${s.smMainCopySuffix}', 'createdAt': DateTime.now().millisecondsSinceEpoch});
      case 'move': await _move(c);
      case 'resetDir': await _save(c.id, 'connection', {...c.raw, 'lastDir': ''});
      case 'del':
        if (await _confirm(s.smAppDeleteConn, _plain(s.smAppDeleteConnMsg(c.name, '${c.username}@${c.host}')))) await _delete(c.id);
    }
  }

  Future<void> _folderMenu(SshFolder f, Offset pos) async {
    final s = MtStrings.of(context);
    final r = await showMenu<String>(context: context, position: RelativeRect.fromLTRB(pos.dx, pos.dy, pos.dx, pos.dy), items: [
      PopupMenuItem(value: 'rename', child: _mi(Icons.drive_file_rename_outline, s.smAppRenameFolder)),
      PopupMenuItem(value: 'new', child: _mi(Icons.add, s.smAppNewConnHere)),
      const PopupMenuDivider(),
      PopupMenuItem(value: 'del', child: _mi(Icons.delete_outline, s.smAppDeleteFolder, danger: true)),
    ]);
    if (!mounted) return;
    switch (r) {
      case 'rename':
        final n = await _askText(s.smAppRenameFolder, s.smAppFolderPh, initial: f.name);
        if (n != null && n.trim().isNotEmpty) await _save(f.id, 'folder', {...f.raw, 'name': n.trim()});
      case 'new':
        _folderId = f.id;
        await _edit(null);
      case 'del':
        final n = _conns.where((c) => c.folderId == f.id).length;
        if (await _confirm(s.smAppDeleteFolder, _plain(s.smAppDeleteFolderMsg(f.name)) + (n > 0 ? _plain(s.smAppDeleteFolderConns(n.toString())) : ''))) {
          // masaüstü: içindekiler ve alt klasörler üst klasöre taşınır
          for (final c in _conns.where((c) => c.folderId == f.id)) {
            lib.items[c.id] = ('connection', {...c.raw, 'folderId': f.parentId});
          }
          for (final sub in _folders.where((x) => x.parentId == f.id)) {
            lib.items[sub.id] = ('folder', {...sub.raw, 'parentId': f.parentId});
          }
          await _delete(f.id);
        }
    }
  }

  Future<void> _move(SshConnection c) async {
    final s = MtStrings.of(context);
    final target = await showDialog<String?>(
      context: context,
      builder: (ctx) => SimpleDialog(title: Text(_plain(s.smAppMoveTitle(c.name))), children: [
        SimpleDialogOption(onPressed: () => Navigator.pop(ctx, ''), child: Text(s.smAppRootFolder)),
        for (final f in _folders..sort((a, b) => _cmp(a.name, b.name))) SimpleDialogOption(onPressed: () => Navigator.pop(ctx, f.id), child: Text(f.name)),
      ]),
    );
    if (target == null) return;
    await _save(c.id, 'connection', {...c.raw, 'folderId': target.isEmpty ? null : target});
    if (mounted) mtToast(context, s.smAppConnMoved, type: 'ok');
  }

  Widget _mi(IconData i, String t, {bool danger = false}) => Row(children: [Icon(i, size: 16, color: danger ? MtColors.of(context).err : null), const SizedBox(width: 10), Text(t)]);
  String _plain(String html) => html.replaceAll(RegExp(r'<[^>]+>'), '');

  @override
  Widget build(BuildContext context) {
    final s = MtStrings.of(context);
    final c = MtColors.of(context);
    if (_engine == null) return const Scaffold(body: Center(child: CircularProgressIndicator()));
    final w = MediaQuery.sizeOf(context).width;
    final phone = w < 560;
    final padH = phone ? 16.0 : MtDim.contentPadH;
    final ids = _folderIds;
    final q = _q.trim().toLowerCase();
    final all = _conns;
    // yetim klasör bağı köke düşer
    List<SshConnection> conns = q.isNotEmpty
        ? all.where((x) => '${x.name} ${x.host} ${x.username} ${x.notes}'.toLowerCase().contains(q)).toList()
        : all.where((x) => (x.folderId != null && ids.contains(x.folderId) ? x.folderId : null) == _folderId).toList();
    conns.sort((a, b) => _cmp(a.name, b.name));
    final folders = q.isNotEmpty ? <SshFolder>[] : (_folders.where((f) => (f.parentId != null && ids.contains(f.parentId) ? f.parentId : null) == _folderId).toList()..sort((a, b) => _cmp(a.name, b.name)));
    final current = _folderId == null ? null : _folders.where((f) => f.id == _folderId).firstOrNull;
    final cardMin = phone ? (w - padH * 2) : 230.0;
    final cols = ((w - padH * 2 + 16) / (cardMin + 16)).floor().clamp(1, 6);
    final cardW = (w - padH * 2 - 16 * (cols - 1)) / cols;

    final search = Container(
      height: 38, constraints: const BoxConstraints(maxWidth: 520),
      decoration: BoxDecoration(color: c.surface, border: Border.all(color: c.border), borderRadius: BorderRadius.circular(10)),
      child: TextField(
        controller: _search, onChanged: (v) => setState(() => _q = v), style: MtText.body,
        decoration: InputDecoration(hintText: s.smAppSearchPh.replaceAll(RegExp(r'\s*\(Ctrl\+F\)'), ''), prefixIcon: Icon(Icons.search, size: 18, color: c.text3),
            filled: false, border: InputBorder.none, enabledBorder: InputBorder.none, focusedBorder: InputBorder.none, contentPadding: const EdgeInsets.symmetric(vertical: 9)),
      ),
    );

    return Scaffold(
      body: MtBackground(child: SafeArea(bottom: false, child: Column(children: [
        Container(
          padding: EdgeInsets.symmetric(vertical: phone ? 8 : 12, horizontal: phone ? 10 : 20),
          decoration: BoxDecoration(color: c.topbarBg, border: Border(bottom: BorderSide(color: c.border))),
          child: Row(children: [
            MtIconButton(icon: Icons.arrow_back, onPressed: () => Navigator.of(context).maybePop()),
            const SizedBox(width: 4),
            AppIcon('sm', size: 30),
            const SizedBox(width: 10),
            if (!phone) Text('SSH Master', style: MtText.brand.copyWith(color: c.text)),
            if (!phone) const SizedBox(width: 20),
            Expanded(child: search),
            const SizedBox(width: 8),
            _SyncDot(engine: _engine!),
            if (!phone) ...[
              const SizedBox(width: 8),
              MtButton(label: s.commonNewFolder, icon: Icons.create_new_folder_outlined, onPressed: _newFolder),
              const SizedBox(width: 8),
              MtButton(label: s.smAppNewConn, icon: Icons.add, kind: MtBtnKind.primary, onPressed: () => _edit(null)),
            ],
          ]),
        ),
        Expanded(child: ListView(padding: EdgeInsets.fromLTRB(padH, 14, padH, 90), children: [
          // gezinti yolu
          Row(children: [
            InkWell(onTap: () => setState(() => _folderId = null), child: Text(s.smAppAll, style: MtText.body.copyWith(color: current == null ? c.text : c.accent, fontWeight: FontWeight.w600))),
            if (current != null) ...[Padding(padding: const EdgeInsets.symmetric(horizontal: 6), child: Icon(Icons.chevron_right, size: 16, color: c.text3)), Text(current.name, style: MtText.body.copyWith(color: c.text, fontWeight: FontWeight.w600))],
            const Spacer(),
            Text(s.smAppStats(all.length.toString(), _folders.length.toString()), style: MtText.small.copyWith(color: c.text3)),
          ]),
          const SizedBox(height: 14),
          if (q.isNotEmpty) ...[
            MtSectionTitle(_plain(s.smAppResults(_q)), count: conns.length),
            const SizedBox(height: 10),
            if (conns.isEmpty) Padding(padding: const EdgeInsets.all(20), child: Text(s.smAppNoMatch, textAlign: TextAlign.center, style: MtText.small.copyWith(color: c.text3))),
          ],
          if (q.isEmpty && folders.isNotEmpty) ...[
            MtSectionTitle(s.smAppFolders, count: folders.length),
            const SizedBox(height: 10),
            Wrap(spacing: 16, runSpacing: 16, children: [
              for (final f in folders) SizedBox(width: cardW, child: _FolderCard(folder: f, count: all.where((x) => x.folderId == f.id).length,
                  onTap: () => setState(() => _folderId = f.id), onMenu: (p) => _folderMenu(f, p))),
            ]),
            const SizedBox(height: 22),
          ],
          if (q.isEmpty) ...[MtSectionTitle(s.smAppConnections, count: conns.length), const SizedBox(height: 10)],
          if (q.isEmpty && all.isEmpty && folders.isEmpty)
            _Welcome(onNew: () => _edit(null))
          else
            Wrap(spacing: 16, runSpacing: 16, children: [
              for (final x in conns) SizedBox(width: cardW, child: _ConnCard(conn: x, onTap: () => _open(x), onMenu: (p) => _connMenu(x, p), onEdit: () => _edit(x))),
              if (q.isEmpty) SizedBox(width: cardW, child: _NewCard(onTap: () => _edit(null))),
            ]),
        ])),
      ]))),
      floatingActionButton: phone
          ? FloatingActionButton.extended(backgroundColor: Colors.transparent, elevation: 0, onPressed: () => _edit(null),
              label: MtButton(label: s.smAppNewConn, icon: Icons.add, kind: MtBtnKind.primary, height: 44, onPressed: () => _edit(null)))
          : null,
    );
  }
}

class _SyncDot extends StatelessWidget {
  const _SyncDot({required this.engine});
  final SyncEngine engine;
  @override
  Widget build(BuildContext context) {
    final c = MtColors.of(context);
    final s = MtStrings.of(context);
    final (Color color, String label) = switch (engine.state) {
      SyncState.syncing => (c.accent, s.syncSyncing),
      SyncState.offline => (c.warn, s.syncOffline),
      SyncState.error => (c.err, engine.error == 'decrypt_failed' ? s.syncErrDecrypt : s.syncError(engine.error ?? '')),
      SyncState.off => (c.text3, s.syncOff),
      SyncState.idle => (c.ok, s.acctSyncToggle),
    };
    return Tooltip(message: label, child: engine.state == SyncState.syncing
        ? MtSpinner(size: 14, color: color)
        : Icon(engine.state == SyncState.idle ? Icons.cloud_done_outlined : Icons.cloud_off_outlined, size: 18, color: color));
  }
}

class _ConnCard extends StatelessWidget {
  const _ConnCard({required this.conn, required this.onTap, required this.onMenu, required this.onEdit});
  final SshConnection conn;
  final VoidCallback onTap, onEdit;
  final ValueChanged<Offset> onMenu;
  @override
  Widget build(BuildContext context) {
    final s = MtStrings.of(context);
    final c = MtColors.of(context);
    final col = conn.colorValue;
    return GestureDetector(
      onLongPressStart: (d) => onMenu(d.globalPosition),
      onSecondaryTapDown: (d) => onMenu(d.globalPosition),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          borderRadius: BorderRadius.circular(MtDim.radiusCard), onTap: onTap,
          child: Container(
            height: 132, clipBehavior: Clip.antiAlias,
            decoration: BoxDecoration(gradient: c.cardGrad, borderRadius: BorderRadius.circular(MtDim.radiusCard), border: Border.all(color: c.border)),
            child: Stack(children: [
              PositionedDirectional(start: 0, top: 0, bottom: 0, child: Container(width: 4, color: col)),
              PositionedDirectional(end: -40, top: -40, child: Container(width: 120, height: 120, decoration: BoxDecoration(shape: BoxShape.circle, color: col.withValues(alpha: .06)))),
              Padding(
                padding: const EdgeInsetsDirectional.fromSTEB(20, 16, 16, 14),
                child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                  Row(crossAxisAlignment: CrossAxisAlignment.start, children: [
                    Container(width: 36, height: 36, decoration: BoxDecoration(color: col.withValues(alpha: .18), borderRadius: BorderRadius.circular(10)), child: Icon(Icons.dns_outlined, size: 19, color: col)),
                    const SizedBox(width: 12),
                    Expanded(child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                      Text(conn.name.isEmpty ? conn.host : conn.name, maxLines: 1, overflow: TextOverflow.ellipsis, style: MtText.cardTitle.copyWith(color: c.text)),
                      const SizedBox(height: 3),
                      Text('${conn.username}@${conn.host}:${conn.port}', maxLines: 1, overflow: TextOverflow.ellipsis, textDirection: TextDirection.ltr, style: MtText.mono.copyWith(color: c.text2)),
                    ])),
                    MtIconButton(icon: Icons.edit_outlined, onPressed: onEdit, tooltip: s.commonEdit),
                  ]),
                  const Spacer(),
                  Wrap(spacing: 6, children: [
                    if (conn.authType == 'key') _tag(c, Icons.key, s.smAppKeyTag),
                    if (conn.rememberLastDir && conn.lastDir.isNotEmpty) _tag(c, Icons.folder_open, s.smAppLastDirTag),
                    _tag(c, Icons.palette_outlined, kSshThemes[conn.theme]?.$1 ?? conn.theme),
                  ]),
                ]),
              ),
            ]),
          ),
        ),
      ),
    );
  }

  Widget _tag(MtColors c, IconData i, String t) => Container(
        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 3),
        decoration: BoxDecoration(color: c.surface2, borderRadius: BorderRadius.circular(20), border: Border.all(color: c.border)),
        child: Row(mainAxisSize: MainAxisSize.min, children: [Icon(i, size: 12, color: c.text2), const SizedBox(width: 4), Text(t, style: TextStyle(fontSize: 11, color: c.text2))]),
      );
}

class _FolderCard extends StatelessWidget {
  const _FolderCard({required this.folder, required this.count, required this.onTap, required this.onMenu});
  final SshFolder folder;
  final int count;
  final VoidCallback onTap;
  final ValueChanged<Offset> onMenu;
  @override
  Widget build(BuildContext context) {
    final s = MtStrings.of(context);
    final c = MtColors.of(context);
    const col = Color(0xFFFBBF24);
    return GestureDetector(
      onLongPressStart: (d) => onMenu(d.globalPosition),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          borderRadius: BorderRadius.circular(MtDim.radiusCard), onTap: onTap,
          child: Container(
            height: 84, padding: const EdgeInsets.symmetric(horizontal: 16),
            decoration: BoxDecoration(gradient: c.cardGrad, borderRadius: BorderRadius.circular(MtDim.radiusCard), border: Border.all(color: c.border)),
            child: Row(children: [
              Container(width: 36, height: 36, decoration: BoxDecoration(color: col.withValues(alpha: .18), borderRadius: BorderRadius.circular(10)), child: const Icon(Icons.folder, size: 19, color: col)),
              const SizedBox(width: 12),
              Expanded(child: Column(mainAxisAlignment: MainAxisAlignment.center, crossAxisAlignment: CrossAxisAlignment.start, children: [
                Text(folder.name, maxLines: 1, overflow: TextOverflow.ellipsis, style: MtText.cardTitle.copyWith(color: c.text)),
                const SizedBox(height: 3),
                Text(s.smAppFolderCount(count.toString()), style: MtText.small.copyWith(color: c.text2)),
              ])),
              Icon(Icons.chevron_right, color: c.text3),
            ]),
          ),
        ),
      ),
    );
  }
}

class _NewCard extends StatelessWidget {
  const _NewCard({required this.onTap});
  final VoidCallback onTap;
  @override
  Widget build(BuildContext context) {
    final s = MtStrings.of(context);
    final c = MtColors.of(context);
    return Material(
      color: Colors.transparent,
      child: InkWell(
        borderRadius: BorderRadius.circular(MtDim.radiusCard), onTap: onTap,
        child: CustomPaint(
          painter: _DashedBorder(color: c.borderStrong, radius: MtDim.radiusCard),
          child: SizedBox(height: 132, child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
            Container(width: 40, height: 40, decoration: BoxDecoration(gradient: MtColors.grad, borderRadius: BorderRadius.circular(12)), child: const Icon(Icons.add, color: MtColors.onAccent, size: 22)),
            const SizedBox(height: 10),
            Text(s.commonNew, style: MtText.body.copyWith(color: c.text, fontWeight: FontWeight.w600)),
          ])),
        ),
      ),
    );
  }
}

class _Welcome extends StatelessWidget {
  const _Welcome({required this.onNew});
  final VoidCallback onNew;
  @override
  Widget build(BuildContext context) {
    final s = MtStrings.of(context);
    final c = MtColors.of(context);
    return Center(child: ConstrainedBox(constraints: const BoxConstraints(maxWidth: 300), child: Material(
      color: Colors.transparent,
      child: InkWell(
        borderRadius: BorderRadius.circular(MtDim.radiusCard), onTap: onNew,
        child: CustomPaint(
          painter: _DashedBorder(color: c.borderStrong, radius: MtDim.radiusCard),
          child: SizedBox(height: 210, child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
            Container(width: 56, height: 56, decoration: BoxDecoration(gradient: MtColors.grad, borderRadius: BorderRadius.circular(16)), child: const Icon(Icons.add, color: MtColors.onAccent, size: 30)),
            const SizedBox(height: 14),
            Text(s.smAppWelcome, style: TextStyle(fontSize: 17, fontWeight: FontWeight.w600, color: c.text)),
            const SizedBox(height: 6),
            Padding(padding: const EdgeInsets.symmetric(horizontal: 20), child: Text(s.smAppWelcomeHint, textAlign: TextAlign.center, style: MtText.small.copyWith(color: c.text3))),
          ])),
        ),
      ),
    )));
  }
}

class _DashedBorder extends CustomPainter {
  _DashedBorder({required this.color, required this.radius});
  final Color color;
  final double radius;
  @override
  void paint(Canvas canvas, Size size) {
    final p = Paint()..color = color..style = PaintingStyle.stroke..strokeWidth = 1.5;
    final path = Path()..addRRect(RRect.fromRectAndRadius(Offset.zero & size, Radius.circular(radius)));
    const dash = 6.0, gap = 5.0;
    for (final m in path.computeMetrics()) {
      var d = 0.0;
      while (d < m.length) {
        canvas.drawPath(m.extractPath(d, d + dash), p);
        d += dash + gap;
      }
    }
  }

  @override
  bool shouldRepaint(_DashedBorder old) => old.color != color;
}
