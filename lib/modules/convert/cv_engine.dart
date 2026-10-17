// Proje çalıştırıcı (masaüstü convertmaster/src/jobs.js ProjectRunner karşılığı, mobil):
//  • Kaynaklar dosya seçiciden kopyalanır: <belgeler>/cv/src/<projeId>/<ad>; çıktı: <belgeler>/cv/converted/<projeId>/<kök>.<hedef>.
//  • Durum (sources, outputs) kitaplık öğesinin yerel alanlarında tutulur (localOnly: blob'a girmez); ilerleme yalnız bellekte.
//  • Sıra: projenin "aynı anda" ayarı (mobilde en çok 2). Resim: saf Dart `image` (isolate); video/ses: FFmpegKit, ilerleme
//    Statistics.time / süre; iptal FFmpegKit.cancel(sessionId).
//  • Dönüştürme işlevi (CvConvertFn) enjekte edilebilir — testlerde FFmpegKit çağrılmaz.
//  • Metin işleri (masaüstü jobs.js speech/ocr kuyruğu): proje speech.enabled (video/ses → whisper) ya da ocr.enabled (resim →
//    ML Kit) ise Başlat ile dönüştürmeden bağımsız ayrı kuyruğa girer (aynı anda 1); tek dosya için kapalıyken de çalıştırılır.
//    Çıktı: <belgeler>/cv/text/<projeId>/<kök>.json (konuşma: cümleler; OCR: satırlar+koordinat) + <kök>.srt (konuşma) / <kök>.txt (OCR).
//    Motorlar (CvOcrEngine, CvSpeechEngine), model deposu ve WAV dönüşümü enjekte edilebilir — testlerde native kütüphane yoktur.
import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:ffmpeg_kit_flutter_new_full/ffmpeg_kit.dart';
import 'package:ffmpeg_kit_flutter_new_full/ffprobe_kit.dart';
import 'package:ffmpeg_kit_flutter_new_full/return_code.dart';
import 'package:flutter/foundation.dart';
import 'package:path_provider/path_provider.dart';

import '../../core/sync.dart';
import 'cv_ffmpeg_args.dart';
import 'cv_formats.dart';
import 'cv_image.dart';
import 'cv_model.dart';
import 'cv_ocr.dart';
import 'cv_speech.dart';
import 'cv_text_formats.dart';

enum CvStatus { pending, queued, converting, done, error, canceled }

/// Metin işinin aşaması (ilerleme belirsiz; aşama gösterilir): model indirme (ilerleme bilinir), WAV'a çevirme, tanıma.
enum CvTextPhase { none, download, wav, run }

/// Konuşma / OCR işi durumu (jobs[name].text). `out` metin JSON dosyası (text klasörüne göre), `count` cümle / satır sayısı,
/// `note` 'no_audio' (sessiz dosya) ya da 'no_text' (metin bulunamadı), `lang` konuşma dili (seçilen; auto → '').
class CvTextJob {
  CvTextJob({this.status = CvStatus.pending, this.progress = 0, this.phase = CvTextPhase.none, this.out, this.count = 0, this.note, this.lang = '', this.error});
  CvStatus status;
  double progress;
  CvTextPhase phase;
  String? out;
  int count;
  String? note;
  String lang;
  String? error;
  Map<String, dynamic> toJson() => {'status': status.name, 'out': out, 'count': count, 'note': note, 'lang': lang, 'error': error};
  factory CvTextJob.fromJson(Map<String, dynamic> j) {
    final st = CvStatus.values.where((x) => x.name == j['status']).firstOrNull ?? CvStatus.pending;
    return CvTextJob(status: st == CvStatus.converting || st == CvStatus.queued ? CvStatus.pending : st, progress: st == CvStatus.done ? 1 : 0,
        out: j['out'] as String?, count: (j['count'] as num?)?.toInt() ?? 0, note: j['note'] as String?, lang: (j['lang'] ?? '').toString(), error: j['error'] as String?);
  }
  void reset() { status = CvStatus.pending; progress = 0; phase = CvTextPhase.none; out = null; count = 0; note = null; error = null; }
}

class CvSource {
  CvSource({required this.name, required this.size, required this.mtime});
  final String name;
  final int size, mtime;
  Map<String, dynamic> toJson() => {'name': name, 'size': size, 'mtime': mtime};
  factory CvSource.fromJson(Map<String, dynamic> j) => CvSource(name: (j['name'] ?? '').toString(), size: (j['size'] as num?)?.toInt() ?? 0, mtime: (j['mtime'] as num?)?.toInt() ?? 0);
}

