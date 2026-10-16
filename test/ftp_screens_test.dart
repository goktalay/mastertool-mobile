// FTP Masters kitaplık ve site formu ekran görüntüleri (telefon + tablet, gece + gündüz).
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:master_tool/core/account.dart';
import 'package:master_tool/core/l10n/gen/mt_strings.dart';
import 'package:master_tool/core/module_host.dart';
import 'package:master_tool/core/theme.dart';
import 'package:master_tool/modules/ftp/ftp_form.dart';
import 'package:master_tool/modules/ftp/ftp_model.dart';
import 'package:master_tool/modules/ftp/ftp_module.dart';
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
  late ModuleHost host;
  setUpAll(() async {
    await _loadFont();
    PathProviderPlatform.instance = _FakePath(Directory.systemTemp.createTempSync('mtlibf').path);
  });
  setUp(() async {
    final acc = AccountService(store: MemoryKvStore())..seed(email: 'ornek@example.com', name: 'Örnek', modules: const []);
    host = ModuleHost(acc);
    final e = await host.open('fm', hasSettings: true, localOnly: const {'keyPath', 'localDir', 'lastLocalDir', 'lastRemoteDir'});
    e.syncEnabled = false;
    e.stop();
    final lib = e.library;
    lib.items['f1'] = ('folder', {'name': 'Müşteriler', 'parentId': null});
    lib.items['s1'] = ('site', {...FtpSite.blank(), 'name': 'Şirket web sitesi', 'host': 'ftp.ornek.com', 'username': 'www', 'protocol': 'ftps-tls', 'color': '#f97316'});
    lib.items['s2'] = ('site', {...FtpSite.blank(), 'name': 'Yedek sunucu', 'host': 'yedek.local', 'port': 22, 'protocol': 'sftp', 'username': 'backup', 'authType': 'key', 'color': '#22d3ee', 'rememberLastDir': true, 'lastRemoteDir': '/var/backups'});
    lib.items['s3'] = ('site', {...FtpSite.blank(), 'name': 'Anonim ayna', 'host': 'ftp.debian.org', 'loginMethod': 'anonymous', 'username': 'anonymous', 'color': '#a855f7'});
  });
  tearDown(() => host.dispose());

  final sizes = {'telefon': const Size(390, 844), 'tablet': const Size(1024, 768)};
  for (final e in sizes.entries) {
    for (final dark in [true, false]) {
      final tag = '${e.key}-${dark ? 'gece' : 'gunduz'}';
      testWidgets('ftp kitaplık $tag', (t) async {
        await t.binding.setSurfaceSize(e.value);
        t.view.physicalSize = e.value; t.view.devicePixelRatio = 1;
        await t.pumpWidget(_app(FtpLibraryScreen(host: host), dark: dark));
        for (var i = 0; i < 6; i++) { await t.pump(const Duration(milliseconds: 100)); }
        await expectLater(find.byType(FtpLibraryScreen), matchesGoldenFile('goldens/ftp-kitaplik-$tag.png'));
      });
      testWidgets('ftp form $tag', (t) async {
        await t.binding.setSurfaceSize(e.value);
        t.view.physicalSize = e.value; t.view.devicePixelRatio = 1;
        await t.pumpWidget(_app(FtpFormScreen(folders: const [('f1', 'Müşteriler')]), dark: dark));
        await t.pump(const Duration(milliseconds: 300));
        await expectLater(find.byType(FtpFormScreen), matchesGoldenFile('goldens/ftp-form-$tag.png'));
      });
    }
  }
}
