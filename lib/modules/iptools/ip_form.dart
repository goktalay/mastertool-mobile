// IP Tools kayıt formu — masaüstü "Yeni kayıt" penceresi: Ad + Renk (kCardColors) · IP aralığı (çok satırlı, mono; canlı doğrulama:
// "$n adres taranacak" ya da hata kutusu masaüstü metinleriyle) · Klasör. "Bu cihazın ağı" düğmesi Wi‑Fi alt ağını önerir
// (network_info_plus). İlk açılışta "yalnız yetkili olduğunuz ağ" kalıcı uyarı kutusu (noticeAccepted yerel). Alt: İptal · Kaydet ·
// "Bu ağı tara" (kaydet + tara).
import 'package:flutter/material.dart';
import 'package:network_info_plus/network_info_plus.dart';

import '../../core/l10n/gen/mt_strings.dart';
import '../../core/theme.dart';
import '../../widgets/mt_widgets.dart';
import '../ssh/ssh_model.dart' show kCardColors, parseHex;
import 'ip_model.dart';
import 'ip_ranges.dart';
import 'ip_store.dart';

String rangeErrorText(MtStrings s, IpRangeError e) => switch (e.code) {
      'empty' => s.ipRangeErrEmpty, 'ipv6' => s.ipRangeErrIpv6(e.token), 'reversed' => s.ipRangeErrReversed(e.token),
      'too_many' => s.ipRangeErrTooMany(e.token), 'not_private' => s.ipRangeErrNotPrivate(e.token), _ => s.ipRangeErrInvalid(e.token) };

class IpFormScreen extends StatefulWidget {
  const IpFormScreen({super.key, this.existing, required this.folders, this.folderId, this.store});
  final IpRecord? existing;
  final List<(String, String)> folders;
  final String? folderId;
  final IpScanStore? store;
  @override
  State<IpFormScreen> createState() => _IpFormScreenState();
}

class _IpFormScreenState extends State<IpFormScreen> {
  late final Map<String, dynamic> d = widget.existing != null ? Map<String, dynamic>.from(widget.existing!.raw) : IpRecord.blank();
  late final _name = TextEditingController(text: (d['name'] ?? '').toString());
  late final _range = TextEditingController(text: (d['range'] ?? '').toString());
  late String? _folder = widget.folderId;
  late String _color = (d['color'] ?? '#22d3ee').toString();
  bool _notice = false, _suggesting = false;

  @override
  void initState() {
    super.initState();
    _range.addListener(() => setState(() {}));
    widget.store?.noticeAccepted().then((v) {
      if (mounted && !v) setState(() => _notice = true);
    });
  }

  @override
  void dispose() {
    _name.dispose();
    _range.dispose();
    super.dispose();
  }

  Map<String, dynamic>? _collect(MtStrings s) {
    final r = parseRanges(_range.text);
    if (!r.ok) {
      mtToast(context, rangeErrorText(s, r.error!), type: 'err');
      return null;
    }
    var name = _name.text.trim();
    if (name.isEmpty) name = formatRanges(r.ranges);
    if (name.length > 80) name = name.substring(0, 80);
    var range = _range.text.trim();
    if (range.length > 2000) range = range.substring(0, 2000);
    return {...d, 'name': name, 'color': _color.toLowerCase(), 'range': range, 'folderId': _folder};
  }

  void _save({bool scan = false}) {
    final data = _collect(MtStrings.of(context));
    if (data != null) Navigator.of(context).pop((data, scan));
  }

