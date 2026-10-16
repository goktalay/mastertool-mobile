// Mastertool hesap kriptografisi — masaüstü uygulamalarla (src/account.js) birebir aynı formüller:
//   master   = PBKDF2-SHA256(şifre, salt, iter, 32 B)          (salt ve iter sunucudan: prelogin → kdf)
//   authHash = base64(PBKDF2-SHA256(master, şifre, 1, 32 B))   → girişte sunucuya giden TEK değer (şifre gitmez)
//   encKey   = HKDF-SHA256(master, salt boş, info "<önek>-enc-v1", 32 B) → modül kitaplığı senkronu AES-256-GCM
// Senkron blob'u: base64(iv12 ‖ şifreli metin ‖ tag16); açık metin {schema:1, items:[…]}.
import 'dart:convert';
import 'dart:typed_data';

import 'package:cryptography/cryptography.dart';

class Kdf {
  const Kdf({required this.alg, required this.iter, required this.salt});
  final String alg; // "PBKDF2-SHA256"
  final int iter;
  final String salt; // base64

  factory Kdf.fromJson(Map<String, dynamic> j) =>
      Kdf(alg: (j['alg'] ?? 'PBKDF2-SHA256').toString(), iter: (j['iter'] as num).toInt(), salt: j['salt'].toString());
  Map<String, dynamic> toJson() => {'alg': alg, 'iter': iter, 'salt': salt};
}

class DerivedKeys {
  DerivedKeys({required this.authHash, required this.master});
  final String authHash; // base64
  final Uint8List master; // 32 bayt — yalnız güvenli depoda durur, asla sunucuya/günlüğe gitmez
}

Future<Uint8List> pbkdf2(List<int> password, List<int> salt, int iterations) async {
  final algo = Pbkdf2(macAlgorithm: Hmac.sha256(), iterations: iterations, bits: 256);
  final key = await algo.deriveKey(secretKey: SecretKey(password), nonce: salt);
  return Uint8List.fromList(await key.extractBytes());
}

Future<DerivedKeys> deriveKeys(String password, Kdf kdf) async {
  final pw = utf8.encode(password);
  final master = await pbkdf2(pw, base64.decode(kdf.salt), kdf.iter);
  final auth = await pbkdf2(master, pw, 1);
  return DerivedKeys(authHash: base64.encode(auth), master: master);
}

/// encKey = HKDF-SHA256(master, salt = boş, info = "<önek>-enc-v1"). Önekler: sshm, ftpm, sqlm, npm, cvm, ipt.
Future<Uint8List> encKeyFromMaster(Uint8List master, String infoPrefix) async {
  final hkdf = Hkdf(hmac: Hmac.sha256(), outputLength: 32);
  final key = await hkdf.deriveKey(secretKey: SecretKey(master), nonce: const [], info: utf8.encode('$infoPrefix-enc-v1'));
  return Uint8List.fromList(await key.extractBytes());
}

class DecryptFailed implements Exception {
  @override
  String toString() => 'decrypt_failed';
}

Future<String> encryptLibrary(Uint8List key, Object obj) async {
  final aes = AesGcm.with256bits();
  final nonce = aes.newNonce();
  final box = await aes.encrypt(utf8.encode(jsonEncode(obj)), secretKey: SecretKey(key), nonce: nonce);
  return base64.encode([...nonce, ...box.cipherText, ...box.mac.bytes]);
}

Future<Map<String, dynamic>> decryptLibrary(Uint8List key, String blob) async {
  final buf = base64.decode(blob);
  if (buf.length < 29) throw DecryptFailed();
  try {
    final aes = AesGcm.with256bits();
    final box = SecretBox(buf.sublist(12, buf.length - 16), nonce: buf.sublist(0, 12), mac: Mac(buf.sublist(buf.length - 16)));
    final pt = await aes.decrypt(box, secretKey: SecretKey(key));
    return jsonDecode(utf8.decode(pt)) as Map<String, dynamic>;
  } on DecryptFailed {
    rethrow;
  } catch (_) {
    throw DecryptFailed();
  }
}

void wipe(Uint8List b) => b.fillRange(0, b.length, 0);
