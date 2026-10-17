// Mastertool arayüz standardı — masaüstü common.css değişkenleri ve ölçüleri birebir (tasarım föyü: docs/arayuz-foyu.md).
// Gece / Gündüz / Sistem; yazı 13.5; yarıçap 12 / 8; kenarlık 1 px; birincil düğme geçişli (#22d3ee → #6366f1, 135°).
import 'package:flutter/material.dart';

class MtColors {
  const MtColors._({
    required this.bg, required this.bg2, required this.surface, required this.surface2, required this.surface3,
    required this.border, required this.borderStrong, required this.text, required this.text2, required this.text3,
    required this.accent, required this.accent2, required this.ok, required this.warn, required this.err,
    required this.topbarBg, required this.cardShadow, required this.shadow, required this.isDark,
  });
  final Color bg, bg2, surface, surface2, surface3, border, borderStrong, text, text2, text3, accent, accent2, ok, warn, err,
      topbarBg, cardShadow, shadow;
  final bool isDark;
  static const onAccent = Color(0xFF04111C);

  static const dark = MtColors._(
    bg: Color(0xFF0B0F17), bg2: Color(0xFF0F1520), surface: Color(0xFF141B28), surface2: Color(0xFF1A2334), surface3: Color(0xFF212C40),
    border: Color(0xFF243047), borderStrong: Color(0xFF31405C), text: Color(0xFFE6EDF6), text2: Color(0xFFA5B2C6), text3: Color(0xFF6F7D93),
    accent: Color(0xFF22D3EE), accent2: Color(0xFF6366F1), ok: Color(0xFF34D399), warn: Color(0xFFFBBF24), err: Color(0xFFF87171),
    topbarBg: Color(0x990B0F17), cardShadow: Color(0x4D000000), shadow: Color(0x59000000), isDark: true,
  );
  static const light = MtColors._(
    bg: Color(0xFFEEF2F7), bg2: Color(0xFFF8FAFC), surface: Color(0xFFFFFFFF), surface2: Color(0xFFF1F5F9), surface3: Color(0xFFE2E8F0),
    border: Color(0xFFD9E0EA), borderStrong: Color(0xFFC3CDDA), text: Color(0xFF0F172A), text2: Color(0xFF475569), text3: Color(0xFF7B8799),
    accent: Color(0xFF0891B2), accent2: Color(0xFF4F46E5), ok: Color(0xFF059669), warn: Color(0xFFD97706), err: Color(0xFFDC2626),
    topbarBg: Color(0xB8FFFFFF), cardShadow: Color(0x1A0F172A), shadow: Color(0x240F172A), isDark: false,
  );

  static MtColors of(BuildContext context) => Theme.of(context).brightness == Brightness.dark ? dark : light;

  /// --accent-grad: 135°, #22d3ee → #6366f1 (iki temada aynı)
  static const grad = LinearGradient(begin: Alignment.topLeft, end: Alignment.bottomRight, colors: [Color(0xFF22D3EE), Color(0xFF6366F1)]);
  /// Tehlike birincil düğmesi
  static const dangerGrad = LinearGradient(begin: Alignment.topLeft, end: Alignment.bottomRight, colors: [Color(0xFFF87171), Color(0xFFE11D48)]);
  /// Kart / kutucuk zemini: 180°, surface → bg-2
  LinearGradient get cardGrad => LinearGradient(begin: Alignment.topCenter, end: Alignment.bottomCenter, colors: [surface, bg2]);
}

/// Ölçüler (px → dp birebir)
class MtDim {
  static const radius = 12.0, radiusSm = 8.0, radiusModal = 16.0, radiusTile = 16.0, radiusCard = 14.0, radiusToast = 10.0;
  static const btnH = 34.0, btnSmH = 28.0, btnLoginH = 40.0, inputH = 36.0, iconBtn = 28.0;
  static const topbarPadV = 16.0, topbarPadH = 28.0, contentPadH = 28.0, contentPadTop = 18.0;
  static const tileMin = 224.0, tileGap = 16.0, tileMinH = 236.0, tileIcon = 84.0, tileIconWrap = 112.0;
  static const settingsNav = 170.0, settingsW = 760.0, loginW = 440.0;
  static const fontBody = 13.5;
}

/// Yazı ölçeği (masaüstü)
class MtText {
  static const body = TextStyle(fontSize: 13.5, height: 1.25);
  static const h1 = TextStyle(fontSize: 22, fontWeight: FontWeight.w700, letterSpacing: .2);
  static const h2 = TextStyle(fontSize: 17, fontWeight: FontWeight.w600);
  static const aboutName = TextStyle(fontSize: 18, fontWeight: FontWeight.w700);
  static const brand = TextStyle(fontSize: 16, fontWeight: FontWeight.w700, letterSpacing: .2);
  static const tileName = TextStyle(fontSize: 15, fontWeight: FontWeight.w600);
  static const cardTitle = TextStyle(fontSize: 14.5, fontWeight: FontWeight.w600);
  static const label = TextStyle(fontSize: 12, fontWeight: FontWeight.w500);
  static const small = TextStyle(fontSize: 12);
  static const tiny = TextStyle(fontSize: 11.5);
  static const btnSm = TextStyle(fontSize: 12.5);
  static const section = TextStyle(fontSize: 11.5, fontWeight: FontWeight.w600, letterSpacing: .8);
  static const subTitle = TextStyle(fontSize: 11, fontWeight: FontWeight.w600, letterSpacing: .6);
  static const mono = TextStyle(fontFamily: 'monospace', fontSize: 12);
}

