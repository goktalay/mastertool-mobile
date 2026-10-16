// ffmpeg komut satırı üretimi — masaüstü convertmaster/src/media.js (scaleFilter, audioArgs, audioShape, fixOpusRate,
// videoArgs, audioOnlyArgs, ffImageArgs) birebir; saf Dart, FFmpegKit'e bağımlı değil (birim testi: test/cv_ffmpeg_args_test.dart).
// Kodlayıcı kümesi: FFmpegKit full-gpl'de bulunanlar varsayılan (libx264, libx265, libvpx-vp9, libxvid, libmp3lame, libopus,
// libvorbis, libtheora); `encoders` ile daraltılırsa media.js'teki pick() yedekleri devreye girer.

const kFfmpegKitEncoders = {'libx264', 'libx265', 'libvpx-vp9', 'libxvid', 'mpeg4', 'libmp3lame', 'libopus', 'libvorbis', 'libtheora', 'aac', 'wmav2', 'wmv2', 'mpeg2video', 'mp2', 'ac3', 'flac', 'pcm_s16le', 'pcm_s16be', 'libwebp', 'png', 'mjpeg', 'gif', 'bmp', 'targa'};

class CvConvertError implements Exception {
  CvConvertError(this.code, [this.message = '', this.detail = '']);
  final String code, message, detail;
  @override
  String toString() => message.isEmpty ? code : message;
}

/// Kaynağın akış bilgisi (ffprobe): süre (sn) ve video / ses var mı.
class CvMediaInfo {
  const CvMediaInfo({this.duration = 0, this.hasVideo = false, this.hasAudio = false, this.unreadable = false, this.width = 0, this.height = 0});
  final double duration;
  final bool hasVideo, hasAudio, unreadable;
  final int width, height;
}

const _crf = {
  'x264': {'high': 18, 'medium': 23, 'low': 28},
  'x265': {'high': 22, 'medium': 28, 'low': 32},
  'vp9': {'high': 24, 'medium': 32, 'low': 40},
  'q': {'high': 2, 'medium': 4, 'low': 7},
  'theora': {'high': 9, 'medium': 7, 'low': 5},
  'gifFps': {'high': 15, 'medium': 12, 'low': 10},
};

String _pick(Set<String> enc, List<String> names) => names.firstWhere(enc.contains, orElse: () => names.last);

/// Çözünürlük: kısa kenar en çok H olacak şekilde küçült (büyütme yok), çift boyut
String? scaleFilter(Object? res) {
  if (res == null || res == 'source' || res.toString().isEmpty) return null;
  final h = int.tryParse(res.toString());
  if (h == null) return null;
  return "scale='if(gt(iw,ih),-2,min(iw,$h))':'if(gt(iw,ih),min(ih,$h),-2)'";
}

List<String> audioArgs(String target, Map<String, dynamic> o) {
  final br = '${int.tryParse((o['bitrate'] ?? o['audioBitrate'] ?? 192).toString()) ?? 192}k';
  return switch (target) {
    'mp3' => ['-c:a', 'libmp3lame', '-b:a', br],
    'aac' => ['-c:a', 'aac', '-b:a', br, '-f', 'adts'],
    'm4a' => ['-c:a', 'aac', '-b:a', br],
    'wav' => ['-c:a', 'pcm_s16le'],
    'aiff' => ['-c:a', 'pcm_s16be'],
    'flac' => ['-c:a', 'flac'],
    'ogg' => ['-c:a', 'libvorbis', '-b:a', br],
    'opus' => ['-c:a', 'libopus', '-b:a', br],
    'wma' => ['-c:a', 'wmav2', '-b:a', br],
    'ac3' => ['-c:a', 'ac3', '-b:a', br],
    _ => ['-c:a', 'aac', '-b:a', br],
  };
}

List<String> audioShape(Map<String, dynamic> o) {
  final out = <String>[];
  final sr = o['sampleRate']?.toString();
  if (sr != null && sr.isNotEmpty && sr != 'source') out.addAll(['-ar', sr]);
  if (o['channels'] == 'mono') out.addAll(['-ac', '1']);
  if (o['channels'] == 'stereo') out.addAll(['-ac', '2']);
  return out;
}

