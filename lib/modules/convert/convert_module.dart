// Convert Master modülü (kod `cv`) — masaüstü Convert Master ile aynı hesap kitaplığı (projeler, klasörler, ayarlar; şifreli senkron).
// Mobilde: resim dönüştürme saf Dart (`image`), video/ses FFmpegKit; konuşmadan metne ve OCR yok (ayarlar korunur).
// main.dart kaydı: 'cv': ConvertModule(host)
import 'package:flutter/material.dart';

import '../../core/account.dart';
import '../../core/module.dart';
import '../../core/module_host.dart';
import 'cv_library.dart';

class ConvertModule implements MtModule {
  ConvertModule(this.host);
  final ModuleHost host;
  @override
  String get app => 'cv';
  @override
  IconData get icon => Icons.swap_horiz;
  @override
  Color get color => const Color(0xFFEC4899);
  @override
  Widget build(BuildContext context, AccountService account) => CvLibraryScreen(host: host);
}
