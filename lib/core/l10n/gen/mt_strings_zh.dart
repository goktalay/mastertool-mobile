// ignore: unused_import
import 'package:intl/intl.dart' as intl;

import 'mt_strings.dart';

// ignore_for_file: type=lint

/// The translations for Chinese (`zh`).
class MtStringsZh extends MtStrings {
  MtStringsZh([String locale = 'zh']) : super(locale);

  @override
  String get setGeneral => '常规';

  @override
  String get setAccount => '账户';

  @override
  String get setAbout => '关于';

  @override
  String aboutVersion(String version) {
    return '版本 $version';
  }

  @override
  String get aboutFamily =>
      'Mastertool 系列成员：SSH Master · FTP Masters · SQL Master · Notepad Master · Convert Master · IP Tools';

  @override
  String get aboutCheckUpdate => '检查更新';

  @override
  String get aboutChecking => '正在检查…';

  @override
  String aboutUpToDate(String app) {
    return '$app 已是最新版本。';
  }

  @override
  String aboutCheckFailed(String msg) {
    return '无法检查更新：$msg';
  }

  @override
  String get aboutLicenses => '开源许可';

  @override
  String aboutLicensesIntro(String app) {
    return '$app 使用以下开源组件：';
  }

  @override
  String authErrAppDisabled(String app) {
    return '管理员已为此账户停用 $app。请联系你的账户管理员。';
  }

  @override
  String authErrWrongApp(String app) {
    return '此会话属于其他应用。请重新登录 $app。';
  }

  @override
  String get authSignedOut => '已在此电脑上的某个 Mastertool 应用中退出登录。请重新登录。';

  @override
  String get authSubtitle => '使用你的账户登录';

  @override
  String get authEmail => '电子邮件';

  @override
  String get authPassword => '密码';

  @override
  String get authRemember => '记住我';

  @override
  String get authForgot => '忘记密码';

  @override
  String get authNoAccount => '还没有账户？';

  @override
  String get authRegister => '创建账户';

  @override
  String get authSubmit => '登录';

  @override
  String get authWorking => '正在登录…';

  @override
  String get authErrRequired => '需要填写电子邮件和密码。';

  @override
  String get authErrBadCredentials => '电子邮件或密码错误。';

  @override
  String get authErrUnverified => '你的电子邮件尚未验证。请点击收件箱中的链接。';

  @override
  String get authErrSuspended => '你的账户已被停用。';

  @override
  String get authErrRateLimited => '尝试次数过多。请一分钟后再试。';

  @override
  String get authErrOffline => '无法连接服务器。请检查网络连接。';

  @override
  String get authErrSessionExpired => '会话已过期或密码已更改。请重新登录。';

  @override
  String authErrServer(String msg) {
    return '无法登录：$msg';
  }

  @override
  String get acctSection => '账户与同步';

  @override
  String acctSignedInAs(String email) {
    return '已登录：$email';
  }

  @override
  String get acctSyncToggle => '与网页同步连接';

  @override
  String get acctSyncHint =>
      '连接、文件夹和快捷命令会以端到端加密方式备份到你的账户，服务器无法读取。字号、托盘等设备设置不会上传。';

  @override
  String acctLastSync(String time) {
    return '上次同步：$time';
  }

  @override
  String get acctNever => '尚未同步';

  @override
  String get acctSyncNow => '立即同步';

  @override
  String get acctDeleteRemote => '删除服务器上的副本';

  @override
  String get acctDeleteRemoteMsg => '将删除你账户中的加密库副本并关闭同步。此电脑上的连接不会被删除。';

  @override
  String get acctDeleteRemoteDone => '已删除服务器副本并关闭同步';

  @override
  String get acctLogout => '退出登录';

  @override
  String get acctLogoutMsg => '将退出登录。此设备上的连接和项目将保留。';

  @override
  String get acctMyAccount => '我的账户（网页）';

  @override
  String get acctBackupNotice => '已使用其他账户登录；此电脑上之前的连接已备份。';

  @override
  String get syncOff => '同步已关闭';

  @override
  String get syncSyncing => '正在同步…';

  @override
  String get syncOffline => '离线 — 恢复联网后将发送更改';

  @override
  String get syncErrDecrypt => '无法用此账户的密钥解密服务器副本；此电脑上的连接已保留。';

  @override
  String get syncErrTooLarge => '库超过 5 MB 上限，无法同步。';

  @override
  String syncError(String msg) {
    return '同步错误：$msg';
  }

  @override
  String get commonCancel => '取消';

  @override
  String get commonSave => '保存';

  @override
  String get commonCreate => '创建';

  @override
  String get commonOk => '确定';

  @override
  String get commonDelete => '删除';

  @override
  String get commonGiveUp => '取消';

  @override
  String get commonOpen => '打开';

  @override
  String get commonEdit => '编辑';

  @override
  String get commonRename => '重命名';

  @override
  String get commonRefresh => '刷新';

  @override
  String get commonNewFolder => '新建文件夹';

  @override
  String get commonCopyPath => '复制路径';

  @override
  String get commonMove => '移动';

  @override
  String get commonMoveEllipsis => '移动…';

  @override
  String get commonShow => '显示';

  @override
  String get commonChoose => '浏览…';

  @override
  String get commonConnect => '连接';

  @override
  String get commonNew => '新建';

  @override
  String get commonCopy => '复制';

  @override
  String get commonPaste => '粘贴';

  @override
  String commonLocation(String path) {
    return '位置：$path';
  }

  @override
  String get commonNewName => '新名称';

  @override
  String get commonFolderName => '文件夹名称';

  @override
  String get setTitle => '设置';

  @override
  String get setAppearance => '外观';

  @override
  String get setTheme => '主题';

  @override
  String get setThemeDark => '夜间';

  @override
  String get setThemeLight => '日间';

  @override
  String get setThemeSystem => '跟随系统';

  @override
  String get setLanguage => '语言';

  @override
  String get setLanguageHint => '语言立即生效。';

  @override
  String get setSaved => '设置已保存';

  @override
  String get mobModules => '模块';

  @override
  String get mobDisabled => '您的账户已停用';

  @override
  String get mobSoon => '此模块即将推出';

  @override
  String get mobOpen => '打开';

  @override
  String get mobRefresh => '刷新';

  @override
  String get mobSettings => '设置';

  @override
  String mobWelcome(String name) {
    return '欢迎，$name';
  }

  @override
  String get mobNoModules => '无法加载模块。请检查连接后刷新。';

  @override
  String get mobSite => 'mastertool.download';

  @override
  String get mobLangSystem => '系统语言';

  @override
  String get mobSsoHint =>
      '只需登录一次：SSH Master、FTP Masters、SQL Master、Notepad Master、Convert Master 和 IP Tools 均在此应用内打开。';

  @override
  String mobOpenCount(String open, String total) {
    return '已启用 $open/$total 个模块';
  }

  @override
  String get mobModulesHint => '点按即可打开';

  @override
  String get mobTapToOpen => '可以使用';

  @override
  String get mobVisitSite => '访问网站';

  @override
  String get smAppSearchPh => '搜索连接…  (Ctrl+F)';

  @override
  String get smAppNewConn => '新建连接';

  @override
  String smAppSplit(String n) {
    return '分屏打开 ($n)';
  }

  @override
  String get smAppSplitTitle => '在一个窗口中分屏打开所选连接';

  @override
  String get smAppSettings => '设置';

  @override
  String smAppStats(String c, String f) {
    return '$c 个连接 · $f 个文件夹';
  }

  @override
  String get smAppWelcome => '欢迎';

  @override
  String smAppResults(String q) {
    return '“$q”的搜索结果';
  }

  @override
  String get smAppAll => '全部连接';

  @override
  String get smAppWelcomeHint => '创建你的第一个 SSH 连接。<br>输入服务器信息，测试后保存。';

  @override
  String get smAppFolders => '文件夹';

  @override
  String get smAppConnections => '连接';

  @override
  String get smAppMultiHint => '按住 Ctrl 单击可多选，并在一个窗口中分屏打开';

  @override
  String get smAppNoMatch => '没有匹配的连接。';

  @override
  String smAppFolderCount(String n) {
    return '$n 个连接';
  }

  @override
  String get smAppFolderOpenSplit => '分屏打开文件夹中的连接';

  @override
  String get smAppNewConnHere => '在此文件夹中新建连接';

  @override
  String get smAppNewSubfolder => '新建子文件夹';

  @override
  String get smAppKeyTag => '密钥';

  @override
  String get smAppLastDir => '上次的文件夹';

  @override
  String get smAppLastDirTag => '上次的文件夹';

  @override
  String smAppMultiOpenSplit(String n) {
    return '在一个窗口中分屏打开 $n 个连接';
  }

  @override
  String get smAppOpenSeparate => '每个连接在单独窗口中打开';

  @override
  String get smAppClearSelection => '清除选择';

  @override
  String get smAppSideBySide => '并排打开两个会话';

  @override
  String get smAppDuplicate => '创建副本';

  @override
  String get smAppMoveToFolder => '移动到文件夹…';

  @override
  String get smAppResetLastDir => '重置上次的文件夹';

  @override
  String get smAppConnMoved => '连接已移动';

  @override
  String get smAppFolderIntoSelf => '文件夹不能移动到自己的子文件夹中';

  @override
  String get smAppFolderPh => '例如：生产服务器';

  @override
  String get smAppRenameFolder => '重命名文件夹';

  @override
  String get smAppDeleteFolder => '删除文件夹';

  @override
  String smAppDeleteFolderMsg(String name) {
    return '将删除文件夹 <b>$name</b>。';
  }

  @override
  String smAppDeleteFolderConns(String n) {
    return ' 其中的 $n 个连接不会被删除，而是移到上一级。';
  }

  @override
  String get smAppRootFolder => '全部连接（根目录）';

  @override
  String smAppMoveTitle(String name) {
    return '移动“$name”';
  }

  @override
  String get smAppTargetFolder => '目标文件夹';

  @override
  String get smAppDeleteConn => '删除连接';

  @override
  String smAppDeleteConnMsg(String name, String target) {
    return '<b>$name</b>（$target）将被永久删除。';
  }

  @override
  String get smAppMaxPanes => '最多可打开 6 个窗格';

  @override
  String get smAppMaxPanesSub => '已打开前 6 个连接';

  @override
  String get smFormTitleNew => '新建 SSH 连接';

  @override
  String get smFormTitleEdit => '编辑连接';

  @override
  String get smFormName => '连接名称';

  @override
  String get smFormNamePh => '例如：Web 服务器';

  @override
  String get smFormHost => 'IP 地址 / 主机';

  @override
  String get smFormHostPh => '192.168.1.10 或 server.com';

  @override
  String get smFormPort => '端口';

  @override
  String get smFormUser => '用户名';

  @override
  String get smFormAuth => '身份验证';

  @override
  String get smFormPassword => '密码';

  @override
  String get smFormPrivateKey => '私钥';

  @override
  String get smFormPwSaved => '••••••••（已保存 — 输入以更改）';

  @override
  String get smFormKeyFile => '密钥文件';

  @override
  String get smFormPassphrase => '密钥口令（如有）';

  @override
  String get smFormPassSaved => '••••••••（已保存）';

  @override
  String get smFormPassEmpty => '没有则留空';

  @override
  String get smFormFolder => '文件夹';

  @override
  String get smFormColor => '颜色';

  @override
  String get smFormPalette => '终端配色方案';

  @override
  String get smFormLastDir => '转到上次所在的文件夹';

  @override
  String get smFormLastDirHint => '连接后，终端和文件管理器会在你上次工作的文件夹中打开。';

  @override
  String get smFormLastDirNow => '当前：';

  @override
  String get smFormConnecting => '正在连接…';

  @override
  String get smFormTestOk => '连接成功';

  @override
  String smFormHostKey(String fp) {
    return '主机密钥 (SHA256)：$fp';
  }

  @override
  String get smFormTestFail => '连接失败';

  @override
  String get smFormSaved => '连接已保存';

  @override
  String get smFormChangesSaved => '更改已保存';

  @override
  String get smFormTest => '测试连接';

  @override
  String get smFormSaveConnect => '保存并连接';

  @override
  String get smPaneToggleSidebar => '显示/隐藏侧边栏 (Ctrl+B)';

  @override
  String get smPaneDefaultName => '连接';

  @override
  String get smPaneSplitRight => '向右拆分';

  @override
  String get smPaneSplitDown => '向下拆分';

  @override
  String get smPaneReconnect => '重新连接';

  @override
  String get smPaneClose => '关闭窗格';

  @override
  String get smPaneSaveSelShortcut => '将所选内容保存为快捷命令';

  @override
  String get smPanePaletteMenu => '终端配色方案…';

  @override
  String get smPaneSelectAll => '全选';

  @override
  String get smPaneClear => '清屏';

  @override
  String get smPaneStatusConnecting => '正在连接…';

  @override
  String get smPaneStatusNoConn => '未连接';

  @override
  String get smPaneStatusClosed => '连接已关闭';

  @override
  String get smTermConnecting => '正在连接…';

  @override
  String get smTermConnectFailed => '无法连接：';

  @override
  String get smTermRetryEnter => '按 Enter 重试。';

  @override
  String get smTermClosed => '连接已关闭。';

  @override
  String get smTermReconnectEnter => '按 Enter 重新连接。';

  @override
  String smTermMaxPanes(String n) {
    return '一个窗口最多可打开 $n 个窗格';
  }

  @override
  String smTermSessions(String n) {
    return '$n 个会话';
  }

  @override
  String get smTermToggleAll => '显示/隐藏所有侧边栏';

  @override
  String get smTermSplitRightTitle => '向右拆分当前窗格 (Ctrl+Shift+E)';

  @override
  String get smTermSplitDownTitle => '向下拆分当前窗格 (Ctrl+Shift+O)';

  @override
  String get smTermSyncOn => '正在向所有窗格输入';

  @override
  String get smTermSyncOff => '向所有窗格输入';

  @override
  String get smTermSyncTitle => '你输入的内容会发送到所有已连接的窗格';

  @override
  String get smPickerSearch => '搜索连接…';

  @override
  String get smPickerSameServer => '同一服务器';

  @override
  String get smPickerNone => '没有匹配的连接';

  @override
  String get smPickerTitleRight => '向右拆分 — 选择连接';

  @override
  String get smPickerTitleDown => '向下拆分 — 选择连接';

  @override
  String get smPaletteTitle => '终端配色方案';

  @override
  String smPaletteHint(String name) {
    return '所选配色会立即在此窗格中预览。保存后，此连接（$name）的所有会话都会使用它。';
  }

