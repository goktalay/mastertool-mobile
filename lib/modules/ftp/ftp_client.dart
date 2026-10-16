// Hafif FTP / FTPS istemcisi (dart:io) — FTP Masters masaüstünün basic-ftp davranışı: pasif kip (EPSV → PASV), ikili aktarım,
// FTPS implicit (990, baştan TLS), FTPES (AUTH TLS → reddedilirse AUTH SSL), PBSZ 0 + PROT P ile VERİ KANALI DA TLS,
// sertifika doğrulaması (parmak izi kaydı; değişirse red), OPTS UTF8 ON, MLSD (yoksa LIST unix/DOS ayrıştırma), SIZE/MDTM,
// REST ile kaldığı yerden indirme, STOR/APPE yükleme, MKD/RMD/DELE/RNFR-RNTO/CWD/PWD.
import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:crypto/crypto.dart' as c;

import 'ftp_model.dart';

class FtpException implements Exception {
  FtpException(this.message, {this.code = 0});
  final String message;
  final int code;
  @override
  String toString() => code > 0 ? '$code $message' : message;
}

class FtpReply {
  FtpReply(this.code, this.text);
  final int code;
  final String text;
  bool get ok => code >= 200 && code < 300;
  bool get intermediate => code >= 300 && code < 400;
}

class FtpClient {
  FtpClient({required this.host, required this.port, required this.user, required this.password, required this.protocol,
      this.timeout = const Duration(seconds: 20), this.encoding = 'auto', this.knownCertFp, this.onCertFp, this.log});
  final String host, user, password, protocol, encoding;
  final int port;
  final Duration timeout;
  final String? knownCertFp;
  final void Function(String fp)? onCertFp;
  final void Function(String line)? log;

  Socket? _ctl;
  late StreamQueue _lines;
  bool _utf8 = true;
  bool _secureData = false;
  bool _mlsd = true;
  String _cwd = '/';
  SecurityContext? _ctx;

  bool get connected => _ctl != null;
  String get cwd => _cwd;

  Encoding get _enc => (_utf8 && encoding != 'ascii') ? utf8 : latin1;

  Future<void> connect() async {
    final implicit = protocol == 'ftps-implicit';
    Socket sock;
    if (implicit) {
      sock = await SecureSocket.connect(host, port, timeout: timeout, onBadCertificate: _checkCert, context: _ctx);
    } else {
      sock = await Socket.connect(host, port, timeout: timeout);
    }
    _attach(sock);
    final greet = await _read();
    if (!greet.ok) throw FtpException(greet.text, code: greet.code);
    if (protocol == 'ftps-tls' || protocol == 'ftps-ssl') {
      var r = await cmd(protocol == 'ftps-ssl' ? 'AUTH SSL' : 'AUTH TLS');
      if (!r.ok) r = await cmd(protocol == 'ftps-ssl' ? 'AUTH TLS' : 'AUTH SSL');
      if (!r.ok) throw FtpException('TLS reddedildi: ${r.text}', code: r.code);
      final sec = await SecureSocket.secure(sock, host: host, onBadCertificate: _checkCert, context: _ctx);
      _attach(sec);
    }
    await _login();
    if (protocol != 'ftp') {
      await cmd('PBSZ 0');
      final p = await cmd('PROT P');
      _secureData = p.ok;
      if (!p.ok) throw FtpException('Veri kanalı TLS reddedildi: ${p.text}', code: p.code);
    }
    final f = await cmd('FEAT');
    final feat = f.text.toUpperCase();
    _mlsd = feat.contains('MLSD') || feat.contains('MLST');   // MLST ilan eden sunucu MLSD'yi de destekler
    if (feat.contains('UTF8') && encoding != 'ascii') {
      await cmd('OPTS UTF8 ON');
      _utf8 = true;
    } else {
      _utf8 = encoding == 'utf8';
    }
    await cmd('TYPE I');
    final pwd = await cmd('PWD');
    _cwd = _parsePwd(pwd.text);
  }

  bool _checkCert(X509Certificate cert) {
    final fp = base64.encode(c.sha256.convert(cert.der).bytes);
    if (knownCertFp != null && knownCertFp!.isNotEmpty) return knownCertFp == fp;
    onCertFp?.call(fp); // ilk bağlantıda kaydedilir (TOFU: ilk güven, sonra değişirse red)
    return true;
  }

