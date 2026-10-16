// Tarama ekranı — masaüstü sağ panel (.results): başlık (avatar, ad, "aralık · Son tarama"), Tara / Durdur, Dışa aktar (CSV / JSON),
// düzenle; ilerleme çubuğu + "Servisler deneniyor · 61/84 · 6 cihaz bulundu"; filtre çipleri Tümü / Yeni / Kaybolan / Servisli;
// cihaz listesi (durum noktası, IP mono, ad / "(ad çözülemedi)", yanıt, servis hapları); boş durumlar. Satıra dokunma → ayrıntı;
// uzun basma → IP / ad kopyala, tarayıcıda aç. Telefonda tam sayfa (embedded=false), tablette sağ panel (embedded=true).
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:path_provider/path_provider.dart';
import 'package:share_plus/share_plus.dart';

import '../../core/l10n/gen/mt_strings.dart';
import '../../core/sync.dart';
import '../../core/theme.dart';
import '../../widgets/mt_widgets.dart';
import 'ip_actions.dart';
import 'ip_host_screen.dart';
import 'ip_model.dart';
import 'ip_probe.dart';
import 'ip_settings_screen.dart';
import 'ip_store.dart';
import 'ip_widgets.dart';

/// "Yalnız yetkili olduğunuz ağ" onayı alınmamışsa pencere; kabulde true
Future<bool> ensureNotice(BuildContext context, IpScanStore store) async {
  if (await store.noticeAccepted()) return true;
  if (!context.mounted) return false;
  final s = MtStrings.of(context);
  final c = MtColors.of(context);
  final ok = await showDialog<bool>(
    context: context,
    builder: (ctx) => AlertDialog(
      title: Row(children: [Icon(Icons.shield_outlined, size: 18, color: c.warn), const SizedBox(width: 8), Text(s.ipNoticeTitle)]),
      content: ConstrainedBox(constraints: const BoxConstraints(maxWidth: 420), child: Column(mainAxisSize: MainAxisSize.min, crossAxisAlignment: CrossAxisAlignment.start, children: [
        Text(s.ipNoticeBody, style: MtText.body.copyWith(height: 1.45)),
        const SizedBox(height: 10),
        Text(s.ipNoticeLimits, style: MtText.small.copyWith(color: c.text2, height: 1.45)),
      ])),
      actionsPadding: const EdgeInsets.fromLTRB(22, 0, 22, 18),
      actions: [MtButton(label: s.commonCancel, onPressed: () => Navigator.pop(ctx, false)), MtButton(label: s.ipNoticeAccept, kind: MtBtnKind.primary, onPressed: () => Navigator.pop(ctx, true))],
    ),
  );
  if (ok == true) await store.acceptNotice();
  return ok == true;
}

/// Taramayı başlatır; engel varsa toast
Future<void> startScan(BuildContext context, IpScanService scans, SyncEngine engine, IpRecord rec) async {
  final s = MtStrings.of(context);
  if (!await ensureNotice(context, scans.store)) return;
  final settings = scanSettingsOf(engine.library.items['settings']?.$2);
  final r = await scans.start(rec, settings);
  if (!context.mounted || r == null) return;
  if (r == 'busy') {
    mtToast(context, s.ipScanBusy, type: 'err');
  } else if (r.startsWith('rate:')) {
    mtToast(context, s.ipScanRateLimited(r.substring(5)), type: 'err');
  } else {
    mtToast(context, s.ipScanFailed(s.ipRangeErrEmpty), type: 'err');
  }
}

class IpScanPanel extends StatefulWidget {
  const IpScanPanel({super.key, required this.record, required this.engine, required this.scans, this.embedded = false, this.onEdit});
  final IpRecord record;
  final SyncEngine engine;
  final IpScanService scans;
  final bool embedded;
  final VoidCallback? onEdit;
  @override
  State<IpScanPanel> createState() => _IpScanPanelState();
}

class _IpScanPanelState extends State<IpScanPanel> {
  String _filter = 'all';
  String? _lastActive;

  IpScanStore get store => widget.scans.store;

  @override
  void initState() {
    super.initState();
    widget.scans.addListener(_onScan);
    store.addListener(_refresh);
    store.read(widget.record.id);
  }

  @override
  void didUpdateWidget(IpScanPanel old) {
    super.didUpdateWidget(old);
    if (old.record.id != widget.record.id) {
      _filter = 'all';
      store.read(widget.record.id);
    }
  }

  @override
  void dispose() {
    widget.scans.removeListener(_onScan);
    store.removeListener(_refresh);
    super.dispose();
  }

  void _refresh() { if (mounted) setState(() {}); }