  @override
  String get smPaletteSaved => '配色方案已保存';

  @override
  String get smScTitleNew => '新建快捷命令';

  @override
  String get smScTitleEdit => '编辑快捷命令';

  @override
  String get smScName => '快捷命令名称';

  @override
  String get smScNamePh => '例如：重启 Nginx';

  @override
  String get smScCommand => '命令';

  @override
  String get smScEnter => '粘贴后按 Enter';

  @override
  String get smScEnterHint => '关闭时只会在光标处输入命令，由你自己执行。';

  @override
  String get smScEmpty => '还没有快捷命令。<br>用 <b>+</b> 添加常用命令，双击即可粘贴到终端。';

  @override
  String get smScItemTitle => '双击：粘贴到此窗格的终端';

  @override
  String get smScAutoEnter => '自动回车';

  @override
  String get smScPaste => '粘贴到终端';

  @override
  String get smScPasteNoEnter => '粘贴但不回车';

  @override
  String get smScPasteRun => '粘贴并执行';

  @override
  String get smScCopy => '复制到剪贴板';

  @override
  String get smScNew => '新建快捷命令';

  @override
  String get smSbShortcuts => '快捷命令';

  @override
  String get smSbAddShortcut => '添加快捷命令';

  @override
  String get smSbServer => '服务器';

  @override
  String smSbServerHost(String host) {
    return '服务器 · $host';
  }

  @override
  String get smSbFollow => '跟随终端所在文件夹';

  @override
  String get smSbHome => '主目录';

  @override
  String get smSbUp => '上级文件夹';

  @override
  String get smSbComputer => '此电脑';

  @override
  String get smSbPlaces => '驱动器和位置';

  @override
  String get smSbResize => '拖动以调整宽度';

  @override
  String get smFmLoading => '正在加载…';

  @override
  String smFmOpenFailed(String msg) {
    return '无法打开：$msg';
  }

  @override
  String get smFmEmpty => '文件夹为空';

  @override
  String get smFmNoConn => '未连接。';

  @override
  String get smFmClosed => '连接已关闭。';

  @override
  String get smFmWaiting => '正在等待连接…';

  @override
  String smFmDownloadTo(String path) {
    return '下载 → $path';
  }

  @override
  String smFmUploadTo(String path) {
    return '上传 → $path';
  }

  @override
  String get smFmServer => '服务器';

  @override
  String get smFmCdHere => '在终端中转到此文件夹';

  @override
  String get smFmPastePath => '将路径粘贴到终端';

  @override
  String smFmDeleteWhat(String what) {
    return '删除（$what）';
  }

  @override
  String smFmNItems(String n) {
    return '$n 项';
  }

  @override
  String get smFmOpenDefault => '用默认应用打开';

  @override
  String get smFmReveal => '在资源管理器中显示';

  @override
  String get smFmOpenExplorer => '在资源管理器中打开';

  @override
  String get smFmFollowing => '文件管理器正在跟随终端所在文件夹';

  @override
  String get smFmFollowOff => '已关闭跟随';

  @override
  String get smFmNewRemote => '在服务器上新建文件夹';

  @override
  String get smFmDeleteTitle => '从服务器删除';

  @override
  String smFmAndMore(String n) {
    return ' 以及另外 $n 项';
  }

  @override
  String smFmDeleteMsg(String names) {
    return '$names 将从服务器<b>永久</b>删除。文件夹会连同其内容一起删除。';
  }

  @override
  String get smPlaceDesktop => '桌面';

  @override
  String get smPlaceDownloads => '下载';

  @override
  String get smPlaceDocuments => '文档';

  @override
  String get smPlaceHome => '用户文件夹';

  @override
  String smPlaceDrive(String d) {
    return '本地磁盘 ($d)';
  }

  @override
  String get smErrNoConn => '未连接';

  @override
  String get smErrConnectFirst => '请先连接到服务器';

  @override
  String get smErrMkdir => '无法创建文件夹';

  @override
  String get smErrRename => '无法重命名';

  @override
  String smErrDelete(String name) {
    return '无法删除：$name';
  }

  @override
  String get smTrPanelTitle => '传输';

  @override
  String get smTrClearDone => '清除已完成';

  @override
  String get smTrQueued => '排队中';

  @override
  String get smTrScanning => '正在扫描文件…';

  @override
  String smTrFileCount(String i, String n) {
    return '$i / $n 个文件';
  }

  @override
  String smTrEta(String time) {
    return '剩余约 $time';
  }

  @override
  String smTrDownloading(String name) {
    return '正在下载：$name';
  }

  @override
  String smTrUploading(String name) {
    return '正在上传：$name';
  }

  @override
  String get smTrDone => '已完成';

  @override
  String get smTrCancelled => '已取消';

  @override
  String get smTrFailed => '失败';

  @override
  String get smTrRemoveFromList => '从列表中移除';

  @override
  String get smTrAlwaysBackground => '以后始终在后台显示大型传输';

  @override
  String get smTrShowInBackground => '在后台运行';

  @override
  String get smTrDownloadDone => '下载完成';

  @override
  String get smTrUploadDone => '上传完成';

  @override
  String smTrDownloadFailed(String name) {
    return '下载失败：$name';
  }

  @override
  String smTrUploadFailed(String name) {
    return '上传失败：$name';
  }

  @override
  String get smTrCancelledToast => '传输已取消';

  @override
  String smTimeHm(String h, String m) {
    return '$h 小时 $m 分';
  }

  @override
  String smTimeMs(String m, String s) {
    return '$m 分 $s 秒';
  }

  @override
  String smTimeS(String s) {
    return '$s 秒';
  }

  @override
  String get smMainErrAuth => '身份验证失败：用户名或密码错误。';

  @override
  String get smMainErrRefused => '连接被拒绝：端口未开放或 SSH 服务未运行。';

  @override
  String get smMainErrTimeout => '超时：无法访问服务器。';

  @override
  String get smMainErrDns => '无法解析主机名 (DNS)。';

  @override
  String get smMainErrUnreach => '无法通过网络访问服务器。';

  @override
  String get smMainErrKeyFile => '找不到密钥文件。';

  @override
  String smMainErrHostKey(String newFp, String oldFp) {
    return '服务器主机密钥已更改！已保存：$oldFp，收到：$newFp。出于安全考虑已拒绝连接。';
  }

  @override
  String get smMainErrConnNotFound => '找不到连接';

  @override
  String get smMainErrNoSession => '没有活动的 SSH 会话';

  @override
  String get smMainErrHostUser => '需要填写服务器地址和用户名。';

  @override
  String get smMainTrayShow => '显示 SSH Master';

  @override
  String get smMainTrayQuick => '快速连接';

  @override
  String get smMainTrayNone => '没有已保存的连接';

  @override
  String get smMainTrayQuit => '退出';

  @override
  String get smMainBalloonTitle => 'SSH Master 正在后台运行';

  @override
  String get smMainBalloonBody => '单击托盘图标可重新打开。';

  @override
  String get smMainPickKey => '选择私钥文件';

  @override
  String get smMainCopySuffix => '（副本）';

  @override
  String get smMainDefDisk => '磁盘使用情况';

  @override
  String get smMainDefMem => '内存';

  @override
  String get smMainDefTop => '进程 (top)';

  @override
  String get smAppNotesLabel => '备注';

  @override
  String get fmAppSearchPh => '搜索站点…  (Ctrl+F)';

  @override
  String get fmAppNewConn => '新建站点';

  @override
  String get fmAppSettings => '设置';

  @override
  String fmAppStats(String c, String f) {
    return '$c 个站点 · $f 个文件夹';
  }

  @override
  String get fmAppWelcome => '欢迎';

  @override
  String fmAppResults(String q) {
    return '“$q”的搜索结果';
  }

  @override
  String get fmAppAll => '全部站点';

  @override
  String get fmAppWelcomeHint => '创建你的第一个 FTP / SFTP 站点。<br>输入服务器信息，测试连接后保存。';

  @override
  String get fmAppFolders => '文件夹';

  @override
  String get fmAppConnections => '站点';

  @override
  String get fmAppDblHint => '双击卡片即可连接';

  @override
  String get fmAppNoMatch => '没有匹配的站点。';

  @override
  String fmAppFolderCount(String n) {
    return '$n 个站点';
  }

  @override
  String get fmAppNewConnHere => '在此文件夹中新建站点';

  @override
  String get fmAppNewSubfolder => '新建子文件夹';

  @override
  String get fmAppKeyTag => '密钥';

  @override
  String get fmAppLastDir => '上次的文件夹';

  @override
  String get fmAppLastDirTag => '上次的文件夹';

  @override
  String get fmAppDuplicate => '创建副本';

  @override
  String get fmAppMoveToFolder => '移动到文件夹…';

  @override
  String get fmAppResetLastDir => '重置上次的文件夹';

  @override
  String get fmAppConnMoved => '站点已移动';

  @override
  String get fmAppFolderIntoSelf => '文件夹不能移动到自身中';

  @override
  String get fmAppFolderPh => '例如：客户';

  @override
  String get fmAppRenameFolder => '重命名文件夹';

  @override
  String get fmAppDeleteFolder => '删除文件夹';

  @override
  String fmAppDeleteFolderMsg(String name) {
    return '删除文件夹 <b>$name</b>？';
  }

  @override
  String fmAppDeleteFolderConns(String n) {
    return '<br>其中的 $n 个站点将移到上级文件夹。';
  }

  @override
  String get fmAppRootFolder => '顶层（无文件夹）';

  @override
  String fmAppMoveTitle(String name) {
    return '移动“$name”';
  }

  @override
  String get fmAppTargetFolder => '目标文件夹';

  @override
  String get fmAppDeleteConn => '删除站点';

  @override
  String fmAppDeleteConnMsg(String name, String target) {
    return '删除站点 <b>$name</b>（$target）？';
  }

  @override
  String get fmFormTitleNew => '新建站点';

  @override
  String fmFormTitleEdit(String name) {
    return '站点属性：$name';
  }

  @override
  String get fmFormTabGeneral => '常规';

  @override
  String get fmFormTabActions => '操作';

  @override
  String get fmFormTabType => '类型';

  @override
  String get fmFormTabOptions => '选项';

  @override
  String get fmFormName => '名称';

  @override
  String get fmFormNamePh => '例如：公司网站';

  @override
  String get fmFormHost => '主机地址';

  @override
  String get fmFormHostPh => 'ftp.example.com 或 192.168.1.10';

  @override
  String get fmFormPort => '端口';

  @override
  String get fmFormUser => '用户名';

  @override
  String get fmFormPassword => '密码';

  @override
  String get fmFormPwSaved => '••••••••（已保存，输入以更改）';

  @override
  String get fmFormLoginMethod => '登录方式';

  @override
  String get fmFormLoginNormal => '普通';

  @override
  String get fmFormLoginAnon => '匿名';

  @override
  String get fmFormAuth => 'SFTP 身份验证';

  @override
  String get fmFormPrivateKey => '私钥';

  @override
  String get fmFormKeyFile => '私钥文件';

  @override
  String get fmFormPassphrase => '密钥口令';

  @override
  String get fmFormPassSaved => '（已保存）';

  @override
  String get fmFormPassEmpty => '没有则留空';

  @override
  String get fmFormFolder => '文件夹';

  @override
  String get fmFormColor => '颜色';

  @override
  String get fmFormComments => '备注';

  @override
  String get fmFormRemoteDir => '连接后切换到此远程文件夹';

  @override
  String get fmFormLocalDir => '连接后切换到此本地文件夹';

  @override
  String get fmFormLocalDirPh => '例如：C:\\Projects\\site';

  @override
  String get fmFormLastDir => '转到上次所在的文件夹';

  @override
  String get fmFormLastDirHint => '开启后，站点将在你上次工作的服务器和电脑文件夹中打开（而不是上面设置的文件夹）。';

  @override
  String get fmFormLastDirNow => '当前：';

  @override
  String get fmFormCache => '浏览缓存';

  @override
  String get fmFormCacheSession => '在会话期间使用缓存';

  @override
  String get fmFormCacheAlways => '始终使用缓存（应用运行期间）';

  @override
  String get fmFormCacheNever => '从不使用缓存（每次重新列出）';

  @override
  String get fmFormUploadCase => '上传时对文件和文件夹名称应用此规则';

  @override
  String get fmFormCasePreserve => '保留大小写';

  @override
  String get fmFormCaseLower => '小写';

  @override
  String get fmFormCaseUpper => '大写';

  @override
  String get fmFormTest => '测试连接';

  @override
  String get fmFormSaveConnect => '保存并连接';

  @override
  String get fmFormConnecting => '正在连接…';

  @override
  String get fmFormTestOk => '连接成功';

  @override
  String get fmFormTestFail => '无法连接';

  @override
  String fmFormHomeDir(String dir) {
    return '起始文件夹：$dir';
  }

  @override
  String get fmFormRemoteDirMissing => '警告：无法打开远程文件夹。';

  @override
  String fmFormHostKey(String fp) {
    return 'SSH 主机密钥 (SHA256)：$fp';
  }

  @override
  String get fmFormSaved => '站点已保存';

  @override
  String get fmFormChangesSaved => '更改已保存';

  @override
  String get fmTypeProtocol => '协议';

  @override
  String get fmTypeFtp => 'FTP（标准文件传输协议）';

  @override
  String get fmTypeFtpsImplicit => 'FTP over TLS/SSL（隐式，端口 990）';

  @override
  String get fmTypeFtpsSsl => 'FTP over SSL（AUTH SSL，显式）';

  @override
  String get fmTypeFtpsTls => 'FTP over TLS/SSL（AUTH TLS，显式）';

  @override
  String get fmTypeSftp => 'SFTP（基于 SSH2 安全外壳）';

  @override
  String get fmTypeNoteFtp => '命令和数据连接均使用行业标准 FTP 协议，以不安全的明文方式传输。';

  @override
  String get fmTypeNoteFtpsImplicit =>
      '连接从一开始就使用 TLS/SSL 加密（通常为端口 990）。命令和数据均受保护。';

  @override
  String get fmTypeNoteFtpsSsl => '先以普通 FTP 连接，再通过 AUTH SSL 切换为加密会话。命令和数据均受保护。';

  @override
  String get fmTypeNoteFtpsTls =>
      '先以普通 FTP 连接，再通过 AUTH TLS 切换为加密会话（最常见的 FTPS 类型）。';

