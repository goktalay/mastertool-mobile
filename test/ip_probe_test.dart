// IP Tools servis tanıma ve sonuç yardımcıları — masaüstü scanner.js saf işlevleriyle aynı davranış.
import 'dart:convert';
import 'dart:typed_data';

import 'package:flutter_test/flutter_test.dart';
import 'package:master_tool/modules/iptools/ip_actions.dart';
import 'package:master_tool/modules/iptools/ip_model.dart';
import 'package:master_tool/modules/iptools/ip_ports.dart';
import 'package:master_tool/modules/iptools/ip_probe.dart';
import 'package:master_tool/modules/iptools/ip_scanner.dart';

void main() {
  test('printable: tek satır, denetim karakterleri, kısaltma', () {
    expect(printable('SSH-2.0-OpenSSH_8.2\r\n'), 'SSH-2.0-OpenSSH_8.2');
    expect(printable('a\x00b\tc   d'), 'a b c d');
    expect(printable('x' * 200, 10).length, 10);
    expect(printable(null), '');
  });

  test('parseHttp: durum, Server, başlık; varlıklar ve UTF-8', () {
    final raw = latin1.encode('HTTP/1.1 200 OK\r\nServer: nginx/1.18\r\nContent-Type: text/html\r\n\r\n<html><head><title>Disk &amp; Station &#x2014; ${latin1.decode(utf8.encode('Örnek'))}</title></head></html>');
    final h = parseHttp(raw)!;
    expect(h.status, 200);
    expect(h.server, 'nginx/1.18');
    expect(h.title, 'Disk & Station — Örnek');
    expect(parseHttp(latin1.encode('garbage')), null);
    final noTitle = parseHttp(latin1.encode('HTTP/1.0 401 Unauthorized\r\nWWW-Authenticate: Basic\r\n\r\n'))!;
    expect(noTitle.status, 401);
    expect(noTitle.server, null);
    expect(noTitle.title, null);
  });

  test('parseCert: konu, kuruluş, veren, kendinden imzalı', () {
    final c = parseCert(subject: '/CN=synology.com/O=Synology Inc', issuer: '/CN=Synology Inc. CA/O=Synology Inc', notAfter: DateTime.utc(2031, 3, 1))!;
    expect(c.cn, 'synology.com');
    expect(c.org, 'Synology Inc');
    expect(c.issuer, 'Synology Inc. CA');
    expect(c.selfSigned, false);
    expect(c.notAfter, '2031-03-01T00:00:00.000Z');
    final self = parseCert(subject: 'CN=router.lan, O=Home', issuer: 'CN=router.lan, O=Home')!;
    expect(self.selfSigned, true);
    expect(parseCert(subject: '', issuer: ''), null);
    expect(dnField('/C=TR/ST=Ankara/O=Veilox', 'ST'), 'Ankara');
  });

  test('mDNS PTR: sorgu kurma ve yanıt çözme', () {
    final q = buildPtrQuery('192.168.1.10');
    expect(q.sublist(0, 12), [0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0]);
    expect(q.sublist(q.length - 4), [0, 12, 0x80, 0x01]);
    expect(reverseName('192.168.1.10'), '10.1.168.192.in-addr.arpa');
    // Yanıt: başlık (QR), 1 soru, 1 cevap (PTR → "DiskStation.local.")
    final name = q.sublist(12, q.length - 4);
    final rr = <int>[...name, 0, 12, 0, 1, 0, 0, 0, 120];
    final target = <int>[11, ...utf8.encode('DiskStation'), 5, ...utf8.encode('local'), 0];
    rr..addAll([0, target.length])..addAll(target);
    final resp = Uint8List.fromList([0, 0, 0x84, 0, 0, 1, 0, 1, 0, 0, 0, 0, ...name, 0, 12, 0, 1, ...rr]);
    expect(parsePtrResponse(resp, '192.168.1.10'), 'DiskStation.local');
    expect(parsePtrResponse(resp, '192.168.1.11'), null); // başka adresin yanıtı
    expect(parsePtrResponse(Uint8List.fromList([0, 0, 0, 0]), '192.168.1.10'), null);
    // Sıkıştırılmış ad (işaretçi 0xC00C → soru adı)
    final resp2 = Uint8List.fromList([0, 0, 0x84, 0, 0, 1, 0, 1, 0, 0, 0, 0, ...name, 0, 12, 0, 1, 0xC0, 0x0C, 0, 12, 0, 1, 0, 0, 0, 120, 0, target.length, ...target]);
    expect(parsePtrResponse(resp2, '192.168.1.10'), 'DiskStation.local');
  });

  test('diffScans: yeni / aynı / kaybolan, MAC ya da IP ile eşleme', () {
    final prev = ScanResult(startedAt: 0, finishedAt: 1, scanned: 10, stopped: false, hosts: [
      ScanHost(ip: '192.168.1.1', alive: 'tcp'),
      ScanHost(ip: '192.168.1.88', alive: 'tcp', mac: 'AA:BB:CC:DD:EE:FF'),
      ScanHost(ip: '192.168.1.90', alive: 'tcp', status: 'gone'),
    ]);
    final cur = [ScanHost(ip: '192.168.1.1', alive: 'tcp'), ScanHost(ip: '192.168.1.77', alive: 'tcp')];
    final d = diffScans(prev, cur);
    expect(d.map((h) => '${h.ip}:${h.status}').toList(), ['192.168.1.1:same', '192.168.1.77:new', '192.168.1.88:gone']);
    expect(diffScans(null, cur).every((h) => h.status == 'same'), true);
  });

  test('CSV ve JSON dışa aktarım', () {
    final r = ScanResult(startedAt: 0, finishedAt: 1, scanned: 1, stopped: false, hosts: [
      ScanHost(ip: '192.168.1.10', alive: 'tcp', name: 'nas,lan', rttMs: 2, ports: [PortHit(port: 22, group: 'ssh', name: 'SSH', banner: 'SSH-2.0'), PortHit(port: 80, group: 'web', name: 'HTTP')]),
    ]);
    final csv = toCsv(r);
    expect(csv.startsWith('\u{FEFF}ip,name,mac,vendor,rtt_ms,status,services\r\n'), true);
    expect(csv.contains('192.168.1.10,"nas,lan",,,2.0,same,SSH (22) | HTTP (80)\r\n'), true);
    final j = jsonDecode(toJsonExport(r)) as Map;
    expect((j['hosts'] as List).length, 1);
    final back = ScanResult.fromJson(j);
    expect(back.hosts.single.ports.first.banner, 'SSH-2.0');
  });

  test('portlar: sabit liste, yalnız daraltılır; ayar sınırları', () {
    expect(kPorts.length, 15);
    expect(activePorts([21, 9999]).length, 14);
    expect(sanitizeDisabled([21, '22', 9999, 21]), [21, 22]);
    final s = ScanSettings.fromJson({'disabledPorts': [21], 'concurrency': 999, 'timeoutMs': 5});
    expect(s.concurrency, 64);
    expect(s.timeoutMs, 200);
    expect(ScanSettings.fromJson(null).toJson(), {'disabledPorts': [], 'concurrency': 64, 'timeoutMs': 1000});
    expect(scanSettingsOf({'scan': {'concurrency': 8}}).concurrency, 8);
    expect(withScanSettings({'appTheme': 'dark', 'language': 'tr'}, ScanSettings())['appTheme'], 'dark');
  });

  test('tekrar engeli 30 sn', () {
    expect(rescanWaitMs(null), 0);
    expect(rescanWaitMs(1000, 20000), 11000);
    expect(rescanWaitMs(1000, 40000), 0);
  });

  test('etiket eylemleri', () {
    expect(actionFor('web', '192.168.1.1', 80).target, 'http://192.168.1.1/');
    expect(actionFor('web', '192.168.1.1', 8443).target, 'https://192.168.1.1:8443/');
    expect(actionFor('ssh', '192.168.1.1', 2222).target, 'ssh -p 2222 192.168.1.1');
    expect(actionFor('vnc', '192.168.1.1', 5901).target, '192.168.1.1:1');
    expect(actionFor('printer', '192.168.1.20', 9100).kind, ActionKind.open);
    expect(actionFor('db', '192.168.1.50', 5432).kind, ActionKind.copy);
  });

  test('iş havuzu en çok n eşzamanlı', () async {
    final pool = Pool(2);
    var active = 0, peak = 0;
    await Future.wait(List.generate(6, (_) => pool.run(() async {
      active++;
      if (active > peak) peak = active;
      await Future<void>.delayed(const Duration(milliseconds: 5));
      active--;
    })));
    expect(peak, 2);
  });
}
