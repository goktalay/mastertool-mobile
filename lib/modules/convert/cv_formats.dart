// Convert Master biçim listeleri ve varsayılanlar — masaüstü convertmaster/src/formats.js ile birebir
// (TYPES source/target/defaultSource/defaultTarget/color, QUALITY, RESOLUTIONS, FPS, AUDIO_BITRATES, SAMPLE_RATES,
// defaultOptions, defaultSpeech, defaultOcr) ve main.js cleanOptions / project:save doğrulaması.
// Mobilde desteklenmeyen uzantılar (kMobileUnsupportedSource / kMobileUnsupportedTarget) formda işaretsiz gösterilir.

class CvType {
  const CvType({required this.key, required this.color, required this.source, required this.target, required this.defaultSource, required this.defaultTarget, this.audioOnlyTargets = const []});
  final String key, color, defaultTarget;
  final List<String> source, target, defaultSource, audioOnlyTargets;
}

const kCvTypes = <String, CvType>{
  'video': CvType(
    key: 'video', color: '#a855f7',
    source: ['mp4', 'mkv', 'avi', 'mov', 'wmv', 'webm', 'flv', 'm4v', 'mpg', 'mpeg', 'ts', 'mts', 'm2ts', '3gp', 'ogv', 'vob'],
    target: ['mp4', 'mkv', 'webm', 'avi', 'mov', 'wmv', 'flv', 'm4v', 'mpg', '3gp', 'ogv', 'gif', 'mp3', 'm4a', 'wav', 'flac', 'ogg', 'opus'],
    audioOnlyTargets: ['mp3', 'm4a', 'wav', 'flac', 'ogg', 'opus'],
    defaultSource: ['mkv', 'avi', 'mov', 'wmv'], defaultTarget: 'mp4',
  ),
  'image': CvType(
    key: 'image', color: '#34d399',
    source: ['jpg', 'jpeg', 'png', 'webp', 'avif', 'gif', 'bmp', 'tif', 'tiff', 'ico', 'svg', 'tga'],
    target: ['jpg', 'png', 'webp', 'avif', 'gif', 'bmp', 'tiff', 'ico'],
    defaultSource: ['png', 'bmp', 'tif', 'tiff'], defaultTarget: 'jpg',
  ),
  'audio': CvType(
    key: 'audio', color: '#f97316',
    source: ['mp3', 'wav', 'flac', 'aac', 'm4a', 'ogg', 'oga', 'opus', 'wma', 'aiff', 'aif', 'amr', 'ac3', 'mka', 'ape', 'wv'],
    target: ['mp3', 'wav', 'flac', 'aac', 'm4a', 'ogg', 'opus', 'wma', 'aiff', 'ac3'],
    defaultSource: ['wav', 'flac', 'wma', 'm4a'], defaultTarget: 'mp3',
  ),
};

/// Mobilde (FFmpegKit full-gpl + saf Dart `image`) güvenle desteklenmeyen uzantılar: SVG (librsvg yok) ve AVIF (libaom kodlama
/// mobilde çok yavaş / kararsız). Formda görünür ama seçilemez.
const kMobileUnsupportedSource = {'image': {'svg', 'avif'}, 'video': <String>{}, 'audio': <String>{}};
const kMobileUnsupportedTarget = {'image': {'avif'}, 'video': <String>{}, 'audio': <String>{}};

const kSpeechModels = ['tiny', 'base', 'small', 'medium', 'turbo'];
const kSpeechLangs = ['auto', 'tr', 'en', 'de', 'fr', 'es', 'it', 'pt', 'nl', 'ru', 'uk', 'ar', 'fa', 'az', 'el', 'bg', 'ro', 'pl', 'cs', 'hu',
  'sv', 'no', 'da', 'fi', 'zh', 'ja', 'ko', 'hi', 'ur', 'id', 'ms', 'th', 'vi', 'he'];
const kOcrLangs = ['tur', 'eng', 'deu', 'fra', 'spa', 'ita', 'por', 'nld', 'rus', 'ukr', 'ara', 'fas', 'heb', 'aze', 'ell', 'pol',
  'chi_sim', 'chi_tra', 'jpn', 'kor', 'hin'];

const kQuality = ['high', 'medium', 'low'];
const kResolutions = ['source', '2160', '1440', '1080', '720', '480', '360'];
const kFps = ['source', '60', '50', '30', '25', '24', '15'];
const kAudioBitrates = ['64', '96', '128', '160', '192', '256', '320'];
const kSampleRates = ['source', '48000', '44100', '32000', '22050', '16000'];
const kCodecs = ['h264', 'h265'];
const kSpeeds = ['veryfast', 'fast', 'medium', 'slow'];
const kChannels = ['source', 'stereo', 'mono'];

/// Mobilde aynı anda çevrilecek dosya üst sınırı (masaüstü 32).
const kMobileMaxConcurrency = 2;

String extOf(String p) {
  final m = RegExp(r'\.([^./\\]+)$').firstMatch(p);
  return m == null ? '' : m.group(1)!.toLowerCase();
}

String? typeOfExt(String ext) {
  for (final e in kCvTypes.entries) {
    if (e.value.source.contains(ext)) return e.key;
  }
  return null;
}

Map<String, dynamic> defaultOptions() => {
      'video': {'quality': 'medium', 'resolution': 'source', 'fps': 'source', 'codec': 'h264', 'speed': 'medium', 'audioBitrate': '192', 'noAudio': false},
      'image': {'quality': 85, 'maxWidth': 0, 'maxHeight': 0, 'keepMeta': false},
      'audio': {'bitrate': '192', 'sampleRate': 'source', 'channels': 'source'},
    };

