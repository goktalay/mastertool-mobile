// Convert Master kitaplık, proje formu, proje ekranı ve ayarlar ekran görüntüleri (telefon + tablet, gece + gündüz).
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
import 'package:master_tool/modules/convert/cv_engine.dart';
import 'package:master_tool/modules/convert/cv_form.dart';
import 'package:master_tool/modules/convert/cv_library.dart';
import 'package:master_tool/modules/convert/cv_model.dart';
import 'package:master_tool/modules/convert/cv_project.dart';
import 'package:master_tool/modules/convert/cv_settings.dart';
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

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();
  late ModuleHost host;
  late SyncEngine engine;
  late Directory tmp;
  setUpAll(() async {
    await _loadFont();
    tmp = Directory.systemTemp.createTempSync('mtlibcv');
    PathProviderPlatform.instance = _FakePath(tmp.path);
  });
  setUp(() async {
    final acc = AccountService(store: MemoryKvStore())..seed(email: 'ornek@example.com', name: 'Örnek', modules: const []);
    host = ModuleHost(acc);
    engine = await host.open('cv', hasSettings: true, localOnly: kCvLocalOnly);
    engine.syncEnabled = false;
    engine.stop();
    final lib = engine.library;
    lib.items['f1'] = ('folder', {'name': 'Arşiv', 'parentId': null});
    lib.items['p1'] = ('project', {...CvProject.blank(type: 'image'), 'name': 'Belgeler', 'sourceExts': ['png', 'jpg'], 'targetExt': 'jpg', 'sourceMode': 'folder',
        'outputs': {'a.png': {'status': 'done', 'out': 'a.jpg', 'outSize': 1000}, 'b.png': {'status': 'done', 'out': 'b.jpg', 'outSize': 1000}, 'c.png': {'status': 'done', 'out': 'c.jpg', 'outSize': 1000}}});
    lib.items['p2'] = ('project', {...CvProject.blank(type: 'audio'), 'name': 'Konferans konuşması', 'sourceExts': ['wav'], 'targetExt': 'mp3',
        'outputs': {'k.wav': {'status': 'done', 'out': 'k.mp3', 'outSize': 939000}}});
    lib.items['p3'] = ('project', {...CvProject.blank(type: 'video'), 'name': 'Tatil videoları', 'sourceExts': [...CvProject(
        'x', CvProject.blank(type: 'video')).typeInfo.source], 'targetExt': 'mp4', 'concurrency': 2,
        'outputs': {'x.mkv': {'status': 'done', 'out': 'x.mp4', 'outSize': 1000}, 'y.mkv': {'status': 'done', 'out': 'y.mp4', 'outSize': 1000}}});
    lib.items['p4'] = ('project', {...CvProject.blank(type: 'image'), 'name': 'Ürün fotoğrafları', 'sourceExts': ['png', 'bmp'], 'targetExt': 'webp', 'folderId': null,
        'outputs': {for (var i = 0; i < 11; i++) 'u$i.png': {'status': 'done', 'out': 'u$i.webp', 'outSize': 100}}});
  });
  tearDown(() => host.dispose());

  CvRunner seededRunner() {
    final r = CvRunner(projectId: 'p3', engine: engine, baseDir: Directory('${tmp.path}/cv'), convert: (_, _, _, _, _) async => 0);
    r.seed([
      CvSource(name: 'Doğum günü.mkv', size: 480 * 1024, mtime: 0),
      CvSource(name: 'Röportaj - dede.mkv', size: 2700 * 1024, mtime: 0),
      CvSource(name: 'Konser kaydı.mp4', size: 52 * 1024, mtime: 0),
      CvSource(name: 'Mezuniyet.3gp', size: 413 * 1024, mtime: 0),
      CvSource(name: 'Plaj gün batımı.mkv', size: 166 * 1024 * 1024, mtime: 0),
      CvSource(name: 'Tekne turu.mov', size: 37 * 1024 * 1024, mtime: 0),
      CvSource(name: 'Kayak pisti.avi', size: 46 * 1024 * 1024, mtime: 0),
      CvSource(name: 'Teleferik.wmv', size: 73 * 1024 * 1024, mtime: 0),
    ], {
      'Doğum günü.mkv': CvJob(status: CvStatus.done, progress: 1, out: 'Doğum günü.mp4', outSize: 278 * 1024),
      'Röportaj - dede.mkv': CvJob(status: CvStatus.done, progress: 1, out: 'Röportaj - dede.mp4', outSize: 1300 * 1024),
      'Konser kaydı.mp4': CvJob(status: CvStatus.converting, progress: .62),
      'Mezuniyet.3gp': CvJob(status: CvStatus.converting, progress: .0),
      'Plaj gün batımı.mkv': CvJob(status: CvStatus.queued),
      'Tekne turu.mov': CvJob(status: CvStatus.error, error: 'no_video'),
      'Kayak pisti.avi': CvJob(status: CvStatus.queued),
      'Teleferik.wmv': CvJob(status: CvStatus.queued),
    });
    r.running = true;
    return r;
  }

  final sizes = {'telefon': const Size(390, 844), 'tablet': const Size(1024, 768)};
  for (final e in sizes.entries) {
    for (final dark in [true, false]) {
      final tag = '${e.key}-${dark ? 'gece' : 'gunduz'}';
      Future<void> setSize(WidgetTester t) async {
        await t.binding.setSurfaceSize(e.value);
        t.view.physicalSize = e.value;
        t.view.devicePixelRatio = 1;
      }

      testWidgets('cv kitaplık $tag', (t) async {
        await setSize(t);
        await t.pumpWidget(_app(CvLibraryScreen(host: host), dark: dark));
        for (var i = 0; i < 6; i++) { await t.pump(const Duration(milliseconds: 100)); }
        await expectLater(find.byType(CvLibraryScreen), matchesGoldenFile('goldens/cv-kitaplik-$tag.png'));
      });
      testWidgets('cv form $tag', (t) async {
        await setSize(t);
        await t.pumpWidget(_app(CvFormScreen(folders: const [('f1', 'Arşiv')]), dark: dark));
        await t.pump(const Duration(milliseconds: 300));
        await expectLater(find.byType(CvFormScreen), matchesGoldenFile('goldens/cv-form-$tag.png'));
        await t.tap(find.text('Dönüştürme ayarları'));
        await t.pumpAndSettle();
        await expectLater(find.byType(CvFormScreen), matchesGoldenFile('goldens/cv-form-ayarlar-$tag.png'));
      });
      testWidgets('cv proje $tag', (t) async {
        await setSize(t);
        final r = seededRunner();
        await t.pumpWidget(_app(CvProjectScreen(projectId: 'p3', engine: engine, runner: r, onEditProject: (_) async {}, onModuleSettings: (_) {}), dark: dark));
        await t.pump(const Duration(milliseconds: 300));
        if (e.key == 'tablet') { await t.tap(find.text('Doğum günü.mkv')); await t.pump(const Duration(milliseconds: 300)); }
        await expectLater(find.byType(CvProjectScreen), matchesGoldenFile('goldens/cv-proje-$tag.png'));
        r.dispose();
      });
      testWidgets('cv ayarlar $tag', (t) async {
        await setSize(t);
        await t.runAsync(() async { // klasör boyutları gerçek dosya sisteminden okunur
          await t.pumpWidget(_app(CvSettingsScreen(engine: engine, baseDir: Directory('${tmp.path}/cv')), dark: dark));
          await Future<void>.delayed(const Duration(milliseconds: 200));
        });
        for (var i = 0; i < 4; i++) { await t.pump(const Duration(milliseconds: 100)); }
        await expectLater(find.byType(CvSettingsScreen), matchesGoldenFile('goldens/cv-ayarlar-$tag.png'));
      });
    }
  }
}
