// IP Tools modülü — masaüstü IP Tools ile aynı hesap kitaplığı (kayıtlar, klasörler, ayarlar; şifreli senkron, HKDF ipt-enc-v1,
// blob ≤ 256 KB). Kitaplık ekranı: ortak LibraryScreen üzerine IP uyarlaması (kart: ad, aralık özeti, adres sayısı, son tarama,
// cihaz / yeni sayısı). Telefon: karta dokununca tarama ekranı açılır; tablet (MtBreak.wide): sol kitaplık + sağ tarama paneli
// (masaüstü düzeni). Altta kalıcı uyarı şeridi ve ayarlar dişlisi. Tarama sonuçları yalnız cihazda (IpScanStore).
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../core/account.dart';
import '../../core/l10n/gen/mt_strings.dart';
import '../../core/module.dart';
import '../../core/module_host.dart';
import '../../core/sync.dart';
import '../../core/theme.dart';
import '../../widgets/library_screen.dart';
import '../../widgets/mt_widgets.dart';
import 'ip_form.dart';
import 'ip_model.dart';
import 'ip_scan_screen.dart';
import 'ip_settings_screen.dart';
import 'ip_store.dart';
import 'ip_texts.dart';
import 'ip_widgets.dart';

const kIpMaxBlobBytes = 256 * 1024;

class IpToolsModule implements MtModule {
  IpToolsModule(this.host, {IpScanStore? store, IpScanService? scans})
      : store = store ?? IpScanStore() {
    this.scans = scans ?? IpScanService(this.store);
  }
  final ModuleHost host;
  final IpScanStore store;
  late final IpScanService scans;
  @override
  String get app => 'ip';
  @override
  IconData get icon => Icons.lan_outlined;
  @override
  Color get color => const Color(0xFF3B82F6);
  @override
  Widget build(BuildContext context, AccountService account) => IpLibraryScreen(host: host, store: store, scans: scans);
}

class IpLibraryScreen extends StatefulWidget {
  const IpLibraryScreen({super.key, required this.host, required this.store, required this.scans});
  final ModuleHost host;
  final IpScanStore store;
  final IpScanService scans;
  @override
  State<IpLibraryScreen> createState() => _IpLibraryScreenState();
}

class _IpLibraryScreenState extends State<IpLibraryScreen> {
  SyncEngine? _engine;
  String? _selected; // tablet: sağ panelde açık kayıt

  @override
  void initState() {
    super.initState();
    widget.store.addListener(_refresh);
    widget.scans.addListener(_refresh);
    widget.host.open('ip', hasSettings: true, maxBytes: kIpMaxBlobBytes).then((e) async {
      if (!mounted) return;
      setState(() => _engine = e);
      e.addListener(_onLibrary);
      await _onLibrary();
    });
  }

  @override
  void dispose() {
    widget.store.removeListener(_refresh);
    widget.scans.removeListener(_refresh);
    _engine?.removeListener(_onLibrary);
    super.dispose();
  }

  void _refresh() { if (mounted) setState(() {}); }

  Future<void> _onLibrary() async {
    final ids = {for (final e in _engine!.library.items.entries) if (e.value.$1 == 'record') e.key};
    await widget.store.preload(ids);
    await widget.store.prune(ids);
    if (mounted && _selected != null && !ids.contains(_selected)) setState(() => _selected = null);
  }

  Future<void> _save(String id, Map<String, dynamic> data) async {
    _engine!.library.items[id] = ('record', data);
    await _engine!.onLocalChange();
  }

  void _open(BuildContext ctx, String id, Map<String, dynamic> data) {
    // Tablette sol panel dar MediaQuery ile çizilir; genişlik kararı ekranın kendi bağlamından
    if (MtBreak.wide(context)) {
      setState(() => _selected = id);
      return;
    }
    Navigator.of(ctx).push(MaterialPageRoute(builder: (_) => _PhoneScanScreen(id: id, engine: _engine!, scans: widget.scans, onEdit: (c) => _editFromScan(c, id))));
  }

  Future<void> _editFromScan(BuildContext ctx, String id) async {
    final data = _engine!.library.items[id]?.$2;
    if (data == null) return;
    final r = await _edit(ctx, id, data, _folders, data['folderId'] as String?);
    if (r == null) return;
    await _save(id, r.$1);
    if (r.$2 && ctx.mounted) await startScan(ctx, widget.scans, _engine!, IpRecord(id, r.$1));
  }

  List<(String, String)> get _folders => [for (final e in _engine!.library.items.entries) if (e.value.$1 == 'folder') (e.key, (e.value.$2['name'] ?? '').toString())]
    ..sort((a, b) => a.$2.toLowerCase().compareTo(b.$2.toLowerCase()));

  Future<(Map<String, dynamic>, bool)?> _edit(BuildContext ctx, String? id, Map<String, dynamic>? data, List<(String, String)> folders, String? folderId) =>
      Navigator.of(ctx).push<(Map<String, dynamic>, bool)>(MaterialPageRoute(builder: (_) => IpFormScreen(
          existing: id == null ? null : IpRecord(id, data!), folders: folders, folderId: folderId, store: widget.store)));

  void _openSettings() => Navigator.of(context).push(MaterialPageRoute(builder: (_) => IpSettingsScreen(engine: _engine!)));