Map<String, dynamic> defaultSpeech() => {'enabled': false, 'model': 'base', 'language': 'auto', 'perWindow': false};
Map<String, dynamic> defaultOcr() => {'enabled': false, 'languages': ['tur', 'eng']};

int _num(Object? v, int def, int min, int max) {
  final n = v is num ? v.toDouble() : double.tryParse(v?.toString() ?? '');
  if (n == null || !n.isFinite) return def;
  return n.round().clamp(min, max);
}

T _oneOf<T>(T? v, List<T> list, T def) => v != null && list.contains(v) ? v : def;

/// main.js cleanOptions: bilinmeyen / bozuk değerler varsayılana çekilir.
Map<String, dynamic> cleanOptions(Map<String, dynamic>? o) {
  final d = defaultOptions();
  final v = (o?['video'] as Map?)?.cast<String, dynamic>() ?? const {};
  final i = (o?['image'] as Map?)?.cast<String, dynamic>() ?? const {};
  final a = (o?['audio'] as Map?)?.cast<String, dynamic>() ?? const {};
  final dv = d['video'] as Map<String, dynamic>, di = d['image'] as Map<String, dynamic>, da = d['audio'] as Map<String, dynamic>;
  return {
    'video': {
      'quality': _oneOf(v['quality']?.toString(), kQuality, dv['quality'] as String),
      'resolution': _oneOf(v['resolution']?.toString(), kResolutions, dv['resolution'] as String),
      'fps': _oneOf(v['fps']?.toString(), kFps, dv['fps'] as String),
      'codec': _oneOf(v['codec']?.toString(), kCodecs, dv['codec'] as String),
      'speed': _oneOf(v['speed']?.toString(), kSpeeds, dv['speed'] as String),
      'audioBitrate': _oneOf(v['audioBitrate']?.toString(), kAudioBitrates, dv['audioBitrate'] as String),
      'noAudio': v['noAudio'] == true,
    },
    'image': {
      'quality': _num(i['quality'], di['quality'] as int, 1, 100),
      'maxWidth': _num(i['maxWidth'], 0, 0, 20000),
      'maxHeight': _num(i['maxHeight'], 0, 0, 20000),
      'keepMeta': i['keepMeta'] == true,
    },
    'audio': {
      'bitrate': _oneOf(a['bitrate']?.toString(), kAudioBitrates, da['bitrate'] as String),
      'sampleRate': _oneOf(a['sampleRate']?.toString(), kSampleRates, da['sampleRate'] as String),
      'channels': _oneOf(a['channels']?.toString(), kChannels, da['channels'] as String),
    },
  };
}

/// main.js project:save: formdan gelen proje verisini masaüstü sözleşmesine göre temizler (id/yerel alanlar hariç).
Map<String, dynamic> cleanProject(Map<String, dynamic> form, {int defaultConcurrency = 2, String speechModel = 'base', List<String> ocrLanguages = const ['tur', 'eng'], String untitled = 'Adsız proje'}) {
  final type = _oneOf(form['type']?.toString(), kCvTypes.keys.toList(), 'video');
  final t = kCvTypes[type]!;
  final srcIn = ((form['sourceExts'] as List?) ?? const []).map((x) => x.toString()).where(t.source.contains).toSet().toList();
  final sp = (form['speech'] as Map?)?.cast<String, dynamic>() ?? const {};
  final oc = (form['ocr'] as Map?)?.cast<String, dynamic>() ?? const {};
  final ocrL = ((oc['languages'] as List?) ?? const []).map((x) => x.toString()).where(kOcrLangs.contains).toSet().take(6).toList();
  final name = (form['name'] ?? '').toString().trim();
  return {
    'createdAt': (form['createdAt'] as num?)?.toInt() ?? DateTime.now().millisecondsSinceEpoch,
    'name': name.isEmpty ? untitled : (name.length > 120 ? name.substring(0, 120) : name),
    'type': type,
    'sourceExts': srcIn.isEmpty ? [...t.defaultSource] : srcIn,
    'targetExt': _oneOf(form['targetExt']?.toString(), t.target, t.defaultTarget),
    'sourceMode': form['sourceMode'] == 'file' ? 'file' : 'folder',
    'includeSubfolders': form['includeSubfolders'] != false,
    'concurrency': _num(form['concurrency'], defaultConcurrency, 1, 32),
    'speech': {
      'enabled': (type == 'video' || type == 'audio') && sp['enabled'] == true,
      'model': _oneOf(sp['model']?.toString(), kSpeechModels, speechModel),
      'language': _oneOf(sp['language']?.toString(), kSpeechLangs, 'auto'),
      'perWindow': sp['perWindow'] == true,
    },
    'ocr': {'enabled': type == 'image' && oc['enabled'] == true, 'languages': ocrL.isEmpty ? [...ocrLanguages] : ocrL},
    'options': cleanOptions((form['options'] as Map?)?.cast<String, dynamic>()),
    'folderId': form['folderId'],
    'color': (form['color'] ?? '').toString().isEmpty ? t.color : form['color'].toString(),
    'notes': (() { final n = (form['notes'] ?? '').toString(); return n.length > 2000 ? n.substring(0, 2000) : n; })(),
  };
}

String fmtSize(int b) {
  if (b < 1024) return '$b B';
  if (b < 1024 * 1024) return '${(b / 1024).toStringAsFixed(b < 10240 ? 1 : 0)} KB';
  if (b < 1024 * 1024 * 1024) return '${(b / 1048576).toStringAsFixed(1)} MB';
  return '${(b / 1073741824).toStringAsFixed(2)} GB';
}
