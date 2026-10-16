// IP Tools ortak parçaları — masaüstü app.css: servis hapı (.svc / .g-*), durum noktası (.dot), kalıcı uyarı şeridi (.notice-bar),
// filtre çipleri (.chip), kayıt avatarı (.avatar), grup simgeleri.
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../../core/l10n/gen/mt_strings.dart';
import '../../core/theme.dart';
import 'ip_ports.dart';
import 'ip_probe.dart';

IconData groupIcon(String g) => switch (g) {
      'web' => Icons.language, 'ssh' => Icons.terminal, 'ftp' => Icons.folder_outlined, 'rdp' => Icons.desktop_windows_outlined,
      'smb' => Icons.share_outlined, 'db' => Icons.storage_outlined, 'printer' => Icons.print_outlined, 'vnc' => Icons.monitor_outlined,
      'camera' => Icons.videocam_outlined, _ => Icons.settings_ethernet };

String groupLabel(MtStrings s, String g) => switch (g) {
      'web' => s.ipTagGroupWeb, 'ssh' => s.ipTagGroupSsh, 'ftp' => s.ipTagGroupFtp, 'rdp' => s.ipTagGroupRdp, 'smb' => s.ipTagGroupSmb,
      'db' => s.ipTagGroupDb, 'printer' => s.ipTagGroupPrinter, 'vnc' => s.ipTagGroupVnc, 'camera' => s.ipTagGroupCamera, _ => g };

String fmtTime(int ms) => DateFormat('dd.MM.yyyy HH:mm').format(DateTime.fromMillisecondsSinceEpoch(ms));

String fmtRtt(double? ms) => ms == null ? '—' : '${ms < 1 ? '<1' : ms.round()} ms';

/// .svc — 24 px hap, grup rengi %12 zemin, %45 kenarlık, 12 px simge
class ServiceChip extends StatelessWidget {
  const ServiceChip({super.key, required this.hit, this.onTap, this.dim = false, this.port = false});
  final PortHit hit;
  final VoidCallback? onTap;
  final bool dim, port;
  @override
  Widget build(BuildContext context) {
    final c = MtColors.of(context);
    final g = kGroupColors[hit.group] ?? c.accent;
    return Opacity(
      opacity: dim ? .5 : 1,
      child: Material(
        color: g.withValues(alpha: .12), borderRadius: BorderRadius.circular(12),
        child: InkWell(
          borderRadius: BorderRadius.circular(12), onTap: onTap,
          child: Container(
            height: 24, padding: const EdgeInsets.symmetric(horizontal: 9),
            decoration: BoxDecoration(borderRadius: BorderRadius.circular(12), border: Border.all(color: g.withValues(alpha: .45))),
            child: Row(mainAxisSize: MainAxisSize.min, children: [
              Icon(groupIcon(hit.group), size: 12, color: g),
              const SizedBox(width: 5),
              Text(port ? '${hit.name} ${hit.port}' : hit.name, style: TextStyle(fontSize: 11.5, color: c.text, fontWeight: port ? FontWeight.w700 : FontWeight.w400)),
            ]),
          ),
        ),
      ),
    );
  }
}

/// .dot — 9 px; ok / new (accent, halka) / gone (err) / live (warn)
class StatusDot extends StatelessWidget {
  const StatusDot(this.status, {super.key});
  final String status;
  @override
  Widget build(BuildContext context) {
    final c = MtColors.of(context);
    final col = switch (status) { 'new' => c.accent, 'gone' => c.err, 'live' => c.warn, _ => c.ok };
    return Container(width: 9, height: 9, decoration: BoxDecoration(shape: BoxShape.circle, color: col,
        boxShadow: status == 'new' ? [BoxShadow(color: c.accent.withValues(alpha: .22), spreadRadius: 3)] : null));
  }
}

/// Kalıcı uyarı şeridi: "Yalnız sahibi olduğunuz ya da yetkili olduğunuz ağları tarayın." (+ isteğe bağlı sağ düğme)
class NoticeBar extends StatelessWidget {
  const NoticeBar({super.key, this.trailing, this.short = false});
  final Widget? trailing;
  final bool short;
  @override
  Widget build(BuildContext context) {
    final s = MtStrings.of(context);
    final c = MtColors.of(context);
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 7),
      decoration: BoxDecoration(color: c.warn.withValues(alpha: .08), border: Border(top: BorderSide(color: c.warn.withValues(alpha: .35)))),
      child: Row(children: [
        Icon(Icons.shield_outlined, size: 14, color: c.warn),
        const SizedBox(width: 8),
        Expanded(child: Text(short ? s.ipNoticeShort : s.ipNoticeText, maxLines: 2, overflow: TextOverflow.ellipsis, style: MtText.small.copyWith(color: c.text2))),
        if (trailing != null) ...[const SizedBox(width: 8), trailing!],
      ]),
    );
  }
}

/// .chip — filtre çipi (Tümü 12 · Yeni 1 · …)
class FilterChipMt extends StatelessWidget {
  const FilterChipMt({super.key, required this.label, required this.count, required this.on, required this.onTap, this.tone});
  final String label;
  final int count;
  final bool on;
  final VoidCallback onTap;
  final Color? tone;
  @override
  Widget build(BuildContext context) {
    final c = MtColors.of(context);
    final t = tone ?? c.accent;
    return Material(
      color: on ? t.withValues(alpha: .1) : c.surface2, borderRadius: BorderRadius.circular(20),
      child: InkWell(
        borderRadius: BorderRadius.circular(20), onTap: onTap,
        child: Container(
          height: 26, padding: const EdgeInsets.symmetric(horizontal: 10),
          decoration: BoxDecoration(borderRadius: BorderRadius.circular(20), border: Border.all(color: on ? t : c.border)),
          child: Row(mainAxisSize: MainAxisSize.min, children: [
            Text(label, style: TextStyle(fontSize: 12, color: on ? c.text : c.text2)),
            const SizedBox(width: 6),
            Text('$count', style: TextStyle(fontSize: 12, fontWeight: FontWeight.w700, color: (on ? c.text : c.text2).withValues(alpha: .8))),
          ]),
        ),
      ),
    );
  }
}

/// .avatar — kayıt simgesi (renk %18 zemin)
class RecordAvatar extends StatelessWidget {
  const RecordAvatar({super.key, required this.color, this.size = 40, this.icon = Icons.wifi});
  final Color color;
  final double size;
  final IconData icon;
  @override
  Widget build(BuildContext context) => Container(width: size, height: size,
      decoration: BoxDecoration(color: color.withValues(alpha: .18), borderRadius: BorderRadius.circular(size * .3)), child: Icon(icon, size: size * .5, color: color));
}

/// Anahtar – değer satırı (ayrıntı penceresi): etiket text-2 12, değer mono
class KvRow extends StatelessWidget {
  const KvRow(this.k, this.v, {super.key, this.muted = false, this.onLongPress});
  final String k, v;
  final bool muted;
  final VoidCallback? onLongPress;
  @override
  Widget build(BuildContext context) {
    final c = MtColors.of(context);
    return InkWell(
      onLongPress: onLongPress,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 3),
        child: Row(crossAxisAlignment: CrossAxisAlignment.start, children: [
          SizedBox(width: 104, child: Text(k, style: MtText.small.copyWith(color: c.text2))),
          Expanded(child: SelectableText(v, style: MtText.mono.copyWith(color: muted ? c.text3 : c.text, fontSize: 12.5))),
        ]),
      ),
    );
  }
}