/// Opus yalnız 48/24/16/12/8 kHz kabul eder; uyumsuz örnekleme hızı 48 kHz'e çekilir
List<String> fixOpusRate(List<String> args, String target) {
  if (target != 'opus') return args;
  final i = args.indexOf('-ar');
  if (i >= 0 && !const ['48000', '24000', '16000', '12000', '8000'].contains(args[i + 1])) args[i + 1] = '48000';
  return args;
}

List<String> videoArgs(String target, Map<String, dynamic> o, CvMediaInfo info, {Set<String> encoders = kFfmpegKitEncoders}) {
  final enc = encoders;
  final q = kQualityOf(o['quality']);
  final sf = scaleFilter(o['resolution']);
  final fpsV = o['fps']?.toString();
  final fps = fpsV != null && fpsV != 'source' && fpsV.isNotEmpty ? ['-r', fpsV] : <String>[];
  final noA = o['noAudio'] == true || !info.hasAudio;
  final ab = o['audioBitrate']?.toString();

  if (const ['mp3', 'm4a', 'wav', 'flac', 'ogg', 'opus'].contains(target)) {
    if (!info.hasAudio) throw CvConvertError('no_audio');
    return fixOpusRate(['-map', '0:a:0', '-vn', ...audioArgs(target, {'bitrate': ab})], target);
  }
  if (target == 'gif') {
    final w = o['resolution'] != null && o['resolution'] != 'source' ? int.tryParse(o['resolution'].toString()) ?? 480 : 480;
    final f = fpsV != null && fpsV != 'source' ? (int.tryParse(fpsV) ?? 12).clamp(1, 30) : _crf['gifFps']![q]!;
    return ['-filter_complex',
      "[0:v:0]fps=$f,scale='min(iw,$w)':-2:flags=lanczos,split[a][b];[a]palettegen=stats_mode=diff[p];[b][p]paletteuse=dither=sierra2_4a[g]",
      '-map', '[g]', '-an', '-loop', '0'];
  }

  final maps = ['-map', '0:v:0', ...(noA ? ['-an'] : ['-map', '0:a:0'])];
  final speed = const ['ultrafast', 'veryfast', 'fast', 'medium', 'slow'].contains(o['speed']) ? o['speed'].toString() : 'medium';
  List<String> v, a;
  switch (target) {
    case 'webm':
      v = ['-c:v', _pick(enc, ['libvpx-vp9']), '-b:v', '0', '-crf', '${_crf['vp9']![q]}', '-row-mt', '1', '-deadline', 'good',
        '-cpu-used', speed == 'slow' ? '1' : speed == 'medium' ? '2' : '4', '-pix_fmt', 'yuv420p'];
      a = ['-c:a', 'libopus', '-b:a', '${ab ?? 160}k'];
    case 'avi':
      v = ['-c:v', _pick(enc, ['libxvid', 'mpeg4']), '-q:v', '${_crf['q']![q]}', '-vtag', 'XVID', '-pix_fmt', 'yuv420p'];
      a = ['-c:a', 'libmp3lame', '-b:a', '${ab ?? 192}k'];
    case 'wmv':
      v = ['-c:v', 'wmv2', '-q:v', '${_crf['q']![q]}'];
      a = ['-c:a', 'wmav2', '-b:a', '${ab ?? 192}k'];
    case 'mpg':
      final b = int.tryParse(ab ?? '') ?? 192;
      v = ['-c:v', 'mpeg2video', '-q:v', '${_crf['q']![q]}', '-pix_fmt', 'yuv420p'];
      a = ['-c:a', 'mp2', '-b:a', '${b < 128 ? 128 : b}k'];
    case 'ogv':
      v = ['-c:v', 'libtheora', '-q:v', '${_crf['theora']![q]}'];
      a = ['-c:a', 'libvorbis', '-b:a', '${ab ?? 160}k'];
    default:
      // mp4, m4v, mov, mkv, flv, 3gp: H.264 (veya mp4/mkv/mov'da H.265) + AAC
      final hevc = o['codec'] == 'h265' && const ['mp4', 'm4v', 'mov', 'mkv'].contains(target) && enc.contains('libx265');
      v = hevc
          ? ['-c:v', 'libx265', '-crf', '${_crf['x265']![q]}', '-preset', speed, '-tag:v', 'hvc1', '-pix_fmt', 'yuv420p']
          : ['-c:v', _pick(enc, ['libx264']), '-crf', '${_crf['x264']![q]}', '-preset', speed, '-pix_fmt', 'yuv420p'];
      if (target == '3gp') v.addAll(['-profile:v', 'baseline']);
      a = audioArgs('m4a', {'audioBitrate': ab});
      if (target == 'flv') a.addAll(['-ar', '44100']);
  }
  final vf = sf ?? "scale='trunc(iw/2)*2':'trunc(ih/2)*2'";
  final extra = const ['mp4', 'm4v', 'mov'].contains(target) ? ['-movflags', '+faststart'] : <String>[];
  return [...maps, ...v, '-vf', vf, ...fps, ...(noA ? <String>[] : a), '-map_metadata', '0', ...extra];
}

