// Salt okunur koruması için ifade sınıflandırıcısı — masaüstü sqlmaster/src/core/sql/classify.ts ile BİREBİR.
//   read    → veri/şema değiştirmez (SELECT, SHOW, EXPLAIN …)
//   session → yalnız oturum durumu (USE, SET, BEGIN/COMMIT …)
//   write   → DML/DDL ya da etkisi bilinmeyen komut (EXEC, CALL …); salt okunur modda onay ister
// Bilinmeyen her şey "write" sayılır: yanlış alarm onay sorar, kaçırılan yazma ise veri bozar.
import 'sql_lexer.dart';

enum StatementKind { read, session, write }

class Classification {
  const Classification(this.kind, this.keyword);
  final StatementKind kind;
  /// Kararı veren anahtar sözcük (örn. "DELETE") — arayüzde gösterilir
  final String keyword;
}

const _readFirst = {'SELECT', 'SHOW', 'DESCRIBE', 'DESC', 'VALUES', 'TABLE', 'SUMMARIZE', 'FROM', 'PRINT', 'HELP', 'CHECKSUM'};
const _sessionFirst = {'USE', 'BEGIN', 'START', 'COMMIT', 'ROLLBACK', 'END', 'SAVEPOINT', 'RELEASE', 'DECLARE', 'SET', 'RESET', 'DISCARD', 'FETCH', 'CLOSE', 'DEALLOCATE', 'PREPARE', 'LISTEN', 'UNLISTEN', 'ABORT'};
const _dmlInCte = {'INSERT', 'UPDATE', 'DELETE', 'MERGE', 'UPSERT'};
// SQL Server partisi içinde (";" zorunlu olmadığından) her yerde aranacak yazma sözcükleri
const _mssqlStrong = {'INSERT', 'UPDATE', 'DELETE', 'MERGE', 'DROP', 'ALTER', 'CREATE', 'TRUNCATE', 'EXEC', 'EXECUTE', 'GRANT', 'REVOKE', 'DENY', 'BACKUP', 'RESTORE', 'DBCC', 'BULK', 'RECONFIGURE', 'SHUTDOWN', 'KILL', 'ENABLE', 'DISABLE'};
const _explainOpts = {'ANALYZE', 'ANALYSE', 'VERBOSE', 'COSTS', 'BUFFERS', 'FORMAT', 'TIMING', 'SUMMARY', 'SETTINGS', 'WAL', 'JSON', 'TEXT', 'XML', 'YAML', 'TRUE', 'FALSE', 'ON', 'OFF', 'QUERY', 'PLAN', 'GENERIC_PLAN', 'MEMORY', 'SERIALIZE'};

class _W {
  _W(this.upper, this.depth);
  final String upper;
  final int depth;
}

