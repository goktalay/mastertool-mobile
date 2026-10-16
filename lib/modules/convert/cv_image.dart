// Resim dönüştürme — saf Dart `image` paketi (masaüstü sharpConvert karşılığı): JPEG / PNG / WEBP / GIF / BMP / TIFF / ICO / TGA.
// EXIF yönü uygulanır (sharp .rotate()), en/boy sınırı "içine sığdır, büyütme yok", JPEG'de şeffaflık beyaza basılır,
// keepMeta kapalıyken EXIF (konum vb.) çıktıya yazılmaz. Ağır iş compute() ile ayrı isolate'te yapılır.
import 'dart:typed_data';

import 'package:flutter/foundation.dart' show compute;
import 'package:image/image.dart' as img;

import 'cv_ffmpeg_args.dart' show CvConvertError;

const kDartImageRead = {'jpg', 'jpeg', 'png', 'webp', 'gif', 'bmp', 'tif', 'tiff', 'ico', 'tga', 'psd', 'pnm', 'pvr'};
const kDartImageWrite = {'jpg', 'jpeg', 'png', 'webp', 'gif', 'bmp', 'tif', 'tiff', 'ico', 'tga'};

class CvImageJob {
  const CvImageJob({required this.bytes, required this.name, required this.target, required this.options});
  final Uint8List bytes;
  final String name, target;
  final Map<String, dynamic> options; // {quality, maxWidth, maxHeight, keepMeta}
}

/// Baytları hedef biçime çevirir (isolate dostu, saf fonksiyon). Hata: CvConvertError(unreadable | unsupported).
Uint8List convertImageBytes(CvImageJob j) {
  if (!kDartImageWrite.contains(j.target)) throw CvConvertError('unsupported');
  var im = img.decodeNamedImage(j.name, j.bytes) ?? img.decodeImage(j.bytes);
  if (im == null) throw CvConvertError('unreadable');
  if (im.numFrames > 1 && !(j.target == 'gif' || j.target == 'webp')) im = im.frames.first;
  im = img.bakeOrientation(im);
  final o = j.options;
  final mw = (o['maxWidth'] as num?)?.toInt() ?? 0, mh = (o['maxHeight'] as num?)?.toInt() ?? 0;
  if ((mw > 0 && im.width > mw) || (mh > 0 && im.height > mh)) {
    final sx = mw > 0 ? mw / im.width : double.infinity, sy = mh > 0 ? mh / im.height : double.infinity;
    final s = sx < sy ? sx : sy;
    im = img.copyResize(im, width: (im.width * s).round().clamp(1, 1 << 20), height: (im.height * s).round().clamp(1, 1 << 20), interpolation: img.Interpolation.average);
  }
  if (o['keepMeta'] != true) im.exif = img.ExifData();
  final q = ((o['quality'] as num?)?.toInt() ?? 85).clamp(1, 100);
  switch (j.target) {
    case 'jpg':
    case 'jpeg':
      if (im.hasAlpha) {
        final bg = img.fill(img.Image(width: im.width, height: im.height, numChannels: 3), color: img.ColorRgb8(255, 255, 255));
        im = img.compositeImage(bg, im);
      }
      return img.encodeJpg(im, quality: q);
    case 'png':
      // sharp: compressionLevel 9, palette q < 80
      final p = q < 80 ? img.quantize(im, numberOfColors: 256) : im;
      return img.encodePng(p, level: 9);
    case 'webp':
      return img.encodeWebP(im, lossless: false, quality: q);
    case 'gif':
      return img.encodeGif(im);
    case 'bmp':
      return img.encodeBmp(im);
    case 'tif':
    case 'tiff':
      return img.encodeTiff(im);
    case 'ico':
      if (im.width > 256 || im.height > 256) {
        final s = 256 / (im.width > im.height ? im.width : im.height);
        im = img.copyResize(im, width: (im.width * s).round(), height: (im.height * s).round(), interpolation: img.Interpolation.average);
      }
      return img.encodeIco(im);
    case 'tga':
      return img.encodeTga(im);
    default:
      throw CvConvertError('unsupported');
  }
}

/// Ayrı isolate'te dönüştürür (arayüzü dondurmaz).
Future<Uint8List> convertImageInIsolate(CvImageJob j) => compute(convertImageBytes, j);