  Future<void> _login() async {
    var r = await cmd('USER $user');
    if (r.intermediate) r = await cmd('PASS $password');
    if (r.code == 332) throw FtpException('Hesap (ACCT) gerekli', code: 332);
    if (!r.ok) throw FtpException(r.text, code: r.code);
  }

  void _attach(Socket sock) {
    if (_ctl != null && _ctl != sock) unawaited(_lines.cancel());   // TLS'e geçişte eski düz soket dinleyicisi bırakılır
    _ctl = sock;
    _lines = StreamQueue(sock.cast<List<int>>().transform(latin1.decoder).transform(const LineSplitter()));
  }

  Future<FtpReply> _read() async {
    final first = await _lines.next.timeout(timeout, onTimeout: () => throw FtpException('Yanıt zaman aşımı'));
    log?.call('< $first');
    final code = int.tryParse(first.length >= 3 ? first.substring(0, 3) : '') ?? 0;
    final buf = StringBuffer(_dec(first.length > 4 ? first.substring(4) : ''));
    if (first.length > 3 && first[3] == '-') {
      while (true) {
        final l = await _lines.next.timeout(timeout, onTimeout: () => throw FtpException('Yanıt zaman aşımı'));
        log?.call('< $l');
        buf.write('\n${_dec(l)}');
        if (l.length >= 4 && l.substring(0, 3) == '$code' && l[3] == ' ') break;
      }
    }
    return FtpReply(code, buf.toString().trim());
  }

  String _dec(String latin) => _enc == utf8 ? utf8.decode(latin1.encode(latin), allowMalformed: true) : latin;

  Future<FtpReply> cmd(String line) async {
    final s = _ctl;
    if (s == null) throw FtpException('Bağlı değil');
    log?.call('> ${line.startsWith('PASS') ? 'PASS ****' : line}');
    s.add(_enc.encode('$line\r\n'));
    await s.flush();
    return _read();
  }

  Future<FtpReply> _must(String line, {List<int> ok = const []}) async {
    final r = await cmd(line);
    if (!r.ok && !ok.contains(r.code)) throw FtpException(r.text, code: r.code);
    return r;
  }

  /// Pasif veri bağlantısı (EPSV, olmazsa PASV; PASV yanıtındaki IP yok sayılır, kontrol bağlantısının adresi kullanılır).
  Future<Socket> _data(String command, {int rest = 0}) async {
    int port;
    var r = await cmd('EPSV');
    if (r.ok && r.text.contains('(|||')) {
      port = int.parse(RegExp(r'\(\|\|\|(\d+)\|\)').firstMatch(r.text)!.group(1)!);
    } else {
      r = await _must('PASV');
      final m = RegExp(r'(\d+),(\d+),(\d+),(\d+),(\d+),(\d+)').firstMatch(r.text);
      if (m == null) throw FtpException('PASV yanıtı anlaşılamadı: ${r.text}');
      port = int.parse(m.group(5)!) * 256 + int.parse(m.group(6)!);
    }
    var sock = await Socket.connect(host, port, timeout: timeout);
    if (rest > 0) await _must('REST $rest', ok: [350]);
    final start = await cmd(command);
    if (!(start.code == 150 || start.code == 125)) {
      sock.destroy();
      throw FtpException(start.text, code: start.code);
    }
    if (_secureData) sock = await SecureSocket.secure(sock, host: host, onBadCertificate: (_) => true, context: _ctx);
    return sock;
  }

  Future<List<int>> _dataAll(String command) async {
    final sock = await _data(command);
    final out = <int>[];
    try {
      await for (final chunk in sock) {
        out.addAll(chunk);
      }
    } finally {
      sock.destroy();
    }
    final r = await _read(); // 226
    if (!r.ok) throw FtpException(r.text, code: r.code);
    return out;
  }

  // ---- dizin işlemleri
  Future<String> pwd() async => _cwd = _parsePwd((await _must('PWD')).text);
  static String _parsePwd(String t) => RegExp(r'"((?:[^"]|"")*)"').firstMatch(t)?.group(1)?.replaceAll('""', '"') ?? '/';

