// Ortak kitaplık ekranı — Mastertool uygulamalarının ana penceresi (SSH Master app.css birebir): üst çubukta arama (38 px),
// "Yeni klasör" ve geçişli "Yeni …" düğmeleri; gezinti yolu; "KLASÖRLER" (84 px yatay kart) ve öğe kartları (132 px, solda 4 px
// renk şeridi, 36 px avatar, ad 14.5/600, mono alt satır, etiket hapları); kesik kenarlıklı "Yeni" kartı; karşılama boş durumu.
// Uzun basma menüsü: Bağlan/Aç · Düzenle · Kopyasını oluştur · Klasöre taşı · (ek) · Sil. Klasör: Yeniden adlandır · Burada yeni · Sil.
// Modüller LibraryAdapter ile metinleri, kart içeriğini ve eylemleri verir; veri kaynağı SyncEngine.library (kind: öğe / folder).
import 'package:flutter/material.dart';

import '../core/l10n/gen/mt_strings.dart';
import '../core/sync.dart';
import '../core/theme.dart';
import 'mt_widgets.dart';

class LibraryTexts {
  const LibraryTexts({required this.title, required this.searchPh, required this.newItem, required this.items, required this.welcome,
      required this.welcomeHint, required this.noMatch, required this.stats, required this.folderCount, required this.deleteItem,
      required this.deleteItemMsg, required this.newHere, required this.results, this.all});
  final String title, searchPh, newItem, items, welcome, welcomeHint, noMatch, deleteItem, newHere;
  /// Gezinti yolu kökü ("Tüm bağlantılar" / "Tüm siteler" / "Tüm projeler"); verilmezse SSH metni.
  final String? all;
  final String Function(String count, String folders) stats;
  final String Function(String n) folderCount;
  final String Function(String name, String target) deleteItemMsg;
  final String Function(String q) results;
}

class LibraryItem {
  LibraryItem({required this.id, required this.name, required this.subtitle, required this.color, required this.icon, this.tags = const [], this.folderId});
  final String id, name, subtitle;
  final Color color;
  final IconData icon;
  final List<(IconData, String)> tags;
  final String? folderId;
}

class LibraryAdapter {
  const LibraryAdapter({required this.app, required this.kind, required this.texts, required this.appIcon, required this.toItem,
      required this.onOpen, required this.onEdit, this.extraMenu = const [], this.onExtra, this.copySuffix = ' (kopya)'});
  final String app, kind, appIcon, copySuffix;
  final LibraryTexts texts;
  final LibraryItem Function(String id, Map<String, dynamic> data) toItem;
  final void Function(BuildContext ctx, String id, Map<String, dynamic> data) onOpen;
  /// Düzenleme ekranını açar; (veri, bağlan?) döner, iptalde null.
  final Future<(Map<String, dynamic>, bool)?> Function(BuildContext ctx, String? id, Map<String, dynamic>? data, List<(String, String)> folders, String? folderId) onEdit;
  final List<(String, IconData, String)> extraMenu; // (anahtar, simge, etiket)
  final Future<void> Function(BuildContext ctx, String key, String id, Map<String, dynamic> data)? onExtra;
}

class LibraryScreen extends StatefulWidget {
  const LibraryScreen({super.key, required this.engine, required this.adapter});
  final SyncEngine engine;
  final LibraryAdapter adapter;
  @override
  State<LibraryScreen> createState() => _LibraryScreenState();
}

class _LibraryScreenState extends State<LibraryScreen> {
  String? _folderId;
  String _q = '';
  final _search = TextEditingController();
  LocalLibrary get lib => widget.engine.library;
  LibraryAdapter get ad => widget.adapter;

  @override
  void initState() {
    super.initState();
    widget.engine.addListener(_refresh);
  }

  @override
  void dispose() {
    widget.engine.removeListener(_refresh);
    _search.dispose();
    super.dispose();
  }

  void _refresh() => setState(() {});

  List<(String, Map<String, dynamic>)> get _rawItems => [for (final e in lib.items.entries) if (e.value.$1 == ad.kind) (e.key, e.value.$2)];
  List<(String, Map<String, dynamic>)> get _rawFolders => [for (final e in lib.items.entries) if (e.value.$1 == 'folder') (e.key, e.value.$2)];
  int _cmp(String a, String b) => a.toLowerCase().compareTo(b.toLowerCase());

