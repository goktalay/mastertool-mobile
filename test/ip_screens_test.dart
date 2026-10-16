// IP Tools ekran görüntüleri: kitaplık, kayıt formu, tarama ekranı (kayıtlı sonuçla), cihaz ayrıntıları, ayarlar
// (telefon + tablet, gece + gündüz). Kalıp: test/ftp_screens_test.dart.
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:master_tool/core/account.dart';
import 'package:master_tool/core/l10n/gen/mt_strings.dart';
import 'package:master_tool/core/module_host.dart';
import 'package:master_tool/core/sync.dart';
import 'package:master_tool/core/theme.dart';
import 'package:master_tool/modules/iptools/ip_form.dart';
import 'package:master_tool/modules/iptools/ip_host_screen.dart';
import 'package:master_tool/modules/iptools/ip_model.dart';
import 'package:master_tool/modules/iptools/ip_module.dart';
import 'package:master_tool/modules/iptools/ip_probe.dart';
import 'package:master_tool/modules/iptools/ip_scan_screen.dart';
import 'package:master_tool/modules/iptools/ip_settings_screen.dart';
import 'package:master_tool/modules/iptools/ip_store.dart';
import 'package:path_provider_platform_interface/path_provider_platform_interface.dart';
import 'package:shared_preferences/shared_preferences.dart';

class _FakePath extends PathProviderPlatform {
  _FakePath(this.dir);
  final String dir;
  @override
  Future<String?> getApplicationSupportPath() async => dir;
  @override
  Future<String?> getTemporaryPath() async => dir;
}

Future<void> _loadFont() async {
  for (final p in ['/usr/share/fonts/truetype/dejavu/DejaVuSans.ttf', '/usr/share/fonts/truetype/dejavu/DejaVuSans-Bold.ttf', '/usr/share/fonts/truetype/dejavu/DejaVuSansMono.ttf']) {
    final f = File(p);
    if (!f.existsSync()) continue;
    final loader = FontLoader(p.contains('Mono') ? 'monospace' : 'Roboto')..addFont(Future.value(ByteData.view(f.readAsBytesSync().buffer)));
    await loader.load();
  }
}

Widget _app(Widget home, {required bool dark}) => MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: mtTheme(Brightness.light), darkTheme: mtTheme(Brightness.dark), themeMode: dark ? ThemeMode.dark : ThemeMode.light,
      locale: const Locale('tr'), supportedLocales: MtStrings.supportedLocales,
      localizationsDelegates: const [MtStrings.delegate, GlobalMaterialLocalizations.delegate, GlobalWidgetsLocalizations.delegate, GlobalCupertinoLocalizations.delegate],
      home: home,
    );

ScanHost _h(String ip, {String? name, String? mdns, double? rtt, List<PortHit> ports = const [], String status = 'same'}) =>
    ScanHost(ip: ip, alive: 'tcp', name: name, mdns: mdns, rttMs: rtt, ports: List.of(ports), status: status);
PortHit _p(int port, String g, String n, {String? banner, String? title, String? server, CertInfo? tls}) =>
    PortHit(port: port, group: g, name: n, banner: banner, title: title, server: server, tls: tls);

