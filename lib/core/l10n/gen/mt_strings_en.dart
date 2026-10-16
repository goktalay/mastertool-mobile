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

  @override
  String get sqAppSearchPh => 'Search connections…  (Ctrl+F)';

  @override
  String get sqAppNewConn => 'Add connection';

  @override
  String get sqAppAddConn => 'Add connection';

  @override
  String get sqAppSettings => 'Settings';

  @override
  String sqAppStats(String c, String f) {
    return '$c connections · $f folders';
  }

  @override
  String get sqAppWelcome => 'Welcome';

  @override
  String sqAppResults(String q) {
    return 'Results for “$q”';
  }

  @override
  String get sqAppAll => 'All connections';

  @override
  String get sqAppWelcomeHint =>
      'Connect to PostgreSQL, SQL Server, MySQL, SQLite or CSV/Parquet/Excel files.<br>Enter the details, test the connection and save.';

  @override
  String get sqAppFolders => 'Folders';

  @override
  String get sqAppConnections => 'Connections';

  @override
  String get sqAppDblHint => 'Double-click a card to open';

  @override
  String get sqAppNoMatch => 'No matching connections.';

  @override
  String sqAppFolderCount(String n) {
    return '$n connections';
  }

  @override
  String get sqAppNewConnHere => 'New connection in this folder';

  @override
  String get sqAppNewSubfolder => 'New subfolder';

  @override
  String get sqAppDuplicate => 'Duplicate';

  @override
  String get sqAppMoveToFolder => 'Move to folder…';

  @override
  String get sqAppConnMoved => 'Connection moved';

  @override
  String get sqAppFolderIntoSelf => 'A folder cannot be moved into itself';

  @override
  String get sqAppFolderPh => 'e.g. Customers';

  @override
  String get sqAppRenameFolder => 'Rename folder';

  @override
  String get sqAppDeleteFolder => 'Delete folder';

  @override
  String sqAppDeleteFolderMsg(String name) {
    return 'Delete folder <b>$name</b>?';
  }

  @override
  String sqAppDeleteFolderConns(String n) {
    return '<br>Its $n connections will move to the parent folder.';
  }

  @override
  String get sqAppRootFolder => 'Top level (no folder)';

  @override
  String sqAppMoveTitle(String name) {
    return 'Move “$name”';
  }

  @override
  String get sqAppTargetFolder => 'Target folder';

  @override
  String get sqAppDeleteConn => 'Delete connection';

  @override
  String sqAppDeleteConnMsg(String name, String target) {
    return 'Delete connection <b>$name</b> ($target)? Its saved password is removed too.';
  }

  @override
  String get sqAppReadOnlyTag => 'Read-only';

  @override
  String get sqAppWriteTag => 'Writable';

  @override
  String get sqFormTitleNew => 'New connection';

  @override
  String sqFormTitleEdit(String name) {
    return 'Connection: $name';
  }

  @override
  String get sqFormTabGeneral => 'General';

  @override
  String get sqFormTabSecurity => 'Security';

  @override
  String get sqFormTabSsh => 'SSH tunnel';

  @override
  String get sqFormName => 'Label (display name)';

  @override
  String get sqFormNamePh => 'e.g. Production database';

  @override
  String get sqFormHost => 'Host';

  @override
  String get sqFormPort => 'Port';

  @override
  String get sqFormUser => 'User name';

  @override
  String get sqFormPassword => 'Password';

  @override
  String get sqFormPwSaved => '•••••••• (saved, type to change)';

  @override
  String get sqFormDatabase => 'Database';

  @override
  String get sqFormDatabasePh => 'Leave empty for the default database';

  @override
  String get sqFormFile => 'Database file';

  @override
  String get sqFormFilePh => 'C:\\Data\\app.db';

  @override
  String get sqFormSqliteHint =>
      'SQLite database file (.db, .sqlite). In read-only mode the file is never modified.';

  @override
  String get sqFormDuckdbHint =>
      'Choose a .duckdb file or leave empty (in-memory). Query CSV, Parquet, JSON and Excel files directly: SELECT * FROM \'C:\\data\\sales.csv\'';

  @override
  String get sqFormInMemory => 'In-memory';

  @override
  String get sqFormFolder => 'Folder';

  @override
  String get sqFormColor => 'Color';

  @override
  String get sqFormComments => 'Notes';

  @override
  String get sqFormReadOnly => 'Read-only mode';

  @override
  String get sqFormReadOnlyHint =>
      'Recommended. INSERT/UPDATE/DELETE and DDL are blocked before execution; you can approve them once. Where supported, the session itself is read-only too.';

  @override
  String get sqFormSavePassword => 'Save password';

  @override
  String get sqFormSavePasswordHint =>
      'The password is stored only in the OS keychain (Windows: DPAPI). When off, you are asked on every connect.';

  @override
  String get sqFormSsl => 'TLS / SSL';

  @override
  String get sqFormSslPrefer => 'Prefer (encrypted if the server supports it)';

  @override
  String get sqFormSslRequire => 'Require (certificate not verified)';

  @override
  String get sqFormSslVerify => 'Require + verify certificate';

  @override
  String get sqFormSslDisable => 'Off (unencrypted)';

  @override
  String get sqFormSslHint =>
      'TLS is tried by default; the connection window warns if the server does not support it.';

  @override
  String get sqFormSshEnable => 'Connect through an SSH tunnel';

  @override
  String get sqFormSshHint =>
      'The database is reached through an SSH server first. Key authentication is recommended.';

  @override
  String get sqFormSshHost => 'SSH server';

  @override
  String get sqFormSshAuth => 'SSH authentication';

  @override
  String get sqFormSshKey => 'Private key';

  @override
  String get sqFormSshAgent => 'Agent (Pageant)';

  @override
  String get sqFormKeyFile => 'Private key file';

  @override
  String get sqFormPassphrase => 'Key passphrase';

  @override
  String get sqFormPassSaved => '(saved)';

  @override
  String get sqFormPassEmpty => 'Leave empty if none';

  @override
  String get sqFormSshPassword => 'SSH password';

  @override
  String sqFormHostKey(String fp) {
    return 'SSH host key: $fp';
  }

  @override
  String get sqFormTest => 'Test connection';

  @override
  String get sqFormSaveConnect => 'Save and open';

  @override
  String get sqFormConnecting => 'Connecting…';

  @override
  String get sqFormTestOk => 'Connection successful';

  @override
  String get sqFormTestFail => 'Could not connect';

  @override
  String sqFormTestDb(String db, String user) {
    return 'Database: $db · User: $user';
  }

  @override
  String get sqFormNoTls =>
      'Warning: the connection is unencrypted (server does not support TLS).';

  @override
  String get sqFormSaved => 'Connection saved';

  @override
  String get sqFormChangesSaved => 'Changes saved';

  @override
  String get sqCwObjects => 'Objects';

  @override
  String get sqCwCollapseAll => 'Collapse all';

  @override
  String get sqCwFilterPh => 'Filter loaded objects…';

  @override
  String get sqCwEmpty => '(empty)';

  @override
  String get sqCwOpenData => 'Open data';

  @override
  String get sqCwShowDdl => 'Show DDL';

  @override
  String get sqCwOpenCode => 'Open code';

  @override
  String get sqCwSelectSql => 'Generate SELECT';

  @override
  String get sqCwAddToBuilder => 'Add to query builder';

  @override
  String get sqCwNewSqlHere => 'New SQL here';

  @override
  String get sqCwCopyName => 'Copy name';

  @override
  String get sqCwCopied => 'Copied to clipboard';

  @override
  String get sqCwNewSql => 'New SQL';

  @override
  String get sqCwBuilder => 'Query builder';

  @override
  String get sqCwReconnect => 'Reconnect';

  @override
  String get sqCwReadOnly => 'Read-only';

  @override
  String get sqCwReadWrite => 'Writes on';

  @override
  String get sqCwReadOnlyTip =>
      'Read-only: DML/DDL needs approval. Click to turn off';

  @override
  String get sqCwReadWriteTip =>
      'Writes on: commands run without approval. Click to go back to read-only';

  @override
  String get sqCwDisableRo => 'Turn off read-only mode?';

  @override
  String get sqCwDisableRoMsg =>
      'Until this window closes, INSERT/UPDATE/DELETE and DDL will run without asking.';

  @override
  String get sqCwDisableRoOk => 'Allow writes';

  @override
  String get sqCwRoOn => 'Read-only mode on';

  @override
  String get sqCwRoOff => 'Writes allowed — be careful';

  @override
  String get sqCwPasswordTitle => 'Password required';

  @override
  String sqCwPasswordFor(String host, String user) {
    return 'Password for $user@$host';
  }

  @override
  String get sqCwNotConnected => 'Not connected';

  @override
  String get sqCwConnected => 'Connected';

  @override
  String get sqCwConnecting => 'Connecting…';

  @override
  String get sqCwNoTls => 'Unencrypted';

  @override
  String get sqCwConnectFailed => 'Could not connect';

  @override
  String get sqCwRetry => 'Retry';

  @override
  String get sqCwResetCancel =>
      'The query did not respond to cancel; reconnecting.';

  @override
  String get sqCwResetExit => 'The database connection dropped; reconnecting.';

  @override
  String get sqCwEmptyWorkspace =>
      'Double-click a table in the tree or press Ctrl+T for a new SQL tab.';

  @override
  String get sqCwCloseTab => 'Close tab?';

  @override
  String sqCwCloseTabMsg(String name) {
    return 'The SQL in “$name” is not saved.';
  }

  @override
  String get sqCwCloseTabOk => 'Close';

  @override
  String get sqTreeTables => 'Tables';

  @override
  String get sqTreeViews => 'Views';

  @override
  String get sqTreeMatviews => 'Materialized views';

  @override
  String get sqTreeForeignTables => 'Foreign tables';

  @override
  String get sqTreeFunctions => 'Functions';

  @override
  String get sqTreeProcedures => 'Procedures';

  @override
  String get sqTreeTriggers => 'Triggers';

  @override
  String get sqTreeSequences => 'Sequences';

  @override
  String get sqTreeTypes => 'Types';

  @override
  String get sqTreeColumns => 'Columns';

  @override
  String get sqTreeIndexes => 'Indexes';

  @override
  String get sqTreeConstraints => 'Constraints';

  @override
  String get sqTreeFiles => 'Files';

  @override
  String get sqKindTable => 'Table';

  @override
  String get sqKindView => 'View';

  @override
  String get sqKindMatview => 'Materialized view';

  @override
  String get sqKindForeignTable => 'Foreign table';

  @override
  String get sqKindFunction => 'Function';

  @override
  String get sqKindProcedure => 'Procedure';

  @override
  String get sqKindTrigger => 'Trigger';

  @override
  String get sqKindSequence => 'Sequence';

  @override
  String get sqKindType => 'Type';

  @override
  String get sqKindIndex => 'Index';

  @override
  String get sqKindConstraint => 'Constraint';

  @override
  String get sqSqlRun => 'Run';

  @override
  String get sqSqlRunStatement => 'Run statement';

  @override
  String get sqSqlCancel => 'Cancel';

  @override
  String get sqSqlDatabase => 'Database';

  @override
  String get sqSqlHistory => 'History';

  @override
  String get sqSqlExport => 'Export';

  @override
  String get sqSqlRunning => 'Running…';

  @override
  String sqSqlDone(String ms) {
    return 'Done · $ms ms';
  }

  @override
  String sqSqlDoneErrors(String ms, String n) {
    return '$n errors · $ms ms';
  }

  @override
  String get sqSqlDdlHint => 'Schema changed: use Refresh to reload the tree.';

  @override
  String get sqSqlPlaceholder =>
      'Type SQL… Ctrl+Enter: run selection/all · Ctrl+Shift+Enter: statement at cursor · Ctrl+Space: complete';

  @override
  String sqSqlTabTitle(String n) {
    return 'SQL $n';
  }

  @override
  String get sqSqlHistoryEmpty => 'No history for this connection.';

  @override
  String get sqSqlRowsShort => 'rows';

  @override
  String sqResResult(String n) {
    return 'Result $n';
  }

  @override
  String get sqResMessages => 'Messages';

  @override
  String sqResRows(String ms, String n) {
    return '$n rows · $ms ms';
  }

  @override
  String sqResRowsTruncated(String ms, String n) {
    return 'Showing the first $n rows (limit) · $ms ms';
  }

  @override
  String get sqResNoRows => 'No rows';

  @override
  String sqResAffected(String cmd, String ms, String n) {
    return '$cmd: $n rows affected · $ms ms';
  }

  @override
  String sqResCommand(String cmd, String ms) {
    return '$cmd · $ms ms';
  }

  @override
  String get sqResCancelled => 'Cancelled';

  @override
  String get sqGridCopy => 'Copy';

  @override
  String get sqGridCopyHeaders => 'Copy with headers';

  @override
  String get sqGridExport => 'Export this result…';

  @override
  String get sqDataColumns => 'Columns';

  @override
  String sqDataColumnsHidden(String n, String total) {
    return 'Columns ($n/$total)';
  }

  @override
  String get sqDataAddFilter => 'Filter';

  @override
  String get sqDataLimit => 'Row count';

  @override
  String sqDataFirstN(String n) {
    return 'First $n';
  }

  @override
  String get sqDataAll => 'All (limited)';

  @override
  String get sqDataOpenInEditor => 'Open in SQL editor';

  @override
  String get sqDataClearFilters => 'Clear filters';

  @override
  String sqDataRows(String ms, String n) {
    return '$n rows · $ms ms';
  }

  @override
  String sqDataRowsMore(String ms, String n) {
    return 'First $n rows · $ms ms';
  }

  @override
  String get sqDataError => 'Could not load data';

  @override
  String get sqDataSortAsc => 'Sort ascending';

  @override
  String get sqDataSortDesc => 'Sort descending';

  @override
  String get sqDataSortClear => 'Clear sorting';

  @override
  String get sqDataFilterColumn => 'Filter by this column…';

  @override
  String get sqDataHideColumn => 'Hide column';

  @override
  String get sqDataShowAll => 'Show all columns';

  @override
  String sqDataFilterEq(String v) {
    return 'Equal to “$v”';
  }

  @override
  String sqDataFilterNe(String v) {
    return 'Not equal to “$v”';
  }

  @override
  String get sqDataFilterNull => 'NULL / not NULL';

  @override
  String get sqDataColumn => 'Column';

  @override
  String get sqDataOperator => 'Condition';

  @override
  String get sqDataValue => 'Value';

  @override
  String get sqDataInHint => 'For “in list”, separate values with commas.';

  @override
  String get sqDataFilterTitle => 'Filter';

  @override
  String get sqDataSelectAll => 'All';

  @override
  String get sqDataSelectNone => 'None';

  @override
  String get sqOpContains => 'contains';

  @override
  String get sqOpStarts => 'starts with';

  @override
  String get sqOpEnds => 'ends with';

  @override
  String get sqOpLike => 'LIKE';

  @override
  String get sqOpIn => 'in list';

  @override
  String get sqCodeExecute => 'Execute';

  @override
  String get sqCodeLoading => 'Loading…';

  @override
  String get sqCodeEmpty => 'No definition found';

  @override
  String get sqQbAddTable => 'Add table';

  @override
  String get sqQbLimit => 'Limit';

  @override
  String get sqQbClear => 'Clear';

  @override
  String get sqQbHint =>
      'Drag tables here from the tree or click “Add table”. Drag a column onto another table’s column to create a JOIN.';

  @override
  String get sqQbColumns => 'Columns';

  @override
  String get sqQbConditions => 'Conditions';

  @override
  String get sqQbResults => 'Results';

  @override
  String get sqQbGenerated => 'Generated SQL';

  @override
  String get sqQbRegenerate => 'Regenerate from diagram';

  @override
  String get sqQbOtherDb =>
      'The query builder works with tables from a single database.';

  @override
  String get sqQbDragJoin => 'Drag onto another table’s column to JOIN';

  @override
  String get sqQbSwapJoin => 'Swap direction';

  @override
  String get sqQbDeleteJoin => 'Delete JOIN';

  @override
  String get sqQbNoColumns =>
      'Tick column boxes on the tables (none = SELECT *).';

  @override
  String get sqQbOutput => 'Show';

  @override
  String get sqQbColumn => 'Column';

  @override
  String get sqQbAlias => 'Alias';

  @override
  String get sqQbAggregate => 'Aggregate';

  @override
  String get sqQbSort => 'Sort';

  @override
  String get sqQbAddCondition => 'Add condition';

  @override
  String sqQbTabTitle(String n) {
    return 'Query $n';
  }

  @override
  String get sqRoTitle => 'Read-only mode';

  @override
  String get sqRoMessage =>
      'This connection is in read-only mode. The following statements may change data or schema:';

  @override
  String get sqRoHint =>
      'You can allow them for this run only; read-only mode comes back afterwards.';

  @override
  String get sqRoRunOnce => 'Run this once';

  @override
  String get sqRoNotRun => 'Read-only mode: not executed';

  @override
  String sqRoBlockedMsg(String n) {
    return 'Read-only mode: $n statements need approval.';
  }

  @override
  String get sqExpTitle => 'Export';

  @override
  String get sqExpHint =>
      'The query runs again without a row limit and results are streamed straight to the file.';

  @override
  String get sqExpRunning => 'Exporting…';

  @override
  String sqExpDone(String n) {
    return '$n rows exported';
  }

  @override
  String get sqExpFailed => 'Export failed';

  @override
  String get sqErrRefused =>
      'Connection refused: the port is closed or the server is not running.';

  @override
  String get sqErrDns => 'Could not resolve the host name (DNS).';

  @override
  String get sqErrTimeout => 'Timed out: the server could not be reached.';

  @override
  String get sqErrReset => 'The server closed the connection.';

  @override
  String get sqErrUnreach => 'The server is unreachable on the network.';

  @override
  String get sqErrSshAuth =>
      'SSH login failed: wrong user name, key or password.';

  @override
  String sqErrTls(String msg) {
    return 'TLS/SSL error — certificate could not be verified or the server does not support TLS. ($msg)';
  }

  @override
  String get sqErrHostExit => 'The database process exited unexpectedly.';

  @override
  String get sqErrUnknown => 'Unknown error';

  @override
  String get sqMainCloseAnyway => 'Close anyway';

  @override
  String get sqMainCloseRunning =>
      'Queries are still running. They will be cancelled if you close this window.';

  @override
  String get sqMainCopySuffix => ' (copy)';

  @override
  String get sqMainErrConnNotFound => 'Connection not found';

  @override
  String get sqMainErrNoSession => 'This window has no connection';

  @override
  String sqMainErrKeyFile(String path) {
    return 'Could not read the SSH key file: $path';
  }

  @override
  String get sqMainTrayShow => 'Show SQL Master';

  @override
  String get sqMainTrayQuick => 'Quick connect';

  @override
  String get sqMainTrayNone => 'No saved connections';

  @override
  String get sqMainTrayQuit => 'Quit';

  @override
  String get npKindSsh => 'SSH Project';

  @override
  String get npKindFtp => 'FTP Project';

  @override
  String get npKindLocal => 'Local Folder';

  @override
  String get npKindFile => 'Project File';

  @override
  String get npKindSshHint => 'A server folder over SSH (SFTP)';

  @override
  String get npKindFtpHint => 'An FTP, FTPS or SFTP server';

  @override
  String get npKindLocalHint => 'A folder on this computer';

  @override
  String get npKindFileHint => 'Edit a single file';

  @override
  String get npAppSearchPh => 'Search connections…  (Ctrl+F)';

  @override
  String get npAppNewConn => 'New connection';

  @override
  String get npAppSettings => 'Settings';

  @override
  String npAppStats(String c, String f) {
    return 'Connections: $c · Folders: $f';
  }

  @override
  String get npAppWelcome => 'Welcome';

  @override
  String npAppResults(String q) {
    return 'Results for “$q”';
  }

  @override
  String get npAppAll => 'All connections';

  @override
  String get npAppWelcomeHint =>
      'Add an SSH or FTP server, a local folder or a single file.<br>Double-click a card to open the project in its own window.';

  @override
  String get npAppFolders => 'Folders';

  @override
  String get npAppConnections => 'Connections';

  @override
  String get npAppDblHint => 'Double-click a card to open it';

  @override
  String get npAppNoMatch => 'No matching connections.';

  @override
  String npAppFolderCount(String n) {
    return 'Connections: $n';
  }

  @override
  String get npAppNewConnHere => 'New connection in this folder';

  @override
  String get npAppNewSubfolder => 'New subfolder';

  @override
  String get npAppKeyTag => 'Key';

  @override
  String get npAppDuplicate => 'Duplicate';

  @override
  String get npAppMoveToFolder => 'Move to folder…';

  @override
  String get npAppConnMoved => 'Connection moved';

  @override
  String get npAppFolderIntoSelf => 'A folder cannot be moved into itself';

  @override
  String get npAppFolderPh => 'e.g. Customers';

  @override
  String get npAppRenameFolder => 'Rename folder';

  @override
  String get npAppDeleteFolder => 'Delete folder';

  @override
  String npAppDeleteFolderMsg(String name) {
    return 'Delete the <b>$name</b> folder?';
  }

  @override
  String npAppDeleteFolderConns(String n) {
    return '<br>Its $n connections will be moved to the parent folder.';
  }

  @override
  String get npAppRootFolder => 'Top level (no folder)';

  @override
  String npAppMoveTitle(String name) {
    return 'Move “$name”';
  }

  @override
  String get npAppTargetFolder => 'Target folder';

  @override
  String get npAppDeleteConn => 'Delete connection';

  @override
  String npAppDeleteConnMsg(String name, String target) {
    return 'Delete the <b>$name</b> ($target) connection?<br>Files on the server or in the folder are not touched; only this connection and its working copy are removed.';
  }

  @override
  String get npAppNoLocalPath =>
      'No path chosen on this computer — you will be asked when opening';

  @override
  String get npAppChangeLocalPath => 'Change the path on this computer…';

  @override
  String get npAppOpenTabs => 'Open tabs';

  @override
  String get npAppCustomEditor => 'Connection-specific editor settings';

  @override
  String get npFormTitleNew => 'New connection';

  @override
  String npFormTitleEdit(String name) {
    return 'Connection: $name';
  }

  @override
  String get npFormTabConn => 'Connection';

  @override
  String get npFormTabProject => 'Project';

  @override
  String get npFormTabEditor => 'Editor (Notepad++)';

  @override
  String get npFormName => 'Name (display)';

  @override
  String get npFormNamePh => 'e.g. Company website';

  @override
  String get npFormHost => 'Host';

  @override
  String get npFormHostPh => 'server.example.com or 192.168.1.10';

  @override
  String get npFormPort => 'Port';

  @override
  String get npFormUser => 'Username';

  @override
  String get npFormPassword => 'Password';

  @override
  String get npFormPwSaved => '•••••••• (saved, type to change)';

  @override
  String get npFormLoginMethod => 'Login method';

  @override
  String get npFormLoginNormal => 'Normal';

  @override
  String get npFormLoginAnon => 'Anonymous';

  @override
  String get npFormAuth => 'SSH authentication';

  @override
  String get npFormPrivateKey => 'Private key';

  @override
  String get npFormKeyFile => 'Private key file';

  @override
  String get npFormPassphrase => 'Key passphrase';

  @override
  String get npFormPassSaved => '(saved)';

  @override
  String get npFormPassEmpty => 'Leave empty if none';

  @override
  String get npFormFolder => 'Folder';

  @override
  String get npFormColor => 'Color';

  @override
  String get npFormComments => 'Notes';

  @override
  String get npFormRootDir => 'Project folder (on the server)';

  @override
  String get npFormBrowse => 'Choose folder';

  @override
  String get npFormBrowseHint =>
      'Press “Test connection” first to browse the server and pick the folder. If empty, the login folder is opened.';

  @override
  String get npFormBrowseTitle => 'Choose a folder on the server';

  @override
  String get npFormBrowseSelect => 'Select this folder';

  @override
  String get npFormBrowseEmpty => 'No subfolders';

  @override
  String get npFormFolderPath => 'Folder';

  @override
  String get npFormFilePath => 'File';

  @override
  String get npFormLocalPathHint =>
      'The local path is stored on this computer only; other computers ask for it the first time.';

  @override
  String get npFormCacheNote =>
      'Every opened file is saved, with its folder structure, to a working copy (cache). Saving uploads the file to the server and updates the working copy.';

  @override
  String get npFormRestoreTabs => 'Remember open tabs';

  @override
  String get npFormRestoreTabsHint =>
      'The project reopens with the same files next time (on this computer only).';

  @override
  String get npFormShowHidden => 'Show hidden files';

  @override
  String get npFormShowHiddenHint =>
      'Files and folders starting with a dot (.env, .htaccess, .git…)';

  @override
  String get npFormExclude => 'Hide in the tree';

  @override
  String get npFormExcludeHint =>
      'Comma-separated names or patterns; * and ? are allowed.';

  @override
  String get npFormEditorMode => 'Editor settings';

  @override
  String get npFormEdGlobal =>
      'Use the global editor settings (Settings › Editor)';

  @override
  String get npFormEdCustom => 'Use settings specific to this connection';

  @override
  String get npFormTest => 'Test connection';

  @override
  String get npFormSaveOpen => 'Save and open';

  @override
  String get npFormConnecting => 'Connecting…';

  @override
  String get npFormTestOk => 'Connection successful';

  @override
  String get npFormTestFail => 'Could not connect';

  @override
  String npFormHomeDir(String dir) {
    return 'Login folder: $dir';
  }

  @override
  String get npFormRootMissing =>
      'Warning: the project folder could not be opened.';

  @override
  String npFormHostKey(String fp) {
    return 'SSH host key (SHA256): $fp';
  }

  @override
  String get npFormSaved => 'Connection saved';

  @override
  String get npFormChangesSaved => 'Changes saved';

  @override
  String get npTypeProtocol => 'Protocol';

  @override
  String get npTypeFtp => 'FTP (standard)';

  @override
  String get npTypeFtpsImplicit => 'FTPS — TLS/SSL Implicit (port 990)';

  @override
  String get npTypeFtpsSsl => 'FTPS — Explicit (AUTH SSL)';

  @override
  String get npTypeFtpsTls => 'FTPS — Explicit (AUTH TLS)';

  @override
  String get npTypeSftp => 'SFTP — SSH2';

  @override
  String get npTypeNoteFtp =>
      'Plain FTP; the password and files are sent unencrypted.';

  @override
  String get npTypeNoteFtpsImplicit =>
      'The connection is encrypted with TLS/SSL from the start (usually port 990).';

  @override
  String get npTypeNoteFtpsSsl =>
      'Connects with plain FTP and switches to an encrypted session with AUTH SSL.';

  @override
  String get npTypeNoteFtpsTls =>
      'Connects with plain FTP and switches to an encrypted session with AUTH TLS (the most common FTPS).';

  @override
  String get npTypeNoteSftp =>
      'Encrypted file access over SSH (port 22). The server host key is saved on first connect.';

  @override
  String get npOptEncoding => 'File name encoding';

  @override
  String get npOptEncAuto => 'Auto';

  @override
  String get npEdSecEncoding => 'Encoding and line endings';

  @override
  String get npEdEncoding => 'Encoding when opening files';

  @override
  String get npEdEncAuto => 'Auto-detect (BOM / UTF-8)';

  @override
  String get npEdFallback => 'If not UTF-8 (ANSI)';

  @override
  String get npEdEol => 'Line endings';

  @override
  String get npEdEolAuto => 'Keep the file’s own';

  @override
  String npEdEolConvert(String eol) {
    return 'Convert to $eol on open';
  }

  @override
  String get npEdNewDoc => 'New file: encoding · line ending';

  @override
  String get npEdSecIndent => 'Indentation and language';

  @override
  String get npEdTabSize => 'Tab size';

  @override
  String get npEdLanguage => 'Language (syntax)';

  @override
  String get npEdLangAuto => 'Auto (extension / first line)';

  @override
  String get npEdInsertSpaces => 'Insert spaces instead of tabs';

  @override
  String get npEdDetectIndent => 'Detect indentation from the file';

  @override
  String get npEdDetectIndentHint =>
      'Files indented with tabs keep using tabs.';

  @override
  String get npEdAutoIndent => 'Auto-indent';

  @override
  String get npEdAutoClose => 'Auto-close brackets and quotes';

  @override
  String get npEdSecLook => 'Appearance';

  @override
  String get npEdTheme => 'Color theme';

  @override
  String get npEdThemeAuto => 'Auto (follow the app theme)';

  @override
  String get npEdWhitespace => 'Show spaces and tabs';

  @override
  String get npEdWsNone => 'Don’t show';

  @override
  String get npEdWsBoundary => 'All but single spaces between words';

  @override
  String get npEdWsTrailing => 'Trailing only';

  @override
  String get npEdWsAll => 'All';

  @override
  String get npEdFont => 'Font';

  @override
  String get npEdFontSize => 'Size';

  @override
  String get npEdRulers => 'Rulers';

  @override
  String get npEdWordWrap => 'Word wrap';

  @override
  String get npEdLineNumbers => 'Line numbers';

  @override
  String get npEdHighlightLine => 'Highlight current line';

  @override
  String get npEdSmartHighlight => 'Smart highlighting (same words)';

  @override
  String get npEdIndentGuides => 'Indent guides';

  @override
  String get npEdFolding => 'Code folding';

  @override
  String get npEdBracketColors => 'Colorize bracket pairs';

  @override
  String get npEdMinimap => 'Minimap (document map)';

  @override
  String get npEdControlChars => 'Show invisible characters';

  @override
  String get npEdSecSave => 'Saving';

  @override
  String get npEdTrimTrailing => 'Trim trailing whitespace on save';

  @override
  String get npEdFinalNewline => 'Insert final newline';

  @override
  String get npEdCheckRemote => 'Check for changes before saving';

  @override
  String get npEdCheckRemoteHint =>
      'Asks if someone changed the file on the server after you opened it.';

  @override
  String get npEdAutoSave => 'Auto save';

  @override
  String get npEdSec => 's';

  @override
  String get npEdAutoSaveHint =>
      '0 = off. When on, the file is saved and uploaded this long after a change.';

  @override
  String get npMainBalloonTitle =>
      'Notepad Master is running in the background';

  @override
  String get npMainBalloonBody => 'Click the tray icon to open it again.';

  @override
  String get npMainTrayShow => 'Show Notepad Master';

  @override
  String get npMainTrayQuick => 'Quick open';

  @override
  String get npMainTrayNone => 'No saved connections';

  @override
  String get npMainTrayQuit => 'Quit';

  @override
  String get npProjToggleTree => 'Toggle folder tree (Ctrl+B)';

  @override
  String get npProjReconnect => 'Reconnect';

  @override
  String get npProjReconnected => 'Reconnected';

  @override
  String get npProjConnectFail => 'Could not connect';

  @override
  String get npProjStatusOn => 'Connected';

  @override
  String get npProjStatusOff => 'Disconnected';

  @override
  String get npProjStatusConnecting => 'Connecting…';

  @override
  String get npProjSave => 'Save';

  @override
  String get npProjSaveAll => 'Save all';

  @override
  String get npProjUndo => 'Undo';

  @override
  String get npProjRedo => 'Redo';

  @override
  String get npProjFind => 'Find';

  @override
  String get npProjReplace => 'Replace';

  @override
  String get npProjGoto => 'Go to line';

  @override
  String get npProjShowWs => 'Show spaces and tabs';

  @override
  String get npProjZoomIn => 'Zoom in';

  @override
  String get npProjZoomOut => 'Zoom out';

  @override
  String get npProjShowCache => 'Show working copy';

  @override
  String get npProjPalette => 'Command palette';

  @override
  String get npProjCloseTab => 'Close';

  @override
  String get npProjCloseOthers => 'Close others';

  @override
  String get npProjCloseAll => 'Close all';

  @override
  String get npProjReload => 'Reload';

  @override
  String npProjReloadMsg(String name) {
    return 'Unsaved changes in <b>$name</b> will be lost. Reload the file?';
  }

  @override
  String get npProjRevealTree => 'Reveal in tree';

  @override
  String get npProjUnsavedTitle => 'Unsaved changes';

  @override
  String npProjUnsavedMsg(String name) {
    return 'Save the changes to <b>$name</b>?';
  }

  @override
  String get npProjDontSave => 'Don’t save';

  @override
  String npProjOpenFail(String name) {
    return 'Could not open $name';
  }

  @override
  String npProjTooLarge(String name, String size) {
    return '$name is too large ($size); the limit is 50 MB.';
  }

  @override
  String npProjBinary(String name) {
    return '$name is not a text file (binary); it was not opened in the editor.';
  }

  @override
  String npProjSaveFail(String name) {
    return 'Could not save $name';
  }

  @override
  String npProjSaved(String name) {
    return '$name saved';
  }

  @override
  String npProjSavedRemote(String name) {
    return '$name saved and uploaded';
  }

  @override
  String get npProjLossyTitle => 'Encoding warning';

  @override
  String npProjLossyMsg(String enc) {
    return 'Some characters cannot be stored in <b>$enc</b> and will be saved as “?”. Converting to UTF-8 from the status bar is recommended.';
  }

  @override
  String get npProjSaveAnyway => 'Save anyway';

  @override
  String get npProjConflictTitle => 'File changed elsewhere';

  @override
  String npProjConflictMsg(String name) {
    return '<b>$name</b> was changed on the server after you opened it. What should happen?';
  }

  @override
  String get npProjConflictOverwrite => 'Overwrite';

  @override
  String get npProjConflictReload => 'Load the server version';

  @override
  String npProjConflictAuto(String name) {
    return '$name changed on the server; auto save skipped.';
  }

  @override
  String npProjPos(String col, String ln) {
    return 'Ln $ln, Col $col';
  }

  @override
  String npProjSel(String n) {
    return '$n selected';
  }

  @override
  String npProjSpaces(String n) {
    return 'Spaces: $n';
  }

  @override
  String npProjTabWidth(String n) {
    return 'Tab size: $n';
  }

  @override
  String get npProjIndentToSpaces => 'Convert indentation to spaces';

  @override
  String get npProjIndentToTabs => 'Convert indentation to tabs';

  @override
  String npProjEncTitle(String name) {
    return 'Encoding: $name';
  }

  @override
  String get npProjEncConvert => 'Convert to this encoding (on save)';

  @override
  String get npProjEncConvertHint =>
      'The text stays the same; the file is written in the chosen encoding when saved.';

  @override
  String get npProjEncReopen => 'Reopen with this encoding';

  @override
  String get npProjEncReopenHint =>
      'If characters look garbled, re-read the file with the right encoding.';

  @override
  String npProjEolTo(String eol) {
    return 'Convert to $eol';
  }

  @override
  String get npProjLangTitle => 'Choose language';

  @override
  String get npProjLangSearch => 'Search languages…';

  @override
  String get npProjCacheCopy => 'Working copy';

  @override
  String get npProjInitFail => 'The project window could not start';

  @override
  String get npProjEmptyHint =>
      'Double-click a file in the tree on the left; it opens here in a tab with syntax highlighting for its language.';

  @override
  String get npProjEmptyFile => 'Opening the file…';

  @override
  String get npTreeNewFile => 'New file';

  @override
  String get npTreeFileName => 'File name';

  @override
  String get npTreeBadName => 'Invalid name';

  @override
  String get npTreeCreateFail => 'Could not create';

  @override
  String get npTreeRenameFail => 'Could not rename';

  @override
  String get npTreeRenameDirty => 'Save the open files in this folder first.';

  @override
  String get npTreeDeleteTitle => 'Delete';

  @override
  String npTreeDeleteMsg(String name) {
    return 'Delete the file <b>$name</b>?';
  }

  @override
  String npTreeDeleteDirMsg(String name) {
    return 'Delete the folder <b>$name</b> and everything in it?';
  }

  @override
  String get npTreeDeleteFail => 'Could not delete';

  @override
  String get npTreeTrashNote => 'Local files are moved to the Recycle Bin.';

  @override
  String get npTreeEmpty => 'Empty folder';

  @override
  String get npTreeCollapseAll => 'Collapse all';

  @override
  String get npTreeShowExplorer => 'Show in Explorer';

  @override
  String get npTreeUp => 'Parent folder';

  @override
  String get npTreeHome => 'Login folder';

  @override
  String get npMainErrAuth => 'Login failed: wrong username or password.';

  @override
  String get npMainErrRefused =>
      'Connection refused: the port is closed or the server is not running.';

  @override
  String get npMainErrTimeout => 'Timed out: the server could not be reached.';

  @override
  String get npMainErrDns => 'Could not resolve the host name (DNS).';

  @override
  String get npMainErrUnreach => 'The server is unreachable on the network.';

  @override
  String get npMainErrReset => 'The server closed the connection.';

  @override
  String get npMainErrNotFound => 'File or folder not found.';

  @override
  String get npMainErrPerm => 'Permission denied.';

  @override
  String get npMainErrExists =>
      'A file or folder with this name already exists.';

  @override
  String npMainErr550(String msg) {
    return 'The server refused the operation (550): $msg';
  }

  @override
  String get npMainErr553 => 'The server did not accept the file name (553).';

  @override
  String npMainErrTls(String msg) {
    return 'TLS/SSL error — check the protocol or port. ($msg)';
  }

  @override
  String npMainErrHostKey(String newVal, String oldVal) {
    return 'The server host key has changed! Saved: $oldVal, received: $newVal. The connection was refused for security.';
  }

  @override
  String get npMainErrNoKey => 'The private key file could not be read.';

  @override
  String get npMainErrKey =>
      'Could not read the private key: wrong passphrase or unsupported format.';

  @override
  String get npMainErrNoLocal =>
      'The folder or file was not found on this computer. Change the path from the card’s menu in the main window.';

  @override
  String get npMainErrConnNotFound => 'Connection not found';

  @override
  String get npMainErrNoSession => 'Not connected';

  @override
  String get npMainErrHost => 'Host address is required.';

  @override
  String get npMainErrUser =>
      'Username is required (or choose Anonymous login).';

  @override
  String get npMainPickKey => 'Choose a private key file';

  @override
  String get npMainCopySuffix => ' (copy)';

  @override
  String get npMainCloseDirty =>
      'There are unsaved files. Closing the window will discard the changes.';

  @override
  String get npMainCloseDiscard => 'Close without saving';

  @override
  String get ipAppNewFolder => 'New folder';

  @override
  String get ipAppNewRecord => 'New record';

  @override
  String get ipAppSearchPh => 'Search records, IPs, names, MACs or services…';

  @override
  String ipAppStats(String n) {
    return '$n records';
  }

  @override
  String get ipColIp => 'IP';

  @override
  String get ipColMac => 'MAC';

  @override
  String get ipColName => 'Name';

  @override
  String get ipColRtt => 'Response';

  @override
  String get ipColServices => 'Services';

  @override
  String get ipColStatus => 'Status';

  @override
  String get ipColVendor => 'Vendor';

  @override
  String get ipCtxCopyIp => 'Copy IP address';

  @override
  String get ipCtxCopyMac => 'Copy MAC address';

  @override
  String get ipCtxCopyName => 'Copy name';

  @override
  String get ipCtxCopyRange => 'Copy range';

  @override
  String get ipCtxOpenWeb => 'Open in browser';

  @override
  String ipFolderDeleteMsg(String name) {
    return 'Folder “$name” will be deleted; its records and folders move to the parent folder.';
  }

  @override
  String get ipFolderEmpty => 'Empty folder';

  @override
  String get ipFolderName => 'Folder name';

  @override
  String get ipFolderRename => 'Rename folder';

  @override
  String get ipHostAlive => 'Liveness';

  @override
  String get ipHostBanner => 'Greeting';

  @override
  String get ipHostCert => 'Certificate';

  @override
  String get ipHostCertExpires => 'Valid until';

  @override
  String get ipHostCertIssuer => 'Issuer';

  @override
  String get ipHostDetails => 'Details';

  @override
  String get ipHostLocalMac => 'private address';

  @override
  String get ipHostNoServices => 'None of the listed ports is open.';

  @override
  String get ipHostSelfSigned => 'self-signed';

  @override
  String get ipHostServer => 'Server';

  @override
  String get ipHostTitle => 'Title';

  @override
  String get ipHostUnknown => '(name not resolved)';

  @override
  String get ipNoticeAccept => 'Got it';

  @override
  String get ipNoticeBody =>
      'IP Tools only discovers your local network: it finds devices with ping, tries to connect to a short list of ports and resolves their names. Only scan networks you own or are authorized to scan.';

  @override
  String get ipNoticeLimits =>
      'By design only private addresses (10.x, 172.16–31.x, 192.168.x, 169.254.x) are scanned; no vulnerability probing, password guessing or wide port scanning.';

  @override
  String get ipNoticeShort => 'Only scan networks you are authorized to scan';

  @override
  String get ipNoticeText =>
      'Only scan networks you own or are authorized to scan.';

  @override
  String get ipNoticeTitle => 'Local network discovery';

  @override
  String get ipPrivacyNote =>
      'Privacy: scan results are stored only on this computer and never sent anywhere. Only private/local addresses are scanned.';

  @override
  String get ipRangeErrEmpty => 'Enter an IP range.';

  @override
  String ipRangeErrInvalid(String token) {
    return 'Invalid address or range: $token';
  }

  @override
  String ipRangeErrIpv6(String token) {
    return 'IPv6 addresses are not supported: $token';
  }

  @override
  String ipRangeErrNotPrivate(String token) {
    return 'Only private/local addresses can be scanned (10.x, 172.16–31.x, 192.168.x, 169.254.x): $token';
  }

  @override
  String ipRangeErrReversed(String token) {
    return 'The start of the range is greater than its end: $token';
  }

  @override
  String ipRangeErrTooMany(String count) {
    return 'Range too large (at most 65,536 addresses, one /16): $count';
  }

  @override
  String ipRangeOk(String n) {
    return '$n addresses will be scanned';
  }

  @override
  String get ipRecColor => 'Color';

  @override
  String ipRecDeleteMsg(String name) {
    return 'Record “$name” and its scan result on this computer will be deleted.';
  }

  @override
  String ipRecDevices(String n) {
    return '$n devices';
  }

  @override
  String get ipRecEdit => 'Edit record';

  @override
  String get ipRecFolder => 'Folder';

  @override
  String ipRecItems(String n) {
    return '$n items';
  }

  @override
  String ipRecLastScan(String time) {
    return 'Last scan: $time';
  }

  @override
  String get ipRecMove => 'Move';

  @override
  String get ipRecMoveTitle => 'Move record';

  @override
  String get ipRecName => 'Name';

  @override
  String get ipRecNever => 'Not scanned yet';

  @override
  String ipRecNewDevices(String n) {
    return '$n new';
  }

  @override
  String get ipRecRange => 'IP range';

  @override
  String get ipRecRangeHint =>
      'Examples: 192.168.1.0/24 · 192.168.1.1-192.168.1.255 · 10.0.0.5 · several separated by commas. At most /16.';

  @override
  String get ipRecRootFolder => 'Records';

  @override
  String get ipRecSaved => 'Record saved';

  @override
  String get ipScanBusy => 'Another scan is running; stop it first.';

  @override
  String ipScanDone(String n) {
    return 'Scan finished: $n devices';
  }

  @override
  String get ipScanEmptyBody =>
      'Press Scan or click ▶ on the card. Discovered devices are listed here.';

  @override
  String get ipScanEmptyTitle => 'This record has not been scanned yet';

  @override
  String get ipScanExport => 'Export';

  @override
  String get ipScanExportCsv => 'Save as CSV…';

  @override
  String get ipScanExportJson => 'Save as JSON…';

  @override
  String get ipScanExported => 'Exported';

  @override
  String ipScanFailed(String msg) {
    return 'Scan failed: $msg';
  }

  @override
  String get ipScanFilter => 'Filter';

  @override
  String get ipScanFilterAll => 'All';

  @override
  String get ipScanFilterGone => 'Gone';

  @override
  String get ipScanFilterNew => 'New';

  @override
  String get ipScanFilterServices => 'With services';

  @override
  String ipScanFound(String n) {
    return '$n devices found';
  }

  @override
  String get ipScanNoMatch => 'No device matches the filter.';

  @override
  String get ipScanPhaseNames => 'Resolving names';

  @override
  String get ipScanPhasePing => 'Looking for devices';

  @override
  String get ipScanPhasePorts => 'Trying services';

  @override
  String ipScanProgress(String done, String total) {
    return '$done/$total';
  }

  @override
  String ipScanRateLimited(String s) {
    return 'The same record can be rescanned in $s s at the earliest.';
  }

  @override
  String get ipScanScan => 'Scan';

  @override
  String get ipScanScanning => 'Scanning…';

  @override
  String get ipScanSelectHint =>
      'Click a record on the left: the range is scanned and the devices found are listed here.';

  @override
  String get ipScanSelectRecord => 'Select a record';

  @override
  String get ipScanStop => 'Stop';

  @override
  String get ipScanStopped => 'Scan stopped';

  @override
  String get ipStatusAliveArp => 'Seen in the ARP table (did not answer ping)';

  @override
  String get ipStatusAlivePing => 'Answered ping';

  @override
  String get ipStatusGone => 'Gone (present in the previous scan)';

  @override
  String get ipStatusLive => 'Scanning';

  @override
  String get ipStatusNew => 'New (not in the previous scan)';

  @override
  String get ipStatusSame => 'Online';

  @override
  String ipTagCopied(String text) {
    return 'Copied to clipboard: $text';
  }

  @override
  String get ipTagFailed => 'Could not open';

  @override
  String get ipTagGroupCamera => 'Camera (RTSP)';

  @override
  String get ipTagGroupDb => 'Database';

  @override
  String get ipTagGroupFtp => 'FTP';

  @override
  String get ipTagGroupPrinter => 'Printer';

  @override
  String get ipTagGroupRdp => 'Remote Desktop';

  @override
  String get ipTagGroupSmb => 'File sharing';

  @override
  String get ipTagGroupSsh => 'SSH';

  @override
  String get ipTagGroupVnc => 'VNC';

  @override
  String get ipTagGroupWeb => 'Web';

  @override
  String ipTagOpened(String text) {
    return 'Opening: $text';
  }

  @override
  String get ipTrayHiddenHint =>
      'IP Tools keeps running in the tray. Click the icon to bring the window back.';

  @override
  String get ipTrayQuit => 'Quit';

  @override
  String get ipTrayShow => 'Show IP Tools';

  @override
  String get ipWelcomeBody =>
      'Save an IP range (e.g. 192.168.1.0/24). Clicking the record scans the range; the devices found are listed with their name, vendor and open services. Click a service tag to open the matching app.';

  @override
  String get ipWelcomeTitle => 'What’s on your local network?';

  @override
  String get cvTypeVideo => 'Video';

  @override
  String get cvTypeImage => 'Image';

  @override
  String get cvTypeAudio => 'Audio';

  @override
  String get cvTypeVideoHint => 'MP4, MKV, AVI, MOV…';

  @override
  String get cvTypeImageHint => 'JPG, PNG, WEBP, AVIF…';

  @override
  String get cvTypeAudioHint => 'MP3, WAV, FLAC, M4A…';

  @override
  String get cvTypeVideoAll => 'All video files';

  @override
  String get cvTypeImageAll => 'All image files';

  @override
  String get cvTypeAudioAll => 'All audio files';

  @override
  String get cvAppSearchPh => 'Search projects…  (Ctrl+F)';

  @override
  String get cvAppNewProject => 'New project';

  @override
  String get cvAppSettings => 'Settings';

  @override
  String cvAppStats(String c, String f) {
    return 'Projects: $c · folders: $f';
  }

  @override
  String get cvAppWelcome => 'Welcome';

  @override
  String cvAppResults(String q) {
    return 'Results for “$q”';
  }

  @override
  String get cvAppAll => 'All projects';

  @override
  String get cvAppWelcomeHint =>
      'Create your first conversion project.<br>Pick video, image or audio, choose the source and target extensions and point to a file or folder.';

  @override
  String get cvAppFolders => 'Folders';

  @override
  String get cvAppProjects => 'Projects';

  @override
  String get cvAppDblHint => 'Double-click a project to open it';

  @override
  String get cvAppNoMatch => 'No matching projects.';

  @override
  String cvAppFolderCount(String n) {
    return '$n projects';
  }

  @override
  String get cvAppNewProjectHere => 'New project in this folder';

  @override
  String get cvAppNewSubfolder => 'Create subfolder';

  @override
  String get cvAppDuplicate => 'Duplicate';

  @override
  String get cvAppMoveToFolder => 'Move to folder…';

  @override
  String get cvAppProjectMoved => 'Project moved';

  @override
  String get cvAppFolderIntoSelf => 'A folder cannot be moved into itself';

  @override
  String get cvAppFolderPh => 'e.g. Client videos';

  @override
  String get cvAppRenameFolder => 'Rename folder';

  @override
  String get cvAppDeleteFolder => 'Delete folder';

  @override
  String cvAppDeleteFolderMsg(String name) {
    return 'Delete the folder <b>$name</b>?';
  }

  @override
  String cvAppDeleteFolderProjects(String n) {
    return '<br>Its $n projects will move to the parent folder.';
  }

  @override
  String get cvAppRootFolder => 'Top level (no folder)';

  @override
  String cvAppMoveTitle(String name) {
    return 'Move “$name”';
  }

  @override
  String get cvAppTargetFolder => 'Target folder';

  @override
  String get cvAppDeleteProject => 'Delete project';

  @override
  String cvAppDeleteProjectMsg(String name) {
    return 'Delete the project <b>$name</b>?<br>Its converted files and transcripts are deleted too. Your source files are not touched.';
  }

  @override
  String get cvAppProjectSettings => 'Project settings';

  @override
  String get cvAppNoSource => 'No source chosen on this computer';

  @override
  String get cvAppAllExts => 'All';

  @override
  String get cvAppRunning => 'Running';

  @override
  String cvAppDoneCount(String n) {
    return '$n done';
  }

  @override
  String cvAppErrorCount(String n) {
    return '$n failed';
  }

  @override
  String get cvAppProjectSaved => 'Project saved';

  @override
  String get cvAppClearOutputs => 'Delete converted files';

  @override
  String cvAppClearOutputsMsg(String name) {
    return 'Delete the converted files of <b>$name</b>? Your source files are not touched; you can convert again any time.';
  }

  @override
  String get cvPfTitleNew => 'New project';

  @override
  String cvPfTitleEdit(String name) {
    return 'Project settings: $name';
  }

  @override
  String get cvPfCreate => 'Save';

  @override
  String get cvPfTabGeneral => 'General';

  @override
  String get cvPfTabOutput => 'Conversion settings';

  @override
  String get cvPfTabSpeech => 'Speech';

  @override
  String get cvPfName => 'Project name';

  @override
  String get cvPfNamePh => 'e.g. Holiday videos';

  @override
  String get cvPfType => 'Type';

  @override
  String get cvPfSourceExt => 'Source file extension';

  @override
  String get cvPfTargetExt => 'Target file extension';

  @override
  String get cvPfSelectAll => 'Select all';

  @override
  String get cvPfSelectNone => 'None';

  @override
  String get cvPfGroupVideo => 'Video';

  @override
  String get cvPfGroupAnim => 'Animation';

  @override
  String get cvPfGroupAudioOnly => 'Audio only (extract from video)';

  @override
  String get cvPfAudioOnlyHint => 'Only the audio track of the video is kept.';

  @override
  String get cvPfGifHint => 'Animated GIF (at most 30 frames/s).';

  @override
  String get cvPfSource => 'Source';

  @override
  String get cvPfModeFile => 'File';

  @override
  String get cvPfModeFolder => 'Folder';

  @override
  String get cvPfPathFile => 'File to convert';

  @override
  String get cvPfPathFolder => 'Folder to convert';

  @override
  String get cvPfPathNone => 'Not chosen yet — press Choose…';

  @override
  String get cvPfSubfolders => 'Include subfolders';

  @override
  String get cvPfConcurrency => 'Files converted at the same time';

  @override
  String get cvPfConcurrencyHint =>
      'Higher values finish sooner but load the CPU and disk more.';

  @override
  String get cvPfFolder => 'Project folder';

  @override
  String get cvPfSpeechAsk => 'Convert speech to text';

  @override
  String get cvPfSpeechAskHint =>
      'Speech in the video or audio is transcribed: the second, language and text of each sentence appear in separate columns.';

  @override
  String get cvPfSpeechModel => 'Speech model';

  @override
  String get cvPfSpeechLang => 'Spoken language';

  @override
  String get cvPfPerWindow => 'Detect the language again every 30 seconds';

  @override
  String get cvPfPerWindowHint =>
      'For recordings with several languages. Slower.';

  @override
  String get cvPfModels => 'Models';

  @override
  String get cvPfSpeechNote =>
      'Speech recognition runs offline on this computer (whisper.cpp); audio is never sent to a server. The model is downloaded once on first use.';

  @override
  String get cvPfErrExt => 'Choose at least one source extension.';

  @override
  String get cvOutQuality => 'Quality';

  @override
  String get cvOutQHigh => 'High (large file)';

  @override
  String get cvOutQMedium => 'Medium (recommended)';

  @override
  String get cvOutQLow => 'Low (small file)';

  @override
  String get cvOutResolution => 'Resolution';

  @override
  String get cvOutAsSource => 'Same as source';

  @override
  String get cvOutResolutionHint =>
      'Only downscales; smaller videos are not enlarged.';

  @override
  String get cvOutFps => 'Frame rate';

  @override
  String get cvOutCodec => 'Video codec';

  @override
  String get cvOutH264 => 'H.264 (most compatible)';

  @override
  String get cvOutH265 => 'H.265 / HEVC (smaller)';

  @override
  String get cvOutCodecHint =>
      'H.265 is used only for MP4, MKV, MOV and M4V targets.';

  @override
  String get cvOutSpeed => 'Encoding speed';

  @override
  String get cvOutSpeedVeryfast => 'Very fast';

  @override
  String get cvOutSpeedFast => 'Fast';

  @override
  String get cvOutSpeedMedium => 'Balanced';

  @override
  String get cvOutSpeedSlow => 'Slow (smaller file)';

  @override
  String get cvOutAudioBitrate => 'Audio bitrate';

  @override
  String get cvOutNoAudio => 'Remove audio';

  @override
  String get cvOutImgQuality => 'Quality';

  @override
  String get cvOutImgQualityHint =>
      'For JPG, WEBP, AVIF and TIFF. PNG is lossless; below 80 a colour palette is used.';

  @override
  String get cvOutMaxWidth => 'Maximum width';

  @override
  String get cvOutMaxHeight => 'Maximum height';

  @override
  String get cvOutNoLimit => 'No limit';

  @override
  String get cvOutResizeHint =>
      'Aspect ratio is kept; smaller images are not enlarged.';

  @override
  String get cvOutKeepMeta => 'Keep metadata (EXIF, colour profile)';

  @override
  String get cvOutKeepMetaHint =>
      'When off, personal data such as location is not written to the output.';

  @override
  String get cvOutBitrate => 'Bitrate';

  @override
  String get cvOutBitrateHint =>
      'WAV, FLAC and AIFF are lossless; bitrate does not apply.';

  @override
  String get cvOutSampleRate => 'Sample rate';

  @override
  String get cvOutChannels => 'Channels';

  @override
  String get cvOutStereo => 'Stereo';

  @override
  String get cvOutMono => 'Mono';

  @override
  String get cvSpeechModelTiny => 'Tiny (fastest)';

  @override
  String get cvSpeechModelBase => 'Base (recommended)';

  @override
  String get cvSpeechModelSmall => 'Small (more accurate)';

  @override
  String get cvSpeechModelMedium => 'Medium (high accuracy)';

  @override
  String get cvSpeechModelTurbo => 'Large v3 Turbo (most accurate)';

  @override
  String get cvSpeechLangAuto => 'Detect automatically';

  @override
  String get cvSpeechDownload => 'Download';

  @override
  String cvSpeechInstalled(String size) {
    return 'Installed · $size';
  }

  @override
  String get cvSpeechDownloadFailed => 'The model could not be downloaded';

  @override
  String get cvSpeechDlEngine => 'Downloading the speech engine';

  @override
  String cvSpeechDlModel(String model) {
    return 'Downloading speech model: $model';
  }

  @override
  String get cvSpeechEngineAuto =>
      'The speech engine (whisper.cpp) will be downloaded on first use.';

  @override
  String get cvSpeechEngineMissing =>
      'The speech engine (whisper-cli) was not found.';

  @override
  String get cvPjOriginal => 'Original';

  @override
  String get cvPjConverted => 'Converted';

  @override
  String get cvPjFolders => 'Folders';

  @override
  String get cvPjFiles => 'Files';

  @override
  String get cvPjTranscript => 'Text';

  @override
  String get cvPjTrSecond => 'Second';

  @override
  String get cvPjTrLang => 'Language';

  @override
  String get cvPjTrText => 'Text';

  @override
  String get cvPjSecUnit => 's';

  @override
  String get cvPjStart => 'Start';

  @override
  String get cvPjStop => 'Stop';

  @override
  String get cvPjChangeSource => 'Change source';

  @override
  String get cvPjPickSource => 'Choose source';

  @override
  String get cvPjOpenOutDir => 'Open the converted files folder';

  @override
  String get cvPjExportOutputs => 'Copy converted files to another folder…';

  @override
  String get cvPjClearOutputs => 'Delete converted files';

  @override
  String get cvPjLinkPreview => 'Play both previews together';

  @override
  String get cvPjFilterPh => 'Search files';

  @override
  String get cvPjFAll => 'All';

  @override
  String get cvPjFPending => 'Pending';

  @override
  String get cvPjFActive => 'Running';

  @override
  String get cvPjFDone => 'Done';

  @override
  String get cvPjFError => 'Failed';

  @override
  String get cvPjExpandAll => 'Expand all';

  @override
  String get cvPjCollapseAll => 'Collapse all';

  @override
  String get cvPjRescan => 'Rescan';

  @override
  String get cvPjColName => 'Name';

  @override
  String get cvPjColFolder => 'Folder';

  @override
  String get cvPjColSize => 'Size';

  @override
  String get cvPjColProgress => 'Progress';

  @override
  String get cvPjColStatus => 'Status';

  @override
  String get cvPjColSpeech => 'Text';

  @override
  String get cvPjColOut => 'Output';

  @override
  String cvPjSegments(String n) {
    return '$n sentences';
  }

  @override
  String get cvPjNoAudio => 'No audio';

  @override
  String cvPjNoFiles(String exts) {
    return 'No files with the chosen extensions in this folder ($exts).';
  }

  @override
  String get cvPjNoMatch => 'No matching files.';

  @override
  String get cvPjNoneChecked =>
      'The list is empty. Tick the files to convert in the tree on the left.';

  @override
  String get cvPjConvertThis => 'Convert this file';

  @override
  String get cvPjReconvert => 'Convert again';

  @override
  String get cvPjTranscribeThis => 'Transcribe';

  @override
  String get cvPjRetranscribe => 'Transcribe again';

  @override
  String get cvPjOpenOut => 'Open converted file';

  @override
  String get cvPjRevealOut => 'Show converted in folder';

  @override
  String get cvPjOpenSrc => 'Open original file';

  @override
  String get cvPjRevealSrc => 'Show original in folder';

  @override
  String get cvPjExportThis => 'Copy to another folder…';

  @override
  String get cvPjDeleteOut => 'Delete converted file';

  @override
  String get cvPjUncheck => 'Remove from list';

  @override
  String cvPjExported(String n) {
    return '$n files copied';
  }

  @override
  String get cvPjFileMissing => 'The source file was not found.';

  @override
  String get cvPjPickToPreview => 'Select a file in the list to preview it.';

  @override
  String get cvPjOutPreviewHint => 'It will appear here once converted.';

  @override
  String get cvPjConverting => 'Converting…';

  @override
  String get cvPjCantPlay => 'This format cannot be played here directly.';

  @override
  String get cvPjMakePreview => 'Create preview';

  @override
  String get cvPjMakingPreview => 'Preparing preview…';

  @override
  String get cvPjNoSourceTitle => 'No source chosen on this computer';

  @override
  String get cvPjNoSourceHint =>
      'The project was synced from another device or no source was chosen yet. Choose the file or folder to convert.';

  @override
  String get cvPjSourceGone => 'Source not found';

  @override
  String get cvPjTrImage =>
      'Speech to text is available in video and audio projects.';

  @override
  String get cvPjTrPick => 'Select a file to see its text.';

  @override
  String get cvPjTrAfter =>
      'The speech will be transcribed once the file is converted.';

  @override
  String get cvPjTrOff =>
      'Speech to text is off in this project. You can run it for this file now.';

  @override
  String cvPjTrRunning(String p) {
    return 'Transcribing… $p%';
  }

  @override
  String get cvPjTrNone => 'No speech was found in this file.';

  @override
  String get cvPjTrNoExport => 'There is no text to export.';

  @override
  String get cvPjTrSaved => 'Text saved';

  @override
  String get cvPjExportTranscript => 'Export text';

  @override
  String get cvPjFmtSrt => 'SRT subtitles';

  @override
  String get cvPjFmtVtt => 'WebVTT subtitles';

  @override
  String get cvPjFmtTxt => 'Plain text (TXT)';

  @override
  String get cvPjFmtCsv => 'Spreadsheet (CSV)';

  @override
  String cvPjStTotal(String n) {
    return '$n files';
  }

  @override
  String cvPjStDone(String n) {
    return '$n done';
  }

  @override
  String cvPjStErr(String n) {
    return '$n failed';
  }

  @override
  String cvPjStActive(String n) {
    return '$n converting';
  }

  @override
  String cvPjStSpeech(String n) {
    return '$n transcribing';
  }

  @override
  String cvPjStOut(String size) {
    return 'Output: $size';
  }

  @override
  String cvPjStConc(String n) {
    return 'At once: $n';
  }

  @override
  String get cvPjFinished => 'Conversion finished';

  @override
  String cvPjFinishedSub(String done, String err, String total) {
    return '$done/$total files done · $err failed';
  }

  @override
  String get cvStPending => 'Pending';

  @override
  String get cvStQueued => 'Queued';

  @override
  String get cvStConverting => 'Converting';

  @override
  String get cvStDone => 'Done';

  @override
  String get cvStError => 'Error';

  @override
  String get cvStCanceled => 'Cancelled';

  @override
  String get cvMainBalloonTitle => 'Convert Master is still running';

  @override
  String get cvMainBalloonBody =>
      'Click the tray icon to open the window again.';

  @override
  String get cvMainTrayShow => 'Show Convert Master';

  @override
  String get cvMainTrayProjects => 'Projects';

  @override
  String get cvMainTrayNone => '(no projects)';

  @override
  String get cvMainTrayQuit => 'Quit';

  @override
  String get cvErrCanceled => 'Cancelled';

  @override
  String get cvErrNoVideo => 'The file has no video stream.';

  @override
  String get cvErrNoAudio => 'The file has no audio.';

  @override
  String get cvPjOcrThis => 'Read text (OCR)';

  @override
  String get cvPjReocr => 'Read text again (OCR)';

  @override
  String get cvPjNoText => 'No text';

  @override
  String get cvPjNoTextHint => 'No readable text was found in the image.';

  @override
  String get cvPjOcrPanel => 'Text (OCR)';

  @override
  String get cvPjTrLine => 'Line';

  @override
  String get cvPjTrConf => 'Confidence';

  @override
  String cvPjLines(String n) {
    return '$n lines';
  }

  @override
  String get cvPjOcrAfter =>
      'The text in the image will be read once it is converted.';

  @override
  String get cvPjOcrOff =>
      'OCR is off in this project. You can run it for this image now.';

  @override
  String cvPjOcrRunning(String p) {
    return 'Reading text… $p%';
  }

  @override
  String get cvPjCopyAll => 'Copy all';

  @override
  String get cvPjCopied => 'Text copied to the clipboard';

  @override
  String cvOcrDl(String lang) {
    return 'Downloading OCR language data: $lang';
  }

  @override
  String get cvOcrNotInstalled => 'Downloaded on first use';

  @override
  String get cvOcrDownloadFailed =>
      'The OCR language data could not be downloaded';

  @override
  String get cvPfTabOcr => 'OCR';

  @override
  String get cvPfOcrAsk => 'Read text in images (OCR)';

  @override
  String get cvPfOcrAskHint =>
      'Text in the images is extracted: each line, its reading confidence and the text appear in separate columns. Leave it off if you do not need it.';

  @override
  String get cvPfOcrLangs => 'Language of the text in the images';

  @override
  String get cvPfOcrLangsHint =>
      'Up to 6 languages; fewer languages are faster and more accurate.';

  @override
  String get cvPfOcrData => 'Language data';

  @override
  String get cvPfOcrNote =>
      'OCR runs offline on this computer (Tesseract); images are never sent to a server. Each language is downloaded once on first use.';

  @override
  String cvErrOcr(String msg) {
    return 'Could not read the text: $msg';
  }

  @override
  String get cvErrUnreadable =>
      'The file could not be read (damaged or unsupported).';

  @override
  String get cvErrUnsupported => 'This conversion is not supported.';

  @override
  String cvErrFfmpegMissing(String msg) {
    return 'The conversion engine (ffmpeg) could not be started: $msg';
  }

  @override
  String get cvErrEngineMissing =>
      'The speech engine (whisper.cpp) was not found.';

  @override
  String cvErrDownload(String msg) {
    return 'Download failed: $msg';
  }

  @override
  String get cvErrNotFound => 'File not found.';

  @override
  String get cvErrAccess => 'Access denied.';

  @override
  String get cvErrBusy => 'The file is in use by another program.';

  @override
  String get cvErrNoSpace => 'The disk is full.';

  @override
  String cvErrFfmpeg(String msg) {
    return 'Could not convert: $msg';
  }

  @override
  String cvErrWhisper(String msg) {
    return 'Could not transcribe: $msg';
  }

  @override
  String get cvMainCloseActive =>
      'A conversion is running. Closing the window stops it.';

  @override
  String get cvMainCloseAnyway => 'Close anyway';

  @override
  String get cvMainCopySuffix => ' (copy)';

  @override
  String get cvMainErrProjectNotFound => 'Project not found';

  @override
  String get cvMainExportTo => 'Folder to copy the converted files to';

  @override
  String get cvMainPickFile => 'Choose the file to convert';

  @override
  String get cvMainPickFolder => 'Choose the folder to convert';

  @override
  String get cvMainSaveTranscript => 'Save text';

  @override
  String get cvMainUntitled => 'Untitled project';

  @override
  String get sqOp => 'greater or equal';

  @override
  String get sqOpNotcontains => 'does not contain';

  @override
  String get sqOpNotlike => 'NOT LIKE';

  @override
  String get sqOpNotin => 'not in list';

  @override
  String get sqOpIsnull => 'is NULL';

  @override
  String get sqOpIsnotnull => 'is not NULL';
}
