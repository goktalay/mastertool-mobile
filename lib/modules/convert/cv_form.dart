// Convert Master proje formu — masaüstü "Yeni proje" penceresi (3 sekme): Genel (proje ismi, tür kartları, kaynak uzantı çipleri,
// hedef uzantı, kaynak Dosya/Klasör, alt klasörler, aynı anda çevrilecek dosya sayısı, proje klasörü, renk, notlar) ·
// Dönüştürme ayarları (türe göre video / resim / ses seçenekleri) · Konuşma (video, ses: whisper.cpp; model tiny/base/small,
// medium/turbo ve "her 30 sn'de dil algıla" mobilde kapalı) ya da OCR (resim: ML Kit; Kiril/Arap/İbrani/Yunan dilleri mobilde
// okunamaz, seçimi korunur). Kaydet → (data, aç?) döner.
import 'package:flutter/material.dart';

import '../../core/l10n/gen/mt_strings.dart';
import '../../core/theme.dart';
import '../../widgets/mt_widgets.dart';
import '../ssh/ssh_model.dart' show kCardColors, parseHex;
import 'cv_formats.dart';
import 'cv_model.dart';
import 'cv_text_formats.dart';

// Sabit metinler (ARB'ye henüz eklenmedi; TR)
const _tSpeechNote = 'Konuşma tanıma cihazda, çevrimdışı çalışır (whisper.cpp); ses hiçbir sunucuya gönderilmez. Model ilk kullanımda bir kez indirilir '
    '(Çok küçük 75 MB · Temel 142 MB · Küçük 466 MB; Wi-Fi önerilir) ve Ayarlar › Konuşma modelleri bölümünden yönetilir.';
const _tSpeechModelFallback = 'Bu model mobilde kullanılamaz; bu cihazda Temel (base) model kullanılır. Masaüstünde seçiminiz geçerlidir.';
const _tPerWindowMob = 'Mobil sürüm algılanan dili bildirmez; bu seçenek masaüstünde uygulanır.';
const _tOcrNote = 'Resimden metin cihazda çalışır (Google ML Kit); resimler hiçbir sunucuya gönderilmez. Tanınan betikler: Latin alfabesi '
    '(Türkçe dahil), Çince, Japonca, Korece ve Devanagari (Hintçe). Android\'de tanıma modeli uygulamayla gelir.';
const _tOcrUnsupported = 'Mobilde okunamaz (ML Kit modeli yok); masaüstünde kullanılır';
const _tOcrMax = 'En çok 6 dil seçilebilir.';

class CvFormScreen extends StatefulWidget {
  const CvFormScreen({super.key, this.existing, required this.folders, this.folderId, this.settings});
  final CvProject? existing;
  final List<(String, String)> folders;
  final String? folderId;
  final CvSettings? settings;
  @override
  State<CvFormScreen> createState() => _CvFormScreenState();
}

class _CvFormScreenState extends State<CvFormScreen> with SingleTickerProviderStateMixin {
  late final Map<String, dynamic> d = widget.existing != null
      ? Map<String, dynamic>.from(widget.existing!.raw)
      : CvProject.blank(concurrency: (widget.settings?.defaultConcurrency ?? 2).clamp(1, kMobileMaxConcurrency));
  late final _tabs = TabController(length: 3, vsync: this);
  late final _name = TextEditingController(text: (d['name'] ?? '').toString());
  late final _notes = TextEditingController(text: (d['notes'] ?? '').toString());
  late String _type = (d['type'] ?? 'video').toString();
  late List<String> _srcExts = ((d['sourceExts'] as List?) ?? const []).map((x) => x.toString()).toList();
  late String _target = (d['targetExt'] ?? kCvTypes[_type]!.defaultTarget).toString();
  late String _mode = (d['sourceMode'] ?? 'file').toString();
  late bool _sub = d['includeSubfolders'] != false;
  late int _conc = ((d['concurrency'] as num?)?.toInt() ?? 2).clamp(1, kMobileMaxConcurrency);
  late String? _folder = widget.folderId;
  late String _color = (d['color'] ?? kCvTypes[_type]!.color).toString();
  late Map<String, dynamic> _opt = cleanOptions((d['options'] as Map?)?.cast<String, dynamic>());
  late final Map<String, dynamic> _speech = {...defaultSpeech(), ...((d['speech'] as Map?)?.cast<String, dynamic>() ?? const {})};
  late final Map<String, dynamic> _ocr = {...defaultOcr(), ...((d['ocr'] as Map?)?.cast<String, dynamic>() ?? const {})};
  late final _maxW = TextEditingController(text: _imgNum('maxWidth')), _maxH = TextEditingController(text: _imgNum('maxHeight'));