  @override
  String get fmTypeNoteSftp => '通过 SSH 加密传输文件（端口 22）。使用密码或私钥登录；首次连接时会保存主机密钥。';

  @override
  String get fmTypeTransferType => '传输类型';

  @override
  String get fmTypeBinary => '二进制';

  @override
  String get fmTypeAscii => 'ASCII（文本）';

  @override
  String get fmTypeAuto => '自动（文本文件用 ASCII）';

  @override
  String fmTypeUseGlobal(String v) {
    return '使用全局设置（$v）';
  }

  @override
  String get fmTypeDataConn => '数据连接';

  @override
  String get fmTypePassive => '被动模式 (PASV / EPSV)';

  @override
  String get fmTypeTimezone => '服务器时区偏移';

  @override
  String get fmTypeTzNone => '无偏移';

  @override
  String get fmTypeTzHours => '小时';

  @override
  String get fmTypeTimezoneHint => '服务器列出的文件时间将按此值调整。';

  @override
  String get fmOptSiteOptions => '站点专用选项';

  @override
  String get fmOptUseGlobal => '所有选项均使用全局设置';

  @override
  String get fmOptCustom => '使用此站点专用设置';

  @override
  String get fmOptRetry => '重试次数';

  @override
  String get fmOptRetryDelay => '重试间隔（秒）';

  @override
  String get fmOptMaxConcurrent => '最大同时传输数';

  @override
  String get fmOptConflict => '存在同名文件时';

  @override
  String get fmOptConflictOverwrite => '覆盖';

  @override
  String get fmOptConflictRename => '自动重命名（name (1).ext）';

  @override
  String get fmOptConflictSkip => '跳过';

  @override
  String get fmOptEncoding => '文件名编码';

  @override
  String get fmOptEncAuto => '自动';

  @override
  String get fmSiteLocal => '我的电脑';

  @override
  String get fmSiteRemote => '服务器';

  @override
  String get fmSiteTransfers => '传输';

  @override
  String get fmSiteToggleLocal => '显示/隐藏“我的电脑” (Ctrl+B)';

  @override
  String get fmSiteToggleTransfers => '显示/隐藏“传输” (Ctrl+J)';

  @override
  String get fmSiteReconnect => '重新连接';

  @override
  String get fmSitePlaces => '快速访问和驱动器';

  @override
  String get fmSiteUp => '上级文件夹 (Backspace)';

  @override
  String get fmSiteHome => '起始文件夹';

  @override
  String get fmSiteColName => '名称';

  @override
  String get fmSiteColSize => '大小';

  @override
  String get fmSiteColDate => '修改时间';

  @override
  String get fmSiteLoading => '正在加载…';

  @override
  String get fmSiteEmptyDir => '此文件夹为空';

  @override
  String get fmSiteDesktop => '桌面';

  @override
  String get fmSiteDownloads => '下载';

  @override
  String get fmSiteDocuments => '文档';

  @override
  String get fmSiteHomeDir => '用户文件夹';

  @override
  String get fmSiteOpenExplorer => '在资源管理器中打开';

  @override
  String get fmSiteOpenFile => '用默认应用打开';

  @override
  String get fmSiteShowExplorer => '在资源管理器中显示';

  @override
  String get fmSiteUpload => '上传';

  @override
  String fmSiteUploadN(String n) {
    return '上传 $n 项';
  }

  @override
  String fmSiteUploadTo(String dir) {
    return '目标：$dir';
  }

  @override
  String get fmSiteDownload => '下载';

  @override
  String fmSiteDownloadN(String n) {
    return '下载 $n 项';
  }

  @override
  String fmSiteDownloadTo(String dir) {
    return '目标：$dir';
  }

  @override
  String get fmSiteTrash => '移到回收站';

  @override
  String get fmSiteTrashOk => '移动';

  @override
  String fmSiteTrashOne(String name) {
    return '将 <b>$name</b> 移到回收站？';
  }

  @override
  String fmSiteTrashMany(String n) {
    return '将 $n 项移到回收站？';
  }

  @override
  String get fmSiteMkdirFail => '无法创建文件夹';

  @override
  String get fmSiteRenameFail => '无法重命名';

  @override
  String get fmSiteDeleteFail => '无法删除';

  @override
  String get fmSiteDeleteTitle => '从服务器删除';

  @override
  String fmSiteDelOne(String name) {
    return '从服务器永久删除文件 <b>$name</b>？';
  }

  @override
  String fmSiteDelDirOne(String name) {
    return '从服务器永久删除文件夹 <b>$name</b> 及其全部内容？';
  }

  @override
  String fmSiteDelMany(String n) {
    return '从服务器永久删除 $n 项（文件夹及其全部内容）？';
  }

  @override
  String get fmSiteDeleting => '正在删除…';

  @override
  String get fmSiteDeleted => '已删除';

  @override
  String fmSiteItems(String n) {
    return '$n 项';
  }

  @override
  String get fmSiteOffline => '未连接';

  @override
  String fmSiteLimit(String v) {
    return '速度限制：$v';
  }

  @override
  String get fmSiteNoLimit => '无速度限制';

  @override
  String get fmSiteLimitTitle => '设置速度限制';

  @override
  String fmSiteConnectFail(String msg) {
    return '无法连接到服务器：$msg';
  }

  @override
  String get fmSiteConnectFailTitle => '连接失败';

  @override
  String get fmSiteStateConnected => '已连接';

  @override
  String get fmSiteStateConnecting => '正在连接…';

  @override
  String get fmSiteStateDisconnected => '已断开';

  @override
  String get fmTrColName => '名称';

  @override
  String get fmTrColSize => '大小';

  @override
  String get fmTrColProgress => '进度';

  @override
  String get fmTrColStatus => '状态';

  @override
  String get fmTrEmpty => '暂无传输。\n右键单击文件或文件夹并选择“下载”/“上传”，或在面板之间拖放。';

  @override
  String get fmTrQueued => '排队中';

  @override
  String get fmTrActive => '正在传输';

  @override
  String get fmTrDone => '已完成';

  @override
  String fmTrDoneFiles(String n) {
    return '已完成 $n 个文件';
  }

  @override
  String get fmTrError => '错误';

  @override
  String get fmTrCancelled => '已取消';

  @override
  String get fmTrSkipped => '已跳过（已存在）';

  @override
  String fmTrScanning(String n) {
    return '正在扫描… $n 个文件';
  }

  @override
  String get fmTrRetrying => '即将重试…';

  @override
  String get fmTrCancel => '取消';

  @override
  String get fmTrCancelDir => '取消文件夹传输';

  @override
  String get fmTrCancelAll => '取消所有传输';

  @override
  String get fmTrCancelAllMsg => '取消所有正在进行和排队中的传输？';

  @override
  String get fmTrCancelAllOk => '全部取消';

  @override
  String get fmTrRetry => '重试';

  @override
  String get fmTrShowLocal => '在资源管理器中显示';

  @override
  String get fmTrShowRemote => '在服务器上显示';

  @override
  String get fmTrCopyError => '复制错误信息';

  @override
  String get fmTrRemove => '从列表中移除';

  @override
  String get fmTrRemoveRoot => '从列表中移除此传输';

  @override
  String get fmTrClearDone => '清除已完成';

  @override
  String fmTrActiveN(String n) {
    return '$n 个传输正在进行';
  }

  @override
  String get fmTrDownloadDone => '下载完成';

  @override
  String get fmTrUploadDone => '上传完成';

  @override
  String fmTrDownloadFailed(String name) {
    return '下载未完成：$name';
  }

  @override
  String fmTrUploadFailed(String name) {
    return '上传未完成：$name';
  }

  @override
  String fmTrFailedFiles(String n) {
    return '$n 个文件失败';
  }

  @override
  String get fmMainErrAuth => '登录失败：用户名或密码错误。';

  @override
  String get fmMainErrRefused => '连接被拒绝：端口未开放或服务器未运行。';

  @override
  String get fmMainErrTimeout => '超时：无法访问服务器。';

  @override
  String get fmMainErrDns => '无法解析主机名 (DNS)。';

  @override
  String get fmMainErrUnreach => '无法通过网络访问服务器。';

  @override
  String get fmMainErrReset => '服务器关闭了连接。';

  @override
  String get fmMainErrNotFound => '找不到文件或文件夹。';

  @override
  String get fmMainErrPerm => '权限被拒绝。';

  @override
  String fmMainErr550(String msg) {
    return '服务器拒绝了该操作 (550)：$msg';
  }

  @override
  String get fmMainErr553 => '服务器不接受该文件名 (553)。';

  @override
  String fmMainErrTls(String msg) {
    return 'TLS/SSL 错误 — 请检查协议或端口。（$msg）';
  }

  @override
  String fmMainErrHostKey(String newVal, String oldVal) {
    return '服务器主机密钥已更改！已保存：$oldVal，收到：$newVal。出于安全考虑已拒绝连接。';
  }

  @override
  String get fmMainErrConnNotFound => '找不到站点';

  @override
  String get fmMainErrNoSession => '未连接到服务器';

  @override
  String get fmMainErrHost => '必须填写主机地址。';

  @override
  String get fmMainErrUser => '必须填写用户名（或选择匿名登录）。';

  @override
  String get fmMainPickKey => '选择私钥文件';

  @override
  String get fmMainCopySuffix => '（副本）';

  @override
  String get fmMainCloseActive => '仍有传输正在进行。关闭此窗口将取消这些传输。';

  @override
  String get fmMainCloseAnyway => '仍然关闭';

  @override
  String get sqAppSearchPh => '搜索连接…  (Ctrl+F)';

  @override
  String get sqAppNewConn => '新建连接';

  @override
  String get sqAppAddConn => '新建连接';

  @override
  String get sqAppSettings => '设置';

  @override
  String sqAppStats(String c, String f) {
    return '$c 个连接 · $f 个文件夹';
  }

  @override
  String get sqAppWelcome => '欢迎';

  @override
  String sqAppResults(String q) {
    return '“$q”的搜索结果';
  }

  @override
  String get sqAppAll => '所有连接';

  @override
  String get sqAppWelcomeHint =>
      '可连接 PostgreSQL、SQL Server、MySQL、SQLite 或 CSV/Parquet/Excel 文件。<br>填写连接信息，测试连接后保存。';

  @override
  String get sqAppFolders => '文件夹';

  @override
  String get sqAppConnections => '连接';

  @override
  String get sqAppDblHint => '双击卡片即可打开';

  @override
  String get sqAppNoMatch => '没有匹配的连接。';

  @override
  String sqAppFolderCount(String n) {
    return '$n 个连接';
  }

  @override
  String get sqAppNewConnHere => '在此文件夹中新建连接';

  @override
  String get sqAppNewSubfolder => '新建子文件夹';

  @override
  String get sqAppDuplicate => '复制连接';

  @override
  String get sqAppMoveToFolder => '移动到文件夹…';

  @override
  String get sqAppConnMoved => '连接已移动';

  @override
  String get sqAppFolderIntoSelf => '文件夹不能移动到其自身中';

  @override
  String get sqAppFolderPh => '例如：客户';

  @override
  String get sqAppRenameFolder => '重命名文件夹';

  @override
  String get sqAppDeleteFolder => '删除文件夹';

  @override
  String sqAppDeleteFolderMsg(String name) {
    return '确定删除文件夹 <b>$name</b>？';
  }

  @override
  String sqAppDeleteFolderConns(String n) {
    return '<br>其中的 $n 个连接将移至上级文件夹。';
  }

  @override
  String get sqAppRootFolder => '顶层（无文件夹）';

  @override
  String sqAppMoveTitle(String name) {
    return '移动“$name”';
  }

  @override
  String get sqAppTargetFolder => '目标文件夹';

  @override
  String get sqAppDeleteConn => '删除连接';

  @override
  String sqAppDeleteConnMsg(String name, String target) {
    return '确定删除连接 <b>$name</b>（$target）？已保存的密码也会一并删除。';
  }

  @override
  String get sqAppReadOnlyTag => '只读';

  @override
  String get sqAppWriteTag => '可写';

  @override
  String get sqFormTitleNew => '新建连接';

  @override
  String sqFormTitleEdit(String name) {
    return '连接：$name';
  }

  @override
  String get sqFormTabGeneral => '常规';

  @override
  String get sqFormTabSecurity => '安全';

  @override
  String get sqFormTabSsh => 'SSH 隧道';

  @override
  String get sqFormName => '标签（显示名称）';

  @override
  String get sqFormNamePh => '例如：生产数据库';

  @override
  String get sqFormHost => '主机';

  @override
  String get sqFormPort => '端口';

  @override
  String get sqFormUser => '用户名';

  @override
  String get sqFormPassword => '密码';

  @override
  String get sqFormPwSaved => '••••••••（已保存，输入以更改）';

  @override
  String get sqFormDatabase => '数据库';

  @override
  String get sqFormDatabasePh => '留空则使用默认数据库';

  @override
  String get sqFormFile => '数据库文件';

  @override
  String get sqFormFilePh => 'C:\\Data\\app.db';

  @override
  String get sqFormSqliteHint => 'SQLite 数据库文件（.db、.sqlite）。只读模式下绝不会修改该文件。';

  @override
  String get sqFormDuckdbHint =>
      '选择 .duckdb 文件，或留空（内存模式）。可直接查询 CSV、Parquet、JSON 和 Excel 文件：SELECT * FROM \'C:\\data\\sales.csv\'';

  @override
  String get sqFormInMemory => '内存模式';

  @override
  String get sqFormFolder => '文件夹';

  @override
  String get sqFormColor => '颜色';

  @override
  String get sqFormComments => '备注';

  @override
  String get sqFormReadOnly => '只读模式';

  @override
  String get sqFormReadOnlyHint =>
      '推荐开启。INSERT/UPDATE/DELETE 和 DDL 会在执行前被拦截，可单次批准执行。在支持的数据库上，会话本身也设为只读。';

  @override
  String get sqFormSavePassword => '保存密码';

  @override
  String get sqFormSavePasswordHint =>
      '密码仅保存在操作系统密钥链中（Windows：DPAPI）。关闭后，每次连接时都会询问密码。';

  @override
  String get sqFormSsl => 'TLS / SSL';

  @override
  String get sqFormSslPrefer => '首选（服务器支持时加密）';

  @override
  String get sqFormSslRequire => '必需（不验证证书）';

  @override
  String get sqFormSslVerify => '必需 + 验证证书';

  @override
  String get sqFormSslDisable => '关闭（不加密）';

  @override
  String get sqFormSslHint => '默认会尝试 TLS；如果服务器不支持，连接窗口会发出警告。';

