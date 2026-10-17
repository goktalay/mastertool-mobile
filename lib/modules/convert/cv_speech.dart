// Konuşmadan metne — whisper.cpp 1.8.3 (whisper_ggml_plus, MIT; FFI, cihazda çevrimdışı, ses sunucuya gitmez). Masaüstü speech.js
// karşılığı. Motor arayüzü (CvSpeechEngine) enjekte edilebilir: testlerde native kütüphane yoktur.
//  • Girdi: FFmpegKit ile 16 kHz mono s16 WAV (cv_text_formats.dart wavArgs; media.js toWav ile aynı).
//  • Model: masaüstüyle aynı ggml dosyaları (formats.js SPEECH_MODELS) <belgeler>/cv/models altında; Hugging Face'ten ilk kullanımda
//    indirilir (.part ile kaldığı yerden devam), Ayarlar'da boyut / indir / sil. Mobilde tiny/base/small; medium/turbo → base.
//  • whisper_ggml_plus köprüsü ilerleme ve algılanan dili döndürmez: ilerleme belirsizdir, dil = projede seçilen dil ("auto" → boş).
//    "Her 30 sn'de dil algıla" bu yüzden mobilde kapalıdır. İptal: abort() (native bayrak; sonraki pencerede durur).
import 'dart:async';
import 'dart:io';

import 'package:ffmpeg_kit_flutter_new_full/ffmpeg_kit.dart';
import 'package:ffmpeg_kit_flutter_new_full/return_code.dart';
import 'package:http/http.dart' as http;
import 'package:whisper_ggml_plus/whisper_ggml_plus.dart' as wh;

import 'cv_ffmpeg_args.dart' show CvConvertError, lastFfmpegError;
import 'cv_text_formats.dart';

typedef CvRawSegment = ({int fromMs, int toMs, String text});

abstract class CvSpeechEngine {
  /// 16 kHz mono WAV'ı [modelPath] ile metne çevirir; ham cümleler (ms). [language] ISO-639-1 ya da 'auto'.
  /// Hata: CvConvertError('whisper_failed' | 'canceled').
  Future<List<CvRawSegment>> transcribe({required String wavPath, required String modelPath, required String language, int threads = 4});
  /// Süren işi durdurur (varsa).
  Future<void> abort();
  /// Yüklü modeli bellekten bırakır (kuyruk boşalınca).
  Future<void> release();
}

class CvWhisperEngine implements CvSpeechEngine {
  wh.Whisper? _w;

  @override
  Future<List<CvRawSegment>> transcribe({required String wavPath, required String modelPath, required String language, int threads = 4}) async {
    // Enum yalnız dosya adını üretmek için kullanılır; gerçek model yolu modelPath'tir.
    final w = _w ??= const wh.Whisper(model: wh.WhisperModel.base);
    try {
      final r = await w.transcribe(
        transcribeRequest: wh.TranscribeRequest(audio: wavPath, language: language, threads: threads, isNoTimestamps: false, vadMode: wh.WhisperVadMode.disabled),
        modelPath: modelPath,
      );
      return [for (final s in r.segments ?? const <wh.WhisperTranscribeSegment>[]) (fromMs: s.fromTs.inMilliseconds, toMs: s.toTs.inMilliseconds, text: s.text)];
    } catch (e) {
      final msg = '$e'.replaceFirst(RegExp(r'^Exception:\s*'), '');
      if (msg.contains('aborted')) throw CvConvertError('canceled');
      throw CvConvertError('whisper_failed', msg.length > 300 ? msg.substring(0, 300) : msg);
    }
  }

  @override
  Future<void> abort() async { try { await (_w ?? const wh.Whisper(model: wh.WhisperModel.base)).abort(); } catch (_) {} }

  @override
  Future<void> release() async { try { await _w?.dispose(); } catch (_) {} }
}

/// Konuşma modeli deposu: `<base>/models/ggml-*.bin` (masaüstü userData/models ile aynı adlar).
class CvSpeechModels {
  CvSpeechModels(this.dir, {http.Client? client, Map<String, Uri>? urls}) : _client = client, _urls = urls; // ignore: prefer_initializing_formals
  final Directory dir;
  final http.Client? _client;
  final Map<String, Uri>? _urls;

  /// Süren indirmeler: anahtar → ilerleme 0..1 (Ayarlar ve işler dinler).
  final Map<String, double> downloading = {};
  final _listeners = <void Function()>{};
  void addListener(void Function() f) => _listeners.add(f);
  void removeListener(void Function() f) => _listeners.remove(f);
  void _notify() { for (final f in _listeners.toList()) { f(); } }

