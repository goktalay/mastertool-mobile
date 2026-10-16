// Bağlantı oturumu: SSH tüneli (gerekirse) + sürücü; salt okunur kip ve "bu seferlik çalıştır" onayı; ifade çalıştırıcı
// (bölme → sınıflandırma → onay → akış). Masaüstü renderer/conn/runner.ts + exec.ts karşılığı.
import 'dart:async';

import 'package:flutter/material.dart';

import '../../core/l10n/gen/mt_strings.dart';
import '../../core/theme.dart';
import '../../widgets/mt_widgets.dart';
import 'drivers/sql_driver.dart';
import 'sql_classify.dart';
import 'sql_model.dart';
import 'sql_split.dart';

enum SessionState { idle, connecting, connected, failed, closed }

/// Tek ifadenin sonucu (ızgara ya da mesaj)
class StatementResult {
  StatementResult({required this.sql});
  final String sql;
  List<ColumnMeta> columns = const [];
  final List<List<Object?>> rows = [];
  bool truncated = false;
  int rowCount = 0;
  int ms = 0;
  String? command;
  int? rowsAffected;
  String? error;
  bool skipped = false;
  bool get hasGrid => columns.isNotEmpty && error == null;
}

class SqlSession extends ChangeNotifier {
  SqlSession({required this.conn, required this.settings, this.onHostKey, this.password});
  final SqlConnection conn;
  final SqlSettings settings;
  final void Function(String fp)? onHostKey;
  /// Kayıtlı parola yoksa ekrandan alınan parola
  String? password;

  SqlDriver? driver;
  SshTunnel? tunnel;
  SessionState state = SessionState.idle;
  String? error;
  /// Bağlanma evresi kodu: 'tunnel' | 'db' (metin ekranda sözlükten alınır)
  String? phase;
  late bool readOnly = conn.readOnly;
  bool _busy = false;
  bool get busy => _busy;
  bool get connected => state == SessionState.connected && driver != null;
  String get dialect => conn.meta.dialect;

  Future<void> connect() async {
    state = SessionState.connecting;
    error = null;
    phase = null;
    notifyListeners();
    try {
      await close(silent: true);
      String? host;
      int? port;
      if (conn.sshEnabled) {
        phase = 'tunnel';
        notifyListeners();
        final t = SshTunnel(conn, onHostKey: onHostKey);
        await t.open(conn.host, conn.port);
        tunnel = t;
        host = '127.0.0.1';
        port = t.localPort;
      }
      phase = 'db';
      notifyListeners();
      final d = createDriver(conn, hostOverride: host, portOverride: port, password: password);
      await d.connect();
      driver = d;
      readOnly = conn.readOnly;
      state = SessionState.connected;
      phase = null;
    } catch (e) {
      error = e.toString();
      state = SessionState.failed;
      await close(silent: true, keepState: true);
      rethrow;
    } finally {
      notifyListeners();
    }
  }

  Future<void> close({bool silent = false, bool keepState = false}) async {
    final d = driver;
    final t = tunnel;
    driver = null;
    tunnel = null;
    if (d != null) await d.close().catchError((_) {});
    if (t != null) await t.close().catchError((_) {});
    if (!keepState) state = SessionState.closed;
    if (!silent) notifyListeners();
  }

  Future<void> cancel() async {
    await driver?.cancel();
  }

  /// Salt okunur kipte yazma sayılan ifadeler
  List<(Statement, Classification)> blocked(List<Statement> stmts) =>
      !readOnly ? const [] : [for (final s in stmts) if (classify(s.text, dialect).kind == StatementKind.write) (s, classify(s.text, dialect))];