  @override
  String get sqFormSshEnable => '通过 SSH 隧道连接';

  @override
  String get sqFormSshHint => '先经由 SSH 服务器再访问数据库。建议使用密钥认证。';

  @override
  String get sqFormSshHost => 'SSH 服务器';

  @override
  String get sqFormSshAuth => 'SSH 认证';

  @override
  String get sqFormSshKey => '私钥';

  @override
  String get sqFormSshAgent => '代理（Pageant）';

  @override
  String get sqFormKeyFile => '私钥文件';

  @override
  String get sqFormPassphrase => '私钥密码';

  @override
  String get sqFormPassSaved => '（已保存）';

  @override
  String get sqFormPassEmpty => '没有则留空';

  @override
  String get sqFormSshPassword => 'SSH 密码';

  @override
  String sqFormHostKey(String fp) {
    return 'SSH 主机密钥：$fp';
  }

  @override
  String get sqFormTest => '测试连接';

  @override
  String get sqFormSaveConnect => '保存并打开';

  @override
  String get sqFormConnecting => '正在连接…';

  @override
  String get sqFormTestOk => '连接成功';

  @override
  String get sqFormTestFail => '无法连接';

  @override
  String sqFormTestDb(String db, String user) {
    return '数据库：$db · 用户：$user';
  }

  @override
  String get sqFormNoTls => '警告：连接未加密（服务器不支持 TLS）。';

  @override
  String get sqFormSaved => '连接已保存';

  @override
  String get sqFormChangesSaved => '更改已保存';

  @override
  String get sqCwObjects => '对象';

  @override
  String get sqCwCollapseAll => '全部折叠';

  @override
  String get sqCwFilterPh => '筛选已加载的对象…';

  @override
  String get sqCwEmpty => '（空）';

  @override
  String get sqCwOpenData => '打开数据';

  @override
  String get sqCwShowDdl => '显示 DDL';

  @override
  String get sqCwOpenCode => '打开代码';

  @override
  String get sqCwSelectSql => '生成 SELECT';

  @override
  String get sqCwAddToBuilder => '添加到查询构建器';

  @override
  String get sqCwNewSqlHere => '在此新建 SQL';

  @override
  String get sqCwCopyName => '复制名称';

  @override
  String get sqCwCopied => '已复制到剪贴板';

  @override
  String get sqCwNewSql => '新建 SQL';

  @override
  String get sqCwBuilder => '查询构建器';

  @override
  String get sqCwReconnect => '重新连接';

  @override
  String get sqCwReadOnly => '只读';

  @override
  String get sqCwReadWrite => '可写';

  @override
  String get sqCwReadOnlyTip => '只读：DML/DDL 需要批准。点击关闭只读';

  @override
  String get sqCwReadWriteTip => '可写：命令无需批准即可执行。点击恢复只读';

  @override
  String get sqCwDisableRo => '关闭只读模式？';

  @override
  String get sqCwDisableRoMsg =>
      '在此窗口关闭之前，INSERT/UPDATE/DELETE 和 DDL 将直接执行而不再询问。';

  @override
  String get sqCwDisableRoOk => '允许写入';

  @override
  String get sqCwRoOn => '只读模式已开启';

  @override
  String get sqCwRoOff => '已允许写入 — 请谨慎操作';

  @override
  String get sqCwPasswordTitle => '需要密码';

  @override
  String sqCwPasswordFor(String host, String user) {
    return '$user@$host 的密码';
  }

  @override
  String get sqCwNotConnected => '未连接';

  @override
  String get sqCwConnected => '已连接';

  @override
  String get sqCwConnecting => '正在连接…';

  @override
  String get sqCwNoTls => '未加密';

  @override
  String get sqCwConnectFailed => '无法连接';

  @override
  String get sqCwRetry => '重试';

  @override
  String get sqCwResetCancel => '查询未响应取消操作；正在重新连接。';

  @override
  String get sqCwResetExit => '数据库连接已断开；正在重新连接。';

  @override
  String get sqCwEmptyWorkspace => '在对象树中双击表，或按 Ctrl+T 新建 SQL 标签页。';

  @override
  String get sqCwCloseTab => '关闭标签页？';

  @override
  String sqCwCloseTabMsg(String name) {
    return '“$name”中的 SQL 尚未保存。';
  }

  @override
  String get sqCwCloseTabOk => '关闭';

  @override
  String get sqTreeTables => '表';

  @override
  String get sqTreeViews => '视图';

  @override
  String get sqTreeMatviews => '物化视图';

  @override
  String get sqTreeForeignTables => '外部表';

  @override
  String get sqTreeFunctions => '函数';

  @override
  String get sqTreeProcedures => '存储过程';

  @override
  String get sqTreeTriggers => '触发器';

  @override
  String get sqTreeSequences => '序列';

  @override
  String get sqTreeTypes => '类型';

  @override
  String get sqTreeColumns => '列';

  @override
  String get sqTreeIndexes => '索引';

  @override
  String get sqTreeConstraints => '约束';

  @override
  String get sqTreeFiles => '文件';

  @override
  String get sqKindTable => '表';

  @override
  String get sqKindView => '视图';

  @override
  String get sqKindMatview => '物化视图';

  @override
  String get sqKindForeignTable => '外部表';

  @override
  String get sqKindFunction => '函数';

  @override
  String get sqKindProcedure => '存储过程';

  @override
  String get sqKindTrigger => '触发器';

  @override
  String get sqKindSequence => '序列';

  @override
  String get sqKindType => '类型';

  @override
  String get sqKindIndex => '索引';

  @override
  String get sqKindConstraint => '约束';

  @override
  String get sqSqlRun => '运行';

  @override
  String get sqSqlRunStatement => '运行当前语句';

  @override
  String get sqSqlCancel => '取消';

  @override
  String get sqSqlDatabase => '数据库';

  @override
  String get sqSqlHistory => '历史记录';

  @override
  String get sqSqlExport => '导出';

  @override
  String get sqSqlRunning => '正在运行…';

  @override
  String sqSqlDone(String ms) {
    return '完成 · $ms ms';
  }

  @override
  String sqSqlDoneErrors(String ms, String n) {
    return '$n 个错误 · $ms ms';
  }

  @override
  String get sqSqlDdlHint => '模式已更改：请使用“刷新”重新加载对象树。';

  @override
  String get sqSqlPlaceholder =>
      '输入 SQL… Ctrl+Enter：运行选中内容/全部 · Ctrl+Shift+Enter：运行光标处语句 · Ctrl+Space：自动补全';

  @override
  String sqSqlTabTitle(String n) {
    return 'SQL $n';
  }

  @override
  String get sqSqlHistoryEmpty => '此连接没有历史记录。';

  @override
  String get sqSqlRowsShort => '行';

  @override
  String sqResResult(String n) {
    return '结果 $n';
  }

  @override
  String get sqResMessages => '消息';

  @override
  String sqResRows(String ms, String n) {
    return '$n 行 · $ms ms';
  }

  @override
  String sqResRowsTruncated(String ms, String n) {
    return '显示前 $n 行（已达上限）· $ms ms';
  }

  @override
  String get sqResNoRows => '无数据行';

  @override
  String sqResAffected(String cmd, String ms, String n) {
    return '$cmd：影响 $n 行 · $ms ms';
  }

  @override
  String sqResCommand(String cmd, String ms) {
    return '$cmd · $ms ms';
  }

  @override
  String get sqResCancelled => '已取消';

  @override
  String get sqGridCopy => '复制';

  @override
  String get sqGridCopyHeaders => '连同列标题复制';

  @override
  String get sqGridExport => '导出此结果…';

  @override
  String get sqDataColumns => '列';

  @override
  String sqDataColumnsHidden(String n, String total) {
    return '列（$n/$total）';
  }

  @override
  String get sqDataAddFilter => '筛选';

  @override
  String get sqDataLimit => '行数';

  @override
  String sqDataFirstN(String n) {
    return '前 $n 行';
  }

  @override
  String get sqDataAll => '全部（有上限）';

  @override
  String get sqDataOpenInEditor => '在 SQL 编辑器中打开';

  @override
  String get sqDataClearFilters => '清除筛选';

  @override
  String sqDataRows(String ms, String n) {
    return '$n 行 · $ms ms';
  }

  @override
  String sqDataRowsMore(String ms, String n) {
    return '前 $n 行 · $ms ms';
  }

  @override
  String get sqDataError => '无法加载数据';

  @override
  String get sqDataSortAsc => '升序排序';

  @override
  String get sqDataSortDesc => '降序排序';

  @override
  String get sqDataSortClear => '清除排序';

  @override
  String get sqDataFilterColumn => '按此列筛选…';

  @override
  String get sqDataHideColumn => '隐藏列';

  @override
  String get sqDataShowAll => '显示所有列';

  @override
  String sqDataFilterEq(String v) {
    return '等于“$v”';
  }

  @override
  String sqDataFilterNe(String v) {
    return '不等于“$v”';
  }

  @override
  String get sqDataFilterNull => 'NULL / 非 NULL';

  @override
  String get sqDataColumn => '列';

  @override
  String get sqDataOperator => '条件';

  @override
  String get sqDataValue => '值';

  @override
  String get sqDataInHint => '使用“在列表中”时，多个值请用逗号分隔。';

  @override
  String get sqDataFilterTitle => '筛选';

  @override
  String get sqDataSelectAll => '全选';

  @override
  String get sqDataSelectNone => '全不选';

  @override
  String get sqOpContains => '包含';

  @override
  String get sqOpStarts => '开头是';

  @override
  String get sqOpEnds => '结尾是';

  @override
  String get sqOpLike => 'LIKE';

  @override
  String get sqOpIn => '在列表中';

  @override
  String get sqCodeExecute => '执行';

  @override
  String get sqCodeLoading => '正在加载…';

  @override
  String get sqCodeEmpty => '未找到定义';

  @override
  String get sqQbAddTable => '添加表';

  @override
  String get sqQbLimit => '行数限制';

  @override
  String get sqQbClear => '清空';

  @override
  String get sqQbHint => '从对象树将表拖到此处，或点击“添加表”。将某列拖到另一张表的列上即可创建 JOIN。';

  @override
  String get sqQbColumns => '列';

  @override
  String get sqQbConditions => '条件';

  @override
  String get sqQbResults => '结果';

  @override
  String get sqQbGenerated => '生成的 SQL';

  @override
  String get sqQbRegenerate => '根据图表重新生成';

  @override
  String get sqQbOtherDb => '查询构建器只能使用同一数据库中的表。';

  @override
  String get sqQbDragJoin => '拖到另一张表的列上以创建 JOIN';

  @override
  String get sqQbSwapJoin => '交换方向';

  @override
  String get sqQbDeleteJoin => '删除 JOIN';

  @override
  String get sqQbNoColumns => '在表上勾选所需的列（不勾选 = SELECT *）。';

  @override
  String get sqQbOutput => '显示';

  @override
  String get sqQbColumn => '列';

  @override
  String get sqQbAlias => '别名';

  @override
  String get sqQbAggregate => '聚合';

  @override
  String get sqQbSort => '排序';

  @override
  String get sqQbAddCondition => '添加条件';

  @override
  String sqQbTabTitle(String n) {
    return '查询 $n';
  }

  @override
  String get sqRoTitle => '只读模式';

  @override
  String get sqRoMessage => '此连接处于只读模式。以下语句可能会更改数据或模式：';

  @override
  String get sqRoHint => '你可以仅允许本次执行；执行后将恢复只读模式。';

  @override
  String get sqRoRunOnce => '仅执行这一次';

  @override
  String get sqRoNotRun => '只读模式：未执行';

  @override
  String sqRoBlockedMsg(String n) {
    return '只读模式：$n 条语句需要批准。';
  }

  @override
  String get sqExpTitle => '导出';

  @override
  String get sqExpHint => '查询将在不限制行数的情况下重新运行，结果会直接以流式写入文件。';

  @override
  String get sqExpRunning => '正在导出…';

  @override
  String sqExpDone(String n) {
    return '已导出 $n 行';
  }

  @override
  String get sqExpFailed => '导出失败';

  @override
  String get sqErrRefused => '连接被拒绝：端口未开放或服务器未运行。';

  @override
  String get sqErrDns => '无法解析主机名（DNS）。';

  @override
  String get sqErrTimeout => '连接超时：无法访问服务器。';

  @override
  String get sqErrReset => '服务器关闭了连接。';

  @override
  String get sqErrUnreach => '网络上无法访问该服务器。';

  @override
  String get sqErrSshAuth => 'SSH 登录失败：用户名、密钥或密码错误。';

  @override
  String sqErrTls(String msg) {
    return 'TLS/SSL 错误 — 无法验证证书，或服务器不支持 TLS。（$msg）';
  }

  @override
  String get sqErrHostExit => '数据库进程意外退出。';

  @override
  String get sqErrUnknown => '未知错误';

  @override
  String get sqMainCloseAnyway => '仍然关闭';

  @override
  String get sqMainCloseRunning => '仍有查询正在运行。关闭此窗口将取消这些查询。';

  @override
  String get sqMainCopySuffix => '（副本）';

  @override
  String get sqMainErrConnNotFound => '未找到连接';

  @override
  String get sqMainErrNoSession => '此窗口没有连接';

  @override
  String sqMainErrKeyFile(String path) {
    return '无法读取 SSH 密钥文件：$path';
  }

  @override
  String get sqMainTrayShow => '显示 SQL Master';

  @override
  String get sqMainTrayQuick => '快速连接';

  @override
  String get sqMainTrayNone => '没有已保存的连接';

  @override
  String get sqMainTrayQuit => '退出';

  @override
  String get npKindSsh => 'SSH 项目';

  @override
  String get npKindFtp => 'FTP 项目';

  @override
  String get npKindLocal => '本地文件夹';

  @override
  String get npKindFile => '项目文件';

  @override
  String get npKindSshHint => '通过 SSH (SFTP) 访问的服务器文件夹';

  @override
  String get npKindFtpHint => 'FTP、FTPS 或 SFTP 服务器';

  @override
  String get npKindLocalHint => '此电脑上的文件夹';

  @override
  String get npKindFileHint => '编辑单个文件';

  @override
  String get npAppSearchPh => '搜索连接…  (Ctrl+F)';

  @override
  String get npAppNewConn => '新建连接';

  @override
  String get npAppSettings => '设置';

  @override
  String npAppStats(String c, String f) {
    return '$c 个连接 · $f 个文件夹';
  }

  @override
  String get npAppWelcome => '欢迎';

