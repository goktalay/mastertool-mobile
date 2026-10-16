// Tablo/görünüm verisi — masaüstü conn/dataTab.ts (04-tablo-verisi): araç çubuğu (Yenile, Kolonlar (n/m), Filtre, İlk 100/500/
// 1000/5000/10000 / Tümü, SQL editöründe aç, Dışa aktar), filtre çipleri, üretilen SQL önizlemesi, ızgara (başlıktan sıralama,
// uzun basma: sırala / filtrele / kolonu gizle), durum "İlk 100 kayıt · 10 ms". Telefonda tam sayfa, tablette sekme gövdesi.
import 'package:flutter/material.dart';

import '../../core/l10n/gen/mt_strings.dart';
import '../../core/theme.dart';
import '../../widgets/mt_widgets.dart';
import 'drivers/sql_driver.dart';
import 'sql_dialect.dart';
import 'sql_export.dart';
import 'sql_grid.dart';
import 'sql_grid_query.dart';
import 'sql_session.dart';

class SqlDataTab extends StatefulWidget {
  /// Ekran görüntüsü testleri: süre metni sabit kalsın
  @visibleForTesting
  static int? debugFixedMs;
  const SqlDataTab({super.key, required this.session, required this.database, required this.schema, required this.table, required this.onOpenInEditor, this.standalone = false});
  final SqlSession session;
  final String database, schema, table;
  final void Function(String sql, String database) onOpenInEditor;
  /// Telefon: kendi Scaffold'u ile tam sayfa
  final bool standalone;
  @override
  State<SqlDataTab> createState() => _SqlDataTabState();
}

class _SqlDataTabState extends State<SqlDataTab> {
  late final GridQueryModel _m = GridQueryModel(
      table: TableRef(database: widget.session.dialect == 'mysql' ? widget.database : null, schema: widget.session.dialect == 'mysql' ? null : widget.schema, name: widget.table),
      limit: widget.session.settings.previewRows);
  List<ColumnMeta> _cols = const [];
  List<List<Object?>> _rows = const [];
  bool _loading = false, _truncated = false;
  int _ms = 0;
  String? _error, _sql;
  static const _limits = [100, 500, 1000, 5000, 10000];

  @override
  void initState() {
    super.initState();
    _init();
  }

  Future<void> _init() async {
    final d = widget.session.driver;
    if (d == null) return;
    try {
      final cols = await d.columns(widget.database, widget.schema, widget.table);
      _m.columns = cols.map((c) => c.meta).toList();
    } catch (e) {
      if (mounted) setState(() => _error = sqlErrorText(MtStrings.of(context), e));
      return;
    }
    await _reload();
  }

  Future<void> _reload() async {
    final d = widget.session.driver;
    if (d == null) return;
    final sql = buildGridSelect(_m, widget.session.dialect);
    setState(() { _loading = true; _error = null; _sql = sql; });
    final sw = Stopwatch()..start();
    final rows = <List<Object?>>[];
    var cols = <ColumnMeta>[];
    var truncated = false;
    try {
      await for (final ev in d.query(sql, database: widget.database, limit: _m.limit == null ? widget.session.settings.rowLimit : null)) {
        switch (ev) {
          case QColumns(:final columns): cols = columns;
          case QRows(rows: final part): rows.addAll(part);
          case QEnd(truncated: final t): truncated = t;
          case QCommand(): break;
        }
      }
      if (!mounted) return;
      setState(() { _cols = cols; _rows = rows; _truncated = truncated; _ms = SqlDataTab.debugFixedMs ?? sw.elapsedMilliseconds; _loading = false; });
    } catch (e) {
      if (!mounted) return;
      setState(() { _loading = false; _error = sqlErrorText(MtStrings.of(context), e); });
    }
  }

  void _sort(String column) {
    final cur = _m.sort.firstOrNull;
    if (cur?.column == column) {
      _m.sort = cur!.dir == 'asc' ? [GridSort(column: column, dir: 'desc')] : [];
    } else {
      _m.sort = [GridSort(column: column, dir: 'asc')];
    }
    _reload();
  }

