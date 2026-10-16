// Metin kodlaması (notepadmaster/src/textcodec.js'in Dart karşılığı): dosya baytlarını editör metnine çevirir ve
// kaydederken geri kodlar (Notepad++ "Kodlama" menüsü).
//
//   npDecode(bytes, encoding: 'auto', fallback: 'windows-1254') → NpDecoded {text, encoding, bom, eol, binary}
//   npEncode(text, encoding: 'utf8', bom: false)                → Uint8List
//
// encoding 'auto': BOM varsa ona, yoksa geçerli UTF-8 ise UTF-8'e, değilse ANSI yedeğine (varsayılan Windows-1254) bakar.
// Saf Dart kod sayfası tabloları: Windows-1254, ISO-8859-9, Windows-1252, ISO-8859-1, Windows-1251 (Windows-1256 yok → UTF-8 sayılır).
import 'dart:convert';
import 'dart:typed_data';

const kNpCodecEncodings = ['utf8', 'utf16le', 'utf16be', 'windows-1254', 'windows-1252', 'iso-8859-9', 'iso-8859-1', 'windows-1251', 'windows-1256'];

class NpDecoded {
  NpDecoded({this.text = '', this.encoding = 'utf8', this.bom = false, this.eol, this.binary = false});
  final String text;
  final String encoding;
  final bool bom;
  final String? eol; // crlf | lf | cr | null
  final bool binary;
}

const _boms = <(String, List<int>)>[('utf8', [0xef, 0xbb, 0xbf]), ('utf16le', [0xff, 0xfe]), ('utf16be', [0xfe, 0xff])];

(String, List<int>)? npSniffBom(List<int> buf) {
  for (final b in _boms) {
    if (buf.length >= b.$2.length) {
      var ok = true;
      for (var i = 0; i < b.$2.length; i++) {
        if (buf[i] != b.$2[i]) { ok = false; break; }
      }
      if (ok) return b;
    }
  }
  return null;
}

/// Bozuk UTF-8 dizisi yoksa true (ASCII de geçerli UTF-8'dir)
bool npIsUtf8(List<int> buf) {
  var i = 0;
  final n = buf.length;
  while (i < n) {
    final c = buf[i];
    if (c < 0x80) { i++; continue; }
    int need;
    if (c >= 0xc2 && c <= 0xdf) {
      need = 1;
    } else if (c >= 0xe0 && c <= 0xef) {
      need = 2;
    } else if (c >= 0xf0 && c <= 0xf4) {
      need = 3;
    } else {
      return false;
    }
    if (i + need >= n) return true; // kesilmiş dosya: yine de UTF-8 say
    for (var k = 1; k <= need; k++) {
      if ((buf[i + k] & 0xc0) != 0x80) return false;
    }
    i += need + 1;
  }
  return true;
}

/// İlk 8 KB'ta NUL baytı varsa (ve UTF-16 BOM'u yoksa) ikili dosya say
bool npLooksBinary(List<int> buf) {
  final len = buf.length < 8192 ? buf.length : 8192;
  for (var i = 0; i < len; i++) {
    if (buf[i] == 0) return true;
  }
  return false;
}

/// Baskın satır sonu: crlf | lf | cr (hiç yoksa null)
String? npDetectEol(String text) {
  var crlf = 0, lf = 0, cr = 0;
  for (var i = 0; i < text.length; i++) {
    final c = text.codeUnitAt(i);
    if (c == 13) {
      if (i + 1 < text.length && text.codeUnitAt(i + 1) == 10) { crlf++; i++; } else { cr++; }
    } else if (c == 10) {
      lf++;
    }
  }
  if (crlf == 0 && lf == 0 && cr == 0) return null;
  if (crlf >= lf && crlf >= cr) return 'crlf';
  return lf >= cr ? 'lf' : 'cr';
}

