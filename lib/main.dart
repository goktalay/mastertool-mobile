// Master Tool — Android / iPhone / tablet. Mastertool ailesinin tek mobil uygulaması: hesap, ortak oturum ve modüller
// (SSH Master, FTP Masters, SQL Master, Notepad Master, Convert Master, IP Tools).
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

import 'core/account.dart';
import 'core/l10n/gen/mt_strings.dart';
import 'core/module.dart';
import 'core/module_host.dart';
import 'core/prefs.dart';
import 'core/theme.dart';
import 'modules/ftp/ftp_module.dart';
import 'modules/iptools/ip_module.dart';
import 'modules/ssh/ssh_module.dart';
import 'screens/home_screen.dart';
import 'screens/login_screen.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(MasterToolApp(account: AccountService(), prefs: Prefs()));
}

/// Modül kayıtları: yazıldıkça PlaceholderModule yerine gerçek modül konur.
Map<String, MtModule> buildModules([ModuleHost? host]) => {
      'sm': host == null ? PlaceholderModule('sm', Icons.terminal, const Color(0xFF22D3EE)) : SshModule(host),
      'fm': host == null ? PlaceholderModule('fm', Icons.cloud_sync_outlined, const Color(0xFFF59E0B)) : FtpModule(host),
      'sq': PlaceholderModule('sq', Icons.storage_outlined, const Color(0xFF8B5CF6)),
      'np': PlaceholderModule('np', Icons.edit_note, const Color(0xFF10B981)),
      'cv': PlaceholderModule('cv', Icons.swap_horiz, const Color(0xFFEC4899)),
      'ip': host == null ? PlaceholderModule('ip', Icons.lan_outlined, const Color(0xFF3B82F6)) : IpToolsModule(host),
    };

class MasterToolApp extends StatefulWidget {
  const MasterToolApp({super.key, required this.account, required this.prefs});
  final AccountService account;
  final Prefs prefs;
  @override
  State<MasterToolApp> createState() => _MasterToolAppState();
}

class _MasterToolAppState extends State<MasterToolApp> with WidgetsBindingObserver {
  late final ModuleHost _host = ModuleHost(widget.account);
  late final Map<String, MtModule> _modules = buildModules(_host);

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addObserver(this);
    widget.prefs.init();
    widget.account.init();
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    _host.dispose();
    super.dispose();
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    if (state == AppLifecycleState.resumed) {
      if (widget.account.signedIn) widget.account.refreshModules();
      _host.resumeAll();
    }
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
