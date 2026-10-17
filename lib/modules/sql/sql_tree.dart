// "NESNELER" ağacı — masaüstü conn/tree.ts: veritabanı › şema › Tablolar/Görünümler (sayı rozeti) › tablo (~satır) › Kolonlar/
// İndeksler; tembel yükleme, süzme kutusu, "Tümünü daralt", yenile. Tabloya dokununca veri sayfası; uzun basma: Veriyi aç ·
// Burada yeni SQL · Adı kopyala. MySQL/SQLite'ta şema düzeyi atlanır (şema = veritabanı).
// DuckDB: kökte "Dosyalar" düğümü — belgeler dizinindeki (ve seçili dosyanın klasöründeki) CSV/TSV/Parquet/JSON/Excel
// dosyaları; dokununca `SELECT * FROM 'dosya' LIMIT …` ile yeni SQL sekmesi açılır.
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:intl/intl.dart' hide TextDirection;
import 'package:path_provider/path_provider.dart';

import '../../core/l10n/gen/mt_strings.dart';
import '../../core/theme.dart';
import '../../widgets/mt_widgets.dart';
import 'drivers/duckdb_driver.dart';
import 'drivers/sql_driver.dart';
import 'sql_model.dart';
import 'sql_session.dart';

enum NodeKind { database, schema, folder, table, view, column, idx, files, file }

class TreeNode {
  TreeNode({required this.id, required this.kind, required this.name, this.detail, this.count, required this.hasChildren, this.database, this.schema, this.table, this.folder, this.path});
  final String id, name;
  final NodeKind kind;
  String? detail;
  int? count;
  bool hasChildren;
  final String? database, schema, table, folder;
  /// Dosya düğümü: tam yol
  final String? path;
  List<TreeNode>? children;
  bool expanded = false, loading = false;
  String? error;
}

/// Tablo/görünüm açma isteği
typedef OpenTable = void Function(String database, String schema, String table, String kind);

/// Dosya düğümünden üretilen SQL ile yeni sekme isteği
typedef OpenFile = void Function(String sql);

/// Dosya düğümü için önizleme SQL'i
String duckFilePreviewSql(String path, {int limit = 1000}) => 'SELECT *\nFROM ${DuckDbDriver.readerFor(path)}\nLIMIT $limit;';

class SqlTree extends StatefulWidget {
  const SqlTree({super.key, required this.session, required this.onOpenTable, required this.onNewSql, this.onOpenFile, this.selectedId});
  final SqlSession session;
  final OpenTable onOpenTable;
  final void Function(String database) onNewSql;
  final OpenFile? onOpenFile;
  final String? selectedId;
  @override
  State<SqlTree> createState() => SqlTreeState();
}

class SqlTreeState extends State<SqlTree> {
  List<TreeNode>? _roots;
  String? _error;
  String _filter = '';
  final _filterCtl = TextEditingController();
  static final _fmt = NumberFormat.decimalPattern('tr');

  @override
  void initState() {
    super.initState();
    widget.session.addListener(_onSession);
    if (widget.session.connected) reload();
  }

  @override
  void dispose() {
    widget.session.removeListener(_onSession);
    _filterCtl.dispose();
    super.dispose();
  }

  void _onSession() {
    if (widget.session.connected && _roots == null && mounted) reload();
    if (!widget.session.connected && mounted) setState(() => _roots = null);
  }

  Future<void> reload() async {
    final d = widget.session.driver;
    if (d == null) return;
    setState(() { _roots = null; _error = null; });
    try {
      final dbs = await d.databases();
      if (!mounted) return;
      final s = MtStrings.of(context);
      setState(() => _roots = [
            for (final db in dbs) TreeNode(id: 'db:$db', kind: NodeKind.database, name: db, hasChildren: true, database: db),
            if (widget.session.dialect == 'duckdb') TreeNode(id: 'files', kind: NodeKind.files, name: s.sqTreeFiles, hasChildren: true),
          ]);
      if (_roots!.isNotEmpty) await _toggle(_roots!.first);
    } catch (e) {
      if (mounted) setState(() => _error = sqlErrorText(MtStrings.of(context), e));
    }
  }

  void collapseAll() => setState(() {
        void walk(List<TreeNode>? l) {
          for (final n in l ?? const <TreeNode>[]) { n.expanded = false; walk(n.children); }
        }
        walk(_roots);
      });

