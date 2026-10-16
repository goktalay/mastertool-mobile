// SQL Master salt okunur sınıflandırıcısı, ifade bölme ve ızgara SQL üretimi (masaüstü classify/split/gridQuery birebir).
import 'package:flutter_test/flutter_test.dart';
import 'package:master_tool/modules/sql/sql_classify.dart';
import 'package:master_tool/modules/sql/sql_dialect.dart';
import 'package:master_tool/modules/sql/sql_grid_query.dart';
import 'package:master_tool/modules/sql/sql_lexer.dart';
import 'package:master_tool/modules/sql/sql_split.dart';

void main() {
  group('classify', () {
    StatementKind k(String sql, [String d = 'postgres']) => classify(sql, d).kind;
    test('SELECT okumadır', () {
      expect(k('SELECT * FROM t'), StatementKind.read);
      expect(k("select 'DELETE FROM x' as s"), StatementKind.read);
      expect(k('-- delete\nSELECT 1'), StatementKind.read);
      expect(classify('SELECT 1', 'postgres').keyword, 'SELECT');
    });
    test('WITH … DELETE yazmadır', () {
      expect(k('WITH x AS (SELECT 1) DELETE FROM t WHERE id IN (SELECT * FROM x)'), StatementKind.write);
      expect(classify('WITH x AS (SELECT 1) DELETE FROM t', 'postgres').keyword, 'DELETE');
      expect(k('WITH x AS (SELECT 1) SELECT * FROM x'), StatementKind.read);
    });
    test('EXPLAIN / EXPLAIN ANALYZE', () {
      expect(k('EXPLAIN SELECT 1'), StatementKind.read);
      expect(k('EXPLAIN DELETE FROM t'), StatementKind.read);
      expect(k('EXPLAIN ANALYZE SELECT 1'), StatementKind.read);
      expect(k('EXPLAIN (ANALYZE, BUFFERS) SELECT 1'), StatementKind.read);
      expect(k('EXPLAIN ANALYZE DELETE FROM t'), StatementKind.write);
      expect(classify('EXPLAIN ANALYZE UPDATE t SET a = 1', 'postgres').keyword, 'EXPLAIN ANALYZE');
      expect(k('EXPLAIN ANALYZE WITH x AS (DELETE FROM t RETURNING *) SELECT * FROM x'), StatementKind.write);
    });
    test('PRAGMA', () {
      expect(k('PRAGMA table_info(t)', 'sqlite'), StatementKind.read);
      expect(k('PRAGMA journal_mode = WAL', 'sqlite'), StatementKind.write);
      expect(k('PRAGMA optimize', 'sqlite'), StatementKind.write);
    });
    test('COPY', () {
      expect(k('COPY t TO STDOUT'), StatementKind.read);
      expect(k("COPY t FROM '/tmp/x.csv'"), StatementKind.write);
      expect(k("COPY t TO '/tmp/x.csv'"), StatementKind.write);
    });
    test('SET / SET GLOBAL', () {
      expect(k('SET search_path = public'), StatementKind.session);
      expect(k('SET GLOBAL max_connections = 10', 'mysql'), StatementKind.write);
      expect(k('SET PERSIST x = 1', 'mysql'), StatementKind.write);
      expect(k('SET SESSION CHARACTERISTICS AS TRANSACTION READ WRITE'), StatementKind.write);
      expect(k('BEGIN'), StatementKind.session);
      expect(k('COMMIT'), StatementKind.session);
    });
    test('MSSQL partisi', () {
      expect(k('SELECT 1\nDELETE FROM t', 'mssql'), StatementKind.write);
      expect(k("SELECT * FROM t WHERE a = 'delete from x'", 'mssql'), StatementKind.read);
      expect(k('SELECT * FROM t FOR UPDATE', 'mssql'), StatementKind.write); // FOR UPDATE: kilit
      expect(k('DECLARE @x INT; SET @x = (SELECT 1)', 'mssql'), StatementKind.session);
      expect(k('EXEC sp_who', 'mssql'), StatementKind.write);
    });
    test('SELECT INTO', () {
      expect(k('SELECT * INTO yeni FROM t'), StatementKind.write);
      expect(k('SELECT * INTO yeni FROM t', 'mssql'), StatementKind.write);
      expect(k('SELECT a INTO @v FROM t', 'mysql'), StatementKind.read);
      expect(k('SELECT (SELECT 1) INTO x FROM t', 'postgres'), StatementKind.write);
    });
    test('FOR UPDATE', () {
      expect(k('SELECT * FROM t FOR UPDATE'), StatementKind.write);
      expect(k('SELECT * FROM t FOR SHARE'), StatementKind.write);
      expect(k('SELECT * FROM t FOR NO KEY UPDATE'), StatementKind.write);
      expect(k("SELECT * FROM t WHERE x = 'for update'"), StatementKind.read);
    });
    test('MySQL INTO OUTFILE', () {
      expect(k("SELECT * FROM t INTO OUTFILE '/tmp/x'", 'mysql'), StatementKind.write);
      expect(k("SELECT * FROM t INTO DUMPFILE '/tmp/x'", 'mysql'), StatementKind.write);
    });
    test('LOCK IN SHARE MODE', () {
      expect(k('SELECT * FROM t LOCK IN SHARE MODE', 'mysql'), StatementKind.write);
      expect(k('SELECT * FROM t LOCK IN SHARE MODE', 'postgres'), StatementKind.read);
    });
    test('bilinmeyen komut yazmadır; boş ifade okumadır', () {
      expect(k('VACUUM'), StatementKind.write);
      expect(k('CALL p()'), StatementKind.write);
      expect(k('TRUNCATE t'), StatementKind.write);
      expect(k('   '), StatementKind.read);
      expect(k('SHOW TABLES', 'mysql'), StatementKind.read);
    });
  });

  group('split', () {
    test('ifade bölme (; tırnak ve yorum içinde değil)', () {
      final l = splitStatements("SELECT ';' AS a; -- yorum; burada\nSELECT 2;\n\n", 'postgres');
      expect(l.map((s) => s.text).toList(), ["SELECT ';' AS a", '-- yorum; burada\nSELECT 2']);
      expect(l[0].start, 0);
      expect(l[1].end, 42);
    });
    test('\$\$ gövdesi ve BEGIN…END bloğu bölünmez', () {
      final l = splitStatements(r'CREATE FUNCTION f() RETURNS int AS $$ SELECT 1; $$ LANGUAGE sql; SELECT 2', 'postgres');
      expect(l.length, 2);
      final m = splitStatements('CREATE PROCEDURE p() BEGIN SELECT 1; SELECT 2; END; SELECT 3', 'mysql');
      expect(m.length, 2);
      expect(m[0].text, startsWith('CREATE PROCEDURE'));
    });
    test('MySQL DELIMITER', () {
      final l = splitStatements('DELIMITER //\nCREATE PROCEDURE p() BEGIN SELECT 1; END //\nDELIMITER ;\nSELECT 2;', 'mysql');
      expect(l.length, 2);
      expect(l[1].text, 'SELECT 2');
    });
    test('MSSQL GO partileri', () {
      final l = splitStatements('SELECT 1\nGO\nSELECT 2\nGO 3\nSELECT 3 -- GO', 'mssql');
      expect(l.map((s) => s.text).toList(), ['SELECT 1', 'SELECT 2', 'SELECT 3 -- GO']);
    });
    test('statementAt', () {
      const sql = 'SELECT 1;\nSELECT 2;';
      expect(statementAt(sql, 'postgres', 12)!.text, 'SELECT 2');
      expect(statementAt(sql, 'postgres', 9)!.text, 'SELECT 1');
      expect(statementAt('', 'postgres', 0), isNull);
    });
    test('lexer: iç içe yorum, E\'\', backtick, [ ]', () {
      expect(tokenize('/* a /* b */ c */ x', 'postgres').first.kind, TokenKind.comment);
      expect(tokenize('/* a /* b */ c */ x', 'postgres').first.end, 17);
      expect(tokenize(r"E'a\'b' x", 'postgres').first.end, 7);
      expect(tokenize('`a``b` x', 'mysql').first.kind, TokenKind.qident);
      expect(tokenize('[a]]b] x', 'mssql').first.end, 6);
      expect(tokenize('@p1 x', 'mssql').first.kind, TokenKind.param);
      expect(tokenize('"x" y', 'mysql').first.kind, TokenKind.string);
    });
  });

  group('gridQuery', () {
    test('ident / literal / qualified', () {
      expect(ident('musteri', 'postgres'), 'musteri');
      expect(ident('Musteri', 'postgres'), '"Musteri"');
      expect(ident('order', 'postgres'), '"order"');
      expect(ident('Musteri', 'mysql'), 'Musteri');
      expect(literal("a'b", 'postgres'), "'a''b'");
      expect(literal(r'a\b', 'mysql'), r"'a\\b'");
      expect(literal('ç', 'mssql'), "N'ç'");
      expect(qualified(const TableRef(schema: 'satis', name: 'siparisler'), 'postgres'), 'satis.siparisler');
      expect(qualified(const TableRef(database: 'shop', name: 't'), 'mysql'), 'shop.t');
      expect(qualified(const TableRef(database: 'db', schema: 'dbo', name: 't'), 'mssql'), 'db.dbo.t');
    });
    test('buildGridSelect: filtre, sıralama, sınır, gizli kolon', () {
      final m = GridQueryModel(table: const TableRef(schema: 'satis', name: 'siparisler'), columns: const [
        ColumnMeta(name: 'id', type: 'integer', numeric: true), ColumnMeta(name: 'durum', type: 'text'), ColumnMeta(name: 'tutar', type: 'numeric', numeric: true),
      ], limit: 100);
      m.filters = [GridFilter(column: 'durum', op: '=', value: 'Kargoda'), GridFilter(column: 'tutar', op: '>', value: '10'), GridFilter(column: 'id', op: 'contains', value: '3')];
      m.sort = [GridSort(column: 'tutar', dir: 'desc')];
      expect(buildGridSelect(m, 'postgres'), "SELECT *\nFROM satis.siparisler\nWHERE durum = 'Kargoda'\n  AND tutar > 10\n  AND CAST(id AS text) ILIKE '%3%'\nORDER BY tutar DESC\nLIMIT 100");
      m.hidden.add('durum');
      m.filters = [GridFilter(column: 'durum', op: 'is null'), GridFilter(column: 'id', op: 'in', value: '1, 2,x')];
      m.sort = [];
      m.limit = null;
      expect(buildGridSelect(m, 'mysql'), "SELECT id, tutar\nFROM satis.siparisler\nWHERE durum IS NULL\n  AND id IN (1, 2, 'x')");
      expect(buildGridSelect(GridQueryModel(table: const TableRef(name: 't'), limit: 5), 'mssql'), 'SELECT TOP (5) *\nFROM t');
    });
  });
}
