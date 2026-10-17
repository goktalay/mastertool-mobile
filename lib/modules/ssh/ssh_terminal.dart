// SSH terminali — dartssh2 + xterm.dart. Masaüstü terminal penceresinin mobil karşılığı: üst çubukta bağlantı adı ve durum
// (bağlanılıyor… / bağlı / bağlantı kapandı), konsol paleti (bağlantı başına), kısayollar (sc.*: yapıştır / yapıştır ve çalıştır),
// özel tuş çubuğu (Esc, Tab, Ctrl, ok tuşları, |, ~), kapanınca Enter ile yeniden bağlanma, "son kaldığım klasör" takibi:
// yazılan satırlar izlenir, "cd …" komutları çözülür (lastDir). "Dosyalar": aynı bağlantıyla SFTP gezgini (ssh_files.dart) —
// telefonda ayrı sayfa, tablette (MtBreak.wide) terminalin sağında 360 px panel; gezgin cd takibindeki klasörde açılır.
import 'dart:convert';

import 'package:crypto/crypto.dart' as c;
import 'package:dartssh2/dartssh2.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:xterm/xterm.dart';

import '../../core/l10n/gen/mt_strings.dart';
import '../../core/sync.dart';
import '../../core/theme.dart';
import '../../widgets/mt_widgets.dart';
import '../ftp/ftp_browser.dart' show RemoteFsFactory;
import 'ssh_files.dart';
import 'ssh_model.dart';

class SshTerminalScreen extends StatefulWidget {
  const SshTerminalScreen({super.key, required this.conn, required this.engine, required this.onLastDir, required this.onHostKey,
      this.autoConnect = true, this.filesOpen = false, this.fsFactory});
  final SshConnection conn;
  final SyncEngine engine;
  final ValueChanged<String> onLastDir;
  final ValueChanged<String> onHostKey;
  /// Test: false ise açılışta bağlanmaz ("bağlantı kapandı" durumu).
  final bool autoConnect;
  /// Test: tablet dosya paneli açık başlar.
  final bool filesOpen;
  /// Test: SFTP gezgini için sahte uzak dosya sistemi.
  final RemoteFsFactory? fsFactory;
  @override
  State<SshTerminalScreen> createState() => _SshTerminalScreenState();
}

enum _St { connecting, connected, closed, failed }

class _SshTerminalScreenState extends State<SshTerminalScreen> {
  late final Terminal term = Terminal(maxLines: 10000);
  final ctl = TerminalController();
  SSHClient? _client;
  SSHSession? _session;
  _St _st = _St.connecting;
  String _err = '';
  bool _ctrl = false;
  late String _theme = widget.conn.theme;
  final _focus = FocusNode();
  // cd takibi: yazılan satır tamponu; Tab/kaçış dizisi görülürse satır "belirsiz" sayılır ve çözülmez
  String _lineBuf = '';
  bool _lineDirty = false;
  late String _curDir = widget.conn.rememberLastDir ? widget.conn.lastDir : '';
  String _prevDir = '';
  // tablet dosya paneli
  late bool _showFiles = widget.filesOpen;
  late String _filesDir = _curDir;

