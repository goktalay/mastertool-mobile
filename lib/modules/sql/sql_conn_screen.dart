// Bağlantı penceresi (mobil) — masaüstü conn.html: üst çubukta durum noktası, bağlantı adı, user@host:port, motor rozeti,
// "Salt okunur" rozeti (dokununca kip değiştirme onayı), Yeni SQL, Yeniden bağlan, Ayarlar. Tablet (MtBreak.wide): sol NESNELER
// ağacı (300 px) + sağ sekme şeridi (SQL n / tablo veri sekmeleri, kapatma, +). Telefon: ağaç tam sayfa; tablo → veri sayfası,
// Yeni SQL → editör sayfası. Alt durum çubuğu: ürün sürümü · Şifresiz · veritabanı · kullanıcı.
import 'package:flutter/material.dart';

import '../../core/l10n/gen/mt_strings.dart';
import '../../core/sync.dart';
import '../../core/theme.dart';
import '../../widgets/mt_widgets.dart';
import 'drivers/sql_driver.dart';
import 'sql_data_tab.dart';
import 'sql_editor.dart';
import 'sql_model.dart';
import 'sql_session.dart';
import 'sql_settings.dart';
import 'sql_tree.dart';

class SqlConnScreen extends StatefulWidget {
  const SqlConnScreen({super.key, required this.conn, required this.engine, required this.settings, required this.onHostKey});
  final SqlConnection conn;
  final SyncEngine engine;
  final SqlSettings settings;
  final ValueChanged<String> onHostKey;
  @override
  State<SqlConnScreen> createState() => _SqlConnScreenState();
}

class _WsTab {
  _WsTab({required this.id, required this.title, required this.widget, required this.isSql});
  final String id, title;
  final Widget widget;
  final bool isSql;
}

class _SqlConnScreenState extends State<SqlConnScreen> {
  late SqlSettings _settings = widget.settings;
  late final SqlSession _session = SqlSession(conn: widget.conn, settings: _settings, onHostKey: widget.onHostKey);
  final List<_WsTab> _tabs = [];
  int _active = 0, _sqlSeq = 0;
  String? _error;
  final _treeKey = GlobalKey<SqlTreeState>();

  @override
  void initState() {
    super.initState();
    _session.addListener(_onSession);
    _connect();
  }

  @override
  void dispose() {
    _session.removeListener(_onSession);
    _session.dispose();
    super.dispose();
  }

  void _onSession() { if (mounted) setState(() {}); }

  String _phaseText(MtStrings s) => switch (_session.phase) { 'tunnel' => s.sqMobTunnelOpening, 'db' => s.sqMobConnectingDb, _ => s.sqCwConnecting };

  Future<void> _connect() async {
    setState(() => _error = null);
    if (!widget.conn.meta.mobile) { setState(() => _error = MtStrings.of(context).sqMobUnsupportedMobile); return; }
    var pw = _session.password;
    if (!widget.conn.meta.isFile && widget.conn.password.isEmpty && pw == null) {
      pw = await _askPassword();
      if (pw == null) { if (mounted) Navigator.of(context).maybePop(); return; }
      _session.password = pw;
    }
    try {
      await _session.connect();
      if (!mounted) return;
      if (_tabs.isEmpty && MtBreak.wide(context)) _newSql();
    } catch (e) {
      if (mounted) setState(() => _error = sqlErrorText(MtStrings.of(context), e));
    }
  }