Classification classify(String sql, SqlDialect d) {
  final tokens = tokenize(sql, d).where((t) => t.kind != TokenKind.ws && t.kind != TokenKind.comment).toList();
  // Parantez derinliği ile birlikte sözcük listesi
  final ws = <_W>[];
  var depth = 0;
  final puncts = <String>[];
  for (final t in tokens) {
    if (t.kind == TokenKind.punct) {
      final ch = sql[t.start];
      if (ch == '(') {
        depth++;
      } else if (ch == ')') {
        depth = depth - 1 < 0 ? 0 : depth - 1;
      }
      puncts.add(ch);
    } else if (t.kind == TokenKind.word) {
      ws.add(_W(t.upper!, depth));
    }
  }
  if (ws.isEmpty) return const Classification(StatementKind.read, '');

  final first = ws[0].upper;
  bool has(String w) => ws.any((x) => x.upper == w);
  bool hasSeq(String a, String b) {
    for (var i = 0; i < ws.length - 1; i++) {
      if (ws[i].upper == a && ws[i + 1].upper == b) return true;
    }
    return false;
  }

  // SQL Server: partinin herhangi bir yerinde yazma sözcüğü
  if (d == 'mssql') {
    for (var i = 0; i < ws.length; i++) {
      final x = ws[i];
      if (_mssqlStrong.contains(x.upper) && !(x.upper == 'UPDATE' && i > 0 && ws[i - 1].upper == 'FOR')) return Classification(StatementKind.write, x.upper);
    }
    if (_selectInto(ws, d)) return const Classification(StatementKind.write, 'INTO');
  }

  if (first == 'WITH') {
    for (final x in ws) {
      if (_dmlInCte.contains(x.upper)) return Classification(StatementKind.write, x.upper);
    }
    return _selectLike(ws, d, 'WITH');
  }
  if (first == 'SELECT' || first == 'FROM' || first == 'TABLE' || first == 'VALUES') return _selectLike(ws, d, first);

  if (first == 'EXPLAIN') {
    final analyze = has('ANALYZE') || has('ANALYSE');
    if (!analyze) return const Classification(StatementKind.read, 'EXPLAIN');
    // EXPLAIN ANALYZE ifadeyi gerçekten çalıştırır: iç ifadeye bak
    _W? inner;
    for (var i = 1; i < ws.length; i++) {
      if (!_explainOpts.contains(ws[i].upper)) { inner = ws[i]; break; }
    }
    if (inner != null && (inner.upper == 'SELECT' || inner.upper == 'WITH' || inner.upper == 'VALUES' || inner.upper == 'TABLE')) {
      if (inner.upper == 'WITH' && ws.any((x) => _dmlInCte.contains(x.upper))) return const Classification(StatementKind.write, 'EXPLAIN ANALYZE');
      return const Classification(StatementKind.read, 'EXPLAIN');
    }
    return const Classification(StatementKind.write, 'EXPLAIN ANALYZE');
  }

  if (first == 'PRAGMA') {
    // PRAGMA ad = değer ya da bilinen yazan pragmalar
    final writes = puncts.contains('=') || const ['OPTIMIZE', 'INCREMENTAL_VACUUM', 'WAL_CHECKPOINT', 'SHRINK_MEMORY'].contains(ws.length > 1 ? ws[1].upper : '');
    return writes ? const Classification(StatementKind.write, 'PRAGMA') : const Classification(StatementKind.read, 'PRAGMA');
  }

  if (first == 'COPY') {
    return hasSeq('TO', 'STDOUT') ? const Classification(StatementKind.read, 'COPY') : const Classification(StatementKind.write, 'COPY');
  }

  if (_readFirst.contains(first)) return Classification(StatementKind.read, first);

  if (_sessionFirst.contains(first)) {
    // Salt okunur kipi kapatmaya çalışan oturum komutları yazma sayılır
    if (has('WRITE') || has('DEFAULT_TRANSACTION_READ_ONLY') || has('TRANSACTION_READ_ONLY')) return Classification(StatementKind.write, '$first … READ WRITE');
    if (first == 'SET' && (has('GLOBAL') || has('PERSIST') || has('PERSIST_ONLY') || (d == 'mysql' && has('PASSWORD')))) return const Classification(StatementKind.write, 'SET GLOBAL');
    // MSSQL: SET @x = (SELECT …) okumadır; DECLARE @t TABLE yerel değişkendir
    return Classification(StatementKind.session, first);
  }

  return Classification(StatementKind.write, first);
}

bool _selectInto(List<_W> ws, SqlDialect d) {
  // SELECT … INTO yeni_tablo (PG/MSSQL tablo oluşturur); MySQL'de INTO @değişken okumadır, INTO OUTFILE yazmadır
  final i = ws.indexWhere((x) => x.upper == 'INTO' && x.depth == 0);
  if (i < 0) return false;
  if (!ws.sublist(0, i).any((x) => x.upper == 'SELECT')) return false;
  if (d == 'mysql') return const ['OUTFILE', 'DUMPFILE'].contains(i + 1 < ws.length ? ws[i + 1].upper : '');
  return true;
}

Classification _selectLike(List<_W> ws, SqlDialect d, String keyword) {
  if (_selectInto(ws, d)) return const Classification(StatementKind.write, 'SELECT INTO');
  // FOR UPDATE / FOR SHARE kilit alır (PostgreSQL salt okunur işlemde reddeder)
  for (var i = 0; i < ws.length; i++) {
    if (ws[i].upper == 'FOR' && const ['UPDATE', 'SHARE', 'NO', 'KEY'].contains(i + 1 < ws.length ? ws[i + 1].upper : '')) {
      return const Classification(StatementKind.write, 'FOR UPDATE');
    }
  }
  if (d == 'mysql') {
    for (var i = 0; i < ws.length - 1; i++) {
      if (ws[i].upper == 'LOCK' && ws[i + 1].upper == 'IN') return const Classification(StatementKind.write, 'LOCK IN SHARE MODE');
    }
  }
  return Classification(StatementKind.read, keyword);
}
