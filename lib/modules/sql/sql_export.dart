// Dışa aktarma: CSV (UTF-8 BOM'lu, ; yerine , ayraç, RFC 4180 tırnaklama) / JSON (dizi) / JSONL → uygulamanın belgeler dizinine
// yazılır ve share_plus ile paylaşılır. Sorgu sınırsız yeniden çalıştırılır, satırlar belleğe alınmadan akıştan dosyaya yazılır.
import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';
import 'package:share_plus/share_plus.dart';

import '../../core/l10n/gen/mt_strings.dart';
import '../../core/theme.dart';
import '../../widgets/mt_widgets.dart';
import 'drivers/sql_driver.dart';

enum ExportFormat { csv, json, jsonl }

Future<ExportFormat?> pickExportFormat(BuildContext context) async {
  final s = MtStrings.of(context);
  final c = MtColors.of(context);
  return showModalBottomSheet<ExportFormat>(
    context: context, backgroundColor: c.surface, shape: const RoundedRectangleBorder(borderRadius: BorderRadius.vertical(top: Radius.circular(16))),
    builder: (ctx) => SafeArea(child: Column(mainAxisSize: MainAxisSize.min, children: [
      Padding(padding: const EdgeInsets.fromLTRB(18, 14, 18, 4), child: Row(children: [Icon(Icons.ios_share, size: 18, color: c.accent), const SizedBox(width: 8), Text(s.sqExpTitle, style: MtText.h2.copyWith(color: c.text))])),
      Padding(padding: const EdgeInsets.fromLTRB(18, 0, 18, 8), child: Text(s.sqExpHint, style: MtText.small.copyWith(color: c.text3))),
      for (final (f, label, icon) in [(ExportFormat.csv, 'CSV (UTF-8, BOM)', Icons.table_chart_outlined), (ExportFormat.json, 'JSON', Icons.data_object), (ExportFormat.jsonl, s.sqMobExportJsonl, Icons.view_list_outlined)])
        ListTile(dense: true, leading: Icon(icon, size: 20, color: c.text2), title: Text(label, style: MtText.body.copyWith(color: c.text)), onTap: () => Navigator.pop(ctx, f)),
      const SizedBox(height: 8),
    ])),
  );
}

Object? _jsonCell(Object? v) => v == null || v is num || v is bool || v is String ? v : cellText(v);

String csvCell(Object? v) {
  if (v == null) return '';
  final t = cellText(v);
  return t.contains(RegExp(r'[",\r\n]')) ? '"${t.replaceAll('"', '""')}"' : t;
}

/// Akışı dosyaya yazar; satır sayısını döner.
Future<int> writeExport(Stream<QueryEvent> events, ExportFormat f, IOSink sink) async {
  var cols = <ColumnMeta>[];
  var n = 0;
  var first = true;
  if (f == ExportFormat.csv) sink.write('﻿');
  if (f == ExportFormat.json) sink.write('[');
  await for (final ev in events) {
    switch (ev) {
      case QColumns(:final columns):
        cols = columns;
        if (f == ExportFormat.csv) sink.write('${cols.map((c) => csvCell(c.name)).join(',')}\r\n');
      case QRows(:final rows):
        for (final r in rows) {
          switch (f) {
            case ExportFormat.csv:
              sink.write('${r.map(csvCell).join(',')}\r\n');
            case ExportFormat.json:
              sink.write('${first ? '\n' : ',\n'}${jsonEncode({for (var i = 0; i < cols.length; i++) cols[i].name: _jsonCell(i < r.length ? r[i] : null)})}');
            case ExportFormat.jsonl:
              sink.write('${jsonEncode({for (var i = 0; i < cols.length; i++) cols[i].name: _jsonCell(i < r.length ? r[i] : null)})}\n');
          }
          first = false;
          n++;
        }
      case QEnd():
      case QCommand():
        break;
    }
  }
  if (f == ExportFormat.json) sink.write('\n]\n');
  return n;
}

Future<Directory> exportDir(String connName) async {
  final base = await getApplicationDocumentsDirectory();
  final d = Directory('${base.path}/SQL Master/${connName.replaceAll(RegExp(r'[\\/:*?"<>|]'), '_')}');
  await d.create(recursive: true);
  return d;
}

/// Sorguyu sınırsız çalıştırıp dosyaya yazar, paylaşır. Biçim sorulur.
Future<void> exportQuery(BuildContext context, {required SqlDriver driver, required String sql, String? database, required String connName, required String baseName}) async {
  final s = MtStrings.of(context);
  final f = await pickExportFormat(context);
  if (f == null || !context.mounted) return;
  mtToast(context, s.sqExpRunning);
  final ext = switch (f) { ExportFormat.csv => 'csv', ExportFormat.json => 'json', ExportFormat.jsonl => 'jsonl' };
  final stamp = DateTime.now().toIso8601String().substring(0, 19).replaceAll(':', '').replaceAll('-', '').replaceFirst('T', '-');
  final file = File('${(await exportDir(connName)).path}/${baseName.replaceAll(RegExp(r'[\\/:*?"<>|\s]+'), '_')}-$stamp.$ext');
  final sink = file.openWrite();
  int n;
  try {
    n = await writeExport(driver.query(sql, database: database), f, sink);
  } catch (e) {
    await sink.close();
    if (context.mounted) mtToast(context, s.sqExpFailed, sub: sqlErrorText(s, e), type: 'err');
    return;
  }
  await sink.close();
  if (!context.mounted) return;
  if (n == 0) {
    mtToast(context, s.sqMobExportNoRows, type: 'err');
    return;
  }
  mtToast(context, s.sqExpDone(n.toString()), sub: file.path.split('/').last, type: 'ok');
  await SharePlus.instance.share(ShareParams(files: [XFile(file.path)], subject: file.path.split('/').last));
}
