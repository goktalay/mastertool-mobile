// Ayarlar — masaüstü modalı birebir: 760 px (tablette ortada pencere, telefonda tam sayfa), başlıkta dişli + "Ayarlar" 17/600,
// solda 170 px dikey sekme listesi (≥720 px; dar ekranda yatay sarmalı), sağda form; Genel (Dil seçimi + ipucu, Tema segmenti),
// Hesap (acct-box: e-posta, "Hesabım (web)", kırmızı "Çıkış yap"), Hakkında (ad 18/700, sürüm, aile, lisanslar); altta
// İptal / Kaydet (geçişli). Kaydedince değişiklikler uygulanır ve "Ayarlar kaydedildi" toast'ı çıkar.
import 'package:flutter/material.dart';
import 'package:package_info_plus/package_info_plus.dart';
import 'package:url_launcher/url_launcher.dart';

import '../core/account.dart';
import '../core/l10n/gen/mt_strings.dart';
import '../core/prefs.dart';
import '../core/theme.dart';
import '../widgets/mt_widgets.dart';

Future<void> showSettings(BuildContext context, {required AccountService account, required Prefs prefs}) {
  if (MtBreak.wide(context)) {
    return showDialog(
      context: context, barrierColor: const Color(0x9E03060C),
      builder: (_) => Dialog(
        insetPadding: const EdgeInsets.all(16), backgroundColor: Colors.transparent,
        child: ConstrainedBox(constraints: const BoxConstraints(maxWidth: MtDim.settingsW, maxHeight: 640),
            child: SettingsScreen(account: account, prefs: prefs, asDialog: true)),
      ),
    );
  }
  return Navigator.of(context).push(MaterialPageRoute(fullscreenDialog: true, builder: (_) => SettingsScreen(account: account, prefs: prefs)));
}

class SettingsScreen extends StatefulWidget {
  const SettingsScreen({super.key, required this.account, required this.prefs, this.asDialog = false});
  final AccountService account;
  final Prefs prefs;
  final bool asDialog;
  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  int _tab = 0;
  late String? _lang = widget.prefs.lang;
  late MtThemeMode _theme = widget.prefs.theme;

  Future<void> _save() async {
    final s = MtStrings.of(context);
    final nav = Navigator.of(context);
    final messenger = context;
    await widget.prefs.setTheme(_theme);
    await widget.prefs.setLang(_lang);
    if (!mounted) return;
    nav.pop();
    // ignore: use_build_context_synchronously
    mtToast(messenger, s.setSaved, type: 'ok');
  }

  Future<void> _logout() async {
    final s = MtStrings.of(context);
    final ok = await showDialog<bool>(
      context: context,
      builder: (ctx) => AlertDialog(
        title: Row(children: [Icon(Icons.logout, size: 18, color: MtColors.of(ctx).accent), const SizedBox(width: 8), Text(s.acctLogout)]),
        content: Text(s.acctLogoutMsg),
        actionsPadding: const EdgeInsets.fromLTRB(22, 0, 22, 18),
        actions: [MtButton(label: s.commonCancel, onPressed: () => Navigator.pop(ctx, false)),
                  MtButton(label: s.acctLogout, kind: MtBtnKind.dangerPrimary, onPressed: () => Navigator.pop(ctx, true))],
      ),
    );
    if (ok == true) {
      await widget.account.logout();
      if (mounted) Navigator.of(context).popUntil((r) => r.isFirst);
    }
  }

  Future<void> _open(String path) async {
    final lang = Localizations.localeOf(context).languageCode;
    final theme = Theme.of(context).brightness == Brightness.dark ? 'dark' : 'light';
    await launchUrl(Uri.parse('${widget.account.api.baseUrl}$path?lang=$lang&theme=$theme&app=mt'), mode: LaunchMode.externalApplication);
  }

