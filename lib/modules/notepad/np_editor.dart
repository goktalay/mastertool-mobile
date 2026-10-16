// Kod editörü sarmalayıcısı: re_editor CodeEditor + satır numaraları + sözdizimi renklendirme (re_highlight) + Mastertool tarzı
// Bul / Değiştir paneli (ekran 07: sağ üstte kutu; bul girdisi, Aa, .*, "1 / 5", ↑ ↓, değiştir açma, kapat; ikinci satırda değiştir
// girdisi, tek / tümünü değiştir). Tema ve yazı ölçüleri editör ayarlarından gelir.
import 'package:flutter/material.dart';
import 'package:re_editor/re_editor.dart';

import '../../core/l10n/gen/mt_strings.dart';
import '../../core/theme.dart';
import '../../widgets/mt_widgets.dart';
import 'np_lang.dart';

class NpCodeEditor extends StatelessWidget {
  const NpCodeEditor({super.key, required this.controller, required this.findController, required this.scrollController, required this.language,
      required this.theme, required this.editor, this.onChanged, this.focusNode, this.readOnly = false});
  final CodeLineEditingController controller;
  final CodeFindController findController;
  final CodeScrollController scrollController;
  final String language;
  final NpTheme theme;
  final Map<String, dynamic> editor;
  final ValueChanged<CodeLineEditingValue>? onChanged;
  final FocusNode? focusNode;
  final bool readOnly;

  @override
  Widget build(BuildContext context) {
    final t = theme;
    final fontSize = ((editor['fontSize'] as num?)?.toDouble() ?? 14).clamp(6, 48).toDouble();
    final lineNumbers = editor['lineNumbers'] != false;
    final mono = MtText.mono.fontFamily;
    return Container(
      color: t.bg,
      child: CodeEditor(
        controller: controller,
        findController: findController,
        scrollController: scrollController,
        focusNode: focusNode,
        readOnly: readOnly,
        wordWrap: editor['wordWrap'] == true,
        autocompleteSymbols: editor['autoClose'] != false,
        onChanged: onChanged,
        padding: const EdgeInsets.fromLTRB(10, 8, 10, 8),
        style: CodeEditorStyle(
          fontSize: fontSize, fontFamily: mono, fontHeight: 1.45, textColor: t.fg, backgroundColor: t.bg, cursorColor: t.cursor,
          cursorLineColor: editor['highlightLine'] != false ? t.line : null, selectionColor: t.sel, highlightColor: t.word, hintTextColor: t.lineNo,
          chunkIndicatorColor: t.lineNo,
          codeTheme: CodeHighlightTheme(languages: {language: CodeHighlightThemeMode(mode: npModeFor(language))}, theme: t.highlight),
        ),
        indicatorBuilder: lineNumbers
            ? (context, editingController, chunkController, notifier) => Row(children: [
                  DefaultCodeLineNumber(controller: editingController, notifier: notifier, minNumberCount: 3,
                      textStyle: TextStyle(color: t.lineNo, fontSize: fontSize, fontFamily: mono, height: 1.45),
                      focusedTextStyle: TextStyle(color: t.fg, fontSize: fontSize, fontFamily: mono, height: 1.45)),
                  const SizedBox(width: 10),
                ])
            : null,
        findBuilder: (context, controller, readOnly) => NpFindPanel(controller: controller, readOnly: readOnly, theme: t),
      ),
    );
  }
}

class NpFindPanel extends StatelessWidget implements PreferredSizeWidget {
  const NpFindPanel({super.key, required this.controller, required this.readOnly, required this.theme});
  final CodeFindController controller;
  final bool readOnly;
  final NpTheme theme;

  @override
  Size get preferredSize => Size(double.infinity, controller.value == null ? 0 : (controller.value!.replaceMode ? 78 : 44));