class CvJob {
  CvJob({this.status = CvStatus.pending, this.progress = 0, this.out, this.outSize = 0, this.error, CvTextJob? text}) : text = text ?? CvTextJob();
  CvStatus status;
  double progress;
  String? out; // çıktı dosya adı (klasöre göre)
  int outSize;
  String? error; // hata kodu ya da ffmpeg mesajı
  /// Konuşma / OCR işi (dönüştürmeden bağımsız).
  final CvTextJob text;
  Map<String, dynamic> toJson() => {'status': status.name, 'out': out, 'outSize': outSize, 'error': error, 'text': text.toJson()};
  factory CvJob.fromJson(Map<String, dynamic> j) {
    final st = CvStatus.values.where((x) => x.name == j['status']).firstOrNull ?? CvStatus.pending;
    final t = (j['text'] as Map?)?.cast<String, dynamic>();
    return CvJob(status: st == CvStatus.converting || st == CvStatus.queued ? CvStatus.pending : st, progress: st == CvStatus.done ? 1 : 0,
        out: j['out'] as String?, outSize: (j['outSize'] as num?)?.toInt() ?? 0, error: j['error'] as String?, text: t == null ? null : CvTextJob.fromJson(t));
  }
}

class CvCancelToken {
  bool canceled = false;
  int? sessionId;
  void Function()? onCancel;
}

/// Metin işinin iptali: aşamaya göre indirme döngüsü, FFmpeg oturumu ya da whisper abort.
class CvTextCancelToken {
  bool canceled = false;
  final List<void Function()> _hooks = [];
  void onCancel(void Function() f) { if (canceled) { f(); } else { _hooks.add(f); } }
  void cancel() { canceled = true; for (final f in _hooks.toList()) { f(); } _hooks.clear(); }
}

/// Bir kaynağı dönüştürür; çıktı boyutunu döner. Hata: CvConvertError.
typedef CvConvertFn = Future<int> Function(CvProject p, String srcPath, String outPath, void Function(double) onProgress, CvCancelToken token);

/// Uygulama belgeleri altındaki kök: `<belgeler>/cv`
Future<Directory> cvBaseDir() async => Directory('${(await getApplicationDocumentsDirectory()).path}/cv');

Future<int> dirSize(Directory d) async {
  if (!await d.exists()) return 0;
  var total = 0;
  await for (final e in d.list(recursive: true, followLinks: false)) {
    if (e is File) {
      try { total += await e.length(); } catch (_) {}
    }
  }
  return total;
}

class CvRunner extends ChangeNotifier {
  CvRunner({required this.projectId, required this.engine, required this.baseDir, CvConvertFn? convert, CvOcrEngine? ocr, CvSpeechEngine? speech, CvSpeechModels? models, CvWavFn? toWav, Future<CvMediaInfo> Function(String path)? probe})
      : _convert = convert ?? cvConvertDefault, _ocr = ocr, _speech = speech, _toWav = toWav ?? cvToWavDefault, _probe = probe ?? cvProbe, // ignore: prefer_initializing_formals
        models = models ?? CvSpeechModels(Directory('${baseDir.path}/models')) {
    _load();
  }
  final String projectId;
  final SyncEngine engine;
  final Directory baseDir;
  final CvConvertFn _convert;
  final CvOcrEngine? _ocr;
  final CvSpeechEngine? _speech;
  final CvWavFn _toWav;
  final Future<CvMediaInfo> Function(String path) _probe;
  /// Konuşma modeli deposu (projeler arası paylaşılır: CvRunners.of aynı örneği verir).
  final CvSpeechModels models;

  /// Motorlar yoksa (testler) varsayılanlar: ML Kit ve whisper_ggml_plus.
  CvOcrEngine get ocrEngine => _ocr ?? (_defaultOcr ??= CvMlKitOcr());
  CvSpeechEngine get speechEngine => _speech ?? (_defaultSpeech ??= CvWhisperEngine());
  static CvOcrEngine? _defaultOcr;
  static CvSpeechEngine? _defaultSpeech;

