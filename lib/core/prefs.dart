// Cihaz ayarları (senkronlanmaz): dil, tema. Dil listesi masaüstüyle aynı 8 dil ve sıra; sistem dili listede yoksa İngilizce.
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'theme.dart';

const kLanguages = [
  ('tr', 'Türkçe'), ('en', 'English'), ('fr', 'Français'), ('de', 'Deutsch'),
  ('es', 'Español'), ('ar', 'العربية'), ('zh', '中文'), ('ru', 'Русский'),
];

class Prefs extends ChangeNotifier {
  SharedPreferences? _p;
  String? _lang; // null = sistem
  MtThemeMode _theme = MtThemeMode.system;

  Future<void> init() async {
    _p = await SharedPreferences.getInstance();
    _lang = _p!.getString('lang');
    _theme = MtThemeMode.values.firstWhere((m) => m.name == _p!.getString('theme'), orElse: () => MtThemeMode.system);
    notifyListeners();
  }

  String? get lang => _lang;
  MtThemeMode get theme => _theme;
  Locale? get locale => _lang == null ? null : Locale(_lang!);

  Future<void> setLang(String? code) async {
    _lang = code;
    code == null ? await _p?.remove('lang') : await _p?.setString('lang', code);
    notifyListeners();
  }

  Future<void> setTheme(MtThemeMode m) async {
    _theme = m;
    await _p?.setString('theme', m.name);
    notifyListeners();
  }

  /// Sistem dili listede yoksa İngilizce (masaüstü resolveLanguage ile aynı).
  static Locale resolve(Locale? device, Iterable<Locale> supported) {
    if (device != null) {
      for (final s in supported) {
        if (s.languageCode == device.languageCode) return s;
      }
    }
    return const Locale('en');
  }
}
