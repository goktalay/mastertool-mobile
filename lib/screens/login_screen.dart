// Giriş ekranı — masaüstü login.html/login.css birebir: 440 px kart (tablette ortada, telefonda tam genişlik), logo 72,
// başlık 22, alt başlık text-2, etiketli alanlar (36 px), sağa yaslı "Şifremi unuttum", hata kutusu, geçişli 40 px "Giriş yap",
// SSO ipucu kutusu, "Hesabınız yok mu? Hesap oluştur", altta dil seçimi + sürüm, sağ üstte M simgesi hapı.
import 'package:flutter/material.dart';
import 'package:package_info_plus/package_info_plus.dart';
import 'package:url_launcher/url_launcher.dart';

import '../core/account.dart';
import '../core/api.dart';
import '../core/l10n/gen/mt_strings.dart';
import '../core/prefs.dart';
import '../core/theme.dart';
import '../widgets/mt_widgets.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key, required this.account, required this.prefs});
  final AccountService account;
  final Prefs prefs;
  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _email = TextEditingController();
  final _pw = TextEditingController();
  bool _busy = false, _hide = true;
  String? _err;

  String _errText(MtStrings s, MtError e) => switch (e.code) {
        'bad_credentials' => s.authErrBadCredentials,
        'unverified' => s.authErrUnverified,
        'suspended' => s.authErrSuspended,
        'rate_limited' => s.authErrRateLimited,
        'network' => s.authErrOffline,
        'session_expired' => s.authErrSessionExpired,
        _ => s.authErrServer(e.message.isNotEmpty ? e.message : e.code),
      };

  Future<void> _submit() async {
    final s = MtStrings.of(context);
    final email = _email.text.trim(), pw = _pw.text;
    if (email.isEmpty || pw.isEmpty) {
      setState(() => _err = s.authErrRequired);
      return;
    }
    setState(() { _busy = true; _err = null; });
    try {
      await widget.account.login(email, pw);
      _pw.clear();
    } on MtError catch (e) {
      setState(() => _err = _errText(s, e));
    } catch (e) {
      setState(() => _err = s.authErrServer(e.toString()));
    } finally {
      if (mounted) setState(() => _busy = false);
    }
  }

  Future<void> _openSite(String path) async {
    final lang = Localizations.localeOf(context).languageCode;
    final theme = Theme.of(context).brightness == Brightness.dark ? 'dark' : 'light';
    await launchUrl(Uri.parse('${widget.account.api.baseUrl}$path?lang=$lang&theme=$theme&app=mt'), mode: LaunchMode.externalApplication);
  }

  @override
  Widget build(BuildContext context) {
    final s = MtStrings.of(context);
    final c = MtColors.of(context);
    final wide = MediaQuery.sizeOf(context).width >= 560;
    final link = TextStyle(color: c.accent, fontWeight: FontWeight.w500, fontSize: 13);

    final form = Column(crossAxisAlignment: CrossAxisAlignment.stretch, mainAxisSize: MainAxisSize.min, children: [
      Center(child: BrandLogo(size: 72, radius: 18)),
      const SizedBox(height: 14),
      Text('Master Tool', textAlign: TextAlign.center, style: MtText.h1.copyWith(color: c.text)),
      const SizedBox(height: 4),
      Text(s.authSubtitle, textAlign: TextAlign.center, style: MtText.body.copyWith(color: c.text2)),
      const SizedBox(height: 22),
      AutofillGroup(child: Column(crossAxisAlignment: CrossAxisAlignment.stretch, children: [
        MtField(label: s.authEmail, child: TextField(
          controller: _email, keyboardType: TextInputType.emailAddress, autocorrect: false, textDirection: TextDirection.ltr,
          autofillHints: const [AutofillHints.username, AutofillHints.email], textInputAction: TextInputAction.next, style: MtText.body,
          decoration: const InputDecoration(hintText: 'ornek@example.com'),
        )),
        const SizedBox(height: 14),
        MtField(label: s.authPassword, child: TextField(
          controller: _pw, obscureText: _hide, autofillHints: const [AutofillHints.password], textInputAction: TextInputAction.done,
          onSubmitted: (_) => _busy ? null : _submit(), style: MtText.body,
          decoration: InputDecoration(suffixIcon: MtIconButton(icon: _hide ? Icons.visibility_outlined : Icons.visibility_off_outlined,
              onPressed: () => setState(() => _hide = !_hide))),
        )),
      ])),
      const SizedBox(height: 10),
      Align(alignment: AlignmentDirectional.centerEnd, child: InkWell(onTap: () => _openSite('/sifremi-unuttum'), child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 2), child: Text(s.authForgot, style: link)))),
      if (_err != null) ...[const SizedBox(height: 14), MtBox(_err!, kind: MtBoxKind.error)],
      const SizedBox(height: 14),
      MtButton(label: s.authSubmit, kind: MtBtnKind.primary, height: MtDim.btnLoginH, expand: true, busy: _busy, onPressed: _submit),
      const SizedBox(height: 14),
      MtBox(s.mobSsoHint, kind: MtBoxKind.info, icon: Icons.lock_outline),
      const SizedBox(height: 14),
      Wrap(alignment: WrapAlignment.center, crossAxisAlignment: WrapCrossAlignment.center, children: [
        Text(s.authNoAccount, style: TextStyle(fontSize: 13, color: c.text2)),
        const SizedBox(width: 4),
        InkWell(onTap: () => _openSite('/kayit'), child: Text(s.authRegister, style: link)),
      ]),
    ]);

    final footer = AnimatedBuilder(
      animation: widget.prefs,
      builder: (context, _) => Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
        Container(
          height: 30, padding: const EdgeInsets.symmetric(horizontal: 10),
          decoration: BoxDecoration(color: c.bg2, border: Border.all(color: c.border), borderRadius: BorderRadius.circular(MtDim.radiusSm)),
          child: DropdownButtonHideUnderline(child: DropdownButton<String?>(
            value: widget.prefs.lang, isDense: true, style: MtText.small.copyWith(color: c.text), dropdownColor: c.surface2,
            items: [DropdownMenuItem(value: null, child: Text(s.mobLangSystem)), for (final l in kLanguages) DropdownMenuItem(value: l.$1, child: Text(l.$2))],
            onChanged: widget.prefs.setLang,
          )),
        ),
        FutureBuilder<PackageInfo>(future: PackageInfo.fromPlatform(),
            builder: (_, snap) => Text('v${snap.data?.version ?? ''}', textDirection: TextDirection.ltr, style: MtText.tiny.copyWith(color: c.text3))),
      ]),
    );

    final card = Container(
      width: wide ? MtDim.loginW : double.infinity,
      constraints: BoxConstraints(minHeight: wide ? 640 : 0),
      decoration: wide ? BoxDecoration(color: c.surface, borderRadius: BorderRadius.circular(MtDim.radiusModal), border: Border.all(color: c.border),
          boxShadow: [BoxShadow(color: c.shadow, blurRadius: 30, offset: const Offset(0, 10))]) : null,
      padding: const EdgeInsets.fromLTRB(36, 34, 36, 16),
      child: Column(mainAxisSize: MainAxisSize.min, crossAxisAlignment: CrossAxisAlignment.stretch, children: [
        form, const SizedBox(height: 18), footer,
      ]),
    );

    return Scaffold(
      body: MtBackground(login: true, child: SafeArea(child: Stack(children: [
        Center(child: SingleChildScrollView(padding: EdgeInsets.all(wide ? 24 : 0), child: card)),
        PositionedDirectional(top: 12, end: 12, child: MtLink(url: widget.account.api.baseUrl, compact: true)),
      ]))),
    );
  }
}