  Future<void> _toggle(TreeNode n) async {
    if (!n.hasChildren) return;
    if (n.expanded) { setState(() => n.expanded = false); return; }
    setState(() { n.expanded = true; n.error = null; });
    if (n.children != null) return;
    setState(() => n.loading = true);
    try {
      n.children = await _load(n);
    } catch (e) {
      n.error = mounted ? sqlErrorText(MtStrings.of(context), e) : e.toString();
    } finally {
      n.loading = false;
      if (mounted) setState(() {});
    }
  }

  Future<List<TreeNode>> _load(TreeNode n) async {
    final d = widget.session.driver!;
    final s = MtStrings.of(context);
    switch (n.kind) {
      case NodeKind.database:
        final schemas = await d.schemas(n.database!);
        if (schemas.length == 1 && schemas.first == n.database) return _tableFolders(n.database!, schemas.first, n.id, s);
        return [for (final sc in schemas) TreeNode(id: '${n.id}/s:$sc', kind: NodeKind.schema, name: sc, hasChildren: true, database: n.database, schema: sc)];
      case NodeKind.schema:
        return _tableFolders(n.database!, n.schema!, n.id, s);
      case NodeKind.folder:
        if (n.table != null) {
          if (n.folder == 'columns') {
            final cols = await d.columns(n.database!, n.schema!, n.table!);
            n.count = cols.length;
            return [for (final c in cols) TreeNode(id: '${n.id}/c:${c.name}', kind: NodeKind.column, name: c.name, detail: '${c.type}${c.notNull ? ' NOT NULL' : ''}${c.pk ? ' · PK' : ''}', hasChildren: false)];
          }
          final idx = await d.indexes(n.database!, n.schema!, n.table!);
          n.count = idx.length;
          return [for (final i in idx) TreeNode(id: '${n.id}/i:${i.name}', kind: NodeKind.idx, name: i.name, detail: i.detail, hasChildren: false)];
        }
        return const [];
      case NodeKind.table:
      case NodeKind.view:
        return [
          TreeNode(id: '${n.id}/f:columns', kind: NodeKind.folder, name: s.sqTreeColumns, hasChildren: true, database: n.database, schema: n.schema, table: n.name, folder: 'columns'),
          if (n.kind == NodeKind.table) TreeNode(id: '${n.id}/f:indexes', kind: NodeKind.folder, name: s.sqTreeIndexes, hasChildren: true, database: n.database, schema: n.schema, table: n.name, folder: 'indexes'),
        ];
      case NodeKind.files:
        final list = await _dataFiles();
        n.count = list.length;
        return [for (final f in list) TreeNode(id: 'file:${f.path}', kind: NodeKind.file, name: f.path.split(RegExp(r'[\\/]')).last, detail: _size(f.lengthSync()), hasChildren: false, path: f.path)];
      default:
        return const [];
    }
  }

  /// Belgeler dizini + seçili veri dosyasının klasöründeki doğrudan sorgulanabilir dosyalar
  Future<List<File>> _dataFiles() async {
    final dirs = <String>{};
    try {
      dirs.add('${(await getApplicationDocumentsDirectory()).path}/$kSqlDocsSubdir');
    } catch (_) {/* platform kanalı yok (test) */}
    final sel = widget.session.conn.filePath.trim();
    if (sel.isNotEmpty) dirs.add(File(sel).parent.path);
    final out = <File>[];
    final seen = <String>{};
    for (final d in dirs) {
      final dir = Directory(d);
      if (!dir.existsSync()) continue;
      for (final e in dir.listSync()) {
        if (e is File && DuckDbDriver.isDataFile(e.path) && seen.add(e.path)) out.add(e);
      }
    }
    out.sort((a, b) => a.path.toLowerCase().compareTo(b.path.toLowerCase()));
    return out;
  }

  static String _size(int n) => n < 1024 ? '$n B' : n < 1024 * 1024 ? '${(n / 1024).toStringAsFixed(n < 10240 ? 1 : 0)} KB' : '${(n / (1024 * 1024)).toStringAsFixed(1)} MB';

