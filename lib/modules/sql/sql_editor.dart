// SQL editörü — masaüstü conn/sqlTab.ts (06-sql-editor): araç çubuğu (Çalıştır, İfadeyi/Seçimi çalıştır, İptal, veritabanı
// seçici, Geçmiş, Dışa aktar), mono çok satırlı alan (editorFontSize), altta sonuç sekmeleri (Sonuç n + rozet, Mesajlar),
// durum "Tamamlandı · 28 ms". Geçmiş: bağlantı başına son 200 (yerel). Telefonda tam sayfa.
import 'package:flutter/material.dart';

import '../../core/l10n/gen/mt_strings.dart';
import '../../core/theme.dart';
import '../../widgets/mt_widgets.dart';
import 'sql_export.dart';
import 'sql_grid.dart';
import 'sql_history.dart';
import 'sql_session.dart';
import 'sql_split.dart';
import 'sql_texts.dart';

class SqlEditorTab extends StatefulWidget {
  const SqlEditorTab({super.key, required this.session, required this.title, this.initialSql = '', this.database, this.standalone = false, this.controller});
  final SqlSession session;
  final String title, initialSql;
  final String? database;
  final bool standalone;
  final TextEditingController? controller;
  @override
  State<SqlEditorTab> createState() => _SqlEditorTabState();
}

class _SqlEditorTabState extends State<SqlEditorTab> with AutomaticKeepAliveClientMixin {
  late final TextEditingController _ctl = widget.controller ?? TextEditingController(text: widget.initialSql);
  final _focus = FocusNode();
  late String? _db = widget.database ?? widget.session.conn.database.ifEmpty;
  List<String> _dbs = const [];
  final List<StatementResult> _results = [];
  int _tab = 0;
  bool _running = false;
  String _status = '';
  bool _statusErr = false;
  late final _history = SqlHistory(widget.session.conn.id);

  @override
  bool get wantKeepAlive => true;

  @override
  void initState() {
    super.initState();
    _loadDbs();
  }

  @override
  void dispose() {
    if (widget.controller == null) _ctl.dispose();
    _focus.dispose();
    super.dispose();
  }

  Future<void> _loadDbs() async {
    final d = widget.session.driver;
    if (d == null || widget.session.conn.meta.isFile) return;
    try {
      final l = await d.databases();
      if (mounted) setState(() { _dbs = l; _db ??= l.firstOrNull; });
    } catch (_) {/* seçici boş kalır */}
  }

  Future<void> _run({bool selection = false, bool atCursor = false}) async {
    final s = MtStrings.of(context);
    if (_running || !widget.session.connected) return;
    var sql = _ctl.text;
    final sel = _ctl.selection;
    if (selection && sel.isValid && !sel.isCollapsed) {
      sql = sel.textInside(_ctl.text);
    } else if (atCursor) {
      final st = statementAt(_ctl.text, widget.session.dialect, sel.isValid ? sel.baseOffset : 0);
      if (st == null) return;
      sql = st.text;
    }
    if (sql.trim().isEmpty) return;
    setState(() { _running = true; _results.clear(); _tab = 0; _status = s.sqSqlRunning; _statusErr = false; });
    final sw = Stopwatch()..start();
    var errors = 0;
    final ok = await widget.session.run(context, sql, database: _db, onResult: (r) {
      if (r.error != null) errors++;
      if (mounted) setState(() { _results.add(r); _tab = _results.indexWhere((x) => x.hasGrid) >= 0 && errors == 0 ? _results.lastIndexWhere((x) => x.hasGrid) : _results.length; });
    });
    if (!mounted) return;
    final ms = sw.elapsedMilliseconds;
    final cancelled = !ok && _results.any((r) => r.command == 'CANCELLED');
    setState(() {
      _running = false;
      _statusErr = errors > 0;
      _status = cancelled ? s.sqResCancelled : errors > 0 ? s.sqSqlDoneErrors(ms.toString(), errors.toString()) : s.sqSqlDone(ms.toString());
      if (errors > 0 || cancelled) _tab = _results.length; // Mesajlar
    });
    final rows = _results.fold<int>(0, (a, r) => a + r.rowCount);
    if (!_results.every((r) => r.skipped)) await _history.add(HistoryEntry(sql: sql, at: DateTime.now().millisecondsSinceEpoch, ms: ms, rows: rows, ok: errors == 0, database: _db));
  }

