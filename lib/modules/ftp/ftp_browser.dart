// FTP Masters site penceresi (mobil): masaüstündeki Sunucu paneli + Aktarımlar. Üst çubukta bağlantı durumu, yol çubuğu
// (üst klasör / başlangıç / yenile), dizin listesi (ad · boyut · değiştirilme; klasörler önce, ada göre), uzun basma: indir ·
// yeniden adlandır · sil; "+" menüsü: dosya yükle (dosya seçici) · yeni klasör. İndirilen dosya uygulamanın İndirilenler
// klasörüne yazılır ve paylaşım sayfasıyla açılır. Aktarımlar paneli: sırada / aktarılıyor / tamamlandı / hata, iptal.
import 'dart:async';
import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';
import 'package:share_plus/share_plus.dart';

import '../../core/l10n/gen/mt_strings.dart';
import '../../core/sync.dart';
import '../../core/theme.dart';
import '../../widgets/mt_widgets.dart';
import 'ftp_model.dart';
import 'remote_fs.dart';

enum TrState { queued, active, done, error, cancelled }

class Transfer {
  Transfer({required this.name, required this.download, required this.remotePath, this.localPath, this.total});
  final String name, remotePath;
  final bool download;
  String? localPath;
  int done = 0;
  int? total;
  TrState state = TrState.queued;
  String? error;
  bool cancel = false;
}

class FtpBrowserScreen extends StatefulWidget {
  const FtpBrowserScreen({super.key, required this.site, required this.engine, required this.onLastDir, required this.onHostKey});
  final FtpSite site;
  final SyncEngine engine;
  final ValueChanged<String> onLastDir;
  final ValueChanged<String> onHostKey;
  @override
  State<FtpBrowserScreen> createState() => _FtpBrowserScreenState();
}

class _FtpBrowserScreenState extends State<FtpBrowserScreen> {
  RemoteFs? _fs;
  String _cwd = '/';
  String _home = '/';
  List<RemoteEntry> _entries = const [];
  bool _loading = true, _connected = false;
  String? _error;
  final List<Transfer> _transfers = [];
  bool _showTransfers = false;
  int _running = 0;

  @override
  void initState() {
    super.initState();
    _connect();
  }

  @override
  void dispose() {
    _fs?.close();
    super.dispose();
  }

  Future<void> _connect() async {
    final s = MtStrings.of(context);
    setState(() { _loading = true; _error = null; _connected = false; });
    try {
      final fs = createRemoteFs(widget.site, onHostKey: widget.onHostKey);
      await fs.connect();
      _fs = fs;
      _home = await fs.pwd();
      var start = _home;
      final remember = widget.site.rememberLastDir ? (widget.site.raw['lastRemoteDir'] ?? '').toString() : '';
      if (remember.isNotEmpty) {
        start = remember;
      } else if (widget.site.remoteDir.isNotEmpty) {
        start = widget.site.remoteDir;
      }
      _connected = true;
      await _go(start, fallback: _home);
    } catch (e) {
      if (!mounted) return;
      setState(() { _loading = false; _error = remoteErrorText(s, e); });
    }
  }

  Future<void> _go(String path, {String? fallback}) async {
    final s = MtStrings.of(context);
    final fs = _fs;
    if (fs == null) return;
    setState(() => _loading = true);
    try {
      await fs.cd(path);
      _cwd = await fs.pwd();
      final list = await fs.list(_cwd);
      list.sort((a, b) => a.isDir != b.isDir ? (a.isDir ? -1 : 1) : a.name.toLowerCase().compareTo(b.name.toLowerCase()));
      if (widget.site.rememberLastDir) widget.onLastDir(_cwd);
      if (!mounted) return;
      setState(() { _entries = list; _loading = false; _error = null; });
    } catch (e) {
      if (fallback != null && fallback != path) return _go(fallback);
      if (!mounted) return;
      setState(() { _loading = false; _error = remoteErrorText(s, e); });
    }
  }

  Future<void> _refresh() => _go(_cwd);

  void _up() {
    if (_cwd == '/' || _cwd.isEmpty) return;
    final p = _cwd.endsWith('/') ? _cwd.substring(0, _cwd.length - 1) : _cwd;
    final i = p.lastIndexOf('/');
    _go(i <= 0 ? '/' : p.substring(0, i));
  }

