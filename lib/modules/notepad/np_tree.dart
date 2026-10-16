// Proje penceresinin solundaki klasör/dosya ağacı (masaüstü tree.js): klasörler açıldıkça (tembel) listelenir.
// Satır 26 px, girinti 8 + derinlik × 14, chevron, sarı klasör simgesi, uzantı renkli dosya simgesi; seçili satır accent %12,
// açık dosya adı accent renkli. Uzun basma: bağlam menüsü (yeni dosya / klasör / yeniden adlandır / sil).
import 'package:flutter/material.dart';

import '../../core/l10n/gen/mt_strings.dart';
import '../../core/theme.dart';
import '../../widgets/mt_widgets.dart';
import 'np_model.dart';
import 'np_remote.dart';

class NpNode {
  NpNode({required this.path, required this.name, required this.isDir, this.isLink = false, this.size = 0, this.mtime = 0, this.parent, this.depth = 0});
  final String path, name;
  bool isDir;
  final bool isLink;
  int size, mtime;
  NpNode? parent;
  int depth;
  List<NpNode>? children;
  bool expanded = false, loading = false;
  String? error;
}

class NpTreeController extends ChangeNotifier {
  NpTreeController({required this.list, required this.filter});
  final Future<List<NpEntry>> Function(String dir) list;
  bool Function(String name) filter;
  final Map<String, NpNode> nodes = {};
  NpNode? root;
  String? selected;
  String? Function(String path)? errorText;

  Future<void> setRoot(String path, String label) {
    nodes.clear();
    root = NpNode(path: path, name: label, isDir: true, depth: -1)..expanded = true;
    nodes[path] = root!;
    return load(root!);
  }

  int _cmp(NpNode a, NpNode b) => a.isDir != b.isDir ? (a.isDir ? -1 : 1) : a.name.toLowerCase().compareTo(b.name.toLowerCase());

  Future<void> load(NpNode node) async {
    node.loading = true;
    node.error = null;
    notifyListeners();
    try {
      final items = await list(node.path);
      final old = {for (final c in node.children ?? const <NpNode>[]) c.path: c};
      node.children = [
        for (final it in items.where((it) => filter(it.name)))
          (old[it.path]?..size = it.size..mtime = it.mtime..isDir = it.isDir) ??
              NpNode(path: it.path, name: it.name, isDir: it.isDir, isLink: it.isLink, size: it.size, mtime: it.mtime),
      ]..sort(_cmp);
      for (final n in node.children!) {
        n.parent = node;
        n.depth = node.depth + 1;
        nodes[n.path] = n;
      }
      for (final p in old.keys) {
        if (!node.children!.any((c) => c.path == p)) _forget(old[p]!);
      }
    } catch (e) {
      node.error = errorText?.call(e.toString()) ?? e.toString();
    }
    node.loading = false;
    notifyListeners();
  }

  void _forget(NpNode n) {
    nodes.remove(n.path);
    for (final c in n.children ?? const <NpNode>[]) {
      _forget(c);
    }
  }

  Future<void> toggle(NpNode n, [bool? open]) async {
    if (!n.isDir) return;
    n.expanded = open ?? !n.expanded;
    if (n.expanded && n.children == null) {
      await load(n);
    } else {
      notifyListeners();
    }
  }

  /// Bir klasörü yeniden listele (açık alt klasörler korunur ve onlar da yenilenir)
  Future<void> refresh([String? path]) async {
    final n = (path == null ? null : nodes[path]) ?? root;
    if (n == null || !n.isDir) return;
    await load(n);
    await Future.wait([for (final c in n.children ?? const <NpNode>[]) if (c.isDir && c.expanded && c.children != null) refresh(c.path)]);
  }

  /// Yolu görünür yap: kökten itibaren klasörleri aç
  Future<void> reveal(String path) async {
    final r = root;
    if (r == null) return;
    final chain = <String>[];
    var p = path;
    while (p.isNotEmpty && p != r.path && chain.length < 64) {
      chain.insert(0, p);
      final up = npDirName(p);
      if (up == p || up.isEmpty) break;
      p = up;
    }
    var cur = r;
    for (final step in chain) {
      if (cur.children == null) await load(cur);
      cur.expanded = true;
      final next = (cur.children ?? const <NpNode>[]).where((c) => c.path == step).firstOrNull;
      if (next == null) break;
      cur = next;
    }
    selected = cur.path;
    notifyListeners();
  }

  void collapseAll() {
    for (final n in nodes.values) {
      if (n != root) n.expanded = false;
    }
    notifyListeners();
  }

  void select(String? path) {
    selected = path;
    notifyListeners();
  }

  NpNode? get selectedNode => selected == null ? null : nodes[selected];