  Future<void> _cancel() async {
    await widget.session.cancel();
    // bağlantı kapatıldı: yeniden kurulur
    if (widget.session.state == SessionState.connected) await widget.session.connect().catchError((_) {});
  }

  Future<void> _showHistory() async {
    final s = MtStrings.of(context);
    final c = MtColors.of(context);
    final list = await _history.list();
    if (!mounted) return;
    await showModalBottomSheet(
      context: context, backgroundColor: c.surface, isScrollControlled: true, shape: const RoundedRectangleBorder(borderRadius: BorderRadius.vertical(top: Radius.circular(16))),
      builder: (ctx) => SafeArea(child: SizedBox(height: MediaQuery.sizeOf(ctx).height * .7, child: Column(children: [
        Padding(padding: const EdgeInsets.fromLTRB(18, 14, 8, 6), child: Row(children: [
          Icon(Icons.history, size: 18, color: c.accent), const SizedBox(width: 8),
          Text(s.sqSqlHistory, style: MtText.h2.copyWith(color: c.text)), const Spacer(),
          if (list.isNotEmpty) MtButton(label: s.commonDelete, small: true, kind: MtBtnKind.ghost, icon: Icons.delete_outline, onPressed: () async { await _history.clear(); if (ctx.mounted) Navigator.pop(ctx); }),
        ])),
        Expanded(child: list.isEmpty
            ? Center(child: Text(s.sqSqlHistoryEmpty, style: MtText.small.copyWith(color: c.text3)))
            : ListView.separated(
                itemCount: list.length, separatorBuilder: (_, _) => Divider(height: 1, color: c.border.withValues(alpha: .5)),
                itemBuilder: (_, i) {
                  final h = list[i];
                  final when = DateTime.fromMillisecondsSinceEpoch(h.at);
                  return ListTile(
                    dense: true,
                    title: Text(h.sql.replaceAll(RegExp(r'\s+'), ' '), maxLines: 2, overflow: TextOverflow.ellipsis, textDirection: TextDirection.ltr, style: MtText.mono.copyWith(color: c.text)),
                    subtitle: Text('${when.day.toString().padLeft(2, '0')}.${when.month.toString().padLeft(2, '0')}.${when.year} ${when.hour.toString().padLeft(2, '0')}:${when.minute.toString().padLeft(2, '0')}'
                        '${h.ms != null ? ' · ${h.ms} ms' : ''}${h.rows != null ? ' · ${h.rows} ${s.sqSqlRowsShort}' : ''}${h.database != null ? ' · ${h.database}' : ''}',
                        style: MtText.tiny.copyWith(color: h.ok ? c.text3 : c.err)),
                    trailing: Icon(Icons.subdirectory_arrow_left, size: 16, color: c.text3),
                    onTap: () { Navigator.pop(ctx); setState(() { _ctl.text = h.sql; if (h.database != null && _dbs.contains(h.database)) _db = h.database; }); },
                  );
                })),
      ]))),
    );
  }

