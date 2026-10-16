// Notepad Master kitaplık, bağlantı formu ve proje ekranı ekran görüntüleri (telefon + tablet, gece + gündüz).
// Proje ekranı cihazdaki geçici bir "Lokal Klasör" projesiyle (gerçek dosyalar) açılır: ağaç + index.php sekmesi.
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:master_tool/core/account.dart';
import 'package:master_tool/core/l10n/gen/mt_strings.dart';
import 'package:master_tool/core/module_host.dart';
import 'package:master_tool/core/theme.dart';
import 'package:master_tool/modules/notepad/np_form.dart';
import 'package:master_tool/modules/notepad/np_model.dart';
import 'package:master_tool/modules/notepad/np_module.dart';
import 'package:master_tool/modules/notepad/np_project.dart';
import 'package:path_provider_platform_interface/path_provider_platform_interface.dart';

class _FakePath extends PathProviderPlatform {
  _FakePath(this.dir);
  final String dir;
  @override
  Future<String?> getApplicationSupportPath() async => dir;
  @override
  Future<String?> getApplicationDocumentsPath() async => dir;
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

const _php = '''<?php
declare(strict_types=1);

require __DIR__ . '/config/database.php';  // yapılandırma
require __DIR__ . '/templates/header.php';

\$sayfa = \$_GET['sayfa'] ?? 'anasayfa';
\$izinli = ['anasayfa', 'hakkimizda', 'urunler', 'iletisim'];

if (!in_array(\$sayfa, \$izinli, true)) {
    http_response_code(404);
    \$sayfa = '404';
}

\$urunler = \$db->query('SELECT id, ad, fiyat FROM urunler WHERE aktif = 1 ORDER BY sira')
               ->fetchAll(PDO::FETCH_ASSOC);
?>
<main class="container">
  <h1><?= htmlspecialchars(\$baslik ?? 'Örnek Şirket') ?></h1>
  <section class="urunler">
    <?php foreach (\$urunler as \$u): ?>
      <article class="kart" data-id="<?= (int) \$u['id'] ?>">
        <h2><?= htmlspecialchars(\$u['ad']) ?></h2>
        <p class="fiyat"><?= number_format((float) \$u['fiyat'], 2, ',', '.') ?> ₺</p>
      </article>
    <?php endforeach; ?>
  </section>
</main>
<script src="/assets/js/app.js" defer></script>
''';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();
  late ModuleHost host;
  late Directory tmp, proj;
  setUpAll(() async {
    await _loadFont();
    // Sabit ad: yol kitaplık kartında ve durum çubuğunda görünür; rastgele ad golden'ı her çalıştırmada değiştirirdi.
    tmp = Directory('${Directory.systemTemp.path}/mtlibnp');
    if (tmp.existsSync()) tmp.deleteSync(recursive: true);
    tmp.createSync();
    PathProviderPlatform.instance = _FakePath(tmp.path);
    proj = Directory('${tmp.path}/kurumsal')..createSync();
    for (final d in ['assets/css', 'assets/js', 'config', 'public', 'templates']) {
      Directory('${proj.path}/$d').createSync(recursive: true);
    }
    File('${proj.path}/assets/css/style.css').writeAsStringSync('body { margin: 0; }\n');
    File('${proj.path}/assets/js/app.js').writeAsStringSync('console.log("merhaba");\n');
    File('${proj.path}/config/database.php').writeAsStringSync('<?php\nreturn [];\n');
    File('${proj.path}/.htaccess').writeAsStringSync('RewriteEngine On\n');
    File('${proj.path}/index.php').writeAsStringSync(_php);
    File('${proj.path}/README.md').writeAsStringSync('# Kurumsal\n');
    File('${proj.path}/robots.txt').writeAsStringSync('User-agent: *\n');
  });
  setUp(() async {
    final acc = AccountService(store: MemoryKvStore())..seed(email: 'ornek@example.com', name: 'Örnek', modules: const []);
    host = ModuleHost(acc);
    final e = await host.open('np', hasSettings: true, localOnly: kNpLocalOnly);
    e.syncEnabled = false;
    e.stop();
    final lib = e.library;
    lib.items['f1'] = ('folder', {'name': 'Müşteriler', 'parentId': null});
    lib.items['c1'] = ('connection', {...NpConnection.blank(kind: 'ftp'), 'name': 'Kampanya sitesi', 'host': 'ftp.ornek.com', 'username': 'kampanya', 'protocol': 'ftps-tls', 'rootDir': '/public_html', 'color': '#a855f7', 'editorMode': 'custom'});
    lib.items['c2'] = ('connection', {...NpConnection.blank(kind: 'ssh'), 'name': 'Kurumsal site', 'host': 'web-01.ornek.com', 'username': 'deploy', 'rootDir': '/var/www/kurumsal', 'color': '#22d3ee', 'openTabs': ['/var/www/kurumsal/index.php']});
    lib.items['c3'] = ('connection', {...NpConnection.blank(kind: 'local'), 'name': 'Mağaza teması', 'localPath': '/Projeler/magaza-tema', 'color': '#34d399'});
    lib.items['c4'] = ('connection', {...NpConnection.blank(kind: 'file'), 'name': 'nginx.conf', 'localPath': '/Projeler/nginx.conf', 'color': '#fbbf24'});
    lib.items['c5'] = ('connection', {...NpConnection.blank(kind: 'local'), 'name': 'Kurumsal (yerel)', 'localPath': proj.path, 'color': '#22d3ee', 'openTabs': ['${proj.path}/index.php'], 'activeTab': '${proj.path}/index.php'});
  });
  tearDown(() => host.dispose());