ThemeData mtTheme(Brightness b) {
  final c = b == Brightness.dark ? MtColors.dark : MtColors.light;
  final scheme = ColorScheme(
    brightness: b, primary: c.accent, onPrimary: MtColors.onAccent, secondary: c.accent2, onSecondary: Colors.white,
    error: c.err, onError: Colors.white, surface: c.surface, onSurface: c.text, outline: c.border, outlineVariant: c.borderStrong,
    surfaceContainerHighest: c.surface3, surfaceContainerHigh: c.surface2, surfaceContainerLow: c.bg2,
  );
  final base = Typography.material2021(platform: TargetPlatform.android).black.apply(bodyColor: c.text, displayColor: c.text);
  return ThemeData(
    useMaterial3: true,
    colorScheme: scheme,
    scaffoldBackgroundColor: c.bg,
    canvasColor: c.surface,
    dividerColor: c.border,
    splashFactory: InkSparkle.splashFactory,
    // Tipografinin yazı tipi ailesi (sistem fontu) korunarak Mastertool ölçüleri bindirilir (merge)
    textTheme: base.copyWith(
      bodyMedium: base.bodyMedium!.merge(MtText.body.copyWith(color: c.text)), bodyLarge: base.bodyLarge!.merge(MtText.body.copyWith(color: c.text)),
      bodySmall: base.bodySmall!.merge(MtText.small.copyWith(color: c.text2)), labelLarge: base.labelLarge!.merge(MtText.body.copyWith(color: c.text, fontWeight: FontWeight.w600)),
      titleMedium: base.titleMedium!.merge(MtText.h2.copyWith(color: c.text)), titleLarge: base.titleLarge!.merge(MtText.h1.copyWith(color: c.text)),
    ),
    appBarTheme: AppBarTheme(backgroundColor: c.bg, foregroundColor: c.text, elevation: 0, scrolledUnderElevation: 0, centerTitle: false,
        titleTextStyle: base.titleLarge!.merge(MtText.brand.copyWith(color: c.text))),
    inputDecorationTheme: InputDecorationTheme(
      filled: true, fillColor: c.bg2, isDense: true, contentPadding: const EdgeInsets.symmetric(horizontal: 12, vertical: 9),
      border: OutlineInputBorder(borderRadius: BorderRadius.circular(MtDim.radiusSm), borderSide: BorderSide(color: c.border)),
      enabledBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(MtDim.radiusSm), borderSide: BorderSide(color: c.border)),
      focusedBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(MtDim.radiusSm), borderSide: BorderSide(color: c.accent)),
      errorBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(MtDim.radiusSm), borderSide: BorderSide(color: c.err)),
      hintStyle: MtText.body.copyWith(color: c.text3),
    ),
    dividerTheme: DividerThemeData(color: c.border, space: 1, thickness: 1),
    dialogTheme: DialogThemeData(backgroundColor: c.surface, shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(MtDim.radiusModal)),
        titleTextStyle: MtText.h2.copyWith(color: c.text), contentTextStyle: MtText.body.copyWith(color: c.text)),
    snackBarTheme: SnackBarThemeData(behavior: SnackBarBehavior.floating, backgroundColor: c.surface2, contentTextStyle: MtText.btnSm.copyWith(color: c.text),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(MtDim.radiusToast), side: BorderSide(color: c.borderStrong))),
    checkboxTheme: CheckboxThemeData(
      fillColor: WidgetStateProperty.resolveWith((s) => s.contains(WidgetState.selected) ? c.accent : Colors.transparent),
      checkColor: const WidgetStatePropertyAll(MtColors.onAccent), side: BorderSide(color: c.borderStrong, width: 1.5),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(4)), visualDensity: VisualDensity.compact,
    ),
    popupMenuTheme: PopupMenuThemeData(color: c.surface2, shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10), side: BorderSide(color: c.borderStrong)),
        textStyle: MtText.body.copyWith(color: c.text)),
    progressIndicatorTheme: ProgressIndicatorThemeData(color: c.accent, linearTrackColor: c.bg2),
    textSelectionTheme: TextSelectionThemeData(cursorColor: c.accent, selectionColor: c.accent.withValues(alpha: .25), selectionHandleColor: c.accent),
    tooltipTheme: TooltipThemeData(decoration: BoxDecoration(color: c.surface3, borderRadius: BorderRadius.circular(6)), textStyle: MtText.small.copyWith(color: c.text)),
  );
}

enum MtThemeMode { system, dark, light }

ThemeMode toThemeMode(MtThemeMode m) =>
    switch (m) { MtThemeMode.system => ThemeMode.system, MtThemeMode.dark => ThemeMode.dark, MtThemeMode.light => ThemeMode.light };

/// Tablet / geniş ekran kırılımları (masaüstü media sorgularıyla uyumlu: 720 ayarlar iki sütun, 860 bağlantı metni).
class MtBreak {
  static bool wide(BuildContext c) => MediaQuery.sizeOf(c).width >= 720;
  static bool xwide(BuildContext c) => MediaQuery.sizeOf(c).width >= 860;
}