  Future<void> _save(String id, String kind, Map<String, dynamic> data) async {
    lib.items[id] = (kind, data);
    setState(() {});
    await widget.engine.onLocalChange();
  }

  Future<void> _delete(String id) async {
    lib.items.remove(id);
    setState(() {});
    await widget.engine.onLocalChange();
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

  Future<bool> _confirm(String title, String msg) async {
    final s = MtStrings.of(context);
    return await showDialog<bool>(
          context: context,
          builder: (ctx) => AlertDialog(
            title: Text(title), content: Text(msg), actionsPadding: const EdgeInsets.fromLTRB(22, 0, 22, 18),
            actions: [MtButton(label: s.commonCancel, onPressed: () => Navigator.pop(ctx, false)), MtButton(label: s.commonDelete, kind: MtBtnKind.dangerPrimary, onPressed: () => Navigator.pop(ctx, true))],
          ),
        ) ??
        false;
  }

  List<(String, String)> get _folderChoices => (_rawFolders.map((f) => (f.$1, (f.$2['name'] ?? '').toString())).toList()..sort((a, b) => _cmp(a.$2, b.$2)));

  Future<void> _edit(String? id, Map<String, dynamic>? data, {String? folderId}) async {
    final r = await ad.onEdit(context, id, data, _folderChoices, folderId ?? data?['folderId'] as String? ?? _folderId);
    if (r == null || !mounted) return;
    final nid = id ?? newItemId();
    await _save(nid, ad.kind, r.$1);
    if (r.$2 && mounted) ad.onOpen(context, nid, r.$1);
  }

  Future<void> _newFolder() async {
    final s = MtStrings.of(context);
    final name = await _askText(s.smAppNewSubfolder, s.smAppFolderPh);
    if (name == null || name.trim().isEmpty) return;
    await _save(newItemId(), 'folder', {'name': name.trim(), 'parentId': _folderId});
  }

  Future<void> _itemMenu(String id, Map<String, dynamic> data, LibraryItem it, Offset pos) async {
    final s = MtStrings.of(context);
    final c = MtColors.of(context);
    Widget mi(IconData i, String t, {bool danger = false}) => Row(children: [Icon(i, size: 16, color: danger ? c.err : null), const SizedBox(width: 10), Text(t)]);
    final r = await showMenu<String>(context: context, position: RelativeRect.fromLTRB(pos.dx, pos.dy, pos.dx, pos.dy), items: [
      PopupMenuItem(value: 'open', child: mi(Icons.play_arrow, s.commonConnect)),
      PopupMenuItem(value: 'edit', child: mi(Icons.edit_outlined, s.commonEdit)),
      PopupMenuItem(value: 'dup', child: mi(Icons.copy_outlined, s.smAppDuplicate)),
      PopupMenuItem(value: 'move', child: mi(Icons.drive_file_move_outlined, s.smAppMoveToFolder)),
      for (final x in ad.extraMenu) PopupMenuItem(value: 'x:${x.$1}', child: mi(x.$2, x.$3)),
      const PopupMenuDivider(),
      PopupMenuItem(value: 'del', child: mi(Icons.delete_outline, ad.texts.deleteItem, danger: true)),
    ]);
    if (!mounted || r == null) return;
    switch (r) {
      case 'open': ad.onOpen(context, id, data);
      case 'edit': await _edit(id, data);
      case 'dup': await _save(newItemId(), ad.kind, {...data, 'name': '${it.name}${ad.copySuffix}', 'createdAt': DateTime.now().millisecondsSinceEpoch});
      case 'move': await _move(id, data, it);
      case 'del':
        if (await _confirm(ad.texts.deleteItem, _plain(ad.texts.deleteItemMsg(it.name, it.subtitle)))) await _delete(id);
      default:
        if (r.startsWith('x:')) await ad.onExtra?.call(context, r.substring(2), id, data);
    }
  }

  Future<void> _folderMenu(String id, Map<String, dynamic> f, Offset pos) async {
    final s = MtStrings.of(context);
    final c = MtColors.of(context);
    Widget mi(IconData i, String t, {bool danger = false}) => Row(children: [Icon(i, size: 16, color: danger ? c.err : null), const SizedBox(width: 10), Text(t)]);
    final r = await showMenu<String>(context: context, position: RelativeRect.fromLTRB(pos.dx, pos.dy, pos.dx, pos.dy), items: [
      PopupMenuItem(value: 'rename', child: mi(Icons.drive_file_rename_outline, s.smAppRenameFolder)),
      PopupMenuItem(value: 'new', child: mi(Icons.add, ad.texts.newHere)),
      const PopupMenuDivider(),
      PopupMenuItem(value: 'del', child: mi(Icons.delete_outline, s.smAppDeleteFolder, danger: true)),
    ]);
    if (!mounted) return;
    final name = (f['name'] ?? '').toString();
    switch (r) {
      case 'rename':
        final n = await _askText(s.smAppRenameFolder, s.smAppFolderPh, initial: name);
        if (n != null && n.trim().isNotEmpty) await _save(id, 'folder', {...f, 'name': n.trim()});
      case 'new':
        await _edit(null, null, folderId: id);
      case 'del':
        final inside = _rawItems.where((x) => x.$2['folderId'] == id).length;
        if (await _confirm(s.smAppDeleteFolder, _plain(s.smAppDeleteFolderMsg(name)) + (inside > 0 ? _plain(s.smAppDeleteFolderConns(inside.toString())) : ''))) {
          final parent = f['parentId'];
          for (final x in _rawItems.where((x) => x.$2['folderId'] == id)) {
            lib.items[x.$1] = (ad.kind, {...x.$2, 'folderId': parent});
          }
          for (final sub in _rawFolders.where((x) => x.$2['parentId'] == id)) {
            lib.items[sub.$1] = ('folder', {...sub.$2, 'parentId': parent});
          }
          await _delete(id);
        }
    }
  }

  Future<void> _move(String id, Map<String, dynamic> data, LibraryItem it) async {
    final s = MtStrings.of(context);
    final target = await showDialog<String?>(
      context: context,
      builder: (ctx) => SimpleDialog(title: Text(_plain(s.smAppMoveTitle(it.name))), children: [
        SimpleDialogOption(onPressed: () => Navigator.pop(ctx, ''), child: Text(s.smAppRootFolder)),
        for (final f in _folderChoices) SimpleDialogOption(onPressed: () => Navigator.pop(ctx, f.$1), child: Text(f.$2)),
      ]),
    );
    if (target == null) return;
    await _save(id, ad.kind, {...data, 'folderId': target.isEmpty ? null : target});
    if (mounted) mtToast(context, s.smAppConnMoved, type: 'ok');
  }

  static String _plain(String html) => html.replaceAll(RegExp(r'<[^>]+>'), '');

  @override
  Widget build(BuildContext context) {
    final s = MtStrings.of(context);
    final c = MtColors.of(context);
    final t = ad.texts;
    final w = MediaQuery.sizeOf(context).width;
    final phone = w < 560;
    final padH = phone ? 16.0 : MtDim.contentPadH;
    final folderIds = _rawFolders.map((f) => f.$1).toSet();
    final q = _q.trim().toLowerCase();
    final all = _rawItems.map((x) => (x.$1, x.$2, ad.toItem(x.$1, x.$2))).toList();
    String? eff(String? fid) => fid != null && folderIds.contains(fid) ? fid : null; // yetim klasör bağı köke düşer
    final items = (q.isNotEmpty
        ? all.where((x) => '${x.$3.name} ${x.$3.subtitle}'.toLowerCase().contains(q)).toList()
        : all.where((x) => eff(x.$3.folderId) == _folderId).toList())
      ..sort((a, b) => _cmp(a.$3.name, b.$3.name));
    final folders = q.isNotEmpty ? <(String, Map<String, dynamic>)>[] : (_rawFolders.where((f) => eff(f.$2['parentId'] as String?) == _folderId).toList()
      ..sort((a, b) => _cmp((a.$2['name'] ?? '').toString(), (b.$2['name'] ?? '').toString())));
    final current = _folderId == null ? null : _rawFolders.where((f) => f.$1 == _folderId).firstOrNull;
    final cardMin = phone ? (w - padH * 2) : 230.0;
    final cols = ((w - padH * 2 + 16) / (cardMin + 16)).floor().clamp(1, 6);
    final cardW = (w - padH * 2 - 16 * (cols - 1)) / cols;

    final search = Container(
      height: 38, constraints: const BoxConstraints(maxWidth: 520),
      decoration: BoxDecoration(color: c.surface, border: Border.all(color: c.border), borderRadius: BorderRadius.circular(10)),
      child: TextField(
        controller: _search, onChanged: (v) => setState(() => _q = v), style: MtText.body,
        decoration: InputDecoration(hintText: t.searchPh.replaceAll(RegExp(r'\s*\(Ctrl\+F\)'), ''), prefixIcon: Icon(Icons.search, size: 18, color: c.text3),
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
            AppIcon(ad.appIcon, size: 30),
            const SizedBox(width: 10),
            if (!phone) Text(t.title, style: MtText.brand.copyWith(color: c.text)),
            if (!phone) const SizedBox(width: 20),
            Expanded(child: search),
            const SizedBox(width: 8),
            SyncDot(engine: widget.engine),
            if (!phone) ...[
              const SizedBox(width: 8),
              MtButton(label: s.commonNewFolder, icon: Icons.create_new_folder_outlined, onPressed: _newFolder),
              const SizedBox(width: 8),
              MtButton(label: t.newItem, icon: Icons.add, kind: MtBtnKind.primary, onPressed: () => _edit(null, null)),
            ],
          ]),
        ),
        Expanded(child: ListView(padding: EdgeInsets.fromLTRB(padH, 14, padH, 90), children: [
          Row(children: [
            InkWell(onTap: () => setState(() => _folderId = null), child: Text(t.all ?? s.smAppAll, style: MtText.body.copyWith(color: current == null ? c.text : c.accent, fontWeight: FontWeight.w600))),
            if (current != null) ...[
              Padding(padding: const EdgeInsets.symmetric(horizontal: 6), child: Icon(Icons.chevron_right, size: 16, color: c.text3)),
              Text((current.$2['name'] ?? '').toString(), style: MtText.body.copyWith(color: c.text, fontWeight: FontWeight.w600)),
            ],
            const Spacer(),
            Text(t.stats(all.length.toString(), _rawFolders.length.toString()), style: MtText.small.copyWith(color: c.text3)),
            if (phone) ...[const SizedBox(width: 6), MtIconButton(icon: Icons.create_new_folder_outlined, tooltip: s.commonNewFolder, onPressed: _newFolder)],
          ]),
          const SizedBox(height: 14),
          if (q.isNotEmpty) ...[
            MtSectionTitle(_plain(t.results(_q)), count: items.length),
            const SizedBox(height: 10),
            if (items.isEmpty) Padding(padding: const EdgeInsets.all(20), child: Text(t.noMatch, textAlign: TextAlign.center, style: MtText.small.copyWith(color: c.text3))),
          ],
          if (q.isEmpty && folders.isNotEmpty) ...[
            MtSectionTitle(s.smAppFolders, count: folders.length),
            const SizedBox(height: 10),
            Wrap(spacing: 16, runSpacing: 16, children: [
              for (final f in folders) SizedBox(width: cardW, child: FolderCard(name: (f.$2['name'] ?? '').toString(),
                  sub: t.folderCount(all.where((x) => x.$3.folderId == f.$1).length.toString()),
                  onTap: () => setState(() => _folderId = f.$1), onMenu: (p) => _folderMenu(f.$1, f.$2, p))),
            ]),
            const SizedBox(height: 22),
          ],
          if (q.isEmpty) ...[MtSectionTitle(t.items, count: items.length), const SizedBox(height: 10)],
          if (q.isEmpty && all.isEmpty && folders.isEmpty)
            WelcomeCard(title: t.welcome, hint: t.welcomeHint, onTap: () => _edit(null, null))
          else
            Wrap(spacing: 16, runSpacing: 16, children: [
              for (final x in items) SizedBox(width: cardW, child: ItemCard(item: x.$3, onTap: () => ad.onOpen(context, x.$1, x.$2),
                  onMenu: (p) => _itemMenu(x.$1, x.$2, x.$3, p), onEdit: () => _edit(x.$1, x.$2))),
              if (q.isEmpty) SizedBox(width: cardW, child: NewCard(onTap: () => _edit(null, null))),
            ]),
        ])),
      ]))),
      floatingActionButton: phone
          ? MtButton(label: t.newItem, icon: Icons.add, kind: MtBtnKind.primary, height: 44, onPressed: () => _edit(null, null))
          : null,
    );
  }
}

