// Convert Master resim dönüştürme (saf Dart `image`): küçük PNG üret → JPEG / WEBP / PNG / BMP; boyut sınırı, şeffaflık, EXIF.
import 'dart:io';
import 'dart:typed_data';

import 'package:flutter_test/flutter_test.dart';
import 'package:image/image.dart' as img;
import 'package:master_tool/core/account.dart';
import 'package:master_tool/core/module_host.dart';
import 'package:master_tool/modules/convert/cv_engine.dart';
import 'package:master_tool/modules/convert/cv_ffmpeg_args.dart';
import 'package:master_tool/modules/convert/cv_image.dart';
import 'package:master_tool/modules/convert/cv_model.dart';
import 'package:path_provider_platform_interface/path_provider_platform_interface.dart';

class _FakePath extends PathProviderPlatform {
  _FakePath(this.dir);
  final String dir;
  @override
  Future<String?> getApplicationSupportPath() async => dir;
  @override
  Future<String?> getApplicationDocumentsPath() async => dir;
}

img.Image _sample({int w = 64, int h = 40, bool alpha = false}) {
  final im = img.Image(width: w, height: h, numChannels: alpha ? 4 : 3);
  for (var y = 0; y < h; y++) {
    for (var x = 0; x < w; x++) {
      im.setPixelRgba(x, y, (x * 255 ~/ w), (y * 255 ~/ h), 128, alpha && x < w ~/ 2 ? 0 : 255);
    }
  }
  return im;
}