  /// Seçili düğümün klasörü (yeni dosya/klasör buraya)
  String targetDir() {
    final n = selectedNode;
    if (n == null) return root?.path ?? '/';
    return n.isDir ? n.path : n.parent?.path ?? root!.path;
  }

  List<NpNode> visible() {
    final out = <NpNode>[];
    void walk(NpNode n) {
      for (final c in n.children ?? const <NpNode>[]) {
        out.add(c);
        if (c.isDir && c.expanded) walk(c);
      }
    }
    if (root != null) walk(root!);
    return out;
  }
}

class NpFileTree extends StatelessWidget {
  const NpFileTree({super.key, required this.controller, required this.onOpen, required this.onContext, this.isOpen});
  final NpTreeController controller;
  final ValueChanged<NpNode> onOpen;
  final void Function(NpNode? node, Offset pos) onContext;
  final bool Function(String path)? isOpen;

  @override
  Widget build(BuildContext context) {
    final s = MtStrings.of(context);
    final c = MtColors.of(context);
    return AnimatedBuilder(
      animation: controller,
      builder: (context, _) {
        final root = controller.root;
        if (root == null) return const SizedBox();
        final rows = controller.visible();
        return GestureDetector(
          behavior: HitTestBehavior.translucent,
          onLongPressStart: (d) => onContext(null, d.globalPosition),
          onSecondaryTapDown: (d) => onContext(null, d.globalPosition),
          child: ListView(padding: const EdgeInsets.only(top: 4, bottom: 20), children: [
            if (root.loading && root.children == null) const Padding(padding: EdgeInsets.all(12), child: Center(child: MtSpinner())),
            if (root.error != null) Padding(padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6), child: Text(root.error!, style: MtText.small.copyWith(color: c.err))),
            for (final n in rows) ...[
              _Row(node: n, selected: n.path == controller.selected, open: isOpen?.call(n.path) ?? false,
                  onTap: () { controller.select(n.path); if (n.isDir) { controller.toggle(n); } else { onOpen(n); } },
                  onContext: (p) { controller.select(n.path); onContext(n, p); }),
              if (n.isDir && n.expanded && n.error != null)
                Padding(padding: EdgeInsetsDirectional.only(start: 8 + (n.depth + 1) * 14, end: 12, top: 4, bottom: 4), child: Text(n.error!, style: MtText.small.copyWith(color: c.err))),
              if (n.isDir && n.expanded && n.children != null && n.children!.isEmpty)
                Padding(padding: EdgeInsetsDirectional.only(start: 8 + (n.depth + 1) * 14, top: 4, bottom: 4), child: Text(s.npTreeEmpty, style: MtText.small.copyWith(color: c.text3))),
            ],
            if (root.children != null && root.children!.isEmpty) Padding(padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6), child: Text(s.npTreeEmpty, style: MtText.small.copyWith(color: c.text3))),
          ]),
        );
      },
    );
  }
}

class _Row extends StatelessWidget {
  const _Row({required this.node, required this.selected, required this.open, required this.onTap, required this.onContext});
  final NpNode node;
  final bool selected, open;
  final VoidCallback onTap;
  final ValueChanged<Offset> onContext;
  @override
  Widget build(BuildContext context) {
    final c = MtColors.of(context);
    final n = node;
    final fileColor = n.isDir ? const Color(0xFFFBBF24) : (npExtColor(n.name) ?? c.text3);
    return GestureDetector(
      onLongPressStart: (d) => onContext(d.globalPosition),
      onSecondaryTapDown: (d) => onContext(d.globalPosition),
      child: Material(
        color: selected ? c.accent.withValues(alpha: .12) : Colors.transparent,
        child: InkWell(
          onTap: onTap,
          child: Container(
            height: 30, padding: EdgeInsetsDirectional.only(start: 8 + n.depth * 14, end: 8),
            decoration: BoxDecoration(border: BorderDirectional(start: BorderSide(color: selected ? c.accent : Colors.transparent, width: 2))),
            child: Row(children: [
              SizedBox(width: 16, child: n.isDir ? Icon(n.expanded ? Icons.expand_more : Icons.chevron_right, size: 15, color: c.text3) : null),
              const SizedBox(width: 3),
              Icon(n.isDir ? (n.expanded ? Icons.folder_open : Icons.folder) : Icons.insert_drive_file_outlined, size: n.isDir ? 17 : 15, color: fileColor),
              const SizedBox(width: 6),
              Expanded(child: Text(n.name, maxLines: 1, overflow: TextOverflow.ellipsis, textDirection: TextDirection.ltr,
                  style: TextStyle(fontSize: 13, color: open ? c.accent : c.text))),
              if (n.loading) MtSpinner(size: 11, color: c.accent),
            ]),
          ),
        ),
      ),
    );
  }
}