String npNormalizeEncoding(String e) {
  if (e == 'utf8bom') return 'utf8';
  if (e == 'utf8' || e == 'utf16le' || e == 'utf16be') return e;
  return _tableFor(e) != null ? e : 'utf8'; // tablosu olmayan kod sayfası (ör. windows-1256) UTF-8 sayılır
}

/// Metni verilen satır sonuna çevirir
String npConvertEol(String text, String eol) {
  final lf = text.replaceAll('\r\n', '\n').replaceAll('\r', '\n');
  return switch (eol) { 'crlf' => lf.replaceAll('\n', '\r\n'), 'cr' => lf.replaceAll('\n', '\r'), _ => lf };
}

NpDecoded npDecode(List<int> buf, {String encoding = 'auto', String fallback = 'windows-1254'}) {
  final bom = npSniffBom(buf);
  if (bom == null && npLooksBinary(buf)) return NpDecoded(binary: true);
  String enc;
  var hasBom = false;
  List<int> body = buf;
  if (encoding == 'auto' || encoding.isEmpty) {
    if (bom != null) {
      enc = bom.$1;
      hasBom = true;
      body = buf.sublist(bom.$2.length);
    } else {
      enc = npIsUtf8(buf) ? 'utf8' : npNormalizeEncoding(fallback);
    }
  } else {
    enc = npNormalizeEncoding(encoding);
    if (bom != null && bom.$1 == enc) {
      hasBom = true;
      body = buf.sublist(bom.$2.length);
    } else if (encoding == 'utf8bom') {
      hasBom = true; // kaydederken BOM eklenir
    }
  }
  final text = _decodeBody(body, enc);
  return NpDecoded(text: text, encoding: enc, bom: hasBom, eol: npDetectEol(text));
}

Uint8List npEncode(String text, {String encoding = 'utf8', bool bom = false}) {
  final enc = npNormalizeEncoding(encoding);
  final body = _encodeBody(text, enc);
  if (!bom) return body;
  for (final b in _boms) {
    if (b.$1 == enc) return Uint8List.fromList([...b.$2, ...body]);
  }
  return body;
}

/// Metin bu kodlamada kayıpsız saklanabilir mi (ör. Türkçe metin Windows-1252'de "?" olur)
bool npCanEncode(String text, String encoding) {
  final enc = npNormalizeEncoding(encoding);
  if (enc.startsWith('utf')) return true;
  final rev = _reverseFor(enc)!;
  for (final r in text.runes) {
    if (r >= 0x80 && !rev.containsKey(r)) return false;
  }
  return true;
}

String _decodeBody(List<int> body, String enc) {
  switch (enc) {
    case 'utf8':
      return utf8.decode(body, allowMalformed: true);
    case 'utf16le':
    case 'utf16be':
      final le = enc == 'utf16le';
      final units = <int>[];
      for (var i = 0; i + 1 < body.length; i += 2) {
        units.add(le ? body[i] | (body[i + 1] << 8) : (body[i] << 8) | body[i + 1]);
      }
      return String.fromCharCodes(units);
    default:
      final t = _tableFor(enc)!;
      final out = StringBuffer();
      for (final b in body) {
        out.writeCharCode(b < 0x80 ? b : t[b - 0x80]);
      }
      return out.toString();
  }
}

Uint8List _encodeBody(String text, String enc) {
  switch (enc) {
    case 'utf8':
      return Uint8List.fromList(utf8.encode(text));
    case 'utf16le':
    case 'utf16be':
      final le = enc == 'utf16le';
      final out = Uint8List(text.length * 2);
      for (var i = 0; i < text.length; i++) {
        final u = text.codeUnitAt(i);
        if (le) { out[i * 2] = u & 0xff; out[i * 2 + 1] = u >> 8; } else { out[i * 2] = u >> 8; out[i * 2 + 1] = u & 0xff; }
      }
      return out;
    default:
      final rev = _reverseFor(enc)!;
      final out = <int>[];
      for (final r in text.runes) {
        if (r < 0x80) {
          out.add(r);
        } else {
          out.add(rev[r] ?? 0x3f); // '?'
        }
      }
      return Uint8List.fromList(out);
  }
}

