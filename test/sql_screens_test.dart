// SQL Master kitaplık, bağlantı formu ve (SQLite bellek içi) bağlantı ekranı görüntüleri (telefon + tablet, gece + gündüz).
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:master_tool/core/account.dart';
import 'package:master_tool/core/l10n/gen/mt_strings.dart';
import 'package:master_tool/core/module_host.dart';
import 'package:master_tool/core/theme.dart';
import 'package:master_tool/modules/sql/sql_conn_screen.dart';
import 'package:master_tool/modules/sql/sql_data_tab.dart';
import 'package:master_tool/modules/sql/sql_form.dart';
import 'package:master_tool/modules/sql/sql_model.dart';
import 'package:master_tool/modules/sql/sql_module.dart';
import 'package:path_provider_platform_interface/path_provider_platform_interface.dart';
import 'package:sqlite3/sqlite3.dart';

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

/// Örnek SQLite dosyası (satis şeması: musteriler, siparisler, urunler + görünüm)
String _sampleDb(String dir) {
  final path = '$dir/magaza.db';
  final f = File(path);
  if (f.existsSync()) f.deleteSync();
  final db = sqlite3.open(path);
  db.execute('''
    CREATE TABLE musteriler (id INTEGER PRIMARY KEY, ad TEXT NOT NULL, sehir TEXT);
    CREATE TABLE urunler (id INTEGER PRIMARY KEY, ad TEXT NOT NULL, kategori TEXT, fiyat REAL);
    CREATE TABLE siparisler (id INTEGER PRIMARY KEY, musteri_id INTEGER, adet INTEGER, tutar NUMERIC, durum TEXT, siparis_tarihi TEXT);
    CREATE INDEX siparisler_musteri ON siparisler(musteri_id);
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
  late ModuleHost host;
  late String tmp;
  setUpAll(() async {
    await _loadFont();
    tmp = Directory.systemTemp.createTempSync('mtlibsq').path;
    SqlDataTab.debugFixedMs = 10;
    PathProviderPlatform.instance = _FakePath(tmp);
  });
  setUp(() async {
    host = ModuleHost(AccountService(store: MemoryKvStore())); // oturum kapalı: senkron ağa çıkmaz
    final e = await host.open('sq', hasSettings: true, localOnly: kSqlLocalOnly);
    e.syncEnabled = false;
    e.stop();
    final lib = e.library;
    lib.items['f1'] = ('folder', {'name': 'Raporlama', 'parentId': null});
    lib.items['f2'] = ('folder', {'name': 'Üretim', 'parentId': null});
    lib.items['c1'] = ('connection', {...SqlConnection.blank(), 'name': 'E-ticaret (MySQL)', 'provider': 'mysql', 'host': 'web-db.ornek.local', 'port': 3306, 'user': 'okuyucu', 'color': '#f97316', 'ssh': {'enabled': true, 'host': 'bastion', 'port': 22, 'user': 'ops', 'auth': 'key', 'hostKey': null}});
    lib.items['c2'] = ('connection', {...SqlConnection.blank(), 'name': 'Envanter (SQLite)', 'provider': 'sqlite', 'filePath': '/data/envanter.db', 'color': '#22d3ee'});
    lib.items['c3'] = ('connection', {...SqlConnection.blank(), 'name': 'ERP (SQL Server)', 'provider': 'mssql', 'host': 'erp-sql.ornek.local', 'port': 1433, 'user': 'rapor', 'color': '#ef4444'});
    lib.items['c4'] = ('connection', {...SqlConnection.blank(), 'name': 'Satış dosyaları (DuckDB)', 'provider': 'duckdb', 'filePath': '', 'readOnly': false, 'color': '#fbbf24'});
  });
  tearDown(() => host.dispose());

  final sizes = {'telefon': const Size(390, 844), 'tablet': const Size(1024, 768)};
  for (final e in sizes.entries) {
    for (final dark in [true, false]) {
      final tag = '${e.key}-${dark ? 'gece' : 'gunduz'}';
      testWidgets('sql kitaplık $tag', (t) async {
        await t.binding.setSurfaceSize(e.value);
        t.view.physicalSize = e.value; t.view.devicePixelRatio = 1;
        await t.pumpWidget(_app(SqlLibraryScreen(host: host), dark: dark));
        for (var i = 0; i < 6; i++) { await t.pump(const Duration(milliseconds: 100)); }
        await expectLater(find.byType(SqlLibraryScreen), matchesGoldenFile('goldens/sql-kitaplik-$tag.png'));
      });
      testWidgets('sql form $tag', (t) async {
        await t.binding.setSurfaceSize(e.value);
        t.view.physicalSize = e.value; t.view.devicePixelRatio = 1;
        await t.pumpWidget(_app(SqlFormScreen(folders: const [('f1', 'Raporlama'), ('f2', 'Üretim')]), dark: dark));
        await t.pump(const Duration(milliseconds: 300));
        await expectLater(find.byType(SqlFormScreen), matchesGoldenFile('goldens/sql-form-$tag.png'));
      });
      testWidgets('sql bağlantı ekranı (sqlite) $tag', (t) async {
        await t.binding.setSurfaceSize(e.value);
        t.view.physicalSize = e.value; t.view.devicePixelRatio = 1;
        final path = _sampleDb(tmp);
        final engine = await host.open('sq');
        final conn = SqlConnection('c9', {...SqlConnection.blank(), 'name': 'Mağaza (SQLite)', 'provider': 'sqlite', 'filePath': path});
        await t.runAsync(() async {
          await t.pumpWidget(_app(SqlConnScreen(conn: conn, engine: engine, settings: SqlSettings(SqlSettings.blank()), onHostKey: (_) {}), dark: dark));
          for (var i = 0; i < 10; i++) { await t.pump(const Duration(milliseconds: 100)); }
          // tablette: siparisler tablosuna dokun → veri sekmesi
          if (e.value.width >= 720) {
            await t.tap(find.text('siparisler').first);
            for (var i = 0; i < 10; i++) { await t.pump(const Duration(milliseconds: 100)); }
          }
        });
        await t.pump(const Duration(milliseconds: 100));
        await expectLater(find.byType(SqlConnScreen), matchesGoldenFile('goldens/sql-baglanti-$tag.png'));
      });
    }
  }
}
