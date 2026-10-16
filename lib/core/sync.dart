// Kitaplık senkronu — masaüstü uygulamalarla (sshmasters/src/account.js) BİREBİR aynı kurallar; modülden bağımsız motor.
//  • Öğe: {id, kind, updated_at(ms), rev, device, deleted, data|null}; blob = AES-GCM({schema:1, items}) (crypto.dart).
//  • Yerel meta: {kind, hash, updated_at, rev, device, deleted}; hash = base64(sha256(stable(data))) — yalnız yerel.
//  • Birleştirme: büyük updated_at > büyük rev > sözlük sırasında büyük device; öğe bütün olarak kazanır.
//  • Tombstone 30 gün; "settings" öğesi ilk oluşunca updated_at=0 (uzaktaki ayar kazanır).
//  • syncOnce: GET → çöz → birleştir → gerekirse uygula → aynıysa sürümü kaydet, değilse PUT (409 → gövdedeki yeni
//    {version, blob} ile en çok 4 deneme). decrypt_failed'da yerel veriye DOKUNULMAZ, yalnız hata gösterilir.
//  • Tetik: yerel değişiklikten 3 sn sonra, açıkken 5 dk'da bir, giriş/ön plana gelişte; tek uçuş + "again" bayrağı.
//  • Yerel kitaplık cihaz anahtarıyla (güvenli depoda rastgele 32 B, oturumdan bağımsız) şifreli dosyada durur; çıkışta kalır.
import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'dart:math';

import 'package:crypto/crypto.dart' as c;
import 'package:flutter/foundation.dart';
import 'package:path_provider/path_provider.dart';

import 'account.dart';
import 'api.dart';
import 'crypto.dart';

const kSyncDebounce = Duration(seconds: 3);
const kSyncInterval = Duration(minutes: 5);
const kTombstoneTtlMs = 30 * 24 * 3600 * 1000;
const kMaxBlobBytes = 5 * 1024 * 1024;

/// Masaüstü stable(): dizi sırası korunur, nesne anahtarları alfabetik, undefined → null.
String stableJson(Object? v) {
  if (v is List) return '[${v.map(stableJson).join(',')}]';
  if (v is Map) {
    final keys = v.keys.map((k) => k.toString()).toList()..sort();
    return '{${keys.map((k) => '${jsonEncode(k)}:${stableJson(v[k])}').join(',')}}';
  }
  return jsonEncode(v);
}

String hashOf(Object? data) => base64.encode(c.sha256.convert(utf8.encode(stableJson(data))).bytes);

class SyncItem {
  SyncItem({required this.id, required this.kind, required this.updatedAt, required this.rev, required this.device, required this.deleted, this.data});
  final String id, kind, device;
  final int updatedAt, rev;
  final bool deleted;
  final Map<String, dynamic>? data;

  factory SyncItem.fromJson(Map<String, dynamic> j) => SyncItem(
      id: j['id'].toString(), kind: (j['kind'] ?? '').toString(), updatedAt: (j['updated_at'] as num?)?.toInt() ?? 0,
      rev: (j['rev'] as num?)?.toInt() ?? 0, device: (j['device'] ?? '').toString(), deleted: j['deleted'] == true,
      data: j['deleted'] == true ? null : (j['data'] as Map?)?.cast<String, dynamic>());
  Map<String, dynamic> toJson() => {'id': id, 'kind': kind, 'updated_at': updatedAt, 'rev': rev, 'device': device, 'deleted': deleted, 'data': deleted ? null : data};
}

