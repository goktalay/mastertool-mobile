// IP Tools veri modeli — senkron `data` şeması masaüstüyle birebir (iptools/src/account.js RECORD_FIELDS / FOLDER_FIELDS /
// SETTINGS_FIELDS): kind record {name, color, range, folderId, createdAt}; kind folder {name, parentId, createdAt};
// kind settings (id "settings") {appTheme, language, scan{disabledPorts, concurrency, timeoutMs}}. Kimlikler UUID v4.
// Tarama sonuçları SENKRONLANMAZ (ip_store.dart: cihazda dosya). noticeAccepted yerel (ip_store.dart).
import 'dart:ui';

import '../ssh/ssh_model.dart' show parseHex;
import 'ip_ports.dart';
import 'ip_ranges.dart';

const kMaxConcurrency = 64;
const kMaxTimeoutMs = 1000;
const kMinTimeoutMs = 200;
const kMinRescanMs = 30000;
const kHttpTimeoutMs = 2000;

int clampConcurrency(Object? n) => ((n is num ? n.toInt() : int.tryParse(n.toString())) ?? kMaxConcurrency).clamp(1, kMaxConcurrency);
int clampTimeout(Object? ms) => ((ms is num ? ms.toInt() : int.tryParse(ms.toString())) ?? kMaxTimeoutMs).clamp(kMinTimeoutMs, kMaxTimeoutMs);

class IpRecord {
  IpRecord(this.id, this.raw);
  final String id;
  final Map<String, dynamic> raw;
  String get name => (raw['name'] ?? '').toString();
  String get color => (raw['color'] ?? '#22d3ee').toString();
  Color get colorValue => parseHex(color);
  String get range => (raw['range'] ?? '').toString();
  String? get folderId => raw['folderId'] as String?;
  int get createdAt => (raw['createdAt'] as num?)?.toInt() ?? 0;
  RangeResult get parsed => parseRanges(range);
  /// Aralık özeti ("192.168.1.0/24, 10.0.0.5"): kayıttaki metin tek satıra indirilmiş
  String get rangeSummary => range.split(RegExp(r'[,;\s]+')).where((x) => x.isNotEmpty).join(', ');

  static Map<String, dynamic> blank() => {'name': '', 'color': '#22d3ee', 'range': '', 'folderId': null, 'createdAt': DateTime.now().millisecondsSinceEpoch};
}

class IpFolder {
  IpFolder(this.id, this.raw);
  final String id;
  final Map<String, dynamic> raw;
  String get name => (raw['name'] ?? '').toString();
  String? get parentId => raw['parentId'] as String?;
}

/// Tarama ayarları (settings.scan) — sınırlar koda gömülü: yalnız daraltılır.
class ScanSettings {
  ScanSettings({List<int>? disabledPorts, int? concurrency, int? timeoutMs})
      : disabledPorts = sanitizeDisabled(disabledPorts),
        concurrency = clampConcurrency(concurrency),
        timeoutMs = clampTimeout(timeoutMs);
  final List<int> disabledPorts;
  final int concurrency, timeoutMs;

  factory ScanSettings.fromJson(Map? j) =>
      ScanSettings(disabledPorts: sanitizeDisabled(j?['disabledPorts']), concurrency: clampConcurrency(j?['concurrency']), timeoutMs: clampTimeout(j?['timeoutMs']));
  Map<String, dynamic> toJson() => {'disabledPorts': disabledPorts, 'concurrency': concurrency, 'timeoutMs': timeoutMs};
  List<int> get ports => activePorts(disabledPorts);
}

/// settings öğesi: {appTheme, language, scan}; bilinmeyen alanlar korunur.
ScanSettings scanSettingsOf(Map<String, dynamic>? settings) => ScanSettings.fromJson(settings?['scan'] as Map?);

Map<String, dynamic> withScanSettings(Map<String, dynamic>? settings, ScanSettings s) =>
    {'appTheme': null, 'language': null, ...?settings, 'scan': s.toJson()};
