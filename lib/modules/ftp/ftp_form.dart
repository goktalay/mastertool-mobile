// FTP Masters site formu — masaüstü CuteFTP tarzı 4 sekme: Genel (etiket, sunucu, port, protokol, kullanıcı, giriş yöntemi,
// şifre / SFTP anahtarı, klasör, renk, notlar) · Eylemler (uzak klasör, son klasöre git, önbellek, yükleme ad kuralı) ·
// Tür (aktarım türü, saat dilimi farkı) · Seçenekler (siteye özel: tekrar deneme, bekleme, eşzamanlı, aynı ad kuralı, kodlama).
// "Bağlantıyı dene" gerçek bağlantı kurar; "Kaydet", "Kaydet ve bağlan".
import 'dart:convert';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';

import '../../core/l10n/gen/mt_strings.dart';
import '../../core/theme.dart';
import '../../widgets/mt_widgets.dart';
import '../ssh/ssh_model.dart' show kCardColors, parseHex;
import 'ftp_model.dart';
import 'remote_fs.dart';

class FtpFormScreen extends StatefulWidget {
  const FtpFormScreen({super.key, this.existing, required this.folders, this.folderId});
  final FtpSite? existing;
  final List<(String, String)> folders;
  final String? folderId;
  @override
  State<FtpFormScreen> createState() => _FtpFormScreenState();
}

class _FtpFormScreenState extends State<FtpFormScreen> with SingleTickerProviderStateMixin {
  late final Map<String, dynamic> d = widget.existing != null ? Map<String, dynamic>.from(widget.existing!.raw) : FtpSite.blank();
  late final _tabs = TabController(length: 4, vsync: this);
  late final _name = TextEditingController(text: _s('name')), _host = TextEditingController(text: _s('host'));
  late final _port = TextEditingController(text: (d['port'] ?? 21).toString()), _user = TextEditingController(text: _s('username'));
  late final _pw = TextEditingController(text: _s('password')), _key = TextEditingController(text: _s('privateKey'));
  late final _pass = TextEditingController(text: _s('passphrase')), _comments = TextEditingController(text: _s('comments'));
  late final _remoteDir = TextEditingController(text: _s('remoteDir'));
  late final _retry = TextEditingController(text: (d['retryAttempts'] ?? 3).toString()), _retryDelay = TextEditingController(text: (d['retryDelay'] ?? 10).toString());
  late final _maxConc = TextEditingController(text: (d['maxConcurrent'] ?? 4).toString());
  late String _protocol = _s('protocol', 'ftp'), _login = _s('loginMethod', 'normal'), _auth = _s('authType', 'password');
  late String _cache = _s('cacheMode', 'session'), _case = _s('uploadCase', 'preserve'), _transfer = _s('transferType', 'global');
  late String _siteOpt = _s('siteOptions', 'global'), _conflict = _s('conflict', 'overwrite'), _enc = _s('encoding', 'auto');
  late int _tz = (d['timezone'] as num?)?.toInt() ?? 0;
  late String? _folder = widget.folderId;
  late String _color = _s('color', '#22d3ee');
  late bool _remember = d['rememberLastDir'] == true;
  bool _hide = true, _testing = false, _testOk = false;
  String? _testMsg, _fp;

  String _s(String k, [String def = '']) => (d[k] ?? def).toString();

  Map<String, dynamic>? _collect(MtStrings s) {
    final host = _host.text.trim();
    if (host.isEmpty) { mtToast(context, s.fmMainErrHost, type: 'err'); _tabs.animateTo(0); return null; }
    if (_login == 'normal' && _user.text.trim().isEmpty) { mtToast(context, s.fmMainErrUser, type: 'err'); _tabs.animateTo(0); return null; }
    final sftp = _protocol == 'sftp';
    return {
      ...d, 'name': _name.text.trim().isEmpty ? host : _name.text.trim(), 'host': host, 'port': int.tryParse(_port.text.trim()) ?? kFtpProtocols[_protocol]!.$2,
      'protocol': _protocol, 'username': _login == 'anonymous' ? 'anonymous' : _user.text.trim(), 'loginMethod': _login,
      'authType': sftp ? _auth : 'password', 'password': _login == 'anonymous' ? '' : _pw.text, 'privateKey': sftp && _auth == 'key' ? _key.text.trim() : '',
      'passphrase': sftp && _auth == 'key' ? _pass.text : '', 'comments': _comments.text, 'folderId': _folder, 'color': _color,
      'remoteDir': _remoteDir.text.trim(), 'rememberLastDir': _remember, 'cacheMode': _cache, 'uploadCase': _case, 'transferType': _transfer,
      'timezone': _tz, 'siteOptions': _siteOpt, 'retryAttempts': (int.tryParse(_retry.text) ?? 3).clamp(0, 99), 'retryDelay': (int.tryParse(_retryDelay.text) ?? 10).clamp(0, 3600),
      'maxConcurrent': (int.tryParse(_maxConc.text) ?? 4).clamp(1, 20), 'conflict': _conflict, 'encoding': _enc, 'hostKey': _fp ?? d['hostKey'],
    };
  }