  // ---- aktarımlar
  Future<Directory> _downloadDir() async {
    final base = await getApplicationDocumentsDirectory();
    final d = Directory('${base.path}/FTP Masters/${widget.site.name.replaceAll(RegExp(r'[\\/:*?"<>|]'), '_')}');
    await d.create(recursive: true);
    return d;
  }

  Future<void> _download(RemoteEntry e) async {
    final fs = _fs;
    if (fs == null || e.isDir) return;
    final dir = await _downloadDir();
    final local = '${dir.path}/${e.name}';
    final t = Transfer(name: e.name, download: true, remotePath: fs.join(_cwd, e.name), localPath: local, total: e.size);
    setState(() { _transfers.insert(0, t); _showTransfers = true; });
    _runQueue();
  }

  Future<void> _upload() async {
    final fs = _fs;
    if (fs == null) return;
    final files = await FilePicker.pickFiles();
    for (final f in files) {
      final t = Transfer(name: f.name, download: false, remotePath: fs.join(_cwd, f.name), total: await f.xFile.length());
      t.localPath = f.path;
      _transfers.insert(0, t);
      _pending[t] = f;
    }
    setState(() => _showTransfers = _transfers.isNotEmpty);
    _runQueue();
  }

  final Map<Transfer, PlatformFile> _pending = {};

  void _runQueue() {
    final max = widget.site.maxConcurrent.clamp(1, 3); // mobilde en çok 3 eşzamanlı (her aktarım ayrı bağlantı)
    for (final t in _transfers.where((t) => t.state == TrState.queued)) {
      if (_running >= max) break;
      _running++;
      t.state = TrState.active;
      _run(t).whenComplete(() {
        _running--;
        if (mounted) setState(() {});
        _runQueue();
      });
    }
    if (mounted) setState(() {});
  }

  Future<void> _run(Transfer t) async {
    final s = MtStrings.of(context);
    RemoteFs? fs;
    try {
      fs = createRemoteFs(widget.site); // her aktarım kendi bağlantısıyla (masaüstü gibi; gezinme kilitlenmez)
      await fs.connect();
      if (t.download) {
        final sink = File(t.localPath!).openWrite();
        try {
          await for (final chunk in fs.download(t.remotePath, onProgress: (n, total) { t.done = n; t.total ??= total; if (mounted) setState(() {}); })) {
            if (t.cancel) throw FtpCancelled();
            sink.add(chunk);
          }
        } finally {
          await sink.close();
        }
      } else {
        final pf = _pending.remove(t);
        final size = pf != null ? await pf.xFile.length() : (t.total ?? 0);
        final stream = pf != null ? pf.readAsByteStream() : File(t.localPath!).openRead();
        await fs.upload(t.remotePath, stream.map((x) { if (t.cancel) throw FtpCancelled(); return x; }), size,
            onProgress: (n, total) { t.done = n; t.total = total; if (mounted) setState(() {}); });
      }
      t.state = TrState.done;
      if (mounted) {
        mtToast(context, t.download ? s.fmTrDownloadDone : s.fmTrUploadDone, sub: t.name, type: 'ok');
        if (!t.download) unawaited(_refresh());
      }
    } on FtpCancelled {
      t.state = TrState.cancelled;
      if (t.download && t.localPath != null) unawaited(File(t.localPath!).delete().catchError((_) => File(t.localPath!)));
    } catch (e) {
      t.state = TrState.error;
      t.error = remoteErrorText(s, e);
      if (mounted) mtToast(context, t.download ? s.fmTrDownloadFailed(t.name) : s.fmTrUploadFailed(t.name), sub: t.error, type: 'err');
    } finally {
      await fs?.close();
    }
  }

  // ---- dosya işlemleri
  Future<void> _entryMenu(RemoteEntry e, Offset pos) async {
    final s = MtStrings.of(context);
    final c = MtColors.of(context);
    Widget mi(IconData i, String t, {bool danger = false}) => Row(children: [Icon(i, size: 16, color: danger ? c.err : null), const SizedBox(width: 10), Text(t)]);
    final r = await showMenu<String>(context: context, position: RelativeRect.fromLTRB(pos.dx, pos.dy, pos.dx, pos.dy), items: [
      if (!e.isDir) PopupMenuItem(value: 'dl', child: mi(Icons.download, s.fmSiteDownload)),
      PopupMenuItem(value: 'ren', child: mi(Icons.drive_file_rename_outline, s.commonRename)),
      const PopupMenuDivider(),
      PopupMenuItem(value: 'del', child: mi(Icons.delete_outline, s.commonDelete, danger: true)),
    ]);
    if (!mounted || r == null) return;
    final fs = _fs!;
    try {
      switch (r) {
        case 'dl': await _download(e);
        case 'ren':
          final n = await _ask(s.commonRename, s.commonNewName, initial: e.name);
          if (n != null && n.isNotEmpty && n != e.name) { await fs.rename(fs.join(_cwd, e.name), fs.join(_cwd, n)); await _refresh(); }
        case 'del':
          final ok = await _confirm(s.fmSiteDeleteTitle, _plain(e.isDir ? s.fmSiteDelDirOne(e.name) : s.fmSiteDelOne(e.name)));
          if (ok) { await fs.delete(fs.join(_cwd, e.name), isDir: e.isDir); await _refresh(); if (mounted) mtToast(context, s.fmSiteDeleted, type: 'ok'); }
      }
    } catch (err) {
      if (mounted) mtToast(context, r == 'ren' ? s.fmSiteRenameFail : s.fmSiteDeleteFail, sub: remoteErrorText(s, err), type: 'err');
    }
  }

  Future<void> _mkdir() async {
    final s = MtStrings.of(context);
    final n = await _ask(s.commonNewFolder, s.commonFolderName);
    if (n == null || n.isEmpty) return;
    try {
      await _fs!.mkdir(_fs!.join(_cwd, n));
      await _refresh();
    } catch (e) {
      if (mounted) mtToast(context, s.fmSiteMkdirFail, sub: remoteErrorText(s, e), type: 'err');
    }
  }

  Future<String?> _ask(String title, String hint, {String initial = ''}) {
    final s = MtStrings.of(context);
    final ctl = TextEditingController(text: initial);
    return showDialog<String>(
      context: context,
      builder: (ctx) => AlertDialog(
        title: Text(title),
        content: TextField(controller: ctl, autofocus: true, textDirection: TextDirection.ltr, decoration: InputDecoration(hintText: hint), onSubmitted: (v) => Navigator.pop(ctx, v.trim())),
        actionsPadding: const EdgeInsets.fromLTRB(22, 0, 22, 18),
        actions: [MtButton(label: s.commonCancel, onPressed: () => Navigator.pop(ctx)), MtButton(label: s.commonOk, kind: MtBtnKind.primary, onPressed: () => Navigator.pop(ctx, ctl.text.trim()))],
      ),
    );
  }

  Future<bool> _confirm(String title, String msg) async {
    final s = MtStrings.of(context);
    return await showDialog<bool>(context: context, builder: (ctx) => AlertDialog(
          title: Text(title), content: Text(msg), actionsPadding: const EdgeInsets.fromLTRB(22, 0, 22, 18),
          actions: [MtButton(label: s.commonCancel, onPressed: () => Navigator.pop(ctx, false)), MtButton(label: s.commonDelete, kind: MtBtnKind.dangerPrimary, onPressed: () => Navigator.pop(ctx, true))],
        )) ?? false;
  }

  static String _plain(String html) => html.replaceAll(RegExp(r'<[^>]+>'), '');
  static String fmtSize(int n) => n < 1024 ? '$n B' : n < 1048576 ? '${(n / 1024).toStringAsFixed(1)} KB' : n < 1073741824 ? '${(n / 1048576).toStringAsFixed(1)} MB' : '${(n / 1073741824).toStringAsFixed(2)} GB';
  static String fmtDate(DateTime? d) => d == null ? '' : '${d.day.toString().padLeft(2, '0')}.${d.month.toString().padLeft(2, '0')}.${d.year} ${d.hour.toString().padLeft(2, '0')}:${d.minute.toString().padLeft(2, '0')}';

  @override
  Widget build(BuildContext context) {
    final s = MtStrings.of(context);
    final c = MtColors.of(context);
    final site = widget.site;
    final wide = MtBreak.wide(context);
    final active = _transfers.where((t) => t.state == TrState.active || t.state == TrState.queued).length;
    final list = Column(children: [
      // yol çubuğu
      Container(
        height: 40, padding: const EdgeInsets.symmetric(horizontal: 6),
        decoration: BoxDecoration(color: c.surface, border: Border(bottom: BorderSide(color: c.border))),
        child: Row(children: [
          MtIconButton(icon: Icons.arrow_upward, tooltip: s.fmSiteUp, onPressed: _connected ? _up : null),
          MtIconButton(icon: Icons.home_outlined, tooltip: s.fmSiteHome, onPressed: _connected ? () => _go(_home) : null),
          const SizedBox(width: 4),
          Expanded(child: Container(
            height: 26, padding: const EdgeInsets.symmetric(horizontal: 8), alignment: AlignmentDirectional.centerStart,
            decoration: BoxDecoration(color: c.bg2, borderRadius: BorderRadius.circular(6), border: Border.all(color: c.border)),
            child: Text(_cwd, maxLines: 1, overflow: TextOverflow.ellipsis, textDirection: TextDirection.ltr, style: MtText.mono.copyWith(color: c.text)),
          )),
          MtIconButton(icon: Icons.refresh, tooltip: s.commonRefresh, onPressed: _connected ? _refresh : null),
        ]),
      ),
      Expanded(child: _error != null
          ? Center(child: Padding(padding: const EdgeInsets.all(24), child: Column(mainAxisSize: MainAxisSize.min, children: [
              MtBox(_error!, kind: MtBoxKind.error, icon: Icons.error_outline), const SizedBox(height: 12),
              MtButton(label: s.fmSiteReconnect, icon: Icons.refresh, kind: MtBtnKind.primary, onPressed: _connect),
            ])))
          : _loading
              ? Center(child: Column(mainAxisSize: MainAxisSize.min, children: [const MtSpinner(size: 22), const SizedBox(height: 10), Text(_connected ? s.fmSiteLoading : s.fmFormConnecting, style: MtText.small.copyWith(color: c.text2))]))
              : _entries.isEmpty
                  ? Center(child: Text(s.fmSiteEmptyDir, style: MtText.small.copyWith(color: c.text3)))
                  : RefreshIndicator(color: c.accent, onRefresh: _refresh, child: ListView.separated(
                      itemCount: _entries.length, separatorBuilder: (_, _) => Divider(height: 1, color: c.border.withValues(alpha: .5)),
                      itemBuilder: (_, i) {
                        final e = _entries[i];
                        return GestureDetector(
                          onLongPressStart: (d) => _entryMenu(e, d.globalPosition),
                          child: ListTile(
                            dense: true, visualDensity: VisualDensity.compact,
                            leading: Icon(e.isDir ? Icons.folder : e.isLink ? Icons.link : Icons.insert_drive_file_outlined, color: e.isDir ? const Color(0xFFFBBF24) : c.text2, size: 20),
                            title: Text(e.name, maxLines: 1, overflow: TextOverflow.ellipsis, textDirection: TextDirection.ltr, style: MtText.body.copyWith(color: c.text)),
                            subtitle: Text([if (!e.isDir) fmtSize(e.size), fmtDate(e.modified)].where((x) => x.isNotEmpty).join(' · '), style: MtText.tiny.copyWith(color: c.text3)),
                            trailing: e.isDir ? Icon(Icons.chevron_right, color: c.text3, size: 18) : MtIconButton(icon: Icons.download, tooltip: s.fmSiteDownload, onPressed: () => _download(e)),
                            onTap: () => e.isDir ? _go(_fs!.join(_cwd, e.name)) : _entryMenu(e, const Offset(200, 300)),
                          ),
                        );
                      })),
      ),
    ]);

    final transfers = _TransfersPanel(transfers: _transfers, onCancel: (t) => setState(() { t.cancel = true; if (t.state == TrState.queued) t.state = TrState.cancelled; }),
        onClearDone: () => setState(() => _transfers.removeWhere((t) => t.state == TrState.done || t.state == TrState.cancelled)),
        onOpen: (t) => SharePlus.instance.share(ShareParams(files: [XFile(t.localPath!)], subject: t.name)),
        onRetry: (t) { t.state = TrState.queued; t.cancel = false; t.done = 0; _runQueue(); });

    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 46,
        title: Row(children: [
          Container(width: 8, height: 8, decoration: BoxDecoration(color: _connected ? c.ok : _error != null ? c.err : c.warn, shape: BoxShape.circle)), const SizedBox(width: 8),
          Expanded(child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            Text(site.name.isEmpty ? site.host : site.name, maxLines: 1, overflow: TextOverflow.ellipsis, style: MtText.cardTitle.copyWith(color: c.text)),
            Text(_connected ? '${kFtpProtocols[site.protocol]?.$1 ?? site.protocol} · ${site.username}@${site.host}' : _error != null ? s.fmSiteStateDisconnected : s.fmSiteStateConnecting,
                maxLines: 1, overflow: TextOverflow.ellipsis, textDirection: TextDirection.ltr, style: MtText.tiny.copyWith(color: c.text3)),
          ])),
        ]),
        actions: [
          MtIconButton(icon: Icons.upload_file, tooltip: s.fmSiteUpload, onPressed: _connected ? _upload : null),
          MtIconButton(icon: Icons.create_new_folder_outlined, tooltip: s.commonNewFolder, onPressed: _connected ? _mkdir : null),
          if (!wide) Stack(clipBehavior: Clip.none, children: [
            MtIconButton(icon: Icons.swap_vert, tooltip: s.fmSiteTransfers, onPressed: () => setState(() => _showTransfers = !_showTransfers)),
            if (active > 0) Positioned(right: 2, top: 2, child: Container(padding: const EdgeInsets.symmetric(horizontal: 5), decoration: BoxDecoration(color: c.accent, borderRadius: BorderRadius.circular(9)),
                child: Text('$active', style: const TextStyle(fontSize: 10, fontWeight: FontWeight.w700, color: MtColors.onAccent)))),
          ]),
          const SizedBox(width: 6),
        ],
      ),
      body: SafeArea(child: wide
          ? Row(children: [Expanded(flex: 3, child: list), Container(width: 1, color: c.border), SizedBox(width: 340, child: transfers)])
          : Column(children: [Expanded(child: list), if (_showTransfers) SizedBox(height: 220, child: transfers)])),
    );
  }
}

