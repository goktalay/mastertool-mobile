// Sorgu geçmişi: bağlantı başına son 200 kayıt, uygulama destek dizininde JSONL (masaüstü history.jsonl gibi; parola
// kalıpları maskelenir). Senkron dışı.
import 'dart:convert';
import 'dart:io';

import 'package:path_provider/path_provider.dart';

class HistoryEntry {
  HistoryEntry({required this.sql, required this.at, this.ms, this.rows, this.ok = true, this.database});
  final String sql;
  final int at;
  final int? ms, rows;
  final bool ok;
  final String? database;
  Map<String, dynamic> toJson() => {'sql': sql, 'at': at, 'ms': ms, 'rows': rows, 'ok': ok, 'database': database};
  factory HistoryEntry.fromJson(Map<String, dynamic> j) => HistoryEntry(sql: (j['sql'] ?? '').toString(), at: (j['at'] as num?)?.toInt() ?? 0, ms: (j['ms'] as num?)?.toInt(),
      rows: (j['rows'] as num?)?.toInt(), ok: j['ok'] != false, database: j['database'] as String?);
}

class SqlHistory {
  SqlHistory(this.connectionId);
  final String connectionId;
  static const max = 200;
  final _mask = RegExp(r"(password|parola|pwd|secret)\s*(=|:)\s*'[^']*'", caseSensitive: false);

  Future<File> _file() async => File('${(await getApplicationSupportDirectory()).path}/sql_history_$connectionId.jsonl');

  Future<List<HistoryEntry>> list() async {
    final f = await _file();
    if (!await f.exists()) return const [];
    final out = <HistoryEntry>[];
    for (final line in await f.readAsLines()) {
      if (line.trim().isEmpty) continue;
      try {
        out.add(HistoryEntry.fromJson(jsonDecode(line) as Map<String, dynamic>));
      } catch (_) {/* bozuk satır */}
    }
    return out.reversed.toList();
  }

  Future<void> add(HistoryEntry e) async {
    final masked = HistoryEntry(sql: e.sql.replaceAllMapped(_mask, (m) => "${m[1]}${m[2]}'•••'"), at: e.at, ms: e.ms, rows: e.rows, ok: e.ok, database: e.database);
    final all = (await list()).reversed.where((x) => x.sql != masked.sql).toList()..add(masked);
    final keep = all.length > max ? all.sublist(all.length - max) : all;
    final f = await _file();
    await f.writeAsString('${keep.map((x) => jsonEncode(x.toJson())).join('\n')}\n', flush: true);
  }

  Future<void> clear() async {
    final f = await _file();
    if (await f.exists()) await f.delete();
  }
}
