// SQL Master bağlantı formu — masaüstü 03-baglanti-formu: 3 sekme Genel (5 motor düğmesi, etiket, sunucu+port, kullanıcı+
// parola, veritabanı ya da dosya, klasör, renk, notlar) · Güvenlik (salt okunur, parolayı kaydet, TLS kipi) · SSH tüneli
// (etkin, sunucu, port, kullanıcı, anahtar/parola, PEM, parola). "Bağlantıyı dene" gerçek bağlantı; Kaydet; Kaydet ve aç.
import 'dart:convert';
import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';

import '../../core/l10n/gen/mt_strings.dart';
import '../../core/theme.dart';
import '../../widgets/mt_widgets.dart';
import '../ssh/ssh_model.dart' show kCardColors, parseHex;
import 'drivers/sql_driver.dart';
import 'sql_model.dart';
import 'sql_session.dart';
import 'sql_texts.dart';

class SqlFormScreen extends StatefulWidget {
  const SqlFormScreen({super.key, this.existing, required this.folders, this.folderId, this.colorIndex = 0});
  final SqlConnection? existing;
  final List<(String, String)> folders;
  final String? folderId;
  final int colorIndex;
  @override
  State<SqlFormScreen> createState() => _SqlFormScreenState();
}

class _SqlFormScreenState extends State<SqlFormScreen> with SingleTickerProviderStateMixin {
  late final Map<String, dynamic> d = widget.existing != null
      ? Map<String, dynamic>.from(widget.existing!.raw)
      : SqlConnection.blank(folderId: widget.folderId, color: kCardColors[(widget.colorIndex + 1) % kCardColors.length]);
  late final _tabs = TabController(length: 3, vsync: this);
  late String _provider = kProviders.any((p) => p.id == d['provider']) ? d['provider'] as String : 'postgres';
  ProviderMeta get _meta => providerMeta(_provider);
  late final _name = TextEditingController(text: _s('name')), _host = TextEditingController(text: _s('host', 'localhost'));
  late final _port = TextEditingController(text: (d['port'] ?? _meta.defaultPort ?? '').toString()), _user = TextEditingController(text: _s('user'));
  late final _pw = TextEditingController(text: _s('password')), _db = TextEditingController(text: _s('database'));
  late final _comments = TextEditingController(text: _s('comments'));
  late String _file = _s('filePath');
  late String? _folder = widget.folderId ?? d['folderId'] as String?;
  late String _color = _s('color', '#22d3ee');
  late bool _ro = d['readOnly'] != false, _savePw = d['savePassword'] != false;
  late String _ssl = kSslModes.contains(d['sslMode']) ? d['sslMode'] as String : 'prefer';
  late final Map<String, dynamic> _ssh = Map<String, dynamic>.from((d['ssh'] as Map?)?.cast<String, dynamic>() ?? const {});
  late bool _sshOn = _ssh['enabled'] == true;
  late final _sshHost = TextEditingController(text: (_ssh['host'] ?? '').toString()), _sshPort = TextEditingController(text: (_ssh['port'] ?? 22).toString());
  late final _sshUser = TextEditingController(text: (_ssh['user'] ?? '').toString()), _sshKey = TextEditingController(text: _s('sshPrivateKey'));
  late final _sshPass = TextEditingController(text: _s('sshPassphrase')), _sshPw = TextEditingController(text: _s('sshPassword'));
  late String _sshAuth = const ['key', 'password'].contains(_ssh['auth']) ? _ssh['auth'] as String : 'key'; // ajan mobilde yok
  bool _hide = true, _hideSsh = true, _testing = false, _testOk = false;
  String? _testMsg, _fp;

  String _s(String k, [String def = '']) => (d[k] ?? def).toString();

  @override
  void dispose() {
    _tabs.dispose();
    for (final c in [_name, _host, _port, _user, _pw, _db, _comments, _sshHost, _sshPort, _sshUser, _sshKey, _sshPass, _sshPw]) {
      c.dispose();
    }
    super.dispose();
  }

  void _onProvider(String id) => setState(() {
        final old = _meta.defaultPort;
        _provider = id;
        final m = providerMeta(id);
        if (!m.isFile && (_port.text.trim().isEmpty || _port.text.trim() == old.toString())) _port.text = (m.defaultPort ?? '').toString();
        if (!m.isFile && _user.text.trim().isEmpty) _user.text = m.defaultUser ?? '';
      });