  String _imgNum(String k) { final v = ((_opt['image'] as Map)[k] as num?)?.toInt() ?? 0; return v == 0 ? '' : '$v'; }
  CvType get _t => kCvTypes[_type]!;
  Map<String, dynamic> get _vo => (_opt['video'] as Map).cast<String, dynamic>();
  Map<String, dynamic> get _io => (_opt['image'] as Map).cast<String, dynamic>();
  Map<String, dynamic> get _ao => (_opt['audio'] as Map).cast<String, dynamic>();

  void _setType(String t) => setState(() {
        if (t == _type) return;
        final wasTypeColor = _color == _t.color;
        _type = t;
        _srcExts = [..._t.defaultSource];
        _target = _t.defaultTarget;
        if (wasTypeColor) _color = _t.color;
      });

  Map<String, dynamic>? _collect(MtStrings s) {
    final exts = _srcExts.where((e) => !(kMobileUnsupportedSource[_type]?.contains(e) ?? false)).toList();
    if (exts.isEmpty) { mtToast(context, s.cvPfErrExt, type: 'err'); _tabs.animateTo(0); return null; }
    final io = {..._io, 'maxWidth': int.tryParse(_maxW.text.trim()) ?? 0, 'maxHeight': int.tryParse(_maxH.text.trim()) ?? 0};
    final form = {
      ...d, 'name': _name.text, 'type': _type, 'sourceExts': exts, 'targetExt': _target, 'sourceMode': _mode, 'includeSubfolders': _sub,
      'concurrency': _conc, 'speech': _speech, 'ocr': _ocr, 'options': {..._opt, 'image': io}, 'folderId': _folder, 'color': _color, 'notes': _notes.text,
    };
    final clean = cleanProject(form, defaultConcurrency: widget.settings?.defaultConcurrency ?? 2, speechModel: widget.settings?.speechModel ?? 'base',
        ocrLanguages: widget.settings?.ocrLanguages ?? const ['tur', 'eng'], untitled: s.cvMainUntitled);
    // Yerel alanlar (sources, outputs…) korunur
    return {for (final e in d.entries) if (kCvLocalOnly.contains(e.key)) e.key: e.value, ...clean};
  }

  void _save({bool open = false}) {
    final data = _collect(MtStrings.of(context));
    if (data != null) Navigator.of(context).pop((data, open));
  }

  @override
  Widget build(BuildContext context) {
    final s = MtStrings.of(context);
    final col = MtColors.of(context);
    final wide = MtBreak.wide(context);
    final isImage = _type == 'image';
    return Scaffold(
      backgroundColor: col.surface,
      appBar: AppBar(
        backgroundColor: col.surface,
        title: Row(children: [Icon(widget.existing == null ? Icons.add : Icons.tune, size: 18, color: col.accent), const SizedBox(width: 8),
            Expanded(child: Text(widget.existing == null ? s.cvPfTitleNew : s.cvPfTitleEdit(widget.existing!.name), maxLines: 1, overflow: TextOverflow.ellipsis, style: MtText.h2.copyWith(color: col.text)))]),
        bottom: TabBar(controller: _tabs, isScrollable: !wide, tabAlignment: wide ? TabAlignment.fill : TabAlignment.start, labelColor: col.text, unselectedLabelColor: col.text2,
            indicatorColor: col.accent, labelStyle: MtText.body.copyWith(fontWeight: FontWeight.w600), tabs: [
              Tab(icon: const Icon(Icons.description_outlined, size: 15), iconMargin: const EdgeInsets.only(bottom: 2), text: s.cvPfTabGeneral),
              Tab(icon: const Icon(Icons.settings_outlined, size: 15), iconMargin: const EdgeInsets.only(bottom: 2), text: s.cvPfTabOutput),
              Tab(icon: Icon(isImage ? Icons.text_fields : Icons.mic_none, size: 15), iconMargin: const EdgeInsets.only(bottom: 2), text: isImage ? s.cvPfTabOcr : s.cvPfTabSpeech),
            ]),
      ),
      body: SafeArea(child: Column(children: [
        Expanded(child: Center(child: ConstrainedBox(constraints: const BoxConstraints(maxWidth: 760), child: TabBarView(controller: _tabs, children: [
          _general(s, col, wide),
          _output(s, col, wide),
          isImage ? _ocrTab(s, col) : _speechTab(s, col, wide),
        ])))),
        Container(
          padding: const EdgeInsets.fromLTRB(22, 14, 22, 18),
          decoration: BoxDecoration(border: Border(top: BorderSide(color: col.border))),
          child: wide
              ? Row(children: [
                  const Spacer(),
                  MtButton(label: s.commonCancel, onPressed: () => Navigator.of(context).pop()),
                  const SizedBox(width: 8),
                  MtButton(label: s.cvPfCreate, kind: MtBtnKind.primary, icon: Icons.check, onPressed: () => _save(open: widget.existing == null)),
                ])
              : Row(children: [
                  Expanded(child: MtButton(label: s.commonCancel, expand: true, onPressed: () => Navigator.of(context).pop())),
                  const SizedBox(width: 8),
                  Expanded(flex: 2, child: MtButton(label: s.cvPfCreate, kind: MtBtnKind.primary, icon: Icons.check, expand: true, onPressed: () => _save(open: widget.existing == null))),
                ]),
        ),
      ])),
    );
  }

