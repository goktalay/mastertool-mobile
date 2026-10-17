// Convert Master proje ekranı (mobil) — masaüstü proje penceresi: üst çubukta tür simgesi, ad, kaynak→hedef rozeti, Başlat / Durdur,
// menü (dosya ekle, galeriden ekle, çıktıları paylaş, çevrilmiş dosyaları sil, proje ayarları, modül ayarları); dosya listesi
// (# · ad · boyut · ilerleme · durum · çıktı), filtre (Tümü / Bekleyen / Süren / Tamamlanan / Hatalı) ve arama; tablette sağda
// Orijinal / Dönüştürülmüş paneli (resimde önizleme), telefonda alt sayfa; altta durum çubuğu (dosya · tamam · hata · ilerleme · çıktı · aynı anda).
// Metin paneli (masaüstü Metin / Metin (OCR) paneli): metin işi durumu + aşama, cümleler (saniye · dil · metin) ya da OCR satırları
// (satır · güven · metin), Tümünü kopyala, Metni dışa aktar (SRT/VTT/TXT/CSV/JSON → paylaş), Metne çevir / Metni oku, Metni sil.
import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart' show Clipboard, ClipboardData;
import 'package:image_picker/image_picker.dart';
import 'package:share_plus/share_plus.dart';

import '../../core/l10n/gen/mt_strings.dart';
import '../../core/sync.dart';
import '../../core/theme.dart';
import '../../widgets/mt_widgets.dart';
import 'cv_engine.dart';
import 'cv_formats.dart';
import 'cv_model.dart';
import 'cv_text_formats.dart';

// Sabit metinler (ARB'ye henüz eklenmedi; TR)
const _tShareAllTexts = 'Tüm metinleri paylaş';
const _tShareText = 'Metni paylaş';
const _tDeleteText = 'Metni sil';
const _tCancelText = 'Metin işini iptal et';
const _tPhaseDownload = 'Konuşma modeli indiriliyor';
const _tPhaseWav = 'Ses hazırlanıyor (16 kHz WAV)…';
const _tPhaseRunSpeech = 'Konuşma metne çevriliyor… (süre dosya uzunluğuna bağlı)';
const _tPhaseRunOcr = 'Metin okunuyor…';
const _tTextsCount = 'metin';
const _tNoTextsYet = 'Henüz metin yok.';
const _tFmtJson = 'JSON';

class CvProjectScreen extends StatefulWidget {
  const CvProjectScreen({super.key, required this.projectId, required this.engine, this.runner, required this.onEditProject, required this.onModuleSettings});
  final String projectId;
  final SyncEngine engine;
  /// Testler için hazır runner; yoksa CvRunners.of ile açılır.
  final CvRunner? runner;
  final Future<void> Function(BuildContext ctx) onEditProject;
  final void Function(BuildContext ctx) onModuleSettings;
  @override
  State<CvProjectScreen> createState() => _CvProjectScreenState();
}

class _CvProjectScreenState extends State<CvProjectScreen> {
  CvRunner? _r;
  String _filter = 'all';
  String _q = '';
  String? _selected;

  @override
  void initState() {
    super.initState();
    widget.engine.addListener(_refresh);
    if (widget.runner != null) {
      _attach(widget.runner!);
    } else {
      CvRunners.of(widget.projectId, widget.engine).then((r) { if (mounted) _attach(r); });
    }
  }

  void _attach(CvRunner r) { _r = r; r.addListener(_refresh); setState(() {}); }
  void _refresh() { if (mounted) setState(() {}); }

  @override
  void dispose() {
    widget.engine.removeListener(_refresh);
    _r?.removeListener(_refresh);
    super.dispose();
  }

  CvProject? get _p => _r?.project;

  Future<void> _addFiles() async {
    final p = _p;
    if (p == null) return;
    final res = await FilePicker.pickFiles(type: FileType.any);
    if (res.isEmpty) return;
    final paths = res.map((f) => f.path).whereType<String>().toList();
    final n = await _r!.addFiles(paths);
    if (!mounted) return;
    final s = MtStrings.of(context);
    if (n < paths.length) mtToast(context, '${s.cvMobFilesCount(paths.length - n)}: ${s.cvMobUnsupportedExt}', type: 'err');
    if (n > 0) mtToast(context, s.cvMobFilesAdded(n), type: 'ok');
  }

  Future<void> _addFromGallery() async {
    final p = _p;
    if (p == null) return;
    final picker = ImagePicker();
    final files = p.type == 'image' ? await picker.pickMultiImage() : await picker.pickMultipleMedia();
    if (files.isEmpty) return;
    final n = await _r!.addFiles(files.map((f) => f.path).toList());
    if (!mounted) return;
    final s = MtStrings.of(context);
    if (n < files.length) mtToast(context, '${s.cvMobFilesCount(files.length - n)}: ${s.cvMobUnsupportedExt}', type: 'err');
    if (n > 0) mtToast(context, s.cvMobFilesAdded(n), type: 'ok');
  }

  Future<void> _share(List<String> paths, String subject) async {
    final files = [for (final p in paths) if (await File(p).exists()) XFile(p)];
    if (files.isEmpty) { if (mounted) mtToast(context, MtStrings.of(context).cvMobNoOutputsYet); return; }
    await SharePlus.instance.share(ShareParams(files: files, subject: subject));
  }

