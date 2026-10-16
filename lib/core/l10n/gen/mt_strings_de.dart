// ignore: unused_import
import 'package:intl/intl.dart' as intl;

import 'mt_strings.dart';

// ignore_for_file: type=lint

/// The translations for German (`de`).
class MtStringsDe extends MtStrings {
  MtStringsDe([String locale = 'de']) : super(locale);

  @override
  String get setGeneral => 'Allgemein';

  @override
  String get setAccount => 'Konto';

  @override
  String get setAbout => 'Über';

  @override
  String aboutVersion(String version) {
    return 'Version $version';
  }

  @override
  String get aboutFamily =>
      'Teil der Mastertool-Familie: SSH Master · FTP Masters · SQL Master · Notepad Master · Convert Master · IP Tools';

  @override
  String get aboutCheckUpdate => 'Nach Updates suchen';

  @override
  String get aboutChecking => 'Wird geprüft…';

  @override
  String aboutUpToDate(String app) {
    return '$app ist auf dem neuesten Stand.';
  }

  @override
  String aboutCheckFailed(String msg) {
    return 'Updates konnten nicht geprüft werden: $msg';
  }

  @override
  String get aboutLicenses => 'Open-Source-Lizenzen';

  @override
  String aboutLicensesIntro(String app) {
    return '$app verwendet die folgenden Open-Source-Komponenten:';
  }

  @override
  String authErrAppDisabled(String app) {
    return '$app wurde für dieses Konto von einem Administrator deaktiviert. Wenden Sie sich an Ihren Kontoadministrator.';
  }

  @override
  String authErrWrongApp(String app) {
    return 'Diese Sitzung gehört zu einer anderen Anwendung. Bitte melden Sie sich erneut bei $app an.';
  }

  @override
  String get authSignedOut =>
      'Sie haben sich in einer Mastertool-App auf diesem Computer abgemeldet. Bitte melden Sie sich erneut an.';

  @override
  String get authSubtitle => 'Mit Ihrem Konto anmelden';

  @override
  String get authEmail => 'E-Mail';

  @override
  String get authPassword => 'Passwort';

  @override
  String get authRemember => 'Angemeldet bleiben';

  @override
  String get authForgot => 'Passwort vergessen';

  @override
  String get authNoAccount => 'Noch kein Konto?';

  @override
  String get authRegister => 'Konto erstellen';

  @override
  String get authSubmit => 'Anmelden';

  @override
  String get authWorking => 'Anmeldung…';

  @override
  String get authErrRequired => 'E-Mail und Passwort sind erforderlich.';

  @override
  String get authErrBadCredentials => 'E-Mail oder Passwort falsch.';

  @override
  String get authErrUnverified =>
      'Ihre E-Mail-Adresse ist noch nicht bestätigt. Klicken Sie auf den Link in Ihrem Posteingang.';

  @override
  String get authErrSuspended => 'Ihr Konto ist gesperrt.';

  @override
  String get authErrRateLimited =>
      'Zu viele Versuche. Versuchen Sie es in einer Minute erneut.';

  @override
  String get authErrOffline =>
      'Server nicht erreichbar. Prüfen Sie Ihre Internetverbindung.';

  @override
  String get authErrSessionExpired =>
      'Ihre Sitzung ist abgelaufen oder Ihr Passwort wurde geändert. Bitte melden Sie sich erneut an.';

  @override
  String authErrServer(String msg) {
    return 'Anmeldung nicht möglich: $msg';
  }

  @override
  String get acctSection => 'Konto und Synchronisierung';

  @override
  String acctSignedInAs(String email) {
    return 'Angemeldet als $email';
  }

  @override
  String get acctSyncToggle => 'Verbindungen mit dem Web synchronisieren';

  @override
  String get acctSyncHint =>
      'Verbindungen, Ordner und Shortcuts werden Ende-zu-Ende-verschlüsselt in Ihrem Konto gesichert; der Server kann sie nicht lesen. Geräteeinstellungen wie Schriftgröße und Infobereich werden nicht übertragen.';

  @override
  String acctLastSync(String time) {
    return 'Zuletzt synchronisiert: $time';
  }

  @override
  String get acctNever => 'Noch nicht synchronisiert';

  @override
  String get acctSyncNow => 'Jetzt synchronisieren';

  @override
  String get acctDeleteRemote => 'Serverkopie löschen';

  @override
  String get acctDeleteRemoteMsg =>
      'Die verschlüsselte Bibliothekskopie in Ihrem Konto wird gelöscht und die Synchronisierung ausgeschaltet. Die Verbindungen auf diesem Computer bleiben erhalten.';

  @override
  String get acctDeleteRemoteDone =>
      'Serverkopie gelöscht; Synchronisierung ausgeschaltet';

  @override
  String get acctLogout => 'Abmelden';

  @override
  String get acctLogoutMsg =>
      'Sie werden abgemeldet. Verbindungen und Projekte auf diesem Gerät bleiben erhalten.';

  @override
  String get acctMyAccount => 'Mein Konto (Web)';

  @override
  String get acctBackupNotice =>
      'Mit einem anderen Konto angemeldet; die bisherigen Verbindungen auf diesem Computer wurden gesichert.';

  @override
  String get syncOff => 'Synchronisierung aus';

  @override
  String get syncSyncing => 'Wird synchronisiert…';

  @override
  String get syncOffline =>
      'Offline — Änderungen werden gesendet, sobald Sie wieder online sind';

  @override
  String get syncErrDecrypt =>
      'Die Serverkopie konnte mit dem Schlüssel dieses Kontos nicht entschlüsselt werden; die Verbindungen auf diesem Computer bleiben erhalten.';

  @override
  String get syncErrTooLarge =>
      'Die Bibliothek überschreitet das Limit von 5 MB und konnte nicht synchronisiert werden.';

  @override
  String syncError(String msg) {
    return 'Synchronisierungsfehler: $msg';
  }

  @override
  String get commonCancel => 'Abbrechen';

