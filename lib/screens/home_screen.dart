// Ana ekran — masaüstü Master Tool index.html/app.css birebir: üst çubuk (38 px logo, ad 16/700, alt bilgi "n/6 modül açık",
// sağda yenile · ayarlar · hesap rozeti · mastertool.download), içerik 18/28 (telefonda 14/16), "MODÜLLER n · ipucu" bölüm
// başlığı, kutucuklar (auto-fill ≥224 px; telefonda 2 sütun), 84 px simge, ad 15/650, alt satır 12, açıklama 11.5;
// açık modülde yeşil nokta; "Hesabınızda kapalı" kilitli ve gri. Uzun basma: Aç / Web sitesi.
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

import '../core/account.dart';
import '../core/l10n/gen/mt_strings.dart';
import '../core/module.dart';
import '../core/prefs.dart';
import '../core/theme.dart';
import '../widgets/mt_widgets.dart';
import 'settings_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key, required this.account, required this.prefs, required this.modules});
  final AccountService account;
  final Prefs prefs;
  final Map<String, MtModule> modules;

  void _openSettings(BuildContext context) => showSettings(context, account: account, prefs: prefs);

  @override
  Widget build(BuildContext context) {
    final s = MtStrings.of(context);
    final c = MtColors.of(context);
    final w = MediaQuery.sizeOf(context).width;
    final phone = w < 560;
    final padH = phone ? 16.0 : MtDim.contentPadH;
    return AnimatedBuilder(
      animation: account,
      builder: (context, _) {
        final list = account.modules.isEmpty
            ? [for (final e in kModules.entries) ModuleInfo(app: e.key, name: e.value.$1, license: 'AKTIF')]
            : account.modules;
        final open = list.where((m) => m.enabled).length;
        final tileMin = phone ? (w - padH * 2 - MtDim.tileGap) / 2 : MtDim.tileMin;
        final cols = ((w - padH * 2 + MtDim.tileGap) / (tileMin + MtDim.tileGap)).floor().clamp(1, 6);
        final tileW = (w - padH * 2 - MtDim.tileGap * (cols - 1)) / cols;
        return Scaffold(
          body: MtBackground(child: SafeArea(bottom: false, child: Column(children: [
            _TopBar(
              sub: s.mobOpenCount(open.toString(), list.length.toString()),
              userName: account.user?.name.isNotEmpty == true ? account.user!.name : (account.user?.email ?? ''),
              onRefresh: account.refreshModules, onSettings: () => _openSettings(context), baseUrl: account.api.baseUrl,
            ),
            Expanded(child: RefreshIndicator(
              color: c.accent, onRefresh: account.refreshModules,
              child: ListView(padding: EdgeInsets.fromLTRB(padH, MtDim.contentPadTop, padH, 40), children: [
                if (account.lastError != null) ...[
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 9), margin: const EdgeInsets.only(bottom: 14),
                    decoration: BoxDecoration(color: c.warn.withValues(alpha: .08), border: Border.all(color: c.warn.withValues(alpha: .45)), borderRadius: BorderRadius.circular(10)),
                    child: Row(children: [Icon(Icons.wifi_off, size: 14, color: c.warn), const SizedBox(width: 8), Expanded(child: Text(s.mobNoModules, style: MtText.btnSm.copyWith(color: c.text)))]),
                  ),
                ],
                MtSectionTitle(s.mobModules, count: list.length, hint: s.mobModulesHint),
                const SizedBox(height: 12),
                Wrap(spacing: MtDim.tileGap, runSpacing: MtDim.tileGap, children: [
                  for (final m in list) SizedBox(width: tileW, child: _Tile(info: m, module: modules[m.app], account: account, phone: phone)),
                ]),
              ]),
            )),
          ]))),
        );
      },
    );
  }
}

class _TopBar extends StatelessWidget {
  const _TopBar({required this.sub, required this.userName, required this.onRefresh, required this.onSettings, required this.baseUrl});
  final String sub, userName, baseUrl;
  final VoidCallback onRefresh, onSettings;
  @override
  Widget build(BuildContext context) {
    final c = MtColors.of(context);
    final s = MtStrings.of(context);
    final w = MediaQuery.sizeOf(context).width;
    final phone = w < 560;
    return Container(
      padding: EdgeInsets.symmetric(vertical: phone ? 10 : MtDim.topbarPadV, horizontal: phone ? 14 : MtDim.topbarPadH),
      decoration: BoxDecoration(color: c.topbarBg, border: Border(bottom: BorderSide(color: c.border))),
      child: Row(children: [
        const BrandLogo(size: 38, radius: 10),
        const SizedBox(width: 12),
        Expanded(child: Column(crossAxisAlignment: CrossAxisAlignment.start, mainAxisSize: MainAxisSize.min, children: [
          Text('Master Tool', style: MtText.brand.copyWith(color: c.text)),
          Text(sub, style: MtText.tiny.copyWith(color: c.text3), overflow: TextOverflow.ellipsis),
        ])),
        MtIconButton(icon: Icons.refresh, tooltip: s.mobRefresh, onPressed: onRefresh),
        const SizedBox(width: 6),
        MtIconButton(icon: Icons.settings_outlined, tooltip: s.mobSettings, onPressed: onSettings),
        const SizedBox(width: 6),
        AccountBadge(name: userName, showName: w >= 900, onTap: onSettings),
        if (!phone) ...[const SizedBox(width: 10), MtLink(url: baseUrl, compact: w < 860)],
      ]),
    );
  }
}