  Future<bool> _confirm(String title, String msg) async {
    final s = MtStrings.of(context);
    return await showDialog<bool>(context: context, builder: (ctx) => AlertDialog(
          title: Text(title), content: Text(msg), actionsPadding: const EdgeInsets.fromLTRB(22, 0, 22, 18),
          actions: [MtButton(label: s.commonCancel, onPressed: () => Navigator.pop(ctx, false)), MtButton(label: s.commonDelete, kind: MtBtnKind.dangerPrimary, onPressed: () => Navigator.pop(ctx, true))],
        )) ?? false;
  }

  static String _plain(String html) => html.replaceAll(RegExp(r'<[^>]+>'), '');

  Future<void> _menu(Offset pos) async {
    final s = MtStrings.of(context);
    final p = _p!;
    Widget mi(IconData i, String t, {bool danger = false}) => Row(children: [Icon(i, size: 16, color: danger ? MtColors.of(context).err : null), const SizedBox(width: 10), Text(t)]);
    final r = await showMenu<String>(context: context, position: RelativeRect.fromLTRB(pos.dx, pos.dy, pos.dx, pos.dy), items: [
      PopupMenuItem(value: 'add', child: mi(Icons.note_add_outlined, s.cvMobAddFiles)),
      if (p.type != 'audio') PopupMenuItem(value: 'gallery', child: mi(Icons.photo_library_outlined, s.cvMobAddFromGallery)),
      PopupMenuItem(value: 'share', child: mi(Icons.ios_share, s.cvMobShareAllOutputs)),
      if (_r!.textDoneCount > 0) PopupMenuItem(value: 'sharetext', child: mi(Icons.text_snippet_outlined, _tShareAllTexts)),
      const PopupMenuDivider(),
      PopupMenuItem(value: 'edit', child: mi(Icons.tune, s.cvAppProjectSettings)),
      PopupMenuItem(value: 'settings', child: mi(Icons.settings_outlined, s.cvMobModuleSettings)),
      const PopupMenuDivider(),
      PopupMenuItem(value: 'clear', child: mi(Icons.delete_sweep_outlined, s.cvPjClearOutputs, danger: true)),
    ]);
    if (!mounted || r == null) return;
    switch (r) {
      case 'add': await _addFiles();
      case 'gallery': await _addFromGallery();
      case 'share': await _share([for (final src in _r!.sources) if (_r!.outPath(src.name) != null) _r!.outPath(src.name)!], p.name);
      case 'sharetext':
        final paths = <String>[];
        for (final src in _r!.sources) {
          if (_r!.jobs[src.name]?.text.status != CvStatus.done) continue;
          final f = await _r!.exportText(src.name, p.type == 'image' ? 'txt' : 'srt');
          if (f != null) paths.add(f);
        }
        if (!mounted) return;
        if (paths.isEmpty) { mtToast(context, _tNoTextsYet); return; }
        await _share(paths, p.name);
      case 'edit': await widget.onEditProject(context);
      case 'settings': widget.onModuleSettings(context);
      case 'clear':
        if (await _confirm(s.cvAppClearOutputs, _plain(s.cvAppClearOutputsMsg(p.name)))) await _r!.clearOutputs();
    }
  }

  Future<void> _fileMenu(CvSource src, Offset pos) async {
    final s = MtStrings.of(context);
    final r = _r!;
    final j = r.jobs[src.name] ?? CvJob();
    final c = MtColors.of(context);
    Widget mi(IconData i, String t, {bool danger = false}) => Row(children: [Icon(i, size: 16, color: danger ? c.err : null), const SizedBox(width: 10), Text(t)]);
    final active = j.status == CvStatus.converting || j.status == CvStatus.queued;
    final t = j.text;
    final tActive = t.status == CvStatus.converting || t.status == CvStatus.queued;
    final isImg = _p!.type == 'image';
    final res = await showMenu<String>(context: context, position: RelativeRect.fromLTRB(pos.dx, pos.dy, pos.dx, pos.dy), items: [
      if (active) PopupMenuItem(value: 'cancel', child: mi(Icons.stop_circle_outlined, s.commonCancel))
      else PopupMenuItem(value: 'convert', child: mi(Icons.play_arrow, j.status == CvStatus.done ? s.cvPjReconvert : s.cvPjConvertThis)),
      if (j.status == CvStatus.done) PopupMenuItem(value: 'share', child: mi(Icons.ios_share, s.cvMobShareOutput)),
      if (j.status == CvStatus.done) PopupMenuItem(value: 'delout', child: mi(Icons.delete_outline, s.cvPjDeleteOut)),
      const PopupMenuDivider(),
      if (tActive) PopupMenuItem(value: 'tcancel', child: mi(Icons.stop_circle_outlined, _tCancelText))
      else PopupMenuItem(value: 'text', child: mi(isImg ? Icons.text_fields : Icons.mic_none, _textActionLabel(s, t, isImg))),
      if (t.status == CvStatus.done) PopupMenuItem(value: 'tshare', child: mi(Icons.ios_share, _tShareText)),
      if (t.status == CvStatus.done) PopupMenuItem(value: 'tdel', child: mi(Icons.delete_outline, _tDeleteText)),
      const PopupMenuDivider(),
      PopupMenuItem(value: 'remove', child: mi(Icons.playlist_remove, s.cvPjUncheck, danger: true)),
    ]);
    if (!mounted || res == null) return;
    switch (res) {
      case 'cancel': r.cancel(src.name); setState(() {});
      case 'convert': r.convertOne(src.name);
      case 'share': await _share([r.outPath(src.name)!], src.name);
      case 'delout': await r.deleteOutput(src.name);
      case 'tcancel': r.cancelText(src.name); setState(() {});
      case 'text': r.transcribeOne(src.name);
      case 'tshare': await _shareText(src.name, pos);
      case 'tdel': await r.deleteText(src.name);
      case 'remove': await r.remove(src.name); if (_selected == src.name) _selected = null;
    }
  }

