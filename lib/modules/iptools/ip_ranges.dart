// IP aralığı ayrıştırma ve özel-adres denetimi (yalnız IPv4) — masaüstü iptools/src/ranges.js'in birebir Dart'ı.
//
// Kabul edilen yazımlar (virgülle, noktalı virgülle, boşlukla ya da satır sonuyla ayrılır):
//   192.168.1.10                 tek adres
//   192.168.1.1-192.168.1.255    başlangıç-bitiş
//   192.168.1.1-255              kısa yazım: yalnız son sekizli
//   192.168.1.0/24               CIDR; /30 ve daha genişte ağ ve yayın adresleri atlanır
//
// Tasarım sınırı: yalnız özel/yerel adresler taranır — RFC 1918 (10/8, 172.16/12, 192.168/16) ve bağlantı-yerel
// (169.254/16). Başka bir adres içeren kayıt kaydedilmez; "not_private" hatasıyla reddedilir. Toplam en çok
// kMaxAddresses (65.536 = bir /16) adres; üstü "too_many".

const kMaxAddresses = 65536;

int? ipToInt(String s) {
  final m = RegExp(r'^(\d{1,3})\.(\d{1,3})\.(\d{1,3})\.(\d{1,3})$').firstMatch(s.trim());
  if (m == null) return null;
  final p = [for (var i = 1; i <= 4; i++) int.parse(m.group(i)!)];
  if (p.any((x) => x > 255)) return null;
  return (p[0] << 24) + (p[1] << 16) + (p[2] << 8) + p[3];
}

String intToIp(int n) => '${(n >> 24) & 255}.${(n >> 16) & 255}.${(n >> 8) & 255}.${n & 255}';

class IpRange {
  const IpRange(this.start, this.end);
  final int start, end;
  int get count => end - start + 1;
  @override
  bool operator ==(Object other) => other is IpRange && other.start == start && other.end == end;
  @override
  int get hashCode => Object.hash(start, end);
  @override
  String toString() => start == end ? intToIp(start) : '${intToIp(start)}-${intToIp(end)}';
}

/// Hata kodları: empty, invalid, ipv6, reversed, too_many, not_private
class IpRangeError {
  const IpRangeError(this.code, [this.token = '']);
  final String code, token;
}

class RangeResult {
  const RangeResult({required this.ok, required this.ranges, required this.count, this.error});
  final bool ok;
  final List<IpRange> ranges;
  final int count;
  final IpRangeError? error;
}

class _Block {
  _Block(String ip, int bits)
      : mask = (0xffffffff << (32 - bits)) & 0xffffffff,
        net = ipToInt(ip)! {
    last = (net | (~mask & 0xffffffff)) & 0xffffffff;
  }
  final int mask, net;
  late final int last;
}

/// Taranabilir (özel/yerel) adres blokları — tasarım gereği yalnız bunlar
final _private = [_Block('10.0.0.0', 8), _Block('172.16.0.0', 12), _Block('192.168.0.0', 16), _Block('169.254.0.0', 16)];

bool isPrivate(int n) => _private.any((b) => (n & b.mask) == b.net);

/// Aralığın tamamı tek bir özel blok içinde mi?
bool rangeIsPrivate(IpRange r) {
  for (final b in _private) {
    if ((r.start & b.mask) == b.net) return r.end <= b.last;
  }
  return false;
}

// Tek parça → IpRange ya da IpRangeError
Object _parseToken(String tok) {
  if (tok.contains(':')) return IpRangeError('ipv6', tok);
  var m = RegExp(r'^([\d.]+)/(\d{1,2})$').firstMatch(tok);
  if (m != null) {
    final base = ipToInt(m.group(1)!);
    final bits = int.parse(m.group(2)!);
    if (base == null || bits > 32) return IpRangeError('invalid', tok);
    if (bits < 16) return IpRangeError('too_many', tok);
    final size = 1 << (32 - bits);
    final net = base & ((0xffffffff << (32 - bits)) & 0xffffffff);
    var start = net, end = net + size - 1;
    if (bits <= 30) { start += 1; end -= 1; } // ağ ve yayın adresi taranmaz
    return IpRange(start, end);
  }
  m = RegExp(r'^([\d.]+)\s*-\s*([\d.]+)$').firstMatch(tok);
  if (m != null) {
    final start = ipToInt(m.group(1)!);
    int? end;
    if (RegExp(r'^\d{1,3}$').hasMatch(m.group(2)!)) {
      final last = int.parse(m.group(2)!);
      if (start != null && last <= 255) end = (start & 0xffffff00) + last;
    } else {
      end = ipToInt(m.group(2)!);
    }
    if (start == null || end == null) return IpRangeError('invalid', tok);
    if (start > end) return IpRangeError('reversed', tok);
    return IpRange(start, end);
  }
  final one = ipToInt(tok);
  if (one == null) return IpRangeError('invalid', tok);
  return IpRange(one, one);
}

/// Örtüşen ve bitişik aralıkları birleştirir
List<IpRange> mergeRanges(List<IpRange> list) {
  final s = [...list]..sort((a, b) => a.start.compareTo(b.start));
  final out = <IpRange>[];
  for (final r in s) {
    if (out.isNotEmpty && r.start <= out.last.end + 1) {
      final last = out.removeLast();
      out.add(IpRange(last.start, r.end > last.end ? r.end : last.end));
    } else {
      out.add(r);
    }
  }
  return out;
}

/// Metni ayrıştırır → RangeResult (ok, ranges, count, error)
RangeResult parseRanges(String? text) {
  final raw = (text ?? '').split(RegExp(r'[,;\s]+')).map((x) => x.trim()).where((x) => x.isNotEmpty);
  // "192.168.1.1 - 192.168.1.9" gibi boşluklu tireyi birleştir
  final tokens = <String>[];
  for (final tok in raw) {
    final prev = tokens.isEmpty ? null : tokens.last;
    if (tok == '-' || (prev != null && prev.endsWith('-')) || (prev != null && tok.startsWith('-'))) {
      tokens[tokens.length - 1] = (prev ?? '') + tok;
    } else {
      tokens.add(tok);
    }
  }
  if (tokens.isEmpty) return const RangeResult(ok: false, ranges: [], count: 0, error: IpRangeError('empty'));
  final parsed = <IpRange>[];
  for (final tok in tokens) {
    final r = _parseToken(tok);
    if (r is IpRangeError) return RangeResult(ok: false, ranges: const [], count: 0, error: r);
    r as IpRange;
    if (!rangeIsPrivate(r)) return RangeResult(ok: false, ranges: const [], count: 0, error: IpRangeError('not_private', tok));
    parsed.add(r);
  }
  final ranges = mergeRanges(parsed);
  final count = ranges.fold(0, (n, r) => n + r.count);
  if (count > kMaxAddresses) return RangeResult(ok: false, ranges: ranges, count: count, error: IpRangeError('too_many', count.toString()));
  return RangeResult(ok: true, ranges: ranges, count: count);
}

/// Aralıklardaki adresler sırayla
Iterable<String> addresses(List<IpRange> ranges) sync* {
  for (final r in ranges) {
    for (var n = r.start; n <= r.end; n++) {
      yield intToIp(n);
    }
  }
}

/// Aralıkları kısa metin olarak ("192.168.1.1-192.168.1.254")
String formatRanges(List<IpRange> ranges) => ranges.map((r) => r.toString()).join(', ');

/// Sıralama için sayısal anahtar
int ipKey(String ip) => ipToInt(ip) ?? -1;
