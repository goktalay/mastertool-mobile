// Lehçeye duyarlı, hafif SQL tarayıcısı — masaüstü sqlmaster/src/core/sql/lexer.ts ile BİREBİR. Ayrıştırıcı değildir:
// yalnızca metin/tanımlayıcı/yorum sınırlarını doğru bulur ki ifade bölme ve salt okunur sınıflandırması tırnak
// içindeki ";" ya da "DELETE"e aldanmasın.

/// Lehçe: postgres | mssql | mysql | sqlite | duckdb
typedef SqlDialect = String;

enum TokenKind { ws, comment, string, qident, word, number, punct, param }

class Token {
  Token(this.kind, this.start, this.end, {this.upper});
  final TokenKind kind;
  final int start, end;
  /// word için büyük harfe çevrilmiş metin
  final String? upper;
}

bool _isWordStart(int c) => (c >= 65 && c <= 90) || (c >= 97 && c <= 122) || c == 95 || c >= 0x80;
bool _isWordChar(int c) => _isWordStart(c) || (c >= 48 && c <= 57) || c == 36;
bool _isDigit(int c) => c >= 48 && c <= 57;
bool _isSpace(int c) => c == 32 || c == 9 || c == 10 || c == 13 || c == 12 || c == 11 || c == 0xA0 || c == 0xFEFF || c == 0x2028 || c == 0x2029 || c == 0x1680 || (c >= 0x2000 && c <= 0x200A) || c == 0x202F || c == 0x205F || c == 0x3000;
bool _isNumChar(int c) => _isDigit(c) || c == 46 || c == 101 || c == 69 || c == 95 || c == 120 || c == 88 || (c >= 97 && c <= 102) || (c >= 65 && c <= 70);
final _dollarTag = RegExp(r'^\$([A-Za-z_][A-Za-z0-9_]*)?\$');

/// JS `/\s/` eşdeğeri
bool isSqlSpace(String ch) => ch.isNotEmpty && _isSpace(ch.codeUnitAt(0));

List<Token> tokenize(String sql, SqlDialect d) {
  final out = <Token>[];
  final n = sql.length;
  var i = 0;
  void push(TokenKind kind, int start, int end) => out.add(Token(kind, start, end, upper: kind == TokenKind.word ? sql.substring(start, end).toUpperCase() : null));
  int cu(int k) => k < n ? sql.codeUnitAt(k) : -1;

  // Tırnaklı bölge: kapanış karakterine kadar; çift kapanış kaçış sayılır, backslash isteğe bağlı
  int quoted(int start, int close, bool backslash) {
    var j = start + 1;
    while (j < n) {
      final c = sql.codeUnitAt(j);
      if (backslash && c == 92) { j += 2; continue; }
      if (c == close) {
        if (cu(j + 1) == close) { j += 2; continue; }
        return j + 1;
      }
      j++;
    }
    return n;
  }

  while (i < n) {
    final c = sql.codeUnitAt(i);
    final c2 = cu(i + 1);

    if (c == 32 || c == 9 || c == 10 || c == 13 || c == 12) {
      var j = i + 1;
      while (j < n && _isSpace(sql.codeUnitAt(j))) {
        j++;
      }
      push(TokenKind.ws, i, j); i = j; continue;
    }
    // -- satır yorumu (MySQL'de ayrıca #)
    if ((c == 45 && c2 == 45) || (c == 35 && d == 'mysql')) {
      var j = i + 1;
      while (j < n && sql.codeUnitAt(j) != 10) {
        j++;
      }
      push(TokenKind.comment, i, j); i = j; continue;
    }
    // /* blok yorumu */ (PostgreSQL ve DuckDB iç içe yorumlara izin verir)
    if (c == 47 && c2 == 42) {
      final nested = d == 'postgres' || d == 'duckdb';
      var depth = 1;
      var j = i + 2;
      while (j < n && depth > 0) {
        if (sql.codeUnitAt(j) == 42 && cu(j + 1) == 47) { depth--; j += 2; continue; }
        if (nested && sql.codeUnitAt(j) == 47 && cu(j + 1) == 42) { depth++; j += 2; continue; }
        j++;
      }
      push(TokenKind.comment, i, j); i = j; continue;
    }
    // E'...' (PostgreSQL backslash kaçışlı metin)
    if ((c == 69 || c == 101) && c2 == 39 && (d == 'postgres' || d == 'duckdb')) {
      final j = quoted(i + 1, 39, true);
      push(TokenKind.string, i, j); i = j; continue;
    }
    // N'...' (SQL Server Unicode metin)
    if ((c == 78 || c == 110) && c2 == 39 && d == 'mssql') {
      final j = quoted(i + 1, 39, false);
      push(TokenKind.string, i, j); i = j; continue;
    }
    if (c == 39) {
      final j = quoted(i, 39, d == 'mysql');
      push(TokenKind.string, i, j); i = j; continue;
    }
    if (c == 34) {
      final j = quoted(i, 34, d == 'mysql');
      push(d == 'mysql' ? TokenKind.string : TokenKind.qident, i, j); i = j; continue;
    }
    if (c == 96 && (d == 'mysql' || d == 'sqlite')) {
      final j = quoted(i, 96, false);
      push(TokenKind.qident, i, j); i = j; continue;
    }
    if (c == 91 && (d == 'mssql' || d == 'sqlite')) {
      final j = quoted(i, 93, false);
      push(TokenKind.qident, i, j); i = j; continue;
    }
    // $etiket$ ... $etiket$ (PostgreSQL / DuckDB); $1 parametre
    if (c == 36 && (d == 'postgres' || d == 'duckdb')) {
      if (_isDigit(c2)) {
        var j = i + 1;
        while (j < n && _isDigit(sql.codeUnitAt(j))) {
          j++;
        }
        push(TokenKind.param, i, j); i = j; continue;
      }
      final m = _dollarTag.firstMatch(sql.substring(i, i + 64 > n ? n : i + 64));
      if (m != null) {
        final tag = m.group(0)!;
        final close = sql.indexOf(tag, i + tag.length);
        final j = close < 0 ? n : close + tag.length;
        push(TokenKind.string, i, j); i = j; continue;
      }
    }
    if (_isWordStart(c)) {
      var j = i + 1;
      while (j < n && _isWordChar(sql.codeUnitAt(j))) {
        j++;
      }
      push(TokenKind.word, i, j); i = j; continue;
    }
    if (_isDigit(c) || (c == 46 && _isDigit(c2))) {
      var j = i + 1;
      while (j < n && _isNumChar(sql.codeUnitAt(j))) {
        j++;
      }
      push(TokenKind.number, i, j); i = j; continue;
    }
    if ((c == 64 && (d == 'mssql' || d == 'mysql')) || ((c == 58 || c == 63) && d == 'sqlite')) {
      // @değişken (MSSQL/MySQL), :ad / ? parametre
      var j = i + 1;
      while (j < n && (_isWordChar(sql.codeUnitAt(j)) || sql.codeUnitAt(j) == 64)) {
        j++;
      }
      push(TokenKind.param, i, j); i = j; continue;
    }
    push(TokenKind.punct, i, i + 1);
    i++;
  }
  return out;
}

/// Yorum ve boşluk dışındaki belirteçler
List<Token> significant(List<Token> tokens) => tokens.where((t) => t.kind != TokenKind.ws && t.kind != TokenKind.comment).toList();