  String _textActionLabel(MtStrings s, CvTextJob t, bool isImg) =>
      isImg ? (t.status == CvStatus.done ? s.cvPjReocr : s.cvPjOcrThis) : (t.status == CvStatus.done ? s.cvPjRetranscribe : s.cvPjTranscribeThis);

  /// Biçim seç (SRT/VTT/TXT/CSV/JSON ya da OCR için TXT/CSV/JSON) → geçici dosya → paylaş.
  Future<void> _shareText(String name, Offset pos) async {
    final s = MtStrings.of(context);
    final isImg = _p!.type == 'image';
    final fmts = isImg ? kOcrExportFormats : kTranscriptFormats;
    String label(String f) => switch (f) { 'srt' => s.cvPjFmtSrt, 'vtt' => s.cvPjFmtVtt, 'txt' => s.cvPjFmtTxt, 'csv' => s.cvPjFmtCsv, _ => _tFmtJson };
    final f = await showMenu<String>(context: context, position: RelativeRect.fromLTRB(pos.dx, pos.dy, pos.dx, pos.dy),
        items: [for (final x in fmts) PopupMenuItem(value: x, child: Text(label(x)))]);
    if (f == null || !mounted) return;
    final path = await _r!.exportText(name, f);
    if (!mounted) return;
    if (path == null) { mtToast(context, s.cvPjTrNoExport); return; }
    await _share([path], name);
  }

  Future<void> _copyText(String name) async {
    final s = MtStrings.of(context);
    final r = _r!;
    final String text;
    if (_p!.type == 'image') {
      final o = await r.readOcr(name);
      text = o == null ? '' : o.lines.map((l) => l.text).join('\n');
    } else {
      text = (await r.readSegments(name)).map((x) => x.text).join('\n');
    }
    if (!mounted) return;
    if (text.isEmpty) { mtToast(context, s.cvPjTrNoExport); return; }
    await Clipboard.setData(ClipboardData(text: text));
    if (mounted) mtToast(context, s.cvPjCopied, type: 'ok');
  }

  String _statusText(MtStrings s, CvJob? j) => switch (j?.status ?? CvStatus.pending) {
        CvStatus.pending => s.cvStPending, CvStatus.queued => s.cvStQueued, CvStatus.converting => s.cvStConverting,
        CvStatus.done => s.cvStDone, CvStatus.error => s.cvStError, CvStatus.canceled => s.cvStCanceled };

  String _errText(MtStrings s, String? e) {
    final (code, msg) = CvRunner.splitError(e);
    return switch (code) {
      'canceled' => s.cvErrCanceled, 'no_video' => s.cvErrNoVideo, 'no_audio' => s.cvErrNoAudio, 'unreadable' => s.cvErrUnreadable,
      'unsupported' => s.cvErrUnsupported, 'ffmpeg_missing' => s.cvErrFfmpegMissing(msg), 'ffmpeg_failed' => s.cvErrFfmpeg(msg),
      'ocr_failed' => s.cvErrOcr(msg), 'whisper_failed' => s.cvErrWhisper(msg), 'download_failed' => s.cvErrDownload(msg), _ => e ?? '' };
  }

  /// Metin işi aşaması (ilerleme bilinmez; indirmede yüzde gösterilir).
  String _phaseText(MtStrings s, CvTextJob t, bool isImg) => switch (t.phase) {
        CvTextPhase.download => '$_tPhaseDownload… %${(t.progress * 100).round()}',
        CvTextPhase.wav => _tPhaseWav,
        CvTextPhase.run => isImg ? _tPhaseRunOcr : _tPhaseRunSpeech,
        CvTextPhase.none => t.status == CvStatus.queued ? s.cvStQueued : '' };

