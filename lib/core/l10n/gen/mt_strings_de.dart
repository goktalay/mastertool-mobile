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
}
