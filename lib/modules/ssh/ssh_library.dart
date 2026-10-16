// SSH Master kitaplık ekranı — ortak LibraryScreen üzerine SSH uyarlaması (kartlar: ad, user@host:port, Anahtar / son klasör / palet).
import 'package:flutter/material.dart';

import '../../core/account.dart';
import '../../core/l10n/gen/mt_strings.dart';
import '../../core/module_host.dart';
import '../../core/sync.dart';
import '../../widgets/library_screen.dart';
import 'ssh_form.dart';
import 'ssh_model.dart';
import 'ssh_terminal.dart';

class SshLibraryScreen extends StatefulWidget {
  const SshLibraryScreen({super.key, required this.host, required this.account});
  final ModuleHost host;
  final AccountService account;
  @override
  State<SshLibraryScreen> createState() => _SshLibraryScreenState();
}

class _SshLibraryScreenState extends State<SshLibraryScreen> {
  SyncEngine? _engine;

  @override
  void initState() {
    super.initState();
    widget.host.open('sm', localOnly: const {'keyPath'}).then((e) {
      if (mounted) setState(() => _engine = e);
    });
  }

  Future<void> _save(String id, Map<String, dynamic> data) async {
    _engine!.library.items[id] = ('connection', data);
    await _engine!.onLocalChange();
  }

  void _open(BuildContext ctx, String id, Map<String, dynamic> data) {
    final c = SshConnection(id, data);
    Navigator.of(ctx).push(MaterialPageRoute(builder: (_) => SshTerminalScreen(conn: c, engine: _engine!,
        onLastDir: (dir) => _save(id, {...c.raw, 'lastDir': dir}), onHostKey: (fp) => _save(id, {...c.raw, 'hostKey': fp}))));
  }

  @override
  Widget build(BuildContext context) {
    final s = MtStrings.of(context);
    if (_engine == null) return const Scaffold(body: Center(child: CircularProgressIndicator()));
    return LibraryScreen(
      engine: _engine!,
      adapter: LibraryAdapter(
        app: 'sm', kind: 'connection', appIcon: 'sm', copySuffix: s.smMainCopySuffix,
        texts: LibraryTexts(
          title: 'SSH Master', searchPh: s.smAppSearchPh, newItem: s.smAppNewConn, items: s.smAppConnections, welcome: s.smAppWelcome,
          welcomeHint: s.smAppWelcomeHint, noMatch: s.smAppNoMatch, stats: s.smAppStats, folderCount: s.smAppFolderCount,
          deleteItem: s.smAppDeleteConn, deleteItemMsg: s.smAppDeleteConnMsg, newHere: s.smAppNewConnHere, results: s.smAppResults,
        ),
        toItem: (id, d) {
          final c = SshConnection(id, d);
          return LibraryItem(id: id, name: c.name.isEmpty ? c.host : c.name, subtitle: '${c.username}@${c.host}:${c.port}', color: c.colorValue,
              icon: Icons.dns_outlined, folderId: c.folderId, tags: [
                if (c.authType == 'key') (Icons.key, s.smAppKeyTag),
                if (c.rememberLastDir && c.lastDir.isNotEmpty) (Icons.folder_open, s.smAppLastDirTag),
                (Icons.palette_outlined, kSshThemes[c.theme]?.$1 ?? c.theme),
              ]);
        },
        onOpen: _open,
        onEdit: (ctx, id, data, folders, folderId) async {
          final r = await Navigator.of(ctx).push<SshFormResult>(MaterialPageRoute(builder: (_) => SshFormScreen(
              existing: id == null ? null : SshConnection(id, data!), folders: [for (final f in folders) SshFolder(f.$1, {'name': f.$2})], folderId: folderId)));
          return r == null ? null : (r.data, r.connect);
        },
        extraMenu: [('resetDir', Icons.restart_alt, s.smAppResetLastDir)],
        onExtra: (ctx, key, id, data) async {
          if (key == 'resetDir') await _save(id, {...data, 'lastDir': ''});
        },
      ),
    );
  }
}
