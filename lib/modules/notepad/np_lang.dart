// Dil algılama (uzantı, dosya adı, ilk satır — project.js languageFor) ve editör renk temaları (themes.js NP_THEMES).
// Monaco dil kimliği → re_highlight sözdizimi modu eşlemesi; tema → re_highlight stil haritası.
import 'package:flutter/material.dart';
import 'package:re_highlight/languages/bash.dart';
import 'package:re_highlight/languages/c.dart';
import 'package:re_highlight/languages/cpp.dart';
import 'package:re_highlight/languages/csharp.dart';
import 'package:re_highlight/languages/css.dart';
import 'package:re_highlight/languages/dart.dart';
import 'package:re_highlight/languages/delphi.dart';
import 'package:re_highlight/languages/dockerfile.dart';
import 'package:re_highlight/languages/dos.dart';
import 'package:re_highlight/languages/go.dart';
import 'package:re_highlight/languages/graphql.dart';
import 'package:re_highlight/languages/handlebars.dart';
import 'package:re_highlight/languages/ini.dart';
import 'package:re_highlight/languages/java.dart';
import 'package:re_highlight/languages/javascript.dart';
import 'package:re_highlight/languages/json.dart';
import 'package:re_highlight/languages/kotlin.dart';
import 'package:re_highlight/languages/less.dart';
import 'package:re_highlight/languages/lua.dart';
import 'package:re_highlight/languages/markdown.dart';
import 'package:re_highlight/languages/objectivec.dart';
import 'package:re_highlight/languages/perl.dart';
import 'package:re_highlight/languages/pgsql.dart';
import 'package:re_highlight/languages/php.dart';
import 'package:re_highlight/languages/plaintext.dart';
import 'package:re_highlight/languages/powershell.dart';
import 'package:re_highlight/languages/python.dart';
import 'package:re_highlight/languages/r.dart';
import 'package:re_highlight/languages/ruby.dart';
import 'package:re_highlight/languages/rust.dart';
import 'package:re_highlight/languages/scss.dart';
import 'package:re_highlight/languages/sql.dart';
import 'package:re_highlight/languages/swift.dart';
import 'package:re_highlight/languages/twig.dart';
import 'package:re_highlight/languages/typescript.dart';
import 'package:re_highlight/languages/vbnet.dart';
import 'package:re_highlight/languages/xml.dart';
import 'package:re_highlight/languages/yaml.dart';
import 'package:re_highlight/re_highlight.dart';
import 'package:re_highlight/styles/a11y-dark.dart';
import 'package:re_highlight/styles/vs.dart';
import 'package:re_highlight/styles/vs2015.dart';

import '../../core/theme.dart';

/// Monaco dil kimliği → re_highlight modu
Mode npModeFor(String lang) => switch (lang) {
      'bat' => langDos, 'c' => langC, 'cpp' => langCpp, 'csharp' => langCsharp, 'css' => langCss, 'dart' => langDart,
      'dockerfile' => langDockerfile, 'go' => langGo, 'graphql' => langGraphql, 'handlebars' => langHandlebars, 'html' => langXml,
      'ini' => langIni, 'java' => langJava, 'javascript' => langJavascript, 'json' => langJson, 'kotlin' => langKotlin, 'less' => langLess,
      'lua' => langLua, 'markdown' => langMarkdown, 'mysql' => langSql, 'objective-c' => langObjectivec, 'pascal' => langDelphi, 'perl' => langPerl,
      'pgsql' => langPgsql, 'php' => langPhp, 'powershell' => langPowershell, 'python' => langPython, 'r' => langR, 'razor' => langXml,
      'ruby' => langRuby, 'rust' => langRust, 'scss' => langScss, 'shell' => langBash, 'sql' => langSql, 'swift' => langSwift, 'twig' => langTwig,
      'typescript' => langTypescript, 'vb' => langVbnet, 'xml' => langXml, 'yaml' => langYaml, _ => langPlaintext };

