// SQL Master ayarları (senkron öğesi "settings"): sorgu satır sınırı, tablo önizleme satırı, editör yazı boyutu.
// appTheme / language masaüstüne ait alanlardır; korunur, burada gösterilmez.
import 'package:flutter/material.dart';

import '../../core/l10n/gen/mt_strings.dart';
import '../../core/sync.dart';
import '../../core/theme.dart';
import '../../widgets/mt_widgets.dart';
import 'sql_model.dart';
import 'sql_texts.dart';

class SqlSettingsScreen extends StatefulWidget {
  const SqlSettingsScreen({super.key, required this.engine});
  final SyncEngine engine;
  @override
  State<SqlSettingsScreen> createState() => _SqlSettingsScreenState();
}

class _SqlSettingsScreenState extends State<SqlSettingsScreen> {
  late final Map<String, dynamic> _raw = {...SqlSettings.blank(), ...?widget.engine.library.items['settings']?.$2};
  late final _st = SqlSettings(_raw);
  late final _rows = TextEditingController(text: _st.rowLimit.toString());
  late final _prev = TextEditingController(text: _st.previewRows.toString());
  late double _font = _st.editorFontSize;

  @override
  void dispose() {
    _rows.dispose();
    _prev.dispose();
    super.dispose();
  }

  Future<void> _save() async {
    final data = {..._raw, 'rowLimit': (int.tryParse(_rows.text.trim()) ?? 10000).clamp(100, 1000000), 'previewRows': (int.tryParse(_prev.text.trim()) ?? 100).clamp(10, 100000), 'editorFontSize': _font.round()};
    widget.engine.library.items['settings'] = ('settings', data);
    await widget.engine.onLocalChange();
    if (mounted) Navigator.of(context).pop(true);
  }

  @override
  Widget build(BuildContext context) {
    final s = MtStrings.of(context);
    final c = MtColors.of(context);
    return Scaffold(
      backgroundColor: c.surface,
      appBar: AppBar(backgroundColor: c.surface, title: Text(SqTxt.settingsTitle, style: MtText.h2.copyWith(color: c.text))),
      body: SafeArea(child: Center(child: ConstrainedBox(constraints: const BoxConstraints(maxWidth: 560), child: ListView(padding: const EdgeInsets.fromLTRB(22, 18, 22, 24), children: [
        MtSectionTitle(s.sqAppSettings),
        const SizedBox(height: 12),
        MtField(label: SqTxt.rowLimit, child: TextField(controller: _rows, keyboardType: TextInputType.number)),
        const SizedBox(height: 14),
        MtField(label: SqTxt.previewRows, child: TextField(controller: _prev, keyboardType: TextInputType.number)),
        const SizedBox(height: 14),
        MtField(label: '${SqTxt.editorFont}: ${_font.round()}', child: Slider(value: _font, min: 9, max: 24, divisions: 15, activeColor: c.accent, onChanged: (v) => setState(() => _font = v))),
        const SizedBox(height: 18),
        Row(children: [
          const Spacer(),
          MtButton(label: s.commonCancel, onPressed: () => Navigator.of(context).pop()),
          const SizedBox(width: 8),
          MtButton(label: s.commonSave, kind: MtBtnKind.primary, onPressed: _save),
        ]),
      ])))),
    );
  }
}
