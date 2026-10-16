// Dosya sistemi katmanı (notepadmaster/src/remote.js): SSH (SFTP), FTP / FTPS, SFTP ve yerel klasör için ortak arayüz.
// Uzak taraf FTP Masters'ın RemoteFs'ini (lib/modules/ftp/remote_fs.dart) sarmalar; dosyayı bellekte okuyup yazar.
//
//   connect(), close(), pwd()
//   list(dir)   → [NpEntry {name, path, isDir, isLink, size, mtime}]
//   stat(p)     → NpStat {isDir, size, mtime}  (yoksa null)
//   readFile(p) → Uint8List     writeFile(p, bytes)
//   mkdir(p), rename(a, b), removeFile(p), removeDir(p)
import 'dart:async';
import 'dart:io';
import 'dart:typed_data';

import 'package:dartssh2/dartssh2.dart' show SSHAuthFailError, SSHAuthAbortError, SftpStatusError;

import '../../core/l10n/gen/mt_strings.dart';
import '../ftp/ftp_client.dart' show FtpException;
import '../ftp/remote_fs.dart';
import 'np_model.dart';

class NpEntry {
  NpEntry({required this.name, required this.path, required this.isDir, this.isLink = false, this.size = 0, this.mtime = 0});
  final String name, path;
  bool isDir;
  final bool isLink;
  final int size;
  final int mtime; // ms (bilinmiyorsa 0)
}

class NpStat {
  NpStat({required this.isDir, required this.size, required this.mtime});
  final bool isDir;
  final int size, mtime;
}

class NpError implements Exception {
  NpError(this.code, [this.message = '']);
  final String code; // NOLOCAL | EEXIST | EISDIR | ENOENT | EACCES | HOSTKEY
  final String message;
  @override
  String toString() => message.isEmpty ? code : message;
}

abstract class NpFs {
  bool get closed;
  Future<void> connect();
  Future<void> close();
  Future<String> pwd();
  Future<List<NpEntry>> list(String dir);
  Future<NpStat?> stat(String p);
  Future<Uint8List> readFile(String p);
  Future<void> writeFile(String p, List<int> bytes);
  Future<void> mkdir(String p);
  Future<void> rename(String from, String to);
  Future<void> removeFile(String p);
  Future<void> removeDir(String p);
  String? get fingerprint => null;
}

NpFs npCreateFs(NpConnection conn) => conn.isLocal ? NpLocalFs(conn) : NpRemoteFsWrap(conn);

/// FTP / FTPS / SFTP — FTP Masters istemcisi üzerinden; işlemler çağıran tarafından sıraya konur (NpProject.run).
class NpRemoteFsWrap extends NpFs {
  NpRemoteFsWrap(this.conn);
  final NpConnection conn;
  RemoteFs? _fs;
  bool _closed = true;
  String? _fp;

  @override
  bool get closed => _closed;
  @override
  String? get fingerprint => _fp;

  @override
  Future<void> connect() async {
    final fs = createRemoteFs(conn.toFtpSite(), onHostKey: (fp) => _fp = fp);
    await fs.connect();
    _fs = fs;
    _closed = false;
  }

  @override
  Future<void> close() async {
    _closed = true;
    final f = _fs;
    _fs = null;
    if (f != null) await f.close();
  }

  RemoteFs get _f => _fs ?? (throw NpError('ENOTCONN', 'Bağlı değil'));

  Future<T> _guard<T>(Future<T> Function() fn) async {
    try {
      return await fn();
    } catch (e) {
      if (npIsNetworkError(e)) _closed = true;
      rethrow;
    }
  }

  @override
  Future<String> pwd() => _guard(() => _f.pwd());

  @override
  Future<List<NpEntry>> list(String dir) => _guard(() async {
        final items = await _f.list(dir);
        final out = [
          for (final e in items)
            NpEntry(name: e.name, path: npJoin(dir, e.name), isDir: e.isDir, isLink: e.isLink, size: e.size, mtime: e.modified?.millisecondsSinceEpoch ?? 0),
        ];
        // Sembolik bağlantıların klasör olup olmadığını öğren
        for (final e in out.where((e) => e.isLink && !e.isDir)) {
          try {
            final cur = await _f.pwd();
            await _f.cd(e.path);
            await _f.cd(cur);
            e.isDir = true;
          } catch (_) {}
        }
        return out;
      });

  @override
  Future<NpStat?> stat(String p) => _guard(() async {
        // Varlık ve zaman damgası üst klasörün listesinden okunur (FTP'de SIZE/MDTM her sunucuda yok, boş dosyalarda güvenilmez)
        final dir = npDirName(p);
        final name = npBaseName(p);
        final items = await _f.list(dir.isEmpty ? '/' : dir);
        for (final e in items) {
          if (e.name == name) return NpStat(isDir: e.isDir, size: e.size, mtime: e.modified?.millisecondsSinceEpoch ?? 0);
        }
        return null;
      });

  @override
  Future<Uint8List> readFile(String p) => _guard(() async {
        final b = BytesBuilder(copy: false);
        await for (final chunk in _f.download(p)) {
          b.add(chunk);
        }
        return b.takeBytes();
      });

