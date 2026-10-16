// IP Tools › Ayarlar › Tarama (masaüstü Ayarlar penceresinin Tarama sekmesi): "Denenecek servisler" sabit 15 port, yalnız
// kapatılabilir (kart onay kutuları, geniş ekranda 2 sütun) · "Hız": eşzamanlı bağlantı (1..64) ve zaman aşımı (200..1000 ms) ·
// bilgi kutusu. Kaydet → settings öğesi {appTheme, language, scan} (senkron).
import 'package:flutter/material.dart';

import '../../core/l10n/gen/mt_strings.dart';
import '../../core/sync.dart';
import '../../core/theme.dart';
import '../../widgets/mt_widgets.dart';
import 'ip_model.dart';
import 'ip_ports.dart';
import 'ip_texts.dart';
import 'ip_widgets.dart';

class IpSettingsScreen extends StatefulWidget {
  const IpSettingsScreen({super.key, required this.engine});
  final SyncEngine engine;
  @override
  State<IpSettingsScreen> createState() => _IpSettingsScreenState();
}

class _IpSettingsScreenState extends State<IpSettingsScreen> {
  Map<String, dynamic>? get _settings => widget.engine.library.items['settings']?.$2;
  late final ScanSettings _init = scanSettingsOf(_settings);
  late final Set<int> _off = {..._init.disabledPorts};
  late final _conc = TextEditingController(text: _init.concurrency.toString());
  late final _tmo = TextEditingController(text: _init.timeoutMs.toString());

  @override
  void dispose() {
    _conc.dispose();
    _tmo.dispose();
    super.dispose();
  }

  Future<void> _save() async {
    final s = MtStrings.of(context);
    final next = ScanSettings(disabledPorts: _off.toList(), concurrency: int.tryParse(_conc.text.trim()), timeoutMs: int.tryParse(_tmo.text.trim()));
    widget.engine.library.items['settings'] = ('settings', withScanSettings(_settings, next));
    await widget.engine.onLocalChange();
    if (!mounted) return;
    mtToast(context, s.setSaved, type: 'ok');
    Navigator.of(context).pop(next);
  }

  @override
  Widget build(BuildContext context) {
    final s = MtStrings.of(context);
    final c = MtColors.of(context);
    final wide = MtBreak.wide(context);
    final cards = [for (final p in kPorts) _portCard(s, c, p)];
    return Scaffold(
      backgroundColor: c.surface,
      appBar: AppBar(backgroundColor: c.surface, title: Row(children: [Icon(Icons.settings_outlined, size: 18, color: c.accent), const SizedBox(width: 8),
          Text('${s.setTitle} › ${IpTr.setScan}', style: MtText.h2.copyWith(color: c.text))])),
      body: SafeArea(child: Column(children: [
        Expanded(child: Center(child: ConstrainedBox(constraints: const BoxConstraints(maxWidth: 760), child: ListView(padding: const EdgeInsets.fromLTRB(22, 18, 22, 24), children: [
          const MtSectionTitle(IpTr.setPorts),
          const SizedBox(height: 6),
          Text(IpTr.setPortsHint, style: MtText.small.copyWith(color: c.text2, height: 1.45)),
          const SizedBox(height: 12),
          if (wide)
            Column(children: [
              for (var i = 0; i < cards.length; i += 2)
                Padding(padding: const EdgeInsets.only(bottom: 10), child: Row(crossAxisAlignment: CrossAxisAlignment.start, children: [
                  Expanded(child: cards[i]), const SizedBox(width: 10), Expanded(child: i + 1 < cards.length ? cards[i + 1] : const SizedBox()),
                ])),
            ])
          else
            Column(children: [for (final w in cards) Padding(padding: const EdgeInsets.only(bottom: 10), child: w)]),
          const SizedBox(height: 14),
          const MtSectionTitle(IpTr.setSpeed),
          const SizedBox(height: 12),
          _row(wide, [
            MtField(label: IpTr.setConcurrency, hint: IpTr.setConcurrencyHint, child: TextField(controller: _conc, keyboardType: TextInputType.number, textDirection: TextDirection.ltr)),
            MtField(label: IpTr.setTimeout, hint: IpTr.setTimeoutHint, child: TextField(controller: _tmo, keyboardType: TextInputType.number, textDirection: TextDirection.ltr,
                decoration: InputDecoration(suffixText: 'ms', suffixStyle: MtText.small.copyWith(color: c.text3)))),
          ]),
          const SizedBox(height: 16),
          const MtBox(IpTr.setLimitsNote, kind: MtBoxKind.info, icon: Icons.info_outline),
          const SizedBox(height: 10),
          const MtBox(IpTr.phoneNoMacNote, kind: MtBoxKind.info, icon: Icons.phone_android_outlined),
        ])))),
        Container(
          padding: const EdgeInsets.fromLTRB(22, 14, 22, 18),
          decoration: BoxDecoration(border: Border(top: BorderSide(color: c.border))),
          child: Row(mainAxisAlignment: MainAxisAlignment.end, children: [
            MtButton(label: s.commonCancel, onPressed: () => Navigator.of(context).pop()),
            const SizedBox(width: 8),
            MtButton(label: s.commonSave, kind: MtBtnKind.primary, onPressed: _save),
          ]),
        ),
      ])),
    );
  }

  Widget _portCard(MtStrings s, MtColors c, PortInfo p) {
    final on = !_off.contains(p.port);
    final g = kGroupColors[p.group] ?? c.accent;
    return Material(
      color: on ? g.withValues(alpha: .06) : c.surface, borderRadius: BorderRadius.circular(10),
      child: InkWell(
        borderRadius: BorderRadius.circular(10),
        onTap: () => setState(() => on ? _off.add(p.port) : _off.remove(p.port)),
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 9),
          decoration: BoxDecoration(borderRadius: BorderRadius.circular(10), border: Border.all(color: on ? g.withValues(alpha: .45) : c.border)),
          child: Row(children: [
            SizedBox(width: 18, height: 20, child: Checkbox(value: on, onChanged: (v) => setState(() => v == true ? _off.remove(p.port) : _off.add(p.port)))),
            const SizedBox(width: 10),
            Container(width: 26, height: 26, decoration: BoxDecoration(color: g.withValues(alpha: .18), borderRadius: BorderRadius.circular(7)), child: Icon(groupIcon(p.group), size: 14, color: g)),
            const SizedBox(width: 10),
            Expanded(child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              Text(p.name, style: MtText.body.copyWith(color: c.text, fontWeight: FontWeight.w600)),
              Text('${groupLabel(s, p.group)} · ${p.port}/tcp', style: MtText.tiny.copyWith(color: c.text3)),
            ])),
          ]),
        ),
      ),
    );
  }

  Widget _row(bool wide, List<Widget> children) => wide
      ? Row(crossAxisAlignment: CrossAxisAlignment.start, children: [for (var i = 0; i < children.length; i++) ...[if (i > 0) const SizedBox(width: 14), Expanded(child: children[i])]])
      : Column(crossAxisAlignment: CrossAxisAlignment.stretch, children: [for (var i = 0; i < children.length; i++) ...[if (i > 0) const SizedBox(height: 14), children[i]]]);
}