  @override
  String get commonSave => 'Speichern';

  @override
  String get commonCreate => 'Erstellen';

  @override
  String get commonOk => 'OK';

  @override
  String get commonDelete => 'Löschen';

  @override
  String get commonGiveUp => 'Abbrechen';

  @override
  String get commonOpen => 'Öffnen';

  @override
  String get commonEdit => 'Bearbeiten';

  @override
  String get commonRename => 'Umbenennen';

  @override
  String get commonRefresh => 'Aktualisieren';

  @override
  String get commonNewFolder => 'Neuer Ordner';

  @override
  String get commonCopyPath => 'Pfad kopieren';

  @override
  String get commonMove => 'Verschieben';

  @override
  String get commonMoveEllipsis => 'Verschieben…';

  @override
  String get commonShow => 'Anzeigen';

  @override
  String get commonChoose => 'Durchsuchen…';

  @override
  String get commonConnect => 'Verbinden';

  @override
  String get commonNew => 'Neu';

  @override
  String get commonCopy => 'Kopieren';

  @override
  String get commonPaste => 'Einfügen';

  @override
  String commonLocation(String path) {
    return 'Ort: $path';
  }

  @override
  String get commonNewName => 'Neuer Name';

  @override
  String get commonFolderName => 'Ordnername';

  @override
  String get setTitle => 'Einstellungen';

  @override
  String get setAppearance => 'Darstellung';

  @override
  String get setTheme => 'Design';

  @override
  String get setThemeDark => 'Nacht';

  @override
  String get setThemeLight => 'Tag';

  @override
  String get setThemeSystem => 'Systemeinstellung';

  @override
  String get setLanguage => 'Sprache';

  @override
  String get setLanguageHint => 'Die Sprache wird sofort übernommen.';

  @override
  String get setSaved => 'Einstellungen gespeichert';

  @override
  String get mobModules => 'Module';

  @override
  String get mobDisabled => 'In Ihrem Konto deaktiviert';

  @override
  String get mobSoon => 'Dieses Modul ist in Vorbereitung';

  @override
  String get mobOpen => 'Öffnen';

  @override
  String get mobRefresh => 'Aktualisieren';

  @override
  String get mobSettings => 'Einstellungen';

  @override
  String mobWelcome(String name) {
    return 'Willkommen, $name';
  }

  @override
  String get mobNoModules =>
      'Module konnten nicht geladen werden. Verbindung prüfen und aktualisieren.';

  @override
  String get mobSite => 'mastertool.download';

  @override
  String get mobLangSystem => 'Systemsprache';

  @override
  String get mobSsoHint =>
      'Einmal anmelden genügt: SSH Master, FTP Masters, SQL Master, Notepad Master, Convert Master und IP Tools öffnen sich in dieser App.';

  @override
  String mobOpenCount(String open, String total) {
    return '$open/$total Module aktiv';
  }

  @override
  String get mobModulesHint => 'Tippen zum Öffnen';

  @override
  String get mobTapToOpen => 'Einsatzbereit';

  @override
  String get mobVisitSite => 'Website besuchen';

  @override
  String get smAppSearchPh => 'Verbindungen durchsuchen…  (Strg+F)';

  @override
  String get smAppNewConn => 'Neue Verbindung';

  @override
  String smAppSplit(String n) {
    return 'Geteilt öffnen ($n)';
  }

  @override
  String get smAppSplitTitle =>
      'Ausgewählte Verbindungen geteilt in einem Fenster öffnen';

  @override
  String get smAppSettings => 'Einstellungen';

  @override
  String smAppStats(String c, String f) {
    return '$c Verbindungen · $f Ordner';
  }

  @override
  String get smAppWelcome => 'Willkommen';

  @override
  String smAppResults(String q) {
    return 'Ergebnisse für „$q“';
  }

  @override
  String get smAppAll => 'Alle Verbindungen';

  @override
  String get smAppWelcomeHint =>
      'Erstellen Sie Ihre erste SSH-Verbindung.<br>Serverdaten eingeben, testen und speichern.';

  @override
  String get smAppFolders => 'Ordner';

  @override
  String get smAppConnections => 'Verbindungen';

  @override
  String get smAppMultiHint =>
      'Mit Strg+Klick mehrere auswählen und geteilt in einem Fenster öffnen';

  @override
  String get smAppNoMatch => 'Keine passenden Verbindungen.';

  @override
  String smAppFolderCount(String n) {
    return '$n Verbindungen';
  }

  @override
  String get smAppFolderOpenSplit => 'Verbindungen des Ordners geteilt öffnen';

  @override
  String get smAppNewConnHere => 'Neue Verbindung in diesem Ordner';

  @override
  String get smAppNewSubfolder => 'Unterordner erstellen';

  @override
  String get smAppKeyTag => 'Schlüssel';

  @override
  String get smAppLastDir => 'Letzter Ordner';

  @override
  String get smAppLastDirTag => 'letzter Ordner';

  @override
  String smAppMultiOpenSplit(String n) {
    return '$n Verbindungen geteilt in einem Fenster öffnen';
  }

  @override
  String get smAppOpenSeparate => 'Jede in einem eigenen Fenster öffnen';

  @override
  String get smAppClearSelection => 'Auswahl aufheben';

  @override
  String get smAppSideBySide => 'Zwei Sitzungen nebeneinander öffnen';

  @override
  String get smAppDuplicate => 'Duplizieren';

  @override
  String get smAppMoveToFolder => 'In Ordner verschieben…';

  @override
  String get smAppResetLastDir => 'Letzten Ordner zurücksetzen';

  @override
  String get smAppConnMoved => 'Verbindung verschoben';

  @override
  String get smAppFolderIntoSelf =>
      'Ein Ordner kann nicht in seinen eigenen Unterordner verschoben werden';

  @override
  String get smAppFolderPh => 'z. B. Produktivserver';

  @override
  String get smAppRenameFolder => 'Ordner umbenennen';

