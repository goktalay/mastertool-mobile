// Convert Master modül ayarları (masaüstü Ayarlar › Dönüştürme + Depolama): yeni projelerde aynı anda çevrilecek dosya sayısı
// (mobilde 1..2), konuşma modelleri (tiny/base/small: boyut, indir, sil — masaüstü Ayarlar › Konuşmadan metne), çıktı klasörü
// boyutu / temizle (metinlerle birlikte), kaynak kopyaları boyutu, silinmiş projelerin dosyalarını temizle.
// "settings" öğesi masaüstü alanlarıyla (appTheme, language, speechModel, speechConcurrency, ocrLanguages) korunarak yazılır.
import 'dart:io';

import 'package:flutter/material.dart';

import '../../core/l10n/gen/mt_strings.dart';
import '../../core/sync.dart';
import '../../core/theme.dart';
import '../../widgets/mt_widgets.dart';
import 'cv_engine.dart';
import 'cv_ffmpeg_args.dart' show CvConvertError;
import 'cv_formats.dart';
import 'cv_model.dart';
import 'cv_speech.dart';
import 'cv_text_formats.dart';

// Sabit metinler (ARB'ye henüz eklenmedi; TR)
const _tSpeechModels = 'Konuşma modelleri';
const _tSpeechModelsNote = 'Konuşma tanıma (whisper.cpp) bu cihazda çalışır; model ilk kullanımda indirilir, buradan önceden indirip silebilirsiniz. '
    'Orta ve Large v3 Turbo modeller mobilde kullanılamaz.';
const _tDelete = 'Sil';
const _tTexts = 'Metinler (konuşma / OCR)';
const _tOcrNote = 'Resimden metin Google ML Kit ile cihazda çalışır; Latin (Türkçe dahil), Çince, Japonca, Korece ve Devanagari betikleri desteklenir. '
    'Tanıma modelleri uygulamayla gelir; indirme gerekmez.';

class CvSettingsScreen extends StatefulWidget {
  const CvSettingsScreen({super.key, required this.engine, this.baseDir, this.models});
  final SyncEngine engine;
  /// Testler için: depolama kökü (yoksa cvBaseDir()).
  final Directory? baseDir;
  /// Testler için: model deposu (yoksa CvRunners.models()).
  final CvSpeechModels? models;
  @override
  State<CvSettingsScreen> createState() => _CvSettingsScreenState();
}

class _CvSettingsScreenState extends State<CvSettingsScreen> {
  late final Map<String, dynamic> _raw = {...CvSettings.blank(), ...(widget.engine.library.items['settings']?.$2 ?? const {})};
  late int _conc = CvSettings(_raw).defaultConcurrency.clamp(1, kMobileMaxConcurrency);
  int? _outSize, _srcSize, _textSize;
  bool _busy = false;
  CvSpeechModels? _models;

  @override
  void initState() {
    super.initState();
    _measure();
    (widget.models != null ? Future.value(widget.models!) : CvRunners.models()).then((m) {
      if (!mounted) return;
      m.addListener(_refresh);
      setState(() => _models = m);
    });
  }

  void _refresh() { if (mounted) setState(() {}); }

  @override
  void dispose() {
    _models?.removeListener(_refresh);
    super.dispose();
  }

  Future<Directory> get _base async => widget.baseDir ?? await cvBaseDir();

  Future<void> _measure() async {
    final b = await _base;
    final o = await dirSize(Directory('${b.path}/converted'));
    final s = await dirSize(Directory('${b.path}/src'));
    final t = await dirSize(Directory('${b.path}/text'));
    if (mounted) setState(() { _outSize = o; _srcSize = s; _textSize = t; });
  }

  Future<void> _download(String key) async {
    final m = _models;
    if (m == null) return;
    try {
      await m.ensure(key);
      if (mounted) mtToast(context, MtStrings.of(context).cvSpeechInstalled(fmtSize(m.size(key))), type: 'ok');
    } on CvConvertError catch (e) {
      if (mounted) mtToast(context, MtStrings.of(context).cvErrDownload(e.message), type: 'err');
    } catch (e) {
      if (mounted) mtToast(context, MtStrings.of(context).cvErrDownload('$e'), type: 'err');
    }
  }

  Future<void> _clearOutputs() async {
    setState(() => _busy = true);
    for (final r in CvRunners.all) { r.stop(); }
    final b = await _base;
    try { await Directory('${b.path}/converted').delete(recursive: true); } catch (_) {}
    try { await Directory('${b.path}/text').delete(recursive: true); } catch (_) {}
    for (final e in widget.engine.library.items.entries.toList()) {
      if (e.value.$1 != 'project') continue;
      final r = CvRunners.peek(e.key);
      if (r != null) { await r.clearOutputs(); } else { widget.engine.library.items[e.key] = (e.value.$1, {...e.value.$2, 'outputs': <String, dynamic>{}}); }
    }
    await widget.engine.library.save();
    await _measure();
    if (mounted) { setState(() => _busy = false); mtToast(context, MtStrings.of(context).cvMobCleared, type: 'ok'); }
  }