  @override
  String npAppResults(String q) {
    return '“$q”的搜索结果';
  }

  @override
  String get npAppAll => '全部连接';

  @override
  String get npAppWelcomeHint =>
      '添加 SSH 或 FTP 服务器、本地文件夹或单个文件。<br>双击卡片即可在独立窗口中打开项目。';

  @override
  String get npAppFolders => '文件夹';

  @override
  String get npAppConnections => '连接';

  @override
  String get npAppDblHint => '双击卡片即可打开';

  @override
  String get npAppNoMatch => '没有匹配的连接。';

  @override
  String npAppFolderCount(String n) {
    return '$n 个连接';
  }

  @override
  String get npAppNewConnHere => '在此文件夹中新建连接';

  @override
  String get npAppNewSubfolder => '新建子文件夹';

  @override
  String get npAppKeyTag => '密钥';

  @override
  String get npAppDuplicate => '创建副本';

  @override
  String get npAppMoveToFolder => '移动到文件夹…';

  @override
  String get npAppConnMoved => '连接已移动';

  @override
  String get npAppFolderIntoSelf => '文件夹不能移动到自身中';

  @override
  String get npAppFolderPh => '例如：客户';

  @override
  String get npAppRenameFolder => '重命名文件夹';

  @override
  String get npAppDeleteFolder => '删除文件夹';

  @override
  String npAppDeleteFolderMsg(String name) {
    return '删除文件夹 <b>$name</b>？';
  }

  @override
  String npAppDeleteFolderConns(String n) {
    return '<br>其中的 $n 个连接将移到上一级文件夹。';
  }

  @override
  String get npAppRootFolder => '顶层（无文件夹）';

  @override
  String npAppMoveTitle(String name) {
    return '移动“$name”';
  }

  @override
  String get npAppTargetFolder => '目标文件夹';

  @override
  String get npAppDeleteConn => '删除连接';

  @override
  String npAppDeleteConnMsg(String name, String target) {
    return '删除连接 <b>$name</b>（$target）？<br>服务器或文件夹中的文件不受影响；只会删除此连接及其工作副本。';
  }

  @override
  String get npAppNoLocalPath => '此电脑上尚未选择路径 — 打开时将询问';

  @override
  String get npAppChangeLocalPath => '更改此电脑上的路径…';

  @override
  String get npAppOpenTabs => '已打开的标签页';

  @override
  String get npAppCustomEditor => '连接专用编辑器设置';

  @override
  String get npFormTitleNew => '新建连接';

  @override
  String npFormTitleEdit(String name) {
    return '连接：$name';
  }

  @override
  String get npFormTabConn => '连接';

  @override
  String get npFormTabProject => '项目';

  @override
  String get npFormTabEditor => '编辑器 (Notepad++)';

  @override
  String get npFormName => '名称（显示）';

  @override
  String get npFormNamePh => '例如：公司网站';

  @override
  String get npFormHost => '主机';

  @override
  String get npFormHostPh => 'server.example.com 或 192.168.1.10';

  @override
  String get npFormPort => '端口';

  @override
  String get npFormUser => '用户名';

  @override
  String get npFormPassword => '密码';

  @override
  String get npFormPwSaved => '••••••••（已保存 — 输入以更改）';

  @override
  String get npFormLoginMethod => '登录方式';

  @override
  String get npFormLoginNormal => '普通';

  @override
  String get npFormLoginAnon => '匿名';

  @override
  String get npFormAuth => 'SSH 身份验证';

  @override
  String get npFormPrivateKey => '私钥';

  @override
  String get npFormKeyFile => '私钥文件';

  @override
  String get npFormPassphrase => '密钥口令';

  @override
  String get npFormPassSaved => '（已保存）';

  @override
  String get npFormPassEmpty => '没有则留空';

  @override
  String get npFormFolder => '文件夹';

  @override
  String get npFormColor => '颜色';

  @override
  String get npFormComments => '备注';

  @override
  String get npFormRootDir => '项目文件夹（服务器上）';

  @override
  String get npFormBrowse => '选择文件夹';

  @override
  String get npFormBrowseHint => '请先点击“测试连接”，然后浏览服务器并选择文件夹。留空则打开登录文件夹。';

  @override
  String get npFormBrowseTitle => '选择服务器上的文件夹';

  @override
  String get npFormBrowseSelect => '选择此文件夹';

  @override
  String get npFormBrowseEmpty => '没有子文件夹';

  @override
  String get npFormFolderPath => '文件夹';

  @override
  String get npFormFilePath => '文件';

  @override
  String get npFormLocalPathHint => '本地路径仅保存在此电脑上；其他电脑首次打开时会询问。';

  @override
  String get npFormCacheNote =>
      '每个打开的文件都会连同其文件夹结构保存到工作副本（缓存）中。保存时会将文件上传到服务器并更新工作副本。';

  @override
  String get npFormRestoreTabs => '记住已打开的标签页';

  @override
  String get npFormRestoreTabsHint => '下次打开项目时会恢复相同的文件（仅限此电脑）。';

  @override
  String get npFormShowHidden => '显示隐藏文件';

  @override
  String get npFormShowHiddenHint => '以点开头的文件和文件夹（.env、.htaccess、.git…）';

  @override
  String get npFormExclude => '在目录树中隐藏';

  @override
  String get npFormExcludeHint => '以逗号分隔的名称或模式；可使用 * 和 ?。';

  @override
  String get npFormEditorMode => '编辑器设置';

  @override
  String get npFormEdGlobal => '使用全局编辑器设置（设置 › 编辑器）';

  @override
  String get npFormEdCustom => '使用此连接专用的设置';

  @override
  String get npFormTest => '测试连接';

  @override
  String get npFormSaveOpen => '保存并打开';

  @override
  String get npFormConnecting => '正在连接…';

  @override
  String get npFormTestOk => '连接成功';

  @override
  String get npFormTestFail => '连接失败';

  @override
  String npFormHomeDir(String dir) {
    return '登录文件夹：$dir';
  }

  @override
  String get npFormRootMissing => '警告：无法打开项目文件夹。';

  @override
  String npFormHostKey(String fp) {
    return 'SSH 主机密钥 (SHA256)：$fp';
  }

  @override
  String get npFormSaved => '连接已保存';

  @override
  String get npFormChangesSaved => '更改已保存';

  @override
  String get npTypeProtocol => '协议';

  @override
  String get npTypeFtp => 'FTP（标准）';

  @override
  String get npTypeFtpsImplicit => 'FTPS — TLS/SSL 隐式（端口 990）';

  @override
  String get npTypeFtpsSsl => 'FTPS — 显式 (AUTH SSL)';

  @override
  String get npTypeFtpsTls => 'FTPS — 显式 (AUTH TLS)';

  @override
  String get npTypeSftp => 'SFTP — SSH2';

  @override
  String get npTypeNoteFtp => '普通 FTP；密码和文件以明文（未加密）传输。';

  @override
  String get npTypeNoteFtpsImplicit => '连接从一开始就使用 TLS/SSL 加密（通常为端口 990）。';

  @override
  String get npTypeNoteFtpsSsl => '先以普通 FTP 连接，再通过 AUTH SSL 切换到加密会话。';

  @override
  String get npTypeNoteFtpsTls =>
      '先以普通 FTP 连接，再通过 AUTH TLS 切换到加密会话（最常见的 FTPS）。';

  @override
  String get npTypeNoteSftp => '通过 SSH 加密访问文件（端口 22）。首次连接时会保存服务器主机密钥。';

  @override
  String get npOptEncoding => '文件名编码';

  @override
  String get npOptEncAuto => '自动';

  @override
  String get npEdSecEncoding => '编码与换行符';

  @override
  String get npEdEncoding => '打开文件时的编码';

  @override
  String get npEdEncAuto => '自动检测 (BOM / UTF-8)';

  @override
  String get npEdFallback => '非 UTF-8 时 (ANSI)';

  @override
  String get npEdEol => '换行符';

  @override
  String get npEdEolAuto => '保留文件原有格式';

  @override
  String npEdEolConvert(String eol) {
    return '打开时转换为 $eol';
  }

  @override
  String get npEdNewDoc => '新文件：编码 · 换行符';

  @override
  String get npEdSecIndent => '缩进与语言';

  @override
  String get npEdTabSize => '制表符宽度';

  @override
  String get npEdLanguage => '语言（语法）';

  @override
  String get npEdLangAuto => '自动（扩展名 / 首行）';

  @override
  String get npEdInsertSpaces => '用空格代替制表符';

  @override
  String get npEdDetectIndent => '根据文件检测缩进';

  @override
  String get npEdDetectIndentHint => '使用制表符缩进的文件将继续使用制表符。';

  @override
  String get npEdAutoIndent => '自动缩进';

  @override
  String get npEdAutoClose => '自动闭合括号和引号';

  @override
  String get npEdSecLook => '外观';

  @override
  String get npEdTheme => '配色主题';

  @override
  String get npEdThemeAuto => '自动（跟随应用主题）';

  @override
  String get npEdWhitespace => '显示空格和制表符';

  @override
  String get npEdWsNone => '不显示';

  @override
  String get npEdWsBoundary => '除单词间的单个空格外全部显示';

  @override
  String get npEdWsTrailing => '仅行尾';

  @override
  String get npEdWsAll => '全部';

  @override
  String get npEdFont => '字体';

  @override
  String get npEdFontSize => '字号';

  @override
  String get npEdRulers => '标尺';

  @override
  String get npEdWordWrap => '自动换行';

  @override
  String get npEdLineNumbers => '行号';

  @override
  String get npEdHighlightLine => '高亮当前行';

  @override
  String get npEdSmartHighlight => '智能高亮（相同单词）';

  @override
  String get npEdIndentGuides => '缩进参考线';

  @override
  String get npEdFolding => '代码折叠';

  @override
  String get npEdBracketColors => '括号对着色';

  @override
  String get npEdMinimap => '缩略图（文档地图）';

  @override
  String get npEdControlChars => '显示不可见字符';

  @override
  String get npEdSecSave => '保存';

  @override
  String get npEdTrimTrailing => '保存时删除行尾空白';

  @override
  String get npEdFinalNewline => '在文件末尾插入换行符';

  @override
  String get npEdCheckRemote => '保存前检查更改';

  @override
  String get npEdCheckRemoteHint => '如果在你打开文件后有人在服务器上修改了它，将进行询问。';

  @override
  String get npEdAutoSave => '自动保存';

  @override
  String get npEdSec => '秒';

  @override
  String get npEdAutoSaveHint => '0 = 关闭。开启后，文件在更改后经过此时长会自动保存并上传。';

  @override
  String get npMainBalloonTitle => 'Notepad Master 正在后台运行';

  @override
  String get npMainBalloonBody => '单击托盘图标可重新打开。';

  @override
  String get npMainTrayShow => '显示 Notepad Master';

  @override
  String get npMainTrayQuick => '快速打开';

  @override
  String get npMainTrayNone => '没有已保存的连接';

  @override
  String get npMainTrayQuit => '退出';

  @override
  String get npProjToggleTree => '显示/隐藏文件夹树 (Ctrl+B)';

  @override
  String get npProjReconnect => '重新连接';

  @override
  String get npProjReconnected => '已重新连接';

  @override
  String get npProjConnectFail => '无法连接';

  @override
  String get npProjStatusOn => '已连接';

  @override
  String get npProjStatusOff => '未连接';

  @override
  String get npProjStatusConnecting => '正在连接…';

  @override
  String get npProjSave => '保存';

  @override
  String get npProjSaveAll => '全部保存';

  @override
  String get npProjUndo => '撤销';

  @override
  String get npProjRedo => '重做';

  @override
  String get npProjFind => '查找';

  @override
  String get npProjReplace => '替换';

  @override
  String get npProjGoto => '转到行';

  @override
  String get npProjShowWs => '显示空格和制表符';

  @override
  String get npProjZoomIn => '放大';

  @override
  String get npProjZoomOut => '缩小';

  @override
  String get npProjShowCache => '显示工作副本';

  @override
  String get npProjPalette => '命令面板';

  @override
  String get npProjCloseTab => '关闭';

  @override
  String get npProjCloseOthers => '关闭其他';

  @override
  String get npProjCloseAll => '全部关闭';

  @override
  String get npProjReload => '重新加载';

  @override
  String npProjReloadMsg(String name) {
    return '<b>$name</b> 中未保存的更改将丢失。要重新加载文件吗？';
  }

  @override
  String get npProjRevealTree => '在目录树中显示';

  @override
  String get npProjUnsavedTitle => '未保存的更改';

  @override
  String npProjUnsavedMsg(String name) {
    return '是否保存对 <b>$name</b> 的更改？';
  }

  @override
  String get npProjDontSave => '不保存';

  @override
  String npProjOpenFail(String name) {
    return '无法打开 $name';
  }

  @override
  String npProjTooLarge(String name, String size) {
    return '$name 太大（$size）；上限为 50 MB。';
  }

  @override
  String npProjBinary(String name) {
    return '$name 不是文本文件（二进制）；未在编辑器中打开。';
  }

  @override
  String npProjSaveFail(String name) {
    return '无法保存 $name';
  }

  @override
  String npProjSaved(String name) {
    return '$name 已保存';
  }

  @override
  String npProjSavedRemote(String name) {
    return '$name 已保存并上传';
  }

  @override
  String get npProjLossyTitle => '编码警告';

  @override
  String npProjLossyMsg(String enc) {
    return '部分字符无法以 <b>$enc</b> 编码保存，将被保存为“?”。建议通过状态栏转换为 UTF-8。';
  }

  @override
  String get npProjSaveAnyway => '仍然保存';

  @override
  String get npProjConflictTitle => '文件已在别处被更改';

  @override
  String npProjConflictMsg(String name) {
    return '在你打开 <b>$name</b> 后，它已在服务器上被更改。要如何处理？';
  }

  @override
  String get npProjConflictOverwrite => '覆盖';

  @override
  String get npProjConflictReload => '加载服务器上的版本';

  @override
  String npProjConflictAuto(String name) {
    return '$name 已在服务器上被更改；已跳过自动保存。';
  }

  @override
  String npProjPos(String col, String ln) {
    return '行 $ln，列 $col';
  }

  @override
  String npProjSel(String n) {
    return '已选择 $n';
  }

  @override
  String npProjSpaces(String n) {
    return '空格：$n';
  }

  @override
  String npProjTabWidth(String n) {
    return '制表符宽度：$n';
  }

  @override
  String get npProjIndentToSpaces => '将缩进转换为空格';