  Future<void> _headerMenu(String column, Offset pos) async {
    final s = MtStrings.of(context);
    final c = MtColors.of(context);
    Widget mi(IconData i, String t) => Row(children: [Icon(i, size: 16, color: c.text2), const SizedBox(width: 10), Text(t)]);
    final r = await showMenu<String>(context: context, position: RelativeRect.fromLTRB(pos.dx, pos.dy, pos.dx, pos.dy), items: [
      PopupMenuItem(value: 'asc', child: mi(Icons.arrow_upward, s.sqDataSortAsc)),
      PopupMenuItem(value: 'desc', child: mi(Icons.arrow_downward, s.sqDataSortDesc)),
      if (_m.sort.isNotEmpty) PopupMenuItem(value: 'nosort', child: mi(Icons.clear, s.sqDataSortClear)),
      const PopupMenuDivider(),
      PopupMenuItem(value: 'filter', child: mi(Icons.filter_alt_outlined, s.sqDataFilterColumn)),
      PopupMenuItem(value: 'null', child: mi(Icons.block, s.sqDataFilterNull)),
      const PopupMenuDivider(),
      PopupMenuItem(value: 'hide', child: mi(Icons.visibility_off_outlined, s.sqDataHideColumn)),
      if (_m.hidden.isNotEmpty) PopupMenuItem(value: 'showall', child: mi(Icons.visibility_outlined, s.sqDataShowAll)),
    ]);
    if (!mounted || r == null) return;
    switch (r) {
      case 'asc': _m.sort = [GridSort(column: column, dir: 'asc')]; _reload();
      case 'desc': _m.sort = [GridSort(column: column, dir: 'desc')]; _reload();
      case 'nosort': _m.sort = []; _reload();
      case 'filter': await _editFilter(GridFilter(column: column, op: '='));
      case 'null': _m.filters.add(GridFilter(column: column, op: 'is null')); _reload();
      case 'hide': _m.hidden.add(column); _reload();
      case 'showall': _m.hidden.clear(); _reload();
    }
  }

  static String opLabel(MtStrings s, String op) => switch (op) {
        'contains' => s.sqOpContains, 'not contains' => s.sqOpNotcontains, 'starts' => s.sqOpStarts, 'ends' => s.sqOpEnds, 'like' => s.sqOpLike,
        'not like' => s.sqOpNotlike, 'in' => s.sqOpIn, 'not in' => s.sqOpNotin, 'is null' => s.sqOpIsnull, 'is not null' => s.sqOpIsnotnull,
        '=' => '= (eşittir)', '<>' => '≠ (eşit değil)', '<' => '< (küçük)', '>' => '> (büyük)', '<=' => '≤ (küçük ya da eşit)', '>=' => '≥ (${s.sqOp})', _ => op };

  Future<void> _editFilter(GridFilter f, {int? index}) async {
    final s = MtStrings.of(context);
    final c = MtColors.of(context);
    var column = f.column, op = f.op;
    final val = TextEditingController(text: f.value ?? '');
    final ok = await showDialog<bool>(
      context: context,
      builder: (ctx) => StatefulBuilder(builder: (ctx, set) => AlertDialog(
        title: Row(children: [Icon(Icons.filter_alt_outlined, size: 18, color: c.accent), const SizedBox(width: 8), Text(s.sqDataFilterTitle)]),
        content: SizedBox(width: 420, child: Column(mainAxisSize: MainAxisSize.min, crossAxisAlignment: CrossAxisAlignment.stretch, children: [
          MtField(label: s.sqDataColumn, child: _dd<String>(ctx, column, [for (final col in _m.columns) (col.name, col.name)], (v) => set(() => column = v!))),
          const SizedBox(height: 12),
          MtField(label: s.sqDataOperator, child: _dd<String>(ctx, op, [for (final o in kFilterOps) (o, opLabel(s, o))], (v) => set(() => op = v!))),
          if (opNeedsValue(op)) ...[
            const SizedBox(height: 12),
            MtField(label: s.sqDataValue, hint: op == 'in' || op == 'not in' ? s.sqDataInHint : null, child: TextField(controller: val, autofocus: true, textDirection: TextDirection.ltr, onSubmitted: (_) => Navigator.pop(ctx, true))),
          ],
        ])),
        actionsPadding: const EdgeInsets.fromLTRB(22, 0, 22, 18),
        actions: [MtButton(label: s.commonCancel, onPressed: () => Navigator.pop(ctx, false)), MtButton(label: s.commonOk, kind: MtBtnKind.primary, onPressed: () => Navigator.pop(ctx, true))],
      )),
    );
    if (ok != true) return;
    final nf = GridFilter(column: column, op: op, value: opNeedsValue(op) ? val.text : null);
    if (index == null) {
      _m.filters.add(nf);
    } else {
      _m.filters[index] = nf;
    }
    _reload();
  }