  File file(String key) => File('${dir.path}/${(kSpeechModelInfo[key] ?? kSpeechModelInfo['base']!).file}');
  bool installed(String key) { final f = file(key); return f.existsSync() && f.lengthSync() > 0; }
  int size(String key) { try { return file(key).lengthSync(); } catch (_) { return 0; } }
  int get totalSize => kSpeechModelInfo.keys.fold(0, (a, k) => a + size(k));

  Future<void> delete(String key) async {
    final f = file(key);
    try { await f.delete(); } catch (_) {}
    try { await File('${f.path}.part').delete(); } catch (_) {}
    _notify();
  }

  final Map<String, Future<String>> _inflight = {};

  /// Model dosyasını hazırlar (yoksa indirir; aynı anda tek indirme); yolu döner. Hata: CvConvertError('download_failed', msg).
  Future<String> ensure(String key, {void Function(double)? onProgress, bool Function()? isCanceled}) {
    if (installed(key)) return Future.value(file(key).path);
    // Not: blok gövdesi şart — `() => _inflight.remove(key)` kaldırılan Future'ı döndürür, whenComplete onu (kendisini) beklerdi.
    return _inflight[key] ??= _download(key, onProgress: onProgress, isCanceled: isCanceled).whenComplete(() { _inflight.remove(key); });
  }

  Future<String> _download(String key, {void Function(double)? onProgress, bool Function()? isCanceled}) async {
    final info = kSpeechModelInfo[key] ?? kSpeechModelInfo['base']!;
    final dest = file(key);
    final part = File('${dest.path}.part');
    await dir.create(recursive: true);
    var have = 0;
    try { have = await part.length(); } catch (_) {}
    final client = _client ?? http.Client();
    downloading[key] = 0;
    _notify();
    try {
      final req = http.Request('GET', _urls?[key] ?? info.url);
      if (have > 0) req.headers['Range'] = 'bytes=$have-';
      final res = await client.send(req);
      if (res.statusCode == 416) { have = 0; try { await part.delete(); } catch (_) {} return await _download(key, onProgress: onProgress, isCanceled: isCanceled); }
      if (res.statusCode != 200 && res.statusCode != 206) throw CvConvertError('download_failed', 'HTTP ${res.statusCode}');
      if (res.statusCode != 206) have = 0;
      final total = (res.contentLength ?? 0) > 0 ? have + res.contentLength! : 0;
      final sink = part.openWrite(mode: have > 0 ? FileMode.append : FileMode.write);
      var got = have;
      var lastTick = 0;
      try {
        await for (final chunk in res.stream) {
          if (isCanceled?.call() == true) throw CvConvertError('canceled');
          sink.add(chunk);
          got += chunk.length;
          final now = DateTime.now().millisecondsSinceEpoch;
          if (total > 0 && now - lastTick > 200) {
            lastTick = now;
            downloading[key] = got / total;
            onProgress?.call(got / total);
            _notify();
          }
        }
      } finally {
        await sink.close();
      }
      if (total > 0 && got != total) throw CvConvertError('download_failed', 'incomplete');
      await part.rename(dest.path);
      onProgress?.call(1);
      return dest.path;
    } on CvConvertError {
      rethrow;
    } catch (e) {
      throw CvConvertError('download_failed', '$e');
    } finally {
      if (_client == null) client.close();
      downloading.remove(key);
      _notify();
    }
  }
}

/// Kaynağı 16 kHz mono WAV'a çevirir (FFmpegKit); iptal için oturum kimliği [onSession] ile verilir.
typedef CvWavFn = Future<void> Function(String src, String wav, void Function(int sessionId)? onSession);

Future<void> cvToWavDefault(String src, String wav, void Function(int sessionId)? onSession) async {
  final done = Completer<void>();
  final session = await FFmpegKit.executeWithArgumentsAsync(wavArgs(src, wav), (s) async {
    final rc = await s.getReturnCode();
    if (ReturnCode.isSuccess(rc)) {
      done.complete();
    } else if (ReturnCode.isCancel(rc)) {
      done.completeError(CvConvertError('canceled'));
    } else {
      done.completeError(CvConvertError('ffmpeg_failed', lastFfmpegError(await s.getAllLogsAsString() ?? '')));
    }
  });
  onSession?.call(session.getSessionId() ?? 0);
  await done.future;
}