  Future<void> _export() async {
    final d = widget.session.driver;
    if (d == null) return;
    final cur = _tab < _results.length ? _results[_tab] : _results.where((r) => r.hasGrid).lastOrNull;
    if (cur == null || !cur.hasGrid) { mtToast(context, SqTxt.exportNoRows, type: 'err'); return; }
    await exportQuery(context, driver: d, sql: cur.sql, database: _db, connName: widget.session.conn.name, baseName: widget.title);
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    final s = MtStrings.of(context);
    final c = MtColors.of(context);
    final narrow = MediaQuery.sizeOf(context).width < 1100; // durum metni araç çubuğuna sığmıyorsa alt satırda
    final connected = widget.session.connected;
    final hasSel = _ctl.selection.isValid && !_ctl.selection.isCollapsed;
    final toolbar = Container(
      height: 42, padding: const EdgeInsets.symmetric(horizontal: 8),
      decoration: BoxDecoration(color: c.surface, border: Border(bottom: BorderSide(color: c.border))),
      child: Row(children: [
        Expanded(child: ListView(scrollDirection: Axis.horizontal, children: [
          Center(child: _running
              ? MtButton(label: s.sqSqlCancel, icon: Icons.stop, small: true, kind: MtBtnKind.danger, onPressed: _cancel)
              : MtButton(label: s.sqSqlRun, icon: Icons.play_arrow, small: true, kind: MtBtnKind.primary, onPressed: connected ? () => _run() : null)),
          const SizedBox(width: 6),
          Center(child: MtButton(label: hasSel ? SqTxt.selectionRun : s.sqSqlRunStatement, icon: Icons.play_arrow_outlined, small: true, onPressed: connected && !_running ? () => _run(selection: hasSel, atCursor: !hasSel) : null)),
          if (_dbs.isNotEmpty) ...[
            const SizedBox(width: 10),
            Center(child: Container(
              height: MtDim.btnSmH, padding: const EdgeInsets.symmetric(horizontal: 10), constraints: const BoxConstraints(maxWidth: 200),
              decoration: BoxDecoration(color: c.surface2, border: Border.all(color: c.border), borderRadius: BorderRadius.circular(MtDim.radiusSm)),
              child: DropdownButtonHideUnderline(child: DropdownButton<String>(
                value: _dbs.contains(_db) ? _db : _dbs.first, style: MtText.btnSm.copyWith(color: c.text), dropdownColor: c.surface2, isDense: true,
                items: [for (final d in _dbs) DropdownMenuItem(value: d, child: Text(d, maxLines: 1, overflow: TextOverflow.ellipsis))], onChanged: (v) => setState(() => _db = v),
              )),
            )),
          ],
          const SizedBox(width: 6),
          Center(child: MtButton(label: s.sqSqlHistory, icon: Icons.history, small: true, kind: MtBtnKind.ghost, onPressed: _showHistory)),
          Center(child: MtButton(label: s.sqSqlExport, icon: Icons.ios_share, small: true, kind: MtBtnKind.ghost, onPressed: _results.any((r) => r.hasGrid) ? _export : null)),
        ])),
        if (!narrow && _status.isNotEmpty) Text(_status, style: MtText.tiny.copyWith(color: _statusErr ? c.err : _running ? c.text2 : c.ok)),
      ]),
    );

    final editor = Container(
      color: c.bg,
      child: TextField(
        controller: _ctl, focusNode: _focus, maxLines: null, expands: true, textAlignVertical: TextAlignVertical.top, autocorrect: false, enableSuggestions: false,
        keyboardType: TextInputType.multiline, textDirection: TextDirection.ltr, onChanged: (_) => setState(() {}),
        style: TextStyle(fontFamily: 'monospace', fontSize: widget.session.settings.editorFontSize, height: 1.45, color: c.text),
        decoration: InputDecoration(hintText: s.sqSqlPlaceholder.split('…').first.trim(), filled: false, border: InputBorder.none, enabledBorder: InputBorder.none, focusedBorder: InputBorder.none, contentPadding: const EdgeInsets.fromLTRB(12, 10, 12, 10)),
      ),
    );

    final grids = _results.where((r) => r.hasGrid).toList();
    final msgTab = _results.length; // Mesajlar sekmesi indeksi
    final results = Column(children: [
      Container(
        height: 34, decoration: BoxDecoration(color: c.surface, border: Border(top: BorderSide(color: c.border), bottom: BorderSide(color: c.border))),
        child: ListView(scrollDirection: Axis.horizontal, padding: const EdgeInsets.symmetric(horizontal: 4), children: [
          for (var i = 0; i < _results.length; i++)
            if (_results[i].hasGrid) _resTab(c, i, s.sqResResult((grids.indexOf(_results[i]) + 1).toString()), Icons.table_chart_outlined, count: _results[i].rowCount),
          _resTab(c, msgTab, s.sqResMessages, Icons.info_outline, err: _results.any((r) => r.error != null)),
        ]),
      ),
      Expanded(child: _tab < _results.length && _results[_tab].hasGrid
          ? SqlGrid(columns: _results[_tab].columns, rows: _results[_tab].rows)
          : _messages(c, s)),
    ]);

    final body = Column(children: [
      toolbar,
      Expanded(flex: 5, child: editor),
      Expanded(flex: 6, child: _results.isEmpty && !_running
          ? Container(decoration: BoxDecoration(border: Border(top: BorderSide(color: c.border))), child: Center(child: Text(SqTxt.noResult, style: MtText.small.copyWith(color: c.text3))))
          : results),
      if (narrow && _status.isNotEmpty)
        Container(height: 24, alignment: AlignmentDirectional.centerEnd, padding: const EdgeInsets.symmetric(horizontal: 10),
            decoration: BoxDecoration(color: c.surface, border: Border(top: BorderSide(color: c.border))),
            child: Text(_status, style: MtText.tiny.copyWith(color: _statusErr ? c.err : _running ? c.text2 : c.ok))),
    ]);
    if (!widget.standalone) return body;
    return Scaffold(
      appBar: AppBar(toolbarHeight: 46, title: Row(children: [
        Icon(Icons.code, size: 16, color: c.accent), const SizedBox(width: 8),
        Expanded(child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Text(widget.title, maxLines: 1, overflow: TextOverflow.ellipsis, style: MtText.cardTitle.copyWith(color: c.text)),
          Text(widget.session.conn.name, maxLines: 1, overflow: TextOverflow.ellipsis, style: MtText.tiny.copyWith(color: c.text3)),
        ])),
      ])),
      body: SafeArea(child: body),
    );
  }

  Widget _resTab(MtColors c, int i, String label, IconData icon, {int? count, bool err = false}) {
    final on = _tab == i;
    return InkWell(
      onTap: () => setState(() => _tab = i),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        decoration: BoxDecoration(border: Border(bottom: BorderSide(color: on ? c.accent : Colors.transparent, width: 2))),
        child: Row(mainAxisSize: MainAxisSize.min, children: [
          Icon(icon, size: 13, color: err ? c.err : on ? c.text : c.text2), const SizedBox(width: 6),
          Text(label, style: MtText.btnSm.copyWith(color: on ? c.text : c.text2, fontWeight: on ? FontWeight.w600 : FontWeight.w400)),
          if (count != null) ...[
            const SizedBox(width: 6),
            Container(height: 16, padding: const EdgeInsets.symmetric(horizontal: 6), alignment: Alignment.center,
                decoration: BoxDecoration(color: c.surface2, borderRadius: BorderRadius.circular(8), border: Border.all(color: c.border)),
                child: Text('$count', style: TextStyle(fontSize: 10, color: c.text2, fontWeight: FontWeight.w600))),
          ],
        ]),
      ),
    );
  }

  Widget _messages(MtColors c, MtStrings s) => ListView(padding: const EdgeInsets.all(10), children: [
        for (final r in _results)
          Padding(padding: const EdgeInsets.only(bottom: 8), child: Row(crossAxisAlignment: CrossAxisAlignment.start, children: [
            Icon(r.error != null ? Icons.error_outline : r.skipped ? Icons.lock_outline : Icons.check_circle_outline, size: 14, color: r.error != null ? c.err : r.skipped ? c.warn : c.ok),
            const SizedBox(width: 8),
            Expanded(child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              Text(r.skipped
                  ? s.sqRoNotRun
                  : r.error != null
                      ? r.error!
                      : r.hasGrid
                          ? (r.truncated ? s.sqResRowsTruncated(r.ms.toString(), r.rowCount.toString()) : s.sqResRows(r.ms.toString(), r.rowCount.toString()))
                          : r.rowsAffected != null
                              ? s.sqResAffected(r.command ?? 'OK', r.ms.toString(), r.rowsAffected.toString())
                              : s.sqResCommand(r.command ?? 'OK', r.ms.toString()),
                  style: MtText.small.copyWith(color: r.error != null ? c.err : c.text)),
              Text(r.sql.replaceAll(RegExp(r'\s+'), ' '), maxLines: 2, overflow: TextOverflow.ellipsis, textDirection: TextDirection.ltr, style: MtText.mono.copyWith(fontSize: 11, color: c.text3)),
            ])),
          ])),
        if (_results.isEmpty && _running) Center(child: Padding(padding: const EdgeInsets.all(20), child: Text(s.sqSqlRunning, style: MtText.small.copyWith(color: c.text2)))),
      ]);
}

extension on String {
  String? get ifEmpty => isEmpty ? null : this;
}
