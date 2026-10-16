// Uzak dosya sistemi arayüzü: FTP/FTPS (ftp_client.dart) ve SFTP (dartssh2) aynı API ile; hata metinleri main.err* sözlüğü.
import 'dart:async';
import 'dart:convert';
import 'dart:typed_data';

import 'package:crypto/crypto.dart' as c;
import 'package:dartssh2/dartssh2.dart';

import '../../core/l10n/gen/mt_strings.dart';
import 'ftp_client.dart';
import 'ftp_model.dart';

typedef Progress = void Function(int done, int? total);

abstract class RemoteFs {
  Future<void> connect();
  Future<void> close();
  Future<String> pwd();
  Future<void> cd(String path);
  Future<List<RemoteEntry>> list(String path);
  Future<bool> exists(String path);
  Future<int?> size(String path);
  Stream<List<int>> download(String path, {int offset = 0, Progress? onProgress});
  Future<void> upload(String path, Stream<List<int>> data, int size, {Progress? onProgress});
  Future<void> mkdir(String path);
  Future<void> rename(String from, String to);
  Future<void> delete(String path, {bool isDir = false});
  String join(String dir, String name) => dir.endsWith('/') ? '$dir$name' : '$dir/$name';
}

RemoteFs createRemoteFs(FtpSite site, {void Function(String fp)? onHostKey}) =>
    site.isSftp ? SftpFs(site, onHostKey: onHostKey) : FtpFs(site, onCertFp: onHostKey);

class FtpFs extends RemoteFs {
  FtpFs(this.site, {this.onCertFp});
  final FtpSite site;
  final void Function(String fp)? onCertFp;
  late final FtpClient _c = FtpClient(host: site.host, port: site.port, user: site.anonymous ? 'anonymous' : site.username,
      password: site.anonymous ? 'guest@' : site.password, protocol: site.protocol, encoding: site.encoding, knownCertFp: site.hostKey, onCertFp: onCertFp);

  @override
  Future<void> connect() => _c.connect();
  @override
  Future<void> close() => _c.close();
  @override
  Future<String> pwd() => _c.pwd();
  @override
  Future<void> cd(String path) => _c.cd(path);
  @override
  Future<List<RemoteEntry>> list(String path) => _c.list(path);
  @override
  Future<bool> exists(String path) => _c.exists(path);
  @override
  Future<int?> size(String path) => _c.size(path);
  @override
  Stream<List<int>> download(String path, {int offset = 0, Progress? onProgress}) async* {
    final total = await _c.size(path);
    yield* _c.download(path, offset: offset, onProgress: (n) => onProgress?.call(n, total));
  }

  @override
  Future<void> upload(String path, Stream<List<int>> data, int size, {Progress? onProgress}) =>
      _c.upload(path, data, onProgress: (n) => onProgress?.call(n, size));
  @override
  Future<void> mkdir(String path) => _c.mkdir(path);
  @override
  Future<void> rename(String from, String to) => _c.rename(from, to);
  @override
  Future<void> delete(String path, {bool isDir = false}) => isDir ? _c.rmdir(path) : _c.delete(path);
}

class SftpFs extends RemoteFs {
  SftpFs(this.site, {this.onHostKey});
  final FtpSite site;
  final void Function(String fp)? onHostKey;
  SSHClient? _ssh;
  SftpClient? _sftp;
  String _cwd = '/';

  @override
  Future<void> connect() async {
    final sock = await SSHSocket.connect(site.host, site.port, timeout: const Duration(seconds: 15));
    final client = SSHClient(sock, username: site.username,
        onPasswordRequest: () => site.password,
        identities: site.usesKey && site.privateKey.isNotEmpty ? SSHKeyPair.fromPem(site.privateKey, site.passphrase.isEmpty ? null : site.passphrase) : null,
        onVerifyHostKey: (type, key) {
          final fp = base64.encode(c.sha256.convert(key).bytes);
          if (site.hostKey != null && site.hostKey!.isNotEmpty) return site.hostKey == fp;
          onHostKey?.call(fp);
          return true;
        });
    _ssh = client;
    await client.authenticated.timeout(const Duration(seconds: 20));
    _sftp = await client.sftp();
    _cwd = await _sftp!.absolute('.');
  }

