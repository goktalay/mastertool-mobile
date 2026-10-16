// Editör ayarları formu (Notepad++ "Tercihler"in karşılığı; masaüstü editorform.js). Genel ayarlar ekranında ve bağlantı formunun
// "Editör (Notepad++)" sekmesinde kullanılır. Bölümler: Kodlama ve satır sonu · Girinti ve dil · Görünüm · Kaydetme.
// Mobilde anlamsız olanlar (mini harita, kenar çizgileri, parantez renkleri, akıllı vurgulama, girinti kılavuzları, kod katlama,
// görünmez karakterler) formda GÖSTERİLMEZ ama veri olarak korunur.
import 'package:flutter/material.dart';

import '../../core/l10n/gen/mt_strings.dart';
import '../../core/theme.dart';
import '../../widgets/mt_widgets.dart';
import 'np_model.dart';
import 'np_textcodec.dart';

class NpEditorForm extends StatefulWidget {
  const NpEditorForm({super.key, required this.values, required this.onChanged, this.enabled = true});
  final Map<String, dynamic> values;
  final ValueChanged<Map<String, dynamic>> onChanged;
  final bool enabled;
  @override
  State<NpEditorForm> createState() => _NpEditorFormState();
}

class _NpEditorFormState extends State<NpEditorForm> {
  late Map<String, dynamic> v = npSanitizeEditor(widget.values);
  late final _tab = TextEditingController(text: v['tabSize'].toString());
  late final _font = TextEditingController(text: v['fontFamily'].toString());
  late final _size = TextEditingController(text: v['fontSize'].toString());
  late final _auto = TextEditingController(text: v['autoSave'].toString());

  void _set(String k, dynamic val) {
    setState(() => v = npSanitizeEditor({...v, k: val}, v));
    widget.onChanged(v);
  }

  void _commitNumbers() {
    v = npSanitizeEditor({...v, 'tabSize': int.tryParse(_tab.text) ?? v['tabSize'], 'fontSize': int.tryParse(_size.text) ?? v['fontSize'],
        'autoSave': int.tryParse(_auto.text) ?? v['autoSave'], 'fontFamily': _font.text}, v);
    widget.onChanged(v);
  }

  @override
  void dispose() {
    _tab.dispose();
    _font.dispose();
    _size.dispose();
    _auto.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final s = MtStrings.of(context);
    final c = MtColors.of(context);
    final wide = MtBreak.wide(context);
    final encs = [for (final e in kNpEncodings) if (npCodecSupported(e.$1) || e.$1 == v['encoding']) e];
    final ansi = [for (final e in encs) if (!e.$1.startsWith('utf')) e];
    final eols = [for (final e in kNpEols) (e.$1, e.$2)];
    Widget sec(IconData i, String t) => Padding(
          padding: const EdgeInsets.only(top: 18, bottom: 10),
          child: Row(children: [Icon(i, size: 14, color: c.accent), const SizedBox(width: 6), Text(t.toUpperCase(), style: MtText.section.copyWith(color: c.text3))]),
        );
    Widget check(String k, String label, [String? hint]) => MtCheck(value: v[k] == true, onChanged: (x) => _set(k, x), label: label, hint: hint);
    Widget num(TextEditingController ctl, {String? suffix}) => Row(children: [
          Expanded(child: TextField(controller: ctl, keyboardType: TextInputType.number, onChanged: (_) => _commitNumbers(), textDirection: TextDirection.ltr)),
          if (suffix != null) ...[const SizedBox(width: 8), Text(suffix, style: MtText.small.copyWith(color: c.text3))],
        ]);

    final body = Column(crossAxisAlignment: CrossAxisAlignment.stretch, children: [
      sec(Icons.layers_outlined, s.npEdSecEncoding),
      _row(wide, [
        MtField(label: s.npEdEncoding, child: _select<String>(v['encoding'], [('auto', s.npEdEncAuto), ...encs], (x) => _set('encoding', x))),
        MtField(label: s.npEdFallback, child: _select<String>(v['fallbackEncoding'], ansi, (x) => _set('fallbackEncoding', x))),
      ]),
      const SizedBox(height: 14),
      _row(wide, [
        MtField(label: s.npEdEol, child: _select<String>(v['eol'], [('auto', s.npEdEolAuto), for (final e in eols) (e.$1, s.npEdEolConvert(e.$2))], (x) => _set('eol', x))),
        MtField(label: s.npEdNewDoc, child: Row(children: [
          Expanded(child: _select<String>(v['newEncoding'], encs, (x) => _set('newEncoding', x))),
          const SizedBox(width: 8),
          Expanded(child: _select<String>(v['newEol'], eols, (x) => _set('newEol', x))),
        ])),
      ]),
      sec(Icons.code, s.npEdSecIndent),
      _row(wide, [
        MtField(label: s.npEdTabSize, child: num(_tab)),
        MtField(label: s.npEdLanguage, child: _select<String>(v['language'], [('auto', s.npEdLangAuto), ...kNpLanguages], (x) => _set('language', x))),
      ]),
      const SizedBox(height: 6),
      _row(wide, [check('insertSpaces', s.npEdInsertSpaces), check('detectIndentation', s.npEdDetectIndent, s.npEdDetectIndentHint)]),
      _row(wide, [check('autoIndent', s.npEdAutoIndent), check('autoClose', s.npEdAutoClose)]),
      sec(Icons.palette_outlined, s.npEdSecLook),
      _row(wide, [
        MtField(label: s.npEdTheme, child: _select<String>(v['theme'], [('auto', s.npEdThemeAuto), ...kNpThemes], (x) => _set('theme', x))),
        MtField(label: s.npEdWhitespace, child: _select<String>(v['renderWhitespace'], [('none', s.npEdWsNone), ('boundary', s.npEdWsBoundary), ('trailing', s.npEdWsTrailing), ('all', s.npEdWsAll)], (x) => _set('renderWhitespace', x))),
      ]),
      const SizedBox(height: 14),
      _row(wide, [
        MtField(label: s.npEdFont, child: TextField(controller: _font, onChanged: (_) => _commitNumbers(), autocorrect: false, textDirection: TextDirection.ltr)),
        MtField(label: s.npEdFontSize, child: num(_size)),
      ], flex: const [3, 1]),
      const SizedBox(height: 6),
      _row(wide, [check('wordWrap', s.npEdWordWrap), check('lineNumbers', s.npEdLineNumbers)]),
      _row(wide, [check('highlightLine', s.npEdHighlightLine), const SizedBox()]),
      sec(Icons.save_outlined, s.npEdSecSave),
      _row(wide, [check('trimTrailing', s.npEdTrimTrailing), check('finalNewline', s.npEdFinalNewline)]),
      check('checkRemoteChange', s.npEdCheckRemote, s.npEdCheckRemoteHint),
      const SizedBox(height: 10),
      _row(wide, [MtField(label: s.npEdAutoSave, hint: s.npEdAutoSaveHint, child: num(_auto, suffix: s.npEdSec)), const SizedBox()]),
    ]);
    return Opacity(opacity: widget.enabled ? 1 : .5, child: IgnorePointer(ignoring: !widget.enabled, child: body));
  }