class SyncMeta {
  SyncMeta({required this.kind, this.hash, required this.updatedAt, required this.rev, required this.device, required this.deleted});
  String kind, device;
  String? hash;
  int updatedAt, rev;
  bool deleted;
  Map<String, dynamic> toJson() => {'kind': kind, 'hash': hash, 'updated_at': updatedAt, 'rev': rev, 'device': device, 'deleted': deleted};
  factory SyncMeta.fromJson(Map<String, dynamic> j) => SyncMeta(kind: (j['kind'] ?? '').toString(), hash: j['hash'] as String?,
      updatedAt: (j['updated_at'] as num?)?.toInt() ?? 0, rev: (j['rev'] as num?)?.toInt() ?? 0, device: (j['device'] ?? '').toString(), deleted: j['deleted'] == true);
}

bool newer(SyncItem a, SyncItem b) {
  if (a.updatedAt != b.updatedAt) return a.updatedAt > b.updatedAt;
  if (a.rev != b.rev) return a.rev > b.rev;
  return a.device.compareTo(b.device) > 0;
}

List<SyncItem> mergeItems(Iterable<SyncItem> local, Iterable<SyncItem> remote, {int? now}) {
  final t = now ?? DateTime.now().millisecondsSinceEpoch;
  final m = <String, SyncItem>{};
  for (final it in [...local, ...remote]) {
    final old = m[it.id];
    if (old == null || newer(it, old)) m[it.id] = it;
  }
  return m.values.where((it) => !(it.deleted && t - it.updatedAt > kTombstoneTtlMs)).toList();
}

String itemsKey(List<SyncItem> items) {
  final l = [...items]..sort((a, b) => a.id.compareTo(b.id));
  return stableJson(l.map((x) => [x.id, x.updatedAt, x.rev, x.deleted]).toList());
}

enum SyncState { off, idle, syncing, offline, error }

/// Modülün senkron motoruna verdiği veri: id → (kind, data). Şifreler düz metin (blob zaten uçtan uca şifreli).
typedef CurrentData = Map<String, (String, Map<String, dynamic>)>;

/// Yerel kitaplık dosyası: {"items": {id: {kind, data}}, "meta": {id: SyncMeta}, "version", "lastSyncAt"} — cihaz anahtarıyla şifreli.
class LocalLibrary {
  LocalLibrary(this.app, this._deviceKey);
  final String app;
  final Uint8List _deviceKey;
  final Map<String, (String, Map<String, dynamic>)> items = {};
  final Map<String, SyncMeta> meta = {};
  int? version;
  int? lastSyncAt;
  Future<File> get _file async => File('${(await getApplicationSupportDirectory()).path}/library_$app.enc');

  Future<void> load() async {
    final f = await _file;
    if (!await f.exists()) return;
    try {
      final j = await decryptLibrary(_deviceKey, await f.readAsString());
      items.clear();
      meta.clear();
      (j['items'] as Map? ?? {}).forEach((k, v) => items[k.toString()] = ((v['kind'] ?? '').toString(), (v['data'] as Map).cast<String, dynamic>()));
      (j['meta'] as Map? ?? {}).forEach((k, v) => meta[k.toString()] = SyncMeta.fromJson((v as Map).cast<String, dynamic>()));
      version = (j['version'] as num?)?.toInt();
      lastSyncAt = (j['lastSyncAt'] as num?)?.toInt();
    } catch (_) {/* bozuk dosya: boş başla */}
  }

  Future<void> save() async {
    final f = await _file;
    final blob = await encryptLibrary(_deviceKey, {
      'items': {for (final e in items.entries) e.key: {'kind': e.value.$1, 'data': e.value.$2}},
      'meta': {for (final e in meta.entries) e.key: e.value.toJson()}, 'version': version, 'lastSyncAt': lastSyncAt,
    });
    final tmp = File('${f.path}.tmp');
    await tmp.writeAsString(blob, flush: true);
    await tmp.rename(f.path);
  }
}

String newItemId() {
  final r = Random.secure();
  return List.generate(16, (_) => r.nextInt(16).toRadixString(16)).join(); // masaüstü: randomBytes(8).hex
}

