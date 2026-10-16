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
}