  @override
  String get smAppDeleteFolder => 'Ordner löschen';

  @override
  String smAppDeleteFolderMsg(String name) {
    return 'Der Ordner <b>$name</b> wird gelöscht.';
  }

  @override
  String smAppDeleteFolderConns(String n) {
    return ' Seine $n Verbindungen werden nicht gelöscht, sondern eine Ebene nach oben verschoben.';
  }

  @override
  String get smAppRootFolder => 'Alle Verbindungen (Stamm)';

  @override
  String smAppMoveTitle(String name) {
    return '„$name“ verschieben';
  }

  @override
  String get smAppTargetFolder => 'Zielordner';

  @override
  String get smAppDeleteConn => 'Verbindung löschen';

  @override
  String smAppDeleteConnMsg(String name, String target) {
    return '<b>$name</b> ($target) wird dauerhaft gelöscht.';
  }

  @override
  String get smAppMaxPanes => 'Es können höchstens 6 Bereiche geöffnet werden';

  @override
  String get smAppMaxPanesSub => 'Die ersten 6 Verbindungen wurden geöffnet';

  @override
  String get smFormTitleNew => 'Neue SSH-Verbindung';

  @override
  String get smFormTitleEdit => 'Verbindung bearbeiten';

  @override
  String get smFormName => 'Verbindungsname';

  @override
  String get smFormNamePh => 'z. B. Webserver';

  @override
  String get smFormHost => 'IP-Adresse / Host';

  @override
  String get smFormHostPh => '192.168.1.10 oder server.de';

  @override
  String get smFormPort => 'Port';

  @override
  String get smFormUser => 'Benutzername';

  @override
  String get smFormAuth => 'Authentifizierung';

  @override
  String get smFormPassword => 'Passwort';

  @override
  String get smFormPrivateKey => 'Privater Schlüssel';

  @override
  String get smFormPwSaved => '•••••••• (gespeichert — zum Ändern eingeben)';

  @override
  String get smFormKeyFile => 'Schlüsseldatei';

  @override
  String get smFormPassphrase => 'Schlüssel-Passphrase (falls vorhanden)';

  @override
  String get smFormPassSaved => '•••••••• (gespeichert)';

  @override
  String get smFormPassEmpty => 'Leer lassen, falls keine';

  @override
  String get smFormFolder => 'Ordner';

  @override
  String get smFormColor => 'Farbe';

  @override
  String get smFormPalette => 'Konsolen-Farbpalette';

  @override
  String get smFormLastDir => 'Zum zuletzt verwendeten Ordner wechseln';

  @override
  String get smFormLastDirHint =>
      'Beim Verbinden öffnen sich Terminal und Dateimanager im zuletzt verwendeten Ordner.';

  @override
  String get smFormLastDirNow => 'Aktuell:';

  @override
  String get smFormConnecting => 'Verbinde…';

  @override
  String get smFormTestOk => 'Verbindung erfolgreich';

  @override
  String smFormHostKey(String fp) {
    return 'Host-Schlüssel (SHA256): $fp';
  }

  @override
  String get smFormTestFail => 'Verbindung fehlgeschlagen';

  @override
  String get smFormSaved => 'Verbindung gespeichert';

  @override
  String get smFormChangesSaved => 'Änderungen gespeichert';

  @override
  String get smFormTest => 'Verbindung testen';

  @override
  String get smFormSaveConnect => 'Speichern und verbinden';

  @override
  String get smPaneToggleSidebar => 'Seitenleiste ein/aus (Strg+B)';

  @override
  String get smPaneDefaultName => 'Verbindung';

  @override
  String get smPaneSplitRight => 'Rechts teilen';

  @override
  String get smPaneSplitDown => 'Unten teilen';

  @override
  String get smPaneReconnect => 'Neu verbinden';

  @override
  String get smPaneClose => 'Bereich schließen';

  @override
  String get smPaneSaveSelShortcut => 'Auswahl als Shortcut speichern';

  @override
  String get smPanePaletteMenu => 'Konsolen-Farbpalette…';

  @override
  String get smPaneSelectAll => 'Alles auswählen';

  @override
  String get smPaneClear => 'Bildschirm leeren';

  @override
  String get smPaneStatusConnecting => 'verbinde…';

  @override
  String get smPaneStatusNoConn => 'nicht verbunden';

  @override
  String get smPaneStatusClosed => 'Verbindung geschlossen';

  @override
  String get smTermConnecting => 'Verbinde…';

  @override
  String get smTermConnectFailed => 'Verbindung nicht möglich:';

  @override
  String get smTermRetryEnter =>
      'Eingabetaste drücken, um es erneut zu versuchen.';

  @override
  String get smTermClosed => 'Verbindung geschlossen.';

  @override
  String get smTermReconnectEnter =>
      'Eingabetaste drücken, um neu zu verbinden.';

  @override
  String smTermMaxPanes(String n) {
    return 'In einem Fenster können höchstens $n Bereiche geöffnet werden';
  }

  @override
  String smTermSessions(String n) {
    return '$n Sitzungen';
  }

  @override
  String get smTermToggleAll => 'Alle Seitenleisten ein/aus';

  @override
  String get smTermSplitRightTitle =>
      'Aktiven Bereich rechts teilen (Strg+Umschalt+E)';

  @override
  String get smTermSplitDownTitle =>
      'Aktiven Bereich unten teilen (Strg+Umschalt+O)';

  @override
  String get smTermSyncOn => 'Eingabe an alle Bereiche';

  @override
  String get smTermSyncOff => 'An alle Bereiche tippen';

  @override
  String get smTermSyncTitle =>
      'Ihre Eingabe wird an alle verbundenen Bereiche gesendet';

  @override
  String get smPickerSearch => 'Verbindung suchen…';

  @override
  String get smPickerSameServer => 'gleicher Server';

  @override
  String get smPickerNone => 'Keine passenden Verbindungen';

  @override
  String get smPickerTitleRight => 'Rechts teilen — Verbindung wählen';