  @override
  Widget build(BuildContext context) {
    final s = MtStrings.of(context);
    final c = MtColors.of(context);
    final r = _r;
    final p = _p;
    if (r == null || p == null) return const Scaffold(body: Center(child: CircularProgressIndicator()));
    final wide = MtBreak.wide(context);
    final col = p.colorValue;
    final typeIcon = switch (p.type) { 'image' => Icons.image_outlined, 'audio' => Icons.music_note_outlined, _ => Icons.videocam_outlined };
    final q = _q.trim().toLowerCase();
    final list = r.sources.where((src) {
      final j = r.jobs[src.name];
      final st = j?.status ?? CvStatus.pending;
      final okF = switch (_filter) {
        'pending' => st == CvStatus.pending || st == CvStatus.queued || st == CvStatus.canceled,
        'active' => st == CvStatus.converting, 'done' => st == CvStatus.done, 'error' => st == CvStatus.error, _ => true };
      return okF && (q.isEmpty || src.name.toLowerCase().contains(q));
    }).toList();
    final srcLabel = p.sourceExts.length == p.typeInfo.source.length ? s.cvAppAllExts : p.sourceExts.take(3).map((e) => e.toUpperCase()).join(', ') + (p.sourceExts.length > 3 ? '…' : '');

    final header = Container(
      padding: EdgeInsets.symmetric(vertical: 8, horizontal: wide ? 16 : 8),
      decoration: BoxDecoration(color: c.topbarBg, border: Border(bottom: BorderSide(color: c.border))),
      child: Row(children: [
        MtIconButton(icon: Icons.arrow_back, onPressed: () => Navigator.of(context).maybePop()),
        const SizedBox(width: 4),
        Container(width: 34, height: 34, decoration: BoxDecoration(color: col.withValues(alpha: .18), borderRadius: BorderRadius.circular(10)), child: Icon(typeIcon, size: 18, color: col)),
        const SizedBox(width: 10),
        Expanded(child: Column(crossAxisAlignment: CrossAxisAlignment.start, mainAxisSize: MainAxisSize.min, children: [
          Row(children: [
            Flexible(child: Text(p.name, maxLines: 1, overflow: TextOverflow.ellipsis, style: MtText.brand.copyWith(color: c.text))),
            if (wide) ...[const SizedBox(width: 10), _pill(c, srcLabel), Padding(padding: const EdgeInsets.symmetric(horizontal: 4), child: Icon(Icons.arrow_forward, size: 12, color: c.text3)), _pill(c, p.targetExt.toUpperCase(), tone: col)],
          ]),
          Text(wide ? s.cvMobFilesCount(r.sources.length) : '$srcLabel → ${p.targetExt.toUpperCase()} · ${s.cvMobFilesCount(r.sources.length)}', maxLines: 1, overflow: TextOverflow.ellipsis, style: MtText.mono.copyWith(color: c.text3)),
        ])),
        const SizedBox(width: 8),
        if (wide) ...[MtButton(label: s.cvMobAddFiles, icon: Icons.note_add_outlined, onPressed: _addFiles), const SizedBox(width: 8)],
        r.running
            ? MtButton(label: s.cvPjStop, icon: Icons.stop, kind: MtBtnKind.dangerPrimary, small: !wide, onPressed: r.stop)
            : MtButton(label: s.cvPjStart, icon: Icons.play_arrow, kind: MtBtnKind.primary, small: !wide, onPressed: r.sources.isEmpty ? null : r.start),
        const SizedBox(width: 4),
        Builder(builder: (ctx) => MtIconButton(icon: Icons.more_vert, onPressed: () { final b = ctx.findRenderObject() as RenderBox; final o = b.localToGlobal(Offset(0, b.size.height)); _menu(o); })),
      ]),
    );

    final filterBar = Padding(
      padding: EdgeInsets.fromLTRB(wide ? 16 : 10, 10, wide ? 16 : 10, 6),
      child: Row(children: [
        Expanded(child: Container(
          height: 34, decoration: BoxDecoration(color: c.surface, border: Border.all(color: c.border), borderRadius: BorderRadius.circular(9)),
          child: TextField(onChanged: (v) => setState(() => _q = v), style: MtText.body, decoration: InputDecoration(hintText: s.cvPjFilterPh, prefixIcon: Icon(Icons.search, size: 16, color: c.text3),
              filled: false, border: InputBorder.none, enabledBorder: InputBorder.none, focusedBorder: InputBorder.none, isDense: true, contentPadding: const EdgeInsets.symmetric(vertical: 8))),
        )),
        const SizedBox(width: 8),
        Flexible(child: SingleChildScrollView(scrollDirection: Axis.horizontal, child: MtSegment<String>(value: _filter, onChanged: (v) => setState(() => _filter = v),
            items: [('all', s.cvPjFAll, null), ('pending', s.cvPjFPending, null), ('active', s.cvPjFActive, null), ('done', s.cvPjFDone, null), ('error', s.cvPjFError, null)]))),
      ]),
    );

    Widget body;
    if (r.sources.isEmpty) {
      body = Center(child: ConstrainedBox(constraints: const BoxConstraints(maxWidth: 340), child: CustomPaint(
        painter: _Dashed(c.borderStrong),
        child: Padding(padding: const EdgeInsets.all(24), child: Column(mainAxisSize: MainAxisSize.min, children: [
          Container(width: 56, height: 56, decoration: BoxDecoration(gradient: MtColors.grad, borderRadius: BorderRadius.circular(16)), child: const Icon(Icons.note_add_outlined, color: MtColors.onAccent, size: 28)),
          const SizedBox(height: 14),
          Text(s.cvPjNoSourceTitle.replaceAll('bilgisayarda', 'cihazda'), textAlign: TextAlign.center, style: TextStyle(fontSize: 17, fontWeight: FontWeight.w600, color: c.text)),
          const SizedBox(height: 6),
          Text(s.cvMobPickFilesHint, textAlign: TextAlign.center, style: MtText.small.copyWith(color: c.text3)),
          const SizedBox(height: 16),
          Wrap(spacing: 8, runSpacing: 8, alignment: WrapAlignment.center, children: [
            MtButton(label: s.cvMobAddFiles, icon: Icons.note_add_outlined, kind: MtBtnKind.primary, onPressed: _addFiles),
            if (p.type != 'audio') MtButton(label: s.cvMobAddFromGallery, icon: Icons.photo_library_outlined, onPressed: _addFromGallery),
          ]),
        ])),
      )));
    } else {
      final listView = Column(children: [
        filterBar,
        _tableHead(s, c, wide),
        Expanded(child: list.isEmpty
            ? Center(child: Text(s.cvPjNoMatch, style: MtText.small.copyWith(color: c.text3)))
            : ListView.builder(padding: const EdgeInsets.only(bottom: 12), itemCount: list.length, itemBuilder: (_, i) => _fileRow(s, c, p, r, list[i], i + 1, wide))),
      ]);
      body = wide
          ? Row(children: [
              Expanded(flex: 3, child: listView),
              VerticalDivider(width: 1, color: c.border),
              Expanded(flex: 2, child: _detail(s, c, p, r, _selected)),
            ])
          : listView;
    }

    final done = r.doneCount, err = r.errorCount;
    final status = Container(
      padding: EdgeInsets.symmetric(horizontal: wide ? 16 : 10, vertical: 6),
      decoration: BoxDecoration(color: c.bg2, border: Border(top: BorderSide(color: c.border))),
      child: Row(children: [
        Icon(Icons.description_outlined, size: 13, color: c.text3), const SizedBox(width: 4),
        Text(s.cvPjStTotal('${r.sources.length}'), style: MtText.tiny.copyWith(color: c.text2)),
        const SizedBox(width: 12),
        Icon(Icons.check, size: 13, color: c.ok), const SizedBox(width: 4),
        Text(s.cvPjStDone('$done'), style: MtText.tiny.copyWith(color: c.text2)),
        if (err > 0) ...[const SizedBox(width: 12), Icon(Icons.error_outline, size: 13, color: c.err), const SizedBox(width: 4), Text(s.cvPjStErr('$err'), style: MtText.tiny.copyWith(color: c.text2))],
        if (r.activeCount > 0) ...[const SizedBox(width: 12), MtSpinner(size: 11, color: c.accent), const SizedBox(width: 4), Text(s.cvPjStActive('${r.activeCount}'), style: MtText.tiny.copyWith(color: c.text2))],
        if (r.textRunning) ...[const SizedBox(width: 12), Icon(p.type == 'image' ? Icons.text_fields : Icons.mic_none, size: 13, color: c.accent), const SizedBox(width: 4),
            Text(s.cvPjStSpeech('${r.textActiveCount + r.textQueuedCount}'), style: MtText.tiny.copyWith(color: c.text2))]
        else if (r.textDoneCount > 0) ...[const SizedBox(width: 12), Icon(Icons.text_snippet_outlined, size: 13, color: c.ok), const SizedBox(width: 4),
            Text('${r.textDoneCount} $_tTextsCount', style: MtText.tiny.copyWith(color: c.text2))],
        const SizedBox(width: 12),
        Expanded(child: _bar(c, r.overall, height: 5)),
        const SizedBox(width: 8),
        Text('${(r.overall * 100).round()}%', style: MtText.tiny.copyWith(color: c.text2)),
        if (wide) ...[const SizedBox(width: 12), Text(s.cvPjStOut(fmtSize(r.outTotal)), style: MtText.tiny.copyWith(color: c.text3)),
            const SizedBox(width: 12), Text(s.cvPjStConc('${p.concurrency.clamp(1, kMobileMaxConcurrency)}'), style: MtText.tiny.copyWith(color: c.text3))],
      ]),
    );

    return Scaffold(body: MtBackground(child: SafeArea(child: Column(children: [header, Expanded(child: body), status]))));
  }

