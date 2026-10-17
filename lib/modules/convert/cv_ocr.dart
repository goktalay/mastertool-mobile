// Resimden metin (OCR) — Google ML Kit Text Recognition v2 (google_mlkit_text_recognition, MIT; cihazda çalışır, resim sunucuya
// gitmez). Masaüstü ocr.js (tesseract.js) karşılığı. Motor arayüzü (CvOcrEngine) enjekte edilebilir: testlerde ML Kit yoktur.
//  • Betik modelleri: Latin (Türkçe dahil) · Çince · Devanagari · Japonca · Korece; proje dilleri (Tesseract kodları) betiğe eşlenir
//    (cv_text_formats.dart kOcrScriptOf). Birden çok betik → her biri ayrı çalıştırılır, satırlar birleştirilir (yinelenenler atılır).
//  • Android'de Latin modeli uygulamayla gelir (text-recognition), diğer betikler build.gradle'daki bağımlılıklarla; iOS'ta Podfile'daki
//    GoogleMLKit/TextRecognition* podlarıyla. ML Kit "unbundled" sürümü kullanılmaz; model indirme için Play hizmeti gerekmez.
//  • ML Kit TIFF/TGA/ICO/PSD okuyamaz → `image` paketiyle geçici PNG'ye çevrilir (isolate). Güven (%) yalnız Android'de gelir.
import 'dart:io';
import 'dart:typed_data';

import 'package:flutter/foundation.dart' show compute;
import 'package:google_mlkit_text_recognition/google_mlkit_text_recognition.dart' as ml;
import 'package:image/image.dart' as img;

import 'cv_ffmpeg_args.dart' show CvConvertError;
import 'cv_formats.dart';
import 'cv_text_formats.dart';

abstract class CvOcrEngine {
  /// [path] resmi okur; [langs] masaüstü Tesseract dil kodları. [workDir] geçici dosyalar için. Hata: CvConvertError('ocr_failed', msg).
  Future<CvOcrResult> recognize(String path, List<String> langs, {required Directory workDir, bool Function()? isCanceled});
}

/// ML Kit'in doğrudan açabildiği biçimler (Android BitmapFactory / iOS UIImage ortak kümesi).
const kMlKitNativeExts = {'jpg', 'jpeg', 'png', 'gif', 'bmp', 'webp'};

/// `image` paketiyle PNG'ye çevirir; (bayt, en, boy). Çok kareli resimlerde ilk kare.
({Uint8List bytes, int width, int height}) ocrToPng(({Uint8List bytes, String name}) j) {
  var im = img.decodeNamedImage(j.name, j.bytes) ?? img.decodeImage(j.bytes);
  if (im == null) throw CvConvertError('unreadable');
  if (im.numFrames > 1) im = im.frames.first;
  im = img.bakeOrientation(im);
  return (bytes: img.encodePng(im), width: im.width, height: im.height);
}

/// Yalnız boyut (tam kod çözme yok); okunamazsa (0, 0).
(int, int) imageSize(Uint8List bytes) {
  try {
    final d = img.findDecoderForData(bytes);
    final info = d?.startDecode(bytes);
    return (info?.width ?? 0, info?.height ?? 0);
  } catch (_) {
    return (0, 0);
  }
}

class CvMlKitOcr implements CvOcrEngine {
  static ml.TextRecognitionScript _script(CvOcrScript s) => switch (s) {
        CvOcrScript.latin => ml.TextRecognitionScript.latin,
        CvOcrScript.chinese => ml.TextRecognitionScript.chinese,
        CvOcrScript.devanagari => ml.TextRecognitionScript.devanagiri,
        CvOcrScript.japanese => ml.TextRecognitionScript.japanese,
        CvOcrScript.korean => ml.TextRecognitionScript.korean,
      };

  @override
  Future<CvOcrResult> recognize(String path, List<String> langs, {required Directory workDir, bool Function()? isCanceled}) async {
    final scripts = ocrScriptsFor(langs);
    final usable = langs.where(kOcrScriptOf.containsKey).toList();
    var src = path;
    int w = 0, h = 0;
    String? tmp;
    try {
      final bytes = await File(path).readAsBytes();
      if (!kMlKitNativeExts.contains(extOf(path))) {
        final png = await compute(ocrToPng, (bytes: bytes, name: path));
        await workDir.create(recursive: true);
        tmp = '${workDir.path}/.~ocr-${DateTime.now().microsecondsSinceEpoch}.png';
        await File(tmp).writeAsBytes(png.bytes, flush: true);
        src = tmp;
        w = png.width;
        h = png.height;
      } else {
        (w, h) = imageSize(bytes);
      }
      if (isCanceled?.call() == true) throw CvConvertError('canceled');
      final all = <CvOcrLine>[];
      final texts = <String>[];
      for (final s in scripts) {
        final rec = ml.TextRecognizer(script: _script(s));
        try {
          final r = await rec.processImage(ml.InputImage.fromFilePath(src));
          texts.add(r.text.trim());
          for (final b in r.blocks) {
            for (final l in b.lines) {
              final t = l.text.trim();
              if (t.isEmpty) continue;
              final bb = l.boundingBox;
              all.add(CvOcrLine(text: t, conf: ((l.confidence ?? 0) * 100).round(), x0: bb.left.round(), y0: bb.top.round(), x1: bb.right.round(), y1: bb.bottom.round()));
            }
          }
        } finally {
          await rec.close();
        }
        if (isCanceled?.call() == true) throw CvConvertError('canceled');
      }
      final lines = mergeOcrLines(all);
      final text = scripts.length == 1 ? texts.first : lines.map((l) => l.text).join('\n');
      return CvOcrResult(languages: usable.isEmpty ? const ['eng'] : usable, text: text, width: w, height: h, lines: lines);
    } on CvConvertError {
      rethrow;
    } catch (e) {
      throw CvConvertError('ocr_failed', '$e'.replaceFirst(RegExp(r'^\w+Exception[^:]*:\s*'), ''));
    } finally {
      if (tmp != null) { try { await File(tmp).delete(); } catch (_) {} }
    }
  }
}