  Future<void> cd(String path) async {
    await _must('CWD $path');
    await pwd();
  }

  Future<List<RemoteEntry>> list([String? path]) async {
    final p = path ?? _cwd;
    if (_mlsd) {
      try {
        final raw = _enc.decode(await _dataAll('MLSD $p'));
        return _parseMlsd(raw);
      } on FtpException catch (e) {
        if (e.code != 500 && e.code != 502 && e.code != 550) rethrow;
        _mlsd = false;
      }
    }
    List<int> data;
    try {
      data = await _dataAll('LIST -a $p');   // gizli dosyalar; desteklemeyen sunucuda düz LIST
    } on FtpException catch (e) {
      if (e.code != 550 && e.code != 501 && e.code != 500) rethrow;
      data = await _dataAll('LIST $p');
    }
    return _parseList(_enc.decode(data));
  }

  List<RemoteEntry> _parseMlsd(String raw) {
    final out = <RemoteEntry>[];
    for (final line in const LineSplitter().convert(raw)) {
      final i = line.indexOf(' ');
      if (i < 0) continue;
      final name = line.substring(i + 1);
      if (name == '.' || name == '..') continue;
      final facts = <String, String>{};
      for (final f in line.substring(0, i).split(';')) {
        final k = f.indexOf('=');
        if (k > 0) facts[f.substring(0, k).toLowerCase()] = f.substring(k + 1);
      }
      final type = (facts['type'] ?? 'file').toLowerCase();
      if (type == 'cdir' || type == 'pdir') continue;
      final mod = facts['modify'];
      DateTime? dt;
      if (mod != null && mod.length >= 14) {
        dt = DateTime.utc(int.parse(mod.substring(0, 4)), int.parse(mod.substring(4, 6)), int.parse(mod.substring(6, 8)), int.parse(mod.substring(8, 10)), int.parse(mod.substring(10, 12)), int.parse(mod.substring(12, 14)));
      }
      out.add(RemoteEntry(name: name, isDir: type == 'dir', isLink: type.startsWith('os.unix=symlink'), size: int.tryParse(facts['size'] ?? facts['sizd'] ?? '') ?? 0,
          modified: dt, perms: facts['unix.mode'] ?? facts['perm']));
    }
    return out;
  }

  static final _unix = RegExp(r'^([\-dlcbps])([rwxsStT\-]{9})\s+\d+\s+(\S+)\s+(\S+)\s+(\d+)\s+(\w{3})\s+(\d{1,2})\s+(\d{4}|\d{1,2}:\d{2})\s+(.+)$');
  static final _dos = RegExp(r'^(\d{2})-(\d{2})-(\d{2,4})\s+(\d{2}):(\d{2})(AM|PM)?\s+(<DIR>|\d+)\s+(.+)$');
  static const _months = ['jan', 'feb', 'mar', 'apr', 'may', 'jun', 'jul', 'aug', 'sep', 'oct', 'nov', 'dec'];

  List<RemoteEntry> _parseList(String raw) {
    final out = <RemoteEntry>[];
    final now = DateTime.now();
    for (final line in const LineSplitter().convert(raw)) {
      final u = _unix.firstMatch(line.trim());
      if (u != null) {
        var name = u.group(9)!;
        final isLink = u.group(1) == 'l';
        if (isLink && name.contains(' -> ')) name = name.split(' -> ').first;
        if (name == '.' || name == '..') continue;
        final mon = _months.indexOf(u.group(6)!.toLowerCase()) + 1;
        final day = int.parse(u.group(7)!);
        final yt = u.group(8)!;
        DateTime dt;
        if (yt.contains(':')) {
          final hm = yt.split(':');
          dt = DateTime(now.year, mon, day, int.parse(hm[0]), int.parse(hm[1]));
          if (dt.isAfter(now.add(const Duration(days: 1)))) dt = DateTime(now.year - 1, mon, day, int.parse(hm[0]), int.parse(hm[1]));
        } else {
          dt = DateTime(int.parse(yt), mon, day);
        }
        out.add(RemoteEntry(name: name, isDir: u.group(1) == 'd', isLink: isLink, size: int.parse(u.group(5)!), modified: dt, perms: u.group(2)));
        continue;
      }
      final d = _dos.firstMatch(line.trim());
      if (d != null) {
        var y = int.parse(d.group(3)!);
        if (y < 100) y += y < 70 ? 2000 : 1900;
        var h = int.parse(d.group(4)!);
        if (d.group(6) == 'PM' && h < 12) h += 12;
        if (d.group(6) == 'AM' && h == 12) h = 0;
        out.add(RemoteEntry(name: d.group(8)!, isDir: d.group(7) == '<DIR>', size: int.tryParse(d.group(7)!) ?? 0,
            modified: DateTime(y, int.parse(d.group(1)!), int.parse(d.group(2)!), h, int.parse(d.group(5)!))));
      }
    }
    return out;
  }

