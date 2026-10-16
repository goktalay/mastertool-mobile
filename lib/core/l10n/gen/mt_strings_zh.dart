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
}