  Widget _pill(MtColors c, String t, {Color? tone}) => Container(
        padding: const EdgeInsets.symmetric(horizontal: 7, vertical: 2),
        decoration: BoxDecoration(color: (tone ?? c.text2).withValues(alpha: tone == null ? .10 : .18), borderRadius: BorderRadius.circular(6), border: Border.all(color: (tone ?? c.border).withValues(alpha: tone == null ? 1 : .5))),
        child: Text(t, style: MtText.mono.copyWith(fontSize: 10.5, fontWeight: FontWeight.w700, color: tone ?? c.text2)),
      );

  Widget _bar(MtColors c, double v, {double height = 6}) => ClipRRect(
        borderRadius: BorderRadius.circular(height),
        child: Container(height: height, color: c.surface3, alignment: AlignmentDirectional.centerStart,
            child: FractionallySizedBox(widthFactor: v.clamp(0, 1), child: Container(decoration: const BoxDecoration(gradient: MtColors.grad)))),
      );

  Widget _tableHead(MtStrings s, MtColors c, bool wide) {
    final st = MtText.tiny.copyWith(color: c.text3, fontWeight: FontWeight.w600);
    return Container(
      padding: EdgeInsets.fromLTRB(wide ? 16 : 10, 6, wide ? 16 : 10, 6),
      decoration: BoxDecoration(border: Border(bottom: BorderSide(color: c.border))),
      child: Row(children: [
        SizedBox(width: 24, child: Text('#', style: st)),
        Expanded(flex: 5, child: Text(s.cvPjColName, style: st)),
        SizedBox(width: 64, child: Text(s.cvPjColSize, style: st, textAlign: TextAlign.end)),
        if (wide) SizedBox(width: 140, child: Padding(padding: const EdgeInsets.only(left: 12), child: Text(s.cvPjColProgress, style: st))),
        SizedBox(width: wide ? 120 : 96, child: Padding(padding: const EdgeInsets.only(left: 12), child: Text(s.cvPjColStatus, style: st))),
        if (wide) SizedBox(width: 72, child: Text(s.cvPjColOut, style: st, textAlign: TextAlign.end)),
      ]),
    );
  }