const _extMap = <String, String>{
  'bat': 'bat', 'cmd': 'bat', 'c': 'c', 'h': 'c', 'cpp': 'cpp', 'cc': 'cpp', 'cxx': 'cpp', 'hpp': 'cpp', 'hh': 'cpp', 'cs': 'csharp', 'css': 'css',
  'dart': 'dart', 'dockerfile': 'dockerfile', 'go': 'go', 'graphql': 'graphql', 'gql': 'graphql', 'hbs': 'handlebars', 'handlebars': 'handlebars',
  'html': 'html', 'htm': 'html', 'xhtml': 'html', 'tpl': 'html', 'vue': 'html', 'ini': 'ini', 'cfg': 'ini', 'conf': 'ini', 'env': 'ini', 'properties': 'ini',
  'java': 'java', 'js': 'javascript', 'mjs': 'javascript', 'cjs': 'javascript', 'jsx': 'javascript', 'json': 'json', 'jsonc': 'json', 'webmanifest': 'json',
  'kt': 'kotlin', 'kts': 'kotlin', 'less': 'less', 'lua': 'lua', 'md': 'markdown', 'markdown': 'markdown', 'm': 'objective-c', 'mm': 'objective-c',
  'pas': 'pascal', 'pp': 'pascal', 'pl': 'perl', 'pm': 'perl', 'php': 'php', 'phtml': 'php', 'inc': 'php', 'php4': 'php', 'php5': 'php',
  'ps1': 'powershell', 'psm1': 'powershell', 'py': 'python', 'pyw': 'python', 'r': 'r', 'cshtml': 'razor', 'rb': 'ruby', 'erb': 'ruby', 'rs': 'rust',
  'scss': 'scss', 'sh': 'shell', 'bash': 'shell', 'zsh': 'shell', 'sql': 'sql', 'swift': 'swift', 'twig': 'twig', 'ts': 'typescript', 'tsx': 'typescript',
  'vb': 'vb', 'xml': 'xml', 'xsl': 'xml', 'xsd': 'xml', 'svg': 'xml', 'plist': 'xml', 'csproj': 'xml', 'yml': 'yaml', 'yaml': 'yaml', 'txt': 'plaintext', 'log': 'plaintext',
};
const _nameMap = <String, String>{
  '.htaccess': 'ini', '.env': 'ini', '.bashrc': 'shell', '.profile': 'shell', '.zshrc': 'shell', 'makefile': 'plaintext', 'nginx.conf': 'ini',
  'dockerfile': 'dockerfile', 'composer.json': 'json', 'package.json': 'json', '.gitignore': 'plaintext',
};

/// Dosya yolu ve ilk satırdan Monaco dil kimliği (Notepad++ "Dil" menüsü)
String npLanguageFor(String path, [String firstLine = '']) {
  final s = path.replaceAll('\\', '/');
  final name = (s.contains('/') ? s.substring(s.lastIndexOf('/') + 1) : s).toLowerCase();
  if (_nameMap.containsKey(name)) return _nameMap[name]!;
  final parts = name.split('.');
  for (var i = 1; i < parts.length; i++) {
    final ext = parts.sublist(i).join('.');
    if (_extMap.containsKey(ext)) return _extMap[ext]!;
  }
  final l = firstLine;
  if (RegExp(r'^#!.*\b(ba|z|k)?sh\b').hasMatch(l)) return 'shell';
  if (RegExp(r'^#!.*\bpython').hasMatch(l)) return 'python';
  if (RegExp(r'^#!.*\b(node|deno)\b').hasMatch(l)) return 'javascript';
  if (RegExp(r'^#!.*\bperl\b').hasMatch(l)) return 'perl';
  if (RegExp(r'^#!.*\bruby\b').hasMatch(l)) return 'ruby';
  if (l.startsWith('<?php')) return 'php';
  if (l.startsWith('<?xml')) return 'xml';
  if (RegExp(r'^<!doctype html', caseSensitive: false).hasMatch(l)) return 'html';
  return 'plaintext';
}

/// Editör renk teması (themes.js NP_THEMES): editör zemini, yazı, satır vurgusu, seçim, satır numarası + sözdizimi renkleri
class NpTheme {
  const NpTheme({required this.dark, required this.bg, required this.fg, required this.line, required this.sel, required this.word, required this.cursor,
      required this.lineNo, required this.ws, required this.widget, required this.comment, required this.keyword, required this.string,
      required this.number, required this.type, required this.func, required this.delim, required this.tag, required this.attr, required this.regexp,
      this.styles});
  final bool dark;
  final Color bg, fg, line, sel, word, cursor, lineNo, ws, widget, comment, keyword, string, number, type, func, delim, tag, attr, regexp;
  final Map<String, TextStyle>? styles; // hazır re_highlight stili (vs-dark, vs, hc-black)