  Map<String, dynamic>? _collect(MtStrings s) {
    final file = _meta.isFile;
    final host = _host.text.trim();
    if (!file && host.isEmpty) { mtToast(context, SqTxt.errHost, type: 'err'); _tabs.animateTo(0); return null; }
    if (_provider == 'sqlite' && _file.isEmpty) { mtToast(context, SqTxt.errFile, type: 'err'); _tabs.animateTo(0); return null; }
    if (!file && _sshOn) {
      if (_sshHost.text.trim().isEmpty || _sshUser.text.trim().isEmpty) { mtToast(context, SqTxt.errSshHost, type: 'err'); _tabs.animateTo(2); return null; }
      if (_sshAuth == 'key' && _sshKey.text.trim().isEmpty) { mtToast(context, SqTxt.errSshKey, type: 'err'); _tabs.animateTo(2); return null; }
    }
    final sshHostNew = _sshHost.text.trim(), sshPortNew = int.tryParse(_sshPort.text.trim()) ?? 22;
    final keepHostKey = _ssh['host'] == sshHostNew && (_ssh['port'] ?? 22) == sshPortNew ? _ssh['hostKey'] : null;
    final name = _name.text.trim().isNotEmpty ? _name.text.trim() : host.isNotEmpty && !file ? host : _file.isNotEmpty ? _file.split(RegExp(r'[\\/]')).last : _meta.name;
    return {
      ...d, 'name': name, 'provider': _provider, 'host': file ? '' : host, 'port': file ? null : (int.tryParse(_port.text.trim()) ?? _meta.defaultPort),
      'database': file ? '' : _db.text.trim(), 'user': file ? '' : _user.text.trim(), 'filePath': file ? _file : '', 'sslMode': _ssl,
      'readOnly': _ro, 'savePassword': _savePw, 'color': _color, 'folderId': _folder, 'comments': _comments.text,
      'ssh': {'enabled': !file && _sshOn, 'host': sshHostNew, 'port': sshPortNew, 'user': _sshUser.text.trim(), 'auth': _sshAuth, 'hostKey': _fp ?? keepHostKey},
      'password': file || !_savePw ? '' : _pw.text, 'sshPassword': _sshOn && _sshAuth == 'password' ? _sshPw.text : '',
      'sshPassphrase': _sshOn && _sshAuth == 'key' ? _sshPass.text : '', 'sshPrivateKey': _sshOn && _sshAuth == 'key' ? _sshKey.text.trim() : '',
    };
  }

  Future<void> _pickKey() async {
    final r = await FilePicker.pickFiles();
    final f = r.firstOrNull;
    if (f == null) return;
    final bytes = await f.readAsBytes();
    if (mounted) setState(() => _sshKey.text = utf8.decode(bytes, allowMalformed: true));
  }

  /// Veritabanı dosyası: uygulamanın belgeler dizinine kopyalanır (filePath yerel kalır)
  Future<void> _pickFile() async {
    final r = await FilePicker.pickFiles();
    final f = r.firstOrNull;
    if (f == null) return;
    final base = await getApplicationDocumentsDirectory();
    final dir = Directory('${base.path}/SQL Master/${SqTxt.inFileDir}');
    await dir.create(recursive: true);
    final target = File('${dir.path}/${f.name}');
    final sink = target.openWrite();
    await sink.addStream(f.readAsByteStream());
    await sink.close();
    if (!mounted) return;
    setState(() => _file = target.path);
    mtToast(context, SqTxt.fileCopied, sub: f.name, type: 'ok');
  }

