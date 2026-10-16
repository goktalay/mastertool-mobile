// Modül çalışma ortamı: her modül için yerel kitaplık + senkron motoru (tek örnek, uygulama ömrünce).
import 'dart:collection';

import 'account.dart';
import 'sync.dart';

class ModuleHost {
  ModuleHost(this.account);
  final AccountService account;
  final _engines = HashMap<String, SyncEngine>();

  /// Modülün kitaplığını açar (ilk çağrıda dosyadan yükler ve senkronu başlatır).
  Future<SyncEngine> open(String app, {bool hasSettings = false, int maxBytes = kMaxBlobBytes, Set<String> localOnly = const {}}) async {
    final e = _engines[app];
    if (e != null) return e;
    final lib = LocalLibrary(app, await account.deviceKey());
    await lib.load();
    final engine = SyncEngine(account: account, app: app, library: lib, deviceId: await account.deviceId(), hasSettings: hasSettings, maxBytes: maxBytes, localOnly: localOnly);
    _engines[app] = engine;
    engine.start();
    return engine;
  }

  /// Ön plana gelince tüm açık modüller senkronlanır.
  void resumeAll() {
    for (final e in _engines.values) {
      e.syncNow();
    }
  }

  void dispose() {
    for (final e in _engines.values) {
      e.dispose();
    }
    _engines.clear();
  }
}
