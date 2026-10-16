// SQL Master modülü — masaüstü SQL Master ile aynı hesap kitaplığı (bağlantılar, klasörler, ayarlar; şifreli senkron,
// HKDF info sqlm-enc-v1). Kart: ad, user@host:port / dosya adı / "Bellek içi"; etiketler: motor, Salt okunur/Yazılabilir, SSH.
import 'package:flutter/material.dart';

import '../../core/account.dart';
import '../../core/l10n/gen/mt_strings.dart';
import '../../core/module.dart';
import '../../core/module_host.dart';
import '../../core/sync.dart';
import '../../widgets/library_screen.dart';
import '../ssh/ssh_model.dart' show kCardColors;
import 'sql_conn_screen.dart';
import 'sql_form.dart';
import 'sql_model.dart';

class SqlModule implements MtModule {
  SqlModule(this.host);
  final ModuleHost host;
  @override
  String get app => 'sq';
  @override
  IconData get icon => Icons.storage_outlined;
  @override
  Color get color => const Color(0xFF8B5CF6);
  @override
  Widget build(BuildContext context, AccountService account) => SqlLibraryScreen(host: host);
}

class SqlLibraryScreen extends StatefulWidget {
  const SqlLibraryScreen({super.key, required this.host});
  final ModuleHost host;
  @override
  State<SqlLibraryScreen> createState() => _SqlLibraryScreenState();
}

class _SqlLibraryScreenState extends State<SqlLibraryScreen> {
  SyncEngine? _engine;

  @override
  void initState() {
    super.initState();
    widget.host.open('sq', hasSettings: true, localOnly: kSqlLocalOnly).then((e) {
      if (mounted) setState(() => _engine = e);
    });
  }

  Future<void> _save(String id, Map<String, dynamic> data) async {
    _engine!.library.items[id] = ('connection', data);
    await _engine!.onLocalChange();
  }

  SqlSettings get _settings => SqlSettings(_engine!.library.items['settings']?.$2 ?? SqlSettings.blank());

  void _open(BuildContext ctx, String id, Map<String, dynamic> data) {
    final conn = SqlConnection(id, data);
    final lib = _engine!.library;
    final cur = lib.items[id];
    if (cur != null) {
      lib.items[id] = (cur.$1, {...cur.$2, 'lastUsedAt': DateTime.now().millisecondsSinceEpoch}); // yerel alan, blob'a girmez
      lib.save().catchError((_) {});
    }
    Navigator.of(ctx).push(MaterialPageRoute(builder: (_) => SqlConnScreen(
        conn: conn, engine: _engine!, settings: _settings,
        onHostKey: (fp) => _save(id, {...conn.raw, 'ssh': {...conn.ssh, 'hostKey': fp}}))));
  }

  @override
  Widget build(BuildContext context) {
    final s = MtStrings.of(context);
    if (_engine == null) return const Scaffold(body: Center(child: CircularProgressIndicator()));
    return LibraryScreen(
      engine: _engine!,
      adapter: LibraryAdapter(
        app: 'sq', kind: 'connection', appIcon: 'sq', copySuffix: s.sqMainCopySuffix,
        texts: LibraryTexts(
          title: 'SQL Master', searchPh: s.sqAppSearchPh, newItem: s.sqAppNewConn, items: s.sqAppConnections, welcome: s.sqAppWelcome,
          welcomeHint: s.sqAppWelcomeHint, noMatch: s.sqAppNoMatch, stats: s.sqAppStats, folderCount: s.sqAppFolderCount,
          deleteItem: s.sqAppDeleteConn, deleteItemMsg: s.sqAppDeleteConnMsg, newHere: s.sqAppNewConnHere, results: s.sqAppResults,
        ),
        toItem: (id, d) {
          final x = SqlConnection(id, d);
          return LibraryItem(id: id, name: x.name.isEmpty ? x.subtitle(s.sqFormInMemory) : x.name, subtitle: x.subtitle(s.sqFormInMemory), color: x.colorValue,
              icon: x.meta.isFile ? Icons.insert_drive_file_outlined : Icons.storage_outlined, folderId: x.folderId, tags: [
                (Icons.storage_outlined, x.meta.short),
                if (x.readOnly) (Icons.lock_outline, s.sqAppReadOnlyTag) else (Icons.lock_open_outlined, s.sqAppWriteTag),
                if (x.sshEnabled) (Icons.key, 'SSH'),
              ]);
        },
        onOpen: _open,
        onEdit: (ctx, id, data, folders, folderId) async {
          final count = _engine!.library.items.values.where((v) => v.$1 == 'connection').length;
          return Navigator.of(ctx).push<(Map<String, dynamic>, bool)>(MaterialPageRoute(builder: (_) => SqlFormScreen(
              existing: id == null ? null : SqlConnection(id, data!), folders: folders, folderId: folderId, colorIndex: count % kCardColors.length)));
        },
      ),
    );
  }
}
