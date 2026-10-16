// Convert Master modül ayarları (masaüstü Ayarlar › Dönüştürme + Depolama): yeni projelerde aynı anda çevrilecek dosya sayısı
// (mobilde 1..2), çıktı klasörü boyutu / temizle, kaynak kopyaları boyutu, silinmiş projelerin dosyalarını temizle.
// "settings" öğesi masaüstü alanlarıyla (appTheme, language, speechModel, speechConcurrency, ocrLanguages) korunarak yazılır.
import 'dart:io';

import 'package:flutter/material.dart';

import '../../core/l10n/gen/mt_strings.dart';
import '../../core/sync.dart';
import '../../core/theme.dart';
import '../../widgets/mt_widgets.dart';
import 'cv_engine.dart';
import 'cv_formats.dart';
import 'cv_model.dart';
import 'cv_texts.dart';

class CvSettingsScreen extends StatefulWidget {
  const CvSettingsScreen({super.key, required this.engine, this.baseDir});
  final SyncEngine engine;
  /// Testler için: depolama kökü (yoksa cvBaseDir()).
  final Directory? baseDir;
  @override
  State<CvSettingsScreen> createState() => _CvSettingsScreenState();
}

class _CvSettingsScreenState extends State<CvSettingsScreen> {
  late final Map<String, dynamic> _raw = {...CvSettings.blank(), ...(widget.engine.library.items['settings']?.$2 ?? const {})};
  late int _conc = CvSettings(_raw).defaultConcurrency.clamp(1, kMobileMaxConcurrency);
  int? _outSize, _srcSize;
  bool _busy = false;

  @override
  void initState() {
    super.initState();
    _measure();
  }

  Future<Directory> get _base async => widget.baseDir ?? await cvBaseDir();

  Future<void> _measure() async {
    final b = await _base;
    final o = await dirSize(Directory('${b.path}/converted'));
    final s = await dirSize(Directory('${b.path}/src'));
    if (mounted) setState(() { _outSize = o; _srcSize = s; });
  }

  Future<void> _clearOutputs() async {
    setState(() => _busy = true);
    for (final r in CvRunners.all) { r.stop(); }
    final b = await _base;
    try { await Directory('${b.path}/converted').delete(recursive: true); } catch (_) {}
    for (final e in widget.engine.library.items.entries.toList()) {
      if (e.value.$1 != 'project') continue;
      final r = CvRunners.peek(e.key);
      if (r != null) { await r.clearOutputs(); } else { widget.engine.library.items[e.key] = (e.value.$1, {...e.value.$2, 'outputs': <String, dynamic>{}}); }
    }
    await widget.engine.library.save();
    await _measure();
    if (mounted) { setState(() => _busy = false); mtToast(context, CvT.cleared, type: 'ok'); }
  }

  /// Kitaplıkta olmayan projelerin src/ ve converted/ klasörleri silinir.
  Future<void> _clearOrphans() async {
    setState(() => _busy = true);
    final b = await _base;
    final ids = widget.engine.library.items.keys.toSet();
    for (final sub in ['src', 'converted']) {
      final d = Directory('${b.path}/$sub');
      if (!await d.exists()) continue;
      await for (final e in d.list()) {
        final id = e.path.split(Platform.pathSeparator).last;
        if (!ids.contains(id)) { try { await e.delete(recursive: true); } catch (_) {} }
      }
    }
    await _measure();
    if (mounted) { setState(() => _busy = false); mtToast(context, CvT.cleared, type: 'ok'); }
  }

  Future<void> _save() async {
    widget.engine.library.items['settings'] = ('settings', {..._raw, 'defaultConcurrency': _conc});
    await widget.engine.onLocalChange();
    if (mounted) Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    final s = MtStrings.of(context);
    final c = MtColors.of(context);
    final wide = MtBreak.wide(context);
    Widget storageRow(IconData icon, String title, int? size, {Widget? action}) => Container(
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
          decoration: BoxDecoration(color: c.bg2, borderRadius: BorderRadius.circular(10), border: Border.all(color: c.border)),
          child: Row(children: [
            Icon(icon, size: 16, color: c.accent), const SizedBox(width: 10),
            Expanded(child: Text(title, maxLines: 1, overflow: TextOverflow.ellipsis, style: MtText.body.copyWith(color: c.text))),
            Text(size == null ? '…' : fmtSize(size), style: MtText.body.copyWith(color: c.text, fontWeight: FontWeight.w600)),
            if (action != null) ...[const SizedBox(width: 12), action],
          ]),
        );
    return Scaffold(
      backgroundColor: c.surface,
      appBar: AppBar(backgroundColor: c.surface, title: Row(children: [Icon(Icons.settings_outlined, size: 18, color: c.accent), const SizedBox(width: 8),
          Text(s.cvAppSettings, style: MtText.h2.copyWith(color: c.text))])),
      body: SafeArea(child: Column(children: [
        Expanded(child: Center(child: ConstrainedBox(constraints: const BoxConstraints(maxWidth: 760), child: ListView(padding: const EdgeInsets.fromLTRB(22, 18, 22, 24), children: [
          MtSectionTitle(CvT.conversion),
          const SizedBox(height: 10),
          MtField(label: CvT.defaultConcurrency, hint: CvT.concurrencyMobileHint, child: MtSegment<int>(value: _conc, onChanged: (v) => setState(() => _conc = v),
              items: [for (var i = 1; i <= kMobileMaxConcurrency; i++) (i, '$i', null)])),
          const SizedBox(height: 22),
          MtSectionTitle(CvT.storage),
          const SizedBox(height: 10),
          storageRow(Icons.swap_horiz, s.cvPjConverted, _outSize, action: MtButton(label: s.cvAppClearOutputs, small: true, kind: MtBtnKind.danger, icon: Icons.delete_outline, busy: _busy, onPressed: _clearOutputs)),
          const SizedBox(height: 8),
          storageRow(Icons.folder_copy_outlined, CvT.sourceCopies, _srcSize),
          const SizedBox(height: 8),
          Align(alignment: AlignmentDirectional.centerStart, child: MtButton(label: CvT.clearOrphans, small: true, icon: Icons.cleaning_services_outlined, busy: _busy, onPressed: _clearOrphans)),
          const SizedBox(height: 8),
          Text(CvT.storageNote, style: MtText.small.copyWith(color: c.text3, height: 1.45)),
          const SizedBox(height: 22),
          MtSectionTitle(s.setAbout),
          const SizedBox(height: 10),
          Text(CvT.license, style: MtText.small.copyWith(color: c.text3, height: 1.45)),
        ])))),
        Container(
          padding: const EdgeInsets.fromLTRB(22, 14, 22, 18),
          decoration: BoxDecoration(border: Border(top: BorderSide(color: c.border))),
          child: Row(children: [
            if (wide) const Spacer(),
            if (!wide) Expanded(child: MtButton(label: s.commonCancel, expand: true, onPressed: () => Navigator.of(context).pop())) else MtButton(label: s.commonCancel, onPressed: () => Navigator.of(context).pop()),
            const SizedBox(width: 8),
            if (!wide) Expanded(flex: 2, child: MtButton(label: s.commonSave, kind: MtBtnKind.primary, expand: true, onPressed: _save)) else MtButton(label: s.commonSave, kind: MtBtnKind.primary, onPressed: _save),
          ]),
        ),
      ])),
    );
  }
}