  final List<CvSource> sources = [];
  final Map<String, CvJob> jobs = {};
  final Map<String, CvCancelToken> _active = {};
  final List<String> _queue = [];
  final Map<String, CvTextCancelToken> _textActive = {};
  final List<String> _textQueue = [];
  bool running = false;
  bool _disposed = false;

  /// İşler dispose sonrasında da bitebilir (iptal → finally): bildirim sessizce yutulur.
  @override
  void notifyListeners() { if (!_disposed) super.notifyListeners(); }

  @override
  void dispose() { _disposed = true; super.dispose(); }

  Directory get srcDir => Directory('${baseDir.path}/src/$projectId');
  Directory get outDir => Directory('${baseDir.path}/converted/$projectId');
  Directory get textDir => Directory('${baseDir.path}/text/$projectId');
  CvProject? get project { final it = engine.library.items[projectId]; return it == null ? null : CvProject(projectId, it.$2); }
  int get activeCount => _active.length;
  int get doneCount => jobs.values.where((j) => j.status == CvStatus.done).length;
  int get errorCount => jobs.values.where((j) => j.status == CvStatus.error).length;
  int get outTotal => jobs.values.fold(0, (a, j) => a + (j.status == CvStatus.done ? j.outSize : 0));
  double get overall => sources.isEmpty ? 0 : sources.fold(0.0, (a, s) => a + (jobs[s.name]?.status == CvStatus.done ? 1 : jobs[s.name]?.progress ?? 0)) / sources.length;
  int get textActiveCount => _textActive.length;
  int get textQueuedCount => _textQueue.length;
  int get textDoneCount => jobs.values.where((j) => j.text.status == CvStatus.done).length;
  bool get textRunning => _textActive.isNotEmpty || _textQueue.isNotEmpty;
  String srcPath(String name) => '${srcDir.path}/$name';
  String? outPath(String name) { final o = jobs[name]?.out; return o == null ? null : '${outDir.path}/$o'; }
  String? textPath(String name) { final o = jobs[name]?.text.out; return o == null ? null : '${textDir.path}/$o'; }
  static String baseName(String name) { final ext = extOf(name); return ext.isEmpty ? name : name.substring(0, name.length - ext.length - 1); }

  void _load() {
    final p = project;
    if (p == null) return;
    sources..clear()..addAll(p.sources.map(CvSource.fromJson));
    jobs.clear();
    p.outputs.forEach((k, v) { if (v is Map) jobs[k] = CvJob.fromJson(v.cast<String, dynamic>()); });
  }

  /// Testler / ekran görüntüleri: hazır kaynak ve durum listesi.
  @visibleForTesting
  void seed(List<CvSource> src, Map<String, CvJob> st) {
    sources..clear()..addAll(src);
    jobs..clear()..addAll(st);
    notifyListeners();
  }

  Future<void> _saving = Future.value();

  /// Yerel alanları kitaplığa yazar; kayıtlar sıraya alınır (LocalLibrary.save eşzamanlı çağrıda .tmp dosyasını çakıştırır).
  Future<void> _persist() {
    final it = engine.library.items[projectId];
    if (it == null) return Future.value();
    engine.library.items[projectId] = (it.$1, {...it.$2, 'sources': sources.map((s) => s.toJson()).toList(), 'outputs': {for (final e in jobs.entries) e.key: e.value.toJson()}});
    return _saving = _saving.then((_) => engine.library.save()).catchError((_) {}); // yerel alanlar: senkron tetiklenmez
  }

  String _uniqueName(String name) {
    final taken = sources.map((s) => s.name).toSet();
    if (!taken.contains(name)) return name;
    final ext = extOf(name);
    final base = ext.isEmpty ? name : name.substring(0, name.length - ext.length - 1);
    for (var i = 2; ; i++) {
      final n = ext.isEmpty ? '$base ($i)' : '$base ($i).$ext';
      if (!taken.contains(n)) return n;
    }
  }

  /// Seçilen dosyaları kaynak klasörüne kopyalar (uzantı projede değilse atlar); eklenen sayısı döner.
  Future<int> addFiles(List<String> paths, {bool anyExt = false}) async {
    final p = project;
    if (p == null) return 0;
    await srcDir.create(recursive: true);
    var n = 0;
    for (final path in paths) {
      final f = File(path);
      final ext = extOf(path);
      if (!anyExt && !p.sourceExts.contains(ext)) continue;
      if (!await f.exists()) continue;
      final name = _uniqueName(path.split(RegExp(r'[/\\]')).last);
      final dst = File(srcPath(name));
      try {
        await f.rename(dst.path); // seçici önbelleği aynı bölümdeyse taşı
      } catch (_) {
        await f.copy(dst.path);
      }
      final st = await dst.stat();
      sources.add(CvSource(name: name, size: st.size, mtime: st.modified.millisecondsSinceEpoch));
      jobs[name] = CvJob();
      n++;
    }
    notifyListeners();
    await _persist();
    if (running) _pump();
    return n;
  }