  @override
  String get npProjIndentToTabs => '将缩进转换为制表符';

  @override
  String npProjEncTitle(String name) {
    return '编码：$name';
  }

  @override
  String get npProjEncConvert => '转换为此编码（保存时）';

  @override
  String get npProjEncConvertHint => '文本内容不变；保存时以所选编码写入文件。';

  @override
  String get npProjEncReopen => '以此编码重新打开';

  @override
  String get npProjEncReopenHint => '如果字符显示乱码，请用正确的编码重新读取文件。';

  @override
  String npProjEolTo(String eol) {
    return '转换为 $eol';
  }

  @override
  String get npProjLangTitle => '选择语言';

  @override
  String get npProjLangSearch => '搜索语言…';

  @override
  String get npProjCacheCopy => '工作副本';

  @override
  String get npProjInitFail => '项目窗口无法启动';

  @override
  String get npProjEmptyHint => '双击左侧目录树中的文件；它将以标签页形式在此打开，并按其语言进行语法高亮。';

  @override
  String get npProjEmptyFile => '正在打开文件…';

  @override
  String get npTreeNewFile => '新建文件';

  @override
  String get npTreeFileName => '文件名';

  @override
  String get npTreeBadName => '名称无效';

  @override
  String get npTreeCreateFail => '无法创建';

  @override
  String get npTreeRenameFail => '无法重命名';

  @override
  String get npTreeRenameDirty => '请先保存此文件夹中已打开的文件。';

  @override
  String get npTreeDeleteTitle => '删除';

  @override
  String npTreeDeleteMsg(String name) {
    return '删除文件 <b>$name</b>？';
  }

  @override
  String npTreeDeleteDirMsg(String name) {
    return '删除文件夹 <b>$name</b> 及其中的所有内容？';
  }

  @override
  String get npTreeDeleteFail => '无法删除';

  @override
  String get npTreeTrashNote => '本地文件将移至回收站。';

  @override
  String get npTreeEmpty => '空文件夹';

  @override
  String get npTreeCollapseAll => '全部折叠';

  @override
  String get npTreeShowExplorer => '在资源管理器中显示';

  @override
  String get npTreeUp => '上级文件夹';

  @override
  String get npTreeHome => '登录文件夹';

  @override
  String get npMainErrAuth => '登录失败：用户名或密码错误。';

  @override
  String get npMainErrRefused => '连接被拒绝：端口未开放或服务器未运行。';

  @override
  String get npMainErrTimeout => '超时：无法访问服务器。';

  @override
  String get npMainErrDns => '无法解析主机名 (DNS)。';

  @override
  String get npMainErrUnreach => '无法通过网络访问服务器。';

  @override
  String get npMainErrReset => '服务器关闭了连接。';

  @override
  String get npMainErrNotFound => '未找到文件或文件夹。';

  @override
  String get npMainErrPerm => '权限被拒绝。';

  @override
  String get npMainErrExists => '已存在同名的文件或文件夹。';

  @override
  String npMainErr550(String msg) {
    return '服务器拒绝了该操作 (550)：$msg';
  }

  @override
  String get npMainErr553 => '服务器不接受该文件名 (553)。';

  @override
  String npMainErrTls(String msg) {
    return 'TLS/SSL 错误 — 请检查协议或端口。（$msg）';
  }

  @override
  String npMainErrHostKey(String newVal, String oldVal) {
    return '服务器主机密钥已更改！已保存：$oldVal，收到：$newVal。出于安全考虑已拒绝连接。';
  }

  @override
  String get npMainErrNoKey => '无法读取私钥文件。';

  @override
  String get npMainErrKey => '无法读取私钥：口令错误或格式不受支持。';

  @override
  String get npMainErrNoLocal => '在此电脑上找不到该文件夹或文件。请在主窗口中通过卡片菜单更改路径。';

  @override
  String get npMainErrConnNotFound => '找不到连接';

  @override
  String get npMainErrNoSession => '未连接';

  @override
  String get npMainErrHost => '需要填写主机地址。';

  @override
  String get npMainErrUser => '需要填写用户名（或选择匿名登录）。';

  @override
  String get npMainPickKey => '选择私钥文件';

  @override
  String get npMainCopySuffix => '（副本）';

  @override
  String get npMainCloseDirty => '有未保存的文件。关闭窗口将丢弃这些更改。';

  @override
  String get npMainCloseDiscard => '不保存并关闭';

  @override
  String get ipAppNewFolder => '新建文件夹';

  @override
  String get ipAppNewRecord => '新建记录';

  @override
  String get ipAppSearchPh => '搜索记录、IP、名称、MAC 或服务…';

  @override
  String ipAppStats(String n) {
    return '$n 条记录';
  }

  @override
  String get ipColIp => 'IP';

  @override
  String get ipColMac => 'MAC';

  @override
  String get ipColName => '名称';

  @override
  String get ipColRtt => '响应';

  @override
  String get ipColServices => '服务';

  @override
  String get ipColStatus => '状态';

  @override
  String get ipColVendor => '厂商';

  @override
  String get ipCtxCopyIp => '复制 IP 地址';

  @override
  String get ipCtxCopyMac => '复制 MAC 地址';

  @override
  String get ipCtxCopyName => '复制名称';

  @override
  String get ipCtxCopyRange => '复制范围';

  @override
  String get ipCtxOpenWeb => '在浏览器中打开';

  @override
  String ipFolderDeleteMsg(String name) {
    return '将删除文件夹“$name”；其中的记录和文件夹将移至上级文件夹。';
  }

  @override
  String get ipFolderEmpty => '空文件夹';

  @override
  String get ipFolderName => '文件夹名称';

  @override
  String get ipFolderRename => '重命名文件夹';

  @override
  String get ipHostAlive => '在线判定';

  @override
  String get ipHostBanner => '欢迎信息';

  @override
  String get ipHostCert => '证书';

  @override
  String get ipHostCertExpires => '有效期至';

  @override
  String get ipHostCertIssuer => '颁发者';

  @override
  String get ipHostDetails => '详情';

  @override
  String get ipHostLocalMac => '私有地址';

  @override
  String get ipHostNoServices => '列表中的端口均未开放。';

  @override
  String get ipHostSelfSigned => '自签名';

  @override
  String get ipHostServer => '服务器';

  @override
  String get ipHostTitle => '标题';

  @override
  String get ipHostUnknown => '（名称未解析）';

  @override
  String get ipNoticeAccept => '我知道了';

  @override
  String get ipNoticeBody =>
      'IP Tools 仅发现您的本地网络：通过 ping 查找设备，尝试连接一小组端口，并解析设备名称。请只扫描您拥有或获得授权的网络。';

  @override
  String get ipNoticeLimits =>
      '按设计仅扫描私有地址（10.x、172.16–31.x、192.168.x、169.254.x）；不进行漏洞探测、密码尝试或大范围端口扫描。';

  @override
  String get ipNoticeShort => '请只扫描获得授权的网络';

  @override
  String get ipNoticeText => '请只扫描您拥有或获得授权的网络。';

  @override
  String get ipNoticeTitle => '本地网络发现';

  @override
  String get ipPrivacyNote => '隐私：扫描结果仅保存在本机，绝不会发送到任何地方。仅扫描私有/本地地址。';

  @override
  String get ipRangeErrEmpty => '请输入 IP 范围。';

  @override
  String ipRangeErrInvalid(String token) {
    return '地址或范围无效：$token';
  }

  @override
  String ipRangeErrIpv6(String token) {
    return '不支持 IPv6 地址：$token';
  }

  @override
  String ipRangeErrNotPrivate(String token) {
    return '只能扫描私有/本地地址（10.x、172.16–31.x、192.168.x、169.254.x）：$token';
  }

  @override
  String ipRangeErrReversed(String token) {
    return '范围起点大于终点：$token';
  }

  @override
  String ipRangeErrTooMany(String count) {
    return '范围过大（最多 65,536 个地址，即一个 /16）：$count';
  }

  @override
  String ipRangeOk(String n) {
    return '将扫描 $n 个地址';
  }

  @override
  String get ipRecColor => '颜色';

  @override
  String ipRecDeleteMsg(String name) {
    return '将删除记录“$name”及其在本机上的扫描结果。';
  }

  @override
  String ipRecDevices(String n) {
    return '$n 台设备';
  }

  @override
  String get ipRecEdit => '编辑记录';

  @override
  String get ipRecFolder => '文件夹';

  @override
  String ipRecItems(String n) {
    return '$n 项';
  }

  @override
  String ipRecLastScan(String time) {
    return '上次扫描：$time';
  }

  @override
  String get ipRecMove => '移动';

  @override
  String get ipRecMoveTitle => '移动记录';

  @override
  String get ipRecName => '名称';

  @override
  String get ipRecNever => '尚未扫描';

  @override
  String ipRecNewDevices(String n) {
    return '$n 台新设备';
  }

  @override
  String get ipRecRange => 'IP 范围';

  @override
  String get ipRecRangeHint =>
      '示例：192.168.1.0/24 · 192.168.1.1-192.168.1.255 · 10.0.0.5 · 多个范围用逗号分隔。最大 /16。';

  @override
  String get ipRecRootFolder => '记录';

  @override
  String get ipRecSaved => '记录已保存';

  @override
  String get ipScanBusy => '另一个扫描正在进行，请先停止它。';

  @override
  String ipScanDone(String n) {
    return '扫描完成：$n 台设备';
  }

  @override
  String get ipScanEmptyBody => '按“扫描”或点击卡片上的 ▶。发现的设备会显示在这里。';

  @override
  String get ipScanEmptyTitle => '此记录尚未扫描';

  @override
  String get ipScanExport => '导出';

  @override
  String get ipScanExportCsv => '另存为 CSV…';

  @override
  String get ipScanExportJson => '另存为 JSON…';

  @override
  String get ipScanExported => '已导出';

  @override
  String ipScanFailed(String msg) {
    return '扫描失败：$msg';
  }

  @override
  String get ipScanFilter => '筛选';

  @override
  String get ipScanFilterAll => '全部';

  @override
  String get ipScanFilterGone => '已消失';

  @override
  String get ipScanFilterNew => '新增';

  @override
  String get ipScanFilterServices => '有服务';

  @override
  String ipScanFound(String n) {
    return '已发现 $n 台设备';
  }

  @override
  String get ipScanNoMatch => '没有符合筛选条件的设备。';

  @override
  String get ipScanPhaseNames => '正在解析名称';

  @override
  String get ipScanPhasePing => '正在查找设备';

  @override
  String get ipScanPhasePorts => '正在尝试服务';

  @override
  String ipScanProgress(String done, String total) {
    return '$done/$total';
  }

  @override
  String ipScanRateLimited(String s) {
    return '同一记录最早可在 $s 秒后重新扫描。';
  }

  @override
  String get ipScanScan => '扫描';

  @override
  String get ipScanScanning => '正在扫描…';

  @override
  String get ipScanSelectHint => '点击左侧的记录：将扫描该范围，发现的设备会显示在这里。';

  @override
  String get ipScanSelectRecord => '请选择一条记录';

  @override
  String get ipScanStop => '停止';

  @override
  String get ipScanStopped => '扫描已停止';

  @override
  String get ipStatusAliveArp => '出现在 ARP 表中（未响应 ping）';

  @override
  String get ipStatusAlivePing => '已响应 ping';

  @override
  String get ipStatusGone => '已消失（上次扫描时存在）';

  @override
  String get ipStatusLive => '扫描中';

  @override
  String get ipStatusNew => '新增（上次扫描时不存在）';

  @override
  String get ipStatusSame => '在线';

  @override
  String ipTagCopied(String text) {
    return '已复制到剪贴板：$text';
  }

  @override
  String get ipTagFailed => '无法打开';

  @override
  String get ipTagGroupCamera => '摄像头 (RTSP)';

  @override
  String get ipTagGroupDb => '数据库';

  @override
  String get ipTagGroupFtp => 'FTP';

  @override
  String get ipTagGroupPrinter => '打印机';

  @override
  String get ipTagGroupRdp => '远程桌面';

  @override
  String get ipTagGroupSmb => '文件共享';

  @override
  String get ipTagGroupSsh => 'SSH';

  @override
  String get ipTagGroupVnc => 'VNC';

  @override
  String get ipTagGroupWeb => '网页';

  @override
  String ipTagOpened(String text) {
    return '正在打开：$text';
  }

  @override
  String get ipTrayHiddenHint => 'IP Tools 仍在托盘中运行。点击图标可恢复窗口。';

  @override
  String get ipTrayQuit => '退出';

  @override
  String get ipTrayShow => '显示 IP Tools';

  @override
  String get ipWelcomeBody =>
      '保存一个 IP 范围（例如 192.168.1.0/24）。点击记录即扫描该范围；发现的设备会连同名称、厂商和开放服务一起列出。点击服务标签即可打开对应应用。';

  @override
  String get ipWelcomeTitle => '您的本地网络中有什么？';

  @override
  String get cvTypeVideo => '视频';

  @override
  String get cvTypeImage => '图片';

  @override
  String get cvTypeAudio => '音频';

  @override
  String get cvTypeVideoHint => 'MP4、MKV、AVI、MOV…';

  @override
  String get cvTypeImageHint => 'JPG、PNG、WEBP、AVIF…';

  @override
  String get cvTypeAudioHint => 'MP3、WAV、FLAC、M4A…';

  @override
  String get cvTypeVideoAll => '所有视频文件';

  @override
  String get cvTypeImageAll => '所有图片文件';

  @override
  String get cvTypeAudioAll => '所有音频文件';

  @override
  String get cvAppSearchPh => '搜索项目…  (Ctrl+F)';

  @override
  String get cvAppNewProject => '新建项目';

  @override
  String get cvAppSettings => '设置';

  @override
  String cvAppStats(String c, String f) {
    return '$c 个项目 · $f 个文件夹';
  }

  @override
  String get cvAppWelcome => '欢迎';

  @override
  String cvAppResults(String q) {
    return '“$q”的搜索结果';
  }

  @override
  String get cvAppAll => '所有项目';

  @override
  String get cvAppWelcomeHint =>
      '创建你的第一个转换项目。<br>选择视频、图片或音频，设置源扩展名和目标扩展名，然后指定一个文件或文件夹。';

  @override
  String get cvAppFolders => '文件夹';

  @override
  String get cvAppProjects => '项目';

  @override
  String get cvAppDblHint => '双击项目即可打开';

  @override
  String get cvAppNoMatch => '没有匹配的项目。';

  @override
  String cvAppFolderCount(String n) {
    return '$n 个项目';
  }