  @override
  Widget build(BuildContext context) {
    final s = MtStrings.of(context);
    final c = MtColors.of(context);
    if (_engine == null) return const Scaffold(body: Center(child: CircularProgressIndicator()));
    final wide = MtBreak.wide(context);
    final library = LibraryScreen(
      engine: _engine!,
      adapter: LibraryAdapter(
        app: 'ip', kind: 'record', appIcon: 'ip', copySuffix: s.smMainCopySuffix,
        texts: LibraryTexts(
          title: 'IP Tools', searchPh: s.ipAppSearchPh, newItem: s.ipAppNewRecord, items: s.ipRecRootFolder, welcome: s.ipWelcomeTitle,
          welcomeHint: s.ipWelcomeBody, noMatch: IpTr.noMatch, stats: (n, _) => s.ipAppStats(n), folderCount: s.ipRecItems,
          deleteItem: IpTr.deleteRecord, deleteItemMsg: (name, _) => s.ipRecDeleteMsg(name), newHere: IpTr.newRecordHere, results: s.smAppResults,
        ),
        toItem: (id, d) {
          final r = IpRecord(id, d);
          final last = widget.store.cached(id)?.last;
          final scanning = widget.scans.isScanning(id);
          final p = r.parsed;
          return LibraryItem(id: id, name: r.name.isEmpty ? r.rangeSummary : r.name, subtitle: r.rangeSummary, color: r.colorValue,
              icon: scanning ? Icons.radar : Icons.wifi, folderId: r.folderId, tags: [
                if (scanning) (Icons.radar, s.ipScanScanning)
                else (Icons.schedule, last == null ? s.ipRecNever : s.ipRecLastScan(fmtTime(last.finishedAt))),
                if (p.ok) (Icons.tag, '${p.count} ${IpTr.addresses}'),
                if (last != null) (Icons.devices_other_outlined, s.ipRecDevices(last.liveCount.toString())),
                if (last != null && last.newCount > 0) (Icons.bolt, s.ipRecNewDevices(last.newCount.toString())),
              ]);
        },
        onOpen: _open,
        onEdit: _edit,
        extraMenu: [('scan', Icons.play_arrow, s.ipScanScan), ('copyRange', Icons.copy_outlined, s.ipCtxCopyRange)],
        onExtra: (ctx, key, id, data) async {
          if (key == 'scan') {
            await startScan(ctx, widget.scans, _engine!, IpRecord(id, data));
            if (ctx.mounted) _open(ctx, id, data);
          } else if (key == 'copyRange') {
            await copyText(ctx, IpRecord(id, data).rangeSummary);
          }
        },
      ),
    );

    // Tablet: sol kitaplık (dar MediaQuery → tek sütun kart) + sağ tarama paneli
    if (wide) {
      final selData = _selected == null ? null : _engine!.library.items[_selected!]?.$2;
      final mq = MediaQuery.of(context);
      return Scaffold(body: SafeArea(bottom: false, child: Column(children: [
        Expanded(child: Row(crossAxisAlignment: CrossAxisAlignment.stretch, children: [
          SizedBox(width: 340, child: MediaQuery(data: mq.copyWith(size: Size(340, mq.size.height)), child: library)),
          VerticalDivider(width: 1, color: c.border),
          Expanded(child: selData == null
              ? Center(child: Column(mainAxisSize: MainAxisSize.min, children: [
                  Icon(Icons.wifi_find, size: 48, color: c.text3), const SizedBox(height: 12),
                  Text(s.ipScanSelectRecord, style: MtText.h2.copyWith(color: c.text)), const SizedBox(height: 6),
                  ConstrainedBox(constraints: const BoxConstraints(maxWidth: 360), child: Text(s.ipScanSelectHint, textAlign: TextAlign.center, style: MtText.small.copyWith(color: c.text3, height: 1.45))),
                ]))
              : IpScanPanel(key: ValueKey(_selected), record: IpRecord(_selected!, selData), engine: _engine!, scans: widget.scans, embedded: true,
                  onEdit: () => _editFromScan(context, _selected!))),
        ])),
        NoticeBar(trailing: MtIconButton(icon: Icons.settings_outlined, size: 22, tooltip: s.setTitle, onPressed: _openSettings)),
      ])));
    }
    return Column(children: [
      Expanded(child: library),
      NoticeBar(short: true, trailing: MtIconButton(icon: Icons.settings_outlined, size: 22, tooltip: s.setTitle, onPressed: _openSettings)),
    ]);
  }
}

/// Telefon: kayıt kitaplıktan değişirse (senkron) güncel veriyi gösterir
class _PhoneScanScreen extends StatelessWidget {
  const _PhoneScanScreen({required this.id, required this.engine, required this.scans, required this.onEdit});
  final String id;
  final SyncEngine engine;
  final IpScanService scans;
  final void Function(BuildContext) onEdit;
  @override
  Widget build(BuildContext context) => AnimatedBuilder(
        animation: engine,
        builder: (context, _) {
          final d = engine.library.items[id]?.$2;
          if (d == null) return Scaffold(body: Center(child: Text(MtStrings.of(context).ipScanSelectRecord)));
          return IpScanPanel(record: IpRecord(id, d), engine: engine, scans: scans, onEdit: () => onEdit(context));
        },
      );
}

Future<void> copyText(BuildContext ctx, String text) async {
  await Clipboard.setData(ClipboardData(text: text));
  if (ctx.mounted) mtToast(ctx, MtStrings.of(ctx).ipTagCopied(text), type: 'ok');
}
