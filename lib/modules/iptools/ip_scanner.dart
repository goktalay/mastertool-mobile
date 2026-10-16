// Ağ keşfi — IP Tools'un denetim katmanı (masaüstü iptools/src/scanner.js'in mobil uyarlaması). Tasarım gereği yalnız şunları yapar:
//   1) Canlılık + servis: mobilde ham soket, ping ve ARP tablosu yoktur. Bu yüzden canlılık, ports.dart'taki sabit listeye
//      standart TCP bağlantı denemesiyle belirlenir: bağlantı açıldı → port açık ve cihaz canlı; bağlantı REDDEDİLDİ (RST)
//      → port kapalı ama cihaz canlı; zaman aşımı / erişilemez → sessiz. Bağlantı açılınca en çok: sunucunun kendi karşılama
//      satırı okunur (banner), tek bir "GET /" ile <title> ve Server başlığı alınır (http), TLS el sıkışmasında sunucunun
//      sunduğu sertifikanın konu adı okunur (tls). Özel protokol paketi gönderilmez; bazı portlara hiçbir şey yazılmaz.
//   2) Ad: işletim sisteminin ters DNS'i ve tek bir mDNS PTR sorgusu (cihazın kendisine, 5353/udp, QU biti). Yalnız ad
//      çözümüne yanıt veren cihaz da canlı sayılır ('name').
//   MAC / üretici: mobil işletim sistemleri ARP tablosunu uygulamaya vermez (Android 10+, iOS) → alan boş kalır.
// Hız: en çok kMaxConcurrency eşzamanlı iş, cihaz başına en çok kMaxTimeoutMs, tekrar tarama en erken kMinRescanMs sonra.
// Tarama her an durdurulabilir. Kod tabanında olmayanlar (bilerek): zafiyet denemesi, parola deneme, SNMP/SMB sorgulama,
// SYN taraması, geniş port taraması, internet adresi taraması.
import 'dart:async';
import 'dart:io';
import 'dart:typed_data';

import 'ip_model.dart';
import 'ip_ports.dart';
import 'ip_probe.dart';
import 'ip_ranges.dart';

const kProgressEveryMs = 120;

/// Aynı kayıt için tekrar tarama en erken kMinRescanMs sonra → bekleme süresi (ms), 0 = hemen
int rescanWaitMs(int? lastScanAt, [int? now]) {
  if (lastScanAt == null) return 0;
  final wait = kMinRescanMs - ((now ?? DateTime.now().millisecondsSinceEpoch) - lastScanAt);
  return wait > 0 ? wait : 0;
}

/// Basit iş havuzu: en çok n iş aynı anda
class Pool {
  Pool(this.n);
  final int n;
  int _active = 0;
  final _queue = <void Function()>[];
  Future<T> run<T>(Future<T> Function() fn) {
    final c = Completer<T>();
    void start() {
      _active++;
      fn().then(c.complete, onError: c.completeError).whenComplete(() {
        _active--;
        if (_queue.isNotEmpty) _queue.removeAt(0)();
      });
    }
    if (_active < n) {
      start();
    } else {
      _queue.add(start);
    }
    return c.future;
  }
}

class ScanProgress {
  const ScanProgress({required this.phase, required this.done, required this.total, required this.found, required this.hosts});
  final String phase; // ports | names
  final int done, total, found;
  final List<ScanHost> hosts;
}

class ProbeResult {
  ProbeResult({this.open = false, this.refused = false, this.banner, this.http, this.cert});
  bool open, refused;
  String? banner;
  HttpInfo? http;
  CertInfo? cert;
}

class IpScanner {
  IpScanner({DateTime Function()? now}) : _now = now ?? DateTime.now;
  final DateTime Function() _now;
  int get _ms => _now().millisecondsSinceEpoch;

  /// Tek bağlantı denemesi + izin verilen en küçük okuma
  Future<ProbeResult> probePort(String ip, PortInfo info, int timeoutMs, {bool Function()? stopped}) async {
    final r = ProbeResult();
    Socket? sock;
    try {
      sock = await Socket.connect(ip, info.port, timeout: Duration(milliseconds: timeoutMs));
    } on SocketException catch (e) {
      final code = e.osError?.errorCode;
      final msg = (e.osError?.message ?? e.message).toLowerCase();
      if (code == 111 || code == 61 || code == 10061 || msg.contains('refused')) r.refused = true; // ECONNREFUSED: cihaz canlı, port kapalı
      return r;
    } catch (_) {
      return r;
    }
    r.open = true;
    try {
      sock.setOption(SocketOption.tcpNoDelay, true);
      if (info.probe == Probe.none || (stopped?.call() ?? false)) return r;
      Socket s = sock;
      if (info.probe == Probe.tls) {
        try {
          s = await SecureSocket.secure(sock, onBadCertificate: (_) => true).timeout(Duration(milliseconds: kHttpTimeoutMs));
          final c = s is SecureSocket ? s.peerCertificate : null;
          if (c != null) r.cert = parseCert(subject: c.subject, issuer: c.issuer, notAfter: c.endValidity);
        } catch (_) {
          return r; // TCP açık ama TLS el sıkışması başarısız: port yine de açık
        }
      }
      final chunks = <int>[];
      final done = Completer<void>();
      late StreamSubscription<Uint8List> sub;
      sub = s.listen((d) {
        if (chunks.length > 65536) return;
        chunks.addAll(d);
        if (info.probe == Probe.banner) {
          final text = String.fromCharCodes(chunks);
          if (text.contains('\n') || chunks.length > 512) {
            final b = printable(text.split(RegExp(r'\r?\n')).first, 120);
            r.banner = b.isEmpty ? null : b;
            if (!done.isCompleted) done.complete();
          }
        }
      }, onDone: () { if (!done.isCompleted) done.complete(); }, onError: (_) { if (!done.isCompleted) done.complete(); }, cancelOnError: true);
      final wait = info.probe == Probe.banner ? timeoutMs : kHttpTimeoutMs;
      if (info.probe == Probe.http || info.probe == Probe.tls) {
        s.write('GET / HTTP/1.0\r\nHost: $ip\r\nUser-Agent: IP-Tools\r\nAccept: text/html\r\nConnection: close\r\n\r\n');
        try { await s.flush(); } catch (_) {}
      }
      await done.future.timeout(Duration(milliseconds: wait), onTimeout: () {});
      await sub.cancel();
      if (info.probe != Probe.banner && chunks.isNotEmpty) r.http = parseHttp(chunks);
      return r;
    } catch (_) {
      return r;
    } finally {
      try { sock.destroy(); } catch (_) {}
    }
  }