String kQualityOf(Object? q) => const ['high', 'medium', 'low'].contains(q) ? q.toString() : 'medium';

List<String> audioOnlyArgs(String target, Map<String, dynamic> o) =>
    fixOpusRate(['-map', '0:a:0', '-vn', ...audioArgs(target, o), ...audioShape(o), '-map_metadata', '0'], target);

/// Resim için ffmpeg argümanları (saf Dart `image` paketinin yazamadığı WEBP/AVIF hedefleri ya da okuyamadığı kaynaklar).
List<String> ffImageArgs(String target, Map<String, dynamic> o) {
  final vf = <String>[];
  final mw = (o['maxWidth'] as num?)?.toInt() ?? 0, mh = (o['maxHeight'] as num?)?.toInt() ?? 0;
  if (mw > 0 || mh > 0) vf.add("scale='min(iw,${mw > 0 ? mw : 100000})':'min(ih,${mh > 0 ? mh : 100000})':force_original_aspect_ratio=decrease");
  if (target == 'ico') vf.add("scale='min(256,iw)':'min(256,ih)':force_original_aspect_ratio=decrease");
  final q = ((o['quality'] as num?)?.toInt() ?? 85).clamp(1, 100);
  final args = ['-frames:v', '1'];
  if (vf.isNotEmpty) args.addAll(['-vf', vf.join(',')]);
  if (target == 'jpg' || target == 'jpeg') args.addAll(['-q:v', '${(2 + (100 - q) / 100 * 29).round()}']);
  if (target == 'webp') args.addAll(['-quality', '$q']);
  if (target == 'ico') args.addAll(['-c:v', 'png', '-pix_fmt', 'rgba']);
  if (target == 'tga') args.addAll(['-c:v', 'targa']);
  return args;
}

/// Tam komut satırı: `ffmpeg -hide_banner -nostdin -y -i src <args> out` (media.js runFfmpeg; -progress yerine FFmpegKit Statistics).
List<String> buildCommand({required String src, required String out, required String type, required String target, required Map<String, dynamic> options, required CvMediaInfo info}) {
  final List<String> args;
  if (type == 'image') {
    args = ffImageArgs(target, (options['image'] as Map?)?.cast<String, dynamic>() ?? const {});
  } else {
    if (info.unreadable) throw CvConvertError('unreadable');
    if (type == 'video' && !info.hasVideo) throw CvConvertError('no_video');
    if (type == 'audio' && !info.hasAudio) throw CvConvertError('no_audio');
    args = type == 'video'
        ? videoArgs(target, (options['video'] as Map?)?.cast<String, dynamic>() ?? const {}, info)
        : audioOnlyArgs(target, (options['audio'] as Map?)?.cast<String, dynamic>() ?? const {});
  }
  return ['-hide_banner', '-nostdin', '-y', '-i', src, ...args, out];
}

/// ffmpeg hata çıktısından kullanıcıya gösterilecek anlamlı son satır (media.js lastError)
String lastFfmpegError(String stderr) {
  final noise = RegExp(r'Conversion failed|Nothing was written|Task finished|Terminating thread|Error sending frames|^frame=|^size=');
  final lines = stderr.split(RegExp(r'\r?\n')).map((l) => l.trim()).where((l) => l.isNotEmpty && !noise.hasMatch(l)).toList();
  final bad = lines.where((l) => RegExp(r'error|invalid|not supported|unsupported|does not support|requires|could not|unable|no such|failed|denied|incorrect', caseSensitive: false).hasMatch(l)).toList();
  final s = (bad.isNotEmpty ? bad.last : lines.isNotEmpty ? lines.last : 'ffmpeg').replaceFirst(RegExp(r'^\[[^\]]+\]\s*'), '');
  return s.length > 300 ? s.substring(0, 300) : s;
}