class FtpCancelled implements Exception {}

class _TransfersPanel extends StatelessWidget {
  const _TransfersPanel({required this.transfers, required this.onCancel, required this.onClearDone, required this.onOpen, required this.onRetry});
  final List<Transfer> transfers;
  final ValueChanged<Transfer> onCancel, onOpen, onRetry;
  final VoidCallback onClearDone;
  @override
  Widget build(BuildContext context) {
    final s = MtStrings.of(context);
    final c = MtColors.of(context);
    return Container(
      color: c.bg2,
      child: Column(children: [
        Container(
          height: 34, padding: const EdgeInsetsDirectional.only(start: 12, end: 4),
          decoration: BoxDecoration(border: Border(bottom: BorderSide(color: c.border), top: BorderSide(color: c.border))),
          child: Row(children: [
            Text(s.fmSiteTransfers.toUpperCase(), style: MtText.section.copyWith(color: c.text3)),
            const Spacer(),
            MtButton(label: s.fmTrClearDone, small: true, kind: MtBtnKind.ghost, onPressed: onClearDone),
          ]),
        ),
        Expanded(child: transfers.isEmpty
            ? Center(child: Padding(padding: const EdgeInsets.all(16), child: Text(s.fmTrEmpty.replaceAll('<br>', '\n'), textAlign: TextAlign.center, style: MtText.small.copyWith(color: c.text3))))
            : ListView.builder(itemCount: transfers.length, itemBuilder: (_, i) {
                final t = transfers[i];
                final (String st, Color col) = switch (t.state) {
                  TrState.queued => (s.fmTrQueued, c.text3), TrState.active => (s.fmTrActive, c.accent), TrState.done => (s.fmTrDone, c.ok),
                  TrState.error => (t.error ?? s.fmTrError, c.err), TrState.cancelled => (s.fmTrCancelled, c.text3),
                };
                final pct = (t.total ?? 0) > 0 ? (t.done / t.total!).clamp(0.0, 1.0) : null;
                return Padding(
                  padding: const EdgeInsets.fromLTRB(12, 8, 6, 4),
                  child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                    Row(children: [
                      Icon(t.download ? Icons.download : Icons.upload, size: 15, color: col), const SizedBox(width: 8),
                      Expanded(child: Text(t.name, maxLines: 1, overflow: TextOverflow.ellipsis, textDirection: TextDirection.ltr, style: MtText.btnSm.copyWith(color: c.text))),
                      if (t.state == TrState.active || t.state == TrState.queued) MtIconButton(icon: Icons.close, size: 22, tooltip: s.fmTrCancel, onPressed: () => onCancel(t)),
                      if (t.state == TrState.done && t.download && t.localPath != null) MtIconButton(icon: Icons.open_in_new, size: 22, tooltip: s.commonOpen, onPressed: () => onOpen(t)),
                      if (t.state == TrState.error) MtIconButton(icon: Icons.refresh, size: 22, tooltip: s.fmTrRetry, onPressed: () => onRetry(t)),
                    ]),
                    const SizedBox(height: 4),
                    ClipRRect(borderRadius: BorderRadius.circular(4), child: SizedBox(height: 4, child: LinearProgressIndicator(value: t.state == TrState.done ? 1 : pct, backgroundColor: c.surface2,
                        valueColor: AlwaysStoppedAnimation(t.state == TrState.error ? c.err : c.accent)))),
                    const SizedBox(height: 3),
                    Text('${_FtpBrowserScreenState.fmtSize(t.done)}${t.total != null ? ' / ${_FtpBrowserScreenState.fmtSize(t.total!)}' : ''} · $st', maxLines: 1, overflow: TextOverflow.ellipsis, style: MtText.tiny.copyWith(color: col)),
                  ]),
                );
              })),
      ]),
    );
  }
}
