// SSH Master kitaplık, form ve terminal+SFTP paneli (tablet) görüntüleri (telefon + tablet, gece + gündüz) — golden PNG'ler
// görsel kontrol için; IP Tools → SSH Master derin bağlantı akışı (form host/port dolu açılır, kaydedilince kitaplığa yazılır).
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:master_tool/core/account.dart';
import 'package:master_tool/core/cross_links.dart';
import 'package:master_tool/core/l10n/gen/mt_strings.dart';
import 'package:master_tool/core/module_host.dart';
import 'package:master_tool/core/theme.dart';
import 'package:master_tool/modules/ftp/ftp_model.dart';
import 'package:master_tool/modules/ftp/remote_fs.dart';
import 'package:master_tool/modules/iptools/ip_host_screen.dart';
import 'package:master_tool/modules/iptools/ip_probe.dart';
import 'package:master_tool/modules/ssh/ssh_form.dart';
import 'package:master_tool/modules/ssh/ssh_library.dart';
import 'package:master_tool/modules/ssh/ssh_model.dart';
import 'package:master_tool/modules/ssh/ssh_module.dart';
import 'package:master_tool/modules/ssh/ssh_terminal.dart';
import 'package:path_provider_platform_interface/path_provider_platform_interface.dart';

class _FakePath extends PathProviderPlatform {
  _FakePath(this.dir);
  final String dir;
  @override
  Future<String?> getApplicationSupportPath() async => dir;
}

/// Sahte SFTP: ağ yok; /srv altında birkaç klasör ve dosya listeler.
class _FakeFs extends RemoteFs {
  _FakeFs(this.site);
  final FtpSite site;
  String _cwd = '/srv';
  static final _mod = DateTime(2026, 10, 17, 9, 30);
  @override
  Future<void> connect() async {}
  @override
  Future<void> close() async {}
  @override
  Future<String> pwd() async => _cwd;
  @override
  Future<void> cd(String path) async => _cwd = path;
  @override
  Future<List<RemoteEntry>> list(String path) async => [
        RemoteEntry(name: 'www', isDir: true, modified: _mod),
        RemoteEntry(name: 'backup', isDir: true, modified: _mod),
        RemoteEntry(name: 'deploy.sh', isDir: false, size: 2048, modified: _mod),
        RemoteEntry(name: 'nginx.conf', isDir: false, size: 13_400, modified: _mod),
        RemoteEntry(name: 'site.tar.gz', isDir: false, size: 48_200_000, modified: _mod),
      ];
  @override
  Future<bool> exists(String path) async => true;
  @override
  Future<int?> size(String path) async => 0;
  @override
  Stream<List<int>> download(String path, {int offset = 0, Progress? onProgress}) => const Stream.empty();
  @override
  Future<void> upload(String path, Stream<List<int>> data, int size, {Progress? onProgress}) async {}
  @override
  Future<void> mkdir(String path) async {}
  @override
  Future<void> rename(String from, String to) async {}
  @override
  Future<void> delete(String path, {bool isDir = false}) async {}
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

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();
  late Directory tmp;
  setUpAll(() async {
    await _loadFont();
    tmp = Directory.systemTemp.createTempSync('mtlib');
    PathProviderPlatform.instance = _FakePath(tmp.path);
  });

  Future<(AccountService, ModuleHost)> seeded() async {
    final acc = AccountService(store: MemoryKvStore())..seed(email: 'ornek@example.com', name: 'Örnek', modules: const []);
    final host = ModuleHost(acc);
    final e = await host.open('sm');
    e.syncEnabled = false; // ağ yok
    e.stop(); // zamanlayıcılar pumpAndSettle'ı sonsuz bekletmesin
    final lib = e.library;
    lib.items['f1'] = ('folder', {'name': 'Üretim sunucuları', 'parentId': null});
    lib.items['f2'] = ('folder', {'name': 'Ev laboratuvarı', 'parentId': null});
    lib.items['c1'] = ('connection', {...SshConnection.blank(), 'name': 'Web sunucusu', 'host': '192.168.1.10', 'username': 'root', 'color': '#22d3ee', 'theme': 'sshmaster'});
    lib.items['c2'] = ('connection', {...SshConnection.blank(), 'name': 'Yedek', 'host': 'yedek.local', 'port': 2222, 'username': 'admin', 'authType': 'key', 'color': '#a855f7', 'theme': 'dracula', 'rememberLastDir': true, 'lastDir': '/srv'});
    lib.items['c3'] = ('connection', {...SshConnection.blank(), 'name': 'Raspberry Pi', 'host': 'pi.local', 'username': 'pi', 'color': '#34d399', 'theme': 'ubuntu'});
    return (acc, host);
  }