  Future<void> _suggest() async {
    setState(() => _suggesting = true);
    try {
      final info = NetworkInfo();
      final ip = await info.getWifiIP();
      final mask = await info.getWifiSubmask();
      final n = ip == null ? null : ipToInt(ip);
      if (n == null || !isPrivate(n)) {
        if (mounted) mtToast(context, MtStrings.of(context).ipMobSuggestLocalNone, type: 'err');
        return;
      }
      var bits = 24;
      final m = mask == null ? null : ipToInt(mask);
      if (m != null && m != 0) {
        bits = 0;
        var v = m;
        while (v & 0x80000000 != 0) { bits++; v = (v << 1) & 0xffffffff; }
        if (bits < 16 || bits > 30) bits = 24; // en geniş /16 tasarım sınırı; çok dar maskede /24
      }
      final net = n & ((0xffffffff << (32 - bits)) & 0xffffffff);
      final cidr = '${intToIp(net)}/$bits';
      final cur = _range.text.trim();
      _range.text = cur.isEmpty ? cidr : '$cur, $cidr';
    } catch (_) {
      if (mounted) mtToast(context, MtStrings.of(context).ipMobSuggestLocalNone, type: 'err');
    } finally {
      if (mounted) setState(() => _suggesting = false);
    }
  }