String newUuid() {
  final r = Random.secure();
  final b = List<int>.generate(16, (_) => r.nextInt(256));
  b[6] = (b[6] & 0x0f) | 0x40;
  b[8] = (b[8] & 0x3f) | 0x80;
  final h = b.map((x) => x.toRadixString(16).padLeft(2, '0')).join();
  return '${h.substring(0, 8)}-${h.substring(8, 12)}-${h.substring(12, 16)}-${h.substring(16, 20)}-${h.substring(20)}';
}

/// Modül senkron motoru. Modül yerel kitaplığı (items) okur/yazar, değişiklikte [onLocalChange] çağırır.
class SyncEngine extends ChangeNotifier {
  SyncEngine({required this.account, required this.app, required this.library, required this.deviceId, this.maxBytes = kMaxBlobBytes,
      this.hasSettings = false, this.localOnly = const {}});
  final AccountService account;
  final String app;
  final LocalLibrary library;
  final String deviceId;
  final int maxBytes;
  final bool hasSettings;
  /// Yalnız cihazda kalan alanlar (masaüstü: keyPath, localDir, lastRemoteDir, openTabs…): blob'a ve hash'e girmez.
  final Set<String> localOnly;

  Map<String, dynamic> _syncData(Map<String, dynamic> d) => localOnly.isEmpty ? d : {for (final e in d.entries) if (!localOnly.contains(e.key)) e.key: e.value};

  SyncState state = SyncState.idle;
  String? error;
  bool syncEnabled = true;
  Timer? _debounce, _periodic;
  bool _inFlight = false, _again = false;

  void start() {
    _periodic?.cancel();
    _periodic = Timer.periodic(kSyncInterval, (_) => syncNow());
    syncNow();
  }

  void stop() {
    _debounce?.cancel();
    _periodic?.cancel();
  }

  /// Yerel değişiklik: dosyayı hemen yaz, 3 sn sonra senkronla.
  Future<void> onLocalChange() async {
    await library.save();
    _debounce?.cancel();
    _debounce = Timer(kSyncDebounce, syncNow);
  }

  Future<void> syncNow() async {
    if (_inFlight) {
      _again = true;
      return;
    }
    _inFlight = true;
    try {
      await _syncOnce();
    } finally {
      _inFlight = false;
      if (_again) {
        _again = false;
        unawaited(syncNow());
      }
    }
  }

  List<SyncItem> _localItems() {
    final now = DateTime.now().millisecondsSinceEpoch;
    final cur = library.items;
    final meta = library.meta;
    var changed = false;
    cur.forEach((id, v) {
      final h = hashOf(_syncData(v.$2));
      final o = meta[id];
      if (o == null || o.deleted || o.hash != h) {
        meta[id] = SyncMeta(kind: v.$1, hash: h, updatedAt: (id == 'settings' && o == null) ? 0 : now, rev: (o?.rev ?? 0) + 1, device: deviceId, deleted: false);
        changed = true;
      }
    });
    for (final id in meta.keys.toList()) {
      final o = meta[id]!;
      if (!cur.containsKey(id) && !o.deleted) {
        o..hash = null..deleted = true..updatedAt = now..rev = o.rev + 1..device = deviceId;
        changed = true;
      }
      if (o.deleted && now - o.updatedAt > kTombstoneTtlMs) {
        meta.remove(id);
        changed = true;
      }
    }
    if (changed) unawaited(library.save());
    return [for (final e in meta.entries) SyncItem(id: e.key, kind: e.value.kind, updatedAt: e.value.updatedAt, rev: e.value.rev,
        device: e.value.device, deleted: e.value.deleted, data: e.value.deleted ? null : (cur[e.key] == null ? null : _syncData(cur[e.key]!.$2)))];
  }

  @visibleForTesting
  List<SyncItem> debugLocalItems() => _localItems();

