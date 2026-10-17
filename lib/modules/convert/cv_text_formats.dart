// Konuşma / OCR metin biçimleri ve dil eşlemeleri — saf Dart (FFmpegKit, ML Kit, whisper'a bağımlı değil; birim testi:
// test/cv_text_formats_test.dart). Masaüstü karşılıkları: convertmaster/src/speech.js exportTranscript / fmtTime / segmentsOf,
// ocr.js exportOcr. Çıktılar masaüstüyle bayt bayt aynı (SRT "," / VTT "." ayraçlı zaman damgası, CSV UTF-8 BOM + ";" + CRLF).
//
// OCR dilleri: masaüstü Tesseract dil kodları (tur/eng/…) projede saklanır; mobilde ML Kit Text Recognition v2 betik (script)
// modelleriyle çalışır: Latin (Türkçe dahil), Çince, Devanagari, Japonca, Korece. Kiril (rus/ukr), Arapça (ara/fas), İbranice (heb)
// ve Yunanca (ell) için ML Kit'te model yoktur → bu diller mobilde okunamaz; formda işaretlenir, işte göz ardı edilir.
import 'dart:convert';

/// Konuşma metninin bir cümlesi (saniye; masaüstü {start, end, lang, text}).
class CvSegment {
  const CvSegment({required this.start, required this.end, required this.lang, required this.text});
  final double start, end;
  final String lang, text;
  Map<String, dynamic> toJson() => {'start': start, 'end': end, 'lang': lang, 'text': text};
  factory CvSegment.fromJson(Map<String, dynamic> j) => CvSegment(
      start: (j['start'] as num?)?.toDouble() ?? 0, end: (j['end'] as num?)?.toDouble() ?? 0, lang: (j['lang'] ?? '').toString(), text: (j['text'] ?? '').toString());
}

/// OCR satırı: metin, güven (%), sınır kutusu (piksel).
class CvOcrLine {
  const CvOcrLine({required this.text, required this.conf, required this.x0, required this.y0, required this.x1, required this.y1});
  final String text;
  final int conf, x0, y0, x1, y1;
  Map<String, dynamic> toJson() => {'text': text, 'conf': conf, 'bbox': {'x0': x0, 'y0': y0, 'x1': x1, 'y1': y1}};
  factory CvOcrLine.fromJson(Map<String, dynamic> j) {
    final b = (j['bbox'] as Map?)?.cast<String, dynamic>() ?? const {};
    int n(Object? v) => (v as num?)?.round() ?? 0;
    return CvOcrLine(text: (j['text'] ?? '').toString(), conf: n(j['conf']), x0: n(b['x0']), y0: n(b['y0']), x1: n(b['x1']), y1: n(b['y1']));
  }
}

/// OCR sonucu (masaüstü { languages, text, width, height, lines }).
class CvOcrResult {
  const CvOcrResult({required this.languages, required this.text, this.width = 0, this.height = 0, required this.lines});
  final List<String> languages;
  final String text;
  final int width, height;
  final List<CvOcrLine> lines;
  Map<String, dynamic> toJson() => {'languages': languages, 'text': text, 'width': width, 'height': height, 'lines': lines.map((l) => l.toJson()).toList()};
  factory CvOcrResult.fromJson(Map<String, dynamic> j) => CvOcrResult(
      languages: ((j['languages'] as List?) ?? const []).map((x) => x.toString()).toList(), text: (j['text'] ?? '').toString(),
      width: (j['width'] as num?)?.toInt() ?? 0, height: (j['height'] as num?)?.toInt() ?? 0,
      lines: ((j['lines'] as List?) ?? const []).map((x) => CvOcrLine.fromJson((x as Map).cast<String, dynamic>())).toList());
}

/// speech.js fmtTime: saniye → `HH:MM:SS<sep>mmm` (SRT "," · VTT ".").
String fmtTime(double sec, String sep) {
  final ms = (sec * 1000).round();
  String p2(int v) => v.toString().padLeft(2, '0');
  return '${p2(ms ~/ 3600000)}:${p2((ms ~/ 60000) % 60)}:${p2((ms ~/ 1000) % 60)}$sep${(ms % 1000).toString().padLeft(3, '0')}';
}

const kTranscriptFormats = ['srt', 'vtt', 'txt', 'csv', 'json'];
const kOcrExportFormats = ['txt', 'csv', 'json'];

String _csvQuote(String s) => '"${s.replaceAll('"', '""')}"';

