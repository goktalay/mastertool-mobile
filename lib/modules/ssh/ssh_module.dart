// SSH Master modülü — masaüstü SSH Master ile aynı hesap kitaplığı (bağlantılar, klasörler, kısayollar; şifreli senkron).
import 'package:flutter/material.dart';

import '../../core/account.dart';
import '../../core/module.dart';
import '../../core/module_host.dart';
import 'ssh_library.dart';

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
}