void main() {
  final png = img.encodePng(_sample());
  const base = {'quality': 85, 'maxWidth': 0, 'maxHeight': 0, 'keepMeta': false};

  test('PNG → JPEG: geçerli JPEG, boyutlar korunur', () {
    final out = convertImageBytes(CvImageJob(bytes: png, name: 'a.png', target: 'jpg', options: base));
    expect(out.sublist(0, 2), [0xFF, 0xD8]);
    final d = img.decodeJpg(out)!;
    expect((d.width, d.height), (64, 40));
  });

  test('kalite dosya boyutunu etkiler', () {
    final big = img.encodePng(_sample(w: 400, h: 300));
    final hi = convertImageBytes(CvImageJob(bytes: big, name: 'a.png', target: 'jpg', options: {...base, 'quality': 95}));
    final lo = convertImageBytes(CvImageJob(bytes: big, name: 'a.png', target: 'jpg', options: {...base, 'quality': 30}));
    expect(lo.length, lessThan(hi.length));
  });

  test('en/boy sınırı: içine sığdır, oran korunur, büyütme yok', () {
    final out = img.decodePng(convertImageBytes(CvImageJob(bytes: png, name: 'a.png', target: 'png', options: {...base, 'maxWidth': 32, 'maxHeight': 1000})))!;
    expect((out.width, out.height), (32, 20));
    final same = img.decodePng(convertImageBytes(CvImageJob(bytes: png, name: 'a.png', target: 'png', options: {...base, 'maxWidth': 500})))!;
    expect((same.width, same.height), (64, 40));
  });

  test('şeffaf PNG → JPEG beyaz zemine basılır; WEBP / BMP / GIF / TIFF / ICO kodlanır', () {
    final tp = img.encodePng(_sample(alpha: true));
    final j = img.decodeJpg(convertImageBytes(CvImageJob(bytes: tp, name: 'a.png', target: 'jpg', options: base)))!;
    final px = j.getPixel(0, 0);
    expect(px.r > 240 && px.g > 240 && px.b > 240, isTrue);
    for (final t in ['webp', 'bmp', 'gif', 'tiff', 'ico']) {
      final out = convertImageBytes(CvImageJob(bytes: tp, name: 'a.png', target: t, options: base));
      expect(out.length, greaterThan(16), reason: t);
      expect(img.decodeImage(out), isNotNull, reason: t);
    }
  });

  test('EXIF: keepMeta kapalıyken silinir, açıkken kalır', () {
    final src = _sample()..exif.imageIfd['Make'] = 'MasterTool';
    final jp = img.encodeJpg(src);
    expect(img.decodeJpg(jp)!.exif.imageIfd['Make']?.toString(), 'MasterTool');
    final strip = img.decodeJpg(convertImageBytes(CvImageJob(bytes: jp, name: 'a.jpg', target: 'jpg', options: base)))!;
    expect(strip.exif.imageIfd['Make'], isNull);
    final keep = img.decodeJpg(convertImageBytes(CvImageJob(bytes: jp, name: 'a.jpg', target: 'jpg', options: {...base, 'keepMeta': true})))!;
    expect(keep.exif.imageIfd['Make']?.toString(), 'MasterTool');
  });

  test('bozuk veri → unreadable; avif → unsupported', () {
    expect(() => convertImageBytes(CvImageJob(bytes: Uint8List.fromList([1, 2, 3]), name: 'a.png', target: 'jpg', options: base)),
        throwsA(isA<CvConvertError>().having((e) => e.code, 'code', 'unreadable')));
    expect(() => convertImageBytes(CvImageJob(bytes: png, name: 'a.png', target: 'avif', options: base)),
        throwsA(isA<CvConvertError>().having((e) => e.code, 'code', 'unsupported')));
  });

  test('CvRunner: dosya ekle → başlat → çıktı yazılır ve durum kalıcı olur', () async {
    TestWidgetsFlutterBinding.ensureInitialized();
    final tmp = Directory.systemTemp.createTempSync('cvrun');
    PathProviderPlatform.instance = _FakePath(tmp.path);
    final acc = AccountService(store: MemoryKvStore())..seed(email: 'a@b', name: 'A', modules: const []);
    final host = ModuleHost(acc);
    final e = await host.open('cv', hasSettings: true, localOnly: kCvLocalOnly);
    e.syncEnabled = false;
    e.stop();
    await Future<void>.delayed(const Duration(milliseconds: 300)); // open() ilk senkron denemesi (ağ yok) bitsin; kitaplık dosyası çakışmasın
    e.library.items['p1'] = ('project', {...CvProject.blank(type: 'image'), 'name': 'Resimler', 'sourceExts': ['png'], 'targetExt': 'jpg', 'concurrency': 2});
    final src = File('${tmp.path}/ornek.png')..writeAsBytesSync(png);
    final bad = File('${tmp.path}/belge.txt')..writeAsStringSync('x');
    final r = CvRunner(projectId: 'p1', engine: e, baseDir: Directory('${tmp.path}/cv'),
        convert: (p, s, out, prog, tok) async { // ffmpeg'siz: saf Dart yolu
          final b = convertImageBytes(CvImageJob(bytes: await File(s).readAsBytes(), name: s, target: p.targetExt, options: (p.options['image'] as Map).cast<String, dynamic>()));
          await File(out).writeAsBytes(b);
          return b.length;
        });
    expect(await r.addFiles([src.path, bad.path]), 1);
    expect(r.sources.single.name, 'ornek.png');
    expect(File(r.srcPath('ornek.png')).existsSync(), isTrue);
    r.start();
    for (var i = 0; i < 100 && r.running; i++) { await Future<void>.delayed(const Duration(milliseconds: 20)); }
    final j = r.jobs['ornek.png']!;
    expect(j.status, CvStatus.done);
    expect(j.out, 'ornek.jpg');
    expect(File(r.outPath('ornek.png')!).existsSync(), isTrue);
    expect(j.outSize, greaterThan(0));
    // yerel alanlar kitaplıkta, blob'a girmez
    final data = e.library.items['p1']!.$2;
    expect((data['outputs'] as Map)['ornek.png']['status'], 'done');
    final synced = e.debugLocalItems().firstWhere((x) => x.id == 'p1').data!; // (meta güncellenir, kitaplık arkada kaydedilir)
    expect(synced.containsKey('outputs'), isFalse);
    expect(synced.containsKey('sources'), isFalse);
    expect(synced['name'], 'Resimler');
    await Future<void>.delayed(const Duration(milliseconds: 200));
    await r.deleteOutput('ornek.png');
    expect(r.jobs['ornek.png']!.status, CvStatus.pending);
    await r.remove('ornek.png');
    expect(r.sources, isEmpty);
    expect(File(r.srcPath('ornek.png')).existsSync(), isFalse);
    host.dispose();
  });
}