  Future<String?> _askPassword() async {
    final s = MtStrings.of(context);
    final ctl = TextEditingController();
    return showDialog<String>(
      context: context,
      builder: (ctx) => AlertDialog(
        title: Text(s.sqCwPasswordTitle),
        content: Column(mainAxisSize: MainAxisSize.min, crossAxisAlignment: CrossAxisAlignment.start, children: [
          Text(s.sqCwPasswordFor(widget.conn.host, widget.conn.userOrDefault), style: MtText.small.copyWith(color: MtColors.of(ctx).text2)),
          const SizedBox(height: 10),
          TextField(controller: ctl, autofocus: true, obscureText: true, onSubmitted: (v) => Navigator.pop(ctx, v)),
        ]),
        actionsPadding: const EdgeInsets.fromLTRB(22, 0, 22, 18),
        actions: [MtButton(label: s.commonCancel, onPressed: () => Navigator.pop(ctx)), MtButton(label: s.commonConnect, kind: MtBtnKind.primary, onPressed: () => Navigator.pop(ctx, ctl.text))],
      ),
    );
  }

  Future<void> _toggleReadOnly() async {
    final s = MtStrings.of(context);
    if (!_session.connected) return;
    if (_session.readOnly) {
      final ok = await showDialog<bool>(context: context, builder: (ctx) => AlertDialog(
            title: Text(s.sqCwDisableRo), content: Text(s.sqCwDisableRoMsg), actionsPadding: const EdgeInsets.fromLTRB(22, 0, 22, 18),
            actions: [MtButton(label: s.commonCancel, onPressed: () => Navigator.pop(ctx, false)), MtButton(label: s.sqCwDisableRoOk, kind: MtBtnKind.dangerPrimary, onPressed: () => Navigator.pop(ctx, true))],
          )) ?? false;
      if (!ok) return;
    }
    try {
      await _session.driver!.setReadOnly(!_session.readOnly);
      setState(() => _session.readOnly = !_session.readOnly);
      if (mounted) mtToast(context, _session.readOnly ? s.sqCwRoOn : s.sqCwRoOff, type: _session.readOnly ? 'ok' : '');
    } catch (e) {
      if (mounted) mtToast(context, sqlErrorText(s, e), type: 'err');
    }
  }

  void _newSql({String sql = '', String? database}) {
    final s = MtStrings.of(context);
    _sqlSeq++;
    final title = s.sqSqlTabTitle(_sqlSeq.toString());
    if (!MtBreak.wide(context)) {
      Navigator.of(context).push(MaterialPageRoute(builder: (_) => SqlEditorTab(session: _session, title: title, initialSql: sql, database: database, standalone: true)));
      return;
    }
    setState(() {
      _tabs.add(_WsTab(id: 'sql$_sqlSeq', title: title, isSql: true, widget: SqlEditorTab(key: ValueKey('sql$_sqlSeq'), session: _session, title: title, initialSql: sql, database: database)));
      _active = _tabs.length - 1;
    });
  }

  void _openTable(String db, String schema, String table, String kind) {
    if (!MtBreak.wide(context)) {
      Navigator.of(context).push(MaterialPageRoute(builder: (_) => SqlDataTab(session: _session, database: db, schema: schema, table: table, standalone: true,
          onOpenInEditor: (sql, d) => _newSql(sql: sql, database: d))));
      return;
    }
    final id = 'data:$db/$schema/$table';
    final i = _tabs.indexWhere((t) => t.id == id);
    if (i >= 0) { setState(() => _active = i); return; }
    setState(() {
      _tabs.add(_WsTab(id: id, title: table, isSql: false, widget: SqlDataTab(key: ValueKey(id), session: _session, database: db, schema: schema, table: table,
          onOpenInEditor: (sql, d) => _newSql(sql: sql, database: d))));
      _active = _tabs.length - 1;
    });
  }

  void _closeTab(int i) => setState(() {
        _tabs.removeAt(i);
        if (_active >= _tabs.length) _active = _tabs.isEmpty ? 0 : _tabs.length - 1;
      });

  Future<void> _openSettings() async {
    final r = await Navigator.of(context).push<bool>(MaterialPageRoute(builder: (_) => SqlSettingsScreen(engine: widget.engine)));
    if (r == true && mounted) setState(() => _settings = SqlSettings(widget.engine.library.items['settings']?.$2 ?? SqlSettings.blank()));
  }