  Future<void> _test() async {
    final s = MtStrings.of(context);
    final data = _collect(s);
    if (data == null) return;
    if (!_meta.mobile) { setState(() { _testOk = false; _testMsg = '${s.sqFormTestFail}\n${SqTxt.unsupportedMobile}'; }); return; }
    setState(() { _testing = true; _testMsg = null; });
    final sess = SqlSession(conn: SqlConnection('test', data), settings: SqlSettings(SqlSettings.blank()), password: _pw.text, onHostKey: (fp) => _fp = fp);
    final sw = Stopwatch()..start();
    try {
      await sess.connect();
      final i = sess.driver!.serverInfo;
      final lines = ['${s.sqFormTestOk} · ${sw.elapsedMilliseconds} ms', i.product, if (i.database != null) s.sqFormTestDb(i.database!, i.user ?? ''), if (i.tls == false && !_meta.isFile) s.sqFormNoTls,
          if (sess.tunnel?.fingerprint != null) s.sqFormHostKey(sess.tunnel!.fingerprint!)];
      setState(() { _testOk = true; _testMsg = lines.join('\n'); });
    } catch (e) {
      setState(() { _testOk = false; _testMsg = '${s.sqFormTestFail}\n${sqlErrorText(s, e)}'; });
    } finally {
      await sess.close(silent: true);
      if (mounted) setState(() => _testing = false);
    }
  }

  void _save({bool connect = false}) {
    final data = _collect(MtStrings.of(context));
    if (data != null) Navigator.of(context).pop((data, connect));
  }