  /// "Bu seferlik çalıştır" onayı (masaüstü 12-salt-okunur diyaloğu)
  Future<bool> confirmRunOnce(BuildContext context, List<(Statement, Classification)> list) async {
    final s = MtStrings.of(context);
    final c = MtColors.of(context);
    return await showDialog<bool>(
          context: context,
          builder: (ctx) => AlertDialog(
            title: Row(children: [Icon(Icons.lock_outline, size: 18, color: c.accent), const SizedBox(width: 8), Text(s.sqRoTitle)]),
            content: ConstrainedBox(constraints: const BoxConstraints(maxWidth: 520), child: Column(mainAxisSize: MainAxisSize.min, crossAxisAlignment: CrossAxisAlignment.start, children: [
              Text(s.sqRoMessage),
              const SizedBox(height: 10),
              for (final x in list.take(8))
                Padding(padding: const EdgeInsets.only(bottom: 6), child: Row(crossAxisAlignment: CrossAxisAlignment.start, children: [
                  Text('•  ', style: MtText.body.copyWith(color: c.text2)),
                  Text(x.$2.keyword, style: MtText.body.copyWith(fontWeight: FontWeight.w700, color: c.text)),
                  const SizedBox(width: 8),
                  Expanded(child: Text(x.$1.text.replaceAll(RegExp(r'\s+'), ' '), maxLines: 1, overflow: TextOverflow.ellipsis, style: MtText.mono.copyWith(color: c.text2))),
                ])),
              if (list.length > 8) Text('… +${list.length - 8}', style: MtText.small.copyWith(color: c.text3)),
              const SizedBox(height: 8),
              Text(s.sqRoHint, style: MtText.small.copyWith(color: c.text2)),
            ])),
            actionsPadding: const EdgeInsets.fromLTRB(22, 0, 22, 18),
            actions: [
              MtButton(label: s.commonCancel, onPressed: () => Navigator.pop(ctx, false)),
              MtButton(label: s.sqRoRunOnce, kind: MtBtnKind.primary, onPressed: () => Navigator.pop(ctx, true)),
            ],
          ),
        ) ??
        false;
  }

  /// İfadeleri sırayla çalıştırır; her ifade için [onResult] çağrılır. Salt okunur kipte yazma ifadeleri onay ister.
  /// Döner: iptal/atlama olduysa false.
  Future<bool> run(BuildContext context, String sql, {String? database, required void Function(StatementResult r) onResult, void Function()? onProgress}) async {
    final d = driver;
    if (d == null) return false;
    final stmts = splitStatements(sql, dialect);
    if (stmts.isEmpty) return true;
    final bl = blocked(stmts);
    var runOnce = false;
    if (bl.isNotEmpty) {
      if (!context.mounted) return false;
      final notRun = MtStrings.of(context).sqRoNotRun;
      runOnce = await confirmRunOnce(context, bl);
      if (!runOnce) {
        for (final st in stmts) {
          onResult(StatementResult(sql: st.text)..skipped = true..error = notRun);
        }
        return false;
      }
    }
    _busy = true;
    notifyListeners();
    try {
      if (runOnce) await d.setReadOnly(false);
      for (final st in stmts) {
        final r = StatementResult(sql: st.text);
        final sw = Stopwatch()..start();
        try {
          await for (final ev in d.query(st.text, database: database, limit: settings.rowLimit)) {
            switch (ev) {
              case QColumns(:final columns): r.columns = columns;
              case QRows(:final rows):
                r.rows.addAll(rows);
                r.rowCount = r.rows.length;
                onProgress?.call();
              case QEnd(:final rowCount, :final truncated):
                r.rowCount = rowCount;
                r.truncated = truncated;
              case QCommand(:final command, :final rowsAffected):
                r.command = command;
                r.rowsAffected = rowsAffected;
            }
          }
        } catch (e) {
          r.error = e is SqlCancelled ? null : e.toString();
          r.ms = sw.elapsedMilliseconds;
          if (e is SqlCancelled) r.command = 'CANCELLED';
          onResult(r);
          return false;
        }
        r.ms = sw.elapsedMilliseconds;
        onResult(r);
      }
      return true;
    } finally {
      if (runOnce && driver != null) await driver!.setReadOnly(true).catchError((_) {});
      _busy = false;
      notifyListeners();
    }
  }

  @override
  void dispose() {
    unawaited(close(silent: true));
    super.dispose();
  }
}

/// Sunucu/ürün açıklaması (durum çubuğu)
String sessionInfoLine(SqlSession s, MtStrings t) {
  final i = s.driver?.serverInfo;
  if (i == null) return '';
  return [i.product, if (i.tls == false && !s.conn.meta.isFile) t.sqCwNoTls, if (i.database != null) i.database!, if (i.user != null) i.user!].join(' · ');
}