  Map<String, TextStyle> get highlight => styles ?? {
        'root': TextStyle(color: fg, backgroundColor: bg),
        'comment': TextStyle(color: comment, fontStyle: FontStyle.italic), 'quote': TextStyle(color: comment, fontStyle: FontStyle.italic),
        'keyword': TextStyle(color: keyword), 'doctag': TextStyle(color: keyword), 'formula': TextStyle(color: keyword), 'literal': TextStyle(color: number),
        'string': TextStyle(color: string), 'addition': TextStyle(color: string), 'meta-string': TextStyle(color: string), 'regexp': TextStyle(color: regexp),
        'number': TextStyle(color: number), 'symbol': TextStyle(color: number), 'bullet': TextStyle(color: number), 'link': TextStyle(color: string),
        'type': TextStyle(color: type), 'built_in': TextStyle(color: type), 'class': TextStyle(color: type), 'title.class_': TextStyle(color: type),
        'title': TextStyle(color: func), 'title.function_': TextStyle(color: func), 'function': TextStyle(color: func), 'section': TextStyle(color: func),
        'variable': TextStyle(color: fg), 'template-variable': TextStyle(color: attr), 'params': TextStyle(color: fg),
        'attr': TextStyle(color: attr), 'attribute': TextStyle(color: attr), 'property': TextStyle(color: attr), 'selector-attr': TextStyle(color: attr),
        'name': TextStyle(color: tag), 'tag': TextStyle(color: tag), 'selector-tag': TextStyle(color: tag), 'selector-id': TextStyle(color: tag),
        'selector-class': TextStyle(color: type), 'selector-pseudo': TextStyle(color: keyword), 'meta': TextStyle(color: tag), 'meta keyword': TextStyle(color: tag),
        'punctuation': TextStyle(color: delim), 'operator': TextStyle(color: delim), 'subst': TextStyle(color: fg), 'deletion': TextStyle(color: regexp),
        'emphasis': const TextStyle(fontStyle: FontStyle.italic), 'strong': const TextStyle(fontWeight: FontWeight.bold),
      };
}

