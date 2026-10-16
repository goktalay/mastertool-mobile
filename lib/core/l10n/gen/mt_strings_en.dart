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

  @override
  String get smAppSearchPh => 'Search connections…  (Ctrl+F)';

  @override
  String get smAppNewConn => 'New connection';

  @override
  String smAppSplit(String n) {
    return 'Open split ($n)';
  }

  @override
  String get smAppSplitTitle =>
      'Open the selected connections split in one window';

  @override
  String get smAppSettings => 'Settings';

  @override
  String smAppStats(String c, String f) {
    return '$c connections · $f folders';
  }

  @override
  String get smAppWelcome => 'Welcome';

  @override
  String smAppResults(String q) {
    return 'Results for “$q”';
  }

  @override
  String get smAppAll => 'All connections';

  @override
  String get smAppWelcomeHint =>
      'Create your first SSH connection.<br>Enter the server details, test and save.';

  @override
  String get smAppFolders => 'Folders';

  @override
  String get smAppConnections => 'Connections';

  @override
  String get smAppMultiHint =>
      'Ctrl+click to select several and open them split in one window';

  @override
  String get smAppNoMatch => 'No matching connections.';

  @override
  String smAppFolderCount(String n) {
    return '$n connections';
  }

  @override
  String get smAppFolderOpenSplit => 'Open folder connections split';

  @override
  String get smAppNewConnHere => 'New connection in this folder';

  @override
  String get smAppNewSubfolder => 'Create subfolder';

  @override
  String get smAppKeyTag => 'Key';

  @override
  String get smAppLastDir => 'Last folder';

  @override
  String get smAppLastDirTag => 'last folder';

  @override
  String smAppMultiOpenSplit(String n) {
    return 'Open $n connections split in one window';
  }

  @override
  String get smAppOpenSeparate => 'Open each in its own window';

  @override
  String get smAppClearSelection => 'Clear selection';

  @override
  String get smAppSideBySide => 'Open two sessions side by side';

  @override
  String get smAppDuplicate => 'Duplicate';

  @override
  String get smAppMoveToFolder => 'Move to folder…';

  @override
  String get smAppResetLastDir => 'Reset last folder';

  @override
  String get smAppConnMoved => 'Connection moved';

  @override
  String get smAppFolderIntoSelf =>
      'A folder cannot be moved into its own subfolder';

  @override
  String get smAppFolderPh => 'e.g. Production servers';

  @override
  String get smAppRenameFolder => 'Rename folder';

  @override
  String get smAppDeleteFolder => 'Delete folder';

  @override
  String smAppDeleteFolderMsg(String name) {
    return 'The folder <b>$name</b> will be deleted.';
  }

  @override
  String smAppDeleteFolderConns(String n) {
    return ' Its $n connections are not deleted; they move up one level.';
  }

  @override
  String get smAppRootFolder => 'All connections (root)';

  @override
  String smAppMoveTitle(String name) {
    return 'Move “$name”';
  }

  @override
  String get smAppTargetFolder => 'Target folder';

  @override
  String get smAppDeleteConn => 'Delete connection';

  @override
  String smAppDeleteConnMsg(String name, String target) {
    return '<b>$name</b> ($target) will be permanently deleted.';
  }

  @override
  String get smAppMaxPanes => 'At most 6 panes can be opened';

  @override
  String get smAppMaxPanesSub => 'The first 6 connections were opened';

  @override
  String get smFormTitleNew => 'New SSH connection';

  @override
  String get smFormTitleEdit => 'Edit connection';

  @override
  String get smFormName => 'Connection name';

  @override
  String get smFormNamePh => 'e.g. Web server';

  @override
  String get smFormHost => 'IP address / Host';

  @override
  String get smFormHostPh => '192.168.1.10 or server.com';

  @override
  String get smFormPort => 'Port';

  @override
  String get smFormUser => 'Username';

  @override
  String get smFormAuth => 'Authentication';

  @override
  String get smFormPassword => 'Password';

  @override
  String get smFormPrivateKey => 'Private key';

  @override
  String get smFormPwSaved => '•••••••• (saved — type to change)';

  @override
  String get smFormKeyFile => 'Key file';

  @override
  String get smFormPassphrase => 'Key passphrase (if any)';

  @override
  String get smFormPassSaved => '•••••••• (saved)';

  @override
  String get smFormPassEmpty => 'Leave empty if none';

  @override
  String get smFormFolder => 'Folder';

  @override
  String get smFormColor => 'Color';

  @override
  String get smFormPalette => 'Console color palette';

  @override
  String get smFormLastDir => 'Go to the folder I left off in';

  @override
  String get smFormLastDirHint =>
      'On connect, the terminal and file manager open in the folder you last worked in.';

  @override
  String get smFormLastDirNow => 'Currently:';

  @override
  String get smFormConnecting => 'Connecting…';

  @override
  String get smFormTestOk => 'Connection successful';

  @override
  String smFormHostKey(String fp) {
    return 'Host key (SHA256): $fp';
  }

  @override
  String get smFormTestFail => 'Connection failed';

  @override
  String get smFormSaved => 'Connection saved';

  @override
  String get smFormChangesSaved => 'Changes saved';

  @override
  String get smFormTest => 'Test connection';

  @override
  String get smFormSaveConnect => 'Save and connect';

  @override
  String get smPaneToggleSidebar => 'Toggle side panel (Ctrl+B)';

  @override
  String get smPaneDefaultName => 'Connection';

  @override
  String get smPaneSplitRight => 'Split right';

  @override
  String get smPaneSplitDown => 'Split down';

  @override
  String get smPaneReconnect => 'Reconnect';

  @override
  String get smPaneClose => 'Close pane';

  @override
  String get smPaneSaveSelShortcut => 'Save selection as shortcut';

  @override
  String get smPanePaletteMenu => 'Console color palette…';

  @override
  String get smPaneSelectAll => 'Select all';

  @override
  String get smPaneClear => 'Clear screen';

  @override
  String get smPaneStatusConnecting => 'connecting…';

  @override
  String get smPaneStatusNoConn => 'not connected';

  @override
  String get smPaneStatusClosed => 'connection closed';

  @override
  String get smTermConnecting => 'Connecting…';

  @override
  String get smTermConnectFailed => 'Could not connect:';

  @override
  String get smTermRetryEnter => 'Press Enter to try again.';

  @override
  String get smTermClosed => 'Connection closed.';

  @override
  String get smTermReconnectEnter => 'Press Enter to reconnect.';

  @override
  String smTermMaxPanes(String n) {
    return 'At most $n panes can be opened in a window';
  }

  @override
  String smTermSessions(String n) {
    return '$n sessions';
  }

  @override
  String get smTermToggleAll => 'Toggle all side panels';

  @override
  String get smTermSplitRightTitle =>
      'Split the active pane right (Ctrl+Shift+E)';

  @override
  String get smTermSplitDownTitle =>
      'Split the active pane down (Ctrl+Shift+O)';

  @override
  String get smTermSyncOn => 'Typing to all panes';

  @override
  String get smTermSyncOff => 'Type to all panes';

  @override
  String get smTermSyncTitle => 'What you type is sent to all connected panes';

  @override
  String get smPickerSearch => 'Search connections…';

  @override
  String get smPickerSameServer => 'same server';

  @override
  String get smPickerNone => 'No matching connections';

  @override
  String get smPickerTitleRight => 'Split right — choose a connection';

  @override
  String get smPickerTitleDown => 'Split down — choose a connection';

  @override
  String get smPaletteTitle => 'Console color palette';

  @override
  String smPaletteHint(String name) {
    return 'The palette you pick is previewed in this pane right away. If you save it, all sessions of this connection ($name) use it.';
  }

  @override
  String get smPaletteSaved => 'Color palette saved';

  @override
  String get smScTitleNew => 'New shortcut';

  @override
  String get smScTitleEdit => 'Edit shortcut';

  @override
  String get smScName => 'Shortcut name';

  @override
  String get smScNamePh => 'e.g. Restart Nginx';

  @override
  String get smScCommand => 'Command';

  @override
  String get smScEnter => 'Press Enter after pasting';

  @override
  String get smScEnterHint =>
      'When off, the command is only typed at the cursor and you run it yourself.';

  @override
  String get smScEmpty =>
      'No shortcuts yet.<br>Add the commands you use often with <b>+</b> and double-click to paste them into the terminal.';

  @override
  String get smScItemTitle => 'Double-click: paste into this pane’s terminal';

  @override
  String get smScAutoEnter => 'Auto Enter';

  @override
  String get smScPaste => 'Paste into terminal';

  @override
  String get smScPasteNoEnter => 'Paste without Enter';

  @override
  String get smScPasteRun => 'Paste and run';

  @override
  String get smScCopy => 'Copy to clipboard';

  @override
  String get smScNew => 'New shortcut';

  @override
  String get smSbShortcuts => 'Shortcuts';

  @override
  String get smSbAddShortcut => 'Add shortcut';

  @override
  String get smSbServer => 'Server';

  @override
  String smSbServerHost(String host) {
    return 'Server · $host';
  }

  @override
  String get smSbFollow => 'Follow terminal folder';

  @override
  String get smSbHome => 'Home folder';

  @override
  String get smSbUp => 'Parent folder';

  @override
  String get smSbComputer => 'This PC';

  @override
  String get smSbPlaces => 'Drives and places';

  @override
  String get smSbResize => 'Drag to resize';

  @override
  String get smFmLoading => 'Loading…';

  @override
  String smFmOpenFailed(String msg) {
    return 'Could not open: $msg';
  }

  @override
  String get smFmEmpty => 'Folder is empty';

  @override
  String get smFmNoConn => 'Not connected.';

  @override
  String get smFmClosed => 'Connection closed.';

  @override
  String get smFmWaiting => 'Waiting for connection…';

  @override
  String smFmDownloadTo(String path) {
    return 'Download → $path';
  }

  @override
  String smFmUploadTo(String path) {
    return 'Upload → $path';
  }

  @override
  String get smFmServer => 'server';

  @override
  String get smFmCdHere => 'Go to this folder in terminal';

  @override
  String get smFmPastePath => 'Paste path into terminal';

  @override
  String smFmDeleteWhat(String what) {
    return 'Delete ($what)';
  }

  @override
  String smFmNItems(String n) {
    return '$n items';
  }

  @override
  String get smFmOpenDefault => 'Open with default app';

  @override
  String get smFmReveal => 'Show in Explorer';

  @override
  String get smFmOpenExplorer => 'Open in Explorer';

  @override
  String get smFmFollowing => 'File manager is following the terminal folder';

  @override
  String get smFmFollowOff => 'Following turned off';

  @override
  String get smFmNewRemote => 'New folder on server';

  @override
  String get smFmDeleteTitle => 'Delete from server';

  @override
  String smFmAndMore(String n) {
    return ' and $n more';
  }

  @override
  String smFmDeleteMsg(String names) {
    return '$names will be <b>permanently</b> deleted from the server. Folders are deleted with their contents.';
  }

  @override
  String get smPlaceDesktop => 'Desktop';

  @override
  String get smPlaceDownloads => 'Downloads';

  @override
  String get smPlaceDocuments => 'Documents';

  @override
  String get smPlaceHome => 'User folder';

  @override
  String smPlaceDrive(String d) {
    return 'Local Disk ($d)';
  }

  @override
  String get smErrNoConn => 'Not connected';

  @override
  String get smErrConnectFirst => 'Connect to the server first';

  @override
  String get smErrMkdir => 'Could not create folder';

  @override
  String get smErrRename => 'Could not rename';

  @override
  String smErrDelete(String name) {
    return 'Could not delete: $name';
  }

  @override
  String get smTrPanelTitle => 'Transfers';

  @override
  String get smTrClearDone => 'Clear finished';

  @override
  String get smTrQueued => 'Queued';

  @override
  String get smTrScanning => 'Scanning files…';

  @override
  String smTrFileCount(String i, String n) {
    return '$i / $n files';
  }

  @override
  String smTrEta(String time) {
    return '~$time left';
  }

  @override
  String smTrDownloading(String name) {
    return 'Downloading: $name';
  }

  @override
  String smTrUploading(String name) {
    return 'Uploading: $name';
  }

  @override
  String get smTrDone => 'Completed';

  @override
  String get smTrCancelled => 'Cancelled';

  @override
  String get smTrFailed => 'Failed';

  @override
  String get smTrRemoveFromList => 'Remove from list';

  @override
  String get smTrAlwaysBackground =>
      'Always show large transfers in the background from now on';

  @override
  String get smTrShowInBackground => 'Run in background';

  @override
  String get smTrDownloadDone => 'Download complete';

  @override
  String get smTrUploadDone => 'Upload complete';

  @override
  String smTrDownloadFailed(String name) {
    return 'Download failed: $name';
  }

  @override
  String smTrUploadFailed(String name) {
    return 'Upload failed: $name';
  }

  @override
  String get smTrCancelledToast => 'Transfer cancelled';

  @override
  String smTimeHm(String h, String m) {
    return '$h h $m min';
  }

  @override
  String smTimeMs(String m, String s) {
    return '$m min $s s';
  }

  @override
  String smTimeS(String s) {
    return '$s s';
  }

  @override
  String get smMainErrAuth =>
      'Authentication failed: wrong username or password.';

  @override
  String get smMainErrRefused =>
      'Connection refused: the port is closed or the SSH service is not running.';

  @override
  String get smMainErrTimeout => 'Timed out: the server could not be reached.';

  @override
  String get smMainErrDns => 'The host name could not be resolved (DNS).';

  @override
  String get smMainErrUnreach => 'The server is unreachable over the network.';

  @override
  String get smMainErrKeyFile => 'Key file not found.';

  @override
  String smMainErrHostKey(String newFp, String oldFp) {
    return 'The server host key has changed! Saved: $oldFp, received: $newFp. The connection was refused for security.';
  }

  @override
  String get smMainErrConnNotFound => 'Connection not found';

  @override
  String get smMainErrNoSession => 'No active SSH session';

  @override
  String get smMainErrHostUser => 'Server address and username are required.';

  @override
  String get smMainTrayShow => 'Show SSH Master';

  @override
  String get smMainTrayQuick => 'Quick connect';

  @override
  String get smMainTrayNone => 'No saved connections';

  @override
  String get smMainTrayQuit => 'Quit';

  @override
  String get smMainBalloonTitle => 'SSH Master is running in the background';

  @override
  String get smMainBalloonBody => 'Click the tray icon to open it again.';

  @override
  String get smMainPickKey => 'Choose a private key file';

  @override
  String get smMainCopySuffix => ' (copy)';

  @override
  String get smMainDefDisk => 'Disk usage';

  @override
  String get smMainDefMem => 'Memory';

  @override
  String get smMainDefTop => 'Processes (top)';

  @override
  String get smAppNotesLabel => 'Notes';

  @override
  String get fmAppSearchPh => 'Search sites…  (Ctrl+F)';

  @override
  String get fmAppNewConn => 'New site';

  @override
  String get fmAppSettings => 'Settings';

  @override
  String fmAppStats(String c, String f) {
    return '$c sites · $f folders';
  }

  @override
  String get fmAppWelcome => 'Welcome';

  @override
  String fmAppResults(String q) {
    return 'Results for “$q”';
  }

  @override
  String get fmAppAll => 'All sites';

  @override
  String get fmAppWelcomeHint =>
      'Create your first FTP / SFTP site.<br>Enter the server details, test the connection and save.';

  @override
  String get fmAppFolders => 'Folders';

  @override
  String get fmAppConnections => 'Sites';

  @override
  String get fmAppDblHint => 'Double-click a card to connect';

  @override
  String get fmAppNoMatch => 'No matching sites.';

  @override
  String fmAppFolderCount(String n) {
    return '$n sites';
  }

  @override
  String get fmAppNewConnHere => 'New site in this folder';

  @override
  String get fmAppNewSubfolder => 'New subfolder';

  @override
  String get fmAppKeyTag => 'Key';

  @override
  String get fmAppLastDir => 'Last folder';

  @override
  String get fmAppLastDirTag => 'last folder';

  @override
  String get fmAppDuplicate => 'Duplicate';

  @override
  String get fmAppMoveToFolder => 'Move to folder…';

  @override
  String get fmAppResetLastDir => 'Reset last folder';

  @override
  String get fmAppConnMoved => 'Site moved';

  @override
  String get fmAppFolderIntoSelf => 'A folder cannot be moved into itself';

  @override
  String get fmAppFolderPh => 'e.g. Customers';

  @override
  String get fmAppRenameFolder => 'Rename folder';

  @override
  String get fmAppDeleteFolder => 'Delete folder';

  @override
  String fmAppDeleteFolderMsg(String name) {
    return 'Delete the folder <b>$name</b>?';
  }

  @override
  String fmAppDeleteFolderConns(String n) {
    return '<br>Its $n sites will be moved to the parent folder.';
  }

  @override
  String get fmAppRootFolder => 'Top level (no folder)';

  @override
  String fmAppMoveTitle(String name) {
    return 'Move “$name”';
  }

  @override
  String get fmAppTargetFolder => 'Target folder';

  @override
  String get fmAppDeleteConn => 'Delete site';

  @override
  String fmAppDeleteConnMsg(String name, String target) {
    return 'Delete the site <b>$name</b> ($target)?';
  }

  @override
  String get fmFormTitleNew => 'New site';

  @override
  String fmFormTitleEdit(String name) {
    return 'Site properties: $name';
  }

  @override
  String get fmFormTabGeneral => 'General';

  @override
  String get fmFormTabActions => 'Actions';

  @override
  String get fmFormTabType => 'Type';

  @override
  String get fmFormTabOptions => 'Options';

  @override
  String get fmFormName => 'Label';

  @override
  String get fmFormNamePh => 'e.g. Company website';

  @override
  String get fmFormHost => 'Host address';

  @override
  String get fmFormHostPh => 'ftp.example.com or 192.168.1.10';

  @override
  String get fmFormPort => 'Port';

  @override
  String get fmFormUser => 'Username';

  @override
  String get fmFormPassword => 'Password';

  @override
  String get fmFormPwSaved => '•••••••• (saved, type to change)';

  @override
  String get fmFormLoginMethod => 'Login method';

  @override
  String get fmFormLoginNormal => 'Normal';

  @override
  String get fmFormLoginAnon => 'Anonymous';

  @override
  String get fmFormAuth => 'SFTP authentication';

  @override
  String get fmFormPrivateKey => 'Private key';

  @override
  String get fmFormKeyFile => 'Private key file';

  @override
  String get fmFormPassphrase => 'Key passphrase';

  @override
  String get fmFormPassSaved => '(saved)';

  @override
  String get fmFormPassEmpty => 'Leave empty if none';

  @override
  String get fmFormFolder => 'Folder';

  @override
  String get fmFormColor => 'Color';

  @override
  String get fmFormComments => 'Comments';

  @override
  String get fmFormRemoteDir => 'When connected, switch to this remote folder';

  @override
  String get fmFormLocalDir => 'When connected, switch to this local folder';

  @override
  String get fmFormLocalDirPh => 'e.g. C:\\Projects\\site';

  @override
  String get fmFormLastDir => 'Go to the folder where I left off';

  @override
  String get fmFormLastDirHint =>
      'When on, the site opens in the server and computer folders you last worked in (instead of the folders above).';

  @override
  String get fmFormLastDirNow => 'Now:';

  @override
  String get fmFormCache => 'Caching for navigation';

  @override
  String get fmFormCacheSession => 'Use cache during session';

  @override
  String get fmFormCacheAlways => 'Always use cache (while the app is open)';

  @override
  String get fmFormCacheNever => 'Never use cache (always list again)';

  @override
  String get fmFormUploadCase =>
      'When uploading, apply this rule to file and folder names';

  @override
  String get fmFormCasePreserve => 'Preserve case';

  @override
  String get fmFormCaseLower => 'Lowercase';

  @override
  String get fmFormCaseUpper => 'Uppercase';

  @override
  String get fmFormTest => 'Test connection';

  @override
  String get fmFormSaveConnect => 'Save and connect';

  @override
  String get fmFormConnecting => 'Connecting…';

  @override
  String get fmFormTestOk => 'Connection successful';

  @override
  String get fmFormTestFail => 'Could not connect';

  @override
  String fmFormHomeDir(String dir) {
    return 'Start folder: $dir';
  }

  @override
  String get fmFormRemoteDirMissing =>
      'Warning: the remote folder could not be opened.';

  @override
  String fmFormHostKey(String fp) {
    return 'SSH host key (SHA256): $fp';
  }

  @override
  String get fmFormSaved => 'Site saved';

  @override
  String get fmFormChangesSaved => 'Changes saved';

  @override
  String get fmTypeProtocol => 'Protocol';

  @override
  String get fmTypeFtp => 'FTP (standard File Transfer Protocol)';

  @override
  String get fmTypeFtpsImplicit => 'FTP with TLS/SSL (Implicit, port 990)';

  @override
  String get fmTypeFtpsSsl => 'FTP with SSL (AUTH SSL, Explicit)';

  @override
  String get fmTypeFtpsTls => 'FTP with TLS/SSL (AUTH TLS, Explicit)';

  @override
  String get fmTypeSftp => 'SFTP using SSH2 (Secure Shell)';

  @override
  String get fmTypeNoteFtp =>
      'Uses the industry standard FTP protocol for both command and data connections in a non-secure (plain-text) fashion.';

  @override
  String get fmTypeNoteFtpsImplicit =>
      'The connection is encrypted with TLS/SSL from the start (usually port 990). Commands and data are protected.';

  @override
  String get fmTypeNoteFtpsSsl =>
      'Connects with plain FTP and switches to an encrypted session with AUTH SSL. Commands and data are protected.';

  @override
  String get fmTypeNoteFtpsTls =>
      'Connects with plain FTP and switches to an encrypted session with AUTH TLS (the most common FTPS type).';

  @override
  String get fmTypeNoteSftp =>
      'Encrypted file transfer over SSH (port 22). Log in with a password or private key; the host key is saved on first connect.';

  @override
  String get fmTypeTransferType => 'Transfer type';

  @override
  String get fmTypeBinary => 'Binary';

  @override
  String get fmTypeAscii => 'ASCII (text)';

  @override
  String get fmTypeAuto => 'Auto (text files as ASCII)';

  @override
  String fmTypeUseGlobal(String v) {
    return 'Use global setting ($v)';
  }

  @override
  String get fmTypeDataConn => 'Data connection';

  @override
  String get fmTypePassive => 'Passive (PASV / EPSV)';

  @override
  String get fmTypeTimezone => 'Server time zone offset';

  @override
  String get fmTypeTzNone => 'No offset';

  @override
  String get fmTypeTzHours => 'hours';

  @override
  String get fmTypeTimezoneHint =>
      'File times listed by the server are shifted by this amount.';

  @override
  String get fmOptSiteOptions => 'Site specific options';

  @override
  String get fmOptUseGlobal => 'Use global settings for all options';

  @override
  String get fmOptCustom => 'Use settings specific to this site';

  @override
  String get fmOptRetry => 'Retry attempts';

  @override
  String get fmOptRetryDelay => 'Delay between retries (s)';

  @override
  String get fmOptMaxConcurrent => 'Max concurrent transfers';

  @override
  String get fmOptConflict => 'If a file with the same name exists';

  @override
  String get fmOptConflictOverwrite => 'Overwrite';

  @override
  String get fmOptConflictRename => 'Auto-rename (name (1).ext)';

  @override
  String get fmOptConflictSkip => 'Skip';

  @override
  String get fmOptEncoding => 'Filename encoding';

  @override
  String get fmOptEncAuto => 'Auto';

  @override
  String get fmSiteLocal => 'My computer';

  @override
  String get fmSiteRemote => 'Server';

  @override
  String get fmSiteTransfers => 'Transfers';

  @override
  String get fmSiteToggleLocal => 'Show/hide My computer (Ctrl+B)';

  @override
  String get fmSiteToggleTransfers => 'Show/hide Transfers (Ctrl+J)';

  @override
  String get fmSiteReconnect => 'Reconnect';

  @override
  String get fmSitePlaces => 'Quick access and drives';

  @override
  String get fmSiteUp => 'Parent folder (Backspace)';

  @override
  String get fmSiteHome => 'Start folder';

  @override
  String get fmSiteColName => 'Name';

  @override
  String get fmSiteColSize => 'Size';

  @override
  String get fmSiteColDate => 'Modified';

  @override
  String get fmSiteLoading => 'Loading…';

  @override
  String get fmSiteEmptyDir => 'This folder is empty';

  @override
  String get fmSiteDesktop => 'Desktop';

  @override
  String get fmSiteDownloads => 'Downloads';

  @override
  String get fmSiteDocuments => 'Documents';

  @override
  String get fmSiteHomeDir => 'User folder';

  @override
  String get fmSiteOpenExplorer => 'Open in Explorer';

  @override
  String get fmSiteOpenFile => 'Open with default app';

  @override
  String get fmSiteShowExplorer => 'Show in Explorer';

  @override
  String get fmSiteUpload => 'Upload';

  @override
  String fmSiteUploadN(String n) {
    return 'Upload $n items';
  }

  @override
  String fmSiteUploadTo(String dir) {
    return 'Target: $dir';
  }

  @override
  String get fmSiteDownload => 'Download';

  @override
  String fmSiteDownloadN(String n) {
    return 'Download $n items';
  }

  @override
  String fmSiteDownloadTo(String dir) {
    return 'Target: $dir';
  }

  @override
  String get fmSiteTrash => 'Move to Recycle Bin';

  @override
  String get fmSiteTrashOk => 'Move';

  @override
  String fmSiteTrashOne(String name) {
    return 'Move <b>$name</b> to the Recycle Bin?';
  }

  @override
  String fmSiteTrashMany(String n) {
    return 'Move $n items to the Recycle Bin?';
  }

  @override
  String get fmSiteMkdirFail => 'Could not create folder';

  @override
  String get fmSiteRenameFail => 'Could not rename';

  @override
  String get fmSiteDeleteFail => 'Could not delete';

  @override
  String get fmSiteDeleteTitle => 'Delete from server';

  @override
  String fmSiteDelOne(String name) {
    return 'Permanently delete the file <b>$name</b> from the server?';
  }

  @override
  String fmSiteDelDirOne(String name) {
    return 'Permanently delete the folder <b>$name</b> and everything in it from the server?';
  }

  @override
  String fmSiteDelMany(String n) {
    return 'Permanently delete $n items (folders with all their contents) from the server?';
  }

  @override
  String get fmSiteDeleting => 'Deleting…';

  @override
  String get fmSiteDeleted => 'Deleted';

  @override
  String fmSiteItems(String n) {
    return '$n items';
  }

  @override
  String get fmSiteOffline => 'Not connected';

  @override
  String fmSiteLimit(String v) {
    return 'Speed limit: $v';
  }

  @override
  String get fmSiteNoLimit => 'No speed limit';

  @override
  String get fmSiteLimitTitle => 'Set speed limit';

  @override
  String fmSiteConnectFail(String msg) {
    return 'Could not connect to the server: $msg';
  }

  @override
  String get fmSiteConnectFailTitle => 'Connection failed';

  @override
  String get fmSiteStateConnected => 'Connected';

  @override
  String get fmSiteStateConnecting => 'Connecting…';

  @override
  String get fmSiteStateDisconnected => 'Disconnected';

  @override
  String get fmTrColName => 'Name';

  @override
  String get fmTrColSize => 'Size';

  @override
  String get fmTrColProgress => 'Progress';

  @override
  String get fmTrColStatus => 'Status';

  @override
  String get fmTrEmpty =>
      'No transfers yet.\nRight-click a file or folder and choose Download / Upload, or drag between the panels.';

  @override
  String get fmTrQueued => 'Queued';

  @override
  String get fmTrActive => 'Transferring';

  @override
  String get fmTrDone => 'Finished';

  @override
  String fmTrDoneFiles(String n) {
    return '$n files finished';
  }

  @override
  String get fmTrError => 'Error';

  @override
  String get fmTrCancelled => 'Cancelled';

  @override
  String get fmTrSkipped => 'Skipped (exists)';

  @override
  String fmTrScanning(String n) {
    return 'Scanning… $n files';
  }

  @override
  String get fmTrRetrying => 'Will retry…';

  @override
  String get fmTrCancel => 'Cancel';

  @override
  String get fmTrCancelDir => 'Cancel folder transfer';

  @override
  String get fmTrCancelAll => 'Cancel all transfers';

  @override
  String get fmTrCancelAllMsg => 'Cancel all running and queued transfers?';

  @override
  String get fmTrCancelAllOk => 'Cancel all';

  @override
  String get fmTrRetry => 'Retry';

  @override
  String get fmTrShowLocal => 'Show in Explorer';

  @override
  String get fmTrShowRemote => 'Show on server';

  @override
  String get fmTrCopyError => 'Copy error message';

  @override
  String get fmTrRemove => 'Remove from list';

  @override
  String get fmTrRemoveRoot => 'Remove this transfer from list';

  @override
  String get fmTrClearDone => 'Clear finished';

  @override
  String fmTrActiveN(String n) {
    return '$n transfers running';
  }

  @override
  String get fmTrDownloadDone => 'Download finished';

  @override
  String get fmTrUploadDone => 'Upload finished';

  @override
  String fmTrDownloadFailed(String name) {
    return 'Download incomplete: $name';
  }

  @override
  String fmTrUploadFailed(String name) {
    return 'Upload incomplete: $name';
  }

  @override
  String fmTrFailedFiles(String n) {
    return '$n files failed';
  }

  @override
  String get fmMainErrAuth => 'Login failed: wrong username or password.';

  @override
  String get fmMainErrRefused =>
      'Connection refused: the port is closed or the server is not running.';

  @override
  String get fmMainErrTimeout => 'Timed out: the server could not be reached.';

  @override
  String get fmMainErrDns => 'Could not resolve the host name (DNS).';

  @override
  String get fmMainErrUnreach => 'The server is unreachable on the network.';

  @override
  String get fmMainErrReset => 'The server closed the connection.';

  @override
  String get fmMainErrNotFound => 'File or folder not found.';

  @override
  String get fmMainErrPerm => 'Permission denied.';

  @override
  String fmMainErr550(String msg) {
    return 'The server refused the operation (550): $msg';
  }

  @override
  String get fmMainErr553 => 'The server did not accept the file name (553).';

  @override
  String fmMainErrTls(String msg) {
    return 'TLS/SSL error — check the protocol or port. ($msg)';
  }

  @override
  String fmMainErrHostKey(String newVal, String oldVal) {
    return 'The server host key has changed! Saved: $oldVal, received: $newVal. The connection was refused for security.';
  }

  @override
  String get fmMainErrConnNotFound => 'Site not found';

  @override
  String get fmMainErrNoSession => 'Not connected to the server';

  @override
  String get fmMainErrHost => 'Host address is required.';

  @override
  String get fmMainErrUser =>
      'Username is required (or choose Anonymous login).';

  @override
  String get fmMainPickKey => 'Choose a private key file';

  @override
  String get fmMainCopySuffix => ' (copy)';

  @override
  String get fmMainCloseActive =>
      'Transfers are still running. They will be cancelled if you close this window.';

  @override
  String get fmMainCloseAnyway => 'Close anyway';
}
