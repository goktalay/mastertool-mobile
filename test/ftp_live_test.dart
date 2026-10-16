// FTP istemcisi canlı testi — yerel pyftpdlib sunucuları (127.0.0.1: 2121 FTP, 2122 FTPES; kullanıcı test/gizli) çalışıyorsa.
// Sunucu yoksa test atlanır. Kurulum: /tmp/ftptest/srv.py (bkz. iş notları).
import 'dart:convert';
import 'dart:io';

import 'package:flutter_test/flutter_test.dart';
import 'package:master_tool/modules/ftp/ftp_client.dart';

Future<bool> _open(int port) async {
  try {
    final s = await Socket.connect('127.0.0.1', port, timeout: const Duration(seconds: 1));
    s.destroy();
    return true;
  } catch (_) {
    return false;
  }
}

Future<void> _exercise(String proto, int port) async {
  String? fp;
  final c = FtpClient(host: '127.0.0.1', port: port, user: 'test', password: 'gizli', protocol: proto, onCertFp: (f) => fp = f);
  await c.connect();
  expect(c.cwd, '/');
  if (proto != 'ftp') expect(fp, isNotNull);
  final dir = '/klasor-$proto';
  await c.mkdir(dir);
  final payload = utf8.encode('selam ' * 1000);
  await c.upload('$dir/yeni.txt', Stream.value(payload));
  expect(await c.size('$dir/yeni.txt'), payload.length);
  final bytes = <int>[];
  await for (final ch in c.download('$dir/yeni.txt')) {
    bytes.addAll(ch);
  }
  expect(bytes, payload);
  final part = <int>[];
  await for (final ch in c.download('$dir/yeni.txt', offset: payload.length - 10)) {
    part.addAll(ch);
  }
  expect(part.length, 10);
  final list = await c.list(dir);
  expect(list.single.name, 'yeni.txt');
  expect(list.single.size, payload.length);
  expect(list.single.modified, isNotNull);
  await c.rename('$dir/yeni.txt', '$dir/eski.txt');
  expect(await c.exists('$dir/eski.txt'), isTrue);
  expect(await c.exists('$dir/yeni.txt'), isFalse);
  await c.cd(dir);
  expect(c.cwd, dir);
  await c.delete('$dir/eski.txt');
  await c.cd('/');
  await c.rmdir(dir);
  expect((await c.list('/')).any((e) => e.name == 'klasor-$proto'), isFalse);
  await c.close();
}

void main() async {
  final ftp = await _open(2121), ftpes = await _open(2122);
  test('FTP düz: liste, mkdir, yükle, indir, REST, yeniden adlandır, sil', () => _exercise('ftp', 2121), skip: !ftp);
  test('FTPES (AUTH TLS + PROT P): aynı akış, veri kanalı TLS', () => _exercise('ftps-tls', 2122), skip: !ftpes);
  test('anonim giriş', () async {
    final a = FtpClient(host: '127.0.0.1', port: 2121, user: 'anonymous', password: 'guest@', protocol: 'ftp');
    await a.connect();
    expect((await a.list('/')).isNotEmpty, isTrue);
    await a.close();
  }, skip: !ftp);
  test('yanlış şifre → 530', () async {
    final c = FtpClient(host: '127.0.0.1', port: 2121, user: 'test', password: 'yanlis', protocol: 'ftp');
    await expectLater(c.connect(), throwsA(isA<FtpException>().having((e) => e.code, 'code', 530)));
  }, skip: !ftp);
  test('sertifika parmak izi değişmişse red', () async {
    final c = FtpClient(host: '127.0.0.1', port: 2122, user: 'test', password: 'gizli', protocol: 'ftps-tls', knownCertFp: 'AAAA');
    await expectLater(c.connect(), throwsA(anything));
  }, skip: !ftpes);
}
