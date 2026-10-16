// Modül arayüzü: her modül (SSH, FTP, SQL, Notepad, Convert, IP Tools) bu sözleşmeyle ana ekrana bağlanır.
// Modülün sunucu oturumu ve senkron anahtarı AccountService'ten alınır (moduleToken / encKey).
import 'package:flutter/material.dart';

import 'account.dart';

abstract class MtModule {
  String get app; // sm | fm | sq | np | cv | ip
  IconData get icon;
  Color get color;
  /// Modülün kök ekranı.
  Widget build(BuildContext context, AccountService account);
}

/// Henüz yazılmamış modül: adı ve "hazırlanıyor" notu.
class PlaceholderModule implements MtModule {
  PlaceholderModule(this.app, this.icon, this.color);
  @override
  final String app;
  @override
  final IconData icon;
  @override
  final Color color;
  @override
  Widget build(BuildContext context, AccountService account) => _Soon(app: app, icon: icon, color: color);
}

class _Soon extends StatelessWidget {
  const _Soon({required this.app, required this.icon, required this.color});
  final String app;
  final IconData icon;
  final Color color;
  @override
  Widget build(BuildContext context) {
    final name = kModules[app]?.$1 ?? app;
    return Scaffold(
      appBar: AppBar(title: Text(name)),
      body: Center(child: Column(mainAxisSize: MainAxisSize.min, children: [
        Icon(icon, size: 56, color: color),
        const SizedBox(height: 12),
        Text(name, style: Theme.of(context).textTheme.titleLarge),
      ])),
    );
  }
}
