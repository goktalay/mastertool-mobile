// Convert Master metin işleri (CvRunner OCR / konuşma kuyruğu) — sahte motorlarla: ML Kit ve whisper native kütüphaneleri test
// ortamında yoktur; CvOcrEngine / CvSpeechEngine / WAV dönüşümü / probe / model deposu enjekte edilir.
import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:flutter_test/flutter_test.dart';
import 'package:http/http.dart' as http;
import 'package:http/testing.dart' show MockClient;
import 'package:master_tool/core/account.dart';
import 'package:master_tool/core/module_host.dart';
import 'package:master_tool/core/sync.dart';
import 'package:master_tool/modules/convert/cv_engine.dart';
import 'package:master_tool/modules/convert/cv_ffmpeg_args.dart';
import 'package:master_tool/modules/convert/cv_model.dart';
import 'package:master_tool/modules/convert/cv_ocr.dart';
import 'package:master_tool/modules/convert/cv_speech.dart';
import 'package:master_tool/modules/convert/cv_text_formats.dart';
import 'package:path_provider_platform_interface/path_provider_platform_interface.dart';

class _FakePath extends PathProviderPlatform {
  _FakePath(this.dir);
  final String dir;
  @override
  Future<String?> getApplicationSupportPath() async => dir;
  @override
  Future<String?> getApplicationDocumentsPath() async => dir;
}

class _FakeOcr implements CvOcrEngine {
  List<String>? langsSeen;
  bool fail = false;
  Completer<void>? gate;
  @override
  Future<CvOcrResult> recognize(String path, List<String> langs, {required Directory workDir, bool Function()? isCanceled}) async {
    langsSeen = langs;
    if (gate != null) await gate!.future;
    if (isCanceled?.call() == true) throw CvConvertError('canceled');
    if (fail) throw CvConvertError('ocr_failed', 'bozuk resim');
    if (path.endsWith('bos.png')) return const CvOcrResult(languages: ['tur'], text: '', lines: []);
    return CvOcrResult(languages: langs, text: 'Fatura\nToplam', width: 10, height: 10, lines: const [
      CvOcrLine(text: 'Fatura', conf: 95, x0: 0, y0: 0, x1: 5, y1: 2), CvOcrLine(text: 'Toplam', conf: 80, x0: 0, y0: 3, x1: 5, y1: 5)]);
  }
}

