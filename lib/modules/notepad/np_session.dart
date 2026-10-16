// Proje oturumu (notepadmaster/src/project.js): bir projenin sunucu/klasör bağlantısı ve yerel çalışma kopyası (önbellek).
//
// Çalışma kopyası: <uygulama destek dizini>/np_cache/<bağlantı id>/<uzak yol>
//   - Dosya açılınca sunucudaki içerik klasör yapısıyla birlikte buraya kopyalanır.
//   - Kaydedince dosya sunucuya yüklenir; yükleme başarılıysa kopya da güncellenir.
// İşlemler sıraya konur (FTP tek bağlantıda aynı anda tek komut); bağlantı koptuysa bir kez yeniden bağlanır.
// Çakışma koruması: açılışta not edilen boyut + mtime, kaydetmeden önce sunucudan yeniden okunur (±1,5 sn).
import 'dart:async';
import 'dart:io';
import 'dart:typed_data';

import 'package:path_provider/path_provider.dart';

import 'np_model.dart';
import 'np_remote.dart';
import 'np_textcodec.dart';

enum NpStatus { connecting, on, off }

class NpReadResult {
  NpReadResult({this.text = '', this.encoding = 'utf8', this.bom = false, this.eol, this.binary = false, this.tooLarge = false,
      this.size = 0, this.mtime = 0, this.cachePath = ''});
  final String text, encoding, cachePath;
  final bool bom, binary, tooLarge;
  final String? eol;
  final int size, mtime;
}

class NpSaveResult {
  NpSaveResult({this.ok = false, this.lossy = false, this.conflict = false, this.size = 0, this.mtime = 0, this.cachePath = ''});
  final bool ok, lossy, conflict;
  final int size, mtime;
  final String cachePath;
}

class NpProject {
  NpProject({required this.conn, required this.cacheDir, this.onHostKey, this.onStatus});
  final NpConnection conn;
  final String cacheDir;
  final void Function(String fp)? onHostKey;
  final void Function(NpStatus st)? onStatus;
  NpFs? _fs;
  String root = '';
  Future<void> _chain = Future.value();
  bool closedByUser = false;

  bool get isLocal => conn.isLocal;
  String get cacheRoot => '$cacheDir/$id';
  String get id => conn.id;

  static Future<String> defaultCacheDir() async => '${(await getApplicationSupportDirectory()).path}/np_cache';

  Future<NpFs> connect() async {
    final old = _fs;
    if (old != null) await old.close();
    onStatus?.call(NpStatus.connecting);
    final fs = npCreateFs(conn);
    try {
      await fs.connect();
    } catch (e) {
      onStatus?.call(NpStatus.off);
      rethrow;
    }
    final fp = fs.fingerprint;
    if (fp != null) onHostKey?.call(fp);
    _fs = fs;
    onStatus?.call(NpStatus.on);
    return fs;
  }

  /// Bağlanır ve proje kökünü belirler: (root, home)
  Future<(String, String)> open() async {
    final fs = await connect();
    var home = '';
    if (isLocal) {
      final lp = conn.localPath;
      if (lp.isEmpty || !(await FileSystemEntity.type(lp) != FileSystemEntityType.notFound)) throw NpError('NOLOCAL');
      root = conn.kind == 'file' ? npDirName(lp) : lp;
      home = root;
    } else {
      try {
        home = await fs.pwd();
      } catch (_) {
        home = '/';
      }
      root = conn.rootDir.isNotEmpty ? conn.rootDir : (home.isNotEmpty ? home : '/');
    }
    return (root, home);
  }

  /// İşlemleri sıraya koyar; bağlantı koptuysa bir kez yeniden bağlanır
  Future<T> run<T>(Future<T> Function(NpFs fs) fn) {
    final job = _chain.then((_) async {
      if (closedByUser) throw NpError('ENOTCONN', 'Bağlantı kapatıldı');
      if (_fs == null || _fs!.closed) await connect();
      try {
        return await fn(_fs!);
      } catch (e) {
        if (isLocal || !npIsNetworkError(e)) rethrow;
        await connect();
        return fn(_fs!);
      }
    });
    _chain = job.then((_) {}, onError: (_) {});
    return job;
  }

  /// Yerel projelerde yalnızca proje klasörünün içindeki yollara izin ver
  String check(String p) {
    if (p.isEmpty) throw NpError('ENOENT');
    if (conn.kind == 'file') {
      if (p != conn.localPath) throw NpError('EACCES');
    } else if (isLocal) {
      if (!(p == root || p.startsWith(root.endsWith('/') ? root : '$root/')) || p.contains('/../')) throw NpError('EACCES');
    }
    return p;
  }

  static final _badSeg = RegExp(r'[<>:"|?*\x00-\x1f]');

