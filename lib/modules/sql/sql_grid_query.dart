// Tablo verisi ızgarasının SQL'i — masaüstü core/sql/gridQuery.ts birebir: kolon gizle/göster, sıralama ve filtreler
// SELECT ifadesine yansır. Arayüz her değişiklikte buildGridSelect() ile SQL'i yeniden üretir, gösterir ve çalıştırır.
import 'sql_dialect.dart';
import 'sql_lexer.dart';

/// Sonuç kolonu
class ColumnMeta {
  const ColumnMeta({required this.name, required this.type, this.numeric = false});
  final String name, type;
  /// Sayısal kolonlar ızgarada sağa yaslanır, filtrelerde tırnaksız yazılır
  final bool numeric;
}

const kFilterOps = ['=', '<>', '<', '>', '<=', '>=', 'contains', 'not contains', 'starts', 'ends', 'like', 'not like', 'in', 'not in', 'is null', 'is not null'];
bool opNeedsValue(String op) => op != 'is null' && op != 'is not null';

class GridFilter {
  GridFilter({required this.column, required this.op, this.value});
  String column, op;
  String? value;
}

class GridSort {
  GridSort({required this.column, required this.dir});
  final String column;
  final String dir; // asc | desc
}

class GridQueryModel {
  GridQueryModel({required this.table, this.columns = const [], this.limit});
  final TableRef table;
  /// Tablodaki tüm kolonlar (sıra korunur)
  List<ColumnMeta> columns;
  final List<String> hidden = [];
  List<GridSort> sort = [];
  List<GridFilter> filters = [];
  /// Serbest WHERE ifadesi (filtrelerle AND'lenir)
  String? where;
  int? limit;
}

String castText(String expr, SqlDialect d) => switch (d) {
      'postgres' || 'duckdb' => 'CAST($expr AS text)',
      'mssql' => 'CAST($expr AS NVARCHAR(4000))',
      'mysql' => 'CAST($expr AS CHAR)',
      _ => 'CAST($expr AS TEXT)',
    };

final _numberLike = RegExp(r'^-?\d+(\.\d+)?([eE][-+]?\d+)?$');
final _boolType = RegExp(r'^bool', caseSensitive: false);
final _boolVal = RegExp(r'^(true|false)$', caseSensitive: false);
final _textType = RegExp(r'char|text|string|clob|uuid|enum|name|json|xml', caseSensitive: false);

/// Filtre değeri: sayısal kolona sayı tırnaksız, diğerleri metin sabiti
String valueSql(String v, ColumnMeta? col, SqlDialect d) {
  if (col != null && col.numeric && _numberLike.hasMatch(v.trim())) return v.trim();
  if (_boolType.hasMatch(col?.type ?? '') && _boolVal.hasMatch(v.trim())) return v.trim().toUpperCase();
  return literal(v, d);
}

String conditionSql(String expr, GridFilter f, ColumnMeta? col, SqlDialect d) {
  final v = f.value ?? '';
  final ci = d == 'postgres' || d == 'duckdb' ? 'ILIKE' : 'LIKE';
  final textExpr = (col != null && col.numeric) || (col != null && !_textType.hasMatch(col.type)) ? castText(expr, d) : expr;
  switch (f.op) {
    case 'is null': return '$expr IS NULL';
    case 'is not null': return '$expr IS NOT NULL';
    case 'contains': return '$textExpr $ci ${literal('%$v%', d)}';
    case 'not contains': return '$textExpr NOT $ci ${literal('%$v%', d)}';
    case 'starts': return '$textExpr $ci ${literal('$v%', d)}';
    case 'ends': return '$textExpr $ci ${literal('%$v', d)}';
    case 'like': return '$textExpr LIKE ${literal(v, d)}';
    case 'not like': return '$textExpr NOT LIKE ${literal(v, d)}';
    case 'in':
    case 'not in':
      final items = v.split(',').map((x) => x.trim()).where((x) => x.isNotEmpty).map((x) => valueSql(x, col, d)).toList();
      return '$expr ${f.op == 'in' ? 'IN' : 'NOT IN'} (${items.isEmpty ? 'NULL' : items.join(', ')})';
    default:
      return '$expr ${f.op} ${valueSql(v, col, d)}';
  }
}

String buildGridSelect(GridQueryModel m, SqlDialect d) {
  final hidden = m.hidden.toSet();
  final visible = m.columns.where((c) => !hidden.contains(c.name)).toList();
  final byName = {for (final c in m.columns) c.name: c};
  final allVisible = visible.length == m.columns.length;
  final lim = m.limit != null && m.limit! > 0 ? limitClause(m.limit!, d) : ('', '');

  final list = allVisible || visible.isEmpty ? '*' : visible.map((c) => ident(c.name, d)).join(', ');
  var sql = 'SELECT ${lim.$1}$list\nFROM ${qualified(m.table, d)}';

  final conds = m.filters
      .where((f) => byName.containsKey(f.column) && (!opNeedsValue(f.op) || (f.value ?? '') != ''))
      .map((f) => conditionSql(ident(f.column, d), f, byName[f.column], d))
      .toList();
  if (m.where != null && m.where!.trim().isNotEmpty) conds.add('(${m.where!.trim()})');
  if (conds.isNotEmpty) sql += '\nWHERE ${conds.join('\n  AND ')}';

  final sorts = m.sort.where((s) => byName.containsKey(s.column)).toList();
  if (sorts.isNotEmpty) sql += '\nORDER BY ${sorts.map((s) => '${ident(s.column, d)}${s.dir == 'desc' ? ' DESC' : ''}').join(', ')}';
  return sql + lim.$2;
}