  @override
  Future<void> writeFile(String p, List<int> bytes) => _guard(() => _f.upload(p, Stream.value(bytes), bytes.length));
  @override
  Future<void> mkdir(String p) => _guard(() => _f.mkdir(p));
  @override
  Future<void> rename(String from, String to) => _guard(() => _f.rename(from, to));
  @override
  Future<void> removeFile(String p) => _guard(() => _f.delete(p));
  @override
  Future<void> removeDir(String p) => _guard(() async {
        for (final e in await list(p)) {
          if (e.isDir && !e.isLink) {
            await removeDir(e.path);
          } else {
            await _f.delete(e.path);
          }
        }
        await _f.delete(p, isDir: true);
      });
}

/// Yerel klasör / tek dosya (cihazdaki uygulama belgeleri altında)
class NpLocalFs extends NpFs {
  NpLocalFs(this.conn);
  final NpConnection conn;
  bool _closed = true;
  @override
  bool get closed => _closed;
  @override
  Future<void> connect() async => _closed = false;
  @override
  Future<void> close() async => _closed = true;
  @override
  Future<String> pwd() async => conn.localPath;

  @override
  Future<List<NpEntry>> list(String dir) async {
    final out = <NpEntry>[];
    await for (final e in Directory(dir).list(followLinks: false)) {
      final name = npBaseName(e.path);
      var size = 0, mtime = 0;
      var isDir = e is Directory;
      try {
        final st = await FileStat.stat(e.path);
        size = st.size;
        mtime = st.modified.millisecondsSinceEpoch;
        isDir = st.type == FileSystemEntityType.directory;
      } catch (_) {}
      out.add(NpEntry(name: name, path: e.path, isDir: isDir, isLink: e is Link, size: isDir ? 0 : size, mtime: mtime));
    }
    return out;
  }

  @override
  Future<NpStat?> stat(String p) async {
    final st = await FileStat.stat(p);
    if (st.type == FileSystemEntityType.notFound) return null;
    return NpStat(isDir: st.type == FileSystemEntityType.directory, size: st.size, mtime: st.modified.millisecondsSinceEpoch);
  }

  @override
  Future<Uint8List> readFile(String p) => File(p).readAsBytes();
  @override
  Future<void> writeFile(String p, List<int> bytes) => File(p).writeAsBytes(bytes, flush: true);
  @override
  Future<void> mkdir(String p) => Directory(p).create();
  @override
  Future<void> rename(String from, String to) async {
    final t = await FileSystemEntity.type(from);
    if (t == FileSystemEntityType.directory) {
      await Directory(from).rename(to);
    } else {
      await File(from).rename(to);
    }
  }

  @override
  Future<void> removeFile(String p) => File(p).delete();
  @override
  Future<void> removeDir(String p) => Directory(p).delete(recursive: true);
}

/// Bağlantı koptu mu (yeniden bağlanmayı tetikler) — project.js NETWORK_ERR
bool npIsNetworkError(Object e) {
  final t = e.toString();
  return e is SocketException || e is TimeoutException ||
      RegExp(r'ECONNRESET|socket hang up|closed|kapandı|Not connected|Bağlı değil|No response|ETIMEDOUT|Timeout|zaman aşımı|EPIPE|not connected', caseSensitive: false).hasMatch(t);
}

/// Hata → kullanıcı metni (np.main.err*)
String npErrorText(MtStrings s, Object e) {
  final t = e.toString();
  if (e is NpError) {
    return switch (e.code) {
      'NOLOCAL' => s.npMainErrNoLocal, 'EEXIST' => s.npMainErrExists, 'ENOENT' => s.npMainErrNotFound, 'EACCES' => s.npMainErrPerm,
      'ENOTCONN' => s.npMainErrNoSession, 'NOKEY' => s.npMainErrNoKey, _ => e.message.isEmpty ? e.code : e.message };
  }
  if (e is SSHAuthFailError || e is SSHAuthAbortError) return s.npMainErrAuth;
  if (e is FtpException) {
    if (e.code == 530 || e.code == 430) return s.npMainErrAuth;
    if (e.code == 550) return t.contains('ermission') || t.contains('enied') ? s.npMainErrPerm : s.npMainErr550(e.message);
    if (e.code == 553) return s.npMainErr553;
    if (t.contains('TLS') || t.contains('Handshake') || t.contains('CERTIFICATE')) return s.npMainErrTls(e.message);
  }
  if (e is SftpStatusError) {
    if (e.code == 2) return s.npMainErrNotFound;
    if (e.code == 3) return s.npMainErrPerm;
    if (e.code == 11) return s.npMainErrExists;
  }
  if (e is PathNotFoundException) return s.npMainErrNotFound;
  if (e is PathExistsException) return s.npMainErrExists;
  if (e is PathAccessException) return s.npMainErrPerm;
  if (t.contains('refused')) return s.npMainErrRefused;
  if (t.contains('Timeout') || t.contains('timed out') || t.contains('zaman aşımı')) return s.npMainErrTimeout;
  if (t.contains('Failed host lookup') || t.contains('lookup')) return s.npMainErrDns;
  if (t.contains('unreachable') || t.contains('Network is')) return s.npMainErrUnreach;
  if (t.contains('reset') || t.contains('closed') || t.contains('kapandı')) return s.npMainErrReset;
  if (t.contains('No such file') || t.contains('ENOENT')) return s.npMainErrNotFound;
  if (t.contains('already exists') || t.contains('EEXIST')) return s.npMainErrExists;
  if (t.contains('Permission denied') || t.contains('EACCES')) return s.npMainErrPerm;
  if (t.contains('CERTIFICATE') || t.contains('Handshake')) return s.npMainErrTls(t);
  return t;
}
