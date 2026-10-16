// Cihazda kalan IP Tools verileri (SENKRONLANMAZ): kayıt başına son tarama sonucu ve kısa tarama geçmişi
// (<uygulama desteği>/ip_scans/<kayıt>.json), "yalnız yetkili olduğunuz ağ" uyarısı onayı (shared_preferences).
// Çalışan tarama tek örnekte (IpScanService): aynı anda tek tarama, 30 sn tekrar engeli, ilerleme bildirimi.
import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:path_provider/path_provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'ip_model.dart';
import 'ip_probe.dart';
import 'ip_scanner.dart';

/// Tarama geçmişi satırı (yalnız özet)
class ScanHistoryEntry {
  const ScanHistoryEntry({required this.at, required this.found, required this.added, required this.gone, required this.stopped});
  final int at, found, added, gone;
  final bool stopped;
  Map<String, dynamic> toJson() => {'at': at, 'found': found, 'new': added, 'gone': gone, 'stopped': stopped};
  factory ScanHistoryEntry.fromJson(Map j) => ScanHistoryEntry(at: (j['at'] as num?)?.toInt() ?? 0, found: (j['found'] as num?)?.toInt() ?? 0,
      added: (j['new'] as num?)?.toInt() ?? 0, gone: (j['gone'] as num?)?.toInt() ?? 0, stopped: j['stopped'] == true);
}

class StoredScan {
  StoredScan({this.last, List<ScanHistoryEntry>? history}) : history = history ?? [];
  ScanResult? last;
  final List<ScanHistoryEntry> history;
  Map<String, dynamic> toJson() => {'last': last?.toJson(), 'history': history.map((h) => h.toJson()).toList()};
  factory StoredScan.fromJson(Map j) => StoredScan(last: j['last'] == null ? null : ScanResult.fromJson(j['last'] as Map),
      history: [for (final h in (j['history'] as List? ?? const [])) ScanHistoryEntry.fromJson(h as Map)]);
}

class IpScanStore extends ChangeNotifier {
  final Map<String, StoredScan> _cache = {};
  bool? _noticeAccepted;

  Future<Directory> _dir() async {
    final d = Directory('${(await getApplicationSupportDirectory()).path}/ip_scans');
    if (!await d.exists()) await d.create(recursive: true);
    return d;
  }

  Future<File> _file(String recordId) async => File('${(await _dir()).path}/${recordId.replaceAll(RegExp(r'[^a-zA-Z0-9_-]'), '_')}.json');

  StoredScan? cached(String recordId) => _cache[recordId];

  Future<StoredScan> read(String recordId) async {
    final c = _cache[recordId];
    if (c != null) return c;
    var s = StoredScan();
    try {
      final f = await _file(recordId);
      if (await f.exists()) s = StoredScan.fromJson(jsonDecode(await f.readAsString()) as Map);
    } catch (_) {/* bozuk dosya: boş */}
    _cache[recordId] = s;
    notifyListeners();
    return s;
  }

  /// Tüm kayıtların son taramalarını önbelleğe alır (kitaplık kartları için)
  Future<void> preload(Iterable<String> ids) async {
    for (final id in ids) {
      if (!_cache.containsKey(id)) await read(id);
    }
  }

  Future<void> write(String recordId, StoredScan s) async {
    _cache[recordId] = s;
    notifyListeners();
    final f = await _file(recordId);
    final tmp = File('${f.path}.tmp');
    await tmp.writeAsString(jsonEncode(s.toJson()), flush: true);
    await tmp.rename(f.path);
  }

  Future<void> remove(String recordId) async {
    _cache.remove(recordId);
    notifyListeners();
    try {
      final f = await _file(recordId);
      if (await f.exists()) await f.delete();
    } catch (_) {}
  }

  /// Var olmayan kayıtların dosyalarını temizler
  Future<void> prune(Set<String> liveIds) async {
    try {
      await for (final e in (await _dir()).list()) {
        if (e is! File || !e.path.endsWith('.json')) continue;
        final id = e.uri.pathSegments.last.replaceAll('.json', '');
        if (!liveIds.contains(id)) {
          _cache.remove(id);
          await e.delete();
        }
      }
    } catch (_) {}
  }

  Future<bool> noticeAccepted() async {
    if (_noticeAccepted != null) return _noticeAccepted!;
    try {
      _noticeAccepted = (await SharedPreferences.getInstance()).getBool('ip.noticeAccepted') ?? false;
    } catch (_) {
      _noticeAccepted = false;
    }
    return _noticeAccepted!;
  }

  Future<void> acceptNotice() async {
    _noticeAccepted = true;
    notifyListeners();
    try {
      await (await SharedPreferences.getInstance()).setBool('ip.noticeAccepted', true);
    } catch (_) {}
  }
}

/// Çalışan tarama: tek örnek; aynı anda tek kayıt taranır.
class IpScanService extends ChangeNotifier {
  IpScanService(this.store, {IpScanner? scanner}) : scanner = scanner ?? IpScanner();
  final IpScanStore store;
  final IpScanner scanner;

  String? activeRecordId;
  ScanProgress? progress;
  bool _stop = false;
  String? lastError;

  bool get busy => activeRecordId != null;
  bool isScanning(String recordId) => activeRecordId == recordId;

  /// → null: başladı; 'busy': başka tarama sürüyor; 'rate:N' (N saniye): tekrar engeli; 'range': aralık geçersiz
  Future<String?> start(IpRecord rec, ScanSettings settings) async {
    if (busy) return 'busy';
    final parsed = rec.parsed;
    if (!parsed.ok) return 'range';
    final prev = await store.read(rec.id);
    final wait = rescanWaitMs(prev.last?.finishedAt);
    if (wait > 0) return 'rate:${(wait / 1000).ceil()}';
    activeRecordId = rec.id;
    _stop = false;
    lastError = null;
    progress = ScanProgress(phase: 'ports', done: 0, total: parsed.count * settings.ports.length, found: 0, hosts: const []);
    notifyListeners();
    unawaited(_run(rec, parsed, settings, prev));
    return null;
  }

  Future<void> _run(IpRecord rec, dynamic parsed, ScanSettings settings, StoredScan prev) async {
    try {
      final r = await scanner.scan(
        ranges: parsed.ranges, ports: settings.ports, concurrency: settings.concurrency, timeoutMs: settings.timeoutMs,
        stopped: () => _stop,
        onProgress: (p) {
          progress = p;
          notifyListeners();
        },
      );
      final hosts = diffScans(prev.last, r.hosts);
      final result = ScanResult(startedAt: r.startedAt, finishedAt: r.finishedAt, scanned: r.scanned, stopped: r.stopped, hosts: hosts);
      final hist = [ScanHistoryEntry(at: r.finishedAt, found: result.liveCount, added: result.newCount, gone: result.goneCount, stopped: r.stopped), ...prev.history];
      await store.write(rec.id, StoredScan(last: result, history: hist.take(20).toList()));
    } catch (e) {
      lastError = e.toString();
    } finally {
      activeRecordId = null;
      progress = null;
      notifyListeners();
    }
  }

  void stop() {
    _stop = true;
    notifyListeners();
  }
}
