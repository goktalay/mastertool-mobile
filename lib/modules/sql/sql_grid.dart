// Sonuç ızgarası — masaüstü conn/grid.ts: satır numarası sütunu (text-3, mono), başlıkta ad + tip (küçük, text-3), sayılar
// sağa yaslı mono, NULL eğik ve soluk, sıralama oku; yatay + dikey kaydırma, satıra dokununca satır ayrıntı sayfası (alan: değer).
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../core/theme.dart';
import '../../widgets/mt_widgets.dart';
import 'drivers/sql_driver.dart';
import 'sql_texts.dart';

const kRowH = 26.0, kHeadH = 40.0, kNumW = 44.0;

class SqlGrid extends StatefulWidget {
  const SqlGrid({super.key, required this.columns, required this.rows, this.sortColumn, this.sortDir, this.onSort, this.onHeaderMenu, this.rowTapDetail = true});
  final List<ColumnMeta> columns;
  final List<List<Object?>> rows;
  final String? sortColumn, sortDir;
  final void Function(String column)? onSort;
  final void Function(String column, Offset pos)? onHeaderMenu;
  final bool rowTapDetail;
  @override
  State<SqlGrid> createState() => _SqlGridState();
}

class _SqlGridState extends State<SqlGrid> {
  final _h = ScrollController();
  List<double> _w = const [];
  int _wFor = -1;

  @override
  void dispose() {
    _h.dispose();
    super.dispose();
  }

  void _measure() {
    final key = Object.hash(widget.columns.length, widget.rows.length > 200 ? 200 : widget.rows.length, widget.columns.isEmpty ? '' : widget.columns.first.name);
    if (key == _wFor) return;
    _wFor = key;
    _w = List.generate(widget.columns.length, (i) {
      var m = widget.columns[i].name.length.clamp(3, 40).toDouble();
      final tl = widget.columns[i].type.length * .85;
      if (tl > m) m = tl;
      for (var r = 0; r < widget.rows.length && r < 200; r++) {
        final row = widget.rows[r];
        final v = i < row.length ? row[i] : null;
        final l = v == null ? 4 : cellText(v).length;
        if (l > m) m = l.toDouble();
      }
      return (m * 7.4 + 22).clamp(64.0, 360.0);
    });
  }

  @override
  Widget build(BuildContext context) {
    final c = MtColors.of(context);
    _measure();
    final total = kNumW + _w.fold(0.0, (a, b) => a + b);
    final sortIcon = widget.sortDir == 'desc' ? Icons.arrow_downward : Icons.arrow_upward;
    return Scrollbar(
      controller: _h, thumbVisibility: true, notificationPredicate: (n) => n.metrics.axis == Axis.horizontal,
      child: SingleChildScrollView(
        controller: _h, scrollDirection: Axis.horizontal,
        child: SizedBox(
          width: total,
          child: Column(children: [
            Container(
              height: kHeadH,
              decoration: BoxDecoration(color: c.surface2, border: Border(bottom: BorderSide(color: c.borderStrong))),
              child: Row(children: [
                SizedBox(width: kNumW, child: Center(child: Text('#', style: MtText.tiny.copyWith(color: c.text3)))),
                for (var i = 0; i < widget.columns.length; i++)
                  GestureDetector(
                    onLongPressStart: (d) => widget.onHeaderMenu?.call(widget.columns[i].name, d.globalPosition),
                    child: InkWell(
                      onTap: widget.onSort == null ? null : () => widget.onSort!(widget.columns[i].name),
                      child: Container(
                        width: _w[i], padding: const EdgeInsets.symmetric(horizontal: 8),
                        decoration: BoxDecoration(border: Border(right: BorderSide(color: c.border))),
                        child: Column(mainAxisAlignment: MainAxisAlignment.center, crossAxisAlignment: CrossAxisAlignment.start, children: [
                          Row(children: [
                            Flexible(child: Text(widget.columns[i].name, maxLines: 1, overflow: TextOverflow.ellipsis, style: TextStyle(fontSize: 12.5, fontWeight: FontWeight.w600, color: widget.sortColumn == widget.columns[i].name ? c.accent : c.text))),
                            if (widget.sortColumn == widget.columns[i].name) ...[const SizedBox(width: 4), Icon(sortIcon, size: 12, color: c.accent)],
                          ]),
                          Text(widget.columns[i].type, maxLines: 1, overflow: TextOverflow.ellipsis, style: TextStyle(fontSize: 10, fontFamily: 'monospace', color: c.text3)),
                        ]),
                      ),
                    ),
                  ),
              ]),
            ),
            Expanded(child: ListView.builder(
              itemCount: widget.rows.length, itemExtent: kRowH,
              itemBuilder: (_, r) {
                final row = widget.rows[r];
                return InkWell(
                  onTap: widget.rowTapDetail ? () => Navigator.of(context).push(MaterialPageRoute(builder: (_) => RowDetailScreen(columns: widget.columns, row: row, index: r + 1))) : null,
                  child: Container(
                    decoration: BoxDecoration(color: r.isOdd ? c.bg2.withValues(alpha: .5) : null, border: Border(bottom: BorderSide(color: c.border.withValues(alpha: .5)))),
                    child: Row(children: [
                      SizedBox(width: kNumW, child: Center(child: Text('${r + 1}', style: TextStyle(fontSize: 11, fontFamily: 'monospace', color: c.text3)))),
                      for (var i = 0; i < widget.columns.length; i++)
                        Container(
                          width: _w[i], padding: const EdgeInsets.symmetric(horizontal: 8), alignment: widget.columns[i].numeric ? Alignment.centerRight : Alignment.centerLeft,
                          child: _cell(c, i < row.length ? row[i] : null, widget.columns[i].numeric),
                        ),
                    ]),
                  ),
                );
              },
            )),
          ]),
        ),
      ),
    );
  }

