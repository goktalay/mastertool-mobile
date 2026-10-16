// Servis tanıma — saf ayrıştırıcılar (masaüstü iptools/src/scanner.js: printable, parseHttp, parseCert, mDNS PTR, diffScans, toCsv).
// Ağ erişimi yok; birim testleri doğrudan bu dosyayı sınar.
import 'dart:convert';
import 'dart:typed_data';

import 'ip_ranges.dart';

/// Yalnız yazdırılabilir karakterler, tek satır, en çok [max] karakter
String printable(String? s, [int max = 120]) {
  final t = (s ?? '').replaceAll(RegExp(r'[\x00-\x1f\x7f]+'), ' ').replaceAll(RegExp(r'\s+'), ' ').trim();
  return t.length > max ? t.substring(0, max) : t;
}

String decodeEntities(String s) => s.replaceAllMapped(RegExp(r'&(#x[0-9a-f]+|#\d+|amp|lt|gt|quot|apos|nbsp);', caseSensitive: false), (m) {
      final k = m.group(1)!.toLowerCase();
      if (k.startsWith('#')) {
        final n = k[1] == 'x' ? int.tryParse(k.substring(2), radix: 16) : int.tryParse(k.substring(1));
        return n != null && n > 0 && n < 0x110000 ? String.fromCharCode(n) : m.group(0)!;
      }
      return const {'amp': '&', 'lt': '<', 'gt': '>', 'quot': '"', 'apos': "'", 'nbsp': ' '}[k]!;
    });

class HttpInfo {
  const HttpInfo({required this.status, this.server, this.title});
  final int status;
  final String? server, title;
  Map<String, dynamic> toJson() => {'status': status, 'server': server, 'title': title};
}

/// Ham "GET /" yanıtı → HttpInfo (yalnız durum, Server ve <title>; gövdenin kalanı atılır)
HttpInfo? parseHttp(List<int> raw) {
  final text = latin1.decode(raw, allowInvalid: true);
  final m = RegExp(r'^HTTP/\d(?:\.\d)?\s+(\d{3})').firstMatch(text);
  if (m == null) return null;
  final sep = RegExp(r'\r?\n\r?\n').firstMatch(text);
  final head = sep == null ? text : text.substring(0, sep.start);
  final body = sep == null ? '' : text.substring(sep.start);
  final server = RegExp(r'^Server:\s*(.*)$', multiLine: true, caseSensitive: false).firstMatch(head)?.group(1)?.trim();
  String? title;
  final tm = RegExp(r'<title[^>]*>([\s\S]*?)</title>', caseSensitive: false).firstMatch(body);
  if (tm != null) {
    var tt = tm.group(1)!;
    try { tt = utf8.decode(latin1.encode(tt)); } catch (_) {/* olduğu gibi */}
    final t = printable(decodeEntities(tt), 100);
    title = t.isEmpty ? null : t;
  }
  return HttpInfo(status: int.parse(m.group(1)!), server: server == null || server.isEmpty ? null : printable(server, 80), title: title);
}

class CertInfo {
  const CertInfo({this.cn, this.org, this.issuer, this.notAfter, this.selfSigned = false});
  final String? cn, org, issuer, notAfter;
  final bool selfSigned;
  Map<String, dynamic> toJson() => {'cn': cn, 'org': org, 'issuer': issuer, 'notAfter': notAfter, 'selfSigned': selfSigned};
  static CertInfo? fromJson(Map? j) => j == null ? null : CertInfo(cn: j['cn'] as String?, org: j['org'] as String?, issuer: j['issuer'] as String?,
      notAfter: j['notAfter'] as String?, selfSigned: j['selfSigned'] == true);
}

/// "/CN=example.com/O=Örnek" ya da "CN=example.com, O=Örnek" biçimli ayırt edici addan alan değeri
String? dnField(String dn, String key) {
  final m = RegExp('(?:^|[/,])\\s*$key=([^/,]*)').firstMatch(dn);
  final v = m?.group(1)?.trim();
  return v == null || v.isEmpty ? null : v;
}

/// Dart X509Certificate alanları (subject/issuer DN metni, bitiş) → CertInfo
CertInfo? parseCert({required String subject, required String issuer, DateTime? notAfter}) {
  if (subject.isEmpty) return null;
  final cn = dnField(subject, 'CN'), org = dnField(subject, 'O');
  final icn = dnField(issuer, 'CN'), iorg = dnField(issuer, 'O');
  return CertInfo(
    cn: cn == null ? null : printable(cn, 80),
    org: org == null ? null : printable(org, 80),
    issuer: icn != null || iorg != null ? printable(icn ?? iorg, 80) : null,
    notAfter: notAfter?.toUtc().toIso8601String(),
    selfSigned: issuer.isNotEmpty && icn == cn && iorg == org,
  );
}