  Future<void> _columnsDialog() async {
    final s = MtStrings.of(context);
    final hidden = _m.hidden.toSet();
    final ok = await showDialog<bool>(
      context: context,
      builder: (ctx) => StatefulBuilder(builder: (ctx, set) => AlertDialog(
        title: Text(s.sqDataColumns),
        content: SizedBox(width: 380, height: 360, child: Column(children: [
          Row(children: [
            MtButton(label: s.sqDataSelectAll, small: true, onPressed: () => set(hidden.clear)),
            const SizedBox(width: 6),
            MtButton(label: s.sqDataSelectNone, small: true, onPressed: () => set(() => hidden.addAll(_m.columns.map((x) => x.name)))),
          ]),
          const SizedBox(height: 6),
          Expanded(child: ListView(children: [
            for (final col in _m.columns)
              MtCheck(value: !hidden.contains(col.name), label: col.name, hint: col.type, onChanged: (v) => set(() => v ? hidden.remove(col.name) : hidden.add(col.name))),
          ])),
        ])),
        actionsPadding: const EdgeInsets.fromLTRB(22, 0, 22, 18),
        actions: [MtButton(label: s.commonCancel, onPressed: () => Navigator.pop(ctx, false)), MtButton(label: s.commonOk, kind: MtBtnKind.primary, onPressed: () => Navigator.pop(ctx, true))],
      )),
    );
    if (ok != true) return;
    _m.hidden..clear()..addAll(hidden);
    if (_m.hidden.length == _m.columns.length) _m.hidden.clear();
    _reload();
  }

  Widget _dd<T>(BuildContext ctx, T value, List<(T, String)> items, ValueChanged<T?> onChanged) {
    final col = MtColors.of(ctx);
    return Container(
      height: MtDim.inputH, padding: const EdgeInsets.symmetric(horizontal: 12),
      decoration: BoxDecoration(color: col.bg2, border: Border.all(color: col.border), borderRadius: BorderRadius.circular(MtDim.radiusSm)),
      child: DropdownButtonHideUnderline(child: DropdownButton<T>(value: value, isExpanded: true, style: MtText.body.copyWith(color: col.text), dropdownColor: col.surface2,
          items: [for (final it in items) DropdownMenuItem(value: it.$1, child: Text(it.$2, maxLines: 1, overflow: TextOverflow.ellipsis))], onChanged: onChanged)),
    );
  }

  Future<void> _export() async {
    final d = widget.session.driver;
    if (d == null) return;
    final m = GridQueryModel(table: _m.table, columns: _m.columns)..hidden.addAll(_m.hidden)..sort = _m.sort..filters = _m.filters;
    await exportQuery(context, driver: d, sql: buildGridSelect(m, widget.session.dialect), database: widget.database, connName: widget.session.conn.name, baseName: widget.table);
  }