/// speech.js exportTranscript — SRT, WebVTT, CSV (BOM, ';', CRLF), JSON (2 boşluk), TXT ([HH:MM:SS] (dil) metin).
String exportTranscript(List<CvSegment> segments, String format) {
  switch (format) {
    case 'srt':
      return [for (var i = 0; i < segments.length; i++) '${i + 1}\n${fmtTime(segments[i].start, ',')} --> ${fmtTime(segments[i].end, ',')}\n${segments[i].text}\n'].join('\n');
    case 'vtt':
      return 'WEBVTT\n\n${[for (final s in segments) '${fmtTime(s.start, '.')} --> ${fmtTime(s.end, '.')}\n${s.text}\n'].join('\n')}';
    case 'csv':
      return '﻿second;language;text\r\n${[for (final s in segments) '${s.start.toStringAsFixed(2)};${s.lang};${_csvQuote(s.text)}'].join('\r\n')}\r\n';
    case 'json':
      return const JsonEncoder.withIndent('  ').convert(segments.map((s) => s.toJson()).toList());
    default:
      return '${[for (final s in segments) '[${fmtTime(s.start, '.').substring(0, 8)}] (${s.lang}) ${s.text}'].join('\r\n')}\r\n';
  }
}

/// ocr.js exportOcr — TXT (satırlar, CRLF), CSV (line;confidence;text), JSON (koordinatlarla).
String exportOcr(CvOcrResult r, String format) {
  if (format == 'json') return const JsonEncoder.withIndent('  ').convert(r.toJson());
  if (format == 'csv') return '﻿line;confidence;text\r\n${[for (var i = 0; i < r.lines.length; i++) '${i + 1};${r.lines[i].conf};${_csvQuote(r.lines[i].text)}'].join('\r\n')}\r\n';
  return '${r.lines.map((l) => l.text).join('\r\n')}\r\n';
}

final _kBlank = RegExp(r'^\[(BLANK_AUDIO|MUSIC|NOISE|SILENCE)\]$', caseSensitive: false);
final _kParen = RegExp(r'^\((?:music|silence)\)$', caseSensitive: false);

/// speech.js segmentsOf: whisper ham cümleleri (ms) → CvSegment (saniye, 2 ondalık); sessizlik/müzik etiketleri atılır.
List<CvSegment> segmentsFromWhisper(Iterable<({int fromMs, int toMs, String text})> raw, {double offsetSec = 0, String lang = ''}) {
  final out = <CvSegment>[];
  for (final s in raw) {
    final text = s.text.trim();
    if (text.isEmpty || _kBlank.hasMatch(text) || _kParen.hasMatch(text)) continue;
    double r2(double v) => (v * 100).round() / 100;
    out.add(CvSegment(start: r2(offsetSec + s.fromMs / 1000), end: r2(offsetSec + s.toMs / 1000), lang: lang, text: text));
  }
  return out;
}

/// En çok cümlesi olan dil (perWindow modunda projenin "ana dili"; speech.js transcribe sonundaki sıralama).
String dominantLang(List<CvSegment> segments) {
  final n = <String, int>{};
  for (final s in segments) {
    if (s.lang.isNotEmpty) n[s.lang] = (n[s.lang] ?? 0) + 1;
  }
  if (n.isEmpty) return '';
  return n.entries.reduce((a, b) => b.value > a.value ? b : a).key;
}

// ---- OCR dil eşlemesi ---------------------------------------------------------------------------------------------------

/// ML Kit Text Recognition v2 betik modelleri (google_mlkit_text_recognition TextRecognitionScript ile aynı adlar).
enum CvOcrScript { latin, chinese, devanagari, japanese, korean }

/// Tesseract dil kodu → ML Kit betiği. Burada olmayan diller mobilde okunamaz (kOcrUnsupportedMobile).
const kOcrScriptOf = <String, CvOcrScript>{
  'tur': CvOcrScript.latin, 'eng': CvOcrScript.latin, 'deu': CvOcrScript.latin, 'fra': CvOcrScript.latin, 'spa': CvOcrScript.latin,
  'ita': CvOcrScript.latin, 'por': CvOcrScript.latin, 'nld': CvOcrScript.latin, 'aze': CvOcrScript.latin, 'pol': CvOcrScript.latin,
  'chi_sim': CvOcrScript.chinese, 'chi_tra': CvOcrScript.chinese, 'jpn': CvOcrScript.japanese, 'kor': CvOcrScript.korean, 'hin': CvOcrScript.devanagari,
};

/// ML Kit'te modeli olmayan masaüstü OCR dilleri: Kiril (Rusça, Ukraynaca), Arap (Arapça, Farsça), İbranice, Yunanca.
const kOcrUnsupportedMobile = {'rus', 'ukr', 'ara', 'fas', 'heb', 'ell'};