  Future<void> remove(String name) async {
    cancel(name);
    cancelText(name);
    sources.removeWhere((s) => s.name == name);
    await deleteOutput(name, persist: false);
    await deleteText(name, persist: false);
    jobs.remove(name);
    try { await File(srcPath(name)).delete(); } catch (_) {}
    notifyListeners();
    await _persist();
  }

  Future<void> deleteOutput(String name, {bool persist = true}) async {
    final o = outPath(name);
    if (o != null) { try { await File(o).delete(); } catch (_) {} }
    final j = jobs[name];
    if (j != null && j.status != CvStatus.converting) { j..status = CvStatus.pending..progress = 0..out = null..outSize = 0..error = null; }
    notifyListeners();
    if (persist) await _persist();
  }

  /// Çevrilmiş dosyaları ve metinleri siler (masaüstü: metinler isteğe bağlı; mobilde birlikte).
  Future<void> clearOutputs() async {
    stop();
    try { await outDir.delete(recursive: true); } catch (_) {}
    try { await textDir.delete(recursive: true); } catch (_) {}
    for (final j in jobs.values) { j..status = CvStatus.pending..progress = 0..out = null..outSize = 0..error = null; j.text.reset(); }
    notifyListeners();
    await _persist();
  }

  /// Başlat: bitmemiş tüm dosyalar sıraya girer; projede açıksa metin işleri de.
  void start() {
    running = true;
    final p = project;
    final text = p != null && p.textEnabled;
    for (final s in sources) {
      final j = jobs.putIfAbsent(s.name, CvJob.new);
      if (j.status == CvStatus.pending || j.status == CvStatus.error || j.status == CvStatus.canceled) { j.status = CvStatus.queued; j.error = null; _queue.add(s.name); }
      final t = j.text;
      if (text && (t.status == CvStatus.pending || t.status == CvStatus.error || t.status == CvStatus.canceled) && !_textQueue.contains(s.name)) { t.status = CvStatus.queued; t.error = null; _textQueue.add(s.name); }
    }
    notifyListeners();
    _pump();
    _pumpText();
  }

  /// Tek dosyayı (yeniden) metne çevir / metnini oku — projede kapalıyken de (masaüstü "İsterseniz şimdi çalıştırın").
  void transcribeOne(String name) {
    final t = jobs.putIfAbsent(name, CvJob.new).text;
    if (t.status == CvStatus.converting || t.status == CvStatus.queued) return;
    t..status = CvStatus.queued..progress = 0..error = null;
    _textQueue.add(name);
    notifyListeners();
    _pumpText();
  }

  void cancelText(String name) {
    _textActive[name]?.cancel();
    _textQueue.remove(name);
    final t = jobs[name]?.text;
    if (t != null && t.status == CvStatus.queued) t.status = CvStatus.pending;
  }

  Future<void> deleteText(String name, {bool persist = true}) async {
    final j = jobs[name];
    if (j == null) return;
    final base = baseName(name);
    for (final f in ['$base.json', '$base.srt', '$base.txt']) { try { await File('${textDir.path}/$f').delete(); } catch (_) {} }
    if (j.text.status != CvStatus.converting) j.text.reset();
    notifyListeners();
    if (persist) await _persist();
  }

  void _pumpText() {
    final p = project;
    if (p == null) return;
    while (_textActive.isEmpty && _textQueue.isNotEmpty) { // mobilde aynı anda 1 metin işi
      final name = _textQueue.removeAt(0);
      unawaited(_runText(p, name));
    }
    if (_textActive.isEmpty && _textQueue.isEmpty && (_speech != null || _defaultSpeech != null)) unawaited(speechEngine.release());
    notifyListeners();
  }