  Future<List<TreeNode>> _tableFolders(String db, String schema, String baseId, MtStrings s) async {
    final list = await widget.session.driver!.tables(db, schema);
    TreeNode mk(TableInfo t) => TreeNode(id: '$baseId/${t.kind}:${t.name}', kind: t.kind == 'view' ? NodeKind.view : NodeKind.table, name: t.name,
        detail: t.rowEstimate != null ? '~${_fmt.format(t.rowEstimate)}' : null, hasChildren: true, database: db, schema: schema);
    final tables = list.where((t) => t.kind == 'table').map(mk).toList(), views = list.where((t) => t.kind == 'view').map(mk).toList();
    return [
      TreeNode(id: '$baseId/f:tables', kind: NodeKind.folder, name: s.sqTreeTables, count: tables.length, hasChildren: tables.isNotEmpty, database: db, schema: schema, folder: 'tables')..children = tables..expanded = true,
      TreeNode(id: '$baseId/f:views', kind: NodeKind.folder, name: s.sqTreeViews, count: views.length, hasChildren: views.isNotEmpty, database: db, schema: schema, folder: 'views')..children = views,
    ];
  }

  Future<void> _menu(TreeNode n, Offset pos) async {
    final s = MtStrings.of(context);
    final c = MtColors.of(context);
    Widget mi(IconData i, String t) => Row(children: [Icon(i, size: 16, color: c.text2), const SizedBox(width: 10), Text(t)]);
    final isData = n.kind == NodeKind.table || n.kind == NodeKind.view;
    final isFile = n.kind == NodeKind.file && n.path != null;
    final r = await showMenu<String>(context: context, position: RelativeRect.fromLTRB(pos.dx, pos.dy, pos.dx, pos.dy), items: [
      if (isData) PopupMenuItem(value: 'data', child: mi(Icons.table_chart_outlined, s.sqCwOpenData)),
      if (isFile && widget.onOpenFile != null) PopupMenuItem(value: 'file', child: mi(Icons.code, s.sqCwNewSqlHere)),
      if (n.database != null) PopupMenuItem(value: 'sql', child: mi(Icons.code, s.sqCwNewSqlHere)),
      PopupMenuItem(value: 'copy', child: mi(Icons.copy_outlined, s.sqCwCopyName)),
    ]);
    if (!mounted || r == null) return;
    switch (r) {
      case 'data': widget.onOpenTable(n.database!, n.schema ?? n.database!, n.name, n.kind == NodeKind.view ? 'view' : 'table');
      case 'sql': widget.onNewSql(n.database!);
      case 'file': widget.onOpenFile?.call(duckFilePreviewSql(n.path!));
      case 'copy':
        await Clipboard.setData(ClipboardData(text: isFile ? n.path! : n.name));
        if (mounted) mtToast(context, s.sqCwCopied, type: 'ok');
    }
  }

  List<(TreeNode, int)> _flatten() {
    final out = <(TreeNode, int)>[];
    final q = _filter.trim().toLowerCase();
    bool matches(TreeNode n) {
      if (q.isEmpty) return true;
      if (n.name.toLowerCase().contains(q)) return true;
      return (n.children ?? const []).any(matches);
    }
    void walk(List<TreeNode> l, int depth) {
      for (final n in l) {
        if (!matches(n)) continue;
        out.add((n, depth));
        if ((n.expanded || q.isNotEmpty) && n.children != null) walk(n.children!, depth + 1);
      }
    }
    walk(_roots ?? const [], 0);
    return out;
  }