class SyncDot extends StatelessWidget {
  const SyncDot({super.key, required this.engine});
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

class ItemCard extends StatelessWidget {
  const ItemCard({super.key, required this.item, required this.onTap, required this.onMenu, required this.onEdit});
  final LibraryItem item;
  final VoidCallback onTap, onEdit;
  final ValueChanged<Offset> onMenu;
  @override
  Widget build(BuildContext context) {
    final s = MtStrings.of(context);
    final c = MtColors.of(context);
    final col = item.color;
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
                    Container(width: 36, height: 36, decoration: BoxDecoration(color: col.withValues(alpha: .18), borderRadius: BorderRadius.circular(10)), child: Icon(item.icon, size: 19, color: col)),
                    const SizedBox(width: 12),
                    Expanded(child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                      Text(item.name, maxLines: 1, overflow: TextOverflow.ellipsis, style: MtText.cardTitle.copyWith(color: c.text)),
                      const SizedBox(height: 3),
                      Text(item.subtitle, maxLines: 1, overflow: TextOverflow.ellipsis, textDirection: TextDirection.ltr, style: MtText.mono.copyWith(color: c.text2)),
                    ])),
                    MtIconButton(icon: Icons.edit_outlined, onPressed: onEdit, tooltip: s.commonEdit),
                  ]),
                  const Spacer(),
                  Wrap(spacing: 6, runSpacing: 4, children: [for (final tg in item.tags) _tag(c, tg.$1, tg.$2)]),
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