class _Tile extends StatelessWidget {
  const _Tile({required this.info, required this.module, required this.account, required this.phone});
  final ModuleInfo info;
  final MtModule? module;
  final AccountService account;
  final bool phone;

  Future<void> _menu(BuildContext context, Offset pos) async {
    final s = MtStrings.of(context);
    final r = await showMenu<String>(
      context: context, position: RelativeRect.fromLTRB(pos.dx, pos.dy, pos.dx, pos.dy),
      items: [
        if (info.enabled && module != null) PopupMenuItem(value: 'open', child: Row(children: [const Icon(Icons.open_in_new, size: 16), const SizedBox(width: 10), Text(s.mobOpen)])),
        if (info.site != null) PopupMenuItem(value: 'site', child: Row(children: [const Icon(Icons.language, size: 16), const SizedBox(width: 10), Text(s.mobVisitSite)])),
      ],
    );
    if (r == 'open' && context.mounted) _open(context);
    if (r == 'site') launchUrl(Uri.parse(info.site!), mode: LaunchMode.externalApplication);
  }

  void _open(BuildContext context) => Navigator.of(context).push(MaterialPageRoute(builder: (ctx) => module!.build(ctx, account)));

  @override
  Widget build(BuildContext context) {
    final s = MtStrings.of(context);
    final c = MtColors.of(context);
    final on = info.enabled && module != null;
    final soon = info.enabled && module is PlaceholderModule;
    final iconSize = phone ? 64.0 : MtDim.tileIcon;
    return Material(
      color: Colors.transparent,
      child: InkWell(
        borderRadius: BorderRadius.circular(MtDim.radiusTile),
        onTap: on ? () => _open(context) : null,
        onLongPress: () => _menu(context, const Offset(100, 200)),
        child: Container(
          constraints: BoxConstraints(minHeight: phone ? 196 : MtDim.tileMinH),
          padding: EdgeInsets.fromLTRB(14, phone ? 16 : 20, 14, 16),
          decoration: BoxDecoration(gradient: c.cardGrad, borderRadius: BorderRadius.circular(MtDim.radiusTile), border: Border.all(color: c.border)),
          child: Stack(children: [
            if (on) PositionedDirectional(top: 0, end: 0, child: Container(width: 8, height: 8, decoration: BoxDecoration(color: c.ok, shape: BoxShape.circle,
                boxShadow: [BoxShadow(color: c.ok.withValues(alpha: .18), spreadRadius: 3)]))),
            Column(mainAxisAlignment: MainAxisAlignment.center, children: [
              SizedBox(height: phone ? 84 : MtDim.tileIconWrap, child: Center(child: AppIcon(info.app, size: iconSize, dim: !info.enabled))),
              const SizedBox(height: 6),
              Text(info.name, textAlign: TextAlign.center, style: MtText.tileName.copyWith(color: info.enabled ? c.text : c.text2)),
              const SizedBox(height: 4),
              if (!info.enabled)
                Row(mainAxisSize: MainAxisSize.min, children: [Icon(Icons.lock_outline, size: 13, color: c.text3), const SizedBox(width: 4), Text(s.mobDisabled, style: MtText.small.copyWith(color: c.text3))])
              else if (soon)
                Text(s.mobSoon, style: MtText.small.copyWith(color: c.warn, fontWeight: FontWeight.w600))
              else
                Text(s.mobTapToOpen, style: MtText.small.copyWith(color: c.text2)),
              if (info.description != null && info.description!.isNotEmpty) ...[
                const SizedBox(height: 8),
                ConstrainedBox(constraints: const BoxConstraints(maxWidth: 200), child: Text(info.description!, textAlign: TextAlign.center, maxLines: 2,
                    overflow: TextOverflow.ellipsis, style: MtText.tiny.copyWith(color: c.text2, height: 1.4))),
              ],
            ]),
          ]),
        ),
      ),
    );
  }
}
