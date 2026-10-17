// SSH Master kitaplık ekranı — ortak LibraryScreen üzerine SSH uyarlaması (kartlar: ad, user@host:port, Anahtar / son klasör / palet).
// Kart uzun basma menüsü: son klasörü sıfırla · Dosyalar (SFTP gezgini, terminal açmadan).
import 'package:flutter/material.dart';

import '../../core/account.dart';
import '../../core/l10n/gen/mt_strings.dart';
import '../../core/module_host.dart';
import '../../core/sync.dart';
import '../../widgets/library_screen.dart';
import 'ssh_files.dart';
import 'ssh_form.dart';
import 'ssh_model.dart';
import 'ssh_terminal.dart';

Future<void> _saveConn(SyncEngine engine, String id, Map<String, dynamic> data) async {
  engine.library.items[id] = ('connection', data);
  await engine.onLocalChange();
}

/// Terminali açar; "son klasör" ve host anahtarı kitaplığa geri yazılır (kitaplık kartı ve modüller arası derin bağlantı ortak).
void openSshTerminal(BuildContext ctx, SyncEngine engine, String id, Map<String, dynamic> data, {bool rootNavigator = false}) {
  final c = SshConnection(id, data);
  Navigator.of(ctx, rootNavigator: rootNavigator).push(MaterialPageRoute(builder: (_) => SshTerminalScreen(conn: c, engine: engine,
      onLastDir: (dir) => _saveConn(engine, id, {...c.raw, 'lastDir': dir}), onHostKey: (fp) => _saveConn(engine, id, {...c.raw, 'hostKey': fp}))));
}

/// SFTP dosya gezginini ayrı sayfa olarak açar (başlangıç: hatırlanan son klasör).
void openSshFiles(BuildContext ctx, SyncEngine engine, String id, Map<String, dynamic> data) {
  final c = SshConnection(id, data);
  Navigator.of(ctx).push(MaterialPageRoute(builder: (_) => SshFilesPanel(conn: c, engine: engine, startDir: c.rememberLastDir ? c.lastDir : '',
      onHostKey: (fp) => _saveConn(engine, id, {...c.raw, 'hostKey': fp}))));
}

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

  Future<void> _save(String id, Map<String, dynamic> data) => _saveConn(_engine!, id, data);

  void _open(BuildContext ctx, String id, Map<String, dynamic> data) => openSshTerminal(ctx, _engine!, id, data);

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
        extraMenu: [('files', Icons.folder_open_outlined, s.smMobFiles), ('resetDir', Icons.restart_alt, s.smAppResetLastDir)],
        onExtra: (ctx, key, id, data) async {
          if (key == 'files') openSshFiles(ctx, _engine!, id, data);
          if (key == 'resetDir') await _save(id, {...data, 'lastDir': ''});
        },
      ),
    );
  }
}