  @override
  Widget build(BuildContext context) {
    final s = MtStrings.of(context);
    final col = MtColors.of(context);
    final wide = MtBreak.wide(context);
    final file = _meta.isFile;
    final sameKindOnly = widget.existing != null;
    return Scaffold(
      backgroundColor: col.surface,
      appBar: AppBar(
        backgroundColor: col.surface,
        title: Row(children: [Icon(Icons.storage_outlined, size: 18, color: col.accent), const SizedBox(width: 8),
            Expanded(child: Text(widget.existing == null ? s.sqFormTitleNew : s.sqFormTitleEdit(widget.existing!.name), maxLines: 1, overflow: TextOverflow.ellipsis, style: MtText.h2.copyWith(color: col.text)))]),
        bottom: TabBar(controller: _tabs, isScrollable: !wide, tabAlignment: wide ? TabAlignment.fill : TabAlignment.start, labelColor: col.text, unselectedLabelColor: col.text2,
            indicatorColor: col.accent, labelStyle: MtText.body.copyWith(fontWeight: FontWeight.w600), tabs: [
              Tab(child: _tabLabel(Icons.storage_outlined, s.sqFormTabGeneral)), Tab(child: _tabLabel(Icons.lock_outline, s.sqFormTabSecurity)),
              Tab(child: Opacity(opacity: file ? .45 : 1, child: _tabLabel(Icons.key, s.sqFormTabSsh)))]),
      ),
      body: SafeArea(child: Column(children: [
        Expanded(child: Center(child: ConstrainedBox(constraints: const BoxConstraints(maxWidth: 760), child: TabBarView(controller: _tabs, children: [
          // ---- Genel
          ListView(padding: const EdgeInsets.fromLTRB(22, 18, 22, 24), children: [
            LayoutBuilder(builder: (_, bc) {
              final n = kProviders.length;
              final w = ((bc.maxWidth - 8 * (n - 1)) / n).clamp(56.0, 200.0);
              return Wrap(spacing: 8, runSpacing: 8, children: [
                for (final p in kProviders)
                  _ProviderButton(meta: p, selected: p.id == _provider, width: w, enabled: !sameKindOnly || p.kind == _meta.kind, onTap: () => _onProvider(p.id)),
              ]);
            }),
            if (!_meta.mobile) ...[const SizedBox(height: 10), MtBox(SqTxt.unsupportedMobile, kind: MtBoxKind.notice, icon: Icons.phonelink_off_outlined)],
            const SizedBox(height: 14),
            MtField(label: s.sqFormName, child: TextField(controller: _name, decoration: InputDecoration(hintText: s.sqFormNamePh))),
            const SizedBox(height: 14),
            if (!file) ...[
              _row(wide, [
                MtField(label: s.sqFormHost, child: TextField(controller: _host, keyboardType: TextInputType.url, autocorrect: false, textDirection: TextDirection.ltr, decoration: const InputDecoration(hintText: 'localhost'))),
                MtField(label: s.sqFormPort, child: TextField(controller: _port, keyboardType: TextInputType.number, textDirection: TextDirection.ltr)),
              ], flex: const [3, 1]),
              const SizedBox(height: 14),
              _row(wide, [
                MtField(label: s.sqFormUser, child: TextField(controller: _user, autocorrect: false, textDirection: TextDirection.ltr, decoration: InputDecoration(hintText: _meta.defaultUser))),
                MtField(label: s.sqFormPassword, child: TextField(controller: _pw, obscureText: _hide, textDirection: TextDirection.ltr,
                    decoration: InputDecoration(hintText: widget.existing != null && widget.existing!.password.isNotEmpty ? s.sqFormPwSaved : null,
                        suffixIcon: MtIconButton(icon: _hide ? Icons.visibility_outlined : Icons.visibility_off_outlined, onPressed: () => setState(() => _hide = !_hide))))),
              ]),
              const SizedBox(height: 14),
              MtField(label: s.sqFormDatabase, child: TextField(controller: _db, autocorrect: false, textDirection: TextDirection.ltr, decoration: InputDecoration(hintText: s.sqFormDatabasePh))),
            ] else ...[
              MtField(label: s.sqFormFile, hint: _provider == 'sqlite' ? s.sqFormSqliteHint : s.sqFormDuckdbHint, child: Row(children: [
                Expanded(child: Container(
                  height: MtDim.inputH, padding: const EdgeInsets.symmetric(horizontal: 12), alignment: AlignmentDirectional.centerStart,
                  decoration: BoxDecoration(color: col.bg2, border: Border.all(color: col.border), borderRadius: BorderRadius.circular(MtDim.radiusSm)),
                  child: Text(_file.isEmpty ? (_provider == 'duckdb' ? s.sqFormInMemory : s.sqFormFilePh) : _file.split(RegExp(r'[\\/]')).last, maxLines: 1, overflow: TextOverflow.ellipsis, textDirection: TextDirection.ltr,
                      style: MtText.body.copyWith(color: _file.isEmpty ? col.text3 : col.text)),
                )),
                const SizedBox(width: 8),
                MtButton(label: SqTxt.pickFile, icon: Icons.folder_open_outlined, onPressed: _pickFile),
                if (_file.isNotEmpty) ...[const SizedBox(width: 4), MtIconButton(icon: Icons.close, tooltip: s.commonDelete, onPressed: () => setState(() => _file = ''))],
              ])),
            ],
            const SizedBox(height: 14),
            _row(wide, [
              MtField(label: s.sqFormFolder, child: _select<String?>(_folder, [(null, s.sqAppRootFolder), for (final f in widget.folders) (f.$1, f.$2)], (v) => setState(() => _folder = v))),
              MtField(label: s.sqFormColor, child: Padding(padding: const EdgeInsets.symmetric(vertical: 5), child: Wrap(spacing: 8, runSpacing: 8, children: [
                for (final h in kCardColors) InkWell(onTap: () => setState(() => _color = h), borderRadius: BorderRadius.circular(999), child: Container(width: 26, height: 26,
                    decoration: BoxDecoration(color: parseHex(h), shape: BoxShape.circle, border: Border.all(color: _color == h ? col.text : Colors.transparent, width: 2)))),
              ]))),
            ]),
            const SizedBox(height: 14),
            MtField(label: s.sqFormComments, child: TextField(controller: _comments, maxLines: 3, minLines: 2)),
            if (_testMsg != null) ...[const SizedBox(height: 14), _TestResult(text: _testMsg!, ok: _testOk)],
          ]),
          // ---- Güvenlik
          ListView(padding: const EdgeInsets.fromLTRB(22, 18, 22, 24), children: [
            MtCheck(value: _ro, onChanged: (v) => setState(() => _ro = v), label: s.sqFormReadOnly, hint: s.sqFormReadOnlyHint),
            const SizedBox(height: 10),
            if (!file) MtCheck(value: _savePw, onChanged: (v) => setState(() => _savePw = v), label: s.sqFormSavePassword, hint: s.sqFormSavePasswordHint),
            if (!file) const SizedBox(height: 14),
            if (!file)
              MtField(label: s.sqFormSsl, hint: _provider == 'mysql' ? '${s.sqFormSslHint}\n${SqTxt.sslVerifyNote}' : s.sqFormSslHint, child: _select<String>(_ssl, [
                ('prefer', s.sqFormSslPrefer), ('require', s.sqFormSslRequire), ('verify-full', s.sqFormSslVerify), ('disable', s.sqFormSslDisable),
              ], (v) => setState(() => _ssl = v!))),
          ]),
          // ---- SSH tüneli
          file
              ? Center(child: Padding(padding: const EdgeInsets.all(24), child: Text(s.sqFormSshHint, textAlign: TextAlign.center, style: MtText.small.copyWith(color: col.text3))))
              : ListView(padding: const EdgeInsets.fromLTRB(22, 18, 22, 24), children: [
                  MtCheck(value: _sshOn, onChanged: (v) => setState(() => _sshOn = v), label: s.sqFormSshEnable, hint: s.sqFormSshHint),
                  if (_sshOn) ...[
                    const SizedBox(height: 14),
                    _row(wide, [
                      MtField(label: s.sqFormSshHost, child: TextField(controller: _sshHost, keyboardType: TextInputType.url, autocorrect: false, textDirection: TextDirection.ltr)),
                      MtField(label: s.sqFormPort, child: TextField(controller: _sshPort, keyboardType: TextInputType.number, textDirection: TextDirection.ltr)),
                    ], flex: const [3, 1]),
                    const SizedBox(height: 14),
                    MtField(label: s.sqFormUser, child: TextField(controller: _sshUser, autocorrect: false, textDirection: TextDirection.ltr)),
                    const SizedBox(height: 14),
                    MtField(label: s.sqFormSshAuth, child: MtSegment<String>(value: _sshAuth, onChanged: (v) => setState(() => _sshAuth = v), items: [('key', s.sqFormSshKey, Icons.key), ('password', s.sqFormPassword, Icons.password)])),
                    const SizedBox(height: 14),
                    if (_sshAuth == 'key') ...[
                      MtField(label: s.sqFormKeyFile, hint: SqTxt.sshKeyPaste, child: Column(crossAxisAlignment: CrossAxisAlignment.stretch, children: [
                        TextField(controller: _sshKey, maxLines: 5, minLines: 3, style: MtText.mono, textDirection: TextDirection.ltr, decoration: const InputDecoration(hintText: '-----BEGIN OPENSSH PRIVATE KEY-----')),
                        const SizedBox(height: 8),
                        Align(alignment: AlignmentDirectional.centerStart, child: MtButton(label: SqTxt.pickFile, small: true, icon: Icons.upload_file, onPressed: _pickKey)),
                      ])),
                      const SizedBox(height: 14),
                      MtField(label: s.sqFormPassphrase, hint: s.sqFormPassEmpty, child: TextField(controller: _sshPass, obscureText: true)),
                    ] else
                      MtField(label: s.sqFormSshPassword, child: TextField(controller: _sshPw, obscureText: _hideSsh,
                          decoration: InputDecoration(suffixIcon: MtIconButton(icon: _hideSsh ? Icons.visibility_outlined : Icons.visibility_off_outlined, onPressed: () => setState(() => _hideSsh = !_hideSsh))))),
                    if ((_fp ?? _ssh['hostKey']) != null) ...[const SizedBox(height: 14), Text(s.sqFormHostKey((_fp ?? _ssh['hostKey']).toString()), style: MtText.mono.copyWith(color: col.text3, fontSize: 11))],
                  ],
                ]),
        ])))),
        Container(
          padding: const EdgeInsets.fromLTRB(22, 14, 22, 18),
          decoration: BoxDecoration(border: Border(top: BorderSide(color: col.border))),
          child: wide
              ? Row(children: [
                  MtButton(label: s.sqFormTest, icon: Icons.bolt_outlined, busy: _testing, onPressed: _test),
                  const Spacer(),
                  MtButton(label: s.commonCancel, onPressed: () => Navigator.of(context).pop()),
                  const SizedBox(width: 8),
                  MtButton(label: s.commonSave, onPressed: () => _save()),
                  const SizedBox(width: 8),
                  MtButton(label: s.sqFormSaveConnect, kind: MtBtnKind.primary, icon: Icons.play_arrow, onPressed: () => _save(connect: true)),
                ])
              : Column(crossAxisAlignment: CrossAxisAlignment.stretch, children: [
                  MtButton(label: s.sqFormSaveConnect, kind: MtBtnKind.primary, icon: Icons.play_arrow, expand: true, onPressed: () => _save(connect: true)),
                  const SizedBox(height: 8),
                  Row(children: [
                    Expanded(child: MtButton(label: s.sqFormTest, icon: Icons.bolt_outlined, busy: _testing, expand: true, onPressed: _test)),
                    const SizedBox(width: 8),
                    Expanded(child: MtButton(label: s.commonSave, expand: true, onPressed: () => _save())),
                  ]),
                ]),
        ),
      ])),
    );
  }

