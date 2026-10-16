// Convert Master ffmpeg komut satırı üretimi — masaüstü media.js (_videoArgs, _audioOnlyArgs, _scaleFilter) ile aynı çıktılar.
import 'package:flutter_test/flutter_test.dart';
import 'package:master_tool/modules/convert/cv_ffmpeg_args.dart';
import 'package:master_tool/modules/convert/cv_formats.dart';

void main() {
  const av = CvMediaInfo(duration: 120, hasVideo: true, hasAudio: true);
  const vOnly = CvMediaInfo(duration: 10, hasVideo: true, hasAudio: false);
  final dv = (defaultOptions()['video'] as Map).cast<String, dynamic>();
  final da = (defaultOptions()['audio'] as Map).cast<String, dynamic>();

  test('scaleFilter: kaynak → yok; 720 → kısa kenar sınırı', () {
    expect(scaleFilter('source'), isNull);
    expect(scaleFilter(null), isNull);
    expect(scaleFilter('720'), "scale='if(gt(iw,ih),-2,min(iw,720))':'if(gt(iw,ih),min(ih,720),-2)'");
  });

  test('mp4 varsayılan: H.264 crf 23 preset medium + AAC 192k + faststart', () {
    final a = videoArgs('mp4', dv, av);
    expect(a, ['-map', '0:v:0', '-map', '0:a:0', '-c:v', 'libx264', '-crf', '23', '-preset', 'medium', '-pix_fmt', 'yuv420p',
      '-vf', "scale='trunc(iw/2)*2':'trunc(ih/2)*2'", '-c:a', 'aac', '-b:a', '192k', '-map_metadata', '0', '-movflags', '+faststart']);
  });

  test('mkv H.265 yüksek kalite, 1080p, 30 fps, sessiz', () {
    final a = videoArgs('mkv', {...dv, 'codec': 'h265', 'quality': 'high', 'resolution': '1080', 'fps': '30', 'noAudio': true}, av);
    expect(a.sublist(0, 3), ['-map', '0:v:0', '-an']);
    expect(a, containsAllInOrder(['-c:v', 'libx265', '-crf', '22', '-preset', 'medium', '-tag:v', 'hvc1']));
    expect(a, containsAllInOrder(['-vf', scaleFilter('1080'), '-r', '30', '-map_metadata', '0']));
    expect(a, isNot(contains('-c:a')));
    expect(a, isNot(contains('-movflags')));
  });

  test('H.265 yalnız mp4/mkv/mov/m4v; avi\'de xvid kalır', () {
    final a = videoArgs('avi', {...dv, 'codec': 'h265', 'quality': 'low'}, av);
    expect(a, containsAllInOrder(['-c:v', 'libxvid', '-q:v', '7', '-vtag', 'XVID', '-c:a', 'libmp3lame', '-b:a', '192k']));
  });

  test('libx265 yoksa H.264\'e düşer', () {
    final a = videoArgs('mp4', {...dv, 'codec': 'h265'}, av, encoders: {'libx264', 'aac'});
    expect(a, containsAllInOrder(['-c:v', 'libx264', '-crf', '23']));
  });

  test('webm: vp9 crf + opus; hız → cpu-used', () {
    final a = videoArgs('webm', {...dv, 'speed': 'slow', 'audioBitrate': '128'}, av);
    expect(a, containsAllInOrder(['-c:v', 'libvpx-vp9', '-b:v', '0', '-crf', '32', '-row-mt', '1', '-deadline', 'good', '-cpu-used', '1', '-pix_fmt', 'yuv420p']));
    expect(a, containsAllInOrder(['-c:a', 'libopus', '-b:a', '128k']));
  });

  test('3gp baseline profil, flv 44.1 kHz, mpg mp2 en az 128k', () {
    expect(videoArgs('3gp', dv, av), containsAllInOrder(['-profile:v', 'baseline']));
    expect(videoArgs('flv', dv, av), containsAllInOrder(['-c:a', 'aac', '-b:a', '192k', '-ar', '44100']));
    expect(videoArgs('mpg', {...dv, 'audioBitrate': '64'}, av), containsAllInOrder(['-c:v', 'mpeg2video', '-c:a', 'mp2', '-b:a', '128k']));
  });

  test('ses akışı yoksa -an (ses kodlayıcı eklenmez)', () {
    final a = videoArgs('mp4', dv, vOnly);
    expect(a, contains('-an'));
    expect(a, isNot(contains('-c:a')));
  });

  test('videodan yalnız ses: mp3 / opus; ses yoksa no_audio', () {
    expect(videoArgs('mp3', {...dv, 'audioBitrate': '320'}, av), ['-map', '0:a:0', '-vn', '-c:a', 'libmp3lame', '-b:a', '320k']);
    expect(videoArgs('opus', dv, av), ['-map', '0:a:0', '-vn', '-c:a', 'libopus', '-b:a', '192k']);
    expect(() => videoArgs('mp3', dv, vOnly), throwsA(isA<CvConvertError>().having((e) => e.code, 'code', 'no_audio')));
  });

  test('gif: palet üretimi, kalite → fps, çözünürlük → genişlik', () {
    final a = videoArgs('gif', {...dv, 'quality': 'high', 'resolution': '360'}, av);
    expect(a[0], '-filter_complex');
    expect(a[1], startsWith('[0:v:0]fps=15,scale=\'min(iw,360)\':-2:flags=lanczos'));
    expect(a.sublist(2), ['-map', '[g]', '-an', '-loop', '0']);
    expect(videoArgs('gif', {...dv, 'fps': '60'}, av)[1], startsWith('[0:v:0]fps=30,scale=\'min(iw,480)\''));
  });

  test('ses projesi: mp3 192k mono 44.1k; wav kayıpsız; opus örnekleme düzeltmesi', () {
    expect(audioOnlyArgs('mp3', {...da, 'sampleRate': '44100', 'channels': 'mono'}), ['-map', '0:a:0', '-vn', '-c:a', 'libmp3lame', '-b:a', '192k', '-ar', '44100', '-ac', '1', '-map_metadata', '0']);
    expect(audioOnlyArgs('wav', da), ['-map', '0:a:0', '-vn', '-c:a', 'pcm_s16le', '-map_metadata', '0']);
    expect(audioOnlyArgs('aac', da), containsAllInOrder(['-c:a', 'aac', '-b:a', '192k', '-f', 'adts']));
    expect(audioOnlyArgs('opus', {...da, 'sampleRate': '44100'}), containsAllInOrder(['-ar', '48000']));
    expect(audioOnlyArgs('opus', {...da, 'sampleRate': '16000'}), containsAllInOrder(['-ar', '16000']));
  });

  test('resim (ffmpeg yolu): jpg kalite → q:v, boyut sınırı, ico', () {
    expect(ffImageArgs('jpg', {'quality': 85, 'maxWidth': 0, 'maxHeight': 0}), ['-frames:v', '1', '-q:v', '6']);
    expect(ffImageArgs('webp', {'quality': 70, 'maxWidth': 800, 'maxHeight': 0}),
        ['-frames:v', '1', '-vf', "scale='min(iw,800)':'min(ih,100000)':force_original_aspect_ratio=decrease", '-quality', '70']);
    expect(ffImageArgs('ico', {}), ['-frames:v', '1', '-vf', "scale='min(256,iw)':'min(256,ih)':force_original_aspect_ratio=decrease", '-c:v', 'png', '-pix_fmt', 'rgba']);
  });

  test('buildCommand: tam satır; okunamaz / video yok hataları', () {
    final cmd = buildCommand(src: '/a/x.mkv', out: '/b/x.mp4', type: 'video', target: 'mp4', options: defaultOptions(), info: av);
    expect(cmd.sublist(0, 5), ['-hide_banner', '-nostdin', '-y', '-i', '/a/x.mkv']);
    expect(cmd.last, '/b/x.mp4');
    expect(() => buildCommand(src: 'a', out: 'b', type: 'video', target: 'mp4', options: defaultOptions(), info: const CvMediaInfo(unreadable: true)),
        throwsA(isA<CvConvertError>().having((e) => e.code, 'code', 'unreadable')));
    expect(() => buildCommand(src: 'a', out: 'b', type: 'video', target: 'mp4', options: defaultOptions(), info: const CvMediaInfo(hasAudio: true)),
        throwsA(isA<CvConvertError>().having((e) => e.code, 'code', 'no_video')));
    expect(() => buildCommand(src: 'a', out: 'b', type: 'audio', target: 'mp3', options: defaultOptions(), info: const CvMediaInfo(hasVideo: true)),
        throwsA(isA<CvConvertError>().having((e) => e.code, 'code', 'no_audio')));
  });

  test('cleanOptions / cleanProject: bozuk değerler varsayılana çekilir (main.js)', () {
    final o = cleanOptions({'video': {'quality': 'ultra', 'resolution': 9999, 'fps': '30', 'codec': 'av1', 'speed': 'ultrafast', 'audioBitrate': 192, 'noAudio': 1},
      'image': {'quality': 250, 'maxWidth': -5, 'maxHeight': '1200', 'keepMeta': 'yes'}, 'audio': {'bitrate': '999', 'sampleRate': 44100, 'channels': 'mono'}});
    expect(o['video'], {'quality': 'medium', 'resolution': 'source', 'fps': '30', 'codec': 'h264', 'speed': 'medium', 'audioBitrate': '192', 'noAudio': false});
    expect(o['image'], {'quality': 100, 'maxWidth': 0, 'maxHeight': 1200, 'keepMeta': false});
    expect(o['audio'], {'bitrate': '192', 'sampleRate': '44100', 'channels': 'mono'});
    final p = cleanProject({'name': '  ', 'type': 'image', 'sourceExts': ['png', 'mp4', 'png'], 'targetExt': 'mp3', 'concurrency': 99, 'speech': {'enabled': true}, 'ocr': {'enabled': true, 'languages': ['tur', 'xxx']}, 'color': ''});
    expect(p['name'], 'Adsız proje');
    expect(p['sourceExts'], ['png']);
    expect(p['targetExt'], 'jpg');
    expect(p['sourceMode'], 'folder');
    expect(p['concurrency'], 32);
    expect((p['speech'] as Map)['enabled'], false); // resimde konuşma yok
    expect(p['ocr'], {'enabled': true, 'languages': ['tur']});
    expect(p['color'], '#34d399');
    expect(cleanProject({'type': 'video'})['sourceExts'], ['mkv', 'avi', 'mov', 'wmv']);
  });

  test('lastFfmpegError: anlamlı son satır', () {
    expect(lastFfmpegError('frame=1\n[libx264 @ 0x1] Error initializing output stream\nConversion failed!'), 'Error initializing output stream');
    expect(lastFfmpegError(''), 'ffmpeg');
  });
}