  Future<int?> size(String path) async {
    final r = await cmd('SIZE $path');
    return r.ok ? int.tryParse(r.text.trim()) : null;
  }

  Future<bool> exists(String path) async {
    if ((await cmd('SIZE $path')).ok) return true;
    final cur = _cwd;
    final r = await cmd('CWD $path');
    if (r.ok) {
      await cmd('CWD $cur');
      return true;
    }
    return false;
  }

  Future<void> mkdir(String path) => _must('MKD $path');
  Future<void> rmdir(String path) => _must('RMD $path');
  Future<void> delete(String path) => _must('DELE $path');
  Future<void> rename(String from, String to) async {
    await _must('RNFR $from', ok: [350]);
    await _must('RNTO $to');
  }

  /// İndirme akışı; [onProgress] toplam okunan baytı verir. Akış bitince 226 beklenir.
  Stream<List<int>> download(String path, {int offset = 0, void Function(int)? onProgress}) async* {
    final sock = await _data('RETR $path', rest: offset);
    var n = offset;
    try {
      await for (final chunk in sock) {
        n += chunk.length;
        onProgress?.call(n);
        yield chunk;
      }
    } finally {
      sock.destroy();
    }
    final r = await _read();
    if (!r.ok) throw FtpException(r.text, code: r.code);
  }

  Future<void> upload(String path, Stream<List<int>> data, {bool append = false, void Function(int)? onProgress}) async {
    final sock = await _data(append ? 'APPE $path' : 'STOR $path');
    final drain = sock.listen((_) {}, onError: (_) {}, cancelOnError: true);   // TLS'te karşı tarafın close_notify'ı işlensin
    var n = 0;
    try {
      await for (final chunk in data) {
        sock.add(chunk);
        n += chunk.length;
        onProgress?.call(n);
      }
      await sock.flush();
      await sock.close().timeout(const Duration(seconds: 5), onTimeout: () {});
    } finally {
      sock.destroy();   // TCP'yi kesin kapat: sunucu EOF görüp 226 gönderir
      await drain.cancel();
    }
    final r = await _read();
    if (!r.ok) throw FtpException(r.text, code: r.code);
  }

  Future<void> noop() async => cmd('NOOP');

  Future<void> close() async {
    final s = _ctl;
    _ctl = null;
    if (s == null) return;
    try {
      s.add(_enc.encode('QUIT\r\n'));
      await s.flush().timeout(const Duration(seconds: 3));
    } catch (_) {}
    s.destroy();
  }
}

/// Satır kuyruğu: kontrol kanalından satır satır okuma.
class StreamQueue {
  StreamQueue(Stream<String> s) {
    _sub = s.listen((l) {
      if (_waiting.isNotEmpty) {
        _waiting.removeAt(0).complete(l);
      } else {
        _buf.add(l);
      }
    }, onError: (e) => _fail(e), onDone: () => _fail(FtpException('Bağlantı kapandı')));
  }
  late final StreamSubscription<String> _sub;
  final _buf = <String>[];
  final _waiting = <Completer<String>>[];
  Object? _err;

  void _fail(Object e) {
    _err = e;
    for (final w in _waiting) {
      if (!w.isCompleted) w.completeError(e);
    }
    _waiting.clear();
  }

  Future<String> get next {
    if (_buf.isNotEmpty) return Future.value(_buf.removeAt(0));
    if (_err != null) return Future.error(_err!);
    final c = Completer<String>();
    _waiting.add(c);
    return c.future;
  }

  Future<void> cancel() => _sub.cancel();
}