  Widget _row(bool wide, List<Widget> children, {List<int>? flex}) => wide
      ? Row(crossAxisAlignment: CrossAxisAlignment.start, children: [
          for (var i = 0; i < children.length; i++) ...[if (i > 0) const SizedBox(width: 14), Expanded(flex: flex?[i] ?? 1, child: children[i])],
        ])
      : Column(crossAxisAlignment: CrossAxisAlignment.stretch, children: [
          for (var i = 0; i < children.length; i++) ...[if (i > 0 && children[i] is! SizedBox) const SizedBox(height: 10), children[i]],
        ]);

  Widget _select<T>(T value, List<(T, String)> items, ValueChanged<T> onChanged) {
    final col = MtColors.of(context);
    final has = items.any((x) => x.$1 == value);
    return Container(
      height: MtDim.inputH, padding: const EdgeInsets.symmetric(horizontal: 12),
      decoration: BoxDecoration(color: col.bg2, border: Border.all(color: col.border), borderRadius: BorderRadius.circular(MtDim.radiusSm)),
      child: DropdownButtonHideUnderline(child: DropdownButton<T>(value: has ? value : items.first.$1, isExpanded: true, style: MtText.body.copyWith(color: col.text), dropdownColor: col.surface2,
          items: [for (final it in items) DropdownMenuItem(value: it.$1, child: Text(it.$2, maxLines: 1, overflow: TextOverflow.ellipsis))], onChanged: (x) { if (x != null) onChanged(x); })),
    );
  }
}

/// Genel editör ayarları ekranı (Ayarlar › Editör): settings öğesinin `editor` alanı.
class NpSettingsScreen extends StatefulWidget {
  const NpSettingsScreen({super.key, required this.editor, required this.onSave});
  final Map<String, dynamic> editor;
  final Future<void> Function(Map<String, dynamic> editor) onSave;
  @override
  State<NpSettingsScreen> createState() => _NpSettingsScreenState();
}

class _NpSettingsScreenState extends State<NpSettingsScreen> {
  late Map<String, dynamic> _v = npSanitizeEditor(widget.editor);
  bool _busy = false;

  @override
  Widget build(BuildContext context) {
    final s = MtStrings.of(context);
    final c = MtColors.of(context);
    return Scaffold(
      backgroundColor: c.surface,
      appBar: AppBar(backgroundColor: c.surface, title: Row(children: [Icon(Icons.tune, size: 18, color: c.accent), const SizedBox(width: 8), Text(s.npAppSettings, style: MtText.h2.copyWith(color: c.text))])),
      body: SafeArea(child: Column(children: [
        Expanded(child: Center(child: ConstrainedBox(constraints: const BoxConstraints(maxWidth: 760), child: ListView(padding: const EdgeInsets.fromLTRB(22, 4, 22, 24), children: [
          Text(s.npFormEdGlobal, style: MtText.small.copyWith(color: c.text3)),
          NpEditorForm(values: _v, onChanged: (x) => _v = x),
        ])))),
        Container(
          padding: const EdgeInsets.fromLTRB(22, 14, 22, 18),
          decoration: BoxDecoration(border: Border(top: BorderSide(color: c.border))),
          child: Row(children: [
            const Spacer(),
            MtButton(label: s.commonCancel, onPressed: () => Navigator.of(context).pop()),
            const SizedBox(width: 8),
            MtButton(label: s.commonSave, kind: MtBtnKind.primary, busy: _busy, onPressed: () async {
              setState(() => _busy = true);
              await widget.onSave(_v);
              if (context.mounted) Navigator.of(context).pop(true);
            }),
          ]),
        ),
      ])),
    );
  }
}
