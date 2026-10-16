// Betiği çalıştırılabilir ifadelere böler — masaüstü sqlmaster/src/core/sql/split.ts ile BİREBİR.
//  - PostgreSQL / SQLite / DuckDB / MySQL: ";" ile (tırnak, yorum, $$ gövde ve BEGIN…END blokları hariç)
//  - MySQL: "DELIMITER //" satırları desteklenir
//  - SQL Server: yalnızca "GO" satırlarıyla (her parti tek seferde gönderilir)
import 'sql_lexer.dart';

class Statement {
  Statement(this.text, this.start, this.end);
  final String text;
  /// Özgün metindeki konum (hata vurgulama ve "imleçteki ifadeyi çalıştır" için)
  final int start, end;
}

List<Statement> splitStatements(String sql, SqlDialect d) => d == 'mssql' ? _splitBatches(sql) : _splitBySemicolon(sql, d);

void _pushStatement(List<Statement> out, String sql, int start, int end, List<Token> tokens, int from, int to) {
  // Yalnızca yorum/boşluk içeren parçaları atla
  var has = false;
  for (var k = from; k < to; k++) {
    if (tokens[k].kind != TokenKind.ws && tokens[k].kind != TokenKind.comment) { has = true; break; }
  }
  if (!has) return;
  // Baş/son boşlukları kırp (yorumlar ifadeye dahil kalır)
  while (start < end && isSqlSpace(sql[start])) {
    start++;
  }
  while (end > start && isSqlSpace(sql[end - 1])) {
    end--;
  }
  out.add(Statement(sql.substring(start, end), start, end));
}

final _blank = RegExp(r'^\s*$');
final _goTail = RegExp(r'^\s*(\d+)?\s*;?\s*$');
final _lineComment = RegExp(r'--.*$');

List<Statement> _splitBatches(String sql) {
  final tokens = tokenize(sql, 'mssql');
  final out = <Statement>[];
  var segStart = 0;
  var segTok = 0;
  for (var k = 0; k < tokens.length; k++) {
    final t = tokens[k];
    if (t.kind != TokenKind.word || t.upper != 'GO') continue;
    final lineStart = (t.start > 0 ? sql.lastIndexOf('\n', t.start - 1) : -1) + 1;
    var lineEnd = sql.indexOf('\n', t.end);
    if (lineEnd < 0) lineEnd = sql.length;
    final before = sql.substring(lineStart, t.start);
    final after = sql.substring(t.end, lineEnd).replaceFirst(_lineComment, '');
    if (!_blank.hasMatch(before) || !_goTail.hasMatch(after)) continue;
    _pushStatement(out, sql, segStart, lineStart, tokens, segTok, k);
    segStart = lineEnd;
    while (k + 1 < tokens.length && tokens[k + 1].start < lineEnd) {
      k++;
    }
    segTok = k + 1;
  }
  _pushStatement(out, sql, segStart, sql.length, tokens, segTok, tokens.length);
  return out;
}

const _blockCreate = {'PROCEDURE', 'FUNCTION', 'TRIGGER', 'EVENT', 'PACKAGE'};
const _notBlockAfterBegin = {'TRANSACTION', 'WORK', 'DEFERRED', 'IMMEDIATE', 'EXCLUSIVE', 'TRAN', 'DISTRIBUTED'};

List<Statement> _splitBySemicolon(String sql, SqlDialect d) {
  final tokens = tokenize(sql, d);
  final out = <Statement>[];
  var delimiter = ';';
  var segStart = 0;
  var segTok = 0;
  // BEGIN…END gövdeli CREATE PROCEDURE/FUNCTION/TRIGGER içinde ";" ifadeyi bitirmez
  var words = <String>[];
  var blockDepth = 0;
  var isBlockCreate = false;

  String? nextWord(int k) {
    for (var j = k + 1; j < tokens.length; j++) {
      final t = tokens[j];
      if (t.kind == TokenKind.ws || t.kind == TokenKind.comment) continue;
      return t.kind == TokenKind.word ? t.upper : sql.substring(t.start, t.end);
    }
    return null;
  }

  void resetSeg(int endPos, int nextTok) {
    segStart = endPos;
    segTok = nextTok;
    words = [];
    blockDepth = 0;
    isBlockCreate = false;
  }

  for (var k = 0; k < tokens.length; k++) {
    final t = tokens[k];
    if (t.kind == TokenKind.ws || t.kind == TokenKind.comment || t.kind == TokenKind.string || t.kind == TokenKind.qident) continue;

    // MySQL istemci komutu: DELIMITER <ayraç> (satır başında, ifade dışında)
    if (d == 'mysql' && t.kind == TokenKind.word && t.upper == 'DELIMITER' && words.isEmpty) {
      final lineStart = (t.start > 0 ? sql.lastIndexOf('\n', t.start - 1) : -1) + 1;
      if (_blank.hasMatch(sql.substring(lineStart, t.start))) {
        var lineEnd = sql.indexOf('\n', t.end);
        if (lineEnd < 0) lineEnd = sql.length;
        final delim = sql.substring(t.end, lineEnd).trim();
        if (delim.isNotEmpty) delimiter = delim;
        var j = k;
        while (j + 1 < tokens.length && tokens[j + 1].start < lineEnd) {
          j++;
        }
        resetSeg(lineEnd, j + 1);
        k = j;
        continue;
      }
    }

    if (t.kind == TokenKind.word) {
      final w = t.upper!;
      if (words.length < 8) {
        words.add(w);
        if (words[0] == 'CREATE' && _blockCreate.contains(w)) isBlockCreate = true;
      }
      if (isBlockCreate && delimiter == ';') {
        if (w == 'BEGIN') {
          final nw = nextWord(k);
          if (!(nw != null && (_notBlockAfterBegin.contains(nw) || nw == ';'))) blockDepth++;
        } else if (w == 'CASE' && blockDepth > 0) {
          blockDepth++;
        } else if (w == 'END' && blockDepth > 0) {
          final nw = nextWord(k);
          if (!(nw != null && const ['IF', 'LOOP', 'WHILE', 'REPEAT', 'FOR'].contains(nw))) blockDepth--;
        }
      }
      continue;
    }

    // Ayraç kontrolü
    if (delimiter == ';') {
      if (t.kind == TokenKind.punct && sql[t.start] == ';' && blockDepth == 0) {
        _pushStatement(out, sql, segStart, t.start, tokens, segTok, k);
        resetSeg(t.end, k + 1);
      }
    } else if (sql.startsWith(delimiter, t.start)) {
      final endPos = t.start + delimiter.length;
      _pushStatement(out, sql, segStart, t.start, tokens, segTok, k);
      var j = k;
      while (j + 1 < tokens.length && tokens[j + 1].start < endPos) {
        j++;
      }
      resetSeg(endPos, j + 1);
      k = j;
    }
  }
  _pushStatement(out, sql, segStart, sql.length, tokens, segTok, tokens.length);
  return out;
}

/// İmlecin bulunduğu ifade (seçim yoksa)
Statement? statementAt(String sql, SqlDialect d, int pos) {
  final list = splitStatements(sql, d);
  if (list.isEmpty) return null;
  for (final s in list) {
    if (pos >= s.start && pos <= s.end) return s;
  }
  // İfadeler arasındaysa: bir önceki ifade
  Statement? best;
  for (final s in list) {
    if (s.end <= pos) best = s;
  }
  return best ?? list[0];
}