  Future<void> _runText(CvProject p, String name) async {
    final t = jobs.putIfAbsent(name, CvJob.new).text;
    final token = CvTextCancelToken();
    _textActive[name] = token;
    t..status = CvStatus.converting..progress = 0..phase = CvTextPhase.run..out = null..count = 0..note = null..error = null;
    notifyListeners();
    await textDir.create(recursive: true);
    final base = baseName(name);
    String? wav;
    try {
      if (p.type == 'image') {
        final r = await ocrEngine.recognize(srcPath(name), p.ocrLanguages, workDir: textDir, isCanceled: () => token.canceled);
        if (token.canceled) throw CvConvertError('canceled');
        await File('${textDir.path}/$base.json').writeAsString(jsonEncode(r.toJson()), flush: true);
        await File('${textDir.path}/$base.txt').writeAsString(exportOcr(r, 'txt'), flush: true);
        t..status = CvStatus.done..progress = 1..out = '$base.json'..count = r.lines.length..note = r.lines.isEmpty ? 'no_text' : null;
      } else {
        final info = await _probe(srcPath(name));
        if (info.unreadable) throw CvConvertError('unreadable');
        if (!info.hasAudio) {
          await File('${textDir.path}/$base.json').writeAsString('[]', flush: true);
          t..status = CvStatus.done..progress = 1..out = '$base.json'..count = 0..note = 'no_audio';
        } else {
          final modelKey = mobileSpeechModel(p.speechModel);
          t.phase = CvTextPhase.download;
          notifyListeners();
          final modelPath = await models.ensure(modelKey, onProgress: (v) { t.progress = v; notifyListeners(); }, isCanceled: () => token.canceled);
          if (token.canceled) throw CvConvertError('canceled');
          t..phase = CvTextPhase.wav..progress = 0;
          notifyListeners();
          wav = '${textDir.path}/.~$base.wav';
          await _toWav(srcPath(name), wav, (sid) => token.onCancel(() => FFmpegKit.cancel(sid)));
          if (token.canceled) throw CvConvertError('canceled');
          t.phase = CvTextPhase.run;
          notifyListeners();
          token.onCancel(() => speechEngine.abort());
          final lang = p.speechLanguage == 'auto' ? '' : p.speechLanguage;
          final raw = await speechEngine.transcribe(wavPath: wav, modelPath: modelPath, language: p.speechLanguage, threads: (Platform.numberOfProcessors - 1).clamp(1, 4));
          if (token.canceled) throw CvConvertError('canceled');
          final segs = segmentsFromWhisper(raw, lang: lang);
          await File('${textDir.path}/$base.json').writeAsString(exportTranscript(segs, 'json'), flush: true);
          await File('${textDir.path}/$base.srt').writeAsString(exportTranscript(segs, 'srt'), flush: true);
          t..status = CvStatus.done..progress = 1..out = '$base.json'..count = segs.length..lang = lang..note = segs.isEmpty ? 'no_text' : null;
        }
      }
    } on CvConvertError catch (e) {
      if (e.code == 'canceled' || token.canceled) { t..status = CvStatus.canceled..progress = 0; } else { t..status = CvStatus.error..error = e.message.isEmpty ? e.code : '${e.code}:${e.message}'; }
    } catch (e) {
      t..status = token.canceled ? CvStatus.canceled : CvStatus.error..error = token.canceled ? null : (p.type == 'image' ? 'ocr_failed:$e' : 'whisper_failed:$e');
    } finally {
      t.phase = CvTextPhase.none;
      if (wav != null) { try { await File(wav).delete(); } catch (_) {} }
      _textActive.remove(name);
      await _persist();
      _pumpText();
    }
  }

  /// Kayıtlı konuşma metni (cümleler); yoksa boş.
  Future<List<CvSegment>> readSegments(String name) async {
    final p = textPath(name);
    if (p == null) return const [];
    try {
      final j = jsonDecode(await File(p).readAsString());
      return [for (final x in (j as List)) CvSegment.fromJson((x as Map).cast<String, dynamic>())];
    } catch (_) { return const []; }
  }

  /// Kayıtlı OCR sonucu; yoksa null.
  Future<CvOcrResult?> readOcr(String name) async {
    final p = textPath(name);
    if (p == null) return null;
    try { return CvOcrResult.fromJson((jsonDecode(await File(p).readAsString()) as Map).cast<String, dynamic>()); } catch (_) { return null; }
  }

