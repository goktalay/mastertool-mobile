// Notepad Master modülü (kod `np`) — masaüstü Notepad Master ile aynı hesap kitaplığı (bağlantılar, klasörler, ayarlar;
// HKDF npm-enc-v1 ile uçtan uca şifreli senkron). Kitaplık kartı: ad, tür etiketi (SSH Projesi / FTP Projesi / Lokal Klasör /
// Proje Dosyası), user@host ya da yerel yol, kök klasör, anahtar / açık sekmeler / özel editör rozetleri.
import 'package:flutter/material.dart';

import '../../core/account.dart';
import '../../core/l10n/gen/mt_strings.dart';
import '../../core/module.dart';
import '../../core/module_host.dart';
import '../../core/sync.dart';
import '../../widgets/library_screen.dart';
import '../ftp/ftp_model.dart' show kFtpProtocols;
import 'np_editor_form.dart';
import 'np_form.dart';
import 'np_model.dart';
import 'np_project.dart';

class NotepadModule implements MtModule {
  NotepadModule(this.host);
  final ModuleHost host;
  @override
  String get app => 'np';
  @override
  IconData get icon => Icons.edit_note;
  @override
  Color get color => const Color(0xFF10B981);
  @override
  Widget build(BuildContext context, AccountService account) => NpLibraryScreen(host: host);
}

class NpLibraryScreen extends StatefulWidget {
  const NpLibraryScreen({super.key, required this.host});
  final ModuleHost host;
  @override
  State<NpLibraryScreen> createState() => _NpLibraryScreenState();
}

class _NpLibraryScreenState extends State<NpLibraryScreen> {
  SyncEngine? _engine;
  String? _docs; // belgeler kökü: yerel yollar kartta "Belgeler/Notepad Master/…" olarak kısaltılır

  @override
  void initState() {
    super.initState();
    npDocumentsRoot().then((d) { if (mounted) setState(() => _docs = d); });
    widget.host.open('np', hasSettings: true, localOnly: kNpLocalOnly).then((e) {
      if (mounted) setState(() => _engine = e);
    });
  }

  Future<void> _save(String id, Map<String, dynamic> data) async {
    _engine!.library.items[id] = ('connection', data);
    await _engine!.onLocalChange();
  }

  Future<void> _openSettings(BuildContext ctx) async {
    final lib = _engine!.library;
    final cur = lib.items['settings']?.$2 ?? const <String, dynamic>{};
    await Navigator.of(ctx).push(MaterialPageRoute(builder: (_) => NpSettingsScreen(
        editor: (cur['editor'] as Map?)?.cast<String, dynamic>() ?? const {},
        onSave: (ed) async {
          lib.items['settings'] = ('settings', {'appTheme': cur['appTheme'], 'language': cur['language'], 'editor': ed});
          await _engine!.onLocalChange();
        })));
  }

  void _open(BuildContext ctx, String id, Map<String, dynamic> data) {
    final c = NpConnection(id, data);
    Navigator.of(ctx).push(MaterialPageRoute(builder: (_) => NpProjectScreen(conn: c, engine: _engine!,
        onHostKey: (fp) { if (c.hostKey != fp) _save(id, {...(_engine!.library.items[id]?.$2 ?? c.raw), 'hostKey': fp}); },
        onOpenSettings: () => _openSettings(ctx))));
  }

  @override
  Widget build(BuildContext context) {
    final s = MtStrings.of(context);
    if (_engine == null) return const Scaffold(body: Center(child: CircularProgressIndicator()));
    return LibraryScreen(
      engine: _engine!,
      adapter: LibraryAdapter(
        app: 'np', kind: 'connection', appIcon: 'np', copySuffix: s.npMainCopySuffix,
        texts: LibraryTexts(
          title: 'Notepad Master', searchPh: s.npAppSearchPh, newItem: s.npAppNewConn, items: s.npAppConnections, welcome: s.npAppWelcome,
          welcomeHint: s.npAppWelcomeHint.replaceAll('<br>', '\n'), noMatch: s.npAppNoMatch, stats: s.npAppStats, folderCount: s.npAppFolderCount,
          deleteItem: s.npAppDeleteConn, deleteItemMsg: s.npAppDeleteConnMsg, newHere: s.npAppNewConnHere, results: s.npAppResults, all: s.npAppAll,
        ),
        toItem: (id, d) {
          final c = NpConnection(id, d);
          final kindLabel = switch (c.kind) { 'ssh' => s.npKindSsh, 'ftp' => s.npKindFtp, 'local' => s.npKindLocal, _ => s.npKindFile };
          final icon = switch (c.kind) { 'ssh' => Icons.terminal, 'ftp' => Icons.dns_outlined, 'local' => Icons.folder_outlined, _ => Icons.description_outlined };
          final sub = c.isRemote ? '${c.anonymous ? 'anonymous' : c.username}@${c.host}' : (c.localPath.isEmpty ? s.npAppNoLocalPath.split('.').first : npShortLocalPath(c.localPath, _docs));
          return LibraryItem(id: id, name: c.name.isEmpty ? (c.isRemote ? c.host : kindLabel) : c.name, subtitle: sub, color: c.colorValue, icon: icon, folderId: c.folderId, tags: [
            if (c.kind == 'ssh') (Icons.lock_outline, 'SSH') else if (c.kind == 'ftp') (Icons.lock_outline, kFtpProtocols[c.protocol]?.$1.split(' ').first ?? c.protocol) else (icon, kindLabel),
            if (c.isRemote && c.rootDir.isNotEmpty) (Icons.folder_outlined, c.rootDir.length > 18 ? '…/${npBaseName(c.rootDir)}' : c.rootDir),
            if (c.usesKey) (Icons.key, s.npAppKeyTag),
            if (c.editorMode == 'custom') (Icons.tune, ''), // bağlantıya özel editör ayarları (masaüstü: ≡ rozeti)
          ]);
        },
        onOpen: _open,
        onEdit: (ctx, id, data, folders, folderId) async {
          final r = await Navigator.of(ctx).push<(Map<String, dynamic>, bool)>(MaterialPageRoute(builder: (_) => NpFormScreen(
              existing: id == null ? null : NpConnection(id, data!), folders: folders, folderId: folderId)));
          return r;
        },
        extraMenu: [('settings', Icons.tune, s.npAppSettings)],
        onExtra: (ctx, key, id, data) async {
          if (key == 'settings') await _openSettings(ctx);
        },
      ),
    );
  }
}
