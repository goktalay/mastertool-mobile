// Notepad Master metin kodlaması birim testleri: BOM, UTF-16, CRLF/LF/CR, ANSI kod sayfaları, ikili dosya, kayıp denetimi.
import 'package:flutter_test/flutter_test.dart';
import 'package:master_tool/modules/notepad/np_lang.dart';
import 'package:master_tool/modules/notepad/np_model.dart';
import 'package:master_tool/modules/notepad/np_textcodec.dart';

void main() {
  group('npDecode', () {
    test('UTF-8 BOM algılanır ve atılır', () {
      final d = npDecode([0xef, 0xbb, 0xbf, 0x4d, 0x65, 0x72, 0x68, 0x61, 0x62, 0x61]);
      expect(d.encoding, 'utf8');
      expect(d.bom, isTrue);
      expect(d.text, 'Merhaba');
      expect(d.eol, isNull);
    });

    test('UTF-16 LE BOM', () {
      final d = npDecode([0xff, 0xfe, 0x48, 0x00, 0x69, 0x00, 0x0d, 0x00, 0x0a, 0x00, 0x15, 0x01]);
      expect(d.encoding, 'utf16le');
      expect(d.bom, isTrue);
      expect(d.text, 'Hi\r\nĕ');
      expect(d.eol, 'crlf');
    });

    test('UTF-16 BE BOM', () {
      final d = npDecode([0xfe, 0xff, 0x00, 0x48, 0x00, 0x69, 0x01, 0x1e]);
      expect(d.encoding, 'utf16be');
      expect(d.text, 'HiĞ');
    });

    test('BOM yok, geçerli UTF-8', () {
      final d = npDecode(npEncode('Şişli\nİstanbul'));
      expect(d.encoding, 'utf8');
      expect(d.bom, isFalse);
      expect(d.text, 'Şişli\nİstanbul');
      expect(d.eol, 'lf');
    });

    test('UTF-8 değilse ANSI yedeği (Windows-1254)', () {
      // "Şişli" Windows-1254: DE 69 FE 6C 69
      final d = npDecode([0xde, 0x69, 0xfe, 0x6c, 0x69]);
      expect(d.encoding, 'windows-1254');
      expect(d.text, 'Şişli');
    });

    test('yedek ISO-8859-1', () {
      final d = npDecode([0xe9, 0x74, 0xe9], fallback: 'iso-8859-1');
      expect(d.encoding, 'iso-8859-1');
      expect(d.text, 'été');
    });

    test('sabit kodlama utf8bom: BOM yoksa kaydederken eklenecek', () {
      final d = npDecode([0x41], encoding: 'utf8bom');
      expect(d.encoding, 'utf8');
      expect(d.bom, isTrue);
    });

    test('ikili dosya (NUL baytı)', () {
      expect(npDecode([0x41, 0x00, 0x42]).binary, isTrue);
      expect(npDecode([0xff, 0xfe, 0x41, 0x00]).binary, isFalse); // UTF-16 BOM'lu metin ikili sayılmaz
    });

    test('Windows-1251 Kiril', () {
      final d = npDecode([0xcf, 0xf0, 0xe8, 0xe2, 0xe5, 0xf2], encoding: 'windows-1251');
      expect(d.text, 'Привет');
    });
  });

  group('npDetectEol', () {
    test('CRLF baskın', () => expect(npDetectEol('a\r\nb\r\nc\n'), 'crlf'));
    test('LF', () => expect(npDetectEol('a\nb\nc'), 'lf'));
    test('CR', () => expect(npDetectEol('a\rb\rc'), 'cr'));
    test('yok', () => expect(npDetectEol('abc'), isNull));
    test('dönüştürme', () {
      expect(npConvertEol('a\r\nb\rc\n', 'lf'), 'a\nb\nc\n');
      expect(npConvertEol('a\nb', 'crlf'), 'a\r\nb');
      expect(npConvertEol('a\r\nb', 'cr'), 'a\rb');
    });
  });

  group('npEncode', () {
    test('UTF-8 + BOM', () {
      expect(npEncode('A', encoding: 'utf8', bom: true), [0xef, 0xbb, 0xbf, 0x41]);
      expect(npEncode('A', encoding: 'utf8'), [0x41]);
    });
    test('UTF-16 LE/BE + BOM', () {
      expect(npEncode('A', encoding: 'utf16le', bom: true), [0xff, 0xfe, 0x41, 0x00]);
      expect(npEncode('A', encoding: 'utf16be', bom: true), [0xfe, 0xff, 0x00, 0x41]);
    });
    test('Windows-1254 gidiş dönüş', () {
      const t = 'Çağrı Şişli İğne ışık ÖÜĞ';
      final b = npEncode(t, encoding: 'windows-1254');
      expect(npDecode(b, encoding: 'windows-1254').text, t);
    });
    test('kayıp denetimi', () {
      expect(npCanEncode('Şişli', 'windows-1254'), isTrue);
      expect(npCanEncode('Şişli', 'windows-1252'), isFalse);
      expect(npCanEncode('Привет', 'windows-1251'), isTrue);
      expect(npCanEncode('Привет', 'windows-1254'), isFalse);
      expect(npCanEncode('Привет', 'utf8'), isTrue);
      expect(npEncode('Ş', encoding: 'windows-1252'), [0x3f]); // '?'
    });
    test('desteklenmeyen kodlama UTF-8 sayılır', () {
      expect(npNormalizeEncoding('windows-1256'), 'utf8');
      expect(npNormalizeEncoding('utf8bom'), 'utf8');
      expect(npNormalizeEncoding('iso-8859-9'), 'iso-8859-9');
    });
  });

  group('model', () {
    test('sanitizeEditor varsayılanları doldurur ve sınırlar', () {
      final e = npSanitizeEditor({'tabSize': 99, 'encoding': 'bogus', 'fontSize': '12', 'minimap': 'x', 'rulers': '80,a120'});
      expect(e['tabSize'], 16);
      expect(e['encoding'], 'auto');
      expect(e['fontSize'], 12);
      expect(e['minimap'], true);
      expect(e['rulers'], '80,120');
      expect(e.keys.toSet(), kNpEditorDefaults.keys.toSet());
    });
    test('effectiveEditor: global / custom', () {
      final settings = {'editor': {'tabSize': 2}};
      final g = NpConnection('a', {...NpConnection.blank(), 'editor': {'tabSize': 8}});
      expect(npEffectiveEditor(g, settings)['tabSize'], 2);
      final c = NpConnection('b', {...NpConnection.blank(), 'editorMode': 'custom', 'editor': {'tabSize': 8}});
      expect(npEffectiveEditor(c, settings)['tabSize'], 8);
      expect(npEffectiveEditor(c, settings)['fontSize'], 14);
    });
    test('süzgeç: gizli dosyalar ve kalıplar', () {
      final f = NpConnection('x', {...NpConnection.blank(), 'showHidden': false, 'exclude': 'node_modules, *.log, .git'}).filter;
      expect(f('index.php'), isTrue);
      expect(f('.env'), isFalse);
      expect(f('node_modules'), isFalse);
      expect(f('app.log'), isFalse);
      expect(f('app.logx'), isTrue);
      expect(NpConnection('y', {...NpConnection.blank(), 'showHidden': true}).filter('.htaccess'), isTrue);
    });
    test('dil algılama', () {
      expect(npLanguageFor('/var/www/index.php'), 'php');
      expect(npLanguageFor('/x/app.blade.php'), 'php');
      expect(npLanguageFor('/x/.htaccess'), 'ini');
      expect(npLanguageFor('/x/Dockerfile'), 'dockerfile');
      expect(npLanguageFor('/x/run', '#!/usr/bin/env bash'), 'shell');
      expect(npLanguageFor('/x/run', '#!/usr/bin/python3'), 'python');
      expect(npLanguageFor('/x/page', '<!DOCTYPE html>'), 'html');
      expect(npLanguageFor('/x/noext'), 'plaintext');
      expect(npLanguageFor('/x/style.SCSS'), 'scss');
    });
    test('yol yardımcıları', () {
      expect(npBaseName('/a/b/c.txt'), 'c.txt');
      expect(npDirName('/a/b/c.txt'), '/a/b');
      expect(npDirName('/c.txt'), '/');
      expect(npJoin('/a/', 'b'), '/a/b');
      expect(npJoin('/a', 'b'), '/a/b');
    });
  });
}