  @override
  Future<void> close() async {
    _sftp?.close();
    _ssh?.close();
    _sftp = null;
    _ssh = null;
  }

  SftpClient get _s => _sftp ?? (throw FtpException('Bağlı değil'));

  @override
  Future<String> pwd() async => _cwd;
  @override
  Future<void> cd(String path) async {
    final abs = await _s.absolute(path);
    final st = await _s.stat(abs);
    if (!st.isDirectory) throw FtpException('Klasör değil: $path');
    _cwd = abs;
  }

  @override
  Future<List<RemoteEntry>> list(String path) async {
    final names = await _s.listdir(path);
    return [
      for (final n in names)
        if (n.filename != '.' && n.filename != '..')
          RemoteEntry(name: n.filename, isDir: n.attr.isDirectory, isLink: n.attr.isSymbolicLink, size: n.attr.size ?? 0,
              modified: n.attr.modifyTime == null ? null : DateTime.fromMillisecondsSinceEpoch(n.attr.modifyTime! * 1000, isUtc: true).toLocal(),
              perms: n.attr.mode?.value.toRadixString(8)),
    ];
  }

  @override
  Future<bool> exists(String path) async {
    try {
      await _s.stat(path);
      return true;
    } on SftpStatusError {
      return false;
    }
  }

  @override
  Future<int?> size(String path) async => (await _s.stat(path)).size;

  @override
  Stream<List<int>> download(String path, {int offset = 0, Progress? onProgress}) async* {
    final f = await _s.open(path);
    try {
      final total = (await f.stat()).size;
      yield* f.read(offset: offset, onProgress: (n) => onProgress?.call(offset + n, total));
    } finally {
      await f.close();
    }
  }

  @override
  Future<void> upload(String path, Stream<List<int>> data, int size, {Progress? onProgress}) async {
    final f = await _s.open(path, mode: SftpFileOpenMode.create | SftpFileOpenMode.write | SftpFileOpenMode.truncate);
    try {
      await f.write(data.map((x) => x is Uint8List ? x : Uint8List.fromList(x)), onProgress: (n) => onProgress?.call(n, size));
    } finally {
      await f.close();
    }
  }

  @override
  Future<void> mkdir(String path) => _s.mkdir(path);
  @override
  Future<void> rename(String from, String to) => _s.rename(from, to);
  @override
  Future<void> delete(String path, {bool isDir = false}) => isDir ? _s.rmdir(path) : _s.remove(path);
}

/// Hata → kullanıcı metni (FTP Masters main.err*)
String remoteErrorText(MtStrings s, Object e) {
  final t = e.toString();
  if (e is SSHAuthFailError || e is SSHAuthAbortError) return s.fmMainErrAuth;
  if (e is FtpException) {
    if (e.code == 530 || e.code == 430) return s.fmMainErrAuth;
    if (e.code == 550) return t.contains('ermission') || t.contains('enied') ? s.fmMainErrPerm : s.fmMainErr550(e.message);
    if (e.code == 553) return s.fmMainErr553;
    if (t.contains('TLS') || t.contains('Handshake') || t.contains('CERTIFICATE')) return s.fmMainErrTls(e.message);
  }
  if (e is SftpStatusError) {
    if (e.code == 2) return s.fmMainErrNotFound;
    if (e.code == 3) return s.fmMainErrPerm;
  }
  if (t.contains('refused')) return s.fmMainErrRefused;
  if (t.contains('Timeout') || t.contains('timed out') || t.contains('zaman aşımı')) return s.fmMainErrTimeout;
  if (t.contains('Failed host lookup') || t.contains('lookup')) return s.fmMainErrDns;
  if (t.contains('unreachable') || t.contains('Network is')) return s.fmMainErrUnreach;
  if (t.contains('reset') || t.contains('closed') || t.contains('kapandı')) return s.fmMainErrReset;
  if (t.contains('CERTIFICATE') || t.contains('Handshake')) return s.fmMainErrTls(t);
  return t;
}
