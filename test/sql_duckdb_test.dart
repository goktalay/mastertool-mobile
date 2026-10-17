// DuckDB sürücüsü birim testi: bellek içi CREATE/INSERT/SELECT, 500'lük parça akışı ve satır sınırı, CSV dosyasından
// görünüm, dosya veritabanında salt okunur kip. Yerel kitaplık: dart_duckdb test ortamında
// `<proje>/../duckdb/linux/Libraries/release/libduckdb.so` yolunu ya da LD_LIBRARY_PATH'teki libduckdb.so'yu yükler;
// MT_DUCKDB_LIB ortam değişkeni ile de yol verilebilir. Kitaplık yoksa testler atlanır (skip).
import 'dart:io';

import 'package:dart_duckdb/dart_duckdb.dart' show OperatingSystem;
import 'package:dart_duckdb/open.dart' show open;
import 'package:flutter_test/flutter_test.dart';
import 'package:master_tool/modules/sql/drivers/duckdb_driver.dart';
import 'package:master_tool/modules/sql/drivers/sql_driver.dart';
import 'package:master_tool/modules/sql/sql_tree.dart' show duckFilePreviewSql;

String? _findLib() {
  final env = Platform.environment['MT_DUCKDB_LIB'];
  if (env != null && File(env).existsSync()) return env;
  final pkgPath = '${Directory.current.path}/../duckdb/linux/Libraries/release/libduckdb.so';
  if (File(pkgPath).existsSync()) return pkgPath;
  for (final d in (Platform.environment['LD_LIBRARY_PATH'] ?? '').split(':')) {
    if (d.isNotEmpty && File('$d/libduckdb.so').existsSync()) return '$d/libduckdb.so';
  }
  return null;
}

Future<List<QueryEvent>> _collect(Stream<QueryEvent> s) => s.toList();

