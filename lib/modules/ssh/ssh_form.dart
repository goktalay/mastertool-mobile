// SSH bağlantı formu — masaüstü form.* alanları: ad, sunucu, port, kullanıcı adı, kimlik doğrulama (şifre / anahtar),
// şifre, özel anahtar (PEM yapıştır ya da dosyadan), anahtar parolası, klasör, renk, konsol paleti, "son kaldığım klasöre git".
// "Bağlantıyı test et" (dartssh2 ile gerçek bağlantı + host anahtarı parmak izi), "Kaydet", "Kaydet ve bağlan".
import 'dart:convert';

import 'package:crypto/crypto.dart' as c;
import 'package:dartssh2/dartssh2.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';

import '../../core/l10n/gen/mt_strings.dart';
import '../../core/theme.dart';
import '../../widgets/mt_widgets.dart';
import 'ssh_model.dart';

class SshFormResult {
  SshFormResult(this.data, {this.connect = false});
  final Map<String, dynamic> data;
  final bool connect;
}

class SshFormScreen extends StatefulWidget {
  const SshFormScreen({super.key, this.existing, required this.folders, this.folderId, this.initial});
  final SshConnection? existing;
  final List<SshFolder> folders;
  final String? folderId;
  /// Yeni kayıtta önceden dolu alanlar (örn. IP Tools'tan gelen host/port); existing varsa yok sayılır.
  final Map<String, dynamic>? initial;
  @override
  State<SshFormScreen> createState() => _SshFormScreenState();
}

class _SshFormScreenState extends State<SshFormScreen> {
  late final Map<String, dynamic> d = widget.existing != null ? Map<String, dynamic>.from(widget.existing!.raw) : {...SshConnection.blank(), ...?widget.initial};
  late final _name = TextEditingController(text: d['name']?.toString() ?? '');
  late final _host = TextEditingController(text: d['host']?.toString() ?? '');
  late final _port = TextEditingController(text: (d['port'] ?? 22).toString());
  late final _user = TextEditingController(text: d['username']?.toString() ?? '');
  late final _pw = TextEditingController(text: d['password']?.toString() ?? '');
  late final _key = TextEditingController(text: d['privateKey']?.toString() ?? '');
  late final _pass = TextEditingController(text: d['passphrase']?.toString() ?? '');
  late final _notes = TextEditingController(text: d['notes']?.toString() ?? '');
  late String _auth = (d['authType'] ?? 'password').toString();
  late String? _folder = widget.folderId;
  late String _color = (d['color'] ?? '#3b82f6').toString();
  late String _theme = (d['theme'] ?? 'sshmaster').toString();
  late bool _remember = d['rememberLastDir'] == true;
  bool _hide = true, _testing = false;
  String? _testMsg;
  bool _testOk = false;
  String? _fp;