  @override
  String get cvAppNewProjectHere => '在此文件夹中新建项目';

  @override
  String get cvAppNewSubfolder => '新建子文件夹';

  @override
  String get cvAppDuplicate => '创建副本';

  @override
  String get cvAppMoveToFolder => '移动到文件夹…';

  @override
  String get cvAppProjectMoved => '项目已移动';

  @override
  String get cvAppFolderIntoSelf => '不能将文件夹移动到其自身中';

  @override
  String get cvAppFolderPh => '例如：客户视频';

  @override
  String get cvAppRenameFolder => '重命名文件夹';

  @override
  String get cvAppDeleteFolder => '删除文件夹';

  @override
  String cvAppDeleteFolderMsg(String name) {
    return '要删除文件夹 <b>$name</b> 吗？';
  }

  @override
  String cvAppDeleteFolderProjects(String n) {
    return '<br>其中的 $n 个项目将移至上级文件夹。';
  }

  @override
  String get cvAppRootFolder => '顶层（无文件夹）';

  @override
  String cvAppMoveTitle(String name) {
    return '移动“$name”';
  }

  @override
  String get cvAppTargetFolder => '目标文件夹';

  @override
  String get cvAppDeleteProject => '删除项目';

  @override
  String cvAppDeleteProjectMsg(String name) {
    return '要删除项目 <b>$name</b> 吗？<br>其转换后的文件和文本也会被删除。源文件不受影响。';
  }

  @override
  String get cvAppProjectSettings => '项目设置';

  @override
  String get cvAppNoSource => '此电脑上尚未选择源';

  @override
  String get cvAppAllExts => '全部';

  @override
  String get cvAppRunning => '运行中';

  @override
  String cvAppDoneCount(String n) {
    return '已完成 $n 个';
  }

  @override
  String cvAppErrorCount(String n) {
    return '失败 $n 个';
  }

  @override
  String get cvAppProjectSaved => '项目已保存';

  @override
  String get cvAppClearOutputs => '删除转换后的文件';

  @override
  String cvAppClearOutputsMsg(String name) {
    return '要删除 <b>$name</b> 转换后的文件吗？源文件不受影响，你可以随时重新转换。';
  }

  @override
  String get cvPfTitleNew => '新建项目';

  @override
  String cvPfTitleEdit(String name) {
    return '项目设置：$name';
  }

  @override
  String get cvPfCreate => '保存';

  @override
  String get cvPfTabGeneral => '常规';

  @override
  String get cvPfTabOutput => '转换设置';

  @override
  String get cvPfTabSpeech => '语音';

  @override
  String get cvPfName => '项目名称';

  @override
  String get cvPfNamePh => '例如：假期视频';

  @override
  String get cvPfType => '类型';

  @override
  String get cvPfSourceExt => '源文件扩展名';

  @override
  String get cvPfTargetExt => '目标文件扩展名';

  @override
  String get cvPfSelectAll => '全选';

  @override
  String get cvPfSelectNone => '全不选';

  @override
  String get cvPfGroupVideo => '视频';

  @override
  String get cvPfGroupAnim => '动画';

  @override
  String get cvPfGroupAudioOnly => '仅音频（从视频中提取）';

  @override
  String get cvPfAudioOnlyHint => '仅保留视频的音轨。';

  @override
  String get cvPfGifHint => '动态 GIF（最高 30 帧/秒）。';

  @override
  String get cvPfSource => '源';

  @override
  String get cvPfModeFile => '文件';

  @override
  String get cvPfModeFolder => '文件夹';

  @override
  String get cvPfPathFile => '要转换的文件';

  @override
  String get cvPfPathFolder => '要转换的文件夹';

  @override
  String get cvPfPathNone => '尚未选择 — 请点击“浏览…”';

  @override
  String get cvPfSubfolders => '包含子文件夹';

  @override
  String get cvPfConcurrency => '同时转换的文件数';

  @override
  String get cvPfConcurrencyHint => '数值越大完成越快，但 CPU 和磁盘负载也越高。';

  @override
  String get cvPfFolder => '项目文件夹';

  @override
  String get cvPfSpeechAsk => '将语音转换为文本';

  @override
  String get cvPfSpeechAskHint => '转写视频或音频中的语音：每句话的时间（秒）、语言和文本分别显示在不同的列中。';

  @override
  String get cvPfSpeechModel => '语音模型';

  @override
  String get cvPfSpeechLang => '语音语言';

  @override
  String get cvPfPerWindow => '每 30 秒重新检测一次语言';

  @override
  String get cvPfPerWindowHint => '适用于包含多种语言的录音。速度较慢。';

  @override
  String get cvPfModels => '模型';

  @override
  String get cvPfSpeechNote =>
      '语音识别在此电脑上离线运行（whisper.cpp），音频绝不会发送到服务器。模型会在首次使用时下载一次。';

  @override
  String get cvPfErrExt => '请至少选择一个源扩展名。';

  @override
  String get cvOutQuality => '质量';

  @override
  String get cvOutQHigh => '高（文件较大）';

  @override
  String get cvOutQMedium => '中（推荐）';

  @override
  String get cvOutQLow => '低（文件较小）';

  @override
  String get cvOutResolution => '分辨率';

  @override
  String get cvOutAsSource => '与源相同';

  @override
  String get cvOutResolutionHint => '仅缩小；较小的视频不会被放大。';

  @override
  String get cvOutFps => '帧率';

  @override
  String get cvOutCodec => '视频编码';

  @override
  String get cvOutH264 => 'H.264（兼容性最好）';

  @override
  String get cvOutH265 => 'H.265 / HEVC（文件更小）';

  @override
  String get cvOutCodecHint => 'H.265 仅用于 MP4、MKV、MOV 和 M4V 目标格式。';

  @override
  String get cvOutSpeed => '编码速度';

  @override
  String get cvOutSpeedVeryfast => '非常快';

  @override
  String get cvOutSpeedFast => '快';

  @override
  String get cvOutSpeedMedium => '均衡';

  @override
  String get cvOutSpeedSlow => '慢（文件更小）';

  @override
  String get cvOutAudioBitrate => '音频比特率';

  @override
  String get cvOutNoAudio => '移除音频';

  @override
  String get cvOutImgQuality => '质量';

  @override
  String get cvOutImgQualityHint =>
      '适用于 JPG、WEBP、AVIF 和 TIFF。PNG 为无损格式；低于 80 时使用调色板。';

  @override
  String get cvOutMaxWidth => '最大宽度';

  @override
  String get cvOutMaxHeight => '最大高度';

  @override
  String get cvOutNoLimit => '不限制';

  @override
  String get cvOutResizeHint => '保持宽高比；较小的图片不会被放大。';

  @override
  String get cvOutKeepMeta => '保留元数据（EXIF、颜色配置文件）';

  @override
  String get cvOutKeepMetaHint => '关闭后，位置等个人数据不会写入输出文件。';

  @override
  String get cvOutBitrate => '比特率';

  @override
  String get cvOutBitrateHint => 'WAV、FLAC 和 AIFF 为无损格式，不适用比特率。';

  @override
  String get cvOutSampleRate => '采样率';

  @override
  String get cvOutChannels => '声道';

  @override
  String get cvOutStereo => '立体声';

  @override
  String get cvOutMono => '单声道';

  @override
  String get cvSpeechModelTiny => 'Tiny（最快）';

  @override
  String get cvSpeechModelBase => 'Base（推荐）';

  @override
  String get cvSpeechModelSmall => 'Small（更准确）';

  @override
  String get cvSpeechModelMedium => 'Medium（高准确度）';

  @override
  String get cvSpeechModelTurbo => 'Large v3 Turbo（最准确）';

  @override
  String get cvSpeechLangAuto => '自动检测';

  @override
  String get cvSpeechDownload => '下载';

  @override
  String cvSpeechInstalled(String size) {
    return '已安装 · $size';
  }

  @override
  String get cvSpeechDownloadFailed => '无法下载模型';

  @override
  String get cvSpeechDlEngine => '正在下载语音引擎';

  @override
  String cvSpeechDlModel(String model) {
    return '正在下载语音模型：$model';
  }

  @override
  String get cvSpeechEngineAuto => '语音引擎（whisper.cpp）将在首次使用时下载。';

  @override
  String get cvSpeechEngineMissing => '未找到语音引擎（whisper-cli）。';

  @override
  String get cvPjOriginal => '原始';

  @override
  String get cvPjConverted => '已转换';

  @override
  String get cvPjFolders => '文件夹';

  @override
  String get cvPjFiles => '文件';

  @override
  String get cvPjTranscript => '文本';

  @override
  String get cvPjTrSecond => '秒';

  @override
  String get cvPjTrLang => '语言';

  @override
  String get cvPjTrText => '文本';

  @override
  String get cvPjSecUnit => '秒';

  @override
  String get cvPjStart => '开始';

  @override
  String get cvPjStop => '停止';

  @override
  String get cvPjChangeSource => '更改源';

  @override
  String get cvPjPickSource => '选择源';

  @override
  String get cvPjOpenOutDir => '打开转换后文件所在文件夹';

  @override
  String get cvPjExportOutputs => '将转换后的文件复制到其他文件夹…';

  @override
  String get cvPjClearOutputs => '删除转换后的文件';

  @override
  String get cvPjLinkPreview => '同步播放两个预览';

  @override
  String get cvPjFilterPh => '搜索文件';

  @override
  String get cvPjFAll => '全部';

  @override
  String get cvPjFPending => '等待中';

  @override
  String get cvPjFActive => '进行中';

  @override
  String get cvPjFDone => '已完成';

  @override
  String get cvPjFError => '失败';

  @override
  String get cvPjExpandAll => '全部展开';

  @override
  String get cvPjCollapseAll => '全部折叠';

  @override
  String get cvPjRescan => '重新扫描';

  @override
  String get cvPjColName => '名称';

  @override
  String get cvPjColFolder => '文件夹';

  @override
  String get cvPjColSize => '大小';

  @override
  String get cvPjColProgress => '进度';

  @override
  String get cvPjColStatus => '状态';

  @override
  String get cvPjColSpeech => '文本';

  @override
  String get cvPjColOut => '输出';

  @override
  String cvPjSegments(String n) {
    return '$n 句';
  }

  @override
  String get cvPjNoAudio => '无音频';

  @override
  String cvPjNoFiles(String exts) {
    return '此文件夹中没有所选扩展名的文件（$exts）。';
  }

  @override
  String get cvPjNoMatch => '没有匹配的文件。';

  @override
  String get cvPjNoneChecked => '列表为空。请在左侧树中勾选要转换的文件。';

  @override
  String get cvPjConvertThis => '转换此文件';

  @override
  String get cvPjReconvert => '重新转换';

  @override
  String get cvPjTranscribeThis => '转写';

  @override
  String get cvPjRetranscribe => '重新转写';

  @override
  String get cvPjOpenOut => '打开转换后的文件';

  @override
  String get cvPjRevealOut => '在文件夹中显示转换后的文件';

  @override
  String get cvPjOpenSrc => '打开原始文件';

  @override
  String get cvPjRevealSrc => '在文件夹中显示原始文件';

  @override
  String get cvPjExportThis => '复制到其他文件夹…';

  @override
  String get cvPjDeleteOut => '删除转换后的文件';

  @override
  String get cvPjUncheck => '从列表中移除';

  @override
  String cvPjExported(String n) {
    return '已复制 $n 个文件';
  }

  @override
  String get cvPjFileMissing => '未找到源文件。';

  @override
  String get cvPjPickToPreview => '在列表中选择一个文件以预览。';

  @override
  String get cvPjOutPreviewHint => '转换完成后将显示在这里。';

  @override
  String get cvPjConverting => '正在转换…';

  @override
  String get cvPjCantPlay => '此格式无法在这里直接播放。';

  @override
  String get cvPjMakePreview => '生成预览';

  @override
  String get cvPjMakingPreview => '正在准备预览…';

  @override
  String get cvPjNoSourceTitle => '此电脑上尚未选择源';

  @override
  String get cvPjNoSourceHint => '此项目是从其他设备同步而来，或尚未选择源。请选择要转换的文件或文件夹。';

  @override
  String get cvPjSourceGone => '未找到源';

  @override
  String get cvPjTrImage => '语音转文本仅适用于视频和音频项目。';

  @override
  String get cvPjTrPick => '选择一个文件以查看其文本。';

  @override
  String get cvPjTrAfter => '文件转换完成后将转写语音。';

  @override
  String get cvPjTrOff => '此项目已关闭语音转文本。你可以立即为此文件运行。';

  @override
  String cvPjTrRunning(String p) {
    return '正在转写… $p%';
  }

  @override
  String get cvPjTrNone => '此文件中未检测到语音。';

  @override
  String get cvPjTrNoExport => '没有可导出的文本。';

  @override
  String get cvPjTrSaved => '文本已保存';

  @override
  String get cvPjExportTranscript => '导出文本';

  @override
  String get cvPjFmtSrt => 'SRT 字幕';

  @override
  String get cvPjFmtVtt => 'WebVTT 字幕';

  @override
  String get cvPjFmtTxt => '纯文本（TXT）';

  @override
  String get cvPjFmtCsv => '电子表格（CSV）';

  @override
  String cvPjStTotal(String n) {
    return '$n 个文件';
  }

  @override
  String cvPjStDone(String n) {
    return '已完成 $n 个';
  }

  @override
  String cvPjStErr(String n) {
    return '失败 $n 个';
  }

  @override
  String cvPjStActive(String n) {
    return '正在转换 $n 个';
  }

  @override
  String cvPjStSpeech(String n) {
    return '正在转写 $n 个';
  }

  @override
  String cvPjStOut(String size) {
    return '输出：$size';
  }

  @override
  String cvPjStConc(String n) {
    return '同时：$n';
  }

  @override
  String get cvPjFinished => '转换完成';

  @override
  String cvPjFinishedSub(String done, String err, String total) {
    return '已完成 $done/$total 个文件 · 失败 $err 个';
  }

  @override
  String get cvStPending => '等待中';

  @override
  String get cvStQueued => '已排队';

  @override
  String get cvStConverting => '正在转换';

  @override
  String get cvStDone => '已完成';

  @override
  String get cvStError => '错误';

  @override
  String get cvStCanceled => '已取消';

  @override
  String get cvMainBalloonTitle => 'Convert Master 仍在运行';

  @override
  String get cvMainBalloonBody => '单击托盘图标即可重新打开窗口。';

  @override
  String get cvMainTrayShow => '显示 Convert Master';