  Widget _tabLabel(IconData i, String t) => Row(mainAxisSize: MainAxisSize.min, children: [Icon(i, size: 14), const SizedBox(width: 6), Text(t)]);

  Widget _row(bool wide, List<Widget> children, {List<int>? flex}) => wide
      ? Row(crossAxisAlignment: CrossAxisAlignment.start, children: [
          for (var i = 0; i < children.length; i++) ...[if (i > 0) const SizedBox(width: 14), Expanded(flex: flex?[i] ?? 1, child: children[i])],
        ])
      : Column(crossAxisAlignment: CrossAxisAlignment.stretch, children: [for (var i = 0; i < children.length; i++) ...[if (i > 0) const SizedBox(height: 14), children[i]]]);

  Widget _select<T>(T value, List<(T, String)> items, ValueChanged<T?> onChanged) {
    final col = MtColors.of(context);
    return Container(
      height: MtDim.inputH, padding: const EdgeInsets.symmetric(horizontal: 12),
      decoration: BoxDecoration(color: col.bg2, border: Border.all(color: col.border), borderRadius: BorderRadius.circular(MtDim.radiusSm)),
      child: DropdownButtonHideUnderline(child: DropdownButton<T>(value: value, isExpanded: true, style: MtText.body.copyWith(color: col.text), dropdownColor: col.surface2,
          items: [for (final it in items) DropdownMenuItem(value: it.$1, child: Text(it.$2, maxLines: 1, overflow: TextOverflow.ellipsis))], onChanged: onChanged)),
    );
  }
}

