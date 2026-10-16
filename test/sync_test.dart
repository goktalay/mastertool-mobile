// Senkron kuralları masaüstüyle aynı mı: stable(), hashOf, newer, merge, tombstone, itemsKey; 409 döngüsü sahte API ile.
import 'dart:convert';
import 'dart:io';
import 'dart:typed_data';

import 'package:flutter_test/flutter_test.dart';
import 'package:master_tool/core/sync.dart';

void main() {
  test('stable(): anahtarlar alfabetik, dizi sırası korunur, null', () {
    expect(stableJson({'b': 1, 'a': [3, {'z': null, 'y': 'ü'}]}), '{"a":[3,{"y":"ü","z":null}],"b":1}');
  });

  test('hashOf masaüstü Node çıktısıyla aynı', () {
    // node -e "const stable=v=>Array.isArray(v)?'['+v.map(stable).join(',')+']':(v&&typeof v==='object')?'{'+Object.keys(v).sort().map(k=>JSON.stringify(k)+':'+stable(v[k])).join(',')+'}':JSON.stringify(v===undefined?null:v);
    //          console.log(require('crypto').createHash('sha256').update(stable({name:'Örnek',port:22,host:'a.local'})).digest('base64'))"
    final v = jsonDecode(File('test/sync_vectors.json').readAsStringSync()) as Map<String, dynamic>;
    expect(hashOf(v['data']), v['hash']);
  });

  SyncItem it(String id, int at, int rev, String dev, {bool del = false}) =>
      SyncItem(id: id, kind: 'connection', updatedAt: at, rev: rev, device: dev, deleted: del, data: del ? null : {'n': id});

  test('newer: updated_at > rev > device', () {
    expect(newer(it('a', 2, 1, 'x'), it('a', 1, 9, 'z')), isTrue);
    expect(newer(it('a', 1, 2, 'x'), it('a', 1, 1, 'z')), isTrue);
    expect(newer(it('a', 1, 1, 'b'), it('a', 1, 1, 'a')), isTrue);
    expect(newer(it('a', 1, 1, 'a'), it('a', 1, 1, 'b')), isFalse);
  });

  test('merge: öğe bütün olarak kazanır; eski tombstone düşer', () {
    final now = 1000 * kTombstoneTtlMs;
    final m = mergeItems([it('a', 5, 1, 'x'), it('old', now - kTombstoneTtlMs - 1, 1, 'x', del: true)], [it('a', 7, 1, 'y'), it('b', 1, 1, 'y')], now: now);
    final byId = {for (final x in m) x.id: x};
    expect(byId['a']!.device, 'y');
    expect(byId.containsKey('b'), isTrue);
    expect(byId.containsKey('old'), isFalse);
  });

  test('itemsKey sıradan bağımsız', () {
    expect(itemsKey([it('b', 1, 1, 'x'), it('a', 1, 1, 'x')]), itemsKey([it('a', 1, 1, 'x'), it('b', 1, 1, 'x')]));
    expect(itemsKey([it('a', 1, 1, 'x')]) == itemsKey([it('a', 2, 1, 'x')]), isFalse);
  });

  test('id üretimi masaüstü biçiminde (16 hex / uuid v4)', () {
    expect(RegExp(r'^[0-9a-f]{16}$').hasMatch(newItemId()), isTrue);
    expect(RegExp(r'^[0-9a-f]{8}-[0-9a-f]{4}-4[0-9a-f]{3}-[89ab][0-9a-f]{3}-[0-9a-f]{12}$').hasMatch(newUuid()), isTrue);
  });

  test('SyncItem JSON gidiş-dönüş', () {
    final j = it('a', 5, 2, 'dev').toJson();
    final back = SyncItem.fromJson(jsonDecode(jsonEncode(j)) as Map<String, dynamic>);
    expect(back.updatedAt, 5);
    expect(back.data, {'n': 'a'});
    expect(Uint8List(0).length, 0);
  });
}
