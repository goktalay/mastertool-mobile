// Convert Master kitaplık ekranı — ortak LibraryScreen üzerine uyarlama (masaüstü ana pencere): proje kartı = ad, tür simgesi/rengi,
// mono alt satır "KAYNAK → HEDEF", etiketler: Dosya/Klasör · "N dosya dönüştürüldü" · hata sayısı. Uzun basma menüsü ek maddeleri:
// Çevrilmiş dosyaları sil · Ayarlar (modül). Kitaplık: host.open('cv', hasSettings, localOnly: sourcePath/unchecked/sources/outputs).
import 'package:flutter/material.dart';

import '../../core/l10n/gen/mt_strings.dart';
import '../../core/module_host.dart';
import '../../core/sync.dart';
import '../../widgets/library_screen.dart';
import 'cv_engine.dart';
import 'cv_form.dart';
import 'cv_model.dart';
import 'cv_project.dart';
import 'cv_settings.dart';

class CvLibraryScreen extends StatefulWidget {
  const CvLibraryScreen({super.key, required this.host});
  final ModuleHost host;
  @override
  State<CvLibraryScreen> createState() => _CvLibraryScreenState();
}

class _CvLibraryScreenState extends State<CvLibraryScreen> {
  SyncEngine? _engine;

  @override
  void initState() {
    super.initState();
    widget.host.open('cv', hasSettings: true, localOnly: kCvLocalOnly).then((e) {
      if (mounted) setState(() => _engine = e);
    });
  }

  CvSettings get _settings => CvSettings(_engine?.library.items['settings']?.$2 ?? CvSettings.blank());

  Future<void> _save(String id, Map<String, dynamic> data) async {
    _engine!.library.items[id] = ('project', data);
    await _engine!.onLocalChange();
  }

  List<(String, String)> get _folders => [for (final e in _engine!.library.items.entries) if (e.value.$1 == 'folder') (e.key, (e.value.$2['name'] ?? '').toString())]
    ..sort((a, b) => a.$2.toLowerCase().compareTo(b.$2.toLowerCase()));

  Future<(Map<String, dynamic>, bool)?> _form(BuildContext ctx, String? id, Map<String, dynamic>? data, List<(String, String)> folders, String? folderId) =>
      Navigator.of(ctx).push<(Map<String, dynamic>, bool)>(MaterialPageRoute(builder: (_) => CvFormScreen(
          existing: id == null ? null : CvProject(id, data!), folders: folders, folderId: folderId, settings: _settings)));

  void _openSettings(BuildContext ctx) => Navigator.of(ctx).push(MaterialPageRoute(builder: (_) => CvSettingsScreen(engine: _engine!)));

  void _open(BuildContext ctx, String id, Map<String, dynamic> data) {
    Navigator.of(ctx).push(MaterialPageRoute(builder: (_) => CvProjectScreen(
        projectId: id, engine: _engine!,
        onEditProject: (c) async {
          final cur = _engine!.library.items[id]?.$2 ?? data;
          final r = await _form(c, id, cur, _folders, cur['folderId'] as String?);
          if (r != null) await _save(id, r.$1);
        },
        onModuleSettings: _openSettings)));
  }

  @override
  Widget build(BuildContext context) {
    final s = MtStrings.of(context);
    if (_engine == null) return const Scaffold(body: Center(child: CircularProgressIndicator()));
    return LibraryScreen(
      engine: _engine!,
      adapter: LibraryAdapter(
        app: 'cv', kind: 'project', appIcon: 'cv', copySuffix: s.cvMainCopySuffix,
        texts: LibraryTexts(
          title: 'Convert Master', searchPh: s.cvAppSearchPh, newItem: s.cvAppNewProject, items: s.cvAppProjects, welcome: s.cvAppWelcome,
          welcomeHint: s.cvAppWelcomeHint.replaceAll('<br>', ' '), noMatch: s.cvAppNoMatch, stats: s.cvAppStats, folderCount: s.cvAppFolderCount,
          deleteItem: s.cvAppDeleteProject, deleteItemMsg: (name, _) => s.cvAppDeleteProjectMsg(name), newHere: s.cvAppNewProjectHere, results: s.cvAppResults, all: s.cvAppAll,
        ),
        toItem: (id, d) {
          final p = CvProject(id, d);
          final srcAll = p.sourceExts.length >= p.typeInfo.source.length;
          final src = srcAll ? s.cvAppAllExts : p.sourceExts.take(3).map((e) => e.toUpperCase()).join(', ') + (p.sourceExts.length > 3 ? '…' : '');
          final icon = switch (p.type) { 'image' => Icons.image_outlined, 'audio' => Icons.music_note_outlined, _ => Icons.videocam_outlined };
          final running = CvRunners.peek(id)?.running == true;
          return LibraryItem(id: id, name: p.name, subtitle: '$src → ${p.targetExt.toUpperCase()}', color: p.colorValue, icon: icon, folderId: p.folderId, tags: [
            (p.sourceMode == 'folder' ? Icons.folder_outlined : Icons.insert_drive_file_outlined, p.sourceMode == 'folder' ? s.cvPfModeFolder : s.cvPfModeFile),
            if (running) (Icons.sync, s.cvAppRunning),
            (Icons.check, s.cvMobConverted(p.doneCount)),
            if (p.errorCount > 0) (Icons.error_outline, s.cvAppErrorCount('${p.errorCount}')),
          ]);
        },
        onOpen: _open,
        onEdit: _form,
        extraMenu: [('clear', Icons.delete_sweep_outlined, s.cvAppClearOutputs), ('settings', Icons.settings_outlined, s.cvAppSettings)],
        onExtra: (ctx, key, id, data) async {
          if (key == 'settings') _openSettings(ctx);
          if (key == 'clear') {
            final r = await CvRunners.of(id, _engine!);
            await r.clearOutputs();
          }
        },
      ),
    );
  }
}