  @override
  String get smPickerTitleDown => 'Unten teilen — Verbindung wählen';

  @override
  String get smPaletteTitle => 'Konsolen-Farbpalette';

  @override
  String smPaletteHint(String name) {
    return 'Die gewählte Palette wird sofort in diesem Bereich angezeigt. Wenn Sie sie speichern, verwenden alle Sitzungen dieser Verbindung ($name) sie.';
  }

  @override
  String get smPaletteSaved => 'Farbpalette gespeichert';

  @override
  String get smScTitleNew => 'Neuer Shortcut';

  @override
  String get smScTitleEdit => 'Shortcut bearbeiten';

  @override
  String get smScName => 'Shortcut-Name';

  @override
  String get smScNamePh => 'z. B. Nginx neu starten';

  @override
  String get smScCommand => 'Befehl';

  @override
  String get smScEnter => 'Nach dem Einfügen Eingabetaste drücken';

  @override
  String get smScEnterHint =>
      'Wenn aus, wird der Befehl nur an der Cursorposition eingegeben und Sie führen ihn selbst aus.';

  @override
  String get smScEmpty =>
      'Noch keine Shortcuts.<br>Fügen Sie häufig verwendete Befehle mit <b>+</b> hinzu und fügen Sie sie per Doppelklick ins Terminal ein.';

  @override
  String get smScItemTitle =>
      'Doppelklick: in das Terminal dieses Bereichs einfügen';

  @override
  String get smScAutoEnter => 'Auto-Eingabe';

  @override
  String get smScPaste => 'Ins Terminal einfügen';

  @override
  String get smScPasteNoEnter => 'Ohne Eingabetaste einfügen';

  @override
  String get smScPasteRun => 'Einfügen und ausführen';

  @override
  String get smScCopy => 'In die Zwischenablage kopieren';

  @override
  String get smScNew => 'Neuer Shortcut';

  @override
  String get smSbShortcuts => 'Shortcuts';

  @override
  String get smSbAddShortcut => 'Shortcut hinzufügen';

  @override
  String get smSbServer => 'Server';

  @override
  String smSbServerHost(String host) {
    return 'Server · $host';
  }

  @override
  String get smSbFollow => 'Terminalordner folgen';

  @override
  String get smSbHome => 'Home-Ordner';

  @override
  String get smSbUp => 'Übergeordneter Ordner';

  @override
  String get smSbComputer => 'Dieser PC';

  @override
  String get smSbPlaces => 'Laufwerke und Orte';

  @override
  String get smSbResize => 'Zum Ändern der Breite ziehen';

  @override
  String get smFmLoading => 'Wird geladen…';

  @override
  String smFmOpenFailed(String msg) {
    return 'Öffnen nicht möglich: $msg';
  }

  @override
  String get smFmEmpty => 'Ordner ist leer';

  @override
  String get smFmNoConn => 'Nicht verbunden.';

  @override
  String get smFmClosed => 'Verbindung geschlossen.';

  @override
  String get smFmWaiting => 'Warte auf Verbindung…';

  @override
  String smFmDownloadTo(String path) {
    return 'Herunterladen → $path';
  }

  @override
  String smFmUploadTo(String path) {
    return 'Hochladen → $path';
  }

  @override
  String get smFmServer => 'Server';

  @override
  String get smFmCdHere => 'Im Terminal zu diesem Ordner wechseln';

  @override
  String get smFmPastePath => 'Pfad ins Terminal einfügen';

  @override
  String smFmDeleteWhat(String what) {
    return 'Löschen ($what)';
  }

  @override
  String smFmNItems(String n) {
    return '$n Elemente';
  }

  @override
  String get smFmOpenDefault => 'Mit Standard-App öffnen';

  @override
  String get smFmReveal => 'Im Explorer anzeigen';

  @override
  String get smFmOpenExplorer => 'Im Explorer öffnen';

  @override
  String get smFmFollowing => 'Der Dateimanager folgt dem Terminalordner';

  @override
  String get smFmFollowOff => 'Folgen deaktiviert';

  @override
  String get smFmNewRemote => 'Neuer Ordner auf dem Server';

  @override
  String get smFmDeleteTitle => 'Vom Server löschen';

  @override
  String smFmAndMore(String n) {
    return ' und $n weitere';
  }

  @override
  String smFmDeleteMsg(String names) {
    return '$names wird <b>dauerhaft</b> vom Server gelöscht. Ordner werden samt Inhalt gelöscht.';
  }

  @override
  String get smPlaceDesktop => 'Desktop';

  @override
  String get smPlaceDownloads => 'Downloads';

  @override
  String get smPlaceDocuments => 'Dokumente';

  @override
  String get smPlaceHome => 'Benutzerordner';

  @override
  String smPlaceDrive(String d) {
    return 'Lokaler Datenträger ($d)';
  }

  @override
  String get smErrNoConn => 'Nicht verbunden';

  @override
  String get smErrConnectFirst => 'Verbinden Sie sich zuerst mit dem Server';

  @override
  String get smErrMkdir => 'Ordner konnte nicht erstellt werden';

  @override
  String get smErrRename => 'Umbenennen nicht möglich';

  @override
  String smErrDelete(String name) {
    return 'Löschen nicht möglich: $name';
  }

  @override
  String get smTrPanelTitle => 'Übertragungen';

  @override
  String get smTrClearDone => 'Abgeschlossene entfernen';

  @override
  String get smTrQueued => 'In Warteschlange';

  @override
  String get smTrScanning => 'Dateien werden gescannt…';

  @override
  String smTrFileCount(String i, String n) {
    return '$i / $n Dateien';
  }

  @override
  String smTrEta(String time) {
    return 'noch ~$time';
  }

  @override
  String smTrDownloading(String name) {
    return 'Herunterladen: $name';
  }

  @override
  String smTrUploading(String name) {
    return 'Hochladen: $name';
  }

  @override
  String get smTrDone => 'Abgeschlossen';