  @override
  Widget build(BuildContext context) {
    final v = controller.value;
    if (v == null) return const SizedBox.shrink();
    final s = MtStrings.of(context);
    final c = MtColors.of(context);
    final res = v.result;
    final count = res == null ? '—' : '${res.index + 1} / ${res.matches.length}';
    Widget toggle(String text, bool on, VoidCallback onTap, {String? tip}) => Tooltip(message: tip ?? text, child: InkWell(
          onTap: onTap, borderRadius: BorderRadius.circular(4),
          child: Container(padding: const EdgeInsets.symmetric(horizontal: 4, vertical: 2), decoration: BoxDecoration(color: on ? c.accent.withValues(alpha: .18) : null, borderRadius: BorderRadius.circular(4)),
              child: Text(text, style: TextStyle(fontSize: 11.5, color: on ? c.accent : c.text3, fontWeight: FontWeight.w600))),
        ));
    Widget field(TextEditingController ctl, FocusNode fn, String hint, {Widget? trailing}) => Expanded(child: Container(
          height: 30, decoration: BoxDecoration(color: c.bg2, border: Border.all(color: c.border), borderRadius: BorderRadius.circular(6)),
          child: Row(children: [
            Expanded(child: TextField(controller: ctl, focusNode: fn, style: MtText.btnSm.copyWith(color: c.text), textDirection: TextDirection.ltr,
                decoration: InputDecoration(hintText: hint, filled: false, isDense: true, border: InputBorder.none, enabledBorder: InputBorder.none, focusedBorder: InputBorder.none,
                    contentPadding: const EdgeInsets.symmetric(horizontal: 8, vertical: 7)))),
            ?trailing,
          ]),
        ));
    return Container(
      margin: const EdgeInsets.only(top: 6, right: 10),
      alignment: Alignment.topRight,
      child: Container(
        width: 420, padding: const EdgeInsets.all(6),
        decoration: BoxDecoration(color: c.surface, border: Border.all(color: c.borderStrong), borderRadius: BorderRadius.circular(8),
            boxShadow: [BoxShadow(color: c.shadow, blurRadius: 14, offset: const Offset(0, 6))]),
        child: Column(mainAxisSize: MainAxisSize.min, children: [
          Row(children: [
            MtIconButton(icon: v.replaceMode ? Icons.expand_more : Icons.chevron_right, size: 20, onPressed: readOnly ? null : controller.toggleMode, tooltip: s.npProjReplace),
            field(controller.findInputController, controller.findInputFocusNode, s.npProjFind, trailing: Padding(padding: const EdgeInsets.only(right: 4), child: Row(mainAxisSize: MainAxisSize.min, children: [
              toggle('Aa', v.option.caseSensitive, controller.toggleCaseSensitive),
              const SizedBox(width: 2),
              toggle('.*', v.option.regex, controller.toggleRegex),
            ]))),
            const SizedBox(width: 8),
            SizedBox(width: 52, child: Text(count, style: MtText.tiny.copyWith(color: c.text2), textAlign: TextAlign.center)),
            MtIconButton(icon: Icons.arrow_upward, size: 20, onPressed: res == null ? null : controller.previousMatch),
            MtIconButton(icon: Icons.arrow_downward, size: 20, onPressed: res == null ? null : controller.nextMatch),
            MtIconButton(icon: Icons.close, size: 20, onPressed: controller.close),
          ]),
          if (v.replaceMode) ...[
            const SizedBox(height: 4),
            Row(children: [
              const SizedBox(width: 28),
              field(controller.replaceInputController, controller.replaceInputFocusNode, s.npProjReplace),
              const SizedBox(width: 8),
              MtButton(label: s.npProjReplace, small: true, onPressed: res == null ? null : controller.replaceMatch),
              const SizedBox(width: 6),
              MtIconButton(icon: Icons.done_all, size: 20, tooltip: s.npMobReplaceAll, onPressed: res == null ? null : controller.replaceAllMatches),
            ]),
          ],
        ]),
      ),
    );
  }
}
