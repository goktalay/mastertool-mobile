// Hesap ve oturum yönetimi (tek uygulama, tüm modüller için ortak).
//  • Giriş: prelogin → kdf; master/authHash türet; /api/mt/auth/login {client: android|ios} → sso_token.
//  • Güvenli depoda: {sso_token, email, user, master(base64), kdf}. master yalnız burada; sunucuya/günlüğe gitmez.
//  • Modül oturumu: /api/<app>/auth/sso ile şifresiz; token bellekte tutulur, gerekince yenilenir. 403 app_disabled → modül kapalı.
//  • encKey(modül) = HKDF(master, "<önek>-enc-v1") — masaüstüyle aynı; kitaplık senkronu bu anahtarla çözülür.
//  • Herhangi bir istekte 401 (session_expired): sunucu aileyi kapatmıştır → yerel oturum silinir, giriş ekranına dönülür.
//    Yerel veriler (bağlantılar, projeler, ayarlar) SİLİNMEZ.
import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'dart:math';

import 'package:flutter/foundation.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:package_info_plus/package_info_plus.dart';

import 'api.dart';
import 'crypto.dart';

/// Modül kodları ve senkron anahtar önekleri (masaüstü uygulamalarla aynı).
const kModules = {
  'sm': ('SSH Master', 'sshm'),
  'fm': ('FTP Masters', 'ftpm'),
  'sq': ('SQL Master', 'sqlm'),
  'np': ('Notepad Master', 'npm'),
  'cv': ('Convert Master', 'cvm'),
  'ip': ('IP Tools', 'ipt'),
};

class MtUser {
  MtUser({required this.id, required this.name, required this.email});
  final int? id;
  final String name;
  final String email;
}

class ModuleInfo {
  ModuleInfo({required this.app, required this.name, required this.license, this.description, this.site});
  final String app;
  final String name;
  final String license; // AKTIF | KAPALI | …
  final String? description;
  final String? site;
  bool get enabled => license == 'AKTIF';
}

/// Oturum deposu: cihazda güvenli depo (Keychain / Android Keystore); testlerde bellek.
abstract class KvStore {
  Future<String?> read(String key);
  Future<void> write(String key, String value);
  Future<void> delete(String key);
}

class SecureKvStore implements KvStore {
  const SecureKvStore();
  static const _s = FlutterSecureStorage();
  @override
  Future<String?> read(String key) => _s.read(key: key);
  @override
  Future<void> write(String key, String value) => _s.write(key: key, value: value);
  @override
  Future<void> delete(String key) => _s.delete(key: key);
}

class MemoryKvStore implements KvStore {
  final Map<String, String> _m = {};
  @override
  Future<String?> read(String key) async => _m[key];
  @override
  Future<void> write(String key, String value) async => _m[key] = value;
  @override
  Future<void> delete(String key) async => _m.remove(key);
}

class AccountService extends ChangeNotifier {
  AccountService({MtApi? api, KvStore? store})
      : api = api ?? MtApi(),
        _store = store ?? const SecureKvStore();
  final MtApi api;
  final KvStore _store;
  static const _key = 'mastertool.session';

  /// Testler ve ekran görüntüleri için: sunucuya gitmeden oturum açık görünümü.
  @visibleForTesting
  void seed({required String email, required String name, required List<ModuleInfo> modules, String ssoToken = 'test'}) {
    _ssoToken = ssoToken;
    user = MtUser(id: 1, name: name, email: email);
    this.modules = modules;
    loading = false;
    notifyListeners();
  }

  String? _ssoToken;
  Uint8List? _master;
  Kdf? _kdf;
  MtUser? user;
  List<ModuleInfo> modules = const [];
  final Map<String, String> _moduleTokens = {};
  final Map<String, Uint8List> _encKeys = {};
  bool loading = true;
  String? lastError;

  bool get signedIn => _ssoToken != null;
  String? get ssoToken => _ssoToken;

  String get client => Platform.isIOS ? 'ios' : 'android';
  String _appVersion = '0.0.0';
  String _device = 'Telefon';

  Future<void> init() async {
    try {
      final info = await PackageInfo.fromPlatform();
      _appVersion = info.version;
    } catch (_) {}
    _device = Platform.isIOS ? 'iPhone' : 'Android';
    final raw = await _store.read(_key);
    if (raw != null) {
      try {
        final j = jsonDecode(raw) as Map<String, dynamic>;
        _ssoToken = j['sso_token'] as String?;
        _master = base64.decode(j['master'] as String);
        _kdf = Kdf.fromJson(j['kdf'] as Map<String, dynamic>);
        final u = j['user'] as Map<String, dynamic>;
        user = MtUser(id: (u['id'] as num?)?.toInt(), name: (u['name'] ?? '').toString(), email: (j['email'] ?? '').toString());
      } catch (_) {
        await _store.delete(_key);
        _ssoToken = null;
      }
    }
    loading = false;
    notifyListeners();
    if (signedIn) unawaited(refreshModules());
  }

  Future<void> _persist() async {
    await _store.write(_key, jsonEncode({
      'sso_token': _ssoToken, 'email': user?.email, 'user': {'id': user?.id, 'name': user?.name},
      'master': base64.encode(_master!), 'kdf': _kdf!.toJson(),
    }));
  }