  @override
  String get smTrCancelled => 'Abgebrochen';

  @override
  String get smTrFailed => 'Fehlgeschlagen';

  @override
  String get smTrRemoveFromList => 'Aus der Liste entfernen';

  @override
  String get smTrAlwaysBackground =>
      'Große Übertragungen ab jetzt immer im Hintergrund anzeigen';

  @override
  String get smTrShowInBackground => 'Im Hintergrund fortsetzen';

  @override
  String get smTrDownloadDone => 'Download abgeschlossen';

  @override
  String get smTrUploadDone => 'Upload abgeschlossen';

  @override
  String smTrDownloadFailed(String name) {
    return 'Download fehlgeschlagen: $name';
  }

  @override
  String smTrUploadFailed(String name) {
    return 'Upload fehlgeschlagen: $name';
  }

  @override
  String get smTrCancelledToast => 'Übertragung abgebrochen';

  @override
  String smTimeHm(String h, String m) {
    return '$h Std. $m Min.';
  }

  @override
  String smTimeMs(String m, String s) {
    return '$m Min. $s Sek.';
  }

  @override
  String smTimeS(String s) {
    return '$s Sek.';
  }

  @override
  String get smMainErrAuth =>
      'Authentifizierung fehlgeschlagen: Benutzername oder Passwort falsch.';

  @override
  String get smMainErrRefused =>
      'Verbindung abgelehnt: Port geschlossen oder SSH-Dienst läuft nicht.';

  @override
  String get smMainErrTimeout => 'Zeitüberschreitung: Server nicht erreichbar.';

  @override
  String get smMainErrDns => 'Hostname konnte nicht aufgelöst werden (DNS).';

  @override
  String get smMainErrUnreach =>
      'Server ist über das Netzwerk nicht erreichbar.';

  @override
  String get smMainErrKeyFile => 'Schlüsseldatei nicht gefunden.';

  @override
  String smMainErrHostKey(String newFp, String oldFp) {
    return 'Der Host-Schlüssel des Servers hat sich geändert! Gespeichert: $oldFp, empfangen: $newFp. Verbindung aus Sicherheitsgründen abgelehnt.';
  }

  @override
  String get smMainErrConnNotFound => 'Verbindung nicht gefunden';

  @override
  String get smMainErrNoSession => 'Keine aktive SSH-Sitzung';

  @override
  String get smMainErrHostUser =>
      'Serveradresse und Benutzername sind erforderlich.';

  @override
  String get smMainTrayShow => 'SSH Master anzeigen';

  @override
  String get smMainTrayQuick => 'Schnellverbindung';

  @override
  String get smMainTrayNone => 'Keine gespeicherten Verbindungen';

  @override
  String get smMainTrayQuit => 'Beenden';

  @override
  String get smMainBalloonTitle => 'SSH Master läuft im Hintergrund';

  @override
  String get smMainBalloonBody =>
      'Klicken Sie auf das Symbol im Infobereich, um es wieder zu öffnen.';

  @override
  String get smMainPickKey => 'Private Schlüsseldatei wählen';

  @override
  String get smMainCopySuffix => ' (Kopie)';

  @override
  String get smMainDefDisk => 'Festplattennutzung';

  @override
  String get smMainDefMem => 'Arbeitsspeicher';

  @override
  String get smMainDefTop => 'Prozesse (top)';

  @override
  String get smAppNotesLabel => 'Notizen';

  @override
  String get fmAppSearchPh => 'Verbindungen durchsuchen…  (Ctrl+F)';

  @override
  String get fmAppNewConn => 'Neue Verbindung';

  @override
  String get fmAppSettings => 'Einstellungen';

  @override
  String fmAppStats(String c, String f) {
    return '$c Verbindungen · $f Ordner';
  }

  @override
  String get fmAppWelcome => 'Willkommen';

  @override
  String fmAppResults(String q) {
    return 'Ergebnisse für „$q“';
  }

  @override
  String get fmAppAll => 'Alle Verbindungen';

  @override
  String get fmAppWelcomeHint =>
      'Erstellen Sie Ihre erste FTP-/SFTP-Verbindung.<br>Serverdaten eingeben, Verbindung testen und speichern.';

  @override
  String get fmAppFolders => 'Ordner';

  @override
  String get fmAppConnections => 'Verbindungen';

  @override
  String get fmAppDblHint => 'Zum Verbinden auf eine Karte doppelklicken';

  @override
  String get fmAppNoMatch => 'Keine passenden Verbindungen.';

  @override
  String fmAppFolderCount(String n) {
    return '$n Verbindungen';
  }

  @override
  String get fmAppNewConnHere => 'Neue Verbindung in diesem Ordner';

  @override
  String get fmAppNewSubfolder => 'Neuer Unterordner';

  @override
  String get fmAppKeyTag => 'Schlüssel';

  @override
  String get fmAppLastDir => 'Letzter Ordner';

  @override
  String get fmAppLastDirTag => 'letzter Ordner';

  @override
  String get fmAppDuplicate => 'Duplizieren';

  @override
  String get fmAppMoveToFolder => 'In Ordner verschieben…';

  @override
  String get fmAppResetLastDir => 'Letzten Ordner zurücksetzen';

  @override
  String get fmAppConnMoved => 'Verbindung verschoben';

  @override
  String get fmAppFolderIntoSelf =>
      'Ein Ordner kann nicht in sich selbst verschoben werden';

  @override
  String get fmAppFolderPh => 'z. B. Kunden';

  @override
  String get fmAppRenameFolder => 'Ordner umbenennen';

  @override
  String get fmAppDeleteFolder => 'Ordner löschen';

  @override
  String fmAppDeleteFolderMsg(String name) {
    return 'Ordner <b>$name</b> löschen?';
  }

  @override
  String fmAppDeleteFolderConns(String n) {
    return '<br>Seine $n Verbindungen werden in den übergeordneten Ordner verschoben.';
  }