// --- mDNS PTR (tek sorgu, cihazın kendisine) ------------------------------------------------------
String reverseName(String ip) => '${ip.split('.').reversed.join('.')}.in-addr.arpa';

Uint8List _encodeDnsName(String name) {
  final out = <int>[];
  for (final l in name.split('.').where((x) => x.isNotEmpty)) {
    final b = utf8.encode(l);
    out..add(b.length)..addAll(b);
  }
  out.add(0);
  return Uint8List.fromList(out);
}

/// PTR sorgusu; QU biti: yanıt doğrudan bize (tek noktaya) gelsin
Uint8List buildPtrQuery(String ip) {
  final head = Uint8List(12);
  head[5] = 1; // QDCOUNT
  final q = Uint8List(4);
  q[1] = 12; // PTR
  q[2] = 0x80; q[3] = 0x01; // QU | IN
  return Uint8List.fromList([...head, ..._encodeDnsName(reverseName(ip)), ...q]);
}

(String, int)? _readName(Uint8List buf, int off) {
  final labels = <String>[];
  var o = off, next = -1;
  for (var jumps = 0; jumps < 32; jumps++) {
    if (o >= buf.length) return null;
    final len = buf[o];
    if (len == 0) return (labels.join('.'), next < 0 ? o + 1 : next);
    if ((len & 0xc0) == 0xc0) {
      if (o + 1 >= buf.length) return null;
      if (next < 0) next = o + 2;
      o = ((len & 0x3f) << 8) | buf[o + 1];
      continue;
    }
    if (o + 1 + len > buf.length) return null;
    labels.add(utf8.decode(buf.sublist(o + 1, o + 1 + len), allowMalformed: true));
    o += 1 + len;
  }
  return null;
}

int _u16(Uint8List b, int o) => (b[o] << 8) | b[o + 1];

/// Yanıttaki ilk PTR kaydı → ad (sondaki nokta atılır, ".local" korunur) ya da null
String? parsePtrResponse(Uint8List buf, String ip) {
  if (buf.length < 12 || (buf[2] & 0x80) == 0) return null;
  final qd = _u16(buf, 4);
  final an = _u16(buf, 6) + _u16(buf, 8) + _u16(buf, 10);
  var o = 12;
  for (var i = 0; i < qd; i++) {
    final n = _readName(buf, o);
    if (n == null) return null;
    o = n.$2 + 4;
  }
  final want = reverseName(ip).toLowerCase();
  for (var i = 0; i < an; i++) {
    final n = _readName(buf, o);
    if (n == null || n.$2 + 10 > buf.length) return null;
    final type = _u16(buf, n.$2);
    final rdlen = _u16(buf, n.$2 + 8);
    final rd = n.$2 + 10;
    if (type == 12 && n.$1.toLowerCase() == want) {
      final v = _readName(buf, rd);
      if (v != null && v.$1.isNotEmpty) {
        final name = printable(v.$1.replaceAll(RegExp(r'\.$'), ''), 80);
        return name.isEmpty ? null : name;
      }
    }
    o = rd + rdlen;
  }
  return null;
}

// --- Sonuç modeli -------------------------------------------------------------------------------
class PortHit {
  PortHit({required this.port, required this.group, required this.name, this.banner, this.title, this.server, this.status, this.tls});
  final int port;
  final String group, name;
  final String? banner, title, server;
  final int? status;
  final CertInfo? tls;
  Map<String, dynamic> toJson() => {'port': port, 'key': group, 'name': name, 'banner': banner, 'title': title, 'server': server, 'status': status, 'tls': tls?.toJson()};
  factory PortHit.fromJson(Map j) => PortHit(port: (j['port'] as num).toInt(), group: (j['key'] ?? '').toString(), name: (j['name'] ?? '').toString(),
      banner: j['banner'] as String?, title: j['title'] as String?, server: j['server'] as String?, status: (j['status'] as num?)?.toInt(),
      tls: CertInfo.fromJson(j['tls'] as Map?));
}

/// Bulunan cihaz. alive: 'tcp' (bağlantı açıldı ya da reddedildi) | 'name' (yalnız ad çözümüne yanıt verdi) | 'ping' | 'arp' (masaüstü).
/// status: 'new' | 'same' | 'gone'. MAC/üretici mobilde genelde yoktur (Android 10+ ve iOS ARP tablosunu vermez).
class ScanHost {
  ScanHost({required this.ip, required this.alive, this.rttMs, this.ttl, this.mac, this.vendor, this.localMac = false, this.name, this.mdns,
      List<PortHit>? ports, this.status = 'same'})
      : ports = ports ?? [];
  final String ip;
  String alive;
  double? rttMs;
  int? ttl;
  String? mac, vendor, name, mdns;
  bool localMac;
  List<PortHit> ports;
  String status;