  // ---- Genel
  Widget _general(MtStrings s, MtColors col, bool wide) {
    final unsupportedSrc = kMobileUnsupportedSource[_type] ?? const <String>{};
    final unsupportedTgt = kMobileUnsupportedTarget[_type] ?? const <String>{};
    return ListView(padding: const EdgeInsets.fromLTRB(22, 18, 22, 24), children: [
      MtField(label: s.cvPfName, child: TextField(controller: _name, decoration: InputDecoration(hintText: s.cvPfNamePh))),
      const SizedBox(height: 14),
      MtField(label: s.cvPfType, child: wide
          ? Row(children: [for (final t in kCvTypes.keys) ...[if (t != 'video') const SizedBox(width: 10), Expanded(child: _typeCard(s, col, t))]])
          : Column(children: [for (final t in kCvTypes.keys) ...[if (t != 'video') const SizedBox(height: 8), _typeCard(s, col, t)]])),
      const SizedBox(height: 14),
      _row(wide, [
        MtField(label: s.cvPfSourceExt, child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Row(children: [
            MtButton(label: s.cvPfSelectAll, small: true, kind: MtBtnKind.ghost, onPressed: () => setState(() => _srcExts = _t.source.where((e) => !unsupportedSrc.contains(e)).toList())),
            MtButton(label: s.cvPfSelectNone, small: true, kind: MtBtnKind.ghost, onPressed: () => setState(() => _srcExts = [])),
          ]),
          const SizedBox(height: 4),
          Wrap(spacing: 6, runSpacing: 6, children: [for (final e in _t.source) _chip(col, e, _srcExts.contains(e), unsupportedSrc.contains(e), () => setState(() => _srcExts.contains(e) ? _srcExts.remove(e) : _srcExts.add(e)))]),
          if (unsupportedSrc.isNotEmpty) ...[const SizedBox(height: 6), Text('${unsupportedSrc.map((e) => e.toUpperCase()).join(', ')}: ${s.cvMobUnsupportedOnMobile}', style: MtText.small.copyWith(color: col.text3))],
        ])),
        MtField(label: s.cvPfTargetExt, hint: _target == 'gif' && _type == 'video' ? s.cvPfGifHint : _t.audioOnlyTargets.contains(_target) ? s.cvPfAudioOnlyHint : null,
            child: _select<String>(_target, [for (final e in _t.target) (e, unsupportedTgt.contains(e) ? '${e.toUpperCase()} — ${s.cvMobUnsupportedOnMobile}' : _targetLabel(s, e))],
                (v) { if (v != null && !unsupportedTgt.contains(v)) setState(() => _target = v); })),
      ], flex: const [3, 2]),
      const SizedBox(height: 14),
      MtField(label: s.cvPfSource, hint: s.cvMobFolderNote, child: MtSegment<String>(value: _mode, onChanged: (v) => setState(() => _mode = v),
          items: [('file', s.cvPfModeFile, Icons.insert_drive_file_outlined), ('folder', '${s.cvPfModeFolder} · ${s.cvMobNotOnMobile}', Icons.folder_outlined)])),
      const SizedBox(height: 10),
      Opacity(opacity: _mode == 'folder' ? 1 : .5, child: MtCheck(value: _sub, onChanged: (v) => setState(() => _sub = v), label: s.cvPfSubfolders)),
      const SizedBox(height: 14),
      _row(wide, [
        MtField(label: s.cvPfConcurrency, hint: s.cvMobConcurrencyHint, child: MtSegment<int>(value: _conc, onChanged: (v) => setState(() => _conc = v),
            items: [for (var i = 1; i <= kMobileMaxConcurrency; i++) (i, '$i', null)])),
        MtField(label: s.cvPfFolder, child: _select<String?>(_folder, [(null, s.cvAppRootFolder), for (final f in widget.folders) (f.$1, f.$2)], (v) => setState(() => _folder = v))),
      ]),
      const SizedBox(height: 14),
      MtField(label: s.smFormColor, child: Wrap(spacing: 8, runSpacing: 8, children: [
        for (final h in {_t.color, ...kCardColors}) InkWell(onTap: () => setState(() => _color = h), borderRadius: BorderRadius.circular(999), child: Container(width: 26, height: 26,
            decoration: BoxDecoration(color: parseHex(h), shape: BoxShape.circle, border: Border.all(color: _color == h ? col.text : Colors.transparent, width: 2)))),
      ])),
      const SizedBox(height: 14),
      MtField(label: s.smAppNotesLabel, child: TextField(controller: _notes, maxLines: 3, minLines: 2)),
    ]);
  }

  Widget _typeCard(MtStrings s, MtColors col, String t) {
    final info = kCvTypes[t]!;
    final sel = _type == t;
    final c = parseHex(info.color);
    final (icon, name, hint) = switch (t) {
      'image' => (Icons.image_outlined, s.cvTypeImage, s.cvTypeImageHint),
      'audio' => (Icons.music_note_outlined, s.cvTypeAudio, s.cvTypeAudioHint),
      _ => (Icons.videocam_outlined, s.cvTypeVideo, s.cvTypeVideoHint),
    };
    return Material(
      color: sel ? c.withValues(alpha: .10) : col.bg2, borderRadius: BorderRadius.circular(10),
      child: InkWell(
        borderRadius: BorderRadius.circular(10), onTap: () => _setType(t),
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
          decoration: BoxDecoration(borderRadius: BorderRadius.circular(10), border: Border.all(color: sel ? c : col.border, width: sel ? 1.5 : 1)),
          child: Row(children: [
            Container(width: 32, height: 32, decoration: BoxDecoration(color: c.withValues(alpha: .18), borderRadius: BorderRadius.circular(8)), child: Icon(icon, size: 18, color: c)),
            const SizedBox(width: 10),
            Expanded(child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              Text(name, style: MtText.body.copyWith(color: col.text, fontWeight: FontWeight.w600)),
              Text(hint, maxLines: 1, overflow: TextOverflow.ellipsis, style: MtText.tiny.copyWith(color: col.text3)),
            ])),
          ]),
        ),
      ),
    );
  }

  Widget _chip(MtColors col, String ext, bool on, bool disabled, VoidCallback onTap) {
    final c = parseHex(_t.color);
    return Opacity(opacity: disabled ? .4 : 1, child: Material(
      color: on ? c.withValues(alpha: .18) : col.bg2, borderRadius: BorderRadius.circular(6),
      child: InkWell(
        borderRadius: BorderRadius.circular(6), onTap: disabled ? null : onTap,
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 9, vertical: 4),
          decoration: BoxDecoration(borderRadius: BorderRadius.circular(6), border: Border.all(color: on ? c : col.border)),
          child: Text(ext, style: MtText.mono.copyWith(color: on ? col.text : col.text2, fontWeight: on ? FontWeight.w600 : FontWeight.w400)),
        ),
      ),
    ));
  }

  String _targetLabel(MtStrings s, String e) {
    if (_type == 'video') {
      if (_t.audioOnlyTargets.contains(e)) return '${e.toUpperCase()} · ${s.cvPfGroupAudioOnly}';
      if (e == 'gif') return 'GIF · ${s.cvPfGroupAnim}';
    }
    return e.toUpperCase();
  }

  // ---- Dönüştürme ayarları
  Widget _output(MtStrings s, MtColors col, bool wide) {
    final children = switch (_type) {
      'image' => [
          MtField(label: s.cvOutImgQuality, hint: s.cvOutImgQualityHint, child: Row(children: [
            Expanded(child: Slider(value: ((_io['quality'] as num?)?.toDouble() ?? 85).clamp(1, 100), min: 1, max: 100, divisions: 99, activeColor: col.accent,
                onChanged: (v) => setState(() => _opt = {..._opt, 'image': {..._io, 'quality': v.round()}}))),
            SizedBox(width: 44, child: Text('${_io['quality']}', textAlign: TextAlign.end, style: MtText.mono.copyWith(color: col.text))),
          ])),
          const SizedBox(height: 14),
          _row(wide, [
            MtField(label: s.cvOutMaxWidth, child: TextField(controller: _maxW, keyboardType: TextInputType.number, decoration: InputDecoration(hintText: s.cvOutNoLimit, suffixText: 'px'))),
            MtField(label: s.cvOutMaxHeight, hint: s.cvOutResizeHint, child: TextField(controller: _maxH, keyboardType: TextInputType.number, decoration: InputDecoration(hintText: s.cvOutNoLimit, suffixText: 'px'))),
          ]),
          const SizedBox(height: 14),
          MtCheck(value: _io['keepMeta'] == true, onChanged: (v) => setState(() => _opt = {..._opt, 'image': {..._io, 'keepMeta': v}}), label: s.cvOutKeepMeta, hint: s.cvOutKeepMetaHint),
        ],
      'audio' => [
          _row(wide, [
            MtField(label: s.cvOutBitrate, hint: s.cvOutBitrateHint, child: _select<String>(_ao['bitrate'].toString(), [for (final b in kAudioBitrates) (b, '$b kbps')], (v) => _setA('bitrate', v))),
            MtField(label: s.cvOutSampleRate, child: _select<String>(_ao['sampleRate'].toString(), [for (final r in kSampleRates) (r, r == 'source' ? s.cvOutAsSource : '${(int.parse(r) / 1000).toStringAsFixed(r.endsWith('50') ? 2 : 1)} kHz')], (v) => _setA('sampleRate', v))),
          ]),
          const SizedBox(height: 14),
          MtField(label: s.cvOutChannels, child: MtSegment<String>(value: _ao['channels'].toString(), onChanged: (v) => _setA('channels', v),
              items: [('source', s.cvOutAsSource, null), ('stereo', s.cvOutStereo, null), ('mono', s.cvOutMono, null)])),
        ],
      _ => [
          _row(wide, [
            MtField(label: s.cvOutQuality, child: _select<String>(_vo['quality'].toString(), [('high', s.cvOutQHigh), ('medium', s.cvOutQMedium), ('low', s.cvOutQLow)], (v) => _setV('quality', v))),
            MtField(label: s.cvOutResolution, hint: s.cvOutResolutionHint, child: _select<String>(_vo['resolution'].toString(), [for (final r in kResolutions) (r, r == 'source' ? s.cvOutAsSource : '${r}p')], (v) => _setV('resolution', v))),
          ]),
          const SizedBox(height: 14),
          _row(wide, [
            MtField(label: s.cvOutFps, child: _select<String>(_vo['fps'].toString(), [for (final f in kFps) (f, f == 'source' ? s.cvOutAsSource : '$f fps')], (v) => _setV('fps', v))),
            MtField(label: s.cvOutCodec, hint: s.cvOutCodecHint, child: _select<String>(_vo['codec'].toString(), [('h264', s.cvOutH264), ('h265', s.cvOutH265)], (v) => _setV('codec', v))),
          ]),
          const SizedBox(height: 14),
          _row(wide, [
            MtField(label: s.cvOutSpeed, child: _select<String>(_vo['speed'].toString(), [('veryfast', s.cvOutSpeedVeryfast), ('fast', s.cvOutSpeedFast), ('medium', s.cvOutSpeedMedium), ('slow', s.cvOutSpeedSlow)], (v) => _setV('speed', v))),
            MtField(label: s.cvOutAudioBitrate, child: _select<String>(_vo['audioBitrate'].toString(), [for (final b in kAudioBitrates) (b, '$b kbps')], (v) => _setV('audioBitrate', v))),
          ]),
          const SizedBox(height: 14),
          MtCheck(value: _vo['noAudio'] == true, onChanged: (v) => _setV('noAudio', v), label: s.cvOutNoAudio),
        ],
    };
    return ListView(padding: const EdgeInsets.fromLTRB(22, 18, 22, 24), children: children);
  }

  void _setV(String k, Object? v) => setState(() => _opt = {..._opt, 'video': {..._vo, k: v}});
  void _setA(String k, Object? v) => setState(() => _opt = {..._opt, 'audio': {..._ao, k: v}});

  // ---- Konuşma (whisper.cpp; model tiny/base/small — medium/turbo ve perWindow mobilde kapalı, veri korunur)
  Widget _speechTab(MtStrings s, MtColors col, bool wide) {
    final modelLabel = {'tiny': s.cvSpeechModelTiny, 'base': s.cvSpeechModelBase, 'small': s.cvSpeechModelSmall, 'medium': s.cvSpeechModelMedium, 'turbo': s.cvSpeechModelTurbo};
    final on = _speech['enabled'] == true;
    final model = _speech['model'].toString();
    final mobileOk = kMobileSpeechModels.contains(model);
    return ListView(padding: const EdgeInsets.fromLTRB(22, 18, 22, 24), children: [
      MtCheck(value: on, onChanged: (v) => setState(() => _speech['enabled'] = v), label: s.cvPfSpeechAsk, hint: s.cvPfSpeechAskHint),
      const SizedBox(height: 14),
      Opacity(opacity: on ? 1 : .5, child: Column(crossAxisAlignment: CrossAxisAlignment.stretch, children: [
        _row(wide, [
          MtField(label: s.cvPfSpeechModel, hint: mobileOk ? null : _tSpeechModelFallback,
              child: _select<String>(model, [for (final m in kSpeechModels) (m, kMobileSpeechModels.contains(m) ? (modelLabel[m] ?? m) : '${modelLabel[m] ?? m} — ${s.cvMobNotOnMobile}')],
                  (v) { if (v != null && kMobileSpeechModels.contains(v)) setState(() => _speech['model'] = v); })),
          MtField(label: s.cvPfSpeechLang, child: _select<String>(_speech['language'].toString(), [for (final l in kSpeechLangs) (l, l == 'auto' ? s.cvSpeechLangAuto : l.toUpperCase())],
              (v) { if (v != null) setState(() => _speech['language'] = v); })),
        ]),
        const SizedBox(height: 14),
        Opacity(opacity: .5, child: IgnorePointer(child: MtCheck(value: _speech['perWindow'] == true, onChanged: (_) {}, label: '${s.cvPfPerWindow} · ${s.cvMobNotOnMobile}', hint: _tPerWindowMob))),
      ])),
      const SizedBox(height: 14),
      Text(_tSpeechNote, style: MtText.small.copyWith(color: col.text3, height: 1.45)),
    ]);
  }

  // ---- OCR (ML Kit; Kiril/Arap/İbrani/Yunan dilleri mobilde okunmaz, seçim masaüstü için korunur)
  Widget _ocrTab(MtStrings s, MtColors col) {
    final langs = ((_ocr['languages'] as List?) ?? const []).map((x) => x.toString()).toList();
    final on = _ocr['enabled'] == true;
    final unsupported = ocrUnsupportedIn(langs);
    void toggle(String l) {
      if (langs.contains(l)) { if (langs.length > 1) langs.remove(l); }
      else if (langs.length >= 6) { mtToast(context, _tOcrMax, type: 'err'); return; }
      else { langs.add(l); }
      setState(() => _ocr['languages'] = langs);
    }
    return ListView(padding: const EdgeInsets.fromLTRB(22, 18, 22, 24), children: [
      MtCheck(value: on, onChanged: (v) => setState(() => _ocr['enabled'] = v), label: s.cvPfOcrAsk, hint: s.cvPfOcrAskHint),
      const SizedBox(height: 14),
      Opacity(opacity: on ? 1 : .5, child: MtField(label: s.cvPfOcrLangs, hint: s.cvPfOcrLangsHint, child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        Wrap(spacing: 6, runSpacing: 6, children: [for (final l in kOcrLangs) Opacity(opacity: kOcrUnsupportedMobile.contains(l) ? .55 : 1, child: _chip(col, l, langs.contains(l), false, () => toggle(l)))]),
        if (unsupported.isNotEmpty) ...[const SizedBox(height: 6), Text('${unsupported.join(', ')}: $_tOcrUnsupported', style: MtText.small.copyWith(color: col.warn))],
      ]))),
      const SizedBox(height: 14),
      Text(_tOcrNote, style: MtText.small.copyWith(color: col.text3, height: 1.45)),
    ]);
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
          items: [for (final it in items) DropdownMenuItem(value: it.$1, child: Text(it.$2, maxLines: 1, overflow: TextOverflow.ellipsis))], onChanged: onChanged)),
    );
  }
}