/// Motor düğmesi (masaüstü .prov-btn: ikon + kısa ad, seçili olan accent kenarlıklı)
class _ProviderButton extends StatelessWidget {
  const _ProviderButton({required this.meta, required this.selected, required this.width, required this.enabled, required this.onTap});
  final ProviderMeta meta;
  final bool selected, enabled;
  final double width;
  final VoidCallback onTap;
  @override
  Widget build(BuildContext context) {
    final c = MtColors.of(context);
    return Opacity(
      opacity: enabled ? 1 : .4,
      child: Material(
        color: selected ? c.accent.withValues(alpha: .08) : c.bg2, borderRadius: BorderRadius.circular(10),
        child: InkWell(
          borderRadius: BorderRadius.circular(10), onTap: enabled ? onTap : null,
          child: Container(
            width: width, height: 64,
            decoration: BoxDecoration(borderRadius: BorderRadius.circular(10), border: Border.all(color: selected ? c.accent : c.border, width: selected ? 1.5 : 1)),
            child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
              Icon(meta.isFile ? Icons.insert_drive_file_outlined : Icons.storage_outlined, size: 20, color: meta.colorValue),
              const SizedBox(height: 6),
              Text(meta.short, style: TextStyle(fontSize: 11.5, fontWeight: FontWeight.w600, color: selected ? c.text : c.text2)),
            ]),
          ),
        ),
      ),
    );
  }
}

/// Test sonucu kutusu (.test-result: ok yeşil, hata kırmızı; uyarı satırı sarı)
class _TestResult extends StatelessWidget {
  const _TestResult({required this.text, required this.ok});
  final String text;
  final bool ok;
  @override
  Widget build(BuildContext context) {
    final c = MtColors.of(context);
    final s = MtStrings.of(context);
    final tone = ok ? c.ok : c.err;
    final lines = text.split('\n');
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
      decoration: BoxDecoration(color: tone.withValues(alpha: .08), borderRadius: BorderRadius.circular(9), border: Border.all(color: tone.withValues(alpha: .45))),
      child: Row(crossAxisAlignment: CrossAxisAlignment.start, children: [
        Icon(ok ? Icons.check : Icons.close, size: 15, color: tone), const SizedBox(width: 8),
        Expanded(child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          for (var i = 0; i < lines.length; i++)
            Text(lines[i], style: TextStyle(fontSize: 12.5, height: 1.5, fontWeight: i == 0 ? FontWeight.w600 : FontWeight.w400,
                color: lines[i] == s.sqFormNoTls ? c.warn : i == 0 && !ok ? c.err : c.text)),
        ])),
      ]),
    );
  }
}