  void _onProtocol(String p) => setState(() {
        final old = kFtpProtocols[_protocol]!.$2;
        _protocol = p;
        if (_port.text.trim() == old.toString() || _port.text.trim().isEmpty) _port.text = kFtpProtocols[p]!.$2.toString();
      });

  Future<void> _pickKey() async {
    final r = await FilePicker.pickFiles();
    final f = r.firstOrNull;
    if (f == null) return;
    final bytes = await f.readAsBytes();
    if (mounted) setState(() => _key.text = utf8.decode(bytes, allowMalformed: true));
  }

  Future<void> _test() async {
    final s = MtStrings.of(context);
    final data = _collect(s);
    if (data == null) return;
    setState(() { _testing = true; _testMsg = null; });
    RemoteFs? fs;
    try {
      fs = createRemoteFs(FtpSite('test', data), onHostKey: (fp) => _fp = fp);
      await fs.connect();
      final home = await fs.pwd();
      var msg = '${s.fmFormTestOk}\n${s.fmFormHomeDir(home)}';
      if (data['remoteDir'].toString().isNotEmpty && !await fs.exists(data['remoteDir'].toString())) msg += '\n${s.fmFormRemoteDirMissing}';
      if (_fp != null) msg += '\n${s.fmFormHostKey}: $_fp';
      setState(() { _testOk = true; _testMsg = msg; });
    } catch (e) {
      setState(() { _testOk = false; _testMsg = '${s.fmFormTestFail}: ${remoteErrorText(s, e)}'; });
    } finally {
      await fs?.close();
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
    final sftp = _protocol == 'sftp';
    return Scaffold(
      backgroundColor: col.surface,
      appBar: AppBar(
        backgroundColor: col.surface,
        title: Row(children: [Icon(Icons.cloud_outlined, size: 18, color: col.accent), const SizedBox(width: 8),
            Expanded(child: Text(widget.existing == null ? s.fmFormTitleNew : s.fmFormTitleEdit(widget.existing!.name), maxLines: 1, overflow: TextOverflow.ellipsis, style: MtText.h2.copyWith(color: col.text)))]),
        bottom: TabBar(controller: _tabs, isScrollable: !wide, tabAlignment: wide ? TabAlignment.fill : TabAlignment.start, labelColor: col.text, unselectedLabelColor: col.text2,
            indicatorColor: col.accent, labelStyle: MtText.body.copyWith(fontWeight: FontWeight.w600), tabs: [Tab(text: s.fmFormTabGeneral), Tab(text: s.fmFormTabActions), Tab(text: s.fmFormTabType), Tab(text: s.fmFormTabOptions)]),
      ),
      body: SafeArea(child: Column(children: [
        Expanded(child: Center(child: ConstrainedBox(constraints: const BoxConstraints(maxWidth: 760), child: TabBarView(controller: _tabs, children: [
          // ---- Genel
          ListView(padding: const EdgeInsets.fromLTRB(22, 18, 22, 24), children: [
            _row(wide, [
              MtField(label: s.fmFormName, child: TextField(controller: _name, decoration: InputDecoration(hintText: s.fmFormNamePh))),
              MtField(label: s.fmFormFolder, child: _select<String?>(_folder, [(null, s.fmAppRootFolder), for (final f in widget.folders) (f.$1, f.$2)], (v) => setState(() => _folder = v))),
            ]),
            const SizedBox(height: 14),
            _row(wide, [
              MtField(label: s.fmFormHost, child: TextField(controller: _host, keyboardType: TextInputType.url, autocorrect: false, textDirection: TextDirection.ltr, decoration: InputDecoration(hintText: s.fmFormHostPh))),
              MtField(label: s.fmFormPort, child: TextField(controller: _port, keyboardType: TextInputType.number, textDirection: TextDirection.ltr)),
            ], flex: const [3, 1]),
            const SizedBox(height: 14),
            MtField(label: s.fmTypeProtocol, hint: _protoNote(s), child: _select<String>(_protocol, [for (final e in kFtpProtocols.entries) (e.key, _protoLabel(s, e.key))], (v) => _onProtocol(v!))),
            const SizedBox(height: 14),
            _row(wide, [
              MtField(label: s.fmFormLoginMethod, child: MtSegment<String>(value: _login, onChanged: (v) => setState(() => _login = v), items: [('normal', s.fmFormLoginNormal, Icons.person_outline), ('anonymous', s.fmFormLoginAnon, Icons.public)])),
              if (_login == 'normal') MtField(label: s.fmFormUser, child: TextField(controller: _user, autocorrect: false, textDirection: TextDirection.ltr)) else const SizedBox(),
            ]),
            if (_login == 'normal') ...[
              const SizedBox(height: 14),
              if (sftp) MtField(label: s.fmFormAuth, child: MtSegment<String>(value: _auth, onChanged: (v) => setState(() => _auth = v), items: [('password', s.fmFormPassword, Icons.password), ('key', s.fmFormPrivateKey, Icons.key)])),
              if (sftp) const SizedBox(height: 14),
              if (!sftp || _auth == 'password')
                MtField(label: s.fmFormPassword, child: TextField(controller: _pw, obscureText: _hide,
                    decoration: InputDecoration(suffixIcon: MtIconButton(icon: _hide ? Icons.visibility_outlined : Icons.visibility_off_outlined, onPressed: () => setState(() => _hide = !_hide)))))
              else ...[
                MtField(label: s.fmFormKeyFile, child: Column(crossAxisAlignment: CrossAxisAlignment.stretch, children: [
                  TextField(controller: _key, maxLines: 5, minLines: 3, style: MtText.mono, textDirection: TextDirection.ltr, decoration: const InputDecoration(hintText: '-----BEGIN OPENSSH PRIVATE KEY-----')),
                  const SizedBox(height: 8),
                  Align(alignment: AlignmentDirectional.centerStart, child: MtButton(label: s.fmMainPickKey, small: true, icon: Icons.upload_file, onPressed: _pickKey)),
                ])),
                const SizedBox(height: 14),
                MtField(label: s.fmFormPassphrase, hint: s.fmFormPassEmpty, child: TextField(controller: _pass, obscureText: true)),
              ],
            ],
            const SizedBox(height: 14),
            MtField(label: s.fmFormColor, child: Wrap(spacing: 8, runSpacing: 8, children: [
              for (final h in kCardColors) InkWell(onTap: () => setState(() => _color = h), borderRadius: BorderRadius.circular(999), child: Container(width: 26, height: 26,
                  decoration: BoxDecoration(color: parseHex(h), shape: BoxShape.circle, border: Border.all(color: _color == h ? col.text : Colors.transparent, width: 2)))),
            ])),
            const SizedBox(height: 14),
            MtField(label: s.fmFormComments, child: TextField(controller: _comments, maxLines: 3, minLines: 2)),
            if (_testMsg != null) ...[const SizedBox(height: 14), MtBox(_testMsg!, kind: _testOk ? MtBoxKind.info : MtBoxKind.error, icon: _testOk ? Icons.check_circle_outline : Icons.error_outline)],
          ]),
          // ---- Eylemler
          ListView(padding: const EdgeInsets.fromLTRB(22, 18, 22, 24), children: [
            MtField(label: s.fmFormRemoteDir, child: TextField(controller: _remoteDir, textDirection: TextDirection.ltr, decoration: const InputDecoration(hintText: '/public_html'))),
            const SizedBox(height: 14),
            MtCheck(value: _remember, onChanged: (v) => setState(() => _remember = v), label: s.fmFormLastDir,
                hint: _s('lastRemoteDir').isNotEmpty ? '${s.fmFormLastDirHint} ${s.fmFormLastDirNow} ${_s('lastRemoteDir')}' : s.fmFormLastDirHint),
            const SizedBox(height: 14),
            MtField(label: s.fmFormCache, child: _select<String>(_cache, [('session', s.fmFormCacheSession), ('always', s.fmFormCacheAlways), ('never', s.fmFormCacheNever)], (v) => setState(() => _cache = v!))),
            const SizedBox(height: 14),
            MtField(label: s.fmFormUploadCase, child: _select<String>(_case, [('preserve', s.fmFormCasePreserve), ('lower', s.fmFormCaseLower), ('upper', s.fmFormCaseUpper)], (v) => setState(() => _case = v!))),
          ]),
          // ---- Tür
          ListView(padding: const EdgeInsets.fromLTRB(22, 18, 22, 24), children: [
            MtField(label: s.fmTypeTransferType, child: _select<String>(_transfer, [('global', s.fmTypeUseGlobal(s.fmTypeBinary)), ('binary', s.fmTypeBinary), ('ascii', s.fmTypeAscii), ('auto', s.fmTypeAuto)], (v) => setState(() => _transfer = v!))),
            const SizedBox(height: 14),
            MtField(label: s.fmTypeDataConn, child: Text(s.fmTypePassive, style: MtText.body.copyWith(color: col.text2))),
            const SizedBox(height: 14),
            MtField(label: s.fmTypeTimezone, hint: s.fmTypeTimezoneHint, child: _select<int>(_tz, [for (var h = -14; h <= 14; h++) (h, h == 0 ? s.fmTypeTzNone : '${h > 0 ? '+' : ''}$h ${s.fmTypeTzHours}')], (v) => setState(() => _tz = v!))),
          ]),
          // ---- Seçenekler
          ListView(padding: const EdgeInsets.fromLTRB(22, 18, 22, 24), children: [
            MtField(label: s.fmOptSiteOptions, child: MtSegment<String>(value: _siteOpt, onChanged: (v) => setState(() => _siteOpt = v), items: [('global', s.fmOptUseGlobal, null), ('custom', s.fmOptCustom, null)])),
            const SizedBox(height: 14),
            Opacity(opacity: _siteOpt == 'custom' ? 1 : .5, child: IgnorePointer(ignoring: _siteOpt != 'custom', child: Column(crossAxisAlignment: CrossAxisAlignment.stretch, children: [
              _row(wide, [
                MtField(label: s.fmOptRetry, child: TextField(controller: _retry, keyboardType: TextInputType.number)),
                MtField(label: s.fmOptRetryDelay, child: TextField(controller: _retryDelay, keyboardType: TextInputType.number)),
                MtField(label: s.fmOptMaxConcurrent, child: TextField(controller: _maxConc, keyboardType: TextInputType.number)),
              ]),
              const SizedBox(height: 14),
              MtField(label: s.fmOptConflict, child: _select<String>(_conflict, [('overwrite', s.fmOptConflictOverwrite), ('rename', s.fmOptConflictRename), ('skip', s.fmOptConflictSkip)], (v) => setState(() => _conflict = v!))),
              const SizedBox(height: 14),
              MtField(label: s.fmOptEncoding, child: _select<String>(_enc, [('auto', s.fmOptEncAuto), ('utf8', 'UTF-8'), ('ascii', 'ASCII / Latin-1')], (v) => setState(() => _enc = v!))),
            ]))),
          ]),
        ])))),
        Container(
          padding: const EdgeInsets.fromLTRB(22, 14, 22, 18),
          decoration: BoxDecoration(border: Border(top: BorderSide(color: col.border))),
          child: wide
              ? Row(children: [
                  MtButton(label: s.fmFormTest, icon: Icons.network_check, busy: _testing, onPressed: _test),
                  const Spacer(),
                  MtButton(label: s.commonCancel, onPressed: () => Navigator.of(context).pop()),
                  const SizedBox(width: 8),
                  MtButton(label: s.commonSave, onPressed: () => _save()),
                  const SizedBox(width: 8),
                  MtButton(label: s.fmFormSaveConnect, kind: MtBtnKind.primary, icon: Icons.play_arrow, onPressed: () => _save(connect: true)),
                ])
              : Column(crossAxisAlignment: CrossAxisAlignment.stretch, children: [
                  MtButton(label: s.fmFormSaveConnect, kind: MtBtnKind.primary, icon: Icons.play_arrow, expand: true, onPressed: () => _save(connect: true)),
                  const SizedBox(height: 8),
                  Row(children: [
                    Expanded(child: MtButton(label: s.fmFormTest, icon: Icons.network_check, busy: _testing, expand: true, onPressed: _test)),
                    const SizedBox(width: 8),
                    Expanded(child: MtButton(label: s.commonSave, expand: true, onPressed: () => _save())),
                  ]),
                ]),
        ),
      ])),
    );
  }

  String _protoLabel(MtStrings s, String k) => switch (k) {
        'ftp' => s.fmTypeFtp, 'ftps-implicit' => s.fmTypeFtpsImplicit, 'ftps-ssl' => s.fmTypeFtpsSsl, 'ftps-tls' => s.fmTypeFtpsTls, _ => s.fmTypeSftp };
  String _protoNote(MtStrings s) => switch (_protocol) {
        'ftp' => s.fmTypeNoteFtp, 'ftps-implicit' => s.fmTypeNoteFtpsImplicit, 'ftps-ssl' => s.fmTypeNoteFtpsSsl, 'ftps-tls' => s.fmTypeNoteFtpsTls, _ => s.fmTypeNoteSftp };

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