/// Proje dillerinden çalıştırılacak betikler (sıra korunur, yinelenmez); hiç eşleşme yoksa Latin.
List<CvOcrScript> ocrScriptsFor(Iterable<String> langs) {
  final out = <CvOcrScript>[];
  for (final l in langs) {
    final s = kOcrScriptOf[l];
    if (s != null && !out.contains(s)) out.add(s);
  }
  return out.isEmpty ? [CvOcrScript.latin] : out;
}

/// Projedeki dillerden mobilde okunamayanlar (formda ve iş notunda gösterilir).
List<String> ocrUnsupportedIn(Iterable<String> langs) => langs.where(kOcrUnsupportedMobile.contains).toList();

/// Birden çok betik aynı resimde çalıştırılınca Latin satırlar ikinci modelden de gelir: aynı metin ve örtüşen kutu → tek satır.
/// Satırlar yukarıdan aşağı (y0), sonra soldan sağa sıralanır.
List<CvOcrLine> mergeOcrLines(Iterable<CvOcrLine> lines) {
  final out = <CvOcrLine>[];
  for (final l in lines) {
    final dup = out.any((o) => o.text == l.text && _overlap(o, l) > 0.5);
    if (!dup) out.add(l);
  }
  out.sort((a, b) {
    final dy = a.y0 - b.y0;
    if (dy.abs() > ((a.y1 - a.y0).abs() + (b.y1 - b.y0).abs()) / 4) return dy;
    return a.x0 - b.x0;
  });
  return out;
}

double _overlap(CvOcrLine a, CvOcrLine b) {
  final ix = (a.x1 < b.x1 ? a.x1 : b.x1) - (a.x0 > b.x0 ? a.x0 : b.x0);
  final iy = (a.y1 < b.y1 ? a.y1 : b.y1) - (a.y0 > b.y0 ? a.y0 : b.y0);
  if (ix <= 0 || iy <= 0) return 0;
  final inter = ix * iy;
  final ua = (a.x1 - a.x0) * (a.y1 - a.y0), ub = (b.x1 - b.x0) * (b.y1 - b.y0);
  final smaller = ua < ub ? ua : ub;
  return smaller <= 0 ? 0 : inter / smaller;
}

// ---- Konuşma: WAV dönüşümü ve model tablosu ---------------------------------------------------------------------------------

/// speech.js: whisper 16 kHz mono s16 WAV ister (media.js toWav: `-vn -ac 1 -ar 16000 -c:a pcm_s16le`).
List<String> wavArgs(String src, String out) => ['-hide_banner', '-nostdin', '-y', '-i', src, '-vn', '-ac', '1', '-ar', '16000', '-c:a', 'pcm_s16le', out];

/// Masaüstü formats.js SPEECH_MODELS: dosya adı + yaklaşık MB. Mobilde medium/turbo kapalı (bellek, süre).
class CvSpeechModel {
  const CvSpeechModel(this.key, this.file, this.mb);
  final String key, file;
  final int mb;
  Uri get url => Uri.parse('https://huggingface.co/ggerganov/whisper.cpp/resolve/main/$file');
}

const kSpeechModelInfo = <String, CvSpeechModel>{
  'tiny': CvSpeechModel('tiny', 'ggml-tiny.bin', 75),
  'base': CvSpeechModel('base', 'ggml-base.bin', 142),
  'small': CvSpeechModel('small', 'ggml-small.bin', 466),
  'medium': CvSpeechModel('medium', 'ggml-medium-q5_0.bin', 514),
  'turbo': CvSpeechModel('turbo', 'ggml-large-v3-turbo-q5_0.bin', 547),
};

/// Mobilde seçilebilen modeller (tiny/base/small); medium/turbo formda görünür ama seçilemez, projede gelirse base'e düşer.
const kMobileSpeechModels = ['tiny', 'base', 'small'];
String mobileSpeechModel(String m) => kMobileSpeechModels.contains(m) ? m : 'base';

/// Pencere bazlı dil algılama (perWindow) için 30 sn'lik dilimler: [start, len] saniye (speech.js WINDOW_SEC).
const kSpeechWindowSec = 30;
List<(double, double)> speechWindows(double duration) {
  if (duration <= kSpeechWindowSec * 1.5) return [(0, duration)];
  final n = (duration / kSpeechWindowSec).ceil();
  return [for (var i = 0; i < n; i++) (i * kSpeechWindowSec.toDouble(), (duration - i * kSpeechWindowSec).clamp(0, kSpeechWindowSec).toDouble())];
}
