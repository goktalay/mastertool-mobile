// FTP Masters modülü — masaüstü FTP Masters ile aynı hesap kitaplığı (siteler, klasörler, ayarlar; şifreli senkron).
import 'package:flutter/material.dart';

import '../../core/account.dart';
import '../../core/l10n/gen/mt_strings.dart';
import '../../core/module.dart';
import '../../core/module_host.dart';
import '../../core/sync.dart';
import '../../widgets/library_screen.dart';
import 'ftp_browser.dart';
import 'ftp_form.dart';
import 'ftp_model.dart';

class FtpModule implements MtModule {
  FtpModule(this.host);
  final ModuleHost host;
  @override
  String get app => 'fm';
  @override
  IconData get icon => Icons.cloud_sync_outlined;
  @override
  Color get color => const Color(0xFFF59E0B);
  @override
  Widget build(BuildContext context, AccountService account) => FtpLibraryScreen(host: host);
}

class FtpLibraryScreen extends StatefulWidget {
  const FtpLibraryScreen({super.key, required this.host});
  final ModuleHost host;
  @override
  State<FtpLibraryScreen> createState() => _FtpLibraryScreenState();
}

class _FtpLibraryScreenState extends State<FtpLibraryScreen> {
  SyncEngine? _engine;

  @override
  void initState() {
    super.initState();
    widget.host.open('fm', hasSettings: true, localOnly: const {'keyPath', 'localDir', 'lastLocalDir', 'lastRemoteDir'}).then((e) {
      if (mounted) setState(() => _engine = e);
    });
  }

  Future<void> _save(String id, Map<String, dynamic> data) async {
    _engine!.library.items[id] = ('site', data);
    await _engine!.onLocalChange();
  }

  void _open(BuildContext ctx, String id, Map<String, dynamic> data) {
    final site = FtpSite(id, data);
    Navigator.of(ctx).push(MaterialPageRoute(builder: (_) => FtpBrowserScreen(site: site, engine: _engine!,
        onLastDir: (dir) { // lastRemoteDir yerel alandır (senkronlanmaz): kitaplıkta tutulur ama blob'a girmemesi için silinir
          final cur = _engine!.library.items[id];
          if (cur != null) _engine!.library.items[id] = (cur.$1, {...cur.$2, 'lastRemoteDir': dir});
          _engine!.library.save();
        },
        onHostKey: (fp) => _save(id, {...site.raw, 'hostKey': fp}))));
  }

  @override
  Widget build(BuildContext context) {
    final s = MtStrings.of(context);
    if (_engine == null) return const Scaffold(body: Center(child: CircularProgressIndicator()));
    return LibraryScreen(
      engine: _engine!,
      adapter: LibraryAdapter(
        app: 'fm', kind: 'site', appIcon: 'fm', copySuffix: s.fmMainCopySuffix,
        texts: LibraryTexts(
          title: 'FTP Masters', searchPh: s.fmAppSearchPh, newItem: s.fmAppNewConn, items: s.fmAppConnections, welcome: s.fmAppWelcome,
          welcomeHint: s.fmAppWelcomeHint, noMatch: s.fmAppNoMatch, stats: s.fmAppStats, folderCount: s.fmAppFolderCount,
          deleteItem: s.fmAppDeleteConn, deleteItemMsg: s.fmAppDeleteConnMsg, newHere: s.fmAppNewConnHere, results: s.fmAppResults,
        ),
        toItem: (id, d) {
          final x = FtpSite(id, d);
          return LibraryItem(id: id, name: x.name.isEmpty ? x.host : x.name, subtitle: '${x.anonymous ? 'anonymous' : x.username}@${x.host}:${x.port}', color: x.colorValue,
              icon: x.isSftp ? Icons.lock_outline : Icons.cloud_outlined, folderId: x.folderId, tags: [
                (Icons.swap_horiz, kFtpProtocols[x.protocol]?.$1.split(' ').first ?? x.protocol),
                if (x.usesKey) (Icons.key, s.fmAppKeyTag),
                if (x.rememberLastDir && (d['lastRemoteDir'] ?? '').toString().isNotEmpty) (Icons.folder_open, s.fmAppLastDirTag),
              ]);
        },
        onOpen: _open,
        onEdit: (ctx, id, data, folders, folderId) async {
          final r = await Navigator.of(ctx).push<(Map<String, dynamic>, bool)>(MaterialPageRoute(builder: (_) => FtpFormScreen(
              existing: id == null ? null : FtpSite(id, data!), folders: folders, folderId: folderId)));
          return r;
        },
        extraMenu: [('resetDir', Icons.restart_alt, s.fmAppResetLastDir)],
        onExtra: (ctx, key, id, data) async {
          if (key == 'resetDir') await _save(id, {...data, 'lastRemoteDir': ''});
        },
      ),
    );
  }
}