  @override
  String get fmAppRootFolder => 'Oberste Ebene (kein Ordner)';

  @override
  String fmAppMoveTitle(String name) {
    return '„$name“ verschieben';
  }

  @override
  String get fmAppTargetFolder => 'Zielordner';

  @override
  String get fmAppDeleteConn => 'Verbindung löschen';

  @override
  String fmAppDeleteConnMsg(String name, String target) {
    return 'Verbindung <b>$name</b> ($target) löschen?';
  }

  @override
  String get fmFormTitleNew => 'Neue Verbindung';

  @override
  String fmFormTitleEdit(String name) {
    return 'Verbindungseigenschaften: $name';
  }

  @override
  String get fmFormTabGeneral => 'Allgemein';

  @override
  String get fmFormTabActions => 'Aktionen';

  @override
  String get fmFormTabType => 'Typ';

  @override
  String get fmFormTabOptions => 'Optionen';

  @override
  String get fmFormName => 'Bezeichnung';

  @override
  String get fmFormNamePh => 'z. B. Firmenwebsite';

  @override
  String get fmFormHost => 'Hostadresse';

  @override
  String get fmFormHostPh => 'ftp.example.com oder 192.168.1.10';

  @override
  String get fmFormPort => 'Port';

  @override
  String get fmFormUser => 'Benutzername';

  @override
  String get fmFormPassword => 'Passwort';

  @override
  String get fmFormPwSaved => '•••••••• (gespeichert, zum Ändern eingeben)';

  @override
  String get fmFormLoginMethod => 'Anmeldeart';

  @override
  String get fmFormLoginNormal => 'Normal';

  @override
  String get fmFormLoginAnon => 'Anonym';

  @override
  String get fmFormAuth => 'SFTP-Authentifizierung';

  @override
  String get fmFormPrivateKey => 'Privater Schlüssel';

  @override
  String get fmFormKeyFile => 'Private Schlüsseldatei';

  @override
  String get fmFormPassphrase => 'Schlüssel-Passphrase';

  @override
  String get fmFormPassSaved => '(gespeichert)';

  @override
  String get fmFormPassEmpty => 'Leer lassen, falls keine';

  @override
  String get fmFormFolder => 'Ordner';

  @override
  String get fmFormColor => 'Farbe';

  @override
  String get fmFormComments => 'Kommentare';

  @override
  String get fmFormRemoteDir =>
      'Nach dem Verbinden zu diesem Serverordner wechseln';

  @override
  String get fmFormLocalDir =>
      'Nach dem Verbinden zu diesem lokalen Ordner wechseln';

  @override
  String get fmFormLocalDirPh => 'z. B. C:\\Projekte\\site';

  @override
  String get fmFormLastDir => 'Zum zuletzt verwendeten Ordner wechseln';

  @override
  String get fmFormLastDirHint =>
      'Wenn aktiviert, öffnet sich die Verbindung in den zuletzt verwendeten Server- und Computerordnern (statt in den oben angegebenen Ordnern).';

  @override
  String get fmFormLastDirNow => 'Aktuell:';

  @override
  String get fmFormCache => 'Zwischenspeicher für die Navigation';

  @override
  String get fmFormCacheSession =>
      'Zwischenspeicher während der Sitzung verwenden';

  @override
  String get fmFormCacheAlways =>
      'Zwischenspeicher immer verwenden (solange die App geöffnet ist)';

  @override
  String get fmFormCacheNever =>
      'Zwischenspeicher nie verwenden (immer neu auflisten)';

  @override
  String get fmFormUploadCase =>
      'Beim Hochladen diese Regel auf Datei- und Ordnernamen anwenden';

  @override
  String get fmFormCasePreserve => 'Groß-/Kleinschreibung beibehalten';

  @override
  String get fmFormCaseLower => 'Kleinbuchstaben';

  @override
  String get fmFormCaseUpper => 'Großbuchstaben';

  @override
  String get fmFormTest => 'Verbindung testen';

  @override
  String get fmFormSaveConnect => 'Speichern und verbinden';

  @override
  String get fmFormConnecting => 'Verbinde…';

  @override
  String get fmFormTestOk => 'Verbindung erfolgreich';

  @override
  String get fmFormTestFail => 'Verbindung nicht möglich';

  @override
  String fmFormHomeDir(String dir) {
    return 'Startordner: $dir';
  }

  @override
  String get fmFormRemoteDirMissing =>
      'Warnung: Der Serverordner konnte nicht geöffnet werden.';

  @override
  String fmFormHostKey(String fp) {
    return 'SSH-Host-Schlüssel (SHA256): $fp';
  }

  @override
  String get fmFormSaved => 'Verbindung gespeichert';

  @override
  String get fmFormChangesSaved => 'Änderungen gespeichert';

  @override
  String get fmTypeProtocol => 'Protokoll';

  @override
  String get fmTypeFtp => 'FTP (Standard-Dateiübertragungsprotokoll)';

  @override
  String get fmTypeFtpsImplicit => 'FTP mit TLS/SSL (implizit, Port 990)';

  @override
  String get fmTypeFtpsSsl => 'FTP mit SSL (AUTH SSL, explizit)';

  @override
  String get fmTypeFtpsTls => 'FTP mit TLS/SSL (AUTH TLS, explizit)';

  @override
  String get fmTypeSftp => 'SFTP über SSH2 (Secure Shell)';

  @override
  String get fmTypeNoteFtp =>
      'Verwendet das Standardprotokoll FTP für Befehls- und Datenverbindungen unverschlüsselt (Klartext).';

  @override
  String get fmTypeNoteFtpsImplicit =>
      'Die Verbindung ist von Anfang an mit TLS/SSL verschlüsselt (meist Port 990). Befehle und Daten sind geschützt.';

  @override
  String get fmTypeNoteFtpsSsl =>
      'Verbindet per einfachem FTP und wechselt mit AUTH SSL zu einer verschlüsselten Sitzung. Befehle und Daten sind geschützt.';