  @override
  String get cvMainTrayProjects => '项目';

  @override
  String get cvMainTrayNone => '（无项目）';

  @override
  String get cvMainTrayQuit => '退出';

  @override
  String get cvErrCanceled => '已取消';

  @override
  String get cvErrNoVideo => '该文件没有视频流。';

  @override
  String get cvErrNoAudio => '该文件没有音频。';

  @override
  String get cvPjOcrThis => '识别文字（OCR）';

  @override
  String get cvPjReocr => '重新识别文字（OCR）';

  @override
  String get cvPjNoText => '无文字';

  @override
  String get cvPjNoTextHint => '图像中未找到可识别的文字。';

  @override
  String get cvPjOcrPanel => '文字（OCR）';

  @override
  String get cvPjTrLine => '行';

  @override
  String get cvPjTrConf => '置信度';

  @override
  String cvPjLines(String n) {
    return '$n 行';
  }

  @override
  String get cvPjOcrAfter => '图像转换完成后将识别其中的文字。';

  @override
  String get cvPjOcrOff => '此项目未开启 OCR。您可以现在为这张图像运行。';

  @override
  String cvPjOcrRunning(String p) {
    return '正在识别文字… $p%';
  }

  @override
  String get cvPjCopyAll => '全部复制';

  @override
  String get cvPjCopied => '文字已复制到剪贴板';

  @override
  String cvOcrDl(String lang) {
    return '正在下载 OCR 语言数据：$lang';
  }

  @override
  String get cvOcrNotInstalled => '首次使用时下载';

  @override
  String get cvOcrDownloadFailed => '无法下载 OCR 语言数据';

  @override
  String get cvPfTabOcr => 'OCR';

  @override
  String get cvPfOcrAsk => '识别图像中的文字（OCR）';

  @override
  String get cvPfOcrAskHint => '提取图像中的文字：每一行、识别置信度和文字分别显示在不同的列中。如不需要，请保持关闭。';

  @override
  String get cvPfOcrLangs => '图像中文字的语言';

  @override
  String get cvPfOcrLangsHint => '最多 6 种语言；语言越少，速度越快、越准确。';

  @override
  String get cvPfOcrData => '语言数据';

  @override
  String get cvPfOcrNote =>
      'OCR 在本机离线运行（Tesseract）；图像不会发送到任何服务器。每种语言在首次使用时下载一次。';

  @override
  String cvErrOcr(String msg) {
    return '无法识别文字：$msg';
  }

  @override
  String get cvErrUnreadable => '无法读取该文件（已损坏或不受支持）。';

  @override
  String get cvErrUnsupported => '不支持此转换。';

  @override
  String cvErrFfmpegMissing(String msg) {
    return '无法启动转换引擎（ffmpeg）：$msg';
  }

  @override
  String get cvErrEngineMissing => '未找到语音引擎（whisper.cpp）。';

  @override
  String cvErrDownload(String msg) {
    return '下载失败：$msg';
  }

  @override
  String get cvErrNotFound => '未找到文件。';

  @override
  String get cvErrAccess => '访问被拒绝。';

  @override
  String get cvErrBusy => '该文件正被其他程序使用。';

  @override
  String get cvErrNoSpace => '磁盘已满。';

  @override
  String cvErrFfmpeg(String msg) {
    return '无法转换：$msg';
  }

  @override
  String cvErrWhisper(String msg) {
    return '无法转写：$msg';
  }

  @override
  String get cvMainCloseActive => '正在进行转换。关闭窗口将停止转换。';

  @override
  String get cvMainCloseAnyway => '仍然关闭';

  @override
  String get cvMainCopySuffix => '（副本）';

  @override
  String get cvMainErrProjectNotFound => '未找到项目';

  @override
  String get cvMainExportTo => '转换后文件的复制目标文件夹';

  @override
  String get cvMainPickFile => '选择要转换的文件';

  @override
  String get cvMainPickFolder => '选择要转换的文件夹';

  @override
  String get cvMainSaveTranscript => '保存文本';

  @override
  String get cvMainUntitled => '未命名项目';

  @override
  String get sqOp => '大于或等于';

  @override
  String get sqOpNotcontains => '不包含';

  @override
  String get sqOpNotlike => 'NOT LIKE';

  @override
  String get sqOpNotin => '不在列表中';

  @override
  String get sqOpIsnull => '为 NULL';

  @override
  String get sqOpIsnotnull => '不为 NULL';

  @override
  String get ipMobScanThis => '扫描此网络';

  @override
  String get ipMobDeleteRecord => '删除记录';

  @override
  String get ipMobNewRecordHere => '在此新建记录';

  @override
  String get ipMobNoMatch => '未找到匹配的记录。';

  @override
  String ipMobAddresses(int n) {
    return '$n 个地址';
  }

  @override
  String get ipMobAllRecords => '所有记录';

  @override
  String get ipMobSetScan => '扫描';

  @override
  String get ipMobSetPorts => '要探测的服务';

  @override
  String get ipMobSetPortsHint => '每个端口只进行一次标准 TCP 连接尝试。列表固定，您可以关闭不需要的项。';

  @override
  String get ipMobSetSpeed => '速度';

  @override
  String get ipMobSetConcurrency => '并发连接数';

  @override
  String get ipMobSetConcurrencyHint => '同时最多 64 次连接尝试（设计上限）。';

  @override
  String get ipMobSetTimeout => '超时';

  @override
  String get ipMobSetTimeoutHint => '每台设备最多等待 1000 毫秒。';

  @override
  String get ipMobSetLimitsNote =>
      'IP Tools 仅是发现与清单工具：端口列表不可扩展，不进行漏洞或密码尝试，仅扫描私有/本地地址。';

  @override
  String get ipMobMacMobile => '移动端不可用';

  @override
  String get ipMobAliveTcp => '已响应 TCP 连接';

  @override
  String get ipMobAliveName => '已响应名称解析';

  @override
  String get ipMobOpenInSsh => '在 SSH Master 中打开';

  @override
  String get ipMobOpenInSshNote => '地址已复制到剪贴板；请粘贴到 SSH Master › 新建连接表单中。';

  @override
  String get ipMobCopyAddress => '复制地址';

  @override
  String get ipMobSuggestLocal => '本设备所在网络';

  @override
  String get ipMobSuggestLocalNone => '未找到 Wi-Fi 网络';

  @override
  String get ipMobPhoneNoMacNote =>
      '移动端没有 ping 和 ARP：在线状态通过 TCP 连接尝试和名称解析判断；无法显示 MAC 和厂商信息。';

  @override
  String get cvMobNotOnMobile => '移动端不可用';

  @override
  String get cvMobSpeechNote =>
      '语音识别在设备上离线运行 (whisper.cpp)；音频不会发送到任何服务器。模型在首次使用时下载一次（Tiny 75 MB · Base 142 MB · Small 466 MB；建议使用 Wi-Fi），可在\"设置 › 语音模型\"中管理。';

  @override
  String get cvMobOcrNote =>
      '图片转文字在设备上运行 (Google ML Kit)；图片不会发送到任何服务器。可识别文字：拉丁字母（含土耳其语）、中文、日文、韩文和天城文（印地语）。Android 上识别模型随应用提供。';

  @override
  String get cvMobFolderNote => '移动端无法选择源文件夹；文件需逐个添加或从相册添加。';

  @override
  String get cvMobConcurrencyHint => '移动端最多同时转换 2 个文件。';

  @override
  String get cvMobAddFiles => '添加文件';

  @override
  String get cvMobAddFromGallery => '从相册添加';

  @override
  String get cvMobPickFilesHint => '添加要转换的文件；输出保存在应用文档目录下。';

  @override
  String get cvMobShareOutput => '分享输出';

  @override
  String get cvMobShareAllOutputs => '分享全部输出';

  @override
  String get cvMobSourceCopies => '源文件副本';

  @override
  String get cvMobModuleSettings => 'Convert Master 设置';

  @override
  String get cvMobDefaultConcurrency => '新项目中同时转换的文件数';

  @override
  String get cvMobStorage => '存储';

  @override
  String get cvMobConversion => '转换';

  @override
  String get cvMobClearOrphans => '清理已删除项目的文件';

  @override
  String get cvMobStorageNote => '转换后的文件和源文件副本保存在应用的文档文件夹中，不会离开您的设备。';

  @override
  String get cvMobCleared => '已清理';

  @override
  String get cvMobNoOutputsYet => '尚无已转换的文件。';

  @override
  String cvMobFilesAdded(int n) {
    return '已添加 $n 个文件';
  }

  @override
  String get cvMobUnsupportedExt => '不在此项目的源扩展名范围内';

  @override
  String get cvMobUnsupportedOnMobile => '移动端不支持';

  @override
  String get cvMobLicense =>
      '视频和音频转换使用 FFmpegKit（LGPL 3.0，不含 GPL 组件）；H.264 / H.265 编码使用设备的硬件编码器（iOS VideoToolbox、Android MediaCodec）。';

  @override
  String cvMobConverted(int n) {
    return '已转换 $n 个文件';
  }

  @override
  String cvMobFilesCount(int n) {
    return '$n 个文件';
  }

  @override
  String get sqMobUnsupportedMobile => '移动端尚不支持此引擎';

  @override
  String get sqMobPickFile => '选择';

  @override
  String get sqMobFileCopied => '文件已复制到应用的文档目录';

  @override
  String get sqMobSshKeyPaste => '粘贴 PEM 密钥或从文件选择';

  @override
  String get sqMobErrHost => '需要服务器地址';

  @override
  String get sqMobErrFile => '请选择数据库文件';

  @override
  String get sqMobErrSshHost => '需要 SSH 服务器和用户名';

  @override
  String get sqMobErrSshKey => '需要 SSH 私钥';

  @override
  String get sqMobSslVerifyNote => 'MySQL 驱动不验证证书；“验证”选项的行为与“必需”相同。';

  @override
  String get sqMobRowDetail => '行详情';

  @override
  String get sqMobNoResult => '暂无结果 — 点击运行开始';

  @override
  String get sqMobExportJsonl => 'JSONL（每行一个 JSON）';

  @override
  String get sqMobExportNoRows => '没有可导出的行';

  @override
  String get sqMobSettingsTitle => 'SQL Master 设置';

  @override
  String get sqMobRowLimit => '查询行数上限';

  @override
  String get sqMobPreviewRows => '表预览行数';

  @override
  String get sqMobEditorFont => '编辑器字号';

  @override
  String get sqMobCopyCell => '复制值';

  @override
  String get sqMobSelectionRun => '运行所选内容';

  @override
  String get sqMobTunnelOpening => '正在打开 SSH 隧道…';

  @override
  String get sqMobConnectingDb => '正在连接数据库…';

  @override
  String get sqMobOpEq => '=（等于）';

  @override
  String get sqMobOpNe => '≠（不等于）';

  @override
  String get sqMobOpLt => '<（小于）';

  @override
  String get sqMobOpGt => '>（大于）';

  @override
  String get sqMobOpLe => '≤（小于或等于）';

  @override
  String get npMobSaveAs => '另存为…';

  @override
  String get npMobSaveAsTitle => '另存为';

  @override
  String get npMobDefaultProjectName => '项目';

  @override
  String get npMobLocalPathExample => '文档/Notepad Master/…';

  @override
  String get npMobReplaceAll => '全部替换';

  @override
  String get sqMobDuckExcelNote =>
      'Excel (.xlsx) 文件需要 DuckDB 的 \"excel\" 扩展；若此设备无法加载该扩展，打开将失败。CSV、Parquet 和 JSON 无需额外安装。';

  @override
  String get sqMobDuckExcelUnsupported =>
      '无法打开 Excel 文件：此设备无法加载 DuckDB 的 \"excel\" 扩展。请将文件另存为 CSV 后重试。';

  @override
  String get sqMobDuckFileNotFound => '未找到文件';

  @override
  String get sqMobDuckNativeMissing =>
      '无法加载 DuckDB 原生库 (libduckdb)。应用可能在构建时未包含此平台的 DuckDB 二进制文件。';

  @override
  String get sqMobMssqlNativeMissing =>
      '应用未打包 SQL Server 原生库 (FreeTDS libsybdb.so)。需要将 mssql_connection 的 jniLibs 目录加入 Android 构建。';

  @override
  String get sqMobMssqlConnectFailed =>
      '无法连接 SQL Server。请检查服务器地址、端口、用户名/密码和 TLS 模式（详情见设备日志中的 \"MssqlClient\"）。';

  @override
  String get sqMobMssqlIosUnsupported =>
      'SQL Server 驱动尚不支持 iOS（未打包 FreeTDS 库）。';

  @override
  String get cvMobSpeechModelFallback =>
      '此模型在移动端不可用；本设备将使用 Base 模型。您的选择在桌面端生效。';

  @override
  String get cvMobPerWindowNote => '移动版不会报告检测到的语言；此选项在桌面端生效。';

  @override
  String get cvMobOcrUnsupported => '移动端无法识别（无 ML Kit 模型）；在桌面端使用';

  @override
  String get cvMobOcrMax => '最多可选择 6 种语言。';

  @override
  String get cvMobShareAllTexts => '分享全部文本';

  @override
  String get cvMobShareText => '分享文本';

  @override
  String get cvMobDeleteText => '删除文本';

  @override
  String get cvMobCancelText => '取消文本任务';

  @override
  String get cvMobPhaseDownload => '正在下载语音模型';

  @override
  String get cvMobPhaseWav => '正在准备音频（16 kHz WAV）…';

  @override
  String get cvMobPhaseRunSpeech => '正在将语音转为文字…（耗时取决于文件长度）';

  @override
  String get cvMobPhaseRunOcr => '正在识别文字…';

  @override
  String cvMobTextsCount(int n) {
    return '$n 个文本';
  }

  @override
  String get cvMobNoTextsYet => '尚无文本。';

  @override
  String get cvMobSpeechModels => '语音模型';

  @override
  String get cvMobSpeechModelsNote =>
      '语音识别 (whisper.cpp) 在此设备上运行；模型在首次使用时下载，您可在此预先下载或删除。Medium 和 Large v3 Turbo 模型在移动端不可用。';

  @override
  String get cvMobTexts => '文本（语音 / OCR）';

  @override
  String get cvMobOcrSettingsNote =>
      '图片转文字通过 Google ML Kit 在设备上运行；支持拉丁字母（含土耳其语）、中文、日文、韩文和天城文。识别模型随应用提供，无需下载。';

  @override
  String get npMobDocumentsRoot => '文档';

  @override
  String get smMobFiles => '文件';
}