class FolderCard extends StatelessWidget {
  const FolderCard({super.key, required this.name, required this.sub, required this.onTap, required this.onMenu});
  final String name, sub;
  final VoidCallback onTap;
  final ValueChanged<Offset> onMenu;
  @override
  Widget build(BuildContext context) {
    final c = MtColors.of(context);
    const col = Color(0xFFFBBF24);
    return GestureDetector(
      onLongPressStart: (d) => onMenu(d.globalPosition),
      onSecondaryTapDown: (d) => onMenu(d.globalPosition),
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
                Text(name, maxLines: 1, overflow: TextOverflow.ellipsis, style: MtText.cardTitle.copyWith(color: c.text)),
                const SizedBox(height: 3),
                Text(sub, style: MtText.small.copyWith(color: c.text2)),
              ])),
              Icon(Icons.chevron_right, color: c.text3),
            ]),
          ),
        ),
      ),
    );
  }
}

class NewCard extends StatelessWidget {
  const NewCard({super.key, required this.onTap});
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
          painter: DashedBorder(color: c.borderStrong, radius: MtDim.radiusCard),
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

class WelcomeCard extends StatelessWidget {
  const WelcomeCard({super.key, required this.title, required this.hint, required this.onTap});
  final String title, hint;
  final VoidCallback onTap;
  @override
  Widget build(BuildContext context) {
    final c = MtColors.of(context);
    return Center(child: ConstrainedBox(constraints: const BoxConstraints(maxWidth: 300), child: Material(
      color: Colors.transparent,
      child: InkWell(
        borderRadius: BorderRadius.circular(MtDim.radiusCard), onTap: onTap,
        child: CustomPaint(
          painter: DashedBorder(color: c.borderStrong, radius: MtDim.radiusCard),
          child: SizedBox(height: 210, child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
            Container(width: 56, height: 56, decoration: BoxDecoration(gradient: MtColors.grad, borderRadius: BorderRadius.circular(16)), child: const Icon(Icons.add, color: MtColors.onAccent, size: 30)),
            const SizedBox(height: 14),
            Text(title, style: TextStyle(fontSize: 17, fontWeight: FontWeight.w600, color: c.text)),
            const SizedBox(height: 6),
            Padding(padding: const EdgeInsets.symmetric(horizontal: 20), child: Text(hint, textAlign: TextAlign.center, style: MtText.small.copyWith(color: c.text3))),
          ])),
        ),
      ),
    )));
  }
}

class DashedBorder extends CustomPainter {
  DashedBorder({required this.color, required this.radius});
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
  bool shouldRepaint(DashedBorder old) => old.color != color;
}