// ---- kod sayfası tabloları (0x80..0xFF → Unicode; 0xFFFD = tanımsız)
const _c1 = [0x80, 0x81, 0x82, 0x83, 0x84, 0x85, 0x86, 0x87, 0x88, 0x89, 0x8a, 0x8b, 0x8c, 0x8d, 0x8e, 0x8f,
  0x90, 0x91, 0x92, 0x93, 0x94, 0x95, 0x96, 0x97, 0x98, 0x99, 0x9a, 0x9b, 0x9c, 0x9d, 0x9e, 0x9f];
const _win80 = [0x20ac, 0xfffd, 0x201a, 0x0192, 0x201e, 0x2026, 0x2020, 0x2021, 0x02c6, 0x2030, 0x0160, 0x2039, 0x0152, 0xfffd, 0x017d, 0xfffd,
  0xfffd, 0x2018, 0x2019, 0x201c, 0x201d, 0x2022, 0x2013, 0x2014, 0x02dc, 0x2122, 0x0161, 0x203a, 0x0153, 0xfffd, 0x017e, 0x0178];
final List<int> _latin1Hi = List.generate(96, (i) => 0xa0 + i);

List<int> _turkish(List<int> base) {
  final t = List<int>.from(base);
  t[0xd0 - 0x80] = 0x011e; t[0xdd - 0x80] = 0x0130; t[0xde - 0x80] = 0x015e;
  t[0xf0 - 0x80] = 0x011f; t[0xfd - 0x80] = 0x0131; t[0xfe - 0x80] = 0x015f;
  return t;
}

final List<int> _iso88591 = [..._c1, ..._latin1Hi];
final List<int> _win1252 = [..._win80, ..._latin1Hi];
final List<int> _iso88599 = _turkish(_iso88591);
final List<int> _win1254 = _turkish(_win1252)..[0x8e - 0x80] = 0xfffd..[0x9e - 0x80] = 0xfffd;
final List<int> _win1251 = [
  0x0402, 0x0403, 0x201a, 0x0453, 0x201e, 0x2026, 0x2020, 0x2021, 0x20ac, 0x2030, 0x0409, 0x2039, 0x040a, 0x040c, 0x040b, 0x040f,
  0x0452, 0x2018, 0x2019, 0x201c, 0x201d, 0x2022, 0x2013, 0x2014, 0xfffd, 0x2122, 0x0459, 0x203a, 0x045a, 0x045c, 0x045b, 0x045f,
  0x00a0, 0x040e, 0x045e, 0x0408, 0x00a4, 0x0490, 0x00a6, 0x00a7, 0x0401, 0x00a9, 0x0404, 0x00ab, 0x00ac, 0x00ad, 0x00ae, 0x0407,
  0x00b0, 0x00b1, 0x0406, 0x0456, 0x0491, 0x00b5, 0x00b6, 0x00b7, 0x0451, 0x2116, 0x0454, 0x00bb, 0x0458, 0x0405, 0x0455, 0x0457,
  for (var i = 0; i < 64; i++) 0x0410 + i,
];

List<int>? _tableFor(String enc) => switch (enc) {
      'windows-1254' => _win1254, 'iso-8859-9' => _iso88599, 'windows-1252' => _win1252, 'iso-8859-1' => _iso88591, 'windows-1251' => _win1251, _ => null };

final Map<String, Map<int, int>> _reverse = {};
Map<int, int>? _reverseFor(String enc) {
  final t = _tableFor(enc);
  if (t == null) return null;
  return _reverse.putIfAbsent(enc, () => {for (var i = 0; i < t.length; i++) if (t[i] != 0xfffd) t[i]: 0x80 + i});
}

/// Bu kodlama tablosu var mı (formda sunulur; olmayanlar veri olarak korunur ama UTF-8 gibi okunur)
bool npCodecSupported(String enc) => enc.startsWith('utf') || _tableFor(enc) != null;
