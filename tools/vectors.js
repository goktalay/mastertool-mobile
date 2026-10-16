// Masaüstü formülleriyle (sshmasters/src/account.js) test vektörleri üretir → test/crypto_vectors.json
const crypto = require('crypto');
const password = 'Gizli-Şifre-1234', salt = crypto.randomBytes(16), iter = 1000;
const master = crypto.pbkdf2Sync(password, salt, iter, 32, 'sha256');
const authHash = crypto.pbkdf2Sync(master, password, 1, 32, 'sha256').toString('base64');
const encKey = Buffer.from(crypto.hkdfSync('sha256', master, Buffer.alloc(0), Buffer.from('sshm-enc-v1'), 32));
const iv = crypto.randomBytes(12), c = crypto.createCipheriv('aes-256-gcm', encKey, iv);
const ct = Buffer.concat([c.update(JSON.stringify({ schema: 1, items: [{ id: 'a1', kind: 'conn', data: { host: 'örnek.local' } }] }), 'utf8'), c.final()]);
const blob = Buffer.concat([iv, ct, c.getAuthTag()]).toString('base64');
require('fs').writeFileSync('test/crypto_vectors.json', JSON.stringify({ password, salt: salt.toString('base64'), iter, master: master.toString('base64'), auth_hash: authHash, enc_key_sshm: encKey.toString('base64'), blob }, null, 1));
console.log('vektörler yazıldı');
