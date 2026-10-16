// Proje çalıştırıcı (masaüstü convertmaster/src/jobs.js ProjectRunner karşılığı, mobil):
//  • Kaynaklar dosya seçiciden kopyalanır: <belgeler>/cv/src/<projeId>/<ad>; çıktı: <belgeler>/cv/converted/<projeId>/<kök>.<hedef>.
//  • Durum (sources, outputs) kitaplık öğesinin yerel alanlarında tutulur (localOnly: blob'a girmez); ilerleme yalnız bellekte.
//  • Sıra: projenin "aynı anda" ayarı (mobilde en çok 2). Resim: saf Dart `image` (isolate); video/ses: FFmpegKit, ilerleme
//    Statistics.time / süre; iptal FFmpegKit.cancel(sessionId).
//  • Dönüştürme işlevi (CvConvertFn) enjekte edilebilir — testlerde FFmpegKit çağrılmaz.
import 'dart:async';
import 'dart:io';

import 'package:ffmpeg_kit_flutter_new/ffmpeg_kit.dart';
import 'package:ffmpeg_kit_flutter_new/ffprobe_kit.dart';
import 'package:ffmpeg_kit_flutter_new/return_code.dart';
import 'package:flutter/foundation.dart';
import 'package:path_provider/path_provider.dart';

import '../../core/sync.dart';
import 'cv_ffmpeg_args.dart';
import 'cv_formats.dart';
import 'cv_image.dart';
import 'cv_model.dart';

enum CvStatus { pending, queued, converting, done, error, canceled }

class CvSource {
  CvSource({required this.name, required this.size, required this.mtime});
  final String name;
  final int size, mtime;
  Map<String, dynamic> toJson() => {'name': name, 'size': size, 'mtime': mtime};
  factory CvSource.fromJson(Map<String, dynamic> j) => CvSource(name: (j['name'] ?? '').toString(), size: (j['size'] as num?)?.toInt() ?? 0, mtime: (j['mtime'] as num?)?.toInt() ?? 0);
}

class CvJob {
  CvJob({this.status = CvStatus.pending, this.progress = 0, this.out, this.outSize = 0, this.error});
  CvStatus status;
  double progress;
  String? out; // çıktı dosya adı (klasöre göre)
  int outSize;
  String? error; // hata kodu ya da ffmpeg mesajı
  Map<String, dynamic> toJson() => {'status': status.name, 'out': out, 'outSize': outSize, 'error': error};
  factory CvJob.fromJson(Map<String, dynamic> j) {
    final st = CvStatus.values.where((x) => x.name == j['status']).firstOrNull ?? CvStatus.pending;
    return CvJob(status: st == CvStatus.converting || st == CvStatus.queued ? CvStatus.pending : st, progress: st == CvStatus.done ? 1 : 0,
        out: j['out'] as String?, outSize: (j['outSize'] as num?)?.toInt() ?? 0, error: j['error'] as String?);
  }
}

class CvCancelToken {
  bool canceled = false;
  int? sessionId;
  void Function()? onCancel;
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
  CvRunner({required this.projectId, required this.engine, required this.baseDir, CvConvertFn? convert}) : _convert = convert ?? cvConvertDefault {
    _load();
  }
  final String projectId;
  final SyncEngine engine;
  final Directory baseDir;
  final CvConvertFn _convert;

  final List<CvSource> sources = [];
  final Map<String, CvJob> jobs = {};
  final Map<String, CvCancelToken> _active = {};
  final List<String> _queue = [];
  bool running = false;

  Directory get srcDir => Directory('${baseDir.path}/src/$projectId');
  Directory get outDir => Directory('${baseDir.path}/converted/$projectId');
  CvProject? get project { final it = engine.library.items[projectId]; return it == null ? null : CvProject(projectId, it.$2); }
  int get activeCount => _active.length;
  int get doneCount => jobs.values.where((j) => j.status == CvStatus.done).length;
  int get errorCount => jobs.values.where((j) => j.status == CvStatus.error).length;
  int get outTotal => jobs.values.fold(0, (a, j) => a + (j.status == CvStatus.done ? j.outSize : 0));
  double get overall => sources.isEmpty ? 0 : sources.fold(0.0, (a, s) => a + (jobs[s.name]?.status == CvStatus.done ? 1 : jobs[s.name]?.progress ?? 0)) / sources.length;
  String srcPath(String name) => '${srcDir.path}/$name';
  String? outPath(String name) { final o = jobs[name]?.out; return o == null ? null : '${outDir.path}/$o'; }

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
    sources.removeWhere((s) => s.name == name);
    await deleteOutput(name, persist: false);
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

  Future<void> clearOutputs() async {
    stop();
    try { await outDir.delete(recursive: true); } catch (_) {}
    for (final j in jobs.values) { j..status = CvStatus.pending..progress = 0..out = null..outSize = 0..error = null; }
    notifyListeners();
    await _persist();
  }

  /// Başlat: bitmemiş tüm dosyalar sıraya girer.
  void start() {
    running = true;
    for (final s in sources) {
      final j = jobs.putIfAbsent(s.name, CvJob.new);
      if (j.status == CvStatus.pending || j.status == CvStatus.error || j.status == CvStatus.canceled) { j.status = CvStatus.queued; j.error = null; _queue.add(s.name); }
    }
    notifyListeners();
    _pump();
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
  final cmd = buildCommand(src: src, out: out, type: p.type, target: p.targetExt, options: p.options, info: info);
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
  static Future<CvRunner> of(String projectId, SyncEngine engine, {CvConvertFn? convert}) async {
    final r = _m[projectId];
    if (r != null) return r;
    return _m[projectId] = CvRunner(projectId: projectId, engine: engine, baseDir: await cvBaseDir(), convert: convert);
  }
  static CvRunner? peek(String projectId) => _m[projectId];
  static Iterable<CvRunner> get all => _m.values;
  static void drop(String projectId) { _m.remove(projectId)?.dispose(); }
}
