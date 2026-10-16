// Lehçe farkları: tanımlayıcı tırnaklama, metin sabitleri, satır sınırı sözdizimi — masaüstü core/sql/dialect.ts birebir.
import 'sql_lexer.dart';

class TableRef {
  const TableRef({this.database, this.schema, required this.name});
  final String? database, schema;
  final String name;
}

String quoteIdent(String name, SqlDialect d) => switch (d) {
      'mysql' => '`${name.replaceAll('`', '``')}`',
      'mssql' => '[${name.replaceAll(']', ']]')}]',
      _ => '"${name.replaceAll('"', '""')}"',
    };

final _plainCi = RegExp(r'^[A-Za-z_][A-Za-z0-9_]*$'), _plainLower = RegExp(r'^[a-z_][a-z0-9_]*$');

/// Sade adları (küçük harf/rakam/_) tırnaksız bırakır; okunur SQL üretmek için.
String ident(String name, SqlDialect d) {
  final plain = d == 'mssql' || d == 'mysql' ? _plainCi : _plainLower;
  return plain.hasMatch(name) && !isReserved(name) ? name : quoteIdent(name, d);
}

String qualified(TableRef t, SqlDialect d) {
  final parts = <String>[];
  if ((d == 'mssql' || d == 'duckdb') && t.database != null && t.database!.isNotEmpty) {
    parts.add(ident(t.database!, d));
    parts.add(t.schema != null && t.schema!.isNotEmpty ? ident(t.schema!, d) : '');
  } else if (d == 'mysql') {
    // MySQL'de şema = veritabanı
    final db = t.schema ?? t.database;
    if (db != null && db.isNotEmpty) parts.add(ident(db, d));
  } else if (t.schema != null && t.schema!.isNotEmpty) {
    parts.add(ident(t.schema!, d));
  }
  parts.add(ident(t.name, d));
  return parts.join('.');
}

final _nonAscii = RegExp(r'[^\x00-\x7f]');

String literal(String v, SqlDialect d) {
  final body = v.replaceAll("'", "''");
  if (d == 'mysql') return "'${body.replaceAll('\\', '\\\\')}'";
  if (d == 'mssql' && _nonAscii.hasMatch(v)) return "N'$body'";
  return "'$body'";
}

/// İfadeyi ilk n satırla sınırlar (yalnızca SELECT için kullanılır): (top, tail)
(String, String) limitClause(int n, SqlDialect d) => d == 'mssql' ? ('TOP ($n) ', '') : ('', '\nLIMIT $n');

// Kısa ayrılmış sözcük listesi: bunlar tırnaklanarak yazılır
final _reserved = ('all and any as asc between by case check column constraint create cross current_date current_time current_user default '
        'delete desc distinct drop else end except exists false fetch for foreign from full grant group having in index inner insert '
        'intersect into is join key left like limit natural not null offset on or order outer primary references right select '
        'session_user set some table then to top true union unique update user using values view when where with')
    .split(' ')
    .toSet();
bool isReserved(String w) => _reserved.contains(w.toLowerCase());