void main() {
  final lib = Platform.isLinux ? _findLib() : null;
  final skip = lib == null ? 'libduckdb.so bulunamadı (MT_DUCKDB_LIB ya da ../duckdb/linux/Libraries/release/libduckdb.so)' : false;
  late Directory tmp;

  setUpAll(() {
    if (lib != null && Platform.isLinux) open.overrideFor(OperatingSystem.linux, lib);
    tmp = Directory.systemTemp.createTempSync('mtduck');
  });
  tearDownAll(() {
    try { tmp.deleteSync(recursive: true); } catch (_) {}
  });

  group('DuckDbDriver', () {
    test('yardımcılar: veri dosyası, görünüm adı, okuyucu', () {
      expect(DuckDbDriver.isDataFile('/a/satış-2026.csv'), isTrue);
      expect(DuckDbDriver.isDataFile('/a/x.parquet'), isTrue);
      expect(DuckDbDriver.isDataFile('/a/x.duckdb'), isFalse);
      expect(DuckDbDriver.viewNameFor('/a/satış 2026.csv'), 'sat___2026');
      expect(DuckDbDriver.readerFor('/a/x.csv'), "'/a/x.csv'");
      expect(DuckDbDriver.readerFor("/a/o'z.xlsx"), "read_xlsx('/a/o''z.xlsx')");
      expect(duckFilePreviewSql('/a/x.csv'), "SELECT *\nFROM '/a/x.csv'\nLIMIT 1000;");
      expect(DuckDbDriver(path: '', readOnly: true).dbPath, ':memory:');
      expect(DuckDbDriver(path: '/a/x.csv', readOnly: true).dbPath, ':memory:');
      expect(DuckDbDriver(path: '/a/x.duckdb', readOnly: true).dbPath, '/a/x.duckdb');
    });

    test('bellek içi: CREATE / INSERT / SELECT, ağaç ve tipler', () async {
      final d = DuckDbDriver(path: '', readOnly: false);
      await d.connect();
      try {
        expect(d.serverInfo.product, startsWith('DuckDB '));
        expect(d.serverInfo.database, ':memory:');
        final c = await d.execute('CREATE TABLE urun (id INTEGER PRIMARY KEY, ad VARCHAR NOT NULL, fiyat DECIMAL(10,2), etiket VARCHAR[], tarih DATE)');
        expect(c.command, 'CREATE');
        final ins = await _collect(d.query("INSERT INTO urun VALUES (1, 'Kalem', 12.50, ['ofis','okul'], DATE '2026-04-01'), (2, 'Defter', 30, [], NULL)"));
        expect(ins.single, isA<QCommand>().having((e) => e.rowsAffected, 'rowsAffected', 2));
        final ev = await _collect(d.query('SELECT id, ad, fiyat, etiket, tarih FROM urun ORDER BY id'));
        final cols = (ev[0] as QColumns).columns;
        expect(cols.map((c) => c.name), ['id', 'ad', 'fiyat', 'etiket', 'tarih']);
        expect(cols.map((c) => c.type), ['INTEGER', 'VARCHAR', 'DECIMAL', 'LIST', 'DATE']);
        expect(cols.map((c) => c.numeric), [true, false, true, false, false]);
        final rows = (ev[1] as QRows).rows;
        expect(rows.length, 2);
        expect(rows[0][0], 1);
        expect(rows[0][1], 'Kalem');
        expect(cellText(rows[0][2]), '12.5'); // dart_duckdb Decimal.toString: sondaki sıfırlar atılır
        expect(rows[0][3], ['ofis', 'okul']);
        expect(cellText(rows[0][3]), '["ofis","okul"]');
        expect(cellText(rows[0][4]), '2026-04-01');
        expect(rows[1][4], isNull);
        expect(ev[2], isA<QEnd>().having((e) => e.rowCount, 'rowCount', 2).having((e) => e.truncated, 'truncated', false));
        // ağaç
        final dbs = await d.databases();
        expect(dbs.first, 'memory');
        expect(await d.schemas('memory'), contains('main'));
        final tables = await d.tables('memory', 'main');
        expect(tables.map((t) => t.name), ['urun']);
        final info = await d.columns('memory', 'main', 'urun');
        expect(info.map((c) => c.name), ['id', 'ad', 'fiyat', 'etiket', 'tarih']);
        expect(info[0].pk, isTrue);
        expect(info[1].notNull, isTrue);
        expect(info[2].numeric, isTrue);
        await d.execute('CREATE INDEX urun_ad ON urun(ad)');
        expect((await d.indexes('memory', 'main', 'urun')).map((i) => i.name), ['urun_ad']);
        // hata metni DuckDB mesajını taşır
        await expectLater(_collect(d.query('SELECT * FROM yok')), throwsA(isA<DuckDbError>().having((e) => e.message, 'message', contains('yok'))));
      } finally {
        await d.close();
      }
    }, skip: skip);

    test('500\'lük parçalar ve satır sınırı', () async {
      final d = DuckDbDriver(path: '', readOnly: false);
      await d.connect();
      try {
        final ev = await _collect(d.query('SELECT range AS i FROM range(1200)'));
        expect(ev.whereType<QRows>().map((r) => r.rows.length), [500, 500, 200]);
        expect((ev.last as QEnd).rowCount, 1200);
        final lim = await _collect(d.query('SELECT range AS i FROM range(1200)', limit: 700));
        expect(lim.whereType<QRows>().map((r) => r.rows.length), [500, 200]);
        expect(lim.last, isA<QEnd>().having((e) => e.truncated, 'truncated', true).having((e) => e.rowCount, 'rowCount', 700));
      } finally {
        await d.close();
      }
    }, skip: skip);

    test('CSV dosyası: dosya adıyla görünüm ve doğrudan sorgu', () async {
      final csv = File('${tmp.path}/satis-2026.csv')..writeAsStringSync('id,urun,adet,tutar\n1,Kalem,3,37.5\n2,Defter,1,30\n3,Silgi,10,25\n');
      final d = DuckDbDriver(path: csv.path, readOnly: true);
      await d.connect();
      try {
        expect(d.dbPath, ':memory:');
        expect(d.serverInfo.database, 'satis-2026.csv');
        final tables = await d.tables('memory', 'main');
        expect(tables.where((t) => t.kind == 'view').map((t) => t.name), ['satis_2026']);
        final ev = await _collect(d.query('SELECT urun, adet FROM satis_2026 ORDER BY id'));
        expect((ev[1] as QRows).rows.map((r) => r[0]), ['Kalem', 'Defter', 'Silgi']);
        expect((ev[0] as QColumns).columns[1].numeric, isTrue);
        // SQL içinde dosya yolu
        final direct = await _collect(d.query("SELECT count(*) n, sum(tutar) t FROM '${csv.path}'"));
        expect((direct[1] as QRows).rows.single[0], 3);
        expect(((direct[1] as QRows).rows.single[1] as num).toDouble(), 92.5);
        // önizleme SQL'i de çalışır
        final prev = await _collect(d.query(duckFilePreviewSql(csv.path)));
        expect((prev.last as QEnd).rowCount, 3);
      } finally {
        await d.close();
      }
    }, skip: skip);

    test('dosya veritabanı: salt okunur açılış ve kip değişimi', () async {
      final path = '${tmp.path}/depo.duckdb';
      final rw = DuckDbDriver(path: path, readOnly: false);
      await rw.connect();
      await rw.execute('CREATE TABLE t (a INTEGER)');
      await rw.execute('INSERT INTO t VALUES (1)');
      await rw.close();

      final ro = DuckDbDriver(path: path, readOnly: true);
      await ro.connect();
      try {
        expect(ro.serverInfo.database, 'depo.duckdb');
        await expectLater(ro.execute('INSERT INTO t VALUES (2)'), throwsA(isA<DuckDbError>().having((e) => e.message.toLowerCase(), 'message', contains('read-only'))));
        await ro.setReadOnly(false); // yeniden açar
        expect((await ro.execute('INSERT INTO t VALUES (2)')).rowsAffected, 1);
        await ro.setReadOnly(true);
        final ev = await _collect(ro.query('SELECT count(*) FROM t'));
        expect((ev[1] as QRows).rows.single[0], 2);
        await expectLater(ro.execute('DELETE FROM t'), throwsA(isA<DuckDbError>()));
      } finally {
        await ro.close();
      }
      // olmayan dosya salt okunur açılamaz
      await expectLater(DuckDbDriver(path: '${tmp.path}/yok.duckdb', readOnly: true).connect(), throwsA(isA<DuckDbError>().having((e) => e.message, 'message', startsWith(kDuckFileNotFound))));
    }, skip: skip);

    test('iptal: bayrak parçalar arasında SqlCancelled fırlatır', () async {
      final d = DuckDbDriver(path: '', readOnly: false);
      await d.connect();
      try {
        final events = <QueryEvent>[];
        await expectLater(() async {
          await for (final ev in d.query('SELECT range FROM range(3000)')) {
            events.add(ev);
            if (ev is QRows) await d.cancel();
          }
        }(), throwsA(isA<SqlCancelled>()));
        expect(events.whereType<QRows>().length, 1);
      } finally {
        await d.close();
      }
    }, skip: skip);
  });
}