  @override
  Widget build(BuildContext context) {
    final s = MtStrings.of(context);
    final c = MtColors.of(context);
    final wide = MtBreak.wide(context);
    final tabs = [(Icons.settings_outlined, s.setGeneral), (Icons.person_outline, s.setAccount), (Icons.bolt_outlined, s.setAbout)];

    Widget navItem(int i) {
      final on = i == _tab;
      return Material(
        color: on ? c.surface3 : Colors.transparent, borderRadius: BorderRadius.circular(MtDim.radiusSm),
        child: InkWell(
          borderRadius: BorderRadius.circular(MtDim.radiusSm), onTap: () => setState(() => _tab = i),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 9),
            child: Row(mainAxisSize: wide ? MainAxisSize.max : MainAxisSize.min, children: [
              Icon(tabs[i].$1, size: 16, color: on ? c.accent : c.text2),
              const SizedBox(width: 8),
              Text(tabs[i].$2, style: MtText.body.copyWith(color: on ? c.text : c.text2, fontWeight: on ? FontWeight.w600 : FontWeight.w400)),
            ]),
          ),
        ),
      );
    }

    final nav = wide
        ? Container(
            width: MtDim.settingsNav, padding: const EdgeInsetsDirectional.only(end: 12),
            decoration: BoxDecoration(border: BorderDirectional(end: BorderSide(color: c.border))),
            child: Column(children: [for (var i = 0; i < tabs.length; i++) Padding(padding: const EdgeInsets.only(bottom: 2), child: navItem(i))]),
          )
        : Wrap(spacing: 2, runSpacing: 2, children: [for (var i = 0; i < tabs.length; i++) navItem(i)]);

    final page = switch (_tab) { 0 => _general(s, c), 1 => _account(s, c), _ => _about(s, c) };

    final body = Column(crossAxisAlignment: CrossAxisAlignment.stretch, children: [
      Padding(
        padding: const EdgeInsets.fromLTRB(22, 18, 22, 0),
        child: Row(children: [
          Icon(Icons.settings_outlined, size: 18, color: c.accent), const SizedBox(width: 8),
          Text(s.setTitle, style: MtText.h2.copyWith(color: c.text)),
          const Spacer(),
          if (!widget.asDialog) MtIconButton(icon: Icons.close, onPressed: () => Navigator.of(context).pop()),
        ]),
      ),
      Expanded(child: Padding(
        padding: const EdgeInsets.fromLTRB(22, 18, 22, 18),
        child: wide
            ? Row(crossAxisAlignment: CrossAxisAlignment.start, children: [nav, const SizedBox(width: 18), Expanded(child: SingleChildScrollView(child: page))])
            : Column(crossAxisAlignment: CrossAxisAlignment.stretch, children: [nav, const SizedBox(height: 14), Expanded(child: SingleChildScrollView(child: page))]),
      )),
      Container(
        padding: const EdgeInsets.fromLTRB(22, 14, 22, 18),
        decoration: BoxDecoration(border: Border(top: BorderSide(color: c.border))),
        child: Row(mainAxisAlignment: MainAxisAlignment.end, children: [
          MtButton(label: s.commonCancel, onPressed: () => Navigator.of(context).pop()),
          const SizedBox(width: 8),
          MtButton(label: s.commonSave, kind: MtBtnKind.primary, onPressed: _save),
        ]),
      ),
    ]);

    if (widget.asDialog) {
      return Container(
        decoration: BoxDecoration(color: c.surface, borderRadius: BorderRadius.circular(MtDim.radiusModal), border: Border.all(color: c.border),
            boxShadow: [BoxShadow(color: c.shadow, blurRadius: 30, offset: const Offset(0, 10))]),
        clipBehavior: Clip.antiAlias,
        child: body,
      );
    }
    return Scaffold(backgroundColor: c.surface, body: SafeArea(child: body));
  }

  Widget _general(MtStrings s, MtColors c) => Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        MtField(label: s.setLanguage, hint: s.setLanguageHint, child: Container(
          height: MtDim.inputH, padding: const EdgeInsets.symmetric(horizontal: 12),
          decoration: BoxDecoration(color: c.bg2, border: Border.all(color: c.border), borderRadius: BorderRadius.circular(MtDim.radiusSm)),
          child: DropdownButtonHideUnderline(child: DropdownButton<String?>(
            value: _lang, isExpanded: true, style: MtText.body.copyWith(color: c.text), dropdownColor: c.surface2,
            items: [DropdownMenuItem(value: null, child: Text(s.mobLangSystem)), for (final l in kLanguages) DropdownMenuItem(value: l.$1, child: Text(l.$2))],
            onChanged: (v) => setState(() => _lang = v),
          )),
        )),
        const SizedBox(height: 16),
        MtField(label: s.setTheme, child: MtSegment<MtThemeMode>(
          value: _theme, onChanged: (v) => setState(() => _theme = v),
          items: [(MtThemeMode.dark, s.setThemeDark, Icons.dark_mode_outlined), (MtThemeMode.light, s.setThemeLight, Icons.light_mode_outlined),
                  (MtThemeMode.system, s.setThemeSystem, Icons.monitor_outlined)],
        )),
      ]);

  Widget _account(MtStrings s, MtColors c) => Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        MtSectionTitle(s.acctSection),
        const SizedBox(height: 10),
        Container(
          padding: const EdgeInsets.all(14),
          decoration: BoxDecoration(color: c.bg2, borderRadius: BorderRadius.circular(MtDim.radius), border: Border.all(color: c.border)),
          child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            Text(s.acctSignedInAs(widget.account.user?.email ?? ''), style: MtText.body.copyWith(color: c.text)),
            const SizedBox(height: 12),
            Wrap(spacing: 8, runSpacing: 8, children: [
              MtButton(label: s.acctMyAccount, small: true, icon: Icons.open_in_new, onPressed: () => _open('/hesabim')),
              MtButton(label: s.acctLogout, small: true, kind: MtBtnKind.danger, icon: Icons.logout, onPressed: _logout),
            ]),
          ]),
        ),
      ]);

  Widget _about(MtStrings s, MtColors c) => FutureBuilder<PackageInfo>(
        future: PackageInfo.fromPlatform(),
        builder: (context, snap) => Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Row(children: [
            const BrandLogo(size: 44, radius: 12),
            const SizedBox(width: 12),
            Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              Text('Master Tool', style: MtText.aboutName.copyWith(color: c.text)),
              Text(s.aboutVersion(snap.data?.version ?? '…'), style: MtText.small.copyWith(color: c.text2)),
            ]),
          ]),
          const SizedBox(height: 14),
          Text(s.aboutFamily, style: MtText.body.copyWith(color: c.text2, height: 1.45)),
          const SizedBox(height: 16),
          Wrap(spacing: 8, runSpacing: 8, children: [
            MtButton(label: s.aboutLicenses, small: true, icon: Icons.article_outlined, onPressed: () => showLicensePage(context: context, applicationName: 'Master Tool')),
            MtButton(label: s.mobSite, small: true, icon: Icons.open_in_new, onPressed: () => launchUrl(Uri.parse(widget.account.api.baseUrl), mode: LaunchMode.externalApplication)),
          ]),
        ]),
      );
}
