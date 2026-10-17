// Tanıtım görüntüleri (mağaza ve mastertool.download için): gerçek yazı tipleri (Roboto + Material simgeleri + DejaVu Mono)
// yüklenerek telefon (1080×2340, 3×) ve tablet (2360×1640, 2×) boyutlarında, gece/gündüz, Türkçe/İngilizce.
// Çalıştırma: flutter test --update-goldens test/promo_shots_test.dart  → test/promo/*.png
// Yazı tipleri /tmp/fonts (Roboto-Regular/Medium/Bold.ttf) ve Flutter SDK'nın MaterialIcons-Regular.otf dosyasından yüklenir; yoksa test atlanır.
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:master_tool/core/account.dart';
import 'package:master_tool/core/l10n/gen/mt_strings.dart';
import 'package:master_tool/core/module_host.dart';
import 'package:master_tool/core/prefs.dart';
import 'package:master_tool/core/theme.dart';
import 'package:master_tool/main.dart';
import 'package:master_tool/modules/convert/cv_engine.dart';
import 'package:master_tool/modules/convert/cv_library.dart';
import 'package:master_tool/modules/convert/cv_model.dart';
import 'package:master_tool/modules/convert/cv_project.dart';
import 'package:master_tool/modules/ftp/ftp_model.dart';
import 'package:master_tool/modules/ftp/ftp_module.dart';
import 'package:master_tool/modules/iptools/ip_model.dart';
import 'package:master_tool/modules/iptools/ip_module.dart';
import 'package:master_tool/modules/iptools/ip_scan_screen.dart';
import 'package:master_tool/modules/notepad/np_model.dart';
import 'package:master_tool/modules/notepad/np_module.dart';
import 'package:master_tool/modules/notepad/np_project.dart';
import 'package:master_tool/modules/sql/sql_conn_screen.dart';
import 'package:master_tool/modules/sql/sql_data_tab.dart';
import 'package:master_tool/modules/sql/sql_form.dart';
import 'package:master_tool/modules/sql/sql_model.dart';
import 'package:master_tool/modules/sql/sql_module.dart';
import 'package:master_tool/modules/ssh/ssh_form.dart';
import 'package:master_tool/modules/ssh/ssh_library.dart';
import 'package:master_tool/modules/ssh/ssh_model.dart';
import 'package:master_tool/screens/home_screen.dart';
import 'package:master_tool/screens/login_screen.dart';
import 'package:master_tool/screens/settings_screen.dart';
import 'package:package_info_plus/package_info_plus.dart';
import 'package:path_provider_platform_interface/path_provider_platform_interface.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sqlite3/sqlite3.dart';

class _FakePath extends PathProviderPlatform {
  _FakePath(this.dir);
  final String dir;
  @override
  Future<String?> getApplicationSupportPath() async => dir;
  @override
  Future<String?> getApplicationDocumentsPath() async => '$dir/docs';
  @override
  Future<String?> getTemporaryPath() async => '$dir/tmp';
}

Future<bool> _loadFonts() async {
  final home = Platform.environment['HOME'] ?? '';
  final roboto = ['Regular', 'Medium', 'Bold'].map((w) => File('/tmp/fonts/Roboto-$w.ttf')).toList();
  final icons = File('$home/flutter/bin/cache/artifacts/material_fonts/MaterialIcons-Regular.otf');
  if (!roboto.every((f) => f.existsSync()) || !icons.existsSync()) return false;
  final r = FontLoader('Roboto');
  for (final f in roboto) {
    r.addFont(Future.value(ByteData.view(f.readAsBytesSync().buffer)));
  }
  await r.load();
  await (FontLoader('MaterialIcons')..addFont(Future.value(ByteData.view(icons.readAsBytesSync().buffer)))).load();
  final mono = File('/usr/share/fonts/truetype/dejavu/DejaVuSansMono.ttf');
  if (mono.existsSync()) await (FontLoader('monospace')..addFont(Future.value(ByteData.view(mono.readAsBytesSync().buffer)))).load();
  return true;
}

Widget _app(Widget home, {required bool dark, required String lang}) => MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: mtTheme(Brightness.light), darkTheme: mtTheme(Brightness.dark), themeMode: dark ? ThemeMode.dark : ThemeMode.light,
      locale: Locale(lang), supportedLocales: MtStrings.supportedLocales,
      localizationsDelegates: const [MtStrings.delegate, GlobalMaterialLocalizations.delegate, GlobalWidgetsLocalizations.delegate, GlobalCupertinoLocalizations.delegate],
      home: home,
    );

