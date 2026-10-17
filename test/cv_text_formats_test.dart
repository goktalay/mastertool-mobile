// Convert Master konuşma / OCR metin biçimleri — masaüstü speech.js exportTranscript/fmtTime/segmentsOf ve ocr.js exportOcr ile
// aynı çıktılar; OCR dil → ML Kit betik eşlemesi; whisper WAV dönüşümü argümanları; model tablosu.
import 'package:flutter_test/flutter_test.dart';
import 'package:master_tool/modules/convert/cv_text_formats.dart';

void main() {
  const segs = [
    CvSegment(start: 0, end: 2.5, lang: 'tr', text: 'Merhaba dünya'),
    CvSegment(start: 61.004, end: 3661.999, lang: 'en', text: 'He said "hi"; then left'),
  ];

  test('fmtTime: SRT virgül, VTT nokta; saat/dakika/saniye/ms sıfır dolgulu; yuvarlama', () {
    expect(fmtTime(0, ','), '00:00:00,000');
    expect(fmtTime(2.5, ','), '00:00:02,500');
    expect(fmtTime(61.004, '.'), '00:01:01.004');
    expect(fmtTime(3661.999, '.'), '01:01:01.999');
    expect(fmtTime(0.9996, ','), '00:00:01,000'); // ms yuvarlanır
  });

  test('SRT: sıra no, zaman aralığı, metin, boş satır (speech.js ile aynı)', () {
    expect(exportTranscript(segs, 'srt'), '1\n00:00:00,000 --> 00:00:02,500\nMerhaba dünya\n\n2\n00:01:01,004 --> 01:01:01,999\nHe said "hi"; then left\n');
  });

  test('VTT: WEBVTT başlığı, nokta ayraçlı zaman, sıra no yok', () {
    expect(exportTranscript(segs, 'vtt'), 'WEBVTT\n\n00:00:00.000 --> 00:00:02.500\nMerhaba dünya\n\n00:01:01.004 --> 01:01:01.999\nHe said "hi"; then left\n');
  });

  test('TXT: [HH:MM:SS] (dil) metin, CRLF', () {
    expect(exportTranscript(segs, 'txt'), '[00:00:00] (tr) Merhaba dünya\r\n[00:01:01] (en) He said "hi"; then left\r\n');
  });

  test('CSV: UTF-8 BOM, ; ayraç, çift tırnak kaçışı, CRLF; 2 ondalık saniye', () {
    expect(exportTranscript(segs, 'csv'), '﻿second;language;text\r\n0.00;tr;"Merhaba dünya"\r\n61.00;en;"He said ""hi""; then left"\r\n');
  });

  test('JSON: 2 boşluk girintili {start,end,lang,text}; geri okunur', () {
    final j = exportTranscript(segs, 'json');
    expect(j, startsWith('[\n  {\n    "start": 0.0,'));
    expect(j, contains('"text": "He said \\"hi\\"; then left"'));
    final back = CvSegment.fromJson({'start': 1, 'end': 2, 'lang': 'tr', 'text': 'x'});
    expect((back.start, back.end, back.lang, back.text), (1.0, 2.0, 'tr', 'x'));
  });

  test('boş liste: SRT/VTT/TXT/CSV başlıkları', () {
    expect(exportTranscript(const [], 'srt'), '');
    expect(exportTranscript(const [], 'vtt'), 'WEBVTT\n\n');
    expect(exportTranscript(const [], 'txt'), '\r\n');
    expect(exportTranscript(const [], 'csv'), '﻿second;language;text\r\n\r\n');
    expect(exportTranscript(const [], 'json'), '[]');
  });

  test('segmentsFromWhisper: ms → sn (2 ondalık), ofset, [BLANK_AUDIO]/(music)/boş atılır, kırpılır', () {
    final out = segmentsFromWhisper([
      (fromMs: 0, toMs: 1234, text: '  Merhaba '),
      (fromMs: 1234, toMs: 2000, text: '[BLANK_AUDIO]'),
      (fromMs: 2000, toMs: 2500, text: '(music)'),
      (fromMs: 2500, toMs: 2600, text: '   '),
      (fromMs: 2600, toMs: 3999, text: 'Dünya'),
    ], offsetSec: 30, lang: 'tr');
    expect(out.length, 2);
    expect((out[0].start, out[0].end, out[0].text, out[0].lang), (30.0, 31.23, 'Merhaba', 'tr'));
    expect((out[1].start, out[1].end), (32.6, 34.0));
    expect(dominantLang([...out, const CvSegment(start: 0, end: 1, lang: 'en', text: 'a')]), 'tr');
    expect(dominantLang(const []), '');
  });

  test('OCR dışa aktarım: TXT satırlar CRLF; CSV line;confidence;text; JSON koordinatlı ve geri okunur', () {
    const r = CvOcrResult(languages: ['tur', 'eng'], text: 'Fatura\nToplam: 12,50 "TL"', width: 800, height: 600, lines: [
      CvOcrLine(text: 'Fatura', conf: 96, x0: 10, y0: 10, x1: 120, y1: 40),
      CvOcrLine(text: 'Toplam: 12,50 "TL"', conf: 88, x0: 10, y0: 60, x1: 300, y1: 90),
    ]);
    expect(exportOcr(r, 'txt'), 'Fatura\r\nToplam: 12,50 "TL"\r\n');
    expect(exportOcr(r, 'csv'), '﻿line;confidence;text\r\n1;96;"Fatura"\r\n2;88;"Toplam: 12,50 ""TL"""\r\n');
    final j = exportOcr(r, 'json');
    expect(j, contains('"bbox": {\n        "x0": 10,'));
    final back = CvOcrResult.fromJson({'languages': ['tur'], 'text': 'a', 'width': 1, 'height': 2, 'lines': [{'text': 'a', 'conf': 50, 'bbox': {'x0': 1, 'y0': 2, 'x1': 3, 'y1': 4}}]});
    expect(back.lines.single.x1, 3);
    expect(back.width, 1);
  });

  test('OCR dil eşlemesi: Latin (tur/eng/deu/…/aze/pol), Çince (chi_sim/chi_tra), jpn, kor, hin; Kiril/Arap/İbrani/Yunan yok', () {
    expect(ocrScriptsFor(['tur', 'eng']), [CvOcrScript.latin]);
    expect(ocrScriptsFor(['tur', 'chi_sim', 'chi_tra', 'jpn']), [CvOcrScript.latin, CvOcrScript.chinese, CvOcrScript.japanese]);
    expect(ocrScriptsFor(['kor', 'hin']), [CvOcrScript.korean, CvOcrScript.devanagari]);
    expect(ocrScriptsFor(['rus', 'ara']), [CvOcrScript.latin]); // eşleşme yok → Latin
    expect(ocrScriptsFor(const []), [CvOcrScript.latin]);
    expect(ocrUnsupportedIn(['tur', 'rus', 'ukr', 'ara', 'fas', 'heb', 'ell', 'eng']), ['rus', 'ukr', 'ara', 'fas', 'heb', 'ell']);
    for (final l in ['tur', 'eng', 'deu', 'fra', 'spa', 'ita', 'por', 'nld', 'aze', 'pol']) {
      expect(kOcrScriptOf[l], CvOcrScript.latin, reason: l);
    }
    for (final l in kOcrUnsupportedMobile) {
      expect(kOcrScriptOf.containsKey(l), isFalse, reason: l);
    }
  });

  test('mergeOcrLines: aynı metin + örtüşen kutu tekleşir; yukarıdan aşağı, soldan sağa sıralanır', () {
    final merged = mergeOcrLines([
      const CvOcrLine(text: 'B', conf: 90, x0: 0, y0: 100, x1: 50, y1: 120),
      const CvOcrLine(text: 'A', conf: 90, x0: 0, y0: 0, x1: 50, y1: 20),
      const CvOcrLine(text: 'A', conf: 80, x0: 2, y0: 1, x1: 52, y1: 21), // ikinci betikten aynı satır
      const CvOcrLine(text: 'A2', conf: 80, x0: 200, y0: 2, x1: 250, y1: 22), // aynı satırda sağda
      const CvOcrLine(text: 'A', conf: 80, x0: 400, y0: 0, x1: 450, y1: 20), // aynı metin, örtüşmüyor → kalır
    ]);
    expect(merged.map((l) => l.text).toList(), ['A', 'A2', 'A', 'B']);
    expect(merged.first.conf, 90);
  });

  test('wavArgs: whisper girdisi 16 kHz mono pcm_s16le, video akışı atılır (media.js toWav)', () {
    expect(wavArgs('/in/a.mp4', '/out/a.wav'), ['-hide_banner', '-nostdin', '-y', '-i', '/in/a.mp4', '-vn', '-ac', '1', '-ar', '16000', '-c:a', 'pcm_s16le', '/out/a.wav']);
  });

  test('model tablosu masaüstüyle aynı; mobilde tiny/base/small, diğerleri base\'e düşer', () {
    expect(kSpeechModelInfo['tiny']!.file, 'ggml-tiny.bin');
    expect(kSpeechModelInfo['medium']!.file, 'ggml-medium-q5_0.bin');
    expect(kSpeechModelInfo['turbo']!.file, 'ggml-large-v3-turbo-q5_0.bin');
    expect(kSpeechModelInfo['small']!.url.toString(), 'https://huggingface.co/ggerganov/whisper.cpp/resolve/main/ggml-small.bin');
    expect(mobileSpeechModel('small'), 'small');
    expect(mobileSpeechModel('medium'), 'base');
    expect(mobileSpeechModel('turbo'), 'base');
    expect(mobileSpeechModel('x'), 'base');
  });

  test('speechWindows: kısa dosya tek pencere; uzun dosya 30 sn dilimler, son dilim kalan', () {
    expect(speechWindows(40), [(0.0, 40.0)]);
    expect(speechWindows(70), [(0.0, 30.0), (30.0, 30.0), (60.0, 10.0)]);
  });
}