  @override
  void initState() {
    super.initState();
    term.onOutput = (data) {
      _feedInput(data);
      _session?.write(utf8.encode(data));
    };
    term.onResize = (w, h, pw, ph) => _session?.resizeTerminal(w, h, pw, ph);
    if (!widget.autoConnect) _st = _St.closed;
    // Sözlük (MtStrings.of) initState içinde alınamaz; bağlanma ilk kareden sonra
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (!mounted) return;
      if (widget.autoConnect) {
        _connect();
      } else {
        final s = MtStrings.of(context);
        term.write('\r\n\x1b[33m${s.smTermClosed}\x1b[0m ${s.smTermReconnectEnter}\r\n');
      }
    });
  }

  Future<void> _connect() async {
    final s = MtStrings.of(context);
    setState(() { _st = _St.connecting; _err = ''; });
    term.write('\r\n\x1b[36m${s.smTermConnecting}\x1b[0m\r\n');
    final cn = widget.conn;
    try {
      final sock = await SSHSocket.connect(cn.host, cn.port, timeout: const Duration(seconds: 15));
      final client = SSHClient(sock, username: cn.username,
          onPasswordRequest: () => cn.password,
          identities: cn.authType == 'key' && cn.privateKey.isNotEmpty ? SSHKeyPair.fromPem(cn.privateKey, cn.passphrase.isEmpty ? null : cn.passphrase) : null,
          onVerifyHostKey: (type, key) {
            final fp = base64.encode(c.sha256.convert(key).bytes);
            if (cn.hostKey != null && cn.hostKey!.isNotEmpty && cn.hostKey != fp) {
              _err = s.smMainErrHostKey(fp, cn.hostKey!);
              return false;
            }
            if (cn.hostKey == null || cn.hostKey!.isEmpty) widget.onHostKey(fp);
            return true;
          });
      _client = client;
      await client.authenticated.timeout(const Duration(seconds: 20));
      final session = await client.shell(pty: SSHPtyConfig(width: term.viewWidth, height: term.viewHeight, type: 'xterm-256color'));
      _session = session;
      session.stdout.cast<List<int>>().transform(const Utf8Decoder(allowMalformed: true)).listen(term.write);
      session.stderr.cast<List<int>>().transform(const Utf8Decoder(allowMalformed: true)).listen(term.write);
      session.done.then((_) => _onClosed());
      if (cn.rememberLastDir && cn.lastDir.isNotEmpty) session.write(utf8.encode('cd ${_q(cn.lastDir)}\n'));
      _lineBuf = ''; _lineDirty = false;
      setState(() => _st = _St.connected);
    } catch (e) {
      if (!mounted) return;
      setState(() { _st = _St.failed; if (_err.isEmpty) _err = e.toString(); });
      term.write('\r\n\x1b[31m${s.smTermConnectFailed} $_err\x1b[0m\r\n${s.smTermRetryEnter}\r\n');
    }
  }

  static String _q(String p) => "'${p.replaceAll("'", "'\\''")}'";

  // ---- cd takibi (terminale giden her girdi: klavye, tuş çubuğu, kısayollar, "Terminalde bu klasöre git")
  void _feedInput(String data) {
    if (data.contains('\x1b')) { _lineDirty = true; return; } // ok tuşları / kaçış dizileri: satır geçmişten gelebilir
    for (final ch in data.runes) {
      switch (ch) {
        case 0x0D || 0x0A: _endLine();
        case 0x7F || 0x08: if (_lineBuf.isNotEmpty) _lineBuf = _lineBuf.substring(0, _lineBuf.length - 1);
        case 0x03 || 0x04 || 0x15: _lineBuf = ''; _lineDirty = false; // ^C ^D ^U
        case 0x09: _lineDirty = true; // Tab tamamlama: yazılanla çalışan farklı
        default: if (ch >= 0x20) _lineBuf += String.fromCharCode(ch);
      }
    }
  }

  void _endLine() {
    final line = _lineBuf.trim(), dirty = _lineDirty;
    _lineBuf = ''; _lineDirty = false;
    if (dirty) return;
    final m = RegExp(r'^cd(?:\s+(.*))?$').firstMatch(line);
    if (m == null) return;
    var arg = (m.group(1) ?? '').trim();
    if (arg.length >= 2 && ((arg.startsWith("'") && arg.endsWith("'")) || (arg.startsWith('"') && arg.endsWith('"')))) arg = arg.substring(1, arg.length - 1);
    _noteCd(arg);
  }

  /// cd hedefini çözer; ev dizini ('cd', '~') bilinmez → boş (gezgin kendi ev dizininde açılır).
  void _noteCd(String arg) {
    final prev = _curDir;
    final String next;
    if (arg.isEmpty || arg == '~' || arg.startsWith('~/')) {
      next = '';
    } else if (arg == '-') {
      next = _prevDir;
    } else if (arg.startsWith('/')) {
      next = _norm(arg);
    } else {
      next = _curDir.isEmpty ? '' : _norm('$_curDir/$arg');
    }
    _prevDir = prev;
    _curDir = next;
    if (next.isNotEmpty && widget.conn.rememberLastDir && next != widget.conn.lastDir) widget.onLastDir(next);
  }

  static String _norm(String p) {
    final out = <String>[];
    for (final seg in p.split('/')) {
      if (seg.isEmpty || seg == '.') continue;
      if (seg == '..') { if (out.isNotEmpty) out.removeLast(); continue; }
      out.add(seg);
    }
    return '/${out.join('/')}';
  }

  // ---- Dosyalar (SFTP gezgini)
  void _openFiles() {
    if (MtBreak.wide(context)) {
      setState(() { _showFiles = !_showFiles; _filesDir = _curDir; });
      return;
    }
    _filesDir = _curDir;
    Navigator.of(context).push(MaterialPageRoute(builder: (_) => _filesPanel(embedded: false)));
  }

  Widget _filesPanel({required bool embedded}) => SshFilesPanel(
        key: ValueKey('files:$_filesDir'), conn: widget.conn, engine: widget.engine, startDir: _filesDir, onHostKey: widget.onHostKey,
        fsFactory: widget.fsFactory, embedded: embedded,
        onClose: embedded ? () => setState(() => _showFiles = false) : null,
        onCdHere: (p) {
          _send('cd ${_q(p)}\n'); // _send → _feedInput: _curDir da güncellenir
          if (!embedded) Navigator.of(context).pop();
          _focus.requestFocus();
        },
      );

  void _onClosed() {
    if (!mounted || _st == _St.failed) return;
    final s = MtStrings.of(context);
    setState(() => _st = _St.closed);
    term.write('\r\n\x1b[33m${s.smTermClosed}\x1b[0m ${s.smTermReconnectEnter}\r\n');
  }

  void _disconnect() {
    _session?.close();
    _client?.close();
    _session = null;
    _client = null;
  }

  @override
  void dispose() {
    _disconnect();
    _focus.dispose();
    super.dispose();
  }

  void _send(String data) {
    if (_st != _St.connected) {
      if (data == '\r' || data == '\n') _connect();
      return;
    }
    _feedInput(data);
    _session?.write(utf8.encode(data));
  }

  void _key(String seq) {
    _send(seq);
    _focus.requestFocus();
  }

  Future<void> _shortcuts() async {
    final s = MtStrings.of(context);
    final lib = widget.engine.library;
    final list = [for (final e in lib.items.entries) if (e.value.$1 == 'shortcut') SshShortcut(e.key, e.value.$2)]..sort((a, b) => a.order.compareTo(b.order));
    final col = MtColors.of(context);
    await showModalBottomSheet(
      context: context, backgroundColor: col.surface, shape: const RoundedRectangleBorder(borderRadius: BorderRadius.vertical(top: Radius.circular(16))),
      builder: (ctx) => SafeArea(child: Column(mainAxisSize: MainAxisSize.min, children: [
        Padding(padding: const EdgeInsets.fromLTRB(18, 14, 8, 6), child: Row(children: [
          Text(s.smSbShortcuts, style: MtText.h2.copyWith(color: col.text)), const Spacer(),
          MtButton(label: s.smScNew, small: true, icon: Icons.add, onPressed: () { Navigator.pop(ctx); _editShortcut(null); }),
        ])),
        if (list.isEmpty) Padding(padding: const EdgeInsets.all(20), child: Text(s.smScEmpty.replaceAll('<br>', '\n'), textAlign: TextAlign.center, style: MtText.small.copyWith(color: col.text3))),
        Flexible(child: ListView(shrinkWrap: true, children: [
          for (final sc in list) ListTile(
            dense: true, title: Text(sc.name, style: MtText.body.copyWith(color: col.text)),
            subtitle: Text(sc.command, maxLines: 1, overflow: TextOverflow.ellipsis, textDirection: TextDirection.ltr, style: MtText.mono.copyWith(color: col.text2)),
            onTap: () { Navigator.pop(ctx); _send(sc.command + (sc.enter ? '\n' : '')); },
            trailing: PopupMenuButton<String>(
              icon: Icon(Icons.more_vert, size: 18, color: col.text2),
              onSelected: (v) {
                Navigator.pop(ctx);
                if (v == 'paste') _send(sc.command);
                if (v == 'copy') Clipboard.setData(ClipboardData(text: sc.command));
                if (v == 'edit') _editShortcut(sc);
                if (v == 'del') { lib.items.remove(sc.id); widget.engine.onLocalChange(); }
              },
              itemBuilder: (_) => [
                PopupMenuItem(value: 'paste', child: Text(s.smScPasteNoEnter)), PopupMenuItem(value: 'copy', child: Text(s.smScCopy)),
                PopupMenuItem(value: 'edit', child: Text(s.commonEdit)), PopupMenuItem(value: 'del', child: Text(s.commonDelete)),
              ],
            ),
          ),
        ])),
      ])),
    );
  }

  Future<void> _editShortcut(SshShortcut? sc) async {
    final s = MtStrings.of(context);
    final name = TextEditingController(text: sc?.name ?? ''), cmd = TextEditingController(text: sc?.command ?? '');
    var enter = sc?.enter ?? true;
    final ok = await showDialog<bool>(
      context: context,
      builder: (ctx) => StatefulBuilder(builder: (ctx, set) => AlertDialog(
        title: Text(sc == null ? s.smScTitleNew : s.smScTitleEdit),
        content: Column(mainAxisSize: MainAxisSize.min, crossAxisAlignment: CrossAxisAlignment.stretch, children: [
          MtField(label: s.smScName, child: TextField(controller: name, decoration: InputDecoration(hintText: s.smScNamePh))),
          const SizedBox(height: 12),
          MtField(label: s.smScCommand, child: TextField(controller: cmd, maxLines: 3, minLines: 1, style: MtText.mono, textDirection: TextDirection.ltr)),
          const SizedBox(height: 10),
          MtCheck(value: enter, onChanged: (v) => set(() => enter = v), label: s.smScEnter, hint: s.smScEnterHint),
        ]),
        actionsPadding: const EdgeInsets.fromLTRB(22, 0, 22, 18),
        actions: [MtButton(label: s.commonCancel, onPressed: () => Navigator.pop(ctx, false)), MtButton(label: s.commonSave, kind: MtBtnKind.primary, onPressed: () => Navigator.pop(ctx, true))],
      )),
    );
    if (ok != true || cmd.text.trim().isEmpty) return;
    final lib = widget.engine.library;
    final order = sc?.order ?? (lib.items.values.where((v) => v.$1 == 'shortcut').length);
    lib.items[sc?.id ?? newItemId()] = ('shortcut', {'name': name.text.trim().isEmpty ? cmd.text.trim() : name.text.trim(), 'command': cmd.text.trim(), 'enter': enter, 'order': order});
    await widget.engine.onLocalChange();
  }

  Future<void> _palette() async {
    final s = MtStrings.of(context);
    final col = MtColors.of(context);
    final v = await showDialog<String>(
      context: context,
      builder: (ctx) => SimpleDialog(title: Text(s.smPaletteTitle), children: [
        for (final e in kSshThemes.entries) SimpleDialogOption(onPressed: () => Navigator.pop(ctx, e.key), child: Row(children: [
          Container(width: 18, height: 18, decoration: BoxDecoration(color: Color(e.value.$2), borderRadius: BorderRadius.circular(4), border: Border.all(color: col.border))),
          const SizedBox(width: 10), Text(e.value.$1), if (e.key == _theme) ...[const Spacer(), Icon(Icons.check, size: 16, color: col.accent)],
        ])),
      ]),
    );
    if (v == null) return;
    setState(() => _theme = v);
    final lib = widget.engine.library;
    final cur = lib.items[widget.conn.id];
    if (cur != null) {
      lib.items[widget.conn.id] = (cur.$1, {...cur.$2, 'theme': v});
      await widget.engine.onLocalChange();
      if (mounted) mtToast(context, s.smPaletteSaved, type: 'ok');
    }
  }

  @override
  Widget build(BuildContext context) {
    final s = MtStrings.of(context);
    final col = MtColors.of(context);
    final th = kSshThemes[_theme] ?? kSshThemes['sshmaster']!;
    final bg = Color(th.$2), fg = Color(th.$3), cur = Color(th.$4);
    final status = switch (_st) { _St.connecting => s.smPaneStatusConnecting, _St.connected => '${widget.conn.username}@${widget.conn.host}', _St.closed => s.smPaneStatusClosed, _St.failed => s.smPaneStatusNoConn };
    final dot = switch (_st) { _St.connected => col.ok, _St.connecting => col.warn, _ => col.err };
    final wide = MtBreak.wide(context);
    final console = Column(children: [
      Expanded(child: TerminalView(
        term, controller: ctl, focusNode: _focus, autofocus: true, padding: const EdgeInsets.all(6),
        textStyle: const TerminalStyle(fontSize: 13, fontFamily: 'monospace'),
        theme: TerminalTheme(
          cursor: cur, selection: cur.withValues(alpha: .35), foreground: fg, background: bg,
          black: const Color(0xFF000000), red: const Color(0xFFF87171), green: const Color(0xFF34D399), yellow: const Color(0xFFFBBF24),
          blue: const Color(0xFF60A5FA), magenta: const Color(0xFFC084FC), cyan: const Color(0xFF22D3EE), white: const Color(0xFFE5E7EB),
          brightBlack: const Color(0xFF6B7280), brightRed: const Color(0xFFFCA5A5), brightGreen: const Color(0xFF6EE7B7), brightYellow: const Color(0xFFFDE68A),
          brightBlue: const Color(0xFF93C5FD), brightMagenta: const Color(0xFFD8B4FE), brightCyan: const Color(0xFF67E8F9), brightWhite: const Color(0xFFFFFFFF),
          searchHitBackground: const Color(0xFFFBBF24), searchHitBackgroundCurrent: const Color(0xFFF97316), searchHitForeground: const Color(0xFF000000),
        ),
      )),
      _KeyBar(ctrl: _ctrl, onCtrl: () => setState(() => _ctrl = !_ctrl), onKey: (seq) {
        if (_ctrl && seq.length == 1) {
          final code = seq.toLowerCase().codeUnitAt(0) - 96;
          if (code >= 1 && code <= 26) { _key(String.fromCharCode(code)); setState(() => _ctrl = false); return; }
        }
        _key(seq);
      }),
    ]);
    return Scaffold(
      backgroundColor: bg,
      appBar: AppBar(
        backgroundColor: col.bg, toolbarHeight: 46,
        title: Row(children: [
          Container(width: 8, height: 8, decoration: BoxDecoration(color: dot, shape: BoxShape.circle)), const SizedBox(width: 8),
          Expanded(child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            Text(widget.conn.name.isEmpty ? widget.conn.host : widget.conn.name, maxLines: 1, overflow: TextOverflow.ellipsis, style: MtText.cardTitle.copyWith(color: col.text)),
            Text(status, maxLines: 1, overflow: TextOverflow.ellipsis, textDirection: TextDirection.ltr, style: MtText.tiny.copyWith(color: col.text3)),
          ])),
        ]),
        actions: [
          MtIconButton(icon: wide && _showFiles ? Icons.folder_open : Icons.folder_open_outlined, tooltip: s.smMobFiles, color: wide && _showFiles ? col.accent : null, onPressed: _openFiles),
          MtIconButton(icon: Icons.bolt_outlined, tooltip: s.smSbShortcuts, onPressed: _shortcuts),
          MtIconButton(icon: Icons.palette_outlined, tooltip: s.smPaletteTitle, onPressed: _palette),
          if (_st == _St.connected) MtIconButton(icon: Icons.cleaning_services_outlined, tooltip: s.smPaneClear, onPressed: () => _send('\x0c'))
          else MtIconButton(icon: Icons.refresh, tooltip: s.smPaneReconnect, onPressed: _connect),
          const SizedBox(width: 6),
        ],
      ),
      body: SafeArea(child: wide && _showFiles
          ? Row(children: [
              Expanded(child: console),
              Container(width: 1, color: col.border),
              SizedBox(width: kSshFilesPanelWidth, child: _filesPanel(embedded: true)),
            ])
          : console),
    );
  }
}