  /// Şifreyle giriş. Hata: MtError (bad_credentials, unverified, suspended, rate_limited, network…).
  Future<void> login(String email, String password) async {
    email = email.trim().toLowerCase();
    final pre = await api.prelogin(email);
    var kdf = Kdf.fromJson(pre['kdf'] as Map<String, dynamic>);
    var keys = await deriveKeys(password, kdf);
    final r = await api.login(email: email, authHash: keys.authHash, client: client, device: _device, appVersion: _appVersion);
    // Sunucu girişte kdf döndürür; prelogin'deki sahte tuzdan farklıysa master yeniden türetilir (masaüstü kalıbı).
    final rk = r['kdf'];
    if (rk is Map<String, dynamic>) {
      final k2 = Kdf.fromJson(rk);
      if (k2.salt != kdf.salt || k2.iter != kdf.iter) {
        wipe(keys.master);
        kdf = k2;
        keys = await deriveKeys(password, kdf);
      }
    }
    final u = (r['user'] as Map<String, dynamic>?) ?? const {};
    _ssoToken = r['sso_token'] as String;
    _master = keys.master;
    _kdf = kdf;
    user = MtUser(id: (u['id'] as num?)?.toInt(), name: (u['name'] ?? u['full_name'] ?? '').toString(), email: email);
    await _persist();
    notifyListeners();
    await refreshModules();
  }

  Future<void> refreshModules() async {
    final t = _ssoToken;
    if (t == null) return;
    try {
      final r = await api.apps(t);
      final list = (r['apps'] as List? ?? const []).cast<Map<String, dynamic>>();
      modules = [
        for (final a in list)
          if (kModules.containsKey(a['app']))
            ModuleInfo(app: a['app'] as String, name: (a['name'] ?? kModules[a['app']]!.$1).toString(),
                license: (a['license'] ?? 'KAPALI').toString(), description: a['description'] as String?, site: a['site'] as String?),
      ];
      lastError = null;
    } on MtError catch (e) {
      if (e.sessionExpired) {
        await _dropLocal();
        return;
      }
      lastError = e.message;
    }
    notifyListeners();
  }

  /// Modül oturumu (şifresiz, ortak oturumdan). Önbellekli; 401 gelirse çağıran [invalidateModule] ile yeniler.
  Future<String> moduleToken(String app) async {
    final cached = _moduleTokens[app];
    if (cached != null) return cached;
    final t = _ssoToken;
    if (t == null) throw MtError(401, 'session_expired', 'Oturum kapalı');
    try {
      final r = await api.moduleSso(app, t, _device, _appVersion);
      return _moduleTokens[app] = r['token'] as String;
    } on MtError catch (e) {
      if (e.sessionExpired) await _dropLocal();
      rethrow;
    }
  }

  void invalidateModule(String app) => _moduleTokens.remove(app);

  Future<Uint8List> encKey(String app) async {
    final c = _encKeys[app];
    if (c != null) return c;
    final m = _master;
    if (m == null) throw MtError(401, 'session_expired', 'Oturum kapalı');
    return _encKeys[app] = await encKeyFromMaster(m, kModules[app]!.$2);
  }

  /// Çıkış: sunucuda ortak oturum ve ona bağlı tüm modül oturumları kapanır; yerel veriler kalır.
  Future<void> logout() async {
    final t = _ssoToken;
    if (t != null) {
      try {
        await api.logout(t);
      } catch (_) {/* çevrimdışı: yerel oturum yine silinir */}
    }
    await _dropLocal();
  }

  Future<void> _dropLocal() async {
    _ssoToken = null;
    if (_master != null) wipe(_master!);
    _master = null;
    _kdf = null;
    user = null;
    modules = const [];
    _moduleTokens.clear();
    _encKeys.clear();
    await _store.delete(_key);
    notifyListeners();
  }

  /// Her modül isteğinde kullanılır: 401 → oturum düşmüş say.
  Future<T> guard<T>(Future<T> Function() f) async {
    try {
      return await f();
    } on MtError catch (e) {
      if (e.sessionExpired) await _dropLocal();
      rethrow;
    }
  }

  // ---- cihaz kimliği ve cihaz anahtarı (oturumdan bağımsız; yerel kitaplık dosyaları bununla şifrelenir, çıkışta kalır)
  Uint8List? _deviceKey;
  String? _deviceId;

  Future<Uint8List> deviceKey() async {
    if (_deviceKey != null) return _deviceKey!;
    final raw = await _store.read('mastertool.devicekey');
    if (raw != null) return _deviceKey = base64.decode(raw);
    final r = Random.secure();
    final k = Uint8List.fromList(List.generate(32, (_) => r.nextInt(256)));
    await _store.write('mastertool.devicekey', base64.encode(k));
    return _deviceKey = k;
  }

  Future<String> deviceId() async {
    if (_deviceId != null) return _deviceId!;
    final raw = await _store.read('mastertool.deviceid');
    if (raw != null) return _deviceId = raw;
    final r = Random.secure();
    final b = List<int>.generate(16, (_) => r.nextInt(256));
    b[6] = (b[6] & 0x0f) | 0x40;
    b[8] = (b[8] & 0x3f) | 0x80;
    final h = b.map((x) => x.toRadixString(16).padLeft(2, '0')).join();
    final id = '${h.substring(0, 8)}-${h.substring(8, 12)}-${h.substring(12, 16)}-${h.substring(16, 20)}-${h.substring(20)}';
    await _store.write('mastertool.deviceid', id);
    return _deviceId = id;
  }
}

