// Master Tool — Android / iPhone. Mastertool ailesinin tek mobil uygulaması: hesap, ortak oturum ve modüller
// (SSH Master, FTP Masters, SQL Master, Notepad Master, Convert Master, IP Tools).
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

import 'core/account.dart';
import 'core/l10n/gen/mt_strings.dart';
import 'core/module.dart';
import 'core/prefs.dart';
import 'core/theme.dart';
import 'screens/home_screen.dart';
import 'screens/login_screen.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(MasterToolApp(account: AccountService(), prefs: Prefs()));
}

/// Modül kayıtları: yazıldıkça PlaceholderModule yerine gerçek modül konur.
Map<String, MtModule> buildModules() => {
      'sm': PlaceholderModule('sm', Icons.terminal, const Color(0xFF22D3EE)),
      'fm': PlaceholderModule('fm', Icons.cloud_sync_outlined, const Color(0xFFF59E0B)),
      'sq': PlaceholderModule('sq', Icons.storage_outlined, const Color(0xFF8B5CF6)),
      'np': PlaceholderModule('np', Icons.edit_note, const Color(0xFF10B981)),
      'cv': PlaceholderModule('cv', Icons.swap_horiz, const Color(0xFFEC4899)),
      'ip': PlaceholderModule('ip', Icons.lan_outlined, const Color(0xFF3B82F6)),
    };

class MasterToolApp extends StatefulWidget {
  const MasterToolApp({super.key, required this.account, required this.prefs});
  final AccountService account;
  final Prefs prefs;
  @override
  State<MasterToolApp> createState() => _MasterToolAppState();
}

class _MasterToolAppState extends State<MasterToolApp> {
  late final Map<String, MtModule> _modules = buildModules();

  @override
  void initState() {
    super.initState();
    widget.prefs.init();
    widget.account.init();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: Listenable.merge([widget.prefs, widget.account]),
      builder: (context, _) => MaterialApp(
        title: 'Master Tool',
        debugShowCheckedModeBanner: false,
        theme: mtTheme(Brightness.light),
        darkTheme: mtTheme(Brightness.dark),
        themeMode: toThemeMode(widget.prefs.theme),
        locale: widget.prefs.locale,
        localeListResolutionCallback: (locales, supported) => Prefs.resolve(locales?.firstOrNull, supported),
        supportedLocales: MtStrings.supportedLocales,
        localizationsDelegates: const [
          MtStrings.delegate, GlobalMaterialLocalizations.delegate, GlobalWidgetsLocalizations.delegate, GlobalCupertinoLocalizations.delegate,
        ],
        home: widget.account.loading
            ? const Scaffold(body: Center(child: CircularProgressIndicator()))
            : widget.account.signedIn
                ? HomeScreen(account: widget.account, prefs: widget.prefs, modules: _modules)
                : LoginScreen(account: widget.account, prefs: widget.prefs),
      ),
    );
  }
}