  void _onScan() {
    if (!mounted) return;
    final s = MtStrings.of(context);
    final active = widget.scans.activeRecordId;
    if (_lastActive == widget.record.id && active == null) {
      final last = store.cached(widget.record.id)?.last;
      if (widget.scans.lastError != null) {
        mtToast(context, s.ipScanFailed(widget.scans.lastError!), type: 'err');
      } else if (last != null) {
        mtToast(context, last.stopped ? s.ipScanStopped : s.ipScanDone(last.liveCount.toString()), sub: last.newCount > 0 ? s.ipRecNewDevices(last.newCount.toString()) : null, type: 'ok');
      }
    }
    _lastActive = active;
    setState(() {});
  }

  Future<void> _export(String fmt) async {
    final s = MtStrings.of(context);
    final last = store.cached(widget.record.id)?.last;
    if (last == null) return;
    final name = widget.record.name.replaceAll(RegExp(r'[^\w\-]+'), '_');
    final f = File('${(await getTemporaryDirectory()).path}/ip-tools-$name.$fmt');
    await f.writeAsString(fmt == 'csv' ? toCsv(last) : toJsonExport(last), flush: true);
    await SharePlus.instance.share(ShareParams(files: [XFile(f.path)], subject: '${widget.record.name} — IP Tools'));
    if (mounted) mtToast(context, s.ipScanExported, type: 'ok');
  }

  Future<void> _rowMenu(ScanHost h, Offset pos) async {
    final s = MtStrings.of(context);
    final web = h.ports.where((p) => p.group == 'web' || p.group == 'printer').firstOrNull;
    Widget mi(IconData i, String t) => Row(children: [Icon(i, size: 16), const SizedBox(width: 10), Text(t)]);
    final r = await showMenu<String>(context: context, position: RelativeRect.fromLTRB(pos.dx, pos.dy, pos.dx, pos.dy), items: [
      PopupMenuItem(value: 'details', child: mi(Icons.info_outline, s.ipHostDetails)),
      PopupMenuItem(value: 'ip', child: mi(Icons.copy_outlined, s.ipCtxCopyIp)),
      if (h.displayName != null) PopupMenuItem(value: 'name', child: mi(Icons.copy_outlined, s.ipCtxCopyName)),
      if (web != null) PopupMenuItem(value: 'web', child: mi(Icons.open_in_new, s.ipCtxOpenWeb)),
    ]);
    if (!mounted || r == null) return;
    switch (r) {
      case 'details': await showHostDetails(context, h);
      case 'ip': await Clipboard.setData(ClipboardData(text: h.ip)); if (mounted) mtToast(context, s.ipTagCopied(h.ip), type: 'ok');
      case 'name': await Clipboard.setData(ClipboardData(text: h.displayName!)); if (mounted) mtToast(context, s.ipTagCopied(h.displayName!), type: 'ok');
      case 'web': await runHostAction(context, actionFor(web!.group, h.ip, web.port));
    }
  }