  Future<String?> reverseDns(String ip, int timeoutMs) async {
    try {
      final a = await InternetAddress(ip).reverse().timeout(Duration(milliseconds: timeoutMs));
      final h = printable(a.host, 80);
      return h.isEmpty || h == ip ? null : h;
    } catch (_) {
      return null;
    }
  }

  Future<String?> mdnsName(String ip, int timeoutMs) async {
    RawDatagramSocket? sock;
    try {
      sock = await RawDatagramSocket.bind(InternetAddress.anyIPv4, 0);
      final c = Completer<String?>();
      sock.listen((ev) {
        if (ev != RawSocketEvent.read) return;
        final dg = sock!.receive();
        if (dg == null || dg.address.address != ip) return;
        final n = parsePtrResponse(dg.data, ip);
        if (!c.isCompleted) c.complete(n);
      }, onError: (_) { if (!c.isCompleted) c.complete(null); });
      sock.send(buildPtrQuery(ip), InternetAddress(ip), 5353);
      return await c.future.timeout(Duration(milliseconds: timeoutMs), onTimeout: () => null);
    } catch (_) {
      return null;
    } finally {
      sock?.close();
    }
  }

  /// Tarama: aralık × aktif port TCP denemeleri (canlılık + servis), sonra adlar. [stopped] true dönünce durur.
  Future<ScanResult> scan({required List<IpRange> ranges, required List<int> ports, int? concurrency, int? timeoutMs,
      bool Function()? stopped, void Function(ScanProgress p)? onProgress}) async {
    final conc = clampConcurrency(concurrency);
    final tmo = clampTimeout(timeoutMs);
    final portList = [for (final p in activePorts(const [])) if (ports.contains(p)) portInfo(p)!];
    bool isStopped() => stopped?.call() ?? false;
    final pool = Pool(conc);
    final ips = addresses(ranges).toList();
    final startedAt = _ms;
    final found = <String, ScanHost>{};
    var doneCount = 0, lastProgress = 0;
    void progress(String phase, int total, {bool force = false}) {
      final t = _ms;
      if (!force && t - lastProgress < kProgressEveryMs) return;
      lastProgress = t;
      onProgress?.call(ScanProgress(phase: phase, done: doneCount, total: total, found: found.length, hosts: found.values.toList()));
    }
    ScanHost host(String ip) => found.putIfAbsent(ip, () => ScanHost(ip: ip, alive: 'tcp'));

    // 1) canlılık + servisler: her adres × her port
    final total = ips.length * portList.length;
    await Future.wait([
      for (final ip in ips)
        for (final info in portList)
          pool.run(() async {
            if (isStopped()) return;
            final t0 = _ms;
            final r = await probePort(ip, info, tmo, stopped: isStopped);
            doneCount++;
            if (r.open || r.refused) {
              final h = host(ip);
              final rtt = (_ms - t0).toDouble();
              if (h.rttMs == null || rtt < h.rttMs!) h.rttMs = rtt;
              if (r.open) {
                h.ports.add(PortHit(port: info.port, group: info.group, name: info.name, banner: r.banner, title: r.http?.title, server: r.http?.server,
                    status: r.http?.status, tls: r.cert));
                h.ports.sort((a, b) => a.port.compareTo(b.port));
              }
            }
            progress('ports', total);
          }),
    ]);
    if (isStopped()) return _finish(found, startedAt, ips.length, true);
    progress('names', found.length, force: true);

    // 2) adlar (ters DNS + mDNS) — bulunan cihazlar
    doneCount = 0;
    final hosts = found.values.toList();
    await Future.wait([
      for (final h in hosts)
        pool.run(() async {
          if (isStopped()) return;
          final r = await Future.wait([reverseDns(h.ip, tmo), mdnsName(h.ip, tmo)]);
          h.name = r[0];
          h.mdns = r[1];
          doneCount++;
          progress('names', hosts.length);
        }),
    ]);
    return _finish(found, startedAt, ips.length, isStopped());
  }

  ScanResult _finish(Map<String, ScanHost> found, int startedAt, int total, bool stopped) {
    final hosts = found.values.toList()..sort((a, b) => ipKey(a.ip).compareTo(ipKey(b.ip)));
    return ScanResult(startedAt: startedAt, finishedAt: _ms, scanned: total, stopped: stopped, hosts: hosts);
  }
}