  /// Metni istenen biçimde (srt/vtt/txt/csv/json) geçici dosyaya yazar, yolunu döner (paylaşım için); metin yoksa null.
  Future<String?> exportText(String name, String format) async {
    final p = project;
    if (p == null || textPath(name) == null) return null;
    final String content;
    if (p.type == 'image') {
      final r = await readOcr(name);
      if (r == null) return null;
      content = exportOcr(r, kOcrExportFormats.contains(format) ? format : 'txt');
    } else {
      content = exportTranscript(await readSegments(name), kTranscriptFormats.contains(format) ? format : 'srt');
    }
    final dir = Directory('${textDir.path}/.export');
    await dir.create(recursive: true);
    final f = File('${dir.path}/${baseName(name)}.$format');
    await f.writeAsString(content, flush: true);
    return f.path;
  }

  /// Tek dosya (yeniden) dönüştür.
  void convertOne(String name) {
    final j = jobs.putIfAbsent(name, CvJob.new);
    if (j.status == CvStatus.converting || j.status == CvStatus.queued) return;
    j..status = CvStatus.queued..progress = 0..error = null;
    _queue.add(name);
    running = true;
    notifyListeners();
    _pump();
  }

  /// Durdur: sıradakiler beklemeye döner, sürenler iptal edilir.
  void stop() {
    running = false;
    for (final n in _queue) { final j = jobs[n]; if (j != null && j.status == CvStatus.queued) j.status = CvStatus.pending; }
    _queue.clear();
    for (final n in _active.keys.toList()) { cancel(n); }
    for (final n in _textQueue) { final t = jobs[n]?.text; if (t != null && t.status == CvStatus.queued) t.status = CvStatus.pending; }
    _textQueue.clear();
    for (final n in _textActive.keys.toList()) { cancelText(n); }
    notifyListeners();
  }

  void cancel(String name) {
    final t = _active[name];
    if (t != null) { t.canceled = true; t.onCancel?.call(); }
    _queue.remove(name);
    final j = jobs[name];
    if (j != null && j.status == CvStatus.queued) j.status = CvStatus.pending;
  }

  void _pump() {
    final p = project;
    if (p == null) return;
    final limit = p.concurrency.clamp(1, kMobileMaxConcurrency);
    while (_active.length < limit && _queue.isNotEmpty) {
      final name = _queue.removeAt(0);
      unawaited(_run(p, name));
    }
    if (_active.isEmpty && _queue.isEmpty) running = false;
    notifyListeners();
  }

  Future<void> _run(CvProject p, String name) async {
    final j = jobs.putIfAbsent(name, CvJob.new);
    final token = CvCancelToken();
    _active[name] = token;
    j..status = CvStatus.converting..progress = 0..error = null;
    notifyListeners();
    await outDir.create(recursive: true);
    final ext = extOf(name);
    final base = ext.isEmpty ? name : name.substring(0, name.length - ext.length - 1);
    final outName = '$base.${p.targetExt}';
    final tmp = '${outDir.path}/.~$base.cvmtmp.${p.targetExt}';
    var lastTick = 0;
    try {
      final size = await _convert(p, srcPath(name), tmp, (v) {
        j.progress = v.clamp(0, 0.999);
        final now = DateTime.now().millisecondsSinceEpoch;
        if (now - lastTick > 150) { lastTick = now; notifyListeners(); }
      }, token);
      if (token.canceled) throw CvConvertError('canceled');
      final out = File('${outDir.path}/$outName');
      try { await out.delete(); } catch (_) {}
      await File(tmp).rename(out.path);
      j..status = CvStatus.done..progress = 1..out = outName..outSize = size..error = null;
    } on CvConvertError catch (e) {
      try { await File(tmp).delete(); } catch (_) {}
      if (e.code == 'canceled' || token.canceled) { j..status = CvStatus.canceled..progress = 0; } else { j..status = CvStatus.error..error = e.message.isEmpty ? e.code : '${e.code}:${e.message}'; }
    } catch (e) {
      try { await File(tmp).delete(); } catch (_) {}
      j..status = token.canceled ? CvStatus.canceled : CvStatus.error..error = token.canceled ? null : 'ffmpeg_failed:$e';
    } finally {
      _active.remove(name);
      await _persist();
      _pump();
    }
  }