  @override
  Widget build(BuildContext context) {
    final s = MtStrings.of(context);
    final c = MtColors.of(context);
    final rec = widget.record;
    final wide = MtBreak.wide(context);
    final scanning = widget.scans.isScanning(rec.id);
    final prog = scanning ? widget.scans.progress : null;
    final stored = store.cached(rec.id);
    final last = stored?.last;
    // Tarama sürerken canlı liste; bitince kayıtlı sonuç
    final hosts = scanning ? (prog?.hosts ?? const <ScanHost>[]).map((h) => h.copyWith(status: 'live')).toList() : (last?.hosts ?? const <ScanHost>[]);
    final counts = {
      'all': hosts.length, 'new': hosts.where((h) => h.status == 'new').length, 'gone': hosts.where((h) => h.status == 'gone').length,
      'services': hosts.where((h) => h.ports.isNotEmpty).length,
    };
    final shown = switch (_filter) {
      'new' => hosts.where((h) => h.status == 'new'), 'gone' => hosts.where((h) => h.status == 'gone'), 'services' => hosts.where((h) => h.ports.isNotEmpty), _ => hosts,
    }.toList();
    final phase = switch (prog?.phase) { 'names' => s.ipScanPhaseNames, 'ping' => s.ipScanPhasePing, _ => s.ipScanPhasePorts };

    final head = Padding(
      padding: const EdgeInsets.fromLTRB(22, 16, 22, 10),
      child: Row(children: [
        RecordAvatar(color: rec.colorValue, icon: scanning ? Icons.radar : Icons.wifi),
        const SizedBox(width: 12),
        Expanded(child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Text(rec.name, maxLines: 1, overflow: TextOverflow.ellipsis, style: const TextStyle(fontSize: 17, fontWeight: FontWeight.w700)),
          const SizedBox(height: 2),
          Text('${rec.rangeSummary} · ${last == null ? s.ipRecNever : s.ipRecLastScan(fmtTime(last.finishedAt))}', maxLines: 1, overflow: TextOverflow.ellipsis,
              textDirection: TextDirection.ltr, style: MtText.mono.copyWith(color: c.text2)),
        ])),
        const SizedBox(width: 8),
        if (scanning)
          MtButton(label: s.ipScanStop, icon: Icons.stop_circle_outlined, kind: MtBtnKind.danger, onPressed: widget.scans.stop)
        else
          MtButton(label: wide ? s.ipScanScan : '', icon: Icons.play_arrow, kind: MtBtnKind.primary, onPressed: () => startScan(context, widget.scans, widget.engine, rec)),
        const SizedBox(width: 8),
        PopupMenuButton<String>(
          enabled: last != null,
          tooltip: s.ipScanExport,
          onSelected: _export,
          itemBuilder: (_) => [
            PopupMenuItem(value: 'csv', child: Row(children: [const Icon(Icons.table_chart_outlined, size: 16), const SizedBox(width: 10), Text(s.ipScanExportCsv)])),
            PopupMenuItem(value: 'json', child: Row(children: [const Icon(Icons.data_object, size: 16), const SizedBox(width: 10), Text(s.ipScanExportJson)])),
          ],
          child: IgnorePointer(child: MtButton(label: wide ? s.ipScanExport : '', icon: Icons.ios_share, onPressed: last == null ? null : () {})),
        ),
        if (widget.onEdit != null) ...[const SizedBox(width: 4), MtIconButton(icon: Icons.edit_outlined, tooltip: s.ipRecEdit, onPressed: widget.onEdit)],
      ]),
    );

    final progress = scanning
        ? Padding(
            padding: const EdgeInsets.fromLTRB(22, 0, 22, 8),
            child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              ClipRRect(borderRadius: BorderRadius.circular(3), child: LinearProgressIndicator(minHeight: 6, value: prog == null || prog.total == 0 ? null : (prog.done / prog.total).clamp(0, 1).toDouble())),
              const SizedBox(height: 6),
              Row(children: [
                MtSpinner(size: 12, color: c.accent),
                const SizedBox(width: 8),
                Expanded(child: Text('$phase · ${s.ipScanProgress((prog?.done ?? 0).toString(), (prog?.total ?? 0).toString())} · ${s.ipScanFound((prog?.found ?? 0).toString())}',
                    style: MtText.small.copyWith(color: c.text2))),
              ]),
            ]),
          )
        : const SizedBox.shrink();

    final bar = Container(
      padding: const EdgeInsets.fromLTRB(22, 4, 22, 10),
      decoration: BoxDecoration(border: Border(bottom: BorderSide(color: c.border))),
      child: Row(children: [
        Expanded(child: Wrap(spacing: 6, runSpacing: 6, children: [
          FilterChipMt(label: s.ipScanFilterAll, count: counts['all']!, on: _filter == 'all', onTap: () => setState(() => _filter = 'all')),
          FilterChipMt(label: s.ipScanFilterNew, count: counts['new']!, on: _filter == 'new', onTap: () => setState(() => _filter = 'new')),
          FilterChipMt(label: s.ipScanFilterGone, count: counts['gone']!, on: _filter == 'gone', tone: c.err, onTap: () => setState(() => _filter = 'gone')),
          FilterChipMt(label: s.ipScanFilterServices, count: counts['services']!, on: _filter == 'services', onTap: () => setState(() => _filter = 'services')),
        ])),
        if (wide) ...[
          const SizedBox(width: 12),
          Icon(Icons.shield_outlined, size: 13, color: c.warn),
          const SizedBox(width: 6),
          Text(s.ipNoticeShort, style: MtText.small.copyWith(color: c.text3)),
        ],
      ]),
    );

    Widget list;
    if (hosts.isEmpty && !scanning) {
      list = Center(child: Padding(padding: const EdgeInsets.all(28), child: Column(mainAxisSize: MainAxisSize.min, children: [
        Icon(Icons.radar, size: 44, color: c.text3),
        const SizedBox(height: 12),
        Text(s.ipScanEmptyTitle, style: MtText.h2.copyWith(color: c.text)),
        const SizedBox(height: 6),
        ConstrainedBox(constraints: const BoxConstraints(maxWidth: 360), child: Text(s.ipScanEmptyBody, textAlign: TextAlign.center, style: MtText.small.copyWith(color: c.text3, height: 1.45))),
      ])));
    } else if (shown.isEmpty) {
      list = Center(child: Padding(padding: const EdgeInsets.all(28), child: Text(s.ipScanNoMatch, style: MtText.small.copyWith(color: c.text3))));
    } else {
      list = ListView.separated(
        padding: const EdgeInsets.only(bottom: 24),
        itemCount: shown.length,
        separatorBuilder: (_, _) => Divider(height: 1, color: c.border.withValues(alpha: .6)),
        itemBuilder: (_, i) => _HostRow(host: shown[i], wide: wide, onTap: () => showHostDetails(context, shown[i]), onMenu: (p) => _rowMenu(shown[i], p),
            onService: (p) => runHostAction(context, actionFor(p.group, shown[i].ip, p.port))),
      );
    }

    final hist = stored?.history ?? const <ScanHistoryEntry>[];
    final content = Column(crossAxisAlignment: CrossAxisAlignment.stretch, children: [
      head, progress, bar,
      Expanded(child: list),
      if (hist.length > 1 && !scanning)
        Container(
          padding: const EdgeInsets.fromLTRB(22, 6, 22, 8),
          decoration: BoxDecoration(border: Border(top: BorderSide(color: c.border))),
          child: SingleChildScrollView(scrollDirection: Axis.horizontal, child: Row(children: [
            Icon(Icons.history, size: 13, color: c.text3), const SizedBox(width: 6),
            for (final e in hist.take(6)) Padding(padding: const EdgeInsets.only(right: 12), child: Text('${fmtTime(e.at)}  ${s.ipRecDevices(e.found.toString())}${e.added > 0 ? ' · ${s.ipRecNewDevices(e.added.toString())}' : ''}',
                style: MtText.tiny.copyWith(color: c.text3))),
          ])),
        ),
    ]);

    if (widget.embedded) return content;
    return Scaffold(
      appBar: AppBar(
        title: Row(children: [AppIcon('ip', size: 26), const SizedBox(width: 10), Text('IP Tools', style: MtText.brand.copyWith(color: c.text))]),
        actions: [MtIconButton(icon: Icons.settings_outlined, tooltip: s.setTitle, onPressed: () => Navigator.of(context).push(MaterialPageRoute(builder: (_) => IpSettingsScreen(engine: widget.engine)))), const SizedBox(width: 8)],
      ),
      body: SafeArea(child: Column(children: [Expanded(child: content), const NoticeBar()])),
    );
  }
}