  void _applyItems(List<SyncItem> items) {
    library.meta.clear();
    final old = Map<String, (String, Map<String, dynamic>)>.from(library.items);
    library.items.clear();
    for (final it in items) {
      if (!it.deleted && it.data != null) {
        final keep = {for (final e in (old[it.id]?.$2 ?? const {}).entries) if (localOnly.contains(e.key)) e.key: e.value};
        library.items[it.id] = (it.kind, {...it.data!, ...keep});
      }
      library.meta[it.id] = SyncMeta(kind: it.kind, hash: it.deleted ? null : hashOf(it.data), updatedAt: it.updatedAt, rev: it.rev, device: it.device, deleted: it.deleted);
    }
  }

  Future<void> _syncOnce() async {
    if (!syncEnabled) {
      _set(SyncState.off);
      return;
    }
    if (!account.signedIn) return;
    _set(SyncState.syncing);
    try {
      final token = await account.moduleToken(app);
      final key = await account.encKey(app);
      var local = _localItems();
      var remote = await account.guard(() => account.api.libraryGet(app, token));
      for (var i = 0; i < 4; i++) {
        final blob = remote['blob'] as String?;
        final rVersion = (remote['version'] as num?)?.toInt();
        List<SyncItem> rItems = const [];
        if (blob != null && blob.isNotEmpty) {
          final pt = await decryptLibrary(key, blob); // DecryptFailed → aşağıda yakalanır, yerel veriye dokunulmaz
          rItems = ((pt['items'] as List?) ?? const []).map((x) => SyncItem.fromJson((x as Map).cast<String, dynamic>())).toList();
        }
        final remoteHasSettings = hasSettings && rItems.any((x) => x.id == 'settings' && !x.deleted);
        final merged = mergeItems(remoteHasSettings ? local.where((x) => !(x.id == 'settings' && x.updatedAt == 0)) : local, rItems);
        if (itemsKey(merged) != itemsKey(local)) {
          _applyItems(merged);
          await library.save();
          notifyListeners();
        }
        if (blob != null && itemsKey(merged) == itemsKey(rItems)) {
          library.version = rVersion;
          break;
        }
        final newBlob = await encryptLibrary(key, {'schema': 1, 'items': merged.map((x) => x.toJson()).toList()});
        if (utf8.encode(newBlob).length > maxBytes) throw MtError(413, 'too_large', 'Kitaplık çok büyük');
        try {
          final put = await account.guard(() => account.api.libraryPut(app, token, baseVersion: rVersion, blob: newBlob));
          library.version = (put['version'] as num?)?.toInt();
          break;
        } on MtError catch (e) {
          if (e.status != 409 || e.body['blob'] == null && e.body['version'] == null) rethrow;
          remote = e.body;
          local = merged;
        }
      }
      library.lastSyncAt = DateTime.now().millisecondsSinceEpoch;
      await library.save();
      error = null;
      _set(SyncState.idle);
    } on DecryptFailed {
      error = 'decrypt_failed';
      _set(SyncState.error);
    } on MtError catch (e) {
      if (e.network) {
        _set(SyncState.offline);
      } else if (e.status == 401) {
        account.invalidateModule(app);
        _set(SyncState.idle);
      } else {
        error = e.code;
        _set(SyncState.error);
      }
    } catch (e) {
      error = e.toString();
      _set(SyncState.error);
    }
  }

  void _set(SyncState s) {
    state = s;
    notifyListeners();
  }

  Future<void> deleteRemote() async {
    final token = await account.moduleToken(app);
    await account.guard(() => account.api.libraryDelete(app, token));
    await account.guard(() => account.api.moduleSettings(app, token, syncEnabled: false));
    syncEnabled = false;
    _set(SyncState.off);
  }

  Future<void> setSyncEnabled(bool on) async {
    final token = await account.moduleToken(app);
    await account.guard(() => account.api.moduleSettings(app, token, syncEnabled: on));
    syncEnabled = on;
    if (on) {
      await syncNow();
    } else {
      _set(SyncState.off);
    }
  }

  @override
  void dispose() {
    stop();
    super.dispose();
  }
}

