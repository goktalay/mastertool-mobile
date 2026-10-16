// IP Tools aralık ayrıştırma — masaüstü iptools ranges.js ile aynı davranış.
import 'package:flutter_test/flutter_test.dart';
import 'package:master_tool/modules/iptools/ip_ranges.dart';

void main() {
  test('tek adres, kısa yazım, uzun yazım, CIDR', () {
    expect(parseRanges('192.168.1.10').count, 1);
    final short = parseRanges('192.168.1.1-255');
    expect(short.ok, true);
    expect(short.ranges.single, const IpRange(0xC0A80101, 0xC0A801FF));
    final long = parseRanges('192.168.1.1-192.168.1.9');
    expect(long.count, 9);
    final cidr = parseRanges('192.168.1.0/24');
    expect(cidr.ok, true);
    expect(cidr.count, 254); // ağ ve yayın adresi atlanır
    expect(formatRanges(cidr.ranges), '192.168.1.1-192.168.1.254');
    expect(parseRanges('10.0.0.0/31').count, 2); // /31: atlanmaz
    expect(parseRanges('10.0.0.5/32').count, 1);
  });

  test('ayraçlar ve boşluklu tire birleştirme, örtüşen aralıklar', () {
    final r = parseRanges('192.168.1.1 - 192.168.1.9, 192.168.1.5-192.168.1.20;192.168.1.21\n10.0.0.1');
    expect(r.ok, true);
    expect(r.ranges.length, 2);
    expect(r.count, 22);
    expect(formatRanges(r.ranges), '10.0.0.1, 192.168.1.1-192.168.1.21');
  });

  test('hata kodları', () {
    expect(parseRanges('').error!.code, 'empty');
    expect(parseRanges('   ').error!.code, 'empty');
    expect(parseRanges('abc').error!.code, 'invalid');
    expect(parseRanges('192.168.1.300').error!.code, 'invalid');
    expect(parseRanges('fe80::1').error!.code, 'ipv6');
    expect(parseRanges('192.168.1.9-192.168.1.1').error!.code, 'reversed');
    expect(parseRanges('10.0.0.0/8').error!.code, 'too_many');
    final big = parseRanges('10.0.0.0/16, 10.1.0.0/16');
    expect(big.error!.code, 'too_many');
    expect(big.error!.token, '131068');
    expect(parseRanges('8.8.8.0/24').error!.code, 'not_private');
    expect(parseRanges('8.8.8.0/24').error!.token, '8.8.8.0/24');
    expect(parseRanges('127.0.0.1').error!.code, 'not_private');
    expect(parseRanges('172.32.0.1').error!.code, 'not_private');
    expect(parseRanges('192.168.1.0/24, 8.8.8.0/24').error!.token, '8.8.8.0/24');
  });

  test('özel bloklar: 10/8, 172.16/12, 192.168/16, 169.254/16', () {
    expect(parseRanges('10.255.255.254').ok, true);
    expect(parseRanges('172.16.0.1-172.31.255.254').error!.code, 'too_many');
    expect(parseRanges('172.31.255.254').ok, true);
    expect(parseRanges('169.254.10.0/24').ok, true);
    expect(parseRanges('192.168.0.0/16').count, 65534);
    expect(isPrivate(ipToInt('172.15.255.255')!), false);
    expect(isPrivate(ipToInt('172.16.0.0')!), true);
    expect(rangeIsPrivate(const IpRange(0x0A000001, 0x0B000000)), false); // 10/8 dışına taşar
  });

  test('yardımcılar', () {
    expect(ipToInt('1.2.3.4'), 0x01020304);
    expect(intToIp(0xC0A80001), '192.168.0.1');
    expect(ipToInt('1.2.3'), null);
    expect(addresses(parseRanges('192.168.1.253-255').ranges).toList(), ['192.168.1.253', '192.168.1.254', '192.168.1.255']);
    expect(ipKey('192.168.1.2') > ipKey('192.168.1.1'), true);
    expect(ipKey('x'), -1);
    expect(mergeRanges([const IpRange(5, 6), const IpRange(1, 3), const IpRange(4, 4)]), [const IpRange(1, 6)]);
  });
}
