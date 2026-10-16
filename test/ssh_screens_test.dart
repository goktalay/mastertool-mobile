// SSH Master kitaplık ve form ekranı görüntüleri (telefon + tablet, gece + gündüz) — golden PNG'ler görsel kontrol için.
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:master_tool/core/account.dart';
import 'package:master_tool/core/l10n/gen/mt_strings.dart';
import 'package:master_tool/core/module_host.dart';
import 'package:master_tool/core/theme.dart';
import 'package:master_tool/modules/ssh/ssh_form.dart';
import 'package:master_tool/modules/ssh/ssh_library.dart';
import 'package:master_tool/modules/ssh/ssh_model.dart';
import 'package:path_provider_platform_interface/path_provider_platform_interface.dart';

class _FakePath extends PathProviderPlatform {
  _FakePath(this.dir);
  final String dir;
  @override
  Future<String?> getApplicationSupportPath() async => dir;
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
}