  /// Kullanıcıya gösterilecek hata metni (kodlar sözlükten; ffmpeg mesajı olduğu gibi).
  static (String code, String msg) splitError(String? e) {
    if (e == null) return ('', '');
    final i = e.indexOf(':');
    return i < 0 ? (e, '') : (e.substring(0, i), e.substring(i + 1));
  }
}

// ---- Varsayılan dönüştürme: resim → image paketi (isolate); video/ses → FFmpegKit ---------------------------------------

Future<CvMediaInfo> cvProbe(String path) async {
  try {
    final s = await FFprobeKit.getMediaInformation(path);
    final mi = s.getMediaInformation();
    if (mi == null) return const CvMediaInfo(unreadable: true);
    var hasV = false, hasA = false;
    var w = 0, h = 0;
    for (final st in mi.getStreams()) {
      final t = st.getType();
      if (t == 'video') {
        // Kapak resmi (attached pic) video akışı sayılmaz
        final disp = st.getAllProperties()?['disposition'];
        if (disp is Map && disp['attached_pic'] == 1) continue;
        hasV = true;
        w = st.getWidth() ?? 0;
        h = st.getHeight() ?? 0;
      }
      if (t == 'audio') hasA = true;
    }
    final d = double.tryParse(mi.getDuration() ?? '') ?? 0;
    return CvMediaInfo(duration: d, hasVideo: hasV, hasAudio: hasA, unreadable: !hasV && !hasA, width: w, height: h);
  } catch (_) {
    return const CvMediaInfo(unreadable: true);
  }
}

Future<int> cvConvertDefault(CvProject p, String src, String out, void Function(double) onProgress, CvCancelToken token) async {
  final srcExt = extOf(src);
  if (p.type == 'image' && kDartImageRead.contains(srcExt) && kDartImageWrite.contains(p.targetExt)) {
    final bytes = await File(src).readAsBytes();
    onProgress(0.1);
    final outBytes = await convertImageInIsolate(CvImageJob(bytes: bytes, name: src, target: p.targetExt, options: (p.options['image'] as Map).cast<String, dynamic>()));
    if (token.canceled) throw CvConvertError('canceled');
    await File(out).writeAsBytes(outBytes, flush: true);
    return outBytes.length;
  }
  final info = p.type == 'image' ? const CvMediaInfo() : await cvProbe(src);
  if (token.canceled) throw CvConvertError('canceled');
  final cmd = buildCommand(src: src, out: out, type: p.type, target: p.targetExt, options: p.options, info: info, platform: Platform.isIOS ? 'ios' : 'android');
  final done = Completer<void>();
  final session = await FFmpegKit.executeWithArgumentsAsync(cmd, (s) async {
    final rc = await s.getReturnCode();
    if (ReturnCode.isSuccess(rc)) {
      done.complete();
    } else if (ReturnCode.isCancel(rc) || token.canceled) {
      done.completeError(CvConvertError('canceled'));
    } else {
      final logs = await s.getAllLogsAsString() ?? '';
      done.completeError(CvConvertError('ffmpeg_failed', lastFfmpegError(logs), logs.split('\n').reversed.take(20).toList().reversed.join('\n')));
    }
  }, null, (st) {
    if (info.duration > 0) onProgress(st.getTime() / 1000 / info.duration);
  });
  token.sessionId = session.getSessionId();
  token.onCancel = () => FFmpegKit.cancel(session.getSessionId());
  if (token.canceled) await FFmpegKit.cancel(session.getSessionId());
  await done.future;
  return File(out).length();
}

/// Projeye ait runner'lar (uygulama ömrünce; ekrandan çıkınca iş sürer).
class CvRunners {
  CvRunners._();
  static final _m = <String, CvRunner>{};
  static CvSpeechModels? _models;
  /// Paylaşılan konuşma modeli deposu (`<belgeler>/cv/models`).
  static Future<CvSpeechModels> models() async => _models ??= CvSpeechModels(Directory('${(await cvBaseDir()).path}/models'));
  static Future<CvRunner> of(String projectId, SyncEngine engine, {CvConvertFn? convert}) async {
    final r = _m[projectId];
    if (r != null) return r;
    return _m[projectId] = CvRunner(projectId: projectId, engine: engine, baseDir: await cvBaseDir(), convert: convert, models: await models());
  }
  static CvRunner? peek(String projectId) => _m[projectId];
  static Iterable<CvRunner> get all => _m.values;
  static void drop(String projectId) { _m.remove(projectId)?.dispose(); }
}