String _sampleDb(String dir) {
  final path = '$dir/magaza.db';
  final f = File(path);
  if (f.existsSync()) f.deleteSync();
  final db = sqlite3.open(path);
  db.execute('''
    CREATE TABLE musteriler (id INTEGER PRIMARY KEY, ad TEXT NOT NULL, sehir TEXT);
    CREATE TABLE urunler (id INTEGER PRIMARY KEY, ad TEXT NOT NULL, kategori TEXT, fiyat REAL);
    CREATE TABLE siparisler (id INTEGER PRIMARY KEY, musteri_id INTEGER, adet INTEGER, tutar NUMERIC, durum TEXT, siparis_tarihi TEXT);
    CREATE VIEW aylik_ciro AS SELECT substr(siparis_tarihi,1,7) ay, count(*) siparis, sum(tutar) ciro FROM siparisler GROUP BY 1;
  ''');
  for (var i = 1; i <= 40; i++) {
    db.execute("INSERT INTO siparisler VALUES ($i, ${(i * 37) % 800}, 3, ${35997 - i * 100}.00, '${i % 3 == 0 ? 'Teslim' : 'Kargoda'}', '2026-04-${(i % 28 + 1).toString().padLeft(2, '0')} 17:19:00')");
  }
  db.close();
  return path;
}

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();
  late bool fonts;
  late Directory tmp;
  late AccountService acc;
  late ModuleHost host;
  late Prefs prefs;
  late Directory proj;

  setUpAll(() async {
    fonts = await _loadFonts();
    tmp = Directory.systemTemp.createTempSync('mtpromo');
    PathProviderPlatform.instance = _FakePath(tmp.path);
    SqlDataTab.debugFixedMs = 10;
    PackageInfo.setMockInitialValues(appName: 'Master Tool', packageName: 'download.mastertool.master_tool', version: '1.0.0', buildNumber: '1', buildSignature: '');
    SharedPreferences.setMockInitialValues({'ip.noticeAccepted': true});
    proj = Directory('${tmp.path}/kurumsal')..createSync();
    for (final d in ['assets/css', 'assets/js', 'config', 'public', 'templates']) {
      Directory('${proj.path}/$d').createSync(recursive: true);
    }
    File('${proj.path}/assets/css/style.css').writeAsStringSync('body { margin: 0; font-family: system-ui; }\n');
    File('${proj.path}/assets/js/app.js').writeAsStringSync('console.log("merhaba");\n');
    File('${proj.path}/config/database.php').writeAsStringSync('<?php\nreturn [];\n');
    File('${proj.path}/index.php').writeAsStringSync("<?php\ndeclare(strict_types=1);\n\nrequire __DIR__ . '/config/database.php';\nrequire __DIR__ . '/templates/header.php';\n\n\$sayfa = \$_GET['sayfa'] ?? 'anasayfa';\n\$izinli = ['anasayfa', 'hakkimizda', 'urunler', 'iletisim'];\n\nif (!in_array(\$sayfa, \$izinli, true)) {\n    http_response_code(404);\n    \$sayfa = '404';\n}\n\nrequire __DIR__ . \"/public/\$sayfa.php\";\n");
    File('${proj.path}/README.md').writeAsStringSync('# Kurumsal\n');
  });

  setUp(() async {
    acc = AccountService(store: MemoryKvStore())
      ..seed(email: 'ornek@example.com', name: 'Örnek Kullanıcı', modules: [
        ModuleInfo(app: 'sm', name: 'SSH Master', license: 'AKTIF', description: 'SSH bağlantıları, terminal ve SFTP'),
        ModuleInfo(app: 'fm', name: 'FTP Masters', license: 'AKTIF', description: 'FTP, FTPS ve SFTP dosya yöneticisi'),
        ModuleInfo(app: 'sq', name: 'SQL Master', license: 'AKTIF', description: 'Veritabanı istemcisi ve sorgu düzenleyici'),
        ModuleInfo(app: 'np', name: 'Notepad Master', license: 'AKTIF', description: 'Kod ve metin düzenleyici'),
        ModuleInfo(app: 'cv', name: 'Convert Master', license: 'AKTIF', description: 'Video, resim ve ses dönüştürücü'),
        ModuleInfo(app: 'ip', name: 'IP Tools', license: 'AKTIF', description: 'Yerel ağ keşfi ve servis etiketleri'),
      ]);
    host = ModuleHost(acc);
    prefs = Prefs();
    await prefs.init();
    Future<void> seed(String app, Map<String, (String, Map<String, dynamic>)> items, {bool settings = false, Set<String> localOnly = const {}, int? maxBytes}) async {
      final e = await host.open(app, hasSettings: settings, localOnly: localOnly, maxBytes: maxBytes ?? 5 * 1024 * 1024);
      e.syncEnabled = false;
      e.stop();
      e.library.items..clear()..addAll(items);
    }
    await seed('sm', {
      'f1': ('folder', {'name': 'Üretim sunucuları', 'parentId': null}), 'f2': ('folder', {'name': 'Ev laboratuvarı', 'parentId': null}),
      'c1': ('connection', {...SshConnection.blank(), 'name': 'Web sunucusu', 'host': '192.168.1.10', 'username': 'root', 'color': '#22d3ee'}),
      'c2': ('connection', {...SshConnection.blank(), 'name': 'Yedek', 'host': 'yedek.local', 'port': 2222, 'username': 'admin', 'authType': 'key', 'color': '#a855f7', 'theme': 'dracula', 'rememberLastDir': true, 'lastDir': '/srv'}),
      'c3': ('connection', {...SshConnection.blank(), 'name': 'Raspberry Pi', 'host': 'pi.local', 'username': 'pi', 'color': '#34d399', 'theme': 'ubuntu'}),
      'c4': ('connection', {...SshConnection.blank(), 'name': 'Veritabanı', 'host': 'db-01.ornek.com', 'username': 'dba', 'color': '#f97316', 'theme': 'nord', 'folderId': 'f1'}),
    }, localOnly: const {'keyPath'});
    await seed('fm', {
      'f1': ('folder', {'name': 'Müşteriler', 'parentId': null}),
      's1': ('site', {...FtpSite.blank(), 'name': 'Şirket web sitesi', 'host': 'ftp.ornek.com', 'username': 'www', 'protocol': 'ftps-tls', 'color': '#f97316'}),
      's2': ('site', {...FtpSite.blank(), 'name': 'Yedek sunucu', 'host': 'yedek.local', 'port': 22, 'protocol': 'sftp', 'username': 'backup', 'authType': 'key', 'color': '#22d3ee'}),
      's3': ('site', {...FtpSite.blank(), 'name': 'Anonim ayna', 'host': 'ftp.debian.org', 'loginMethod': 'anonymous', 'username': 'anonymous', 'color': '#a855f7'}),
    }, settings: true, localOnly: const {'keyPath', 'localDir', 'lastLocalDir', 'lastRemoteDir'});
    await seed('sq', {
      'f1': ('folder', {'name': 'Raporlama', 'parentId': null}),
      'c1': ('connection', {...SqlConnection.blank(), 'name': 'E-ticaret (MySQL)', 'provider': 'mysql', 'host': 'web-db.ornek.local', 'port': 3306, 'user': 'okuyucu', 'color': '#f97316'}),
      'c2': ('connection', {...SqlConnection.blank(), 'name': 'Mağaza (SQLite)', 'provider': 'sqlite', 'filePath': _sampleDb(tmp.path), 'color': '#22d3ee'}),
      'c3': ('connection', {...SqlConnection.blank(), 'name': 'Muhasebe (PostgreSQL)', 'provider': 'postgres', 'host': 'pg.ornek.local', 'port': 5432, 'user': 'muhasebe', 'color': '#a855f7', 'readOnly': false}),
    }, settings: true, localOnly: kSqlLocalOnly);
    await seed('np', {
      'c1': ('connection', {...NpConnection.blank(kind: 'ftp'), 'name': 'Kampanya sitesi', 'host': 'ftp.ornek.com', 'username': 'kampanya', 'protocol': 'ftps-tls', 'rootDir': '/public_html', 'color': '#a855f7'}),
      'c2': ('connection', {...NpConnection.blank(kind: 'ssh'), 'name': 'Kurumsal site', 'host': 'web-01.ornek.com', 'username': 'deploy', 'rootDir': '/var/www/kurumsal', 'color': '#22d3ee'}),
      'c5': ('connection', {...NpConnection.blank(kind: 'local'), 'name': 'Kurumsal (yerel)', 'localPath': proj.path, 'color': '#34d399', 'openTabs': ['${proj.path}/index.php'], 'activeTab': '${proj.path}/index.php'}),
    }, settings: true, localOnly: kNpLocalOnly);
    await seed('ip', {
      'settings': ('settings', {'appTheme': 'dark', 'language': 'tr', 'scan': {'disabledPorts': [21], 'concurrency': 64, 'timeoutMs': 1000}}),
      'r1': ('record', {...IpRecord.blank(), 'name': 'Depo Wi-Fi', 'range': '192.168.10.1-192.168.10.120', 'color': '#f97316'}),
      'r2': ('record', {...IpRecord.blank(), 'name': 'Ofis ağı', 'range': '192.168.1.0/24', 'color': '#22d3ee'}),
      'r3': ('record', {...IpRecord.blank(), 'name': 'Sunucu odası', 'range': '10.0.0.0/24, 10.0.1.0/24', 'color': '#a855f7'}),
    }, settings: true, maxBytes: kIpMaxBlobBytes);
    await seed('cv', {
      'p1': ('project', {...CvProject.blank(type: 'image'), 'name': 'Ürün fotoğrafları', 'sourceExts': ['png', 'bmp'], 'targetExt': 'webp'}),
      'p2': ('project', {...CvProject.blank(type: 'audio'), 'name': 'Konferans konuşması', 'sourceExts': ['wav'], 'targetExt': 'mp3'}),
      'p3': ('project', {...CvProject.blank(type: 'video'), 'name': 'Tatil videoları', 'sourceExts': ['mkv', 'mov', 'avi', 'wmv', '3gp', 'mp4'], 'targetExt': 'mp4'}),
    }, settings: true, localOnly: kCvLocalOnly);
  });
  tearDown(() => host.dispose());

  final devices = {'telefon': (const Size(390, 780), 3.0), 'tablet': (const Size(1180, 820), 2.0)};

  Future<void> shoot(WidgetTester t, String name, Widget w, {required Size size, required double dpr, required bool dark, required String lang, int pumps = 6, bool async = false}) async {
    await t.binding.setSurfaceSize(size);
    t.view.physicalSize = size * dpr;
    t.view.devicePixelRatio = dpr;
    Future<void> body() async {
      await t.pumpWidget(_app(w, dark: dark, lang: lang));
      for (var i = 0; i < pumps; i++) {
        await t.pump(const Duration(milliseconds: 120));
      }
    }
    if (async) {
      await t.runAsync(() async {
        await t.pumpWidget(_app(w, dark: dark, lang: lang));
        await Future<void>.delayed(const Duration(milliseconds: 1200)); // gerçek dosya/DB işleri sahte zamanda ilerlemez
        for (var i = 0; i < pumps; i++) {
          await t.pump(const Duration(milliseconds: 120));
        }
      });
    } else {
      await body();
    }
    await expectLater(find.byType(MaterialApp), matchesGoldenFile('promo/$name.png'));
  }

  for (final d in devices.entries) {
    for (final dark in [true, false]) {
      for (final lang in ['tr', 'en']) {
        final tag = '${d.key}-${dark ? 'gece' : 'gunduz'}-$lang';
        final size = d.value.$1, dpr = d.value.$2;
        testWidgets('promo $tag', (t) async {
          if (!fonts) return;
          final mods = buildModules(host);
          await shoot(t, '01-giris-$tag', LoginScreen(account: AccountService(store: MemoryKvStore()), prefs: prefs), size: size, dpr: dpr, dark: dark, lang: lang);
          await shoot(t, '02-ana-$tag', HomeScreen(account: acc, prefs: prefs, modules: mods), size: size, dpr: dpr, dark: dark, lang: lang);
          await shoot(t, '03-ssh-kitaplik-$tag', SshLibraryScreen(host: host, account: acc), size: size, dpr: dpr, dark: dark, lang: lang);
          await shoot(t, '04-ssh-form-$tag', SshFormScreen(folders: [SshFolder('f1', {'name': 'Üretim sunucuları', 'parentId': null})]), size: size, dpr: dpr, dark: dark, lang: lang);
          await shoot(t, '05-ftp-kitaplik-$tag', FtpLibraryScreen(host: host), size: size, dpr: dpr, dark: dark, lang: lang);
          await shoot(t, '06-sql-kitaplik-$tag', SqlLibraryScreen(host: host), size: size, dpr: dpr, dark: dark, lang: lang);
          await shoot(t, '07-sql-form-$tag', SqlFormScreen(folders: const [('f1', 'Raporlama')]), size: size, dpr: dpr, dark: dark, lang: lang);
          final sqe = await host.open('sq');
          final conn = SqlConnection('c2', sqe.library.items['c2']!.$2);
          await shoot(t, '08-sql-baglanti-$tag', SqlConnScreen(conn: conn, engine: sqe, settings: SqlSettings(SqlSettings.blank()), onHostKey: (_) {}), size: size, dpr: dpr, dark: dark, lang: lang, pumps: 10, async: true);
          await shoot(t, '09-notepad-kitaplik-$tag', NpLibraryScreen(host: host), size: size, dpr: dpr, dark: dark, lang: lang);
          final npe = await host.open('np');
          final nconn = NpConnection('c5', npe.library.items['c5']!.$2);
          await shoot(t, '10-notepad-proje-$tag', NpProjectScreen(conn: nconn, engine: npe, onHostKey: (_) {}, cacheDir: '${tmp.path}/cache'), size: size, dpr: dpr, dark: dark, lang: lang, pumps: 8, async: true);
          final ipm = IpToolsModule(host);
          await shoot(t, '11-ip-kitaplik-$tag', IpLibraryScreen(host: host, store: ipm.store, scans: ipm.scans), size: size, dpr: dpr, dark: dark, lang: lang);
          final ipe = await host.open('ip');
          await shoot(t, '12-ip-tarama-$tag', IpScanPanel(record: IpRecord('r2', ipe.library.items['r2']!.$2), engine: ipe, scans: ipm.scans, onEdit: () {}), size: size, dpr: dpr, dark: dark, lang: lang);
          final cve = await host.open('cv');
          final r = CvRunner(projectId: 'p3', engine: cve, baseDir: Directory('${tmp.path}/cv'), convert: (_, _, _, _, _) async => 0);
          r.seed([
            CvSource(name: 'Doğum günü.mkv', size: 480 * 1024, mtime: 0), CvSource(name: 'Röportaj - dede.mkv', size: 2700 * 1024, mtime: 0),
            CvSource(name: 'Konser kaydı.mp4', size: 52 * 1024, mtime: 0), CvSource(name: 'Mezuniyet.3gp', size: 413 * 1024, mtime: 0),
            CvSource(name: 'Plaj gün batımı.mkv', size: 166 * 1024 * 1024, mtime: 0), CvSource(name: 'Tekne turu.mov', size: 37 * 1024 * 1024, mtime: 0),
          ], {
            'Doğum günü.mkv': CvJob(status: CvStatus.done, progress: 1, out: 'Doğum günü.mp4', outSize: 278 * 1024),
            'Röportaj - dede.mkv': CvJob(status: CvStatus.done, progress: 1, out: 'Röportaj - dede.mp4', outSize: 1300 * 1024),
            'Konser kaydı.mp4': CvJob(status: CvStatus.converting, progress: .62), 'Mezuniyet.3gp': CvJob(status: CvStatus.converting, progress: .0),
            'Plaj gün batımı.mkv': CvJob(status: CvStatus.queued), 'Tekne turu.mov': CvJob(status: CvStatus.queued),
          });
          r.running = true;
          await shoot(t, '13-convert-kitaplik-$tag', CvLibraryScreen(host: host), size: size, dpr: dpr, dark: dark, lang: lang);
          await shoot(t, '14-convert-proje-$tag', CvProjectScreen(projectId: 'p3', engine: cve, runner: r, onEditProject: (_) async {}, onModuleSettings: (_) {}), size: size, dpr: dpr, dark: dark, lang: lang);
          await shoot(t, '15-ayarlar-$tag', SettingsScreen(account: acc, prefs: prefs), size: size, dpr: dpr, dark: dark, lang: lang);
        });
      }
    }
  }
}