  @override
  Widget build(BuildContext context) {
    final s = MtStrings.of(context);
    final col = MtColors.of(context);
    final wide = MtBreak.wide(context);
    final parsed = parseRanges(_range.text);
    final touched = _range.text.trim().isNotEmpty;
    final body = ListView(padding: const EdgeInsets.fromLTRB(22, 18, 22, 24), children: [
      if (_notice) ...[
        Container(
          padding: const EdgeInsets.all(14),
          decoration: BoxDecoration(color: col.warn.withValues(alpha: .08), borderRadius: BorderRadius.circular(MtDim.radius), border: Border.all(color: col.warn.withValues(alpha: .45))),
          child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            Row(children: [Icon(Icons.shield_outlined, size: 16, color: col.warn), const SizedBox(width: 8), Text(s.ipNoticeTitle, style: MtText.cardTitle.copyWith(color: col.text))]),
            const SizedBox(height: 8),
            Text(s.ipNoticeBody, style: MtText.small.copyWith(color: col.text, height: 1.45)),
            const SizedBox(height: 6),
            Text(s.ipNoticeLimits, style: MtText.small.copyWith(color: col.text2, height: 1.45)),
            const SizedBox(height: 10),
            Align(alignment: AlignmentDirectional.centerEnd, child: MtButton(label: s.ipNoticeAccept, small: true, kind: MtBtnKind.primary, onPressed: () async {
              await widget.store?.acceptNotice();
              if (mounted) setState(() => _notice = false);
            })),
          ]),
        ),
        const SizedBox(height: 14),
      ],
      _row(wide, [
        MtField(label: s.ipRecName, child: TextField(controller: _name, maxLength: 80, decoration: const InputDecoration(counterText: ''))),
        MtField(label: s.ipRecColor, child: Wrap(spacing: 8, runSpacing: 8, children: [
          for (final h in kCardColors) InkWell(onTap: () => setState(() => _color = h), borderRadius: BorderRadius.circular(999), child: Container(width: 26, height: 26,
              decoration: BoxDecoration(color: parseHex(h), shape: BoxShape.circle, border: Border.all(color: _color == h ? col.text : Colors.transparent, width: 2)))),
        ])),
      ], flex: const [3, 2]),
      const SizedBox(height: 14),
      MtField(label: s.ipRecRange, hint: s.ipRecRangeHint, child: TextField(controller: _range, maxLines: 4, minLines: 3, style: MtText.mono.copyWith(fontSize: 13),
          keyboardType: TextInputType.multiline, autocorrect: false, textDirection: TextDirection.ltr, decoration: const InputDecoration(hintText: '192.168.1.0/24'))),
      const SizedBox(height: 8),
      Row(children: [
        MtButton(label: s.ipMobSuggestLocal, small: true, icon: Icons.wifi, busy: _suggesting, onPressed: _suggest),
        const SizedBox(width: 10),
        if (touched) Expanded(child: parsed.ok
            ? Row(children: [Icon(Icons.check_circle_outline, size: 14, color: col.ok), const SizedBox(width: 6),
                Flexible(child: Text(s.ipRangeOk(parsed.count.toString()), style: MtText.small.copyWith(color: col.ok)))])
            : const SizedBox()),
      ]),
      if (touched && !parsed.ok) ...[const SizedBox(height: 10), MtBox(rangeErrorText(s, parsed.error!), kind: MtBoxKind.error, icon: Icons.warning_amber_outlined)],
      const SizedBox(height: 14),
      MtField(label: s.ipRecFolder, child: _select<String?>(_folder, [(null, s.ipRecRootFolder), for (final f in widget.folders) (f.$1, f.$2)], (v) => setState(() => _folder = v))),
    ]);

    return Scaffold(
      backgroundColor: col.surface,
      appBar: AppBar(backgroundColor: col.surface, title: Row(children: [Icon(Icons.wifi, size: 18, color: col.accent), const SizedBox(width: 8),
          Text(widget.existing == null ? s.ipAppNewRecord : s.ipRecEdit, style: MtText.h2.copyWith(color: col.text))])),
      body: SafeArea(child: Column(children: [
        Expanded(child: Center(child: ConstrainedBox(constraints: const BoxConstraints(maxWidth: 760), child: body))),
        Container(
          padding: const EdgeInsets.fromLTRB(22, 14, 22, 18),
          decoration: BoxDecoration(border: Border(top: BorderSide(color: col.border))),
          child: wide
              ? Row(children: [
                  const Spacer(),
                  MtButton(label: s.commonCancel, onPressed: () => Navigator.of(context).pop()),
                  const SizedBox(width: 8),
                  MtButton(label: widget.existing == null ? s.commonCreate : s.commonSave, onPressed: () => _save()),
                  const SizedBox(width: 8),
                  MtButton(label: s.ipMobScanThis, kind: MtBtnKind.primary, icon: Icons.play_arrow, onPressed: () => _save(scan: true)),
                ])
              : Column(crossAxisAlignment: CrossAxisAlignment.stretch, children: [
                  MtButton(label: s.ipMobScanThis, kind: MtBtnKind.primary, icon: Icons.play_arrow, expand: true, onPressed: () => _save(scan: true)),
                  const SizedBox(height: 8),
                  Row(children: [
                    Expanded(child: MtButton(label: s.commonCancel, expand: true, onPressed: () => Navigator.of(context).pop())),
                    const SizedBox(width: 8),
                    Expanded(child: MtButton(label: widget.existing == null ? s.commonCreate : s.commonSave, expand: true, onPressed: () => _save())),
                  ]),
                ]),
        ),
      ])),
    );
  }

  Widget _row(bool wide, List<Widget> children, {List<int>? flex}) => wide
      ? Row(crossAxisAlignment: CrossAxisAlignment.start, children: [
          for (var i = 0; i < children.length; i++) ...[if (i > 0) const SizedBox(width: 14), Expanded(flex: flex?[i] ?? 1, child: children[i])],
        ])
      : Column(crossAxisAlignment: CrossAxisAlignment.stretch, children: [for (var i = 0; i < children.length; i++) ...[if (i > 0) const SizedBox(height: 14), children[i]]]);

  Widget _select<T>(T value, List<(T, String)> items, ValueChanged<T?> onChanged) {
    final col = MtColors.of(context);
    return Container(
      height: MtDim.inputH, padding: const EdgeInsets.symmetric(horizontal: 12),
      decoration: BoxDecoration(color: col.bg2, border: Border.all(color: col.border), borderRadius: BorderRadius.circular(MtDim.radiusSm)),
      child: DropdownButtonHideUnderline(child: DropdownButton<T>(value: value, isExpanded: true, style: MtText.body.copyWith(color: col.text), dropdownColor: col.surface2,
          items: [for (final it in items) DropdownMenuItem(value: it.$1, child: Text(it.$2))], onChanged: onChanged)),
    );
  }
}