const kNpThemeData = <String, NpTheme>{
  'mastertool-dark': NpTheme(dark: true, bg: Color(0xFF0B0F17), fg: Color(0xFFE6EDF6), line: Color(0xFF141B28), sel: Color(0x4022D3EE), word: Color(0x406366F1),
      cursor: Color(0xFF22D3EE), lineNo: Color(0xFF4B5870), ws: Color(0xFF243047), widget: Color(0xFF141B28), comment: Color(0xFF6F7D93), keyword: Color(0xFFA78BFA),
      string: Color(0xFF5EEAD4), number: Color(0xFFFBBF24), type: Color(0xFF22D3EE), func: Color(0xFF93C5FD), delim: Color(0xFFA5B2C6), tag: Color(0xFFF472B6),
      attr: Color(0xFFFBBF24), regexp: Color(0xFFFB923C)),
  'mastertool-light': NpTheme(dark: false, bg: Color(0xFFFFFFFF), fg: Color(0xFF0F172A), line: Color(0xFFF1F5F9), sel: Color(0x330891B2), word: Color(0x224F46E5),
      cursor: Color(0xFF0891B2), lineNo: Color(0xFF9AA5B5), ws: Color(0xFFD9E0EA), widget: Color(0xFFF8FAFC), comment: Color(0xFF7B8799), keyword: Color(0xFF6D28D9),
      string: Color(0xFF0F766E), number: Color(0xFFB45309), type: Color(0xFF0E7490), func: Color(0xFF1D4ED8), delim: Color(0xFF475569), tag: Color(0xFFBE185D),
      attr: Color(0xFFB45309), regexp: Color(0xFFC2410C)),
  'obsidian': NpTheme(dark: true, bg: Color(0xFF293134), fg: Color(0xFFE0E2E4), line: Color(0xFF2F393C), sel: Color(0xFF4F5B62), word: Color(0xFF3C4A50),
      cursor: Color(0xFFE0E2E4), lineNo: Color(0xFF81969A), ws: Color(0xFF3F4B4E), widget: Color(0xFF2F393C), comment: Color(0xFF66747B), keyword: Color(0xFF93C763),
      string: Color(0xFFEC7600), number: Color(0xFFFFCD22), type: Color(0xFF678CB1), func: Color(0xFFA082BD), delim: Color(0xFFE8E2B7), tag: Color(0xFF93C763),
      attr: Color(0xFF678CB1), regexp: Color(0xFFD39745)),
  'monokai': NpTheme(dark: true, bg: Color(0xFF272822), fg: Color(0xFFF8F8F2), line: Color(0xFF3E3D32), sel: Color(0xFF49483E), word: Color(0xFF49483E),
      cursor: Color(0xFFF8F8F0), lineNo: Color(0xFF90908A), ws: Color(0xFF464741), widget: Color(0xFF1E1F1C), comment: Color(0xFF75715E), keyword: Color(0xFFF92672),
      string: Color(0xFFE6DB74), number: Color(0xFFAE81FF), type: Color(0xFF66D9EF), func: Color(0xFFA6E22E), delim: Color(0xFFF8F8F2), tag: Color(0xFFF92672),
      attr: Color(0xFFA6E22E), regexp: Color(0xFFE6DB74)),
  'solarized-light': NpTheme(dark: false, bg: Color(0xFFFDF6E3), fg: Color(0xFF657B83), line: Color(0xFFEEE8D5), sel: Color(0xFFEEE8D5), word: Color(0xFFE4DDC8),
      cursor: Color(0xFF657B83), lineNo: Color(0xFF93A1A1), ws: Color(0xFFE4DDC8), widget: Color(0xFFEEE8D5), comment: Color(0xFF93A1A1), keyword: Color(0xFF859900),
      string: Color(0xFF2AA198), number: Color(0xFFD33682), type: Color(0xFFB58900), func: Color(0xFF268BD2), delim: Color(0xFF657B83), tag: Color(0xFF268BD2),
      attr: Color(0xFF93A1A1), regexp: Color(0xFFDC322F)),
  'vs-dark': NpTheme(dark: true, bg: Color(0xFF1E1E1E), fg: Color(0xFFD4D4D4), line: Color(0xFF282828), sel: Color(0xFF264F78), word: Color(0xFF3A3D41),
      cursor: Color(0xFFAEAFAD), lineNo: Color(0xFF858585), ws: Color(0xFF404040), widget: Color(0xFF252526), comment: Color(0xFF6A9955), keyword: Color(0xFF569CD6),
      string: Color(0xFFCE9178), number: Color(0xFFB5CEA8), type: Color(0xFF4EC9B0), func: Color(0xFFDCDCAA), delim: Color(0xFFD4D4D4), tag: Color(0xFF569CD6),
      attr: Color(0xFF9CDCFE), regexp: Color(0xFFD16969), styles: vs2015Theme),
  'vs': NpTheme(dark: false, bg: Color(0xFFFFFFFF), fg: Color(0xFF000000), line: Color(0xFFF3F3F3), sel: Color(0xFFADD6FF), word: Color(0xFFE8E8E8),
      cursor: Color(0xFF000000), lineNo: Color(0xFF237893), ws: Color(0xFFD3D3D3), widget: Color(0xFFF3F3F3), comment: Color(0xFF008000), keyword: Color(0xFF0000FF),
      string: Color(0xFFA31515), number: Color(0xFF098658), type: Color(0xFF267F99), func: Color(0xFF795E26), delim: Color(0xFF000000), tag: Color(0xFF800000),
      attr: Color(0xFFFF0000), regexp: Color(0xFF811F3F), styles: vsTheme),
  'hc-black': NpTheme(dark: true, bg: Color(0xFF000000), fg: Color(0xFFFFFFFF), line: Color(0xFF0F0F0F), sel: Color(0xFF3A3D41), word: Color(0xFF3A3D41),
      cursor: Color(0xFFFFFFFF), lineNo: Color(0xFFFFFFFF), ws: Color(0xFF7C7C7C), widget: Color(0xFF0C141F), comment: Color(0xFF7CA668), keyword: Color(0xFF569CD6),
      string: Color(0xFFCE9178), number: Color(0xFFB5CEA8), type: Color(0xFF4EC9B0), func: Color(0xFFDCDCAA), delim: Color(0xFFFFFFFF), tag: Color(0xFF569CD6),
      attr: Color(0xFF9CDCFE), regexp: Color(0xFFD16969), styles: a11YDarkTheme),
};

/// "auto": uygulamanın o anki Gece/Gündüz temasına göre Mastertool teması
NpTheme npResolveTheme(BuildContext context, String name) {
  if (name.isEmpty || name == 'auto') return kNpThemeData[MtColors.of(context).isDark ? 'mastertool-dark' : 'mastertool-light']!;
  return kNpThemeData[name] ?? kNpThemeData['mastertool-dark']!;
}