  String? get displayName => name ?? mdns;

  ScanHost copyWith({String? status, List<PortHit>? ports}) => ScanHost(ip: ip, alive: alive, rttMs: rttMs, ttl: ttl, mac: mac, vendor: vendor,
      localMac: localMac, name: name, mdns: mdns, ports: ports ?? List.of(this.ports), status: status ?? this.status);

  Map<String, dynamic> toJson() => {'ip': ip, 'alive': alive, 'rttMs': rttMs, 'ttl': ttl, 'mac': mac, 'vendor': vendor, 'localMac': localMac, 'name': name,
      'mdns': mdns, 'ports': ports.map((p) => p.toJson()).toList(), 'status': status};
  factory ScanHost.fromJson(Map j) => ScanHost(ip: (j['ip'] ?? '').toString(), alive: (j['alive'] ?? 'tcp').toString(), rttMs: (j['rttMs'] as num?)?.toDouble(),
      ttl: (j['ttl'] as num?)?.toInt(), mac: j['mac'] as String?, vendor: j['vendor'] as String?, localMac: j['localMac'] == true, name: j['name'] as String?,
      mdns: j['mdns'] as String?, ports: [for (final p in (j['ports'] as List? ?? const [])) PortHit.fromJson(p as Map)], status: (j['status'] ?? 'same').toString());
}

class ScanResult {
  ScanResult({required this.startedAt, required this.finishedAt, required this.scanned, required this.stopped, required this.hosts});
  final int startedAt, finishedAt, scanned;
  final bool stopped;
  final List<ScanHost> hosts;
  Map<String, dynamic> toJson() => {'startedAt': startedAt, 'finishedAt': finishedAt, 'scanned': scanned, 'stopped': stopped, 'hosts': hosts.map((h) => h.toJson()).toList()};
  factory ScanResult.fromJson(Map j) => ScanResult(startedAt: (j['startedAt'] as num?)?.toInt() ?? 0, finishedAt: (j['finishedAt'] as num?)?.toInt() ?? 0,
      scanned: (j['scanned'] as num?)?.toInt() ?? 0, stopped: j['stopped'] == true, hosts: [for (final h in (j['hosts'] as List? ?? const [])) ScanHost.fromJson(h as Map)]);
  int get newCount => hosts.where((h) => h.status == 'new').length;
  int get goneCount => hosts.where((h) => h.status == 'gone').length;
  int get liveCount => hosts.where((h) => h.status != 'gone').length;
}

/// Önceki taramaya göre: her cihaza status 'new' | 'same'; önceki taramada olup şimdi olmayanlar 'gone' olarak eklenir.
/// Eşleme anahtarı MAC (varsa), yoksa IP.
List<ScanHost> diffScans(ScanResult? prev, List<ScanHost> cur) {
  String key(ScanHost h) => h.mac != null ? 'm:${h.mac}' : 'i:${h.ip}';
  final before = {for (final h in prev?.hosts ?? const <ScanHost>[]) if (h.status != 'gone') key(h): h};
  final seen = <String>{};
  final hosts = <ScanHost>[];
  for (final h in cur) {
    final k = key(h);
    seen.add(k);
    hosts.add(h.copyWith(status: prev == null ? 'same' : (before.containsKey(k) ? 'same' : 'new')));
  }
  for (final e in before.entries) {
    if (!seen.contains(e.key)) hosts.add(e.value.copyWith(status: 'gone'));
  }
  return hosts..sort((a, b) => ipKey(a.ip).compareTo(ipKey(b.ip)));
}

String _csvCell(Object? v) {
  final s = v == null ? '' : v.toString();
  return RegExp(r'[",;\r\n]').hasMatch(s) ? '"${s.replaceAll('"', '""')}"' : s;
}

/// CSV (UTF-8 BOM; Excel doğrudan açar)
String toCsv(ScanResult scan) {
  final rows = <List<Object?>>[['ip', 'name', 'mac', 'vendor', 'rtt_ms', 'status', 'services']];
  for (final h in scan.hosts) {
    rows.add([h.ip, h.name ?? h.mdns ?? '', h.mac ?? '', h.vendor ?? '', h.rttMs ?? '', h.status, h.ports.map((p) => '${p.name} (${p.port})').join(' | ')]);
  }
  return '\u{FEFF}${rows.map((r) => r.map(_csvCell).join(',')).join('\r\n')}\r\n';
}

String toJsonExport(ScanResult scan) => const JsonEncoder.withIndent('  ').convert(scan.toJson());