  /// Bir proje yolunun çalışma kopyasındaki karşılığı (klasör yapısı korunur)
  String cachePath(String p) {
    List<String> parts;
    if (isLocal) {
      var rel = p.startsWith(root) ? p.substring(root.length) : p;
      rel = rel.replaceAll('\\', '/');
      parts = rel.split('/');
    } else {
      parts = p.split('/');
    }
    parts = parts.where((s) => s.isNotEmpty && s != '.' && s != '..').map((s) {
      var x = s.replaceAll(_badSeg, '_');
      x = x.replaceAllMapped(RegExp(r'[. ]+$'), (m) => '_' * m[0]!.length);
      return x.isEmpty ? '_' : x;
    }).toList();
    return [cacheRoot, ...parts].join('/');
  }

  Future<String> writeCache(String p, List<int> bytes) async {
    final f = File(cachePath(p));
    await f.parent.create(recursive: true);
    await f.writeAsBytes(bytes, flush: true);
    return f.path;
  }

  Future<List<NpEntry>> list(String dir) => run((fs) => fs.list(check(dir)));
  Future<NpStat?> stat(String p) => run((fs) => fs.stat(check(p)));

  /// Dosyayı açar: içeriği indirir, çalışma kopyasına yazar, metne çevirir
  Future<NpReadResult> read(String p, {String encoding = 'auto', String fallback = 'windows-1254'}) async {
    check(p);
    final st = await stat(p);
    if (st != null && st.isDir) throw NpError('EISDIR');
    if (st != null && st.size > kNpMaxFileBytes) return NpReadResult(tooLarge: true, size: st.size);
    final buf = await run((fs) => fs.readFile(p));
    if (buf.length > kNpMaxFileBytes) return NpReadResult(tooLarge: true, size: buf.length);
    final cp = await writeCache(p, buf);
    final d = npDecode(buf, encoding: encoding, fallback: fallback);
    if (d.binary) return NpReadResult(binary: true, size: buf.length, cachePath: cp);
    return NpReadResult(text: d.text, encoding: d.encoding, bom: d.bom, eol: d.eol, size: buf.length, mtime: st?.mtime ?? 0, cachePath: cp);
  }

  /// Kaydeder: (istenirse) sunucudaki dosya açıldıktan sonra değişmiş mi bakar, yükler, çalışma kopyasını günceller
  Future<NpSaveResult> save(String p, String text, {String encoding = 'utf8', bool bom = false, (int, int)? expect, bool force = false, bool allowLossy = false}) async {
    check(p);
    if (!allowLossy && !npCanEncode(text, encoding)) return NpSaveResult(lossy: true);
    if (expect != null && !force) {
      NpStat? st;
      try {
        st = await stat(p);
      } catch (_) {/* dosya silinmiş olabilir; yeniden oluşturulur */}
      if (st != null && ((st.size != expect.$1) || (expect.$2 != 0 && st.mtime != 0 && (st.mtime - expect.$2).abs() > 1500))) {
        return NpSaveResult(conflict: true, size: st.size, mtime: st.mtime);
      }
    }
    final Uint8List buf = npEncode(text, encoding: encoding, bom: bom);
    await run((fs) => fs.writeFile(p, buf));
    final cp = await writeCache(p, buf);
    var size = buf.length, mtime = DateTime.now().millisecondsSinceEpoch;
    try {
      final st = await stat(p);
      if (st != null) { size = st.size; mtime = st.mtime; }
    } catch (_) {}
    return NpSaveResult(ok: true, size: size, mtime: mtime, cachePath: cp);
  }

  Future<void> createFile(String p) async {
    check(p);
    final name = npBaseName(p);
    final siblings = await list(npDirName(p));
    if (siblings.any((e) => e.name == name)) throw NpError('EEXIST');
    await run((fs) => fs.writeFile(p, const []));
  }

  Future<void> mkdir(String p) => run((fs) => fs.mkdir(check(p)));

  Future<void> rename(String from, String to) async {
    await run((fs) => fs.rename(check(from), check(to)));
    try {
      final dst = File(cachePath(to));
      await dst.parent.create(recursive: true);
      final src = cachePath(from);
      if (await FileSystemEntity.type(src) == FileSystemEntityType.directory) {
        await Directory(src).rename(dst.path);
      } else if (await File(src).exists()) {
        await File(src).rename(dst.path);
      }
    } catch (_) {}
  }

  Future<void> remove(String p, bool isDir) async {
    check(p);
    await run((fs) => isDir ? fs.removeDir(p) : fs.removeFile(p));
    try {
      final cp = cachePath(p);
      if (await FileSystemEntity.type(cp) == FileSystemEntityType.directory) {
        await Directory(cp).delete(recursive: true);
      } else {
        await File(cp).delete();
      }
    } catch (_) {}
  }

  Future<void> close() async {
    closedByUser = true;
    await _fs?.close();
  }
}