class _HostRow extends StatelessWidget {
  const _HostRow({required this.host, required this.wide, required this.onTap, required this.onMenu, required this.onService});
  final ScanHost host;
  final bool wide;
  final VoidCallback onTap;
  final ValueChanged<Offset> onMenu;
  final ValueChanged<PortHit> onService;
  @override
  Widget build(BuildContext context) {
    final s = MtStrings.of(context);
    final c = MtColors.of(context);
    final gone = host.status == 'gone';
    final ipStyle = MtText.mono.copyWith(fontSize: 13, color: host.status == 'new' ? c.accent : gone ? c.text3 : c.text);
    final name = host.displayName;
    final nameW = Text(name ?? s.ipHostUnknown, maxLines: 1, overflow: TextOverflow.ellipsis, style: MtText.body.copyWith(color: name == null || gone ? c.text3 : c.text));
    final rtt = Text(fmtRtt(host.rttMs), style: MtText.small.copyWith(color: c.text2));
    final chips = Wrap(spacing: 4, runSpacing: 4, children: [for (final p in host.ports) ServiceChip(hit: p, dim: gone, onTap: () => onService(p))]);
    return GestureDetector(
      onLongPressStart: (d) => onMenu(d.globalPosition),
      onSecondaryTapDown: (d) => onMenu(d.globalPosition),
      child: InkWell(
        onTap: onTap,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 22, vertical: 9),
          child: wide
              ? Row(children: [
                  StatusDot(host.status), const SizedBox(width: 14),
                  SizedBox(width: 128, child: Text(host.ip, style: ipStyle)),
                  Expanded(flex: 3, child: nameW),
                  SizedBox(width: 64, child: rtt),
                  Expanded(flex: 4, child: chips),
                ])
              : Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                  Row(children: [
                    StatusDot(host.status), const SizedBox(width: 10),
                    Text(host.ip, style: ipStyle), const SizedBox(width: 10),
                    Expanded(child: nameW), const SizedBox(width: 8), rtt,
                  ]),
                  if (host.ports.isNotEmpty) ...[const SizedBox(height: 6), Padding(padding: const EdgeInsets.only(left: 19), child: chips)],
                ]),
        ),
      ),
    );
  }
}