  @override
  Widget build(BuildContext context) {
    final s = MtStrings.of(context);
    final c = MtColors.of(context);
    final wide = MtBreak.wide(context);
    final conn = widget.conn;
    final st = _session.state;
    final dot = switch (st) { SessionState.connected => c.ok, SessionState.connecting => c.warn, _ => c.err };
    final sub = switch (st) {
      SessionState.connected => conn.meta.isFile ? conn.subtitle(s.sqFormInMemory) : '${conn.userOrDefault}@${conn.host}:${conn.port}',
      SessionState.connecting => _phaseText(s),
      SessionState.failed => s.sqCwConnectFailed,
      _ => s.sqCwNotConnected,
    };

    final tree = SqlTree(key: _treeKey, session: _session, onOpenTable: _openTable, onNewSql: (db) => _newSql(database: db), onOpenFile: (sql) => _newSql(sql: sql), selectedId: null);

    Widget content;
    if (_error != null) {
      content = Center(child: Padding(padding: const EdgeInsets.all(24), child: ConstrainedBox(constraints: const BoxConstraints(maxWidth: 520), child: Column(mainAxisSize: MainAxisSize.min, children: [
        MtBox('${s.sqCwConnectFailed}\n$_error', kind: MtBoxKind.error, icon: Icons.error_outline), const SizedBox(height: 12),
        if (conn.meta.mobile) MtButton(label: s.sqCwRetry, icon: Icons.refresh, kind: MtBtnKind.primary, onPressed: _connect),
      ]))));
    } else if (st == SessionState.connecting) {
      content = Center(child: Column(mainAxisSize: MainAxisSize.min, children: [const MtSpinner(size: 22), const SizedBox(height: 10), Text(_phaseText(s), style: MtText.small.copyWith(color: c.text2))]));
    } else if (!wide) {
      content = tree;
    } else {
      content = Row(children: [
        SizedBox(width: 300, child: Container(decoration: BoxDecoration(color: c.bg2, border: Border(right: BorderSide(color: c.border))), child: tree)),
        Expanded(child: Column(children: [
          Container(
            height: 36, decoration: BoxDecoration(color: c.surface, border: Border(bottom: BorderSide(color: c.border))),
            child: Row(children: [
              Expanded(child: ListView(scrollDirection: Axis.horizontal, children: [for (var i = 0; i < _tabs.length; i++) _tabChip(c, i)])),
              MtIconButton(icon: Icons.add, tooltip: s.sqCwNewSql, onPressed: _session.connected ? () => _newSql() : null),
            ]),
          ),
          Expanded(child: _tabs.isEmpty
              ? Center(child: Text(s.sqCwEmptyWorkspace.replaceAll('<br>', '\n'), textAlign: TextAlign.center, style: MtText.small.copyWith(color: c.text3)))
              : IndexedStack(index: _active.clamp(0, _tabs.length - 1), children: [for (final t in _tabs) t.widget])),
        ])),
      ]);
    }

    final info = sessionInfoLine(_session, s);
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 46,
        title: Row(children: [
          Container(width: 8, height: 8, decoration: BoxDecoration(color: dot, shape: BoxShape.circle)), const SizedBox(width: 8),
          Expanded(child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            Row(children: [
              Flexible(child: Text(conn.name.isEmpty ? conn.subtitle(s.sqFormInMemory) : conn.name, maxLines: 1, overflow: TextOverflow.ellipsis, style: MtText.cardTitle.copyWith(color: c.text))),
              if (wide) ...[const SizedBox(width: 10), _badge(c, conn.meta.short, Icons.storage_outlined, c.text2, c.surface2, c.border)],
            ]),
            Text(sub, maxLines: 1, overflow: TextOverflow.ellipsis, textDirection: TextDirection.ltr, style: MtText.tiny.copyWith(color: c.text3)),
          ])),
          const SizedBox(width: 6),
          Tooltip(message: _session.readOnly ? s.sqCwReadOnlyTip : s.sqCwReadWriteTip, child: InkWell(
            borderRadius: BorderRadius.circular(999), onTap: _session.connected ? _toggleReadOnly : null,
            child: _session.readOnly
                ? _badge(c, wide ? s.sqCwReadOnly : '', Icons.lock_outline, c.ok, c.ok.withValues(alpha: .12), c.ok.withValues(alpha: .5))
                : _badge(c, wide ? s.sqCwReadWrite : '', Icons.lock_open_outlined, c.warn, c.warn.withValues(alpha: .12), c.warn.withValues(alpha: .5)),
          )),
        ]),
        actions: [
          if (wide) Padding(padding: const EdgeInsets.only(right: 6), child: MtButton(label: s.sqCwNewSql, icon: Icons.code, small: true, onPressed: _session.connected ? () => _newSql() : null))
          else MtIconButton(icon: Icons.code, tooltip: s.sqCwNewSql, onPressed: _session.connected ? () => _newSql() : null),
          if (wide) Padding(padding: const EdgeInsets.only(right: 6), child: MtButton(label: s.sqCwReconnect, icon: Icons.refresh, small: true, onPressed: st == SessionState.connecting ? null : () { _tabs.clear(); _connect(); }))
          else MtIconButton(icon: Icons.refresh, tooltip: s.sqCwReconnect, onPressed: st == SessionState.connecting ? null : _connect),
          MtIconButton(icon: Icons.settings_outlined, tooltip: s.sqAppSettings, onPressed: _openSettings),
          const SizedBox(width: 6),
        ],
      ),
      body: SafeArea(child: Column(children: [
        Expanded(child: content),
        if (info.isNotEmpty)
          Container(
            height: 24, padding: const EdgeInsets.symmetric(horizontal: 12), alignment: AlignmentDirectional.centerStart,
            decoration: BoxDecoration(color: c.surface, border: Border(top: BorderSide(color: c.border))),
            child: Row(children: [
              Icon(Icons.dns_outlined, size: 12, color: c.text3), const SizedBox(width: 6),
              Expanded(child: Text(info, maxLines: 1, overflow: TextOverflow.ellipsis, style: MtText.tiny.copyWith(color: _session.driver?.serverInfo.tls == false && !conn.meta.isFile ? c.warn : c.text3))),
            ]),
          ),
      ])),
    );
  }

  Widget _badge(MtColors c, String text, IconData icon, Color fg, Color bg, Color border) => Container(
        height: 22, padding: EdgeInsets.symmetric(horizontal: text.isEmpty ? 5 : 8),
        decoration: BoxDecoration(color: bg, borderRadius: BorderRadius.circular(999), border: Border.all(color: border)),
        child: Row(mainAxisSize: MainAxisSize.min, children: [
          Icon(icon, size: 12, color: fg),
          if (text.isNotEmpty) ...[const SizedBox(width: 4), Text(text, style: TextStyle(fontSize: 11, fontWeight: FontWeight.w600, color: fg))],
        ]),
      );

  Widget _tabChip(MtColors c, int i) {
    final t = _tabs[i];
    final on = i == _active;
    return InkWell(
      onTap: () => setState(() => _active = i),
      child: Container(
        padding: const EdgeInsetsDirectional.only(start: 12, end: 2),
        decoration: BoxDecoration(border: Border(bottom: BorderSide(color: on ? c.accent : Colors.transparent, width: 2), right: BorderSide(color: c.border))),
        child: Row(mainAxisSize: MainAxisSize.min, children: [
          Icon(t.isSql ? Icons.code : Icons.table_chart_outlined, size: 13, color: on ? c.accent : c.text3), const SizedBox(width: 6),
          Text(t.title, style: MtText.btnSm.copyWith(color: on ? c.text : c.text2, fontWeight: on ? FontWeight.w600 : FontWeight.w400)),
          MtIconButton(icon: Icons.close, size: 16, onPressed: () => _closeTab(i)),
        ]),
      ),
    );
  }
}