  final sizes = {'telefon': const Size(390, 844), 'tablet': const Size(1024, 768)};
  for (final e in sizes.entries) {
    for (final dark in [true, false]) {
      final tag = '${e.key}-${dark ? 'gece' : 'gunduz'}';
      testWidgets('np kitaplık $tag', (t) async {
        await t.binding.setSurfaceSize(e.value);
        t.view.physicalSize = e.value; t.view.devicePixelRatio = 1;
        await t.pumpWidget(_app(NpLibraryScreen(host: host), dark: dark));
        for (var i = 0; i < 6; i++) { await t.pump(const Duration(milliseconds: 100)); }
        await expectLater(find.byType(NpLibraryScreen), matchesGoldenFile('goldens/np-kitaplik-$tag.png'));
      });
      testWidgets('np form $tag', (t) async {
        await t.binding.setSurfaceSize(e.value);
        t.view.physicalSize = e.value; t.view.devicePixelRatio = 1;
        await t.pumpWidget(_app(NpFormScreen(folders: const [('f1', 'Müşteriler')]), dark: dark));
        await t.pump(const Duration(milliseconds: 300));
        await expectLater(find.byType(NpFormScreen), matchesGoldenFile('goldens/np-form-$tag.png'));
      });
      testWidgets('np form editör sekmesi $tag', (t) async {
        await t.binding.setSurfaceSize(e.value);
        t.view.physicalSize = e.value; t.view.devicePixelRatio = 1;
        await t.pumpWidget(_app(NpFormScreen(folders: const [('f1', 'Müşteriler')], existing: NpConnection('c1', {...NpConnection.blank(kind: 'ssh'), 'name': 'Kurumsal site', 'editorMode': 'custom'})), dark: dark));
        await t.pump(const Duration(milliseconds: 300));
        await t.tap(find.text('Editör (Notepad++)'));
        await t.pumpAndSettle();
        await expectLater(find.byType(NpFormScreen), matchesGoldenFile('goldens/np-form-editor-$tag.png'));
      });
      testWidgets('np proje $tag', (t) async {
        await t.binding.setSurfaceSize(e.value);
        t.view.physicalSize = e.value; t.view.devicePixelRatio = 1;
        final engine = await host.open('np');
        final conn = NpConnection('c5', engine.library.items['c5']!.$2);
        await t.runAsync(() async {
          await t.pumpWidget(_app(NpProjectScreen(conn: conn, engine: engine, onHostKey: (_) {}, cacheDir: '${tmp.path}/cache'), dark: dark));
          await Future<void>.delayed(const Duration(milliseconds: 800));
        });
        for (var i = 0; i < 6; i++) { await t.pump(const Duration(milliseconds: 100)); }
        await expectLater(find.byType(NpProjectScreen), matchesGoldenFile('goldens/np-proje-$tag.png'));
        if (e.key == 'telefon') {
          // telefonda ağaç sayfası: üst çubuktaki ağaç düğmesi
          await t.tap(find.byIcon(Icons.view_sidebar_outlined).first);
          await t.pump(const Duration(milliseconds: 200));
          await expectLater(find.byType(NpProjectScreen), matchesGoldenFile('goldens/np-proje-agac-$tag.png'));
        }
      });
    }
  }
}