  /// Kitaplıkta olmayan projelerin src/ ve converted/ klasörleri silinir.
  Future<void> _clearOrphans() async {
    setState(() => _busy = true);
    final b = await _base;
    final ids = widget.engine.library.items.keys.toSet();
    for (final sub in ['src', 'converted', 'text']) {
      final d = Directory('${b.path}/$sub');
      if (!await d.exists()) continue;
      await for (final e in d.list()) {
        final id = e.path.split(Platform.pathSeparator).last;
        if (!ids.contains(id)) { try { await e.delete(recursive: true); } catch (_) {} }
      }
    }
    await _measure();
    if (mounted) { setState(() => _busy = false); mtToast(context, MtStrings.of(context).cvMobCleared, type: 'ok'); }
  }

  Future<void> _save() async {
    widget.engine.library.items['settings'] = ('settings', {..._raw, 'defaultConcurrency': _conc});
    await widget.engine.onLocalChange();
    if (mounted) Navigator.of(context).pop();
  }

  /// Model satırı: ad · yaklaşık boyut · Yüklü (boyut) + Sil / İndiriliyor %p / İndir.
  Widget _modelRow(MtStrings s, MtColors c, String key) {
    final info = kSpeechModelInfo[key]!;
    final label = switch (key) { 'tiny' => s.cvSpeechModelTiny, 'small' => s.cvSpeechModelSmall, _ => s.cvSpeechModelBase };
    final m = _models;
    final installed = m?.installed(key) ?? false;
    final dl = m?.downloading[key];
    final Widget trailing;
    if (m == null) {
      trailing = Text('…', style: MtText.body.copyWith(color: c.text3));
    } else if (dl != null) {
      trailing = Row(mainAxisSize: MainAxisSize.min, children: [MtSpinner(size: 12, color: c.accent), const SizedBox(width: 8), Text('%${(dl * 100).round()}', style: MtText.mono.copyWith(color: c.text2))]);
    } else if (installed) {
      trailing = Row(mainAxisSize: MainAxisSize.min, children: [
        Text(s.cvSpeechInstalled(fmtSize(m.size(key))), style: MtText.small.copyWith(color: c.ok)),
        const SizedBox(width: 10),
        MtButton(label: _tDelete, small: true, kind: MtBtnKind.danger, icon: Icons.delete_outline, onPressed: () => m.delete(key)),
      ]);
    } else {
      trailing = MtButton(label: s.cvSpeechDownload, small: true, icon: Icons.download_outlined, onPressed: () => _download(key));
    }
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
      decoration: BoxDecoration(color: c.bg2, borderRadius: BorderRadius.circular(10), border: Border.all(color: c.border)),
      child: Row(children: [
        Icon(Icons.mic_none, size: 16, color: c.accent), const SizedBox(width: 10),
        Expanded(child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Text(label, maxLines: 1, overflow: TextOverflow.ellipsis, style: MtText.body.copyWith(color: c.text)),
          Text('${info.file} · ~${info.mb} MB', style: MtText.tiny.copyWith(color: c.text3)),
        ])),
        const SizedBox(width: 8),
        trailing,
      ]),
    );
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
          MtSectionTitle(s.cvMobConversion),
          const SizedBox(height: 10),
          MtField(label: s.cvMobDefaultConcurrency, hint: s.cvMobConcurrencyHint, child: MtSegment<int>(value: _conc, onChanged: (v) => setState(() => _conc = v),
              items: [for (var i = 1; i <= kMobileMaxConcurrency; i++) (i, '$i', null)])),
          const SizedBox(height: 22),
          MtSectionTitle(_tSpeechModels),
          const SizedBox(height: 10),
          for (final k in kMobileSpeechModels) ...[_modelRow(s, c, k), const SizedBox(height: 8)],
          Text(_tSpeechModelsNote, style: MtText.small.copyWith(color: c.text3, height: 1.45)),
          const SizedBox(height: 10),
          Text(_tOcrNote, style: MtText.small.copyWith(color: c.text3, height: 1.45)),
          const SizedBox(height: 22),
          MtSectionTitle(s.cvMobStorage),
          const SizedBox(height: 10),
          storageRow(Icons.swap_horiz, s.cvPjConverted, _outSize, action: MtButton(label: s.cvAppClearOutputs, small: true, kind: MtBtnKind.danger, icon: Icons.delete_outline, busy: _busy, onPressed: _clearOutputs)),
          const SizedBox(height: 8),
          storageRow(Icons.text_snippet_outlined, _tTexts, _textSize),
          const SizedBox(height: 8),
          storageRow(Icons.folder_copy_outlined, s.cvMobSourceCopies, _srcSize),
          const SizedBox(height: 8),
          Align(alignment: AlignmentDirectional.centerStart, child: MtButton(label: s.cvMobClearOrphans, small: true, icon: Icons.cleaning_services_outlined, busy: _busy, onPressed: _clearOrphans)),
          const SizedBox(height: 8),
          Text(s.cvMobStorageNote, style: MtText.small.copyWith(color: c.text3, height: 1.45)),
          const SizedBox(height: 22),
          MtSectionTitle(s.setAbout),
          const SizedBox(height: 10),
          Text(s.cvMobLicense, style: MtText.small.copyWith(color: c.text3, height: 1.45)),
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
