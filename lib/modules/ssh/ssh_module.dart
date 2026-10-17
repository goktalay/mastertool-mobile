// SSH Master modülü — masaüstü SSH Master ile aynı hesap kitaplığı (bağlantılar, klasörler, kısayollar; şifreli senkron).
// Diğer modüllere derin bağlantı (CrossLinks.openSsh): host/port dolu yeni bağlantı formu → kitaplığa kayıt → isteğe bağlı terminal.
import 'package:flutter/material.dart';

import '../../core/account.dart';
import '../../core/cross_links.dart';
import '../../core/module.dart';
import '../../core/module_host.dart';
import '../../core/sync.dart';
import 'ssh_form.dart';
import 'ssh_library.dart';
import 'ssh_model.dart';

class SshModule implements MtModule {
  SshModule(this.host);
  final ModuleHost host;
  @override
  String get app => 'sm';
  @override
  IconData get icon => Icons.terminal;
  @override
  Color get color => const Color(0xFF22D3EE);
  @override
  Widget build(BuildContext context, AccountService account) => SshLibraryScreen(host: host, account: account);

  /// Modüller arası kaydı yazar (main.dart'ta modül oluşturulurken).
  SshModule registerCrossLinks() {
    CrossLinks.openSsh = openFor;
    return this;
  }

  /// IP Tools vb. için: host/port önceden dolu bağlantı formu; kaydedilince kitaplığa 'connection' yazılır,
  /// "Kaydet ve bağlan" seçildiyse terminal açılır.
  Future<void> openFor(BuildContext context, {required String host, int port = 22}) async {
    final engine = await this.host.open('sm', localOnly: const {'keyPath'});
    if (!context.mounted) return;
    final folders = [for (final e in engine.library.items.entries) if (e.value.$1 == 'folder') SshFolder(e.key, e.value.$2)]
      ..sort((a, b) => a.name.toLowerCase().compareTo(b.name.toLowerCase()));
    final nav = Navigator.of(context, rootNavigator: true);
    final r = await nav.push<SshFormResult>(MaterialPageRoute(builder: (_) => SshFormScreen(folders: folders, initial: {'host': host, 'port': port})));
    if (r == null) return;
    final id = newItemId();
    engine.library.items[id] = ('connection', r.data);
    await engine.onLocalChange();
    if (r.connect && context.mounted) openSshTerminal(context, engine, id, r.data, rootNavigator: true);
  }
}