  @override
  String get fmTypeNoteFtpsTls =>
      'Verbindet per einfachem FTP und wechselt mit AUTH TLS zu einer verschlüsselten Sitzung (der gängigste FTPS-Typ).';

  @override
  String get fmTypeNoteSftp =>
      'Verschlüsselte Dateiübertragung über SSH (Port 22). Anmeldung per Passwort oder privatem Schlüssel; der Host-Schlüssel wird bei der ersten Verbindung gespeichert.';

  @override
  String get fmTypeTransferType => 'Übertragungsart';

  @override
  String get fmTypeBinary => 'Binär';

  @override
  String get fmTypeAscii => 'ASCII (Text)';

  @override
  String get fmTypeAuto => 'Automatisch (Textdateien als ASCII)';

  @override
  String fmTypeUseGlobal(String v) {
    return 'Globale Einstellung verwenden ($v)';
  }

  @override
  String get fmTypeDataConn => 'Datenverbindung';

  @override
  String get fmTypePassive => 'Passiv (PASV / EPSV)';

  @override
  String get fmTypeTimezone => 'Zeitzonenversatz des Servers';

  @override
  String get fmTypeTzNone => 'Kein Versatz';

  @override
  String get fmTypeTzHours => 'Stunden';

  @override
  String get fmTypeTimezoneHint =>
      'Die vom Server gemeldeten Dateizeiten werden um diesen Wert verschoben.';

  @override
  String get fmOptSiteOptions => 'Verbindungsspezifische Optionen';

  @override
  String get fmOptUseGlobal =>
      'Globale Einstellungen für alle Optionen verwenden';

  @override
  String get fmOptCustom =>
      'Eigene Einstellungen für diese Verbindung verwenden';

  @override
  String get fmOptRetry => 'Wiederholungsversuche';

  @override
  String get fmOptRetryDelay => 'Pause zwischen Versuchen (s)';

  @override
  String get fmOptMaxConcurrent => 'Max. gleichzeitige Übertragungen';

  @override
  String get fmOptConflict => 'Wenn eine Datei mit gleichem Namen existiert';

  @override
  String get fmOptConflictOverwrite => 'Überschreiben';

  @override
  String get fmOptConflictRename => 'Automatisch umbenennen (Name (1).ext)';

  @override
  String get fmOptConflictSkip => 'Überspringen';

  @override
  String get fmOptEncoding => 'Dateinamen-Kodierung';

  @override
  String get fmOptEncAuto => 'Automatisch';

  @override
  String get fmSiteLocal => 'Mein Computer';

  @override
  String get fmSiteRemote => 'Server';

  @override
  String get fmSiteTransfers => 'Übertragungen';

  @override
  String get fmSiteToggleLocal => 'Mein Computer ein-/ausblenden (Ctrl+B)';

  @override
  String get fmSiteToggleTransfers => 'Übertragungen ein-/ausblenden (Ctrl+J)';

  @override
  String get fmSiteReconnect => 'Neu verbinden';

  @override
  String get fmSitePlaces => 'Schnellzugriff und Laufwerke';

  @override
  String get fmSiteUp => 'Übergeordneter Ordner (Backspace)';

  @override
  String get fmSiteHome => 'Startordner';

  @override
  String get fmSiteColName => 'Name';

  @override
  String get fmSiteColSize => 'Größe';

  @override
  String get fmSiteColDate => 'Geändert';

  @override
  String get fmSiteLoading => 'Wird geladen…';

  @override
  String get fmSiteEmptyDir => 'Dieser Ordner ist leer';

  @override
  String get fmSiteDesktop => 'Desktop';

  @override
  String get fmSiteDownloads => 'Downloads';

  @override
  String get fmSiteDocuments => 'Dokumente';

  @override
  String get fmSiteHomeDir => 'Benutzerordner';

  @override
  String get fmSiteOpenExplorer => 'Im Explorer öffnen';

  @override
  String get fmSiteOpenFile => 'Mit Standard-App öffnen';

  @override
  String get fmSiteShowExplorer => 'Im Explorer anzeigen';

  @override
  String get fmSiteUpload => 'Hochladen';

  @override
  String fmSiteUploadN(String n) {
    return '$n Elemente hochladen';
  }

  @override
  String fmSiteUploadTo(String dir) {
    return 'Ziel: $dir';
  }

  @override
  String get fmSiteDownload => 'Herunterladen';

  @override
  String fmSiteDownloadN(String n) {
    return '$n Elemente herunterladen';
  }

  @override
  String fmSiteDownloadTo(String dir) {
    return 'Ziel: $dir';
  }

  @override
  String get fmSiteTrash => 'In den Papierkorb verschieben';

  @override
  String get fmSiteTrashOk => 'Verschieben';

  @override
  String fmSiteTrashOne(String name) {
    return '<b>$name</b> in den Papierkorb verschieben?';
  }

  @override
  String fmSiteTrashMany(String n) {
    return '$n Elemente in den Papierkorb verschieben?';
  }

  @override
  String get fmSiteMkdirFail => 'Ordner konnte nicht erstellt werden';

  @override
  String get fmSiteRenameFail => 'Umbenennen nicht möglich';

  @override
  String get fmSiteDeleteFail => 'Löschen nicht möglich';

  @override
  String get fmSiteDeleteTitle => 'Vom Server löschen';

  @override
  String fmSiteDelOne(String name) {
    return 'Datei <b>$name</b> endgültig vom Server löschen?';
  }

  @override
  String fmSiteDelDirOne(String name) {
    return 'Ordner <b>$name</b> samt Inhalt endgültig vom Server löschen?';
  }

  @override
  String fmSiteDelMany(String n) {
    return '$n Elemente (Ordner mit ihrem gesamten Inhalt) endgültig vom Server löschen?';
  }

  @override
  String get fmSiteDeleting => 'Wird gelöscht…';

  @override
  String get fmSiteDeleted => 'Gelöscht';

  @override
  String fmSiteItems(String n) {
    return '$n Elemente';
  }

