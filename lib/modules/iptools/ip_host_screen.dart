// Cihaz ayrıntıları — masaüstü ayrıntı penceresi: başlık (ad ya da IP), alan listesi (IP, Ad, mDNS, MAC, Üretici, Yanıt, Durum,
// Canlılık), "Servisler" kartları (grup simgesi + ad + port; Karşılama / Başlık / Sunucu / Sertifika / Veren / Geçerlilik sonu).
// Her alan uzun basışla kopyalanır. Eylemler: tarayıcıda aç (web/yazıcı), adresi kopyala, SSH varsa "SSH Master'da aç"
// (CrossLinks.openSsh kayıtlıysa SSH Master bağlantı formu host/port dolu açılır; değilse adres panoya + toast).
// Geniş ekranda pencere (dialog), telefonda tam sayfa.
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../core/cross_links.dart';
import '../../core/l10n/gen/mt_strings.dart';
import '../../core/theme.dart';
import '../../widgets/mt_widgets.dart';
import 'ip_actions.dart';
import 'ip_ports.dart';
import 'ip_probe.dart';
import 'ip_widgets.dart';

Future<void> showHostDetails(BuildContext context, ScanHost host) {
  if (MtBreak.wide(context)) {
    return showDialog(context: context, builder: (_) => Dialog(
        backgroundColor: MtColors.of(context).surface, shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(MtDim.radiusModal)),
        child: ConstrainedBox(constraints: const BoxConstraints(maxWidth: 620, maxHeight: 720), child: IpHostScreen(host: host, dialog: true))));
  }
  return Navigator.of(context).push(MaterialPageRoute(builder: (_) => IpHostScreen(host: host)));
}

Future<void> runHostAction(BuildContext context, HostAction a) async {
  final s = MtStrings.of(context);
  if (a.kind == ActionKind.open) {
    final ok = await launchUrl(Uri.parse(a.target), mode: LaunchMode.externalApplication);
    if (context.mounted) mtToast(context, ok ? s.ipTagOpened(a.text) : s.ipTagFailed, type: ok ? '' : 'err');
  } else {
    await Clipboard.setData(ClipboardData(text: a.target));
    if (context.mounted) mtToast(context, s.ipTagCopied(a.text), type: 'ok');
  }
}

String statusText(MtStrings s, String st) => switch (st) { 'new' => s.ipStatusNew, 'gone' => s.ipStatusGone, 'live' => s.ipStatusLive, _ => s.ipStatusSame };

String aliveText(MtStrings s, String a) => switch (a) { 'ping' => s.ipStatusAlivePing, 'arp' => s.ipStatusAliveArp, 'name' => s.ipMobAliveName, _ => s.ipMobAliveTcp };

class IpHostScreen extends StatelessWidget {
  const IpHostScreen({super.key, required this.host, this.dialog = false});
  final ScanHost host;
  final bool dialog;

  Future<void> _copy(BuildContext context, String v) async {
    await Clipboard.setData(ClipboardData(text: v));
    if (context.mounted) mtToast(context, MtStrings.of(context).ipTagCopied(v), type: 'ok');
  }