  @override
  Widget build(BuildContext context) {
    final s = MtStrings.of(context);
    final c = MtColors.of(context);
    final narrow = MediaQuery.sizeOf(context).width < 1100; // durum metni araç çubuğuna sığmıyorsa alt satırda
    final body = Column(children: [
      // araç çubuğu
      Container(
        height: 42, padding: const EdgeInsets.symmetric(horizontal: 8),
        decoration: BoxDecoration(color: c.surface, border: Border(bottom: BorderSide(color: c.border))),
        child: Row(children: [
          Expanded(child: ListView(scrollDirection: Axis.horizontal, children: [
            Center(child: MtButton(label: s.commonRefresh, icon: Icons.refresh, small: true, busy: _loading, onPressed: _reload)),
            const SizedBox(width: 6),
            Center(child: MtButton(label: _m.hidden.isEmpty ? s.sqDataColumns : s.sqDataColumnsHidden((_m.columns.length - _m.hidden.length).toString(), _m.columns.length.toString()), icon: Icons.view_column_outlined, small: true, onPressed: _m.columns.isEmpty ? null : _columnsDialog)),
            const SizedBox(width: 6),
            Center(child: MtButton(label: s.sqDataAddFilter, icon: Icons.filter_alt_outlined, small: true, onPressed: _m.columns.isEmpty ? null : () => _editFilter(GridFilter(column: _m.columns.first.name, op: '=')))),
            const SizedBox(width: 6),
            Center(child: Container(
              height: MtDim.btnSmH, padding: const EdgeInsets.symmetric(horizontal: 10),
              decoration: BoxDecoration(color: c.surface2, border: Border.all(color: c.border), borderRadius: BorderRadius.circular(MtDim.radiusSm)),
              child: DropdownButtonHideUnderline(child: DropdownButton<int>(
                value: _m.limit ?? 0, style: MtText.btnSm.copyWith(color: c.text), dropdownColor: c.surface2, isDense: true,
                items: [for (final n in {..._limits, if (_m.limit != null) _m.limit!}.toList()..sort()) DropdownMenuItem(value: n, child: Text(s.sqDataFirstN(n.toString()))), DropdownMenuItem(value: 0, child: Text(s.sqDataAll))],
                onChanged: (v) { _m.limit = v == 0 ? null : v; _reload(); },
              )),
            )),
            const SizedBox(width: 10),
            Center(child: Container(width: 1, height: 18, color: c.border)),
            const SizedBox(width: 10),
            Center(child: MtButton(label: s.sqDataOpenInEditor, icon: Icons.code, small: true, kind: MtBtnKind.ghost, onPressed: _sql == null ? null : () => widget.onOpenInEditor(_sql!, widget.database))),
            Center(child: MtButton(label: s.sqSqlExport, icon: Icons.ios_share, small: true, kind: MtBtnKind.ghost, onPressed: _cols.isEmpty ? null : _export)),
          ])),
          if (!narrow) Text(_status(s), style: MtText.tiny.copyWith(color: _error != null ? c.err : c.ok)),
        ]),
      ),
      if (_m.filters.isNotEmpty)
        Container(
          padding: const EdgeInsets.fromLTRB(8, 6, 8, 2), decoration: BoxDecoration(border: Border(bottom: BorderSide(color: c.border))),
          child: Wrap(spacing: 6, runSpacing: 6, crossAxisAlignment: WrapCrossAlignment.center, children: [
            for (var i = 0; i < _m.filters.length; i++) _chip(c, s, _m.filters[i], i),
            if (_m.filters.length > 1) MtButton(label: s.sqDataClearFilters, icon: Icons.close, small: true, kind: MtBtnKind.ghost, onPressed: () { _m.filters = []; _reload(); }),
          ]),
        ),
      if (_sql != null)
        Container(
          constraints: const BoxConstraints(maxHeight: 110),
          decoration: BoxDecoration(color: c.bg2, border: Border(bottom: BorderSide(color: c.border))),
          child: Row(crossAxisAlignment: CrossAxisAlignment.start, children: [
            Padding(padding: const EdgeInsets.fromLTRB(10, 8, 6, 8), child: Row(mainAxisSize: MainAxisSize.min, children: [Icon(Icons.code, size: 12, color: c.text3), const SizedBox(width: 4), Text('SQL', style: MtText.subTitle.copyWith(color: c.text3))])),
            Expanded(child: SingleChildScrollView(padding: const EdgeInsets.fromLTRB(6, 8, 10, 8), child: SelectableText(_sql!, textDirection: TextDirection.ltr, style: TextStyle(fontFamily: 'monospace', fontSize: widget.session.settings.editorFontSize - 1.5, height: 1.4, color: c.text)))),
          ]),
        ),
      Expanded(child: _error != null
          ? Padding(padding: const EdgeInsets.all(16), child: MtBox('${s.sqDataError}: $_error', kind: MtBoxKind.error, icon: Icons.error_outline))
          : _loading && _cols.isEmpty
              ? const Center(child: MtSpinner(size: 22))
              : _cols.isEmpty
                  ? Center(child: Text(s.sqResNoRows, style: MtText.small.copyWith(color: c.text3)))
                  : SqlGrid(columns: _cols, rows: _rows, sortColumn: _m.sort.firstOrNull?.column, sortDir: _m.sort.firstOrNull?.dir, onSort: _sort, onHeaderMenu: _headerMenu)),
      if (narrow)
        Container(height: 24, alignment: AlignmentDirectional.centerEnd, padding: const EdgeInsets.symmetric(horizontal: 10),
            decoration: BoxDecoration(color: c.surface, border: Border(top: BorderSide(color: c.border))),
            child: Text(_status(s), style: MtText.tiny.copyWith(color: _error != null ? c.err : c.ok))),
    ]);
    if (!widget.standalone) return body;
    return Scaffold(
      appBar: AppBar(toolbarHeight: 46, title: Row(children: [
        Icon(Icons.table_chart_outlined, size: 16, color: c.accent), const SizedBox(width: 8),
        Expanded(child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Text(widget.table, maxLines: 1, overflow: TextOverflow.ellipsis, style: MtText.cardTitle.copyWith(color: c.text)),
          Text(widget.schema == widget.database ? widget.database : '${widget.database} › ${widget.schema}', maxLines: 1, overflow: TextOverflow.ellipsis, style: MtText.tiny.copyWith(color: c.text3)),
        ])),
      ])),
      body: SafeArea(child: body),
    );
  }

  String _status(MtStrings s) {
    if (_error != null) return s.sqDataError;
    if (_loading) return s.sqSqlRunning;
    if (_cols.isEmpty) return '';
    return _truncated || (_m.limit != null && _rows.length >= _m.limit!) ? s.sqDataRowsMore(_ms.toString(), _rows.length.toString()) : s.sqDataRows(_ms.toString(), _rows.length.toString());
  }

  Widget _chip(MtColors c, MtStrings s, GridFilter f, int i) => InkWell(
        borderRadius: BorderRadius.circular(999), onTap: () => _editFilter(f, index: i),
        child: Container(
          height: 26, padding: const EdgeInsetsDirectional.only(start: 10, end: 2),
          decoration: BoxDecoration(color: c.accent.withValues(alpha: .08), borderRadius: BorderRadius.circular(999), border: Border.all(color: c.accent.withValues(alpha: .4))),
          child: Row(mainAxisSize: MainAxisSize.min, children: [
            Icon(Icons.filter_alt_outlined, size: 12, color: c.accent), const SizedBox(width: 5),
            Text(f.column, style: TextStyle(fontSize: 11.5, fontWeight: FontWeight.w700, color: c.text)), const SizedBox(width: 5),
            Text(opLabel(s, f.op).split(' (').first, style: TextStyle(fontSize: 11.5, color: c.text2)),
            if (opNeedsValue(f.op)) ...[const SizedBox(width: 5), Text(f.value ?? '', style: TextStyle(fontSize: 11.5, fontFamily: 'monospace', color: c.accent))],
            MtIconButton(icon: Icons.close, size: 16, onPressed: () { _m.filters.removeAt(i); _reload(); }),
          ]),
        ),
      );
}