  Widget _fileRow(MtStrings s, MtColors c, CvProject p, CvRunner r, CvSource src, int no, bool wide) {
    final j = r.jobs[src.name] ?? CvJob();
    final sel = _selected == src.name;
    final (IconData sIcon, Color sCol) = switch (j.status) {
      CvStatus.done => (Icons.check, c.ok), CvStatus.error => (Icons.error_outline, c.err), CvStatus.converting => (Icons.sync, c.accent),
      CvStatus.queued => (Icons.schedule, c.text2), CvStatus.canceled => (Icons.block, c.warn), CvStatus.pending => (Icons.schedule, c.text3) };
    final typeIcon = switch (p.type) { 'image' => Icons.image_outlined, 'audio' => Icons.music_note_outlined, _ => Icons.videocam_outlined };
    final prog = j.status == CvStatus.done ? 1.0 : j.progress;
    final t = j.text;
    final (Color tCol, bool tShow) = switch (t.status) {
      CvStatus.done => (c.ok, true), CvStatus.error => (c.err, true), CvStatus.converting => (c.accent, true), CvStatus.queued => (c.text2, true), _ => (c.text3, false) };
    return GestureDetector(
      onLongPressStart: (d) => _fileMenu(src, d.globalPosition),
      onSecondaryTapDown: (d) => _fileMenu(src, d.globalPosition),
      child: Material(
        color: sel ? c.accent.withValues(alpha: .08) : Colors.transparent,
        child: InkWell(
          onTap: () { setState(() => _selected = src.name); if (!wide) _showDetailSheet(src.name); },
          child: Container(
            padding: EdgeInsets.fromLTRB(wide ? 16 : 10, 8, wide ? 16 : 10, 8),
            decoration: BoxDecoration(border: Border(bottom: BorderSide(color: c.border.withValues(alpha: .6)), left: BorderSide(color: sel ? c.accent : Colors.transparent, width: 2))),
            child: Row(children: [
              SizedBox(width: 24, child: Text('$no', style: MtText.tiny.copyWith(color: c.text3))),
              Expanded(flex: 5, child: Row(children: [
                Icon(typeIcon, size: 15, color: p.colorValue), const SizedBox(width: 8),
                Expanded(child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                  Text(src.name, maxLines: 1, overflow: TextOverflow.ellipsis, style: MtText.body.copyWith(color: c.text)),
                  if (!wide) Padding(padding: const EdgeInsets.only(top: 4, right: 8), child: _bar(c, prog, height: 4)),
                  if (j.status == CvStatus.error && j.error != null) Text(_errText(s, j.error), maxLines: 1, overflow: TextOverflow.ellipsis, style: MtText.tiny.copyWith(color: c.err)),
                  if (t.status == CvStatus.converting) Text(_phaseText(s, t, p.type == 'image'), maxLines: 1, overflow: TextOverflow.ellipsis, style: MtText.tiny.copyWith(color: c.accent)),
                ])),
              ])),
              if (tShow) Padding(padding: const EdgeInsets.only(left: 6), child: t.status == CvStatus.converting
                  ? MtSpinner(size: 11, color: tCol)
                  : Icon(p.type == 'image' ? Icons.text_fields : Icons.mic_none, size: 13, color: tCol)),
              SizedBox(width: 64, child: Text(fmtSize(src.size), textAlign: TextAlign.end, style: MtText.tiny.copyWith(color: c.text2))),
              if (wide) SizedBox(width: 140, child: Padding(padding: const EdgeInsets.only(left: 12), child: Row(children: [
                Expanded(child: _bar(c, prog)), const SizedBox(width: 6),
                SizedBox(width: 34, child: Text('${(prog * 100).round()}%', textAlign: TextAlign.end, style: MtText.tiny.copyWith(color: c.text2))),
              ]))),
              SizedBox(width: wide ? 120 : 96, child: Padding(padding: const EdgeInsets.only(left: 12), child: Row(children: [
                j.status == CvStatus.converting ? MtSpinner(size: 12, color: sCol) : Icon(sIcon, size: 13, color: sCol), const SizedBox(width: 5),
                Flexible(child: Text(_statusText(s, j), maxLines: 1, overflow: TextOverflow.ellipsis, style: MtText.tiny.copyWith(color: sCol))),
              ]))),
              if (wide) SizedBox(width: 72, child: Text(j.status == CvStatus.done ? fmtSize(j.outSize) : '', textAlign: TextAlign.end, style: MtText.tiny.copyWith(color: c.ok))),
            ]),
          ),
        ),
      ),
    );
  }

  void _showDetailSheet(String name) {
    final c = MtColors.of(context);
    showModalBottomSheet(context: context, backgroundColor: c.surface, isScrollControlled: true,
        shape: const RoundedRectangleBorder(borderRadius: BorderRadius.vertical(top: Radius.circular(MtDim.radiusModal))),
        builder: (ctx) => AnimatedBuilder(animation: _r!, builder: (_, _) => SafeArea(child: SizedBox(height: MediaQuery.sizeOf(ctx).height * .6,
            child: _detail(MtStrings.of(ctx), c, _p!, _r!, name, sheet: true)))));
  }

  Widget _detail(MtStrings s, MtColors c, CvProject p, CvRunner r, String? name, {bool sheet = false}) {
    final src = name == null ? null : r.sources.where((x) => x.name == name).firstOrNull;
    if (src == null) return Center(child: Text(s.cvPjPickToPreview, style: MtText.small.copyWith(color: c.text3)));
    final j = r.jobs[src.name] ?? CvJob();
    final out = r.outPath(src.name);
    final isImg = p.type == 'image';
    Widget preview(String? path, bool outSide) {
      if (!isImg || path == null) {
        return Container(height: 120, alignment: Alignment.center, decoration: BoxDecoration(color: c.bg2, borderRadius: BorderRadius.circular(10), border: Border.all(color: c.border)),
            child: Icon(outSide ? Icons.arrow_forward : (p.type == 'audio' ? Icons.graphic_eq : Icons.movie_outlined), size: 28, color: c.text3));
      }
      return ClipRRect(borderRadius: BorderRadius.circular(10), child: Container(height: 160, color: c.bg2, alignment: Alignment.center,
          child: Image.file(File(path), fit: BoxFit.contain, errorBuilder: (_, _, _) => Icon(Icons.broken_image_outlined, color: c.text3))));
    }
    final ratio = j.status == CvStatus.done && src.size > 0 ? ((j.outSize - src.size) / src.size * 100).round() : null;
    return ListView(padding: const EdgeInsets.all(16), children: [
      if (sheet) Center(child: Container(width: 36, height: 4, margin: const EdgeInsets.only(bottom: 12), decoration: BoxDecoration(color: c.borderStrong, borderRadius: BorderRadius.circular(2)))),
      MtSectionTitle(s.cvPjOriginal, hint: src.name),
      const SizedBox(height: 8),
      preview(r.srcPath(src.name), false),
      const SizedBox(height: 6),
      Text('${fmtSize(src.size)} · ${extOf(src.name).toUpperCase()}', style: MtText.mono.copyWith(color: c.text2)),
      const SizedBox(height: 16),
      MtSectionTitle(s.cvPjConverted, hint: j.out),
      const SizedBox(height: 8),
      preview(j.status == CvStatus.done ? out : null, true),
      const SizedBox(height: 6),
      if (j.status == CvStatus.done)
        Row(children: [
          Text('${fmtSize(j.outSize)} · ${p.targetExt.toUpperCase()}', style: MtText.mono.copyWith(color: c.text2)),
          if (ratio != null) ...[const SizedBox(width: 8), Container(padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 1),
              decoration: BoxDecoration(color: (ratio <= 0 ? c.ok : c.warn).withValues(alpha: .15), borderRadius: BorderRadius.circular(5)),
              child: Text('${ratio > 0 ? '+' : ''}$ratio%', style: MtText.tiny.copyWith(color: ratio <= 0 ? c.ok : c.warn, fontWeight: FontWeight.w600)))],
        ])
      else if (j.status == CvStatus.error)
        MtBox(_errText(s, j.error), kind: MtBoxKind.error, icon: Icons.error_outline)
      else if (j.status == CvStatus.converting)
        Row(children: [Expanded(child: _bar(c, j.progress)), const SizedBox(width: 8), Text('${(j.progress * 100).round()}%', style: MtText.tiny.copyWith(color: c.text2))])
      else
        Text(s.cvPjOutPreviewHint, style: MtText.small.copyWith(color: c.text3)),
      const SizedBox(height: 16),
      Wrap(spacing: 8, runSpacing: 8, children: [
        if (j.status == CvStatus.converting || j.status == CvStatus.queued)
          MtButton(label: s.commonCancel, small: true, icon: Icons.stop_circle_outlined, kind: MtBtnKind.danger, onPressed: () { r.cancel(src.name); setState(() {}); })
        else
          MtButton(label: j.status == CvStatus.done ? s.cvPjReconvert : s.cvPjConvertThis, small: true, icon: Icons.play_arrow, onPressed: () => r.convertOne(src.name)),
        if (j.status == CvStatus.done) MtButton(label: s.cvMobShareOutput, small: true, icon: Icons.ios_share, onPressed: () => _share([out!], src.name)),
        if (j.status == CvStatus.done) MtButton(label: s.cvPjDeleteOut, small: true, icon: Icons.delete_outline, onPressed: () => r.deleteOutput(src.name)),
        MtButton(label: s.cvPjUncheck, small: true, icon: Icons.playlist_remove, kind: MtBtnKind.danger, onPressed: () async { await r.remove(src.name); if (sheet && mounted) Navigator.of(context).pop(); }),
      ]),
      const SizedBox(height: 18),
      ..._textSection(s, c, p, r, src, j.text),
    ]);
  }

  // ---- Metin paneli (konuşma cümleleri / OCR satırları)
  List<Widget> _textSection(MtStrings s, MtColors c, CvProject p, CvRunner r, CvSource src, CvTextJob t) {
    final isImg = p.type == 'image';
    final active = t.status == CvStatus.converting || t.status == CvStatus.queued;
    final Widget body;
    if (active) {
      body = Column(crossAxisAlignment: CrossAxisAlignment.stretch, children: [
        Text(_phaseText(s, t, isImg), style: MtText.small.copyWith(color: c.text2)),
        const SizedBox(height: 6),
        t.phase == CvTextPhase.download ? _bar(c, t.progress) : ClipRRect(borderRadius: BorderRadius.circular(6), child: LinearProgressIndicator(minHeight: 6, color: c.accent, backgroundColor: c.surface3)),
      ]);
    } else if (t.status == CvStatus.error) {
      body = MtBox(_errText(s, t.error), kind: MtBoxKind.error, icon: Icons.error_outline);
    } else if (t.status == CvStatus.done) {
      body = t.note == 'no_audio'
          ? Text(s.cvPjNoAudio, style: MtText.small.copyWith(color: c.text3))
          : t.note == 'no_text'
              ? Text(isImg ? s.cvPjNoTextHint : s.cvPjTrNone, style: MtText.small.copyWith(color: c.text3))
              : _TextPreview(key: ValueKey('${src.name}|${t.out}|${t.count}'), runner: r, name: src.name, isImage: isImg);
    } else {
      body = Text(p.textEnabled ? (isImg ? s.cvPjOcrAfter : s.cvPjTrAfter) : (isImg ? s.cvPjOcrOff : s.cvPjTrOff), style: MtText.small.copyWith(color: c.text3, height: 1.45));
    }
    final count = t.status == CvStatus.done && t.note == null ? (isImg ? s.cvPjLines('${t.count}') : s.cvPjSegments('${t.count}')) : null;
    return [
      MtSectionTitle(isImg ? s.cvPjOcrPanel : s.cvPjTranscript, hint: count == null ? null : (t.lang.isEmpty ? count : '$count · ${t.lang.toUpperCase()}')),
      const SizedBox(height: 8),
      body,
      const SizedBox(height: 12),
      Wrap(spacing: 8, runSpacing: 8, children: [
        if (active)
          MtButton(label: s.commonCancel, small: true, icon: Icons.stop_circle_outlined, kind: MtBtnKind.danger, onPressed: () { r.cancelText(src.name); setState(() {}); })
        else
          MtButton(label: _textActionLabel(s, t, isImg), small: true, icon: isImg ? Icons.text_fields : Icons.mic_none, onPressed: () => r.transcribeOne(src.name)),
        if (t.status == CvStatus.done && t.note == null) ...[
          MtButton(label: s.cvPjCopyAll, small: true, icon: Icons.copy_outlined, onPressed: () => _copyText(src.name)),
          Builder(builder: (ctx) => MtButton(label: s.cvPjExportTranscript, small: true, icon: Icons.ios_share, onPressed: () {
            final b = ctx.findRenderObject() as RenderBox;
            _shareText(src.name, b.localToGlobal(Offset(0, b.size.height)));
          })),
        ],
        if (t.status == CvStatus.done) MtButton(label: _tDeleteText, small: true, icon: Icons.delete_outline, onPressed: () => r.deleteText(src.name)),
      ]),
    ];
  }
}