  @override
  String get fmSiteOffline => 'Nicht verbunden';

  @override
  String fmSiteLimit(String v) {
    return 'Geschwindigkeitslimit: $v';
  }

  @override
  String get fmSiteNoLimit => 'Kein Geschwindigkeitslimit';

  @override
  String get fmSiteLimitTitle => 'Geschwindigkeitslimit festlegen';

  @override
  String fmSiteConnectFail(String msg) {
    return 'Verbindung zum Server nicht möglich: $msg';
  }

  @override
  String get fmSiteConnectFailTitle => 'Verbindung fehlgeschlagen';

  @override
  String get fmSiteStateConnected => 'Verbunden';

  @override
  String get fmSiteStateConnecting => 'Verbinde…';

  @override
  String get fmSiteStateDisconnected => 'Getrennt';

  @override
  String get fmTrColName => 'Name';

  @override
  String get fmTrColSize => 'Größe';

  @override
  String get fmTrColProgress => 'Fortschritt';

  @override
  String get fmTrColStatus => 'Status';

  @override
  String get fmTrEmpty =>
      'Noch keine Übertragungen.\nKlicken Sie mit der rechten Maustaste auf eine Datei oder einen Ordner und wählen Sie Herunterladen / Hochladen, oder ziehen Sie Elemente zwischen den Bereichen.';

  @override
  String get fmTrQueued => 'In Warteschlange';

  @override
  String get fmTrActive => 'Wird übertragen';

  @override
  String get fmTrDone => 'Abgeschlossen';

  @override
  String fmTrDoneFiles(String n) {
    return '$n Dateien abgeschlossen';
  }

  @override
  String get fmTrError => 'Fehler';

  @override
  String get fmTrCancelled => 'Abgebrochen';

  @override
  String get fmTrSkipped => 'Übersprungen (vorhanden)';

  @override
  String fmTrScanning(String n) {
    return 'Wird gescannt… $n Dateien';
  }

  @override
  String get fmTrRetrying => 'Neuer Versuch folgt…';

  @override
  String get fmTrCancel => 'Abbrechen';

  @override
  String get fmTrCancelDir => 'Ordnerübertragung abbrechen';

  @override
  String get fmTrCancelAll => 'Alle Übertragungen abbrechen';

  @override
  String get fmTrCancelAllMsg =>
      'Alle laufenden und wartenden Übertragungen abbrechen?';

  @override
  String get fmTrCancelAllOk => 'Alle abbrechen';

  @override
  String get fmTrRetry => 'Wiederholen';

  @override
  String get fmTrShowLocal => 'Im Explorer anzeigen';

  @override
  String get fmTrShowRemote => 'Auf dem Server anzeigen';

  @override
  String get fmTrCopyError => 'Fehlermeldung kopieren';

  @override
  String get fmTrRemove => 'Aus der Liste entfernen';

  @override
  String get fmTrRemoveRoot => 'Diese Übertragung aus der Liste entfernen';

  @override
  String get fmTrClearDone => 'Abgeschlossene entfernen';

  @override
  String fmTrActiveN(String n) {
    return '$n Übertragungen laufen';
  }

  @override
  String get fmTrDownloadDone => 'Download abgeschlossen';

  @override
  String get fmTrUploadDone => 'Upload abgeschlossen';

  @override
  String fmTrDownloadFailed(String name) {
    return 'Download unvollständig: $name';
  }

  @override
  String fmTrUploadFailed(String name) {
    return 'Upload unvollständig: $name';
  }

  @override
  String fmTrFailedFiles(String n) {
    return '$n Dateien fehlgeschlagen';
  }

  @override
  String get fmMainErrAuth =>
      'Anmeldung fehlgeschlagen: Benutzername oder Passwort falsch.';

  @override
  String get fmMainErrRefused =>
      'Verbindung abgelehnt: Port geschlossen oder Server läuft nicht.';

  @override
  String get fmMainErrTimeout => 'Zeitüberschreitung: Server nicht erreichbar.';

  @override
  String get fmMainErrDns => 'Hostname konnte nicht aufgelöst werden (DNS).';

  @override
  String get fmMainErrUnreach =>
      'Server ist über das Netzwerk nicht erreichbar.';

  @override
  String get fmMainErrReset => 'Der Server hat die Verbindung geschlossen.';

  @override
  String get fmMainErrNotFound => 'Datei oder Ordner nicht gefunden.';

  @override
  String get fmMainErrPerm => 'Zugriff verweigert.';

  @override
  String fmMainErr550(String msg) {
    return 'Der Server hat den Vorgang abgelehnt (550): $msg';
  }

  @override
  String get fmMainErr553 =>
      'Der Server hat den Dateinamen nicht akzeptiert (553).';

  @override
  String fmMainErrTls(String msg) {
    return 'TLS/SSL-Fehler — prüfen Sie Protokoll oder Port. ($msg)';
  }

  @override
  String fmMainErrHostKey(String newVal, String oldVal) {
    return 'Der Host-Schlüssel des Servers hat sich geändert! Gespeichert: $oldVal, empfangen: $newVal. Verbindung aus Sicherheitsgründen abgelehnt.';
  }

  @override
  String get fmMainErrConnNotFound => 'Verbindung nicht gefunden';

  @override
  String get fmMainErrNoSession => 'Keine Verbindung zum Server';

  @override
  String get fmMainErrHost => 'Hostadresse ist erforderlich.';

  @override
  String get fmMainErrUser =>
      'Benutzername ist erforderlich (oder wählen Sie die anonyme Anmeldung).';

  @override
  String get fmMainPickKey => 'Private Schlüsseldatei wählen';

  @override
  String get fmMainCopySuffix => ' (Kopie)';

  @override
  String get fmMainCloseActive =>
      'Es laufen noch Übertragungen. Sie werden abgebrochen, wenn Sie dieses Fenster schließen.';

  @override
  String get fmMainCloseAnyway => 'Trotzdem schließen';
}