class _FakeSpeech implements CvSpeechEngine {
  String? modelPathSeen, langSeen, wavSeen;
  bool aborted = false, released = false;
  Completer<void>? gate;
  @override
  Future<List<CvRawSegment>> transcribe({required String wavPath, required String modelPath, required String language, int threads = 4}) async {
    modelPathSeen = modelPath; langSeen = language; wavSeen = wavPath;
    if (gate != null) await gate!.future;
    if (aborted) throw CvConvertError('canceled');
    return [(fromMs: 0, toMs: 1500, text: ' Merhaba'), (fromMs: 1500, toMs: 2000, text: '[BLANK_AUDIO]'), (fromMs: 2000, toMs: 3200, text: 'dünya ')];
  }
  @override
  Future<void> abort() async { aborted = true; gate?.complete(); }
  @override
  Future<void> release() async { released = true; }
}

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  test('CvJob JSON: metin durumu kaydedilir; süren iş yeniden açılışta bekliyor olur', () {
    final j = CvJob(status: CvStatus.done, out: 'a.jpg', outSize: 5, text: CvTextJob(status: CvStatus.converting, out: 'a.json', count: 3, lang: 'tr'));
    final back = CvJob.fromJson(jsonDecode(jsonEncode(j.toJson())) as Map<String, dynamic>);
    expect(back.status, CvStatus.done);
    expect(back.text.status, CvStatus.pending);
    expect((back.text.out, back.text.count, back.text.lang), ('a.json', 3, 'tr'));
    final done = CvJob.fromJson({'status': 'pending', 'text': {'status': 'done', 'out': 'b.json', 'count': 2, 'note': 'no_text'}});
    expect((done.text.status, done.text.progress, done.text.note), (CvStatus.done, 1.0, 'no_text'));
    expect(CvJob.fromJson({'status': 'done'}).text.status, CvStatus.pending); // eski kayıt: text alanı yok
  });

  group('CvRunner metin işleri', () {
  late ModuleHost host;
  late SyncEngine engine;
  late Directory tmp;
  setUpAll(() { tmp = Directory.systemTemp.createTempSync('mtcvtext'); PathProviderPlatform.instance = _FakePath(tmp.path); });
  setUp(() async {
    final acc = AccountService(store: MemoryKvStore())..seed(email: 'ornek@example.com', name: 'Örnek', modules: const []);
    host = ModuleHost(acc);
    engine = await host.open('cv', hasSettings: true, localOnly: kCvLocalOnly);
    engine.syncEnabled = false;
    engine.stop();
    engine.library.items['img'] = ('project', {...CvProject.blank(type: 'image'), 'name': 'Belgeler', 'sourceExts': ['png'], 'ocr': {'enabled': true, 'languages': ['tur', 'eng', 'rus']}});
    engine.library.items['vid'] = ('project', {...CvProject.blank(type: 'video'), 'name': 'Konferans', 'sourceExts': ['mp4'], 'speech': {'enabled': true, 'model': 'medium', 'language': 'tr', 'perWindow': false}});
    engine.library.items['off'] = ('project', {...CvProject.blank(type: 'video'), 'name': 'Kapalı', 'sourceExts': ['mp4']});
  });
  tearDown(() async { await Future<void>.delayed(const Duration(milliseconds: 50)); host.dispose(); });

  Future<void> settle(CvRunner r, bool Function() done) async {
    for (var i = 0; i < 300 && !done(); i++) { await Future<void>.delayed(const Duration(milliseconds: 10)); }
    expect(done(), isTrue, reason: 'iş bitmedi: ${r.jobs.map((k, v) => MapEntry(k, '${v.text.status.name}/${v.text.phase.name}/${v.text.error}'))}');
  }

  /// Runner'ı işler tamamen kapanınca (finally dahil) bırakır.
  Future<void> drop(CvRunner r) async { await settle(r, () => !r.textRunning); await Future<void>.delayed(const Duration(milliseconds: 30)); r.dispose(); }

  Future<String> seedFile(CvRunner r, String name, [String content = 'x']) async {
    await r.srcDir.create(recursive: true);
    final f = File(r.srcPath(name));
    await f.writeAsString(content);
    r.sources.add(CvSource(name: name, size: 1, mtime: 0));
    r.jobs[name] = CvJob();
    return f.path;
  }

  test('OCR işi: Başlat ile sıraya girer, JSON + TXT yazar, satır sayısı; dönüştürme sırasından bağımsız', () async {
    final ocr = _FakeOcr();
    final r = CvRunner(projectId: 'img', engine: engine, baseDir: Directory('${tmp.path}/cv-ocr'), convert: (_, _, _, _, _) async => 1, ocr: ocr);
    await seedFile(r, 'fatura.png');
    await seedFile(r, 'bos.png');
    r.start();
    expect(r.jobs['fatura.png']!.text.status, anyOf(CvStatus.queued, CvStatus.converting));
    await settle(r, () => r.jobs['fatura.png']!.text.status == CvStatus.done && r.jobs['bos.png']!.text.status == CvStatus.done && !r.running);
    expect(ocr.langsSeen, ['tur', 'eng', 'rus']); // proje dilleri motora iletilir (rus motorda eşleşmez)
    final t = r.jobs['fatura.png']!.text;
    expect((t.out, t.count, t.note), ('fatura.json', 2, null));
    expect(await File('${r.textDir.path}/fatura.txt').readAsString(), 'Fatura\r\nToplam\r\n');
    final saved = await r.readOcr('fatura.png');
    expect(saved!.lines.map((l) => l.text).toList(), ['Fatura', 'Toplam']);
    expect(r.jobs['bos.png']!.text.note, 'no_text');
    expect(r.textDoneCount, 2);
    // Dışa aktarım: csv
    final csv = await r.exportText('fatura.png', 'csv');
    final csvBytes = await File(csv!).readAsBytes();
    expect(csvBytes.sublist(0, 3), [0xEF, 0xBB, 0xBF]); // UTF-8 BOM (readAsString BOM'u atar)
    expect(utf8.decode(csvBytes.sublist(3)), 'line;confidence;text\r\n1;95;"Fatura"\r\n2;80;"Toplam"\r\n');
    // Kalıcılık: outputs.text
    final out = (engine.library.items['img']!.$2['outputs'] as Map)['fatura.png'] as Map;
    expect((out['text'] as Map)['status'], 'done');
    // Metni sil
    await r.deleteText('fatura.png');
    expect(r.jobs['fatura.png']!.text.status, CvStatus.pending);
    expect(File('${r.textDir.path}/fatura.json').existsSync(), isFalse);
    await drop(r);
  });

  test('OCR hatası ve iptal: ocr_failed:mesaj; iptal edilen iş canceled', () async {
    final ocr = _FakeOcr()..fail = true;
    final r = CvRunner(projectId: 'img', engine: engine, baseDir: Directory('${tmp.path}/cv-ocr2'), convert: (_, _, _, _, _) async => 1, ocr: ocr);
    await seedFile(r, 'a.png');
    r.transcribeOne('a.png');
    await settle(r, () => r.jobs['a.png']!.text.status == CvStatus.error);
    expect(r.jobs['a.png']!.text.error, 'ocr_failed:bozuk resim');
    ocr..fail = false..gate = Completer();
    r.transcribeOne('a.png');
    await settle(r, () => r.jobs['a.png']!.text.status == CvStatus.converting);
    r.cancelText('a.png');
    ocr.gate!.complete();
    await settle(r, () => r.jobs['a.png']!.text.status == CvStatus.canceled);
    expect(r.textRunning, isFalse);
    await drop(r);
  });

  test('konuşma işi: model (medium → base) sahte sunucudan indirilir, WAV üretilir, whisper çağrılır, JSON + SRT yazılır', () async {
    final speech = _FakeSpeech();
    final modelBytes = List<int>.generate(1000, (i) => i % 251);
    final client = MockClient.streaming((req, _) async {
      expect(req.url.path, endsWith('ggml-base.bin'));
      return http.StreamedResponse(Stream.fromIterable([modelBytes.sublist(0, 400), modelBytes.sublist(400)]), 200, contentLength: modelBytes.length);
    });
    final models = CvSpeechModels(Directory('${tmp.path}/cv-sp/models'), client: client);
    final wavs = <String>[];
    final r = CvRunner(projectId: 'vid', engine: engine, baseDir: Directory('${tmp.path}/cv-sp'), convert: (_, _, _, _, _) async => 1, speech: speech, models: models,
        toWav: (src, wav, onSession) async { wavs.add(wav); await File(wav).writeAsString('RIFF'); onSession?.call(7); },
        probe: (_) async => const CvMediaInfo(duration: 3.2, hasAudio: true, hasVideo: true));
    await seedFile(r, 'konusma.mp4');
    expect(models.installed('base'), isFalse);
    r.transcribeOne('konusma.mp4');
    await settle(r, () => r.jobs['konusma.mp4']!.text.status == CvStatus.done);
    expect(models.installed('base'), isTrue);
    expect(models.size('base'), 1000);
    expect(speech.modelPathSeen, models.file('base').path);
    expect(speech.langSeen, 'tr');
    expect(wavs.single, endsWith('.~konusma.wav'));
    expect(File(wavs.single).existsSync(), isFalse); // geçici WAV silinir
    final t = r.jobs['konusma.mp4']!.text;
    expect((t.count, t.lang, t.note, t.out), (2, 'tr', null, 'konusma.json'));
    expect(await File('${r.textDir.path}/konusma.srt').readAsString(), '1\n00:00:00,000 --> 00:00:01,500\nMerhaba\n\n2\n00:00:02,000 --> 00:00:03,200\ndünya\n');
    final segs = await r.readSegments('konusma.mp4');
    expect(segs.map((s) => s.text).toList(), ['Merhaba', 'dünya']);
    final vtt = await r.exportText('konusma.mp4', 'vtt');
    expect(await File(vtt!).readAsString(), startsWith('WEBVTT\n\n00:00:00.000 --> 00:00:01.500\nMerhaba\n'));
    await settle(r, () => speech.released); // kuyruk boşalınca model bırakılır
    await drop(r);
  });

  test('konuşma: sessiz dosya "Ses yok"; iptal abort çağırır; model indirme hatası download_failed', () async {
    final speech = _FakeSpeech()..gate = Completer();
    final models = CvSpeechModels(Directory('${tmp.path}/cv-sp2/models'), client: MockClient.streaming((req, _) async => http.StreamedResponse(const Stream.empty(), 503)));
    await models.dir.create(recursive: true);
    var silent = true;
    final r = CvRunner(projectId: 'vid', engine: engine, baseDir: Directory('${tmp.path}/cv-sp2'), convert: (_, _, _, _, _) async => 1, speech: speech, models: models,
        toWav: (src, wav, _) async => File(wav).writeAsString('RIFF'), probe: (_) async => CvMediaInfo(duration: 3, hasAudio: !silent, hasVideo: true));
    await seedFile(r, 'sessiz.mp4');
    r.transcribeOne('sessiz.mp4');
    await settle(r, () => r.jobs['sessiz.mp4']!.text.status == CvStatus.done);
    expect(r.jobs['sessiz.mp4']!.text.note, 'no_audio');
    // Model yok, sunucu 503 → download_failed
    silent = false;
    r.transcribeOne('sessiz.mp4');
    await settle(r, () => r.jobs['sessiz.mp4']!.text.status == CvStatus.error);
    expect(r.jobs['sessiz.mp4']!.text.error, 'download_failed:HTTP 503');
    // Model yerinde → whisper çalışır; iptal → abort
    await models.file('base').writeAsString('model');
    r.transcribeOne('sessiz.mp4');
    await settle(r, () => speech.wavSeen != null);
    expect(r.jobs['sessiz.mp4']!.text.phase, CvTextPhase.run);
    r.cancelText('sessiz.mp4');
    await settle(r, () => r.jobs['sessiz.mp4']!.text.status == CvStatus.canceled);
    expect(speech.aborted, isTrue);
    await drop(r);
  });

  test('projede metin kapalıysa Başlat metin işi açmaz; tek dosya için yine çalıştırılır; Durdur metin işlerini de durdurur', () async {
    final speech = _FakeSpeech()..gate = Completer();
    final models = CvSpeechModels(Directory('${tmp.path}/cv-off/models'));
    await models.dir.create(recursive: true);
    await models.file('base').writeAsString('model');
    final r = CvRunner(projectId: 'off', engine: engine, baseDir: Directory('${tmp.path}/cv-off'), convert: (_, _, _, _, _) async => 1, speech: speech, models: models,
        toWav: (src, wav, _) async => File(wav).writeAsString('RIFF'), probe: (_) async => const CvMediaInfo(duration: 3, hasAudio: true, hasVideo: true));
    await seedFile(r, 'a.mp4');
    await seedFile(r, 'b.mp4');
    r.start();
    await settle(r, () => !r.running);
    expect(r.jobs['a.mp4']!.text.status, CvStatus.pending);
    expect(r.textRunning, isFalse);
    r.transcribeOne('a.mp4');
    r.transcribeOne('b.mp4');
    await settle(r, () => r.jobs['a.mp4']!.text.status == CvStatus.converting);
    expect(r.jobs['b.mp4']!.text.status, CvStatus.queued); // aynı anda 1
    expect(r.textQueuedCount, 1);
    r.stop();
    await settle(r, () => r.jobs['a.mp4']!.text.status == CvStatus.canceled);
    expect(r.jobs['b.mp4']!.text.status, CvStatus.pending);
    await drop(r);
  });
  });
}