  @override
  Widget build(BuildContext context) {
    final s = MtStrings.of(context);
    final c = MtColors.of(context);
    final rows = _flatten();
    return Column(children: [
      Container(
        height: 34, padding: const EdgeInsetsDirectional.only(start: 12, end: 2),
        decoration: BoxDecoration(border: Border(bottom: BorderSide(color: c.border))),
        child: Row(children: [
          Icon(Icons.storage_outlined, size: 14, color: c.text3), const SizedBox(width: 6),
          Text(s.sqCwObjects.toUpperCase(), style: MtText.section.copyWith(color: c.text3)),
          const Spacer(),
          MtIconButton(icon: Icons.unfold_less, size: 22, tooltip: s.sqCwCollapseAll, onPressed: collapseAll),
          MtIconButton(icon: Icons.refresh, size: 22, tooltip: s.commonRefresh, onPressed: widget.session.connected ? reload : null),
        ]),
      ),
      Padding(
        padding: const EdgeInsets.fromLTRB(10, 8, 10, 6),
        child: SizedBox(height: 30, child: TextField(
          controller: _filterCtl, onChanged: (v) => setState(() => _filter = v), style: MtText.small,
          decoration: InputDecoration(hintText: s.sqCwFilterPh, hintStyle: MtText.small.copyWith(color: c.text3), contentPadding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6), isDense: true),
        )),
      ),
      Expanded(child: _error != null
          ? Padding(padding: const EdgeInsets.all(12), child: MtBox(_error!, kind: MtBoxKind.error, icon: Icons.error_outline))
          : _roots == null
              ? Center(child: widget.session.connected ? const MtSpinner(size: 20) : Text(s.sqCwNotConnected, style: MtText.small.copyWith(color: c.text3)))
              : rows.isEmpty
                  ? Center(child: Text(s.sqCwEmpty, style: MtText.small.copyWith(color: c.text3)))
                  : ListView.builder(itemCount: rows.length, itemExtent: 26, itemBuilder: (_, i) => _row(c, rows[i].$1, rows[i].$2))),
    ]);
  }

  Widget _row(MtColors c, TreeNode n, int depth) {
    final (IconData icon, Color col) = switch (n.kind) {
      NodeKind.database => (Icons.storage_outlined, c.text2),
      NodeKind.schema => (Icons.account_tree_outlined, c.text2),
      NodeKind.folder => (Icons.folder_outlined, const Color(0xFFFBBF24)),
      NodeKind.table => (Icons.table_chart_outlined, c.accent),
      NodeKind.view => (Icons.table_view_outlined, c.ok),
      NodeKind.column => (Icons.view_column_outlined, c.text3),
      NodeKind.idx => (Icons.sort, c.text3),
      NodeKind.files => (Icons.folder_open_outlined, const Color(0xFFFBBF24)),
      NodeKind.file => (Icons.description_outlined, c.accent),
    };
    final isData = n.kind == NodeKind.table || n.kind == NodeKind.view;
    final isFile = n.kind == NodeKind.file && n.path != null;
    final selected = widget.selectedId == n.id;
    return GestureDetector(
      onLongPressStart: (d) => _menu(n, d.globalPosition),
      onSecondaryTapDown: (d) => _menu(n, d.globalPosition),
      child: InkWell(
        onTap: () => isData
            ? widget.onOpenTable(n.database!, n.schema ?? n.database!, n.name, n.kind == NodeKind.view ? 'view' : 'table')
            : isFile
                ? widget.onOpenFile?.call(duckFilePreviewSql(n.path!))
                : _toggle(n),
        child: Container(
          color: selected ? c.accent.withValues(alpha: .12) : null,
          padding: EdgeInsetsDirectional.only(start: 6 + depth * 14.0, end: 8),
          child: Row(children: [
            SizedBox(width: 18, child: n.loading
                ? const Center(child: MtSpinner(size: 11))
                : n.hasChildren
                    ? InkWell(onTap: () => _toggle(n), child: Icon(n.expanded ? Icons.expand_more : Icons.chevron_right, size: 16, color: c.text3))
                    : null),
            Icon(icon, size: 14, color: col), const SizedBox(width: 6),
            Flexible(child: Text(n.name, maxLines: 1, overflow: TextOverflow.ellipsis, textDirection: TextDirection.ltr, style: TextStyle(fontSize: 12.5, color: n.error != null ? c.err : c.text, fontWeight: n.kind == NodeKind.database ? FontWeight.w600 : FontWeight.w400))),
            if (n.count != null) ...[
              const SizedBox(width: 6),
              Container(height: 16, padding: const EdgeInsets.symmetric(horizontal: 6), alignment: Alignment.center,
                  decoration: BoxDecoration(color: c.surface2, borderRadius: BorderRadius.circular(8), border: Border.all(color: c.border)),
                  child: Text('${n.count}', style: TextStyle(fontSize: 10, color: c.text2, fontWeight: FontWeight.w600))),
            ] else if (n.detail != null) ...[
              const SizedBox(width: 6),
              Flexible(child: Text(n.detail!, maxLines: 1, overflow: TextOverflow.ellipsis, style: TextStyle(fontSize: 11, fontFamily: 'monospace', color: c.text3))),
            ],
          ]),
        ),
      ),
    );
  }
}