class _KeyBar extends StatelessWidget {
  const _KeyBar({required this.ctrl, required this.onCtrl, required this.onKey});
  final bool ctrl;
  final VoidCallback onCtrl;
  final ValueChanged<String> onKey;
  @override
  Widget build(BuildContext context) {
    final col = MtColors.of(context);
    Widget k(String label, String seq, {bool on = false, VoidCallback? tap}) => Padding(
          padding: const EdgeInsets.symmetric(horizontal: 3),
          child: Material(
            color: on ? col.accent : col.surface2, borderRadius: BorderRadius.circular(6),
            child: InkWell(borderRadius: BorderRadius.circular(6), onTap: tap ?? () => onKey(seq),
                child: Container(height: 32, padding: const EdgeInsets.symmetric(horizontal: 12), alignment: Alignment.center,
                    decoration: BoxDecoration(borderRadius: BorderRadius.circular(6), border: Border.all(color: col.border)),
                    child: Text(label, style: TextStyle(fontSize: 12.5, fontWeight: FontWeight.w600, color: on ? MtColors.onAccent : col.text)))),
          ),
        );
    return Container(
      height: 44, color: col.bg, padding: const EdgeInsets.symmetric(horizontal: 4),
      child: ListView(scrollDirection: Axis.horizontal, children: [
        k('Esc', '\x1b'), k('Tab', '\t'), k('Ctrl', '', on: ctrl, tap: onCtrl), k('↑', '\x1b[A'), k('↓', '\x1b[B'), k('←', '\x1b[D'), k('→', '\x1b[C'),
        k('|', '|'), k('~', '~'), k('/', '/'), k('-', '-'), k('Home', '\x1b[H'), k('End', '\x1b[F'), k('^C', '\x03'), k('^D', '\x04'), k('^Z', '\x1a'),
      ]),
    );
  }
}
