// Ekran görüntüsü testleri: giriş / ana ekran / ayarlar — telefon (390×844) ve tablet (1024×768), gece ve gündüz.
// `flutter test --update-goldens test/screenshots_test.dart` → test/goldens/*.png (görsel kontrol için).
// Yazı tipi: test ortamında gerçek bir TTF yüklenir (yoksa metinler kutu görünür).
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:master_tool/core/account.dart';
import 'package:master_tool/core/l10n/gen/mt_strings.dart';
import 'package:master_tool/core/prefs.dart';
import 'package:master_tool/core/theme.dart';
import 'package:master_tool/main.dart';
import 'package:master_tool/screens/home_screen.dart';
import 'package:master_tool/screens/login_screen.dart';
import 'package:master_tool/screens/settings_screen.dart';
import 'package:package_info_plus/package_info_plus.dart';
import 'package:shared_preferences/shared_preferences.dart';

Future<void> _loadFont() async {
  for (final p in ['/usr/share/fonts/truetype/dejavu/DejaVuSans.ttf', '/usr/share/fonts/truetype/dejavu/DejaVuSans-Bold.ttf']) {
    final f = File(p);
    if (!f.existsSync()) continue;
    final loader = FontLoader('Roboto')..addFont(Future.value(ByteData.view(f.readAsBytesSync().buffer)));
    await loader.load();
  }
}

Widget _app(Widget home, {required bool dark, String lang = 'tr'}) => MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: mtTheme(Brightness.light), darkTheme: mtTheme(Brightness.dark), themeMode: dark ? ThemeMode.dark : ThemeMode.light,
      locale: Locale(lang), supportedLocales: MtStrings.supportedLocales,
      localizationsDelegates: const [MtStrings.delegate, GlobalMaterialLocalizations.delegate, GlobalWidgetsLocalizations.delegate, GlobalCupertinoLocalizations.delegate],
      home: home,
    );

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();
  setUpAll(() async {
    await _loadFont();
    PackageInfo.setMockInitialValues(appName: 'Master Tool', packageName: 'download.mastertool.master_tool', version: '1.0.0', buildNumber: '1', buildSignature: '');
    SharedPreferences.setMockInitialValues({});
  });

  final sizes = {'telefon': const Size(390, 844), 'tablet': const Size(1024, 768)};

  for (final e in sizes.entries) {
    for (final dark in [true, false]) {
      final tag = '${e.key}-${dark ? 'gece' : 'gunduz'}';
      testWidgets('giriş $tag', (t) async {
        await t.binding.setSurfaceSize(e.value);
        t.view.physicalSize = e.value; t.view.devicePixelRatio = 1;
        final acc = AccountService(store: MemoryKvStore());
        await t.pumpWidget(_app(LoginScreen(account: acc, prefs: Prefs()), dark: dark));
        await t.pumpAndSettle();
        await expectLater(find.byType(LoginScreen), matchesGoldenFile('goldens/giris-$tag.png'));
      });

      testWidgets('ana ekran $tag', (t) async {
        await t.binding.setSurfaceSize(e.value);
        t.view.physicalSize = e.value; t.view.devicePixelRatio = 1;
        final acc = AccountService(store: MemoryKvStore())
          ..seed(email: 'ornek@example.com', name: 'Örnek Kullanıcı', modules: [
            ModuleInfo(app: 'sm', name: 'SSH Master', license: 'AKTIF', description: 'SSH bağlantıları, terminal ve SFTP'),
            ModuleInfo(app: 'fm', name: 'FTP Masters', license: 'AKTIF', description: 'FTP, FTPS ve SFTP dosya yöneticisi'),
            ModuleInfo(app: 'sq', name: 'SQL Master', license: 'KAPALI', description: 'Veritabanı istemcisi ve sorgu düzenleyici'),
            ModuleInfo(app: 'np', name: 'Notepad Master', license: 'AKTIF', description: 'Kod ve metin düzenleyici'),
            ModuleInfo(app: 'cv', name: 'Convert Master', license: 'AKTIF', description: 'Video, resim ve ses dönüştürücü'),
            ModuleInfo(app: 'ip', name: 'IP Tools', license: 'AKTIF', description: 'Yerel ağ keşfi ve servis etiketleri'),
          ]);
        await t.pumpWidget(_app(HomeScreen(account: acc, prefs: Prefs(), modules: buildModules()), dark: dark));
        await t.pumpAndSettle();
        await expectLater(find.byType(HomeScreen), matchesGoldenFile('goldens/ana-$tag.png'));
      });

      testWidgets('ayarlar $tag', (t) async {
        await t.binding.setSurfaceSize(e.value);
        t.view.physicalSize = e.value; t.view.devicePixelRatio = 1;
        final acc = AccountService(store: MemoryKvStore())..seed(email: 'ornek@example.com', name: 'Örnek Kullanıcı', modules: const []);
        final prefs = Prefs();
        await prefs.init();
        await t.pumpWidget(_app(Builder(builder: (ctx) => Scaffold(body: Center(child: TextButton(
            onPressed: () => showSettings(ctx, account: acc, prefs: prefs), child: const Text('aç'))))), dark: dark));
        await t.tap(find.text('aç'));
        await t.pumpAndSettle();
        await expectLater(find.byType(MaterialApp), matchesGoldenFile('goldens/ayarlar-$tag.png'));
      });
    }
  }
}
