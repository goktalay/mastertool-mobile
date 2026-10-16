// Kripto uyumluluk testi: masaüstü (Node crypto) ile aynı girdiden aynı authHash/encKey çıkmalı.
// Beklenen değerler Node ile üretildi (test/crypto_vectors.json; tools/vectors.js).
import 'dart:convert';
import 'dart:io';
import 'dart:typed_data';

import 'package:flutter_test/flutter_test.dart';
import 'package:master_tool/core/crypto.dart';

void main() {
  final v = jsonDecode(File('test/crypto_vectors.json').readAsStringSync()) as Map<String, dynamic>;

  test('PBKDF2 master ve authHash masaüstüyle aynı', () async {
    final k = await deriveKeys(v['password'] as String, Kdf(alg: 'PBKDF2-SHA256', iter: v['iter'] as int, salt: v['salt'] as String));
    expect(base64.encode(k.master), v['master']);
    expect(k.authHash, v['auth_hash']);
  });

  test('HKDF encKey (sshm-enc-v1) masaüstüyle aynı', () async {
    final master = base64.decode(v['master'] as String);
    final key = await encKeyFromMaster(Uint8List.fromList(master), 'sshm');
    expect(base64.encode(key), v['enc_key_sshm']);
  });

  test('masaüstünün şifrelediği kitaplık blob\'u çözülür; kendi şifrelediğimiz de', () async {
    final key = Uint8List.fromList(base64.decode(v['enc_key_sshm'] as String));
    final pt = await decryptLibrary(key, v['blob'] as String);
    expect(pt['schema'], 1);
    expect((pt['items'] as List).length, 1);
    final mine = await encryptLibrary(key, {'schema': 1, 'items': []});
    expect((await decryptLibrary(key, mine))['items'], isEmpty);
    expect(() => decryptLibrary(key, base64.encode(List.filled(40, 7))), throwsA(isA<DecryptFailed>()));
  });
}