/// Masaüstü ekran görüntüsündeki "Ofis ağı" sonucu (MAC/üretici mobilde yok)
ScanResult _sample() => ScanResult(startedAt: 1792000000000, finishedAt: 1792000012000, scanned: 254, stopped: false, hosts: [
      _h('192.168.1.1', name: 'modem.lan', rtt: 1, ports: [_p(80, 'web', 'HTTP', title: 'Modem', server: 'lighttpd'), _p(443, 'web', 'HTTPS')]),
      _h('192.168.1.2', name: 'ap-kat1.lan', rtt: 1, ports: [_p(22, 'ssh', 'SSH', banner: 'SSH-2.0-dropbear'), _p(443, 'web', 'HTTPS')]),
      _h('192.168.1.10', name: 'nas.lan', mdns: 'DiskStation.local', rtt: 2, ports: [
        _p(22, 'ssh', 'SSH', banner: 'SSH-2.0-OpenSSH_8.2'), _p(80, 'web', 'HTTP', title: 'DiskStation', server: 'nginx'),
        _p(443, 'web', 'HTTPS', title: 'DiskStation', server: 'nginx', tls: const CertInfo(cn: 'synology.com', issuer: 'Synology Inc. CA', notAfter: '2031-03-01T00:00:00.000Z')),
        _p(445, 'smb', 'SMB'),
      ]),
      _h('192.168.1.20', name: 'yazici-ofis.lan', rtt: 3, ports: [_p(80, 'web', 'HTTP'), _p(631, 'printer', 'IPP'), _p(9100, 'printer', 'JetDirect')]),
      _h('192.168.1.30', rtt: 4, ports: [_p(80, 'web', 'HTTP'), _p(554, 'camera', 'RTSP')]),
      _h('192.168.1.41', name: 'muhasebe-pc.lan', rtt: 1, ports: [_p(445, 'smb', 'SMB'), _p(3389, 'rdp', 'RDP')]),
      _h('192.168.1.42', mdns: 'tasarim-mac.local', rtt: 1, ports: [_p(22, 'ssh', 'SSH'), _p(5900, 'vnc', 'VNC', banner: 'RFB 003.889')]),
      _h('192.168.1.50', name: 'db01.lan', rtt: 2, ports: [_p(22, 'ssh', 'SSH'), _p(3306, 'db', 'MySQL'), _p(5432, 'db', 'PostgreSQL')]),
      _h('192.168.1.60', name: 'pihole.lan', rtt: 1, ports: [_p(22, 'ssh', 'SSH'), _p(80, 'web', 'HTTP')]),
      _h('192.168.1.77', rtt: 9, status: 'new', ports: [_p(80, 'web', 'HTTP')]),
      _h('192.168.1.88', name: 'eski-laptop.lan', rtt: 2, status: 'gone', ports: [_p(445, 'smb', 'SMB')]),
      _h('192.168.1.103', rtt: 3),
      _h('192.168.1.120', mdns: 'Chromecast-Salon.local', rtt: 6, ports: [_p(8443, 'web', 'HTTPS 8443')]),
    ]);

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();
  late ModuleHost host;
  late SyncEngine engine;
  late IpToolsModule mod;
  setUpAll(() async {
    await _loadFont();
    PathProviderPlatform.instance = _FakePath(Directory.systemTemp.createTempSync('mtlibip').path);
  });
  setUp(() async {
    SharedPreferences.setMockInitialValues({'ip.noticeAccepted': true});
    final acc = AccountService(store: MemoryKvStore())..seed(email: 'ornek@example.com', name: 'Örnek', modules: const []);
    host = ModuleHost(acc);
    mod = IpToolsModule(host);
    engine = await host.open('ip', hasSettings: true, maxBytes: kIpMaxBlobBytes);
    engine.syncEnabled = false;
    engine.stop();
    final lib = engine.library;
    lib.items.clear();
    lib.items['settings'] = ('settings', {'appTheme': 'dark', 'language': 'tr', 'scan': {'disabledPorts': [21], 'concurrency': 64, 'timeoutMs': 1000}});
    lib.items['f1'] = ('folder', {'name': 'Şubeler', 'parentId': null, 'createdAt': 1});
    lib.items['r1'] = ('record', {...IpRecord.blank(), 'name': 'Depo Wi-Fi', 'range': '192.168.10.1-192.168.10.120', 'color': '#f97316'});
    lib.items['r2'] = ('record', {...IpRecord.blank(), 'name': 'Ofis ağı', 'range': '192.168.1.0/24', 'color': '#22d3ee'});
    lib.items['r3'] = ('record', {...IpRecord.blank(), 'name': 'Sunucu odası', 'range': '10.0.0.0/24, 10.0.1.0/24', 'color': '#a855f7'});
    lib.items['r4'] = ('record', {...IpRecord.blank(), 'name': 'Misafir ağı', 'range': '192.168.20.0/24', 'color': '#34d399', 'folderId': 'f1'});
    await mod.store.write('r2', StoredScan(last: _sample(), history: [
      const ScanHistoryEntry(at: 1792000012000, found: 12, added: 1, gone: 1, stopped: false),
      const ScanHistoryEntry(at: 1791900000000, found: 12, added: 0, gone: 0, stopped: false),
    ]));
    await mod.store.write('r1', StoredScan(last: ScanResult(startedAt: 1791800000000, finishedAt: 1791800009000, scanned: 120, stopped: false,
        hosts: [for (var i = 1; i <= 7; i++) _h('192.168.10.$i', rtt: 1)])));
  });
  tearDown(() => host.dispose());

  final sizes = {'telefon': const Size(390, 844), 'tablet': const Size(1024, 768)};
  for (final e in sizes.entries) {
    for (final dark in [true, false]) {
      final tag = '${e.key}-${dark ? 'gece' : 'gunduz'}';
      Future<void> size(WidgetTester t) async {
        await t.binding.setSurfaceSize(e.value);
        t.view.physicalSize = e.value;
        t.view.devicePixelRatio = 1;
      }

      testWidgets('ip kitaplık $tag', (t) async {
        await size(t);
        await t.pumpWidget(_app(IpLibraryScreen(host: host, store: mod.store, scans: mod.scans), dark: dark));
        for (var i = 0; i < 6; i++) { await t.pump(const Duration(milliseconds: 100)); }
        if (e.key == 'tablet') {
          await t.tap(find.text('Ofis ağı').first);
          await t.pumpAndSettle(const Duration(milliseconds: 100));
        }
        await expectLater(find.byType(IpLibraryScreen), matchesGoldenFile('goldens/ip-kitaplik-$tag.png'));
      });

      testWidgets('ip form $tag', (t) async {
        await size(t);
        SharedPreferences.setMockInitialValues({});
        await t.pumpWidget(_app(IpFormScreen(folders: const [('f1', 'Şubeler')], store: IpScanStore()), dark: dark));
        await t.pump(const Duration(milliseconds: 300));
        await t.enterText(find.byType(TextField).at(0), 'Misafir ağı');
        await t.enterText(find.byType(TextField).at(1), '192.168.20.0/24, 8.8.8.0/24');
        await t.pump(const Duration(milliseconds: 300));
        await expectLater(find.byType(IpFormScreen), matchesGoldenFile('goldens/ip-form-$tag.png'));
      });

      testWidgets('ip tarama $tag', (t) async {
        await size(t);
        final rec = IpRecord('r2', engine.library.items['r2']!.$2);
        await t.pumpWidget(_app(IpScanPanel(record: rec, engine: engine, scans: mod.scans, onEdit: () {}), dark: dark));
        for (var i = 0; i < 4; i++) { await t.pump(const Duration(milliseconds: 100)); }
        await expectLater(find.byType(IpScanPanel), matchesGoldenFile('goldens/ip-tarama-$tag.png'));
      });

      testWidgets('ip cihaz $tag', (t) async {
        await size(t);
        final h = _sample().hosts.firstWhere((x) => x.ip == '192.168.1.10');
        await t.pumpWidget(_app(IpHostScreen(host: h), dark: dark));
        await t.pump(const Duration(milliseconds: 300));
        await expectLater(find.byType(IpHostScreen), matchesGoldenFile('goldens/ip-cihaz-$tag.png'));
      });

      testWidgets('ip ayarlar $tag', (t) async {
        await size(t);
        await t.pumpWidget(_app(IpSettingsScreen(engine: engine), dark: dark));
        await t.pump(const Duration(milliseconds: 300));
        await expectLater(find.byType(IpSettingsScreen), matchesGoldenFile('goldens/ip-ayarlar-$tag.png'));
      });
    }
  }

  testWidgets('ayarlar kaydı settings öğesine yazılır', (t) async {
    await t.binding.setSurfaceSize(const Size(1024, 768));
    await t.pumpWidget(_app(IpSettingsScreen(engine: engine), dark: true));
    await t.pump(const Duration(milliseconds: 200));
    await t.tap(find.text('RTSP'));
    await t.pump();
    await t.enterText(find.byType(TextField).at(0), '500'); // 64'e kırpılır
    await t.enterText(find.byType(TextField).at(1), '300');
    await t.tap(find.text('Kaydet'));
    await t.pump(const Duration(milliseconds: 200));
    final s = scanSettingsOf(engine.library.items['settings']!.$2);
    expect(s.disabledPorts, [21, 554]);
    expect(s.concurrency, 64);
    expect(s.timeoutMs, 300);
    expect(engine.library.items['settings']!.$2['language'], 'tr');
  });
}