  // Dosya ve ağ işlemleri testWidgets'ın sahte zamanında tamamlanmaz; kitaplık setUp'ta (gerçek zamanda) kurulur.
  late AccountService acc;
  late ModuleHost host;
  setUp(() async { (acc, host) = await seeded(); });
  tearDown(() => host.dispose());

  final sizes = {'telefon': const Size(390, 844), 'tablet': const Size(1024, 768)};
  for (final e in sizes.entries) {
    for (final dark in [true, false]) {
      final tag = '${e.key}-${dark ? 'gece' : 'gunduz'}';
      testWidgets('ssh kitaplık $tag', (t) async {
        await t.binding.setSurfaceSize(e.value);
        t.view.physicalSize = e.value; t.view.devicePixelRatio = 1;
        await t.pumpWidget(_app(SshLibraryScreen(host: host, account: acc), dark: dark));
        for (var i = 0; i < 6; i++) { await t.pump(const Duration(milliseconds: 100)); }
        await expectLater(find.byType(SshLibraryScreen), matchesGoldenFile('goldens/ssh-kitaplik-$tag.png'));
      });
      testWidgets('ssh form $tag', (t) async {
        await t.binding.setSurfaceSize(e.value);
        t.view.physicalSize = e.value; t.view.devicePixelRatio = 1;
        await t.pumpWidget(_app(SshFormScreen(folders: [SshFolder('f1', {'name': 'Üretim sunucuları', 'parentId': null})]), dark: dark));
        await t.pump(const Duration(milliseconds: 300));
        await expectLater(find.byType(SshFormScreen), matchesGoldenFile('goldens/ssh-form-$tag.png'));
      });
    }
  }

  // Tablet: terminal (bağlantı kurulmadan, "bağlantı kapandı" durumu) + sağda 360 px SFTP paneli (sahte dosya sistemi, /srv)
  for (final dark in [true, false]) {
    final tag = 'tablet-${dark ? 'gece' : 'gunduz'}';
    testWidgets('ssh terminal + sftp paneli $tag', (t) async {
      const size = Size(1024, 768);
      await t.binding.setSurfaceSize(size);
      t.view.physicalSize = size; t.view.devicePixelRatio = 1;
      final e = await host.open('sm');
      final c = SshConnection('c2', e.library.items['c2']!.$2);
      await t.pumpWidget(_app(SshTerminalScreen(conn: c, engine: e, onLastDir: (_) {}, onHostKey: (_) {}, autoConnect: false, filesOpen: true,
          fsFactory: (site, {onHostKey}) => _FakeFs(site)), dark: dark));
      for (var i = 0; i < 6; i++) { await t.pump(const Duration(milliseconds: 100)); }
      expect(find.text('/srv'), findsOneWidget);
      expect(find.text('nginx.conf'), findsOneWidget);
      await expectLater(find.byType(SshTerminalScreen), matchesGoldenFile('goldens/ssh-terminal-dosyalar-$tag.png'));
    });
  }

  testWidgets('ip tools → ssh master: form host/port dolu açılır, kaydedilince kitaplığa yazılır', (t) async {
    const size = Size(390, 844);
    await t.binding.setSurfaceSize(size);
    t.view.physicalSize = size; t.view.devicePixelRatio = 1;
    CrossLinks.openSsh = SshModule(host).openFor;
    addTearDown(() => CrossLinks.openSsh = null);
    final h = ScanHost(ip: '192.168.1.2', alive: 'tcp', name: 'ap-kat1.lan', ports: [PortHit(port: 2222, group: 'ssh', name: 'SSH', banner: 'SSH-2.0-dropbear')]);
    await t.pumpWidget(_app(IpHostScreen(host: h), dark: true));
    await t.pump();
    await t.tap(find.text("SSH Master'da aç"));
    await t.pumpAndSettle();
    expect(find.byType(SshFormScreen), findsOneWidget);
    expect(find.widgetWithText(TextField, '192.168.1.2'), findsOneWidget);
    expect(find.widgetWithText(TextField, '2222'), findsOneWidget);
    await t.enterText(find.byType(TextField).at(3), 'root'); // kullanıcı adı (ad, sunucu, port, kullanıcı)
    await t.tap(find.text('Kaydet'));
    await t.pumpAndSettle();
    expect(find.byType(SshFormScreen), findsNothing);
    final e = await host.open('sm');
    final saved = e.library.items.values.where((v) => v.$1 == 'connection' && v.$2['host'] == '192.168.1.2').toList();
    expect(saved, hasLength(1));
    expect(saved.single.$2['port'], 2222);
    expect(saved.single.$2['username'], 'root');
    expect(saved.single.$2['name'], '192.168.1.2');
  });
}