  @override
  Widget build(BuildContext context) {
    final s = MtStrings.of(context);
    final c = MtColors.of(context);
    final h = host;
    final title = h.displayName ?? h.ip;
    final web = h.ports.where((p) => p.group == 'web' || p.group == 'printer').firstOrNull;
    final ssh = h.ports.where((p) => p.group == 'ssh').firstOrNull;
    KvRow kv(String k, String? v, {bool muted = false}) => KvRow(k, v ?? '—', muted: muted || v == null, onLongPress: v == null ? null : () => _copy(context, v));

    final body = ListView(padding: const EdgeInsets.fromLTRB(22, 14, 22, 20), children: [
      kv(s.ipColIp, h.ip),
      kv(s.ipColName, h.name, muted: h.name == null),
      kv('mDNS', h.mdns),
      KvRow(s.ipColMac, h.mac ?? s.ipMobMacMobile, muted: h.mac == null, onLongPress: h.mac == null ? null : () => _copy(context, h.mac!)),
      KvRow(s.ipColVendor, h.vendor ?? (h.localMac ? s.ipHostLocalMac : s.ipMobMacMobile), muted: h.vendor == null),
      kv(s.ipColRtt, fmtRtt(h.rttMs)),
      if (h.ttl != null) kv('TTL', h.ttl.toString()),
      kv(s.ipColStatus, statusText(s, h.status)),
      kv(s.ipHostAlive, aliveText(s, h.alive)),
      const SizedBox(height: 14),
      Text(s.ipColServices, style: MtText.h2.copyWith(color: c.text, fontSize: 15)),
      const SizedBox(height: 10),
      if (h.ports.isEmpty) Text(s.ipHostNoServices, style: MtText.small.copyWith(color: c.text3))
      else
        for (final p in h.ports) ...[
          Container(
            padding: const EdgeInsets.fromLTRB(14, 10, 14, 10),
            decoration: BoxDecoration(color: c.bg2, borderRadius: BorderRadius.circular(MtDim.radiusSm), border: Border.all(color: c.border)),
            child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              Row(children: [
                Icon(groupIcon(p.group), size: 14, color: kGroupColorOf(p.group, c)),
                const SizedBox(width: 8),
                Text('${p.name} ${p.port}', style: MtText.body.copyWith(color: c.text, fontWeight: FontWeight.w700)),
                const Spacer(),
                MtIconButton(icon: actionFor(p.group, h.ip, p.port).kind == ActionKind.open ? Icons.open_in_new : Icons.copy_outlined, size: 22,
                    onPressed: () => runHostAction(context, actionFor(p.group, h.ip, p.port))),
              ]),
              if (p.banner != null) kv(s.ipHostBanner, p.banner),
              if (p.title != null) kv(s.ipHostTitle, p.title),
              if (p.server != null) kv(s.ipHostServer, p.server),
              if (p.tls?.cn != null || p.tls?.org != null) kv(s.ipHostCert, [p.tls!.cn, p.tls!.org].whereType<String>().join(' · ')),
              if (p.tls?.issuer != null) kv(s.ipHostCertIssuer, p.tls!.selfSigned ? '${p.tls!.issuer} (${s.ipHostSelfSigned})' : p.tls!.issuer),
              if (p.tls?.notAfter != null) kv(s.ipHostCertExpires, _fmtIso(p.tls!.notAfter!)),
            ]),
          ),
          const SizedBox(height: 8),
        ],
    ]);

    final actions = Wrap(spacing: 8, runSpacing: 8, children: [
      if (web != null) MtButton(label: s.ipCtxOpenWeb, icon: Icons.open_in_new, small: true, onPressed: () => runHostAction(context, actionFor(web.group, h.ip, web.port))),
      MtButton(label: s.ipMobCopyAddress, icon: Icons.copy_outlined, small: true, onPressed: () => _copy(context, h.ip)),
      if (ssh != null) MtButton(label: s.ipMobOpenInSsh, icon: Icons.terminal, small: true, kind: MtBtnKind.primary, onPressed: () async {
        final openSsh = CrossLinks.openSsh;
        if (openSsh != null) return openSsh(context, host: h.ip, port: ssh.port);
        await Clipboard.setData(ClipboardData(text: h.ip));
        if (context.mounted) mtToast(context, s.ipTagCopied(h.ip), sub: s.ipMobOpenInSshNote, type: 'ok');
      }),
    ]);

    final head = Row(children: [
      Icon(Icons.devices_other_outlined, size: 18, color: c.accent),
      const SizedBox(width: 8),
      Expanded(child: Text(title, maxLines: 1, overflow: TextOverflow.ellipsis, style: MtText.h2.copyWith(color: c.text))),
      StatusDot(h.status),
    ]);

    if (dialog) {
      return Column(mainAxisSize: MainAxisSize.min, children: [
        Padding(padding: const EdgeInsets.fromLTRB(22, 18, 22, 6), child: head),
        Flexible(child: body),
        Container(
          padding: const EdgeInsets.fromLTRB(22, 12, 22, 16),
          decoration: BoxDecoration(border: Border(top: BorderSide(color: c.border))),
          child: Row(children: [Expanded(child: actions), const SizedBox(width: 8), MtButton(label: s.commonOk, onPressed: () => Navigator.of(context).pop())]),
        ),
      ]);
    }
    return Scaffold(
      backgroundColor: c.surface,
      appBar: AppBar(backgroundColor: c.surface, title: head),
      body: SafeArea(child: Column(children: [
        Expanded(child: body),
        Container(padding: const EdgeInsets.fromLTRB(22, 12, 22, 16), decoration: BoxDecoration(border: Border(top: BorderSide(color: c.border))), child: actions),
      ])),
    );
  }

  static String _fmtIso(String iso) {
    final d = DateTime.tryParse(iso);
    return d == null ? iso : fmtTime(d.toLocal().millisecondsSinceEpoch);
  }
}

Color kGroupColorOf(String g, MtColors c) => kGroupColors[g] ?? c.accent;