/// Kayıtlı metnin önizlemesi: konuşma → [HH:MM:SS] (dil) metin; OCR → satır no · güven % · metin. En çok 200 satır.
class _TextPreview extends StatefulWidget {
  const _TextPreview({super.key, required this.runner, required this.name, required this.isImage});
  final CvRunner runner;
  final String name;
  final bool isImage;
  @override
  State<_TextPreview> createState() => _TextPreviewState();
}

class _TextPreviewState extends State<_TextPreview> {
  late final Future<List<(String, String, String)>> _rows = _load();

  Future<List<(String, String, String)>> _load() async {
    if (widget.isImage) {
      final o = await widget.runner.readOcr(widget.name);
      return [for (var i = 0; i < (o?.lines.length ?? 0); i++) ('${i + 1}', o!.lines[i].conf > 0 ? '%${o.lines[i].conf}' : '', o.lines[i].text)];
    }
    final segs = await widget.runner.readSegments(widget.name);
    return [for (final x in segs) (fmtTime(x.start, '.').substring(0, 8), x.lang.toUpperCase(), x.text)];
  }

  @override
  Widget build(BuildContext context) {
    final c = MtColors.of(context);
    return FutureBuilder(future: _rows, builder: (_, snap) {
      final rows = snap.data;
      if (rows == null) return Padding(padding: const EdgeInsets.all(8), child: MtSpinner(size: 14, color: c.accent));
      return Container(
        decoration: BoxDecoration(color: c.bg2, borderRadius: BorderRadius.circular(10), border: Border.all(color: c.border)),
        constraints: const BoxConstraints(maxHeight: 320),
        child: ListView.builder(shrinkWrap: true, padding: const EdgeInsets.symmetric(vertical: 4), itemCount: rows.length > 200 ? 200 : rows.length, itemBuilder: (_, i) {
          final (a, b, t) = rows[i];
          return Padding(padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 3), child: Row(crossAxisAlignment: CrossAxisAlignment.start, children: [
            SizedBox(width: widget.isImage ? 28 : 62, child: Text(a, style: MtText.mono.copyWith(color: c.text3, fontSize: 11))),
            SizedBox(width: 34, child: Text(b, style: MtText.mono.copyWith(color: c.text3, fontSize: 11))),
            Expanded(child: SelectableText(t, style: MtText.small.copyWith(color: c.text, height: 1.4))),
          ]));
        }),
      );
    });
  }
}

class _Dashed extends CustomPainter {
  _Dashed(this.color);
  final Color color;
  @override
  void paint(Canvas canvas, Size size) {
    final p = Paint()..color = color..style = PaintingStyle.stroke..strokeWidth = 1.5;
    final path = Path()..addRRect(RRect.fromRectAndRadius(Offset.zero & size, const Radius.circular(MtDim.radiusCard)));
    for (final m in path.computeMetrics()) {
      var d = 0.0;
      while (d < m.length) { canvas.drawPath(m.extractPath(d, d + 6), p); d += 11; }
    }
  }
  @override
  bool shouldRepaint(_Dashed old) => old.color != color;
}
