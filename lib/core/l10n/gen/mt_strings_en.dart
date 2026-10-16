// ignore: unused_import
import 'package:intl/intl.dart' as intl;

import 'mt_strings.dart';

// ignore_for_file: type=lint

/// The translations for English (`en`).
class MtStringsEn extends MtStrings {
  MtStringsEn([String locale = 'en']) : super(locale);

  @override
  String get setGeneral => 'General';

  @override
  String get setAccount => 'Account';

  @override
  String get setAbout => 'About';

  @override
  String aboutVersion(String version) {
    return 'Version $version';
  }

  @override
  String get aboutFamily =>
      'Part of the Mastertool family: SSH Master · FTP Masters · SQL Master · Notepad Master · Convert Master · IP Tools';

  @override
  String get aboutCheckUpdate => 'Check for updates';

  @override
  String get aboutChecking => 'Checking…';

  @override
  String aboutUpToDate(String app) {
    return '$app is up to date.';
  }

  @override
  String aboutCheckFailed(String msg) {
    return 'Could not check for updates: $msg';
  }

  @override
  String get aboutLicenses => 'Open-source licenses';

  @override
  String aboutLicensesIntro(String app) {
    return '$app uses the following open-source components:';
  }

  @override
  String authErrAppDisabled(String app) {
    return '$app has been disabled for this account by an administrator. Contact your account administrator.';
  }

  @override
  String authErrWrongApp(String app) {
    return 'This session belongs to another application. Please sign in to $app again.';
  }

  @override
  String get authSignedOut =>
      'You signed out in a Mastertool app on this computer. Please sign in again.';

  @override
  String get authSubtitle => 'Sign in with your account';

  @override
  String get authEmail => 'Email';

  @override
  String get authPassword => 'Password';

  @override
  String get authRemember => 'Remember me';

  @override
  String get authForgot => 'Forgot password';

  @override
  String get authNoAccount => 'No account yet?';

  @override
  String get authRegister => 'Create account';

  @override
  String get authSubmit => 'Sign in';

  @override
  String get authWorking => 'Signing in…';

  @override
  String get authErrRequired => 'Email and password are required.';

  @override
  String get authErrBadCredentials => 'Wrong email or password.';

  @override
  String get authErrUnverified =>
      'Your email address is not verified yet. Click the link in your inbox.';

  @override
  String get authErrSuspended => 'Your account is suspended.';

  @override
  String get authErrRateLimited => 'Too many attempts. Try again in a minute.';

  @override
  String get authErrOffline =>
      'Cannot reach the server. Check your internet connection.';

  @override
  String get authErrSessionExpired =>
      'Your session expired or your password changed. Please sign in again.';

  @override
  String authErrServer(String msg) {
    return 'Could not sign in: $msg';
  }

  @override
  String get acctSection => 'Account and sync';

  @override
  String acctSignedInAs(String email) {
    return 'Signed in as $email';
  }

  @override
  String get acctSyncToggle => 'Sync connections with the web';

  @override
  String get acctSyncHint =>
      'Connections, folders and shortcuts are backed up to your account with end-to-end encryption; the server cannot read them. Device settings such as font size and tray are not sent.';

  @override
  String acctLastSync(String time) {
    return 'Last sync: $time';
  }

  @override
  String get acctNever => 'Not synced yet';

  @override
  String get acctSyncNow => 'Sync now';

  @override
  String get acctDeleteRemote => 'Delete server copy';

  @override
  String get acctDeleteRemoteMsg =>
      'The encrypted library copy in your account will be deleted and sync will be turned off. Connections on this computer are not deleted.';

  @override
  String get acctDeleteRemoteDone => 'Server copy deleted; sync turned off';

  @override
  String get acctLogout => 'Sign out';

  @override
  String get acctLogoutMsg =>
      'You will be signed out. Connections and projects on this device are kept.';

  @override
  String get acctMyAccount => 'My account (web)';

  @override
  String get acctBackupNotice =>
      'Signed in with a different account; the previous connections on this computer were backed up.';

  @override
  String get syncOff => 'Sync is off';

  @override
  String get syncSyncing => 'Syncing…';

  @override
  String get syncOffline =>
      'Offline — changes will be sent when you are back online';

  @override
  String get syncErrDecrypt =>
      'The server copy could not be decrypted with this account’s key; the connections on this computer are kept.';

  @override
  String get syncErrTooLarge =>
      'The library exceeds the 5 MB limit and could not be synced.';

  @override
  String syncError(String msg) {
    return 'Sync error: $msg';
  }

  @override
  String get commonCancel => 'Cancel';

  @override
  String get commonSave => 'Save';

  @override
  String get commonCreate => 'Create';

  @override
  String get commonOk => 'OK';

  @override
  String get commonDelete => 'Delete';

  @override
  String get commonGiveUp => 'Cancel';

  @override
  String get commonOpen => 'Open';

  @override
  String get commonEdit => 'Edit';

  @override
  String get commonRename => 'Rename';

  @override
  String get commonRefresh => 'Refresh';

  @override
  String get commonNewFolder => 'New folder';

  @override
  String get commonCopyPath => 'Copy path';

  @override
  String get commonMove => 'Move';

  @override
  String get commonMoveEllipsis => 'Move…';

  @override
  String get commonShow => 'Show';

  @override
  String get commonChoose => 'Browse…';

  @override
  String get commonConnect => 'Connect';

  @override
  String get commonNew => 'New';

  @override
  String get commonCopy => 'Copy';

  @override
  String get commonPaste => 'Paste';

  @override
  String commonLocation(String path) {
    return 'Location: $path';
  }

  @override
  String get commonNewName => 'New name';

  @override
  String get commonFolderName => 'Folder name';

  @override
  String get setTitle => 'Settings';

  @override
  String get setAppearance => 'Appearance';

  @override
  String get setTheme => 'Theme';

  @override
  String get setThemeDark => 'Night';

  @override
  String get setThemeLight => 'Day';

  @override
  String get setThemeSystem => 'System preference';

  @override
  String get setLanguage => 'Language';

  @override
  String get setLanguageHint => 'The language is applied immediately.';

  @override
  String get setSaved => 'Settings saved';

  @override
  String get mobModules => 'Modules';

  @override
  String get mobDisabled => 'Disabled on your account';

  @override
  String get mobSoon => 'This module is coming soon';

  @override
  String get mobOpen => 'Open';

  @override
  String get mobRefresh => 'Refresh';

  @override
  String get mobSettings => 'Settings';

  @override
  String mobWelcome(String name) {
    return 'Welcome, $name';
  }

  @override
  String get mobNoModules =>
      'Could not load modules. Check your connection and refresh.';

  @override
  String get mobSite => 'mastertool.download';

  @override
  String get mobLangSystem => 'System language';

  @override
  String get mobSsoHint =>
      'Sign in once: SSH Master, FTP Masters, SQL Master, Notepad Master, Convert Master and IP Tools open inside this app.';

  @override
  String mobOpenCount(String open, String total) {
    return '$open/$total modules enabled';
  }

  @override
  String get mobModulesHint => 'Tap to open';

  @override
  String get mobTapToOpen => 'Ready to use';

  @override
  String get mobVisitSite => 'Visit website';
}