  Widget _cell(MtColors c, Object? v, bool numeric) => v == null
      ? Text('NULL', style: TextStyle(fontSize: 12, fontFamily: 'monospace', fontStyle: FontStyle.italic, color: c.text3))
      : Text(cellText(v).replaceAll('\n', '⏎'), maxLines: 1, overflow: TextOverflow.ellipsis, softWrap: false, textDirection: TextDirection.ltr,
          style: TextStyle(fontSize: 12, fontFamily: 'monospace', color: numeric ? c.text : c.text));
}

/// Satır ayrıntı sayfası: alan → değer (uzun metin tam görünür, dokununca kopyalanır)
class RowDetailScreen extends StatelessWidget {
  const RowDetailScreen({super.key, required this.columns, required this.row, required this.index});
  final List<ColumnMeta> columns;
  final List<Object?> row;
  final int index;
  @override
  Widget build(BuildContext context) {
    final c = MtColors.of(context);
    return Scaffold(
      appBar: AppBar(toolbarHeight: 46, title: Text('${SqTxt.rowDetail} · #$index', style: MtText.cardTitle.copyWith(color: c.text))),
      body: SafeArea(child: ListView.separated(
        padding: const EdgeInsets.symmetric(vertical: 6),
        itemCount: columns.length, separatorBuilder: (_, _) => Divider(height: 1, color: c.border.withValues(alpha: .5)),
        itemBuilder: (_, i) {
          final v = i < row.length ? row[i] : null;
          return InkWell(
            onLongPress: () { Clipboard.setData(ClipboardData(text: cellText(v))); mtToast(context, SqTxt.copyCell, type: 'ok'); },
            child: Padding(padding: const EdgeInsets.fromLTRB(16, 8, 16, 8), child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              Row(children: [
                Text(columns[i].name, style: MtText.label.copyWith(color: c.text2)),
                const SizedBox(width: 8),
                Text(columns[i].type, style: TextStyle(fontSize: 10.5, fontFamily: 'monospace', color: c.text3)),
              ]),
              const SizedBox(height: 4),
              v == null
                  ? Text('NULL', style: MtText.mono.copyWith(fontStyle: FontStyle.italic, color: c.text3))
                  : SelectableText(cellText(v), textDirection: TextDirection.ltr, style: MtText.mono.copyWith(fontSize: 12.5, color: c.text)),
            ])),
          );
        },
      )),
    );
  }
}