  Map<String, dynamic>? _collect(MtStrings s) {
    final host = _host.text.trim(), user = _user.text.trim();
    if (host.isEmpty || user.isEmpty) {
      mtToast(context, s.smMainErrHostUser, type: 'err');
      return null;
    }
    return {
      ...d, 'name': _name.text.trim().isEmpty ? host : _name.text.trim(), 'host': host, 'port': int.tryParse(_port.text.trim()) ?? 22, 'username': user,
      'authType': _auth, 'password': _auth == 'password' ? _pw.text : '', 'privateKey': _auth == 'key' ? _key.text.trim() : '',
      'passphrase': _auth == 'key' ? _pass.text : '', 'folderId': _folder, 'color': _color, 'theme': _theme, 'rememberLastDir': _remember,
      'notes': _notes.text, 'hostKey': _fp ?? d['hostKey'],
    };
  }

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
    SSHClient? client;
    try {
      final sock = await SSHSocket.connect(data['host'], data['port'], timeout: const Duration(seconds: 12));
      client = SSHClient(sock, username: data['username'],
          onPasswordRequest: () => data['password'],
          identities: _auth == 'key' && _key.text.trim().isNotEmpty ? SSHKeyPair.fromPem(_key.text.trim(), _pass.text.isEmpty ? null : _pass.text) : null,
          onVerifyHostKey: (type, key) { _fp = base64.encode(c.sha256.convert(key).bytes); return true; });
      await client.authenticated.timeout(const Duration(seconds: 15));
      setState(() { _testOk = true; _testMsg = '${s.smFormTestOk}\n${s.smFormHostKey(_fp ?? '')}'; });
    } catch (e) {
      setState(() { _testOk = false; _testMsg = '${s.smFormTestFail}: ${_errText(s, e)}'; });
    } finally {
      client?.close();
      if (mounted) setState(() => _testing = false);
    }
  }

  static String _errText(MtStrings s, Object e) {
    final t = e.toString();
    if (e is SSHAuthFailError || t.contains('auth')) return s.smMainErrAuth;
    if (t.contains('refused')) return s.smMainErrRefused;
    if (t.contains('Timeout') || t.contains('timed out')) return s.smMainErrTimeout;
    if (t.contains('Failed host lookup') || t.contains('lookup')) return s.smMainErrDns;
    if (t.contains('unreachable') || t.contains('Network is')) return s.smMainErrUnreach;
    return t;
  }

  void _save({bool connect = false}) {
    final data = _collect(MtStrings.of(context));
    if (data != null) Navigator.of(context).pop(SshFormResult(data, connect: connect));
  }

  @override
  Widget build(BuildContext context) {
    final s = MtStrings.of(context);
    final col = MtColors.of(context);
    final wide = MtBreak.wide(context);
    final body = ListView(padding: const EdgeInsets.fromLTRB(22, 18, 22, 24), children: [
      _row(wide, [
        MtField(label: s.smFormName, child: TextField(controller: _name, decoration: InputDecoration(hintText: s.smFormNamePh))),
        MtField(label: s.smFormFolder, child: _select<String?>(_folder, [(null, s.smAppRootFolder), for (final f in widget.folders) (f.id, f.name)], (v) => setState(() => _folder = v))),
      ]),
      const SizedBox(height: 14),
      _row(wide, [
        MtField(label: s.smFormHost, child: TextField(controller: _host, keyboardType: TextInputType.url, autocorrect: false, textDirection: TextDirection.ltr, decoration: InputDecoration(hintText: s.smFormHostPh))),
        MtField(label: s.smFormPort, child: TextField(controller: _port, keyboardType: TextInputType.number, textDirection: TextDirection.ltr)),
      ], flex: const [3, 1]),
      const SizedBox(height: 14),
      _row(wide, [
        MtField(label: s.smFormUser, child: TextField(controller: _user, autocorrect: false, textDirection: TextDirection.ltr)),
        MtField(label: s.smFormAuth, child: MtSegment<String>(value: _auth, onChanged: (v) => setState(() => _auth = v),
            items: [('password', s.smFormPassword, Icons.password), ('key', s.smFormPrivateKey, Icons.key)])),
      ]),
      const SizedBox(height: 14),
      if (_auth == 'password')
        MtField(label: s.smFormPassword, child: TextField(controller: _pw, obscureText: _hide,
            decoration: InputDecoration(suffixIcon: MtIconButton(icon: _hide ? Icons.visibility_outlined : Icons.visibility_off_outlined, onPressed: () => setState(() => _hide = !_hide)))))
      else ...[
        MtField(label: s.smFormKeyFile, child: Column(crossAxisAlignment: CrossAxisAlignment.stretch, children: [
          TextField(controller: _key, maxLines: 5, minLines: 3, style: MtText.mono, textDirection: TextDirection.ltr, decoration: const InputDecoration(hintText: '-----BEGIN OPENSSH PRIVATE KEY-----')),
          const SizedBox(height: 8),
          Align(alignment: AlignmentDirectional.centerStart, child: MtButton(label: s.smMainPickKey, small: true, icon: Icons.upload_file, onPressed: _pickKey)),
        ])),
        const SizedBox(height: 14),
        MtField(label: s.smFormPassphrase, hint: s.smFormPassEmpty, child: TextField(controller: _pass, obscureText: true)),
      ],
      const SizedBox(height: 14),
      _row(wide, [
        MtField(label: s.smFormColor, child: Wrap(spacing: 8, runSpacing: 8, children: [
          for (final h in kCardColors) InkWell(onTap: () => setState(() => _color = h), borderRadius: BorderRadius.circular(999), child: Container(width: 26, height: 26,
              decoration: BoxDecoration(color: parseHex(h), shape: BoxShape.circle, border: Border.all(color: _color == h ? col.text : Colors.transparent, width: 2)))),
        ])),
        MtField(label: s.smFormPalette, child: _select<String>(_theme, [for (final e in kSshThemes.entries) (e.key, e.value.$1)], (v) => setState(() => _theme = v!))),
      ]),
      const SizedBox(height: 14),
      MtCheck(value: _remember, onChanged: (v) => setState(() => _remember = v), label: s.smFormLastDir,
          hint: (d['lastDir'] ?? '').toString().isNotEmpty ? '${s.smFormLastDirHint} ${s.smFormLastDirNow} ${d['lastDir']}' : s.smFormLastDirHint),
      const SizedBox(height: 14),
      MtField(label: s.smAppNotesLabel, child: TextField(controller: _notes, maxLines: 3, minLines: 2)),
      if (_testMsg != null) ...[const SizedBox(height: 14), MtBox(_testMsg!, kind: _testOk ? MtBoxKind.info : MtBoxKind.error, icon: _testOk ? Icons.check_circle_outline : Icons.error_outline)],
    ]);

    return Scaffold(
      backgroundColor: col.surface,
      appBar: AppBar(backgroundColor: col.surface, title: Row(children: [Icon(Icons.dns_outlined, size: 18, color: col.accent), const SizedBox(width: 8),
          Text(widget.existing == null ? s.smFormTitleNew : s.smFormTitleEdit, style: MtText.h2.copyWith(color: col.text))])),
      body: SafeArea(child: Column(children: [
        Expanded(child: Center(child: ConstrainedBox(constraints: const BoxConstraints(maxWidth: 760), child: body))),
        Container(
          padding: const EdgeInsets.fromLTRB(22, 14, 22, 18),
          decoration: BoxDecoration(border: Border(top: BorderSide(color: col.border))),
          child: wide
              ? Row(children: [
                  MtButton(label: s.smFormTest, icon: Icons.network_check, busy: _testing, onPressed: _test),
                  const Spacer(),
                  MtButton(label: s.commonCancel, onPressed: () => Navigator.of(context).pop()),
                  const SizedBox(width: 8),
                  MtButton(label: s.commonSave, onPressed: () => _save()),
                  const SizedBox(width: 8),
                  MtButton(label: s.smFormSaveConnect, kind: MtBtnKind.primary, icon: Icons.play_arrow, onPressed: () => _save(connect: true)),
                ])
              : Column(crossAxisAlignment: CrossAxisAlignment.stretch, children: [
                  MtButton(label: s.smFormSaveConnect, kind: MtBtnKind.primary, icon: Icons.play_arrow, expand: true, onPressed: () => _save(connect: true)),
                  const SizedBox(height: 8),
                  Row(children: [
                    Expanded(child: MtButton(label: s.smFormTest, icon: Icons.network_check, busy: _testing, expand: true, onPressed: _test)),
                    const SizedBox(width: 8),
                    Expanded(child: MtButton(label: s.commonSave, expand: true, onPressed: () => _save())),
                  ]),
                ]),
        ),
      ])),
    );
  }

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
          items: [for (final it in items) DropdownMenuItem(value: it.$1, child: Text(it.$2))], onChanged: onChanged)),
    );
  }
}
