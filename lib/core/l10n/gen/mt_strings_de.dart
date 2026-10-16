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

  @override
  String get sqAppSearchPh => 'Verbindungen suchen…  (Ctrl+F)';

  @override
  String get sqAppNewConn => 'Verbindung hinzufügen';

  @override
  String get sqAppAddConn => 'Verbindung hinzufügen';

  @override
  String get sqAppSettings => 'Einstellungen';

  @override
  String sqAppStats(String c, String f) {
    return '$c Verbindungen · $f Ordner';
  }

  @override
  String get sqAppWelcome => 'Willkommen';

  @override
  String sqAppResults(String q) {
    return 'Ergebnisse für „$q“';
  }

  @override
  String get sqAppAll => 'Alle Verbindungen';

  @override
  String get sqAppWelcomeHint =>
      'Verbinden Sie sich mit PostgreSQL, SQL Server, MySQL, SQLite oder CSV-/Parquet-/Excel-Dateien.<br>Geben Sie die Daten ein, testen Sie die Verbindung und speichern Sie.';

  @override
  String get sqAppFolders => 'Ordner';

  @override
  String get sqAppConnections => 'Verbindungen';

  @override
  String get sqAppDblHint => 'Zum Öffnen auf eine Karte doppelklicken';

  @override
  String get sqAppNoMatch => 'Keine passenden Verbindungen.';

  @override
  String sqAppFolderCount(String n) {
    return '$n Verbindungen';
  }

  @override
  String get sqAppNewConnHere => 'Neue Verbindung in diesem Ordner';

  @override
  String get sqAppNewSubfolder => 'Neuer Unterordner';

  @override
  String get sqAppDuplicate => 'Duplizieren';

  @override
  String get sqAppMoveToFolder => 'In Ordner verschieben…';

  @override
  String get sqAppConnMoved => 'Verbindung verschoben';

  @override
  String get sqAppFolderIntoSelf =>
      'Ein Ordner kann nicht in sich selbst verschoben werden';

  @override
  String get sqAppFolderPh => 'z. B. Kunden';

  @override
  String get sqAppRenameFolder => 'Ordner umbenennen';

  @override
  String get sqAppDeleteFolder => 'Ordner löschen';

  @override
  String sqAppDeleteFolderMsg(String name) {
    return 'Ordner <b>$name</b> löschen?';
  }

  @override
  String sqAppDeleteFolderConns(String n) {
    return '<br>Die $n Verbindungen darin werden in den übergeordneten Ordner verschoben.';
  }

  @override
  String get sqAppRootFolder => 'Oberste Ebene (kein Ordner)';

  @override
  String sqAppMoveTitle(String name) {
    return '„$name“ verschieben';
  }

  @override
  String get sqAppTargetFolder => 'Zielordner';

  @override
  String get sqAppDeleteConn => 'Verbindung löschen';

  @override
  String sqAppDeleteConnMsg(String name, String target) {
    return 'Verbindung <b>$name</b> ($target) löschen? Das gespeicherte Passwort wird ebenfalls entfernt.';
  }

  @override
  String get sqAppReadOnlyTag => 'Schreibgeschützt';

  @override
  String get sqAppWriteTag => 'Beschreibbar';

  @override
  String get sqFormTitleNew => 'Neue Verbindung';

  @override
  String sqFormTitleEdit(String name) {
    return 'Verbindung: $name';
  }

  @override
  String get sqFormTabGeneral => 'Allgemein';

  @override
  String get sqFormTabSecurity => 'Sicherheit';

  @override
  String get sqFormTabSsh => 'SSH-Tunnel';

  @override
  String get sqFormName => 'Bezeichnung (Anzeigename)';

  @override
  String get sqFormNamePh => 'z. B. Produktionsdatenbank';

  @override
  String get sqFormHost => 'Host';

  @override
  String get sqFormPort => 'Port';

  @override
  String get sqFormUser => 'Benutzername';

  @override
  String get sqFormPassword => 'Passwort';

  @override
  String get sqFormPwSaved => '•••••••• (gespeichert, zum Ändern eingeben)';

  @override
  String get sqFormDatabase => 'Datenbank';

  @override
  String get sqFormDatabasePh => 'Leer lassen für die Standarddatenbank';

  @override
  String get sqFormFile => 'Datenbankdatei';

  @override
  String get sqFormFilePh => 'C:\\Data\\app.db';

  @override
  String get sqFormSqliteHint =>
      'SQLite-Datenbankdatei (.db, .sqlite). Im schreibgeschützten Modus wird die Datei nie verändert.';

  @override
  String get sqFormDuckdbHint =>
      'Wählen Sie eine .duckdb-Datei oder lassen Sie das Feld leer (In-Memory). CSV-, Parquet-, JSON- und Excel-Dateien direkt abfragen: SELECT * FROM \'C:\\data\\sales.csv\'';

  @override
  String get sqFormInMemory => 'In-Memory';

  @override
  String get sqFormFolder => 'Ordner';

  @override
  String get sqFormColor => 'Farbe';

  @override
  String get sqFormComments => 'Notizen';

  @override
  String get sqFormReadOnly => 'Schreibgeschützter Modus';

  @override
  String get sqFormReadOnlyHint =>
      'Empfohlen. INSERT/UPDATE/DELETE und DDL werden vor der Ausführung blockiert; Sie können sie einmalig freigeben. Wo unterstützt, ist auch die Sitzung selbst schreibgeschützt.';

  @override
  String get sqFormSavePassword => 'Passwort speichern';

  @override
  String get sqFormSavePasswordHint =>
      'Das Passwort wird nur im Schlüsselbund des Betriebssystems gespeichert (Windows: DPAPI). Wenn deaktiviert, werden Sie bei jeder Verbindung danach gefragt.';

  @override
  String get sqFormSsl => 'TLS / SSL';

  @override
  String get sqFormSslPrefer =>
      'Bevorzugen (verschlüsselt, wenn der Server es unterstützt)';

  @override
  String get sqFormSslRequire => 'Erzwingen (Zertifikat wird nicht geprüft)';

  @override
  String get sqFormSslVerify => 'Erzwingen + Zertifikat prüfen';

  @override
  String get sqFormSslDisable => 'Aus (unverschlüsselt)';

  @override
  String get sqFormSslHint =>
      'TLS wird standardmäßig versucht; das Verbindungsfenster warnt, wenn der Server es nicht unterstützt.';

  @override
  String get sqFormSshEnable => 'Über einen SSH-Tunnel verbinden';

  @override
  String get sqFormSshHint =>
      'Die Datenbank wird zuerst über einen SSH-Server erreicht. Schlüsselauthentifizierung wird empfohlen.';

  @override
  String get sqFormSshHost => 'SSH-Server';

  @override
  String get sqFormSshAuth => 'SSH-Authentifizierung';

  @override
  String get sqFormSshKey => 'Privater Schlüssel';

  @override
  String get sqFormSshAgent => 'Agent (Pageant)';

  @override
  String get sqFormKeyFile => 'Private Schlüsseldatei';

  @override
  String get sqFormPassphrase => 'Schlüssel-Passphrase';

  @override
  String get sqFormPassSaved => '(gespeichert)';

  @override
  String get sqFormPassEmpty => 'Leer lassen, falls keine';

  @override
  String get sqFormSshPassword => 'SSH-Passwort';

  @override
  String sqFormHostKey(String fp) {
    return 'SSH-Hostschlüssel: $fp';
  }

  @override
  String get sqFormTest => 'Verbindung testen';

  @override
  String get sqFormSaveConnect => 'Speichern und öffnen';

  @override
  String get sqFormConnecting => 'Verbindung wird hergestellt…';

  @override
  String get sqFormTestOk => 'Verbindung erfolgreich';

  @override
  String get sqFormTestFail => 'Verbindung nicht möglich';

  @override
  String sqFormTestDb(String db, String user) {
    return 'Datenbank: $db · Benutzer: $user';
  }

  @override
  String get sqFormNoTls =>
      'Warnung: Die Verbindung ist unverschlüsselt (der Server unterstützt kein TLS).';

  @override
  String get sqFormSaved => 'Verbindung gespeichert';

  @override
  String get sqFormChangesSaved => 'Änderungen gespeichert';

  @override
  String get sqCwObjects => 'Objekte';

  @override
  String get sqCwCollapseAll => 'Alle einklappen';

  @override
  String get sqCwFilterPh => 'Geladene Objekte filtern…';

  @override
  String get sqCwEmpty => '(leer)';

  @override
  String get sqCwOpenData => 'Daten öffnen';

  @override
  String get sqCwShowDdl => 'DDL anzeigen';

  @override
  String get sqCwOpenCode => 'Code öffnen';

  @override
  String get sqCwSelectSql => 'SELECT erzeugen';

  @override
  String get sqCwAddToBuilder => 'Zum Abfrage-Designer hinzufügen';

  @override
  String get sqCwNewSqlHere => 'Neues SQL hier';

  @override
  String get sqCwCopyName => 'Namen kopieren';

  @override
  String get sqCwCopied => 'In die Zwischenablage kopiert';

  @override
  String get sqCwNewSql => 'Neues SQL';

  @override
  String get sqCwBuilder => 'Abfrage-Designer';

  @override
  String get sqCwReconnect => 'Neu verbinden';

  @override
  String get sqCwReadOnly => 'Schreibgeschützt';

  @override
  String get sqCwReadWrite => 'Schreiben an';

  @override
  String get sqCwReadOnlyTip =>
      'Schreibgeschützt: DML/DDL erfordert Bestätigung. Zum Ausschalten klicken';

  @override
  String get sqCwReadWriteTip =>
      'Schreiben an: Befehle werden ohne Bestätigung ausgeführt. Klicken, um zum Schreibschutz zurückzukehren';

  @override
  String get sqCwDisableRo => 'Schreibgeschützten Modus ausschalten?';

  @override
  String get sqCwDisableRoMsg =>
      'Bis dieses Fenster geschlossen wird, werden INSERT/UPDATE/DELETE und DDL ohne Nachfrage ausgeführt.';

  @override
  String get sqCwDisableRoOk => 'Schreiben erlauben';

  @override
  String get sqCwRoOn => 'Schreibgeschützter Modus an';

  @override
  String get sqCwRoOff => 'Schreiben erlaubt — Vorsicht';

  @override
  String get sqCwPasswordTitle => 'Passwort erforderlich';

  @override
  String sqCwPasswordFor(String host, String user) {
    return 'Passwort für $user@$host';
  }

  @override
  String get sqCwNotConnected => 'Nicht verbunden';

  @override
  String get sqCwConnected => 'Verbunden';

  @override
  String get sqCwConnecting => 'Verbindung wird hergestellt…';

  @override
  String get sqCwNoTls => 'Unverschlüsselt';

  @override
  String get sqCwConnectFailed => 'Verbindung nicht möglich';

  @override
  String get sqCwRetry => 'Erneut versuchen';

  @override
  String get sqCwResetCancel =>
      'Die Abfrage hat nicht auf den Abbruch reagiert; Verbindung wird neu hergestellt.';

  @override
  String get sqCwResetExit =>
      'Die Datenbankverbindung wurde unterbrochen; Verbindung wird neu hergestellt.';

  @override
  String get sqCwEmptyWorkspace =>
      'Doppelklicken Sie im Baum auf eine Tabelle oder drücken Sie Ctrl+T für einen neuen SQL-Tab.';

  @override
  String get sqCwCloseTab => 'Tab schließen?';

  @override
  String sqCwCloseTabMsg(String name) {
    return 'Das SQL in „$name“ ist nicht gespeichert.';
  }

  @override
  String get sqCwCloseTabOk => 'Schließen';

  @override
  String get sqTreeTables => 'Tabellen';

  @override
  String get sqTreeViews => 'Sichten';

  @override
  String get sqTreeMatviews => 'Materialisierte Sichten';

  @override
  String get sqTreeForeignTables => 'Fremdtabellen';

  @override
  String get sqTreeFunctions => 'Funktionen';

  @override
  String get sqTreeProcedures => 'Prozeduren';

  @override
  String get sqTreeTriggers => 'Trigger';

  @override
  String get sqTreeSequences => 'Sequenzen';

  @override
  String get sqTreeTypes => 'Typen';

  @override
  String get sqTreeColumns => 'Spalten';

  @override
  String get sqTreeIndexes => 'Indizes';

  @override
  String get sqTreeConstraints => 'Constraints';

  @override
  String get sqTreeFiles => 'Dateien';

  @override
  String get sqKindTable => 'Tabelle';

  @override
  String get sqKindView => 'Sicht';

  @override
  String get sqKindMatview => 'Materialisierte Sicht';

  @override
  String get sqKindForeignTable => 'Fremdtabelle';

  @override
  String get sqKindFunction => 'Funktion';

  @override
  String get sqKindProcedure => 'Prozedur';

  @override
  String get sqKindTrigger => 'Trigger';

  @override
  String get sqKindSequence => 'Sequenz';

  @override
  String get sqKindType => 'Typ';

  @override
  String get sqKindIndex => 'Index';

  @override
  String get sqKindConstraint => 'Constraint';

  @override
  String get sqSqlRun => 'Ausführen';

  @override
  String get sqSqlRunStatement => 'Anweisung ausführen';

  @override
  String get sqSqlCancel => 'Abbrechen';

  @override
  String get sqSqlDatabase => 'Datenbank';

  @override
  String get sqSqlHistory => 'Verlauf';

  @override
  String get sqSqlExport => 'Exportieren';

  @override
  String get sqSqlRunning => 'Wird ausgeführt…';

  @override
  String sqSqlDone(String ms) {
    return 'Fertig · $ms ms';
  }

  @override
  String sqSqlDoneErrors(String ms, String n) {
    return '$n Fehler · $ms ms';
  }

  @override
  String get sqSqlDdlHint =>
      'Schema geändert: Mit „Aktualisieren“ den Baum neu laden.';

  @override
  String get sqSqlPlaceholder =>
      'SQL eingeben… Ctrl+Enter: Auswahl/alles ausführen · Ctrl+Shift+Enter: Anweisung am Cursor · Ctrl+Space: vervollständigen';

  @override
  String sqSqlTabTitle(String n) {
    return 'SQL $n';
  }

  @override
  String get sqSqlHistoryEmpty => 'Kein Verlauf für diese Verbindung.';

  @override
  String get sqSqlRowsShort => 'Zeilen';

  @override
  String sqResResult(String n) {
    return 'Ergebnis $n';
  }

  @override
  String get sqResMessages => 'Meldungen';

  @override
  String sqResRows(String ms, String n) {
    return '$n Zeilen · $ms ms';
  }

  @override
  String sqResRowsTruncated(String ms, String n) {
    return 'Die ersten $n Zeilen werden angezeigt (Limit) · $ms ms';
  }

  @override
  String get sqResNoRows => 'Keine Zeilen';

  @override
  String sqResAffected(String cmd, String ms, String n) {
    return '$cmd: $n Zeilen betroffen · $ms ms';
  }

  @override
  String sqResCommand(String cmd, String ms) {
    return '$cmd · $ms ms';
  }

  @override
  String get sqResCancelled => 'Abgebrochen';

  @override
  String get sqGridCopy => 'Kopieren';

  @override
  String get sqGridCopyHeaders => 'Mit Spaltenköpfen kopieren';

  @override
  String get sqGridExport => 'Dieses Ergebnis exportieren…';

  @override
  String get sqDataColumns => 'Spalten';

  @override
  String sqDataColumnsHidden(String n, String total) {
    return 'Spalten ($n/$total)';
  }

  @override
  String get sqDataAddFilter => 'Filter';

  @override
  String get sqDataLimit => 'Zeilenanzahl';

  @override
  String sqDataFirstN(String n) {
    return 'Erste $n';
  }

  @override
  String get sqDataAll => 'Alle (begrenzt)';

  @override
  String get sqDataOpenInEditor => 'Im SQL-Editor öffnen';

  @override
  String get sqDataClearFilters => 'Filter löschen';

  @override
  String sqDataRows(String ms, String n) {
    return '$n Zeilen · $ms ms';
  }

  @override
  String sqDataRowsMore(String ms, String n) {
    return 'Erste $n Zeilen · $ms ms';
  }

  @override
  String get sqDataError => 'Daten konnten nicht geladen werden';

  @override
  String get sqDataSortAsc => 'Aufsteigend sortieren';

  @override
  String get sqDataSortDesc => 'Absteigend sortieren';

  @override
  String get sqDataSortClear => 'Sortierung aufheben';

  @override
  String get sqDataFilterColumn => 'Nach dieser Spalte filtern…';

  @override
  String get sqDataHideColumn => 'Spalte ausblenden';

  @override
  String get sqDataShowAll => 'Alle Spalten anzeigen';

  @override
  String sqDataFilterEq(String v) {
    return 'Gleich „$v“';
  }

  @override
  String sqDataFilterNe(String v) {
    return 'Ungleich „$v“';
  }

  @override
  String get sqDataFilterNull => 'NULL / nicht NULL';

  @override
  String get sqDataColumn => 'Spalte';

  @override
  String get sqDataOperator => 'Bedingung';

  @override
  String get sqDataValue => 'Wert';

  @override
  String get sqDataInHint => 'Für „in Liste“ die Werte durch Kommas trennen.';

  @override
  String get sqDataFilterTitle => 'Filter';

  @override
  String get sqDataSelectAll => 'Alle';

  @override
  String get sqDataSelectNone => 'Keine';

  @override
  String get sqOpContains => 'enthält';

  @override
  String get sqOpStarts => 'beginnt mit';

  @override
  String get sqOpEnds => 'endet mit';

  @override
  String get sqOpLike => 'LIKE';

  @override
  String get sqOpIn => 'in Liste';

  @override
  String get sqCodeExecute => 'Ausführen';

  @override
  String get sqCodeLoading => 'Wird geladen…';

  @override
  String get sqCodeEmpty => 'Keine Definition gefunden';

  @override
  String get sqQbAddTable => 'Tabelle hinzufügen';

  @override
  String get sqQbLimit => 'Limit';

  @override
  String get sqQbClear => 'Leeren';

  @override
  String get sqQbHint =>
      'Ziehen Sie Tabellen aus dem Baum hierher oder klicken Sie auf „Tabelle hinzufügen“. Ziehen Sie eine Spalte auf die Spalte einer anderen Tabelle, um einen JOIN zu erstellen.';

  @override
  String get sqQbColumns => 'Spalten';

  @override
  String get sqQbConditions => 'Bedingungen';

  @override
  String get sqQbResults => 'Ergebnisse';

  @override
  String get sqQbGenerated => 'Erzeugtes SQL';

  @override
  String get sqQbRegenerate => 'Aus Diagramm neu erzeugen';

  @override
  String get sqQbOtherDb =>
      'Der Abfrage-Designer arbeitet mit Tabellen aus einer einzigen Datenbank.';

  @override
  String get sqQbDragJoin =>
      'Für einen JOIN auf die Spalte einer anderen Tabelle ziehen';

  @override
  String get sqQbSwapJoin => 'Richtung umkehren';

  @override
  String get sqQbDeleteJoin => 'JOIN löschen';

  @override
  String get sqQbNoColumns =>
      'Aktivieren Sie die Spalten-Kontrollkästchen in den Tabellen (keine = SELECT *).';

  @override
  String get sqQbOutput => 'Anzeigen';

  @override
  String get sqQbColumn => 'Spalte';

  @override
  String get sqQbAlias => 'Alias';

  @override
  String get sqQbAggregate => 'Aggregat';

  @override
  String get sqQbSort => 'Sortierung';

  @override
  String get sqQbAddCondition => 'Bedingung hinzufügen';

  @override
  String sqQbTabTitle(String n) {
    return 'Abfrage $n';
  }

  @override
  String get sqRoTitle => 'Schreibgeschützter Modus';

  @override
  String get sqRoMessage =>
      'Diese Verbindung ist im schreibgeschützten Modus. Die folgenden Anweisungen können Daten oder Schema ändern:';

  @override
  String get sqRoHint =>
      'Sie können sie nur für diese Ausführung erlauben; danach ist der Schreibschutz wieder aktiv.';

  @override
  String get sqRoRunOnce => 'Einmal ausführen';

  @override
  String get sqRoNotRun => 'Schreibgeschützter Modus: nicht ausgeführt';

  @override
  String sqRoBlockedMsg(String n) {
    return 'Schreibgeschützter Modus: $n Anweisungen erfordern eine Bestätigung.';
  }

  @override
  String get sqExpTitle => 'Exportieren';

  @override
  String get sqExpHint =>
      'Die Abfrage wird ohne Zeilenlimit erneut ausgeführt und die Ergebnisse werden direkt in die Datei geschrieben.';

  @override
  String get sqExpRunning => 'Wird exportiert…';

  @override
  String sqExpDone(String n) {
    return '$n Zeilen exportiert';
  }

  @override
  String get sqExpFailed => 'Export fehlgeschlagen';

  @override
  String get sqErrRefused =>
      'Verbindung abgelehnt: Der Port ist geschlossen oder der Server läuft nicht.';

  @override
  String get sqErrDns => 'Der Hostname konnte nicht aufgelöst werden (DNS).';

  @override
  String get sqErrTimeout =>
      'Zeitüberschreitung: Der Server war nicht erreichbar.';

  @override
  String get sqErrReset => 'Der Server hat die Verbindung geschlossen.';

  @override
  String get sqErrUnreach => 'Der Server ist im Netzwerk nicht erreichbar.';

  @override
  String get sqErrSshAuth =>
      'SSH-Anmeldung fehlgeschlagen: falscher Benutzername, Schlüssel oder falsches Passwort.';

  @override
  String sqErrTls(String msg) {
    return 'TLS/SSL-Fehler — das Zertifikat konnte nicht geprüft werden oder der Server unterstützt kein TLS. ($msg)';
  }

  @override
  String get sqErrHostExit => 'Der Datenbankprozess wurde unerwartet beendet.';

  @override
  String get sqErrUnknown => 'Unbekannter Fehler';

  @override
  String get sqMainCloseAnyway => 'Trotzdem schließen';

  @override
  String get sqMainCloseRunning =>
      'Es laufen noch Abfragen. Sie werden abgebrochen, wenn Sie dieses Fenster schließen.';

  @override
  String get sqMainCopySuffix => ' (Kopie)';

  @override
  String get sqMainErrConnNotFound => 'Verbindung nicht gefunden';

  @override
  String get sqMainErrNoSession => 'Dieses Fenster hat keine Verbindung';

  @override
  String sqMainErrKeyFile(String path) {
    return 'Die SSH-Schlüsseldatei konnte nicht gelesen werden: $path';
  }

  @override
  String get sqMainTrayShow => 'SQL Master anzeigen';

  @override
  String get sqMainTrayQuick => 'Schnellverbindung';

  @override
  String get sqMainTrayNone => 'Keine gespeicherten Verbindungen';

  @override
  String get sqMainTrayQuit => 'Beenden';

  @override
  String get npKindSsh => 'SSH-Projekt';

  @override
  String get npKindFtp => 'FTP-Projekt';

  @override
  String get npKindLocal => 'Lokaler Ordner';

  @override
  String get npKindFile => 'Projektdatei';

  @override
  String get npKindSshHint => 'Ein Serverordner über SSH (SFTP)';

  @override
  String get npKindFtpHint => 'Ein FTP-, FTPS- oder SFTP-Server';

  @override
  String get npKindLocalHint => 'Ein Ordner auf diesem Computer';

  @override
  String get npKindFileHint => 'Eine einzelne Datei bearbeiten';

  @override
  String get npAppSearchPh => 'Verbindungen durchsuchen…  (Strg+F)';

  @override
  String get npAppNewConn => 'Neue Verbindung';

  @override
  String get npAppSettings => 'Einstellungen';

  @override
  String npAppStats(String c, String f) {
    return '$c Verbindungen · $f Ordner';
  }

  @override
  String get npAppWelcome => 'Willkommen';

  @override
  String npAppResults(String q) {
    return 'Ergebnisse für „$q“';
  }

  @override
  String get npAppAll => 'Alle Verbindungen';

  @override
  String get npAppWelcomeHint =>
      'Fügen Sie einen SSH- oder FTP-Server, einen lokalen Ordner oder eine einzelne Datei hinzu.<br>Doppelklicken Sie auf eine Karte, um das Projekt in einem eigenen Fenster zu öffnen.';

  @override
  String get npAppFolders => 'Ordner';

  @override
  String get npAppConnections => 'Verbindungen';

  @override
  String get npAppDblHint => 'Zum Öffnen auf eine Karte doppelklicken';

  @override
  String get npAppNoMatch => 'Keine passenden Verbindungen.';

  @override
  String npAppFolderCount(String n) {
    return '$n Verbindungen';
  }

  @override
  String get npAppNewConnHere => 'Neue Verbindung in diesem Ordner';

  @override
  String get npAppNewSubfolder => 'Neuer Unterordner';

  @override
  String get npAppKeyTag => 'Schlüssel';

  @override
  String get npAppDuplicate => 'Duplizieren';

  @override
  String get npAppMoveToFolder => 'In Ordner verschieben…';

  @override
  String get npAppConnMoved => 'Verbindung verschoben';

  @override
  String get npAppFolderIntoSelf =>
      'Ein Ordner kann nicht in sich selbst verschoben werden';

  @override
  String get npAppFolderPh => 'z. B. Kunden';

  @override
  String get npAppRenameFolder => 'Ordner umbenennen';

  @override
  String get npAppDeleteFolder => 'Ordner löschen';

  @override
  String npAppDeleteFolderMsg(String name) {
    return 'Den Ordner <b>$name</b> löschen?';
  }

  @override
  String npAppDeleteFolderConns(String n) {
    return '<br>Seine $n Verbindungen werden in den übergeordneten Ordner verschoben.';
  }

  @override
  String get npAppRootFolder => 'Oberste Ebene (kein Ordner)';

  @override
  String npAppMoveTitle(String name) {
    return '„$name“ verschieben';
  }

  @override
  String get npAppTargetFolder => 'Zielordner';

  @override
  String get npAppDeleteConn => 'Verbindung löschen';

  @override
  String npAppDeleteConnMsg(String name, String target) {
    return 'Die Verbindung <b>$name</b> ($target) löschen?<br>Dateien auf dem Server oder im Ordner bleiben unberührt; nur diese Verbindung und ihre Arbeitskopie werden entfernt.';
  }

  @override
  String get npAppNoLocalPath =>
      'Kein Pfad auf diesem Computer gewählt — Sie werden beim Öffnen danach gefragt';

  @override
  String get npAppChangeLocalPath => 'Pfad auf diesem Computer ändern…';

  @override
  String get npAppOpenTabs => 'Geöffnete Tabs';

  @override
  String get npAppCustomEditor => 'Verbindungsspezifische Editor-Einstellungen';

  @override
  String get npFormTitleNew => 'Neue Verbindung';

  @override
  String npFormTitleEdit(String name) {
    return 'Verbindung: $name';
  }

  @override
  String get npFormTabConn => 'Verbindung';

  @override
  String get npFormTabProject => 'Projekt';

  @override
  String get npFormTabEditor => 'Editor (Notepad++)';

  @override
  String get npFormName => 'Name (Anzeige)';

  @override
  String get npFormNamePh => 'z. B. Firmenwebsite';

  @override
  String get npFormHost => 'Host';

  @override
  String get npFormHostPh => 'server.example.com oder 192.168.1.10';

  @override
  String get npFormPort => 'Port';

  @override
  String get npFormUser => 'Benutzername';

  @override
  String get npFormPassword => 'Passwort';

  @override
  String get npFormPwSaved => '•••••••• (gespeichert — zum Ändern eingeben)';

  @override
  String get npFormLoginMethod => 'Anmeldeart';

  @override
  String get npFormLoginNormal => 'Normal';

  @override
  String get npFormLoginAnon => 'Anonym';

  @override
  String get npFormAuth => 'SSH-Authentifizierung';

  @override
  String get npFormPrivateKey => 'Privater Schlüssel';

  @override
  String get npFormKeyFile => 'Private Schlüsseldatei';

  @override
  String get npFormPassphrase => 'Schlüssel-Passphrase';

  @override
  String get npFormPassSaved => '(gespeichert)';

  @override
  String get npFormPassEmpty => 'Leer lassen, falls keine';

  @override
  String get npFormFolder => 'Ordner';

  @override
  String get npFormColor => 'Farbe';

  @override
  String get npFormComments => 'Notizen';

  @override
  String get npFormRootDir => 'Projektordner (auf dem Server)';

  @override
  String get npFormBrowse => 'Ordner wählen';

  @override
  String get npFormBrowseHint =>
      'Klicken Sie zuerst auf „Verbindung testen“, um den Server zu durchsuchen und den Ordner zu wählen. Bleibt das Feld leer, wird der Anmeldeordner geöffnet.';

  @override
  String get npFormBrowseTitle => 'Ordner auf dem Server wählen';

  @override
  String get npFormBrowseSelect => 'Diesen Ordner wählen';

  @override
  String get npFormBrowseEmpty => 'Keine Unterordner';

  @override
  String get npFormFolderPath => 'Ordner';

  @override
  String get npFormFilePath => 'Datei';

  @override
  String get npFormLocalPathHint =>
      'Der lokale Pfad wird nur auf diesem Computer gespeichert; andere Computer fragen beim ersten Mal danach.';

  @override
  String get npFormCacheNote =>
      'Jede geöffnete Datei wird mit ihrer Ordnerstruktur in einer Arbeitskopie (Cache) gespeichert. Beim Speichern wird die Datei auf den Server hochgeladen und die Arbeitskopie aktualisiert.';

  @override
  String get npFormRestoreTabs => 'Geöffnete Tabs merken';

  @override
  String get npFormRestoreTabsHint =>
      'Das Projekt wird beim nächsten Mal mit denselben Dateien geöffnet (nur auf diesem Computer).';

  @override
  String get npFormShowHidden => 'Versteckte Dateien anzeigen';

  @override
  String get npFormShowHiddenHint =>
      'Dateien und Ordner, die mit einem Punkt beginnen (.env, .htaccess, .git…)';

  @override
  String get npFormExclude => 'Im Baum ausblenden';

  @override
  String get npFormExcludeHint =>
      'Kommagetrennte Namen oder Muster; * und ? sind erlaubt.';

  @override
  String get npFormEditorMode => 'Editor-Einstellungen';

  @override
  String get npFormEdGlobal =>
      'Globale Editor-Einstellungen verwenden (Einstellungen › Editor)';

  @override
  String get npFormEdCustom =>
      'Eigene Einstellungen für diese Verbindung verwenden';

  @override
  String get npFormTest => 'Verbindung testen';

  @override
  String get npFormSaveOpen => 'Speichern und öffnen';

  @override
  String get npFormConnecting => 'Verbinde…';

  @override
  String get npFormTestOk => 'Verbindung erfolgreich';

  @override
  String get npFormTestFail => 'Verbindung fehlgeschlagen';

  @override
  String npFormHomeDir(String dir) {
    return 'Anmeldeordner: $dir';
  }

  @override
  String get npFormRootMissing =>
      'Warnung: Der Projektordner konnte nicht geöffnet werden.';

  @override
  String npFormHostKey(String fp) {
    return 'SSH-Host-Schlüssel (SHA256): $fp';
  }

  @override
  String get npFormSaved => 'Verbindung gespeichert';

  @override
  String get npFormChangesSaved => 'Änderungen gespeichert';

  @override
  String get npTypeProtocol => 'Protokoll';

  @override
  String get npTypeFtp => 'FTP (Standard)';

  @override
  String get npTypeFtpsImplicit => 'FTPS — TLS/SSL implizit (Port 990)';

  @override
  String get npTypeFtpsSsl => 'FTPS — Explizit (AUTH SSL)';

  @override
  String get npTypeFtpsTls => 'FTPS — Explizit (AUTH TLS)';

  @override
  String get npTypeSftp => 'SFTP — SSH2';

  @override
  String get npTypeNoteFtp =>
      'Einfaches FTP; Passwort und Dateien werden unverschlüsselt übertragen.';

  @override
  String get npTypeNoteFtpsImplicit =>
      'Die Verbindung ist von Anfang an mit TLS/SSL verschlüsselt (meist Port 990).';

  @override
  String get npTypeNoteFtpsSsl =>
      'Verbindet sich per einfachem FTP und wechselt mit AUTH SSL zu einer verschlüsselten Sitzung.';

  @override
  String get npTypeNoteFtpsTls =>
      'Verbindet sich per einfachem FTP und wechselt mit AUTH TLS zu einer verschlüsselten Sitzung (die gängigste FTPS-Variante).';

  @override
  String get npTypeNoteSftp =>
      'Verschlüsselter Dateizugriff über SSH (Port 22). Der Host-Schlüssel des Servers wird bei der ersten Verbindung gespeichert.';

  @override
  String get npOptEncoding => 'Kodierung der Dateinamen';

  @override
  String get npOptEncAuto => 'Automatisch';

  @override
  String get npEdSecEncoding => 'Kodierung und Zeilenenden';

  @override
  String get npEdEncoding => 'Kodierung beim Öffnen von Dateien';

  @override
  String get npEdEncAuto => 'Automatisch erkennen (BOM / UTF-8)';

  @override
  String get npEdFallback => 'Falls nicht UTF-8 (ANSI)';

  @override
  String get npEdEol => 'Zeilenenden';

  @override
  String get npEdEolAuto => 'Wie in der Datei beibehalten';

  @override
  String npEdEolConvert(String eol) {
    return 'Beim Öffnen in $eol umwandeln';
  }

  @override
  String get npEdNewDoc => 'Neue Datei: Kodierung · Zeilenende';

  @override
  String get npEdSecIndent => 'Einrückung und Sprache';

  @override
  String get npEdTabSize => 'Tabulatorbreite';

  @override
  String get npEdLanguage => 'Sprache (Syntax)';

  @override
  String get npEdLangAuto => 'Automatisch (Erweiterung / erste Zeile)';

  @override
  String get npEdInsertSpaces => 'Leerzeichen statt Tabulatoren einfügen';

  @override
  String get npEdDetectIndent => 'Einrückung aus der Datei erkennen';

  @override
  String get npEdDetectIndentHint =>
      'Mit Tabulatoren eingerückte Dateien verwenden weiterhin Tabulatoren.';

  @override
  String get npEdAutoIndent => 'Automatisch einrücken';

  @override
  String get npEdAutoClose =>
      'Klammern und Anführungszeichen automatisch schließen';

  @override
  String get npEdSecLook => 'Darstellung';

  @override
  String get npEdTheme => 'Farbschema';

  @override
  String get npEdThemeAuto => 'Automatisch (App-Design folgen)';

  @override
  String get npEdWhitespace => 'Leerzeichen und Tabulatoren anzeigen';

  @override
  String get npEdWsNone => 'Nicht anzeigen';

  @override
  String get npEdWsBoundary =>
      'Alle außer einzelnen Leerzeichen zwischen Wörtern';

  @override
  String get npEdWsTrailing => 'Nur am Zeilenende';

  @override
  String get npEdWsAll => 'Alle';

  @override
  String get npEdFont => 'Schriftart';

  @override
  String get npEdFontSize => 'Größe';

  @override
  String get npEdRulers => 'Lineale';

  @override
  String get npEdWordWrap => 'Zeilenumbruch';

  @override
  String get npEdLineNumbers => 'Zeilennummern';

  @override
  String get npEdHighlightLine => 'Aktuelle Zeile hervorheben';

  @override
  String get npEdSmartHighlight => 'Intelligente Hervorhebung (gleiche Wörter)';

  @override
  String get npEdIndentGuides => 'Einrückungslinien';

  @override
  String get npEdFolding => 'Code-Faltung';

  @override
  String get npEdBracketColors => 'Klammerpaare einfärben';

  @override
  String get npEdMinimap => 'Minimap (Dokumentübersicht)';

  @override
  String get npEdControlChars => 'Unsichtbare Zeichen anzeigen';

  @override
  String get npEdSecSave => 'Speichern';

  @override
  String get npEdTrimTrailing =>
      'Leerzeichen am Zeilenende beim Speichern entfernen';

  @override
  String get npEdFinalNewline => 'Abschließenden Zeilenumbruch einfügen';

  @override
  String get npEdCheckRemote => 'Vor dem Speichern auf Änderungen prüfen';

  @override
  String get npEdCheckRemoteHint =>
      'Fragt nach, wenn jemand die Datei auf dem Server geändert hat, nachdem Sie sie geöffnet haben.';

  @override
  String get npEdAutoSave => 'Automatisch speichern';

  @override
  String get npEdSec => 's';

  @override
  String get npEdAutoSaveHint =>
      '0 = aus. Wenn aktiv, wird die Datei so lange nach einer Änderung gespeichert und hochgeladen.';

  @override
  String get npMainBalloonTitle => 'Notepad Master läuft im Hintergrund';

  @override
  String get npMainBalloonBody =>
      'Klicken Sie auf das Symbol im Infobereich, um es wieder zu öffnen.';

  @override
  String get npMainTrayShow => 'Notepad Master anzeigen';

  @override
  String get npMainTrayQuick => 'Schnell öffnen';

  @override
  String get npMainTrayNone => 'Keine gespeicherten Verbindungen';

  @override
  String get npMainTrayQuit => 'Beenden';

  @override
  String get npProjToggleTree => 'Ordnerbaum ein-/ausblenden (Strg+B)';

  @override
  String get npProjReconnect => 'Neu verbinden';

  @override
  String get npProjReconnected => 'Erneut verbunden';

  @override
  String get npProjConnectFail => 'Verbindung fehlgeschlagen';

  @override
  String get npProjStatusOn => 'Verbunden';

  @override
  String get npProjStatusOff => 'Getrennt';

  @override
  String get npProjStatusConnecting => 'Verbinde…';

  @override
  String get npProjSave => 'Speichern';

  @override
  String get npProjSaveAll => 'Alle speichern';

  @override
  String get npProjUndo => 'Rückgängig';

  @override
  String get npProjRedo => 'Wiederholen';

  @override
  String get npProjFind => 'Suchen';

  @override
  String get npProjReplace => 'Ersetzen';

  @override
  String get npProjGoto => 'Gehe zu Zeile';

  @override
  String get npProjShowWs => 'Leerzeichen und Tabulatoren anzeigen';

  @override
  String get npProjZoomIn => 'Vergrößern';

  @override
  String get npProjZoomOut => 'Verkleinern';

  @override
  String get npProjShowCache => 'Arbeitskopie anzeigen';

  @override
  String get npProjPalette => 'Befehlspalette';

  @override
  String get npProjCloseTab => 'Schließen';

  @override
  String get npProjCloseOthers => 'Andere schließen';

  @override
  String get npProjCloseAll => 'Alle schließen';

  @override
  String get npProjReload => 'Neu laden';

  @override
  String npProjReloadMsg(String name) {
    return 'Ungespeicherte Änderungen in <b>$name</b> gehen verloren. Datei neu laden?';
  }

  @override
  String get npProjRevealTree => 'Im Baum anzeigen';

  @override
  String get npProjUnsavedTitle => 'Ungespeicherte Änderungen';

  @override
  String npProjUnsavedMsg(String name) {
    return 'Änderungen an <b>$name</b> speichern?';
  }

  @override
  String get npProjDontSave => 'Nicht speichern';

  @override
  String npProjOpenFail(String name) {
    return '$name konnte nicht geöffnet werden';
  }

  @override
  String npProjTooLarge(String name, String size) {
    return '$name ist zu groß ($size); das Limit beträgt 50 MB.';
  }

  @override
  String npProjBinary(String name) {
    return '$name ist keine Textdatei (binär) und wurde nicht im Editor geöffnet.';
  }

  @override
  String npProjSaveFail(String name) {
    return '$name konnte nicht gespeichert werden';
  }

  @override
  String npProjSaved(String name) {
    return '$name gespeichert';
  }

  @override
  String npProjSavedRemote(String name) {
    return '$name gespeichert und hochgeladen';
  }

  @override
  String get npProjLossyTitle => 'Kodierungswarnung';

  @override
  String npProjLossyMsg(String enc) {
    return 'Einige Zeichen können in <b>$enc</b> nicht gespeichert werden und werden als „?“ gespeichert. Es wird empfohlen, über die Statusleiste in UTF-8 umzuwandeln.';
  }

  @override
  String get npProjSaveAnyway => 'Trotzdem speichern';

  @override
  String get npProjConflictTitle => 'Datei wurde anderweitig geändert';

  @override
  String npProjConflictMsg(String name) {
    return '<b>$name</b> wurde auf dem Server geändert, nachdem Sie die Datei geöffnet haben. Was soll geschehen?';
  }

  @override
  String get npProjConflictOverwrite => 'Überschreiben';

  @override
  String get npProjConflictReload => 'Serverversion laden';

  @override
  String npProjConflictAuto(String name) {
    return '$name wurde auf dem Server geändert; automatisches Speichern übersprungen.';
  }

  @override
  String npProjPos(String col, String ln) {
    return 'Z $ln, Sp $col';
  }

  @override
  String npProjSel(String n) {
    return '$n ausgewählt';
  }

  @override
  String npProjSpaces(String n) {
    return 'Leerzeichen: $n';
  }

  @override
  String npProjTabWidth(String n) {
    return 'Tabulatorbreite: $n';
  }

  @override
  String get npProjIndentToSpaces => 'Einrückung in Leerzeichen umwandeln';

  @override
  String get npProjIndentToTabs => 'Einrückung in Tabulatoren umwandeln';

  @override
  String npProjEncTitle(String name) {
    return 'Kodierung: $name';
  }

  @override
  String get npProjEncConvert =>
      'In diese Kodierung umwandeln (beim Speichern)';

  @override
  String get npProjEncConvertHint =>
      'Der Text bleibt gleich; die Datei wird beim Speichern in der gewählten Kodierung geschrieben.';

  @override
  String get npProjEncReopen => 'Mit dieser Kodierung erneut öffnen';

  @override
  String get npProjEncReopenHint =>
      'Wenn Zeichen fehlerhaft aussehen, lesen Sie die Datei mit der richtigen Kodierung erneut ein.';

  @override
  String npProjEolTo(String eol) {
    return 'In $eol umwandeln';
  }

  @override
  String get npProjLangTitle => 'Sprache wählen';

  @override
  String get npProjLangSearch => 'Sprachen durchsuchen…';

  @override
  String get npProjCacheCopy => 'Arbeitskopie';

  @override
  String get npProjInitFail =>
      'Das Projektfenster konnte nicht gestartet werden';

  @override
  String get npProjEmptyHint =>
      'Doppelklicken Sie links im Baum auf eine Datei; sie wird hier in einem Tab mit Syntaxhervorhebung für ihre Sprache geöffnet.';

  @override
  String get npProjEmptyFile => 'Datei wird geöffnet…';

  @override
  String get npTreeNewFile => 'Neue Datei';

  @override
  String get npTreeFileName => 'Dateiname';

  @override
  String get npTreeBadName => 'Ungültiger Name';

  @override
  String get npTreeCreateFail => 'Erstellen fehlgeschlagen';

  @override
  String get npTreeRenameFail => 'Umbenennen fehlgeschlagen';

  @override
  String get npTreeRenameDirty =>
      'Speichern Sie zuerst die geöffneten Dateien in diesem Ordner.';

  @override
  String get npTreeDeleteTitle => 'Löschen';

  @override
  String npTreeDeleteMsg(String name) {
    return 'Die Datei <b>$name</b> löschen?';
  }

  @override
  String npTreeDeleteDirMsg(String name) {
    return 'Den Ordner <b>$name</b> und seinen gesamten Inhalt löschen?';
  }

  @override
  String get npTreeDeleteFail => 'Löschen fehlgeschlagen';

  @override
  String get npTreeTrashNote =>
      'Lokale Dateien werden in den Papierkorb verschoben.';

  @override
  String get npTreeEmpty => 'Leerer Ordner';

  @override
  String get npTreeCollapseAll => 'Alle einklappen';

  @override
  String get npTreeShowExplorer => 'Im Explorer anzeigen';

  @override
  String get npTreeUp => 'Übergeordneter Ordner';

  @override
  String get npTreeHome => 'Anmeldeordner';

  @override
  String get npMainErrAuth =>
      'Anmeldung fehlgeschlagen: Benutzername oder Passwort falsch.';

  @override
  String get npMainErrRefused =>
      'Verbindung abgelehnt: Port geschlossen oder Server läuft nicht.';

  @override
  String get npMainErrTimeout => 'Zeitüberschreitung: Server nicht erreichbar.';

  @override
  String get npMainErrDns => 'Hostname konnte nicht aufgelöst werden (DNS).';

  @override
  String get npMainErrUnreach =>
      'Server ist über das Netzwerk nicht erreichbar.';

  @override
  String get npMainErrReset => 'Der Server hat die Verbindung geschlossen.';

  @override
  String get npMainErrNotFound => 'Datei oder Ordner nicht gefunden.';

  @override
  String get npMainErrPerm => 'Zugriff verweigert.';

  @override
  String get npMainErrExists =>
      'Eine Datei oder ein Ordner mit diesem Namen existiert bereits.';

  @override
  String npMainErr550(String msg) {
    return 'Der Server hat den Vorgang abgelehnt (550): $msg';
  }

  @override
  String get npMainErr553 =>
      'Der Server hat den Dateinamen nicht akzeptiert (553).';

  @override
  String npMainErrTls(String msg) {
    return 'TLS/SSL-Fehler — prüfen Sie Protokoll oder Port. ($msg)';
  }

  @override
  String npMainErrHostKey(String newVal, String oldVal) {
    return 'Der Host-Schlüssel des Servers hat sich geändert! Gespeichert: $oldVal, empfangen: $newVal. Verbindung aus Sicherheitsgründen abgelehnt.';
  }

  @override
  String get npMainErrNoKey =>
      'Die private Schlüsseldatei konnte nicht gelesen werden.';

  @override
  String get npMainErrKey =>
      'Privater Schlüssel konnte nicht gelesen werden: falsche Passphrase oder nicht unterstütztes Format.';

  @override
  String get npMainErrNoLocal =>
      'Ordner oder Datei wurde auf diesem Computer nicht gefunden. Ändern Sie den Pfad über das Kartenmenü im Hauptfenster.';

  @override
  String get npMainErrConnNotFound => 'Verbindung nicht gefunden';

  @override
  String get npMainErrNoSession => 'Nicht verbunden';

  @override
  String get npMainErrHost => 'Hostadresse ist erforderlich.';

  @override
  String get npMainErrUser =>
      'Benutzername ist erforderlich (oder wählen Sie die anonyme Anmeldung).';

  @override
  String get npMainPickKey => 'Private Schlüsseldatei wählen';

  @override
  String get npMainCopySuffix => ' (Kopie)';

  @override
  String get npMainCloseDirty =>
      'Es gibt ungespeicherte Dateien. Beim Schließen des Fensters gehen die Änderungen verloren.';

  @override
  String get npMainCloseDiscard => 'Ohne Speichern schließen';

  @override
  String get ipAppNewFolder => 'Neuer Ordner';

  @override
  String get ipAppNewRecord => 'Neuer Eintrag';

  @override
  String get ipAppSearchPh => 'Einträge, IPs, Namen, MACs oder Dienste suchen…';

  @override
  String ipAppStats(String n) {
    return '$n Einträge';
  }

  @override
  String get ipColIp => 'IP';

  @override
  String get ipColMac => 'MAC';

  @override
  String get ipColName => 'Name';

  @override
  String get ipColRtt => 'Antwort';

  @override
  String get ipColServices => 'Dienste';

  @override
  String get ipColStatus => 'Status';

  @override
  String get ipColVendor => 'Hersteller';

  @override
  String get ipCtxCopyIp => 'IP-Adresse kopieren';

  @override
  String get ipCtxCopyMac => 'MAC-Adresse kopieren';

  @override
  String get ipCtxCopyName => 'Namen kopieren';

  @override
  String get ipCtxCopyRange => 'Bereich kopieren';

  @override
  String get ipCtxOpenWeb => 'Im Browser öffnen';

  @override
  String ipFolderDeleteMsg(String name) {
    return 'Der Ordner „$name“ wird gelöscht; seine Einträge und Ordner werden in den übergeordneten Ordner verschoben.';
  }

  @override
  String get ipFolderEmpty => 'Leerer Ordner';

  @override
  String get ipFolderName => 'Ordnername';

  @override
  String get ipFolderRename => 'Ordner umbenennen';

  @override
  String get ipHostAlive => 'Erreichbarkeit';

  @override
  String get ipHostBanner => 'Begrüßung';

  @override
  String get ipHostCert => 'Zertifikat';

  @override
  String get ipHostCertExpires => 'Gültig bis';

  @override
  String get ipHostCertIssuer => 'Aussteller';

  @override
  String get ipHostDetails => 'Details';

  @override
  String get ipHostLocalMac => 'private Adresse';

  @override
  String get ipHostNoServices => 'Keiner der aufgelisteten Ports ist offen.';

  @override
  String get ipHostSelfSigned => 'selbstsigniert';

  @override
  String get ipHostServer => 'Server';

  @override
  String get ipHostTitle => 'Titel';

  @override
  String get ipHostUnknown => '(Name nicht aufgelöst)';

  @override
  String get ipNoticeAccept => 'Verstanden';

  @override
  String get ipNoticeBody =>
      'IP Tools erkundet nur Ihr lokales Netzwerk: Es findet Geräte per Ping, versucht Verbindungen zu einer kurzen Portliste und löst ihre Namen auf. Scannen Sie nur Netzwerke, die Ihnen gehören oder für die Sie berechtigt sind.';

  @override
  String get ipNoticeLimits =>
      'Konstruktionsbedingt werden nur private Adressen (10.x, 172.16–31.x, 192.168.x, 169.254.x) gescannt; keine Schwachstellentests, kein Passwortraten, kein breiter Portscan.';

  @override
  String get ipNoticeShort => 'Nur berechtigte Netzwerke scannen';

  @override
  String get ipNoticeText =>
      'Scannen Sie nur Netzwerke, die Ihnen gehören oder für die Sie berechtigt sind.';

  @override
  String get ipNoticeTitle => 'Erkundung des lokalen Netzwerks';

  @override
  String get ipPrivacyNote =>
      'Datenschutz: Scan-Ergebnisse werden nur auf diesem Computer gespeichert und nie gesendet. Es werden nur private/lokale Adressen gescannt.';

  @override
  String get ipRangeErrEmpty => 'Geben Sie einen IP-Bereich ein.';

  @override
  String ipRangeErrInvalid(String token) {
    return 'Ungültige Adresse oder ungültiger Bereich: $token';
  }

  @override
  String ipRangeErrIpv6(String token) {
    return 'IPv6-Adressen werden nicht unterstützt: $token';
  }

  @override
  String ipRangeErrNotPrivate(String token) {
    return 'Nur private/lokale Adressen können gescannt werden (10.x, 172.16–31.x, 192.168.x, 169.254.x): $token';
  }

  @override
  String ipRangeErrReversed(String token) {
    return 'Der Anfang des Bereichs ist größer als sein Ende: $token';
  }

  @override
  String ipRangeErrTooMany(String count) {
    return 'Bereich zu groß (höchstens 65.536 Adressen, ein /16): $count';
  }

  @override
  String ipRangeOk(String n) {
    return '$n Adressen werden gescannt';
  }

  @override
  String get ipRecColor => 'Farbe';

  @override
  String ipRecDeleteMsg(String name) {
    return 'Der Eintrag „$name“ und sein Scan-Ergebnis auf diesem Computer werden gelöscht.';
  }

  @override
  String ipRecDevices(String n) {
    return '$n Geräte';
  }

  @override
  String get ipRecEdit => 'Eintrag bearbeiten';

  @override
  String get ipRecFolder => 'Ordner';

  @override
  String ipRecItems(String n) {
    return '$n Elemente';
  }

  @override
  String ipRecLastScan(String time) {
    return 'Letzter Scan: $time';
  }

  @override
  String get ipRecMove => 'Verschieben';

  @override
  String get ipRecMoveTitle => 'Eintrag verschieben';

  @override
  String get ipRecName => 'Name';

  @override
  String get ipRecNever => 'Noch nicht gescannt';

  @override
  String ipRecNewDevices(String n) {
    return '$n neu';
  }

  @override
  String get ipRecRange => 'IP-Bereich';

  @override
  String get ipRecRangeHint =>
      'Beispiele: 192.168.1.0/24 · 192.168.1.1-192.168.1.255 · 10.0.0.5 · mehrere durch Kommas getrennt. Höchstens /16.';

  @override
  String get ipRecRootFolder => 'Einträge';

  @override
  String get ipRecSaved => 'Eintrag gespeichert';

  @override
  String get ipScanBusy => 'Ein anderer Scan läuft; stoppen Sie ihn zuerst.';

  @override
  String ipScanDone(String n) {
    return 'Scan beendet: $n Geräte';
  }

  @override
  String get ipScanEmptyBody =>
      'Drücken Sie Scannen oder klicken Sie auf ▶ auf der Karte. Gefundene Geräte werden hier aufgelistet.';

  @override
  String get ipScanEmptyTitle => 'Dieser Eintrag wurde noch nicht gescannt';

  @override
  String get ipScanExport => 'Exportieren';

  @override
  String get ipScanExportCsv => 'Als CSV speichern…';

  @override
  String get ipScanExportJson => 'Als JSON speichern…';

  @override
  String get ipScanExported => 'Exportiert';

  @override
  String ipScanFailed(String msg) {
    return 'Scan fehlgeschlagen: $msg';
  }

  @override
  String get ipScanFilter => 'Filter';

  @override
  String get ipScanFilterAll => 'Alle';

  @override
  String get ipScanFilterGone => 'Verschwunden';

  @override
  String get ipScanFilterNew => 'Neu';

  @override
  String get ipScanFilterServices => 'Mit Diensten';

  @override
  String ipScanFound(String n) {
    return '$n Geräte gefunden';
  }

  @override
  String get ipScanNoMatch => 'Kein Gerät entspricht dem Filter.';

  @override
  String get ipScanPhaseNames => 'Namen werden aufgelöst';

  @override
  String get ipScanPhasePing => 'Geräte werden gesucht';

  @override
  String get ipScanPhasePorts => 'Dienste werden geprüft';

  @override
  String ipScanProgress(String done, String total) {
    return '$done/$total';
  }

  @override
  String ipScanRateLimited(String s) {
    return 'Derselbe Eintrag kann frühestens in $s s erneut gescannt werden.';
  }

  @override
  String get ipScanScan => 'Scannen';

  @override
  String get ipScanScanning => 'Scan läuft…';

  @override
  String get ipScanSelectHint =>
      'Klicken Sie links auf einen Eintrag: Der Bereich wird gescannt und die gefundenen Geräte werden hier aufgelistet.';

  @override
  String get ipScanSelectRecord => 'Eintrag auswählen';

  @override
  String get ipScanStop => 'Stoppen';

  @override
  String get ipScanStopped => 'Scan gestoppt';

  @override
  String get ipStatusAliveArp =>
      'In der ARP-Tabelle gesehen (hat nicht auf Ping geantwortet)';

  @override
  String get ipStatusAlivePing => 'Hat auf Ping geantwortet';

  @override
  String get ipStatusGone => 'Verschwunden (im vorherigen Scan vorhanden)';

  @override
  String get ipStatusLive => 'Wird gescannt';

  @override
  String get ipStatusNew => 'Neu (nicht im vorherigen Scan)';

  @override
  String get ipStatusSame => 'Online';

  @override
  String ipTagCopied(String text) {
    return 'In die Zwischenablage kopiert: $text';
  }

  @override
  String get ipTagFailed => 'Konnte nicht geöffnet werden';

  @override
  String get ipTagGroupCamera => 'Kamera (RTSP)';

  @override
  String get ipTagGroupDb => 'Datenbank';

  @override
  String get ipTagGroupFtp => 'FTP';

  @override
  String get ipTagGroupPrinter => 'Drucker';

  @override
  String get ipTagGroupRdp => 'Remotedesktop';

  @override
  String get ipTagGroupSmb => 'Dateifreigabe';

  @override
  String get ipTagGroupSsh => 'SSH';

  @override
  String get ipTagGroupVnc => 'VNC';

  @override
  String get ipTagGroupWeb => 'Web';

  @override
  String ipTagOpened(String text) {
    return 'Wird geöffnet: $text';
  }

  @override
  String get ipTrayHiddenHint =>
      'IP Tools läuft im Infobereich weiter. Klicken Sie auf das Symbol, um das Fenster zurückzuholen.';

  @override
  String get ipTrayQuit => 'Beenden';

  @override
  String get ipTrayShow => 'IP Tools anzeigen';

  @override
  String get ipWelcomeBody =>
      'Speichern Sie einen IP-Bereich (z. B. 192.168.1.0/24). Ein Klick auf den Eintrag scannt den Bereich; die gefundenen Geräte werden mit Name, Hersteller und offenen Diensten aufgelistet. Klicken Sie auf ein Dienst-Etikett, um die passende App zu öffnen.';

  @override
  String get ipWelcomeTitle => 'Was ist in Ihrem lokalen Netzwerk?';

  @override
  String get cvTypeVideo => 'Video';

  @override
  String get cvTypeImage => 'Bild';

  @override
  String get cvTypeAudio => 'Audio';

  @override
  String get cvTypeVideoHint => 'MP4, MKV, AVI, MOV…';

  @override
  String get cvTypeImageHint => 'JPG, PNG, WEBP, AVIF…';

  @override
  String get cvTypeAudioHint => 'MP3, WAV, FLAC, M4A…';

  @override
  String get cvTypeVideoAll => 'Alle Videodateien';

  @override
  String get cvTypeImageAll => 'Alle Bilddateien';

  @override
  String get cvTypeAudioAll => 'Alle Audiodateien';

  @override
  String get cvAppSearchPh => 'Projekte suchen…  (Ctrl+F)';

  @override
  String get cvAppNewProject => 'Neues Projekt';

  @override
  String get cvAppSettings => 'Einstellungen';

  @override
  String cvAppStats(String c, String f) {
    return '$c Projekte · $f Ordner';
  }

  @override
  String get cvAppWelcome => 'Willkommen';

  @override
  String cvAppResults(String q) {
    return 'Ergebnisse für „$q“';
  }

  @override
  String get cvAppAll => 'Alle Projekte';

  @override
  String get cvAppWelcomeHint =>
      'Erstellen Sie Ihr erstes Konvertierungsprojekt.<br>Wählen Sie Video, Bild oder Audio, legen Sie Quell- und Zielendungen fest und geben Sie eine Datei oder einen Ordner an.';

  @override
  String get cvAppFolders => 'Ordner';

  @override
  String get cvAppProjects => 'Projekte';

  @override
  String get cvAppDblHint =>
      'Doppelklicken Sie auf ein Projekt, um es zu öffnen';

  @override
  String get cvAppNoMatch => 'Keine passenden Projekte.';

  @override
  String cvAppFolderCount(String n) {
    return '$n Projekte';
  }

  @override
  String get cvAppNewProjectHere => 'Neues Projekt in diesem Ordner';

  @override
  String get cvAppNewSubfolder => 'Unterordner erstellen';

  @override
  String get cvAppDuplicate => 'Duplizieren';

  @override
  String get cvAppMoveToFolder => 'In Ordner verschieben…';

  @override
  String get cvAppProjectMoved => 'Projekt verschoben';

  @override
  String get cvAppFolderIntoSelf =>
      'Ein Ordner kann nicht in sich selbst verschoben werden';

  @override
  String get cvAppFolderPh => 'z. B. Kundenvideos';

  @override
  String get cvAppRenameFolder => 'Ordner umbenennen';

  @override
  String get cvAppDeleteFolder => 'Ordner löschen';

  @override
  String cvAppDeleteFolderMsg(String name) {
    return 'Den Ordner <b>$name</b> löschen?';
  }

  @override
  String cvAppDeleteFolderProjects(String n) {
    return '<br>Die $n Projekte darin werden in den übergeordneten Ordner verschoben.';
  }

  @override
  String get cvAppRootFolder => 'Oberste Ebene (kein Ordner)';

  @override
  String cvAppMoveTitle(String name) {
    return '„$name“ verschieben';
  }

  @override
  String get cvAppTargetFolder => 'Zielordner';

  @override
  String get cvAppDeleteProject => 'Projekt löschen';

  @override
  String cvAppDeleteProjectMsg(String name) {
    return 'Das Projekt <b>$name</b> löschen?<br>Die konvertierten Dateien und Transkripte werden ebenfalls gelöscht. Ihre Quelldateien bleiben unverändert.';
  }

  @override
  String get cvAppProjectSettings => 'Projekteinstellungen';

  @override
  String get cvAppNoSource => 'Auf diesem Computer ist keine Quelle gewählt';

  @override
  String get cvAppAllExts => 'Alle';

  @override
  String get cvAppRunning => 'Läuft';

  @override
  String cvAppDoneCount(String n) {
    return '$n fertig';
  }

  @override
  String cvAppErrorCount(String n) {
    return '$n fehlgeschlagen';
  }

  @override
  String get cvAppProjectSaved => 'Projekt gespeichert';

  @override
  String get cvAppClearOutputs => 'Konvertierte Dateien löschen';

  @override
  String cvAppClearOutputsMsg(String name) {
    return 'Die konvertierten Dateien von <b>$name</b> löschen? Ihre Quelldateien bleiben unverändert; Sie können jederzeit erneut konvertieren.';
  }

  @override
  String get cvPfTitleNew => 'Neues Projekt';

  @override
  String cvPfTitleEdit(String name) {
    return 'Projekteinstellungen: $name';
  }

  @override
  String get cvPfCreate => 'Speichern';

  @override
  String get cvPfTabGeneral => 'Allgemein';

  @override
  String get cvPfTabOutput => 'Konvertierungseinstellungen';

  @override
  String get cvPfTabSpeech => 'Spracherkennung';

  @override
  String get cvPfName => 'Projektname';

  @override
  String get cvPfNamePh => 'z. B. Urlaubsvideos';

  @override
  String get cvPfType => 'Typ';

  @override
  String get cvPfSourceExt => 'Quelldateiendung';

  @override
  String get cvPfTargetExt => 'Zieldateiendung';

  @override
  String get cvPfSelectAll => 'Alle auswählen';

  @override
  String get cvPfSelectNone => 'Keine';

  @override
  String get cvPfGroupVideo => 'Video';

  @override
  String get cvPfGroupAnim => 'Animation';

  @override
  String get cvPfGroupAudioOnly => 'Nur Audio (aus Video extrahieren)';

  @override
  String get cvPfAudioOnlyHint => 'Nur die Tonspur des Videos wird übernommen.';

  @override
  String get cvPfGifHint => 'Animiertes GIF (höchstens 30 Bilder/s).';

  @override
  String get cvPfSource => 'Quelle';

  @override
  String get cvPfModeFile => 'Datei';

  @override
  String get cvPfModeFolder => 'Ordner';

  @override
  String get cvPfPathFile => 'Zu konvertierende Datei';

  @override
  String get cvPfPathFolder => 'Zu konvertierender Ordner';

  @override
  String get cvPfPathNone =>
      'Noch nicht gewählt — klicken Sie auf Durchsuchen…';

  @override
  String get cvPfSubfolders => 'Unterordner einbeziehen';

  @override
  String get cvPfConcurrency => 'Gleichzeitig konvertierte Dateien';

  @override
  String get cvPfConcurrencyHint =>
      'Höhere Werte sind schneller fertig, belasten aber CPU und Datenträger stärker.';

  @override
  String get cvPfFolder => 'Projektordner';

  @override
  String get cvPfSpeechAsk => 'Sprache in Text umwandeln';

  @override
  String get cvPfSpeechAskHint =>
      'Gesprochenes im Video oder Audio wird transkribiert: Sekunde, Sprache und Text jedes Satzes erscheinen in eigenen Spalten.';

  @override
  String get cvPfSpeechModel => 'Sprachmodell';

  @override
  String get cvPfSpeechLang => 'Gesprochene Sprache';

  @override
  String get cvPfPerWindow => 'Sprache alle 30 Sekunden neu erkennen';

  @override
  String get cvPfPerWindowHint => 'Für mehrsprachige Aufnahmen. Langsamer.';

  @override
  String get cvPfModels => 'Modelle';

  @override
  String get cvPfSpeechNote =>
      'Die Spracherkennung läuft offline auf diesem Computer (whisper.cpp); Audio wird nie an einen Server gesendet. Das Modell wird bei der ersten Verwendung einmalig heruntergeladen.';

  @override
  String get cvPfErrExt => 'Wählen Sie mindestens eine Quelldateiendung.';

  @override
  String get cvOutQuality => 'Qualität';

  @override
  String get cvOutQHigh => 'Hoch (große Datei)';

  @override
  String get cvOutQMedium => 'Mittel (empfohlen)';

  @override
  String get cvOutQLow => 'Niedrig (kleine Datei)';

  @override
  String get cvOutResolution => 'Auflösung';

  @override
  String get cvOutAsSource => 'Wie Quelle';

  @override
  String get cvOutResolutionHint =>
      'Nur Verkleinerung; kleinere Videos werden nicht vergrößert.';

  @override
  String get cvOutFps => 'Bildrate';

  @override
  String get cvOutCodec => 'Videocodec';

  @override
  String get cvOutH264 => 'H.264 (höchste Kompatibilität)';

  @override
  String get cvOutH265 => 'H.265 / HEVC (kleiner)';

  @override
  String get cvOutCodecHint =>
      'H.265 wird nur für MP4-, MKV-, MOV- und M4V-Ziele verwendet.';

  @override
  String get cvOutSpeed => 'Kodiergeschwindigkeit';

  @override
  String get cvOutSpeedVeryfast => 'Sehr schnell';

  @override
  String get cvOutSpeedFast => 'Schnell';

  @override
  String get cvOutSpeedMedium => 'Ausgewogen';

  @override
  String get cvOutSpeedSlow => 'Langsam (kleinere Datei)';

  @override
  String get cvOutAudioBitrate => 'Audio-Bitrate';

  @override
  String get cvOutNoAudio => 'Ton entfernen';

  @override
  String get cvOutImgQuality => 'Qualität';

  @override
  String get cvOutImgQualityHint =>
      'Für JPG, WEBP, AVIF und TIFF. PNG ist verlustfrei; unter 80 wird eine Farbpalette verwendet.';

  @override
  String get cvOutMaxWidth => 'Maximale Breite';

  @override
  String get cvOutMaxHeight => 'Maximale Höhe';

  @override
  String get cvOutNoLimit => 'Keine Begrenzung';

  @override
  String get cvOutResizeHint =>
      'Das Seitenverhältnis bleibt erhalten; kleinere Bilder werden nicht vergrößert.';

  @override
  String get cvOutKeepMeta => 'Metadaten beibehalten (EXIF, Farbprofil)';

  @override
  String get cvOutKeepMetaHint =>
      'Wenn deaktiviert, werden persönliche Daten wie der Aufnahmeort nicht in die Ausgabe geschrieben.';

  @override
  String get cvOutBitrate => 'Bitrate';

  @override
  String get cvOutBitrateHint =>
      'WAV, FLAC und AIFF sind verlustfrei; die Bitrate gilt hier nicht.';

  @override
  String get cvOutSampleRate => 'Abtastrate';

  @override
  String get cvOutChannels => 'Kanäle';

  @override
  String get cvOutStereo => 'Stereo';

  @override
  String get cvOutMono => 'Mono';

  @override
  String get cvSpeechModelTiny => 'Tiny (am schnellsten)';

  @override
  String get cvSpeechModelBase => 'Base (empfohlen)';

  @override
  String get cvSpeechModelSmall => 'Small (genauer)';

  @override
  String get cvSpeechModelMedium => 'Medium (hohe Genauigkeit)';

  @override
  String get cvSpeechModelTurbo => 'Large v3 Turbo (am genauesten)';

  @override
  String get cvSpeechLangAuto => 'Automatisch erkennen';

  @override
  String get cvSpeechDownload => 'Herunterladen';

  @override
  String cvSpeechInstalled(String size) {
    return 'Installiert · $size';
  }

  @override
  String get cvSpeechDownloadFailed =>
      'Das Modell konnte nicht heruntergeladen werden';

  @override
  String get cvSpeechDlEngine => 'Spracherkennung wird heruntergeladen';

  @override
  String cvSpeechDlModel(String model) {
    return 'Sprachmodell wird heruntergeladen: $model';
  }

  @override
  String get cvSpeechEngineAuto =>
      'Die Spracherkennung (whisper.cpp) wird bei der ersten Verwendung heruntergeladen.';

  @override
  String get cvSpeechEngineMissing =>
      'Die Spracherkennung (whisper-cli) wurde nicht gefunden.';

  @override
  String get cvPjOriginal => 'Original';

  @override
  String get cvPjConverted => 'Konvertiert';

  @override
  String get cvPjFolders => 'Ordner';

  @override
  String get cvPjFiles => 'Dateien';

  @override
  String get cvPjTranscript => 'Text';

  @override
  String get cvPjTrSecond => 'Sekunde';

  @override
  String get cvPjTrLang => 'Sprache';

  @override
  String get cvPjTrText => 'Text';

  @override
  String get cvPjSecUnit => 's';

  @override
  String get cvPjStart => 'Starten';

  @override
  String get cvPjStop => 'Stoppen';

  @override
  String get cvPjChangeSource => 'Quelle ändern';

  @override
  String get cvPjPickSource => 'Quelle wählen';

  @override
  String get cvPjOpenOutDir => 'Ordner mit konvertierten Dateien öffnen';

  @override
  String get cvPjExportOutputs =>
      'Konvertierte Dateien in einen anderen Ordner kopieren…';

  @override
  String get cvPjClearOutputs => 'Konvertierte Dateien löschen';

  @override
  String get cvPjLinkPreview => 'Beide Vorschauen gemeinsam abspielen';

  @override
  String get cvPjFilterPh => 'Dateien suchen';

  @override
  String get cvPjFAll => 'Alle';

  @override
  String get cvPjFPending => 'Ausstehend';

  @override
  String get cvPjFActive => 'Läuft';

  @override
  String get cvPjFDone => 'Fertig';

  @override
  String get cvPjFError => 'Fehlgeschlagen';

  @override
  String get cvPjExpandAll => 'Alle aufklappen';

  @override
  String get cvPjCollapseAll => 'Alle zuklappen';

  @override
  String get cvPjRescan => 'Neu einlesen';

  @override
  String get cvPjColName => 'Name';

  @override
  String get cvPjColFolder => 'Ordner';

  @override
  String get cvPjColSize => 'Größe';

  @override
  String get cvPjColProgress => 'Fortschritt';

  @override
  String get cvPjColStatus => 'Status';

  @override
  String get cvPjColSpeech => 'Text';

  @override
  String get cvPjColOut => 'Ausgabe';

  @override
  String cvPjSegments(String n) {
    return '$n Sätze';
  }

  @override
  String get cvPjNoAudio => 'Kein Ton';

  @override
  String cvPjNoFiles(String exts) {
    return 'Keine Dateien mit den gewählten Endungen in diesem Ordner ($exts).';
  }

  @override
  String get cvPjNoMatch => 'Keine passenden Dateien.';

  @override
  String get cvPjNoneChecked =>
      'Die Liste ist leer. Markieren Sie die zu konvertierenden Dateien in der Baumansicht links.';

  @override
  String get cvPjConvertThis => 'Diese Datei konvertieren';

  @override
  String get cvPjReconvert => 'Erneut konvertieren';

  @override
  String get cvPjTranscribeThis => 'Transkribieren';

  @override
  String get cvPjRetranscribe => 'Erneut transkribieren';

  @override
  String get cvPjOpenOut => 'Konvertierte Datei öffnen';

  @override
  String get cvPjRevealOut => 'Konvertierte Datei im Ordner anzeigen';

  @override
  String get cvPjOpenSrc => 'Originaldatei öffnen';

  @override
  String get cvPjRevealSrc => 'Original im Ordner anzeigen';

  @override
  String get cvPjExportThis => 'In einen anderen Ordner kopieren…';

  @override
  String get cvPjDeleteOut => 'Konvertierte Datei löschen';

  @override
  String get cvPjUncheck => 'Aus der Liste entfernen';

  @override
  String cvPjExported(String n) {
    return '$n Dateien kopiert';
  }

  @override
  String get cvPjFileMissing => 'Die Quelldatei wurde nicht gefunden.';

  @override
  String get cvPjPickToPreview =>
      'Wählen Sie eine Datei in der Liste aus, um eine Vorschau zu sehen.';

  @override
  String get cvPjOutPreviewHint =>
      'Sie erscheint hier, sobald sie konvertiert ist.';

  @override
  String get cvPjConverting => 'Wird konvertiert…';

  @override
  String get cvPjCantPlay =>
      'Dieses Format kann hier nicht direkt abgespielt werden.';

  @override
  String get cvPjMakePreview => 'Vorschau erstellen';

  @override
  String get cvPjMakingPreview => 'Vorschau wird vorbereitet…';

  @override
  String get cvPjNoSourceTitle =>
      'Auf diesem Computer ist keine Quelle gewählt';

  @override
  String get cvPjNoSourceHint =>
      'Das Projekt wurde von einem anderen Gerät synchronisiert oder es wurde noch keine Quelle gewählt. Wählen Sie die zu konvertierende Datei oder den Ordner.';

  @override
  String get cvPjSourceGone => 'Quelle nicht gefunden';

  @override
  String get cvPjTrImage =>
      'Sprache-zu-Text ist in Video- und Audioprojekten verfügbar.';

  @override
  String get cvPjTrPick => 'Wählen Sie eine Datei aus, um ihren Text zu sehen.';

  @override
  String get cvPjTrAfter =>
      'Das Gesprochene wird transkribiert, sobald die Datei konvertiert ist.';

  @override
  String get cvPjTrOff =>
      'Sprache-zu-Text ist in diesem Projekt deaktiviert. Sie können es jetzt für diese Datei ausführen.';

  @override
  String cvPjTrRunning(String p) {
    return 'Wird transkribiert… $p %';
  }

  @override
  String get cvPjTrNone => 'In dieser Datei wurde keine Sprache gefunden.';

  @override
  String get cvPjTrNoExport => 'Es gibt keinen Text zum Exportieren.';

  @override
  String get cvPjTrSaved => 'Text gespeichert';

  @override
  String get cvPjExportTranscript => 'Text exportieren';

  @override
  String get cvPjFmtSrt => 'SRT-Untertitel';

  @override
  String get cvPjFmtVtt => 'WebVTT-Untertitel';

  @override
  String get cvPjFmtTxt => 'Nur Text (TXT)';

  @override
  String get cvPjFmtCsv => 'Tabelle (CSV)';

  @override
  String cvPjStTotal(String n) {
    return '$n Dateien';
  }

  @override
  String cvPjStDone(String n) {
    return '$n fertig';
  }

  @override
  String cvPjStErr(String n) {
    return '$n fehlgeschlagen';
  }

  @override
  String cvPjStActive(String n) {
    return '$n werden konvertiert';
  }

  @override
  String cvPjStSpeech(String n) {
    return '$n werden transkribiert';
  }

  @override
  String cvPjStOut(String size) {
    return 'Ausgabe: $size';
  }

  @override
  String cvPjStConc(String n) {
    return 'Gleichzeitig: $n';
  }

  @override
  String get cvPjFinished => 'Konvertierung abgeschlossen';

  @override
  String cvPjFinishedSub(String done, String err, String total) {
    return '$done/$total Dateien fertig · $err fehlgeschlagen';
  }

  @override
  String get cvStPending => 'Ausstehend';

  @override
  String get cvStQueued => 'In Warteschlange';

  @override
  String get cvStConverting => 'Wird konvertiert';

  @override
  String get cvStDone => 'Fertig';

  @override
  String get cvStError => 'Fehler';

  @override
  String get cvStCanceled => 'Abgebrochen';

  @override
  String get cvMainBalloonTitle => 'Convert Master läuft weiter';

  @override
  String get cvMainBalloonBody =>
      'Klicken Sie auf das Symbol im Infobereich, um das Fenster wieder zu öffnen.';

  @override
  String get cvMainTrayShow => 'Convert Master anzeigen';

  @override
  String get cvMainTrayProjects => 'Projekte';

  @override
  String get cvMainTrayNone => '(keine Projekte)';

  @override
  String get cvMainTrayQuit => 'Beenden';

  @override
  String get cvErrCanceled => 'Abgebrochen';

  @override
  String get cvErrNoVideo => 'Die Datei enthält keinen Videostream.';

  @override
  String get cvErrNoAudio => 'Die Datei enthält keinen Ton.';

  @override
  String get cvPjOcrThis => 'Text lesen (OCR)';

  @override
  String get cvPjReocr => 'Text erneut lesen (OCR)';

  @override
  String get cvPjNoText => 'Kein Text';

  @override
  String get cvPjNoTextHint => 'Im Bild wurde kein lesbarer Text gefunden.';

  @override
  String get cvPjOcrPanel => 'Text (OCR)';

  @override
  String get cvPjTrLine => 'Zeile';

  @override
  String get cvPjTrConf => 'Sicherheit';

  @override
  String cvPjLines(String n) {
    return '$n Zeilen';
  }

  @override
  String get cvPjOcrAfter =>
      'Der Text im Bild wird gelesen, sobald es konvertiert ist.';

  @override
  String get cvPjOcrOff =>
      'OCR ist in diesem Projekt aus. Sie können es jetzt für dieses Bild ausführen.';

  @override
  String cvPjOcrRunning(String p) {
    return 'Text wird gelesen… $p %';
  }

  @override
  String get cvPjCopyAll => 'Alles kopieren';

  @override
  String get cvPjCopied => 'Text in die Zwischenablage kopiert';

  @override
  String cvOcrDl(String lang) {
    return 'OCR-Sprachdaten werden heruntergeladen: $lang';
  }

  @override
  String get cvOcrNotInstalled => 'Wird bei der ersten Nutzung geladen';

  @override
  String get cvOcrDownloadFailed =>
      'Die OCR-Sprachdaten konnten nicht heruntergeladen werden';

  @override
  String get cvPfTabOcr => 'OCR';

  @override
  String get cvPfOcrAsk => 'Text in Bildern lesen (OCR)';

  @override
  String get cvPfOcrAskHint =>
      'Text in den Bildern wird ausgelesen: Jede Zeile, ihre Lesesicherheit und der Text erscheinen in eigenen Spalten. Lassen Sie es aus, wenn Sie es nicht brauchen.';

  @override
  String get cvPfOcrLangs => 'Sprache des Textes in den Bildern';

  @override
  String get cvPfOcrLangsHint =>
      'Bis zu 6 Sprachen; weniger Sprachen sind schneller und genauer.';

  @override
  String get cvPfOcrData => 'Sprachdaten';

  @override
  String get cvPfOcrNote =>
      'OCR läuft offline auf diesem Computer (Tesseract); Bilder werden nie an einen Server gesendet. Jede Sprache wird bei der ersten Nutzung einmalig geladen.';

  @override
  String cvErrOcr(String msg) {
    return 'Text konnte nicht gelesen werden: $msg';
  }

  @override
  String get cvErrUnreadable =>
      'Die Datei konnte nicht gelesen werden (beschädigt oder nicht unterstützt).';

  @override
  String get cvErrUnsupported => 'Diese Konvertierung wird nicht unterstützt.';

  @override
  String cvErrFfmpegMissing(String msg) {
    return 'Die Konvertierungs-Engine (ffmpeg) konnte nicht gestartet werden: $msg';
  }

  @override
  String get cvErrEngineMissing =>
      'Die Spracherkennung (whisper.cpp) wurde nicht gefunden.';

  @override
  String cvErrDownload(String msg) {
    return 'Download fehlgeschlagen: $msg';
  }

  @override
  String get cvErrNotFound => 'Datei nicht gefunden.';

  @override
  String get cvErrAccess => 'Zugriff verweigert.';

  @override
  String get cvErrBusy =>
      'Die Datei wird von einem anderen Programm verwendet.';

  @override
  String get cvErrNoSpace => 'Der Datenträger ist voll.';

  @override
  String cvErrFfmpeg(String msg) {
    return 'Konvertierung nicht möglich: $msg';
  }

  @override
  String cvErrWhisper(String msg) {
    return 'Transkription nicht möglich: $msg';
  }

  @override
  String get cvMainCloseActive =>
      'Eine Konvertierung läuft. Wenn Sie das Fenster schließen, wird sie abgebrochen.';

  @override
  String get cvMainCloseAnyway => 'Trotzdem schließen';

  @override
  String get cvMainCopySuffix => ' (Kopie)';

  @override
  String get cvMainErrProjectNotFound => 'Projekt nicht gefunden';

  @override
  String get cvMainExportTo =>
      'Ordner, in den die konvertierten Dateien kopiert werden';

  @override
  String get cvMainPickFile => 'Zu konvertierende Datei wählen';

  @override
  String get cvMainPickFolder => 'Zu konvertierenden Ordner wählen';

  @override
  String get cvMainSaveTranscript => 'Text speichern';

  @override
  String get cvMainUntitled => 'Unbenanntes Projekt';

  @override
  String get sqOp => 'größer oder gleich';

  @override
  String get sqOpNotcontains => 'enthält nicht';

  @override
  String get sqOpNotlike => 'NOT LIKE';

  @override
  String get sqOpNotin => 'nicht in Liste';

  @override
  String get sqOpIsnull => 'ist NULL';

  @override
  String get sqOpIsnotnull => 'ist nicht NULL';

  @override
  String get ipMobScanThis => 'Dieses Netzwerk scannen';

  @override
  String get ipMobDeleteRecord => 'Eintrag löschen';

  @override
  String get ipMobNewRecordHere => 'Neuer Eintrag hier';

  @override
  String get ipMobNoMatch => 'Keine passenden Einträge gefunden.';

  @override
  String ipMobAddresses(int n) {
    return '$n Adressen';
  }

  @override
  String get ipMobAllRecords => 'Alle Einträge';

  @override
  String get ipMobSetScan => 'Scan';

  @override
  String get ipMobSetPorts => 'Zu prüfende Dienste';

  @override
  String get ipMobSetPortsHint =>
      'Für jeden Port wird nur ein normaler TCP-Verbindungsversuch unternommen. Die Liste ist fest; nicht benötigte Einträge können Sie abschalten.';

  @override
  String get ipMobSetSpeed => 'Geschwindigkeit';

  @override
  String get ipMobSetConcurrency => 'Gleichzeitige Verbindungen';

  @override
  String get ipMobSetConcurrencyHint =>
      'Höchstens 64 Verbindungsversuche gleichzeitig (Designgrenze).';

  @override
  String get ipMobSetTimeout => 'Zeitüberschreitung';

  @override
  String get ipMobSetTimeoutHint =>
      'Pro Gerät wird höchstens 1000 ms gewartet.';

  @override
  String get ipMobSetLimitsNote =>
      'IP Tools ist nur ein Erkennungs- und Inventarwerkzeug: Die Portliste kann nicht erweitert werden, es werden keine Schwachstellen- oder Passwortversuche unternommen, und es werden nur private/lokale Adressen gescannt.';

  @override
  String get ipMobMacMobile => 'auf Mobilgeräten nicht verfügbar';

  @override
  String get ipMobAliveTcp => 'Hat auf TCP-Verbindung geantwortet';

  @override
  String get ipMobAliveName => 'Hat auf Namensauflösung geantwortet';

  @override
  String get ipMobOpenInSsh => 'In SSH Master öffnen';

  @override
  String get ipMobOpenInSshNote =>
      'Adresse in die Zwischenablage kopiert; fügen Sie sie im Formular SSH Master › Neue Verbindung ein.';

  @override
  String get ipMobCopyAddress => 'Adresse kopieren';

  @override
  String get ipMobSuggestLocal => 'Netzwerk dieses Geräts';

  @override
  String get ipMobSuggestLocalNone => 'Kein WLAN-Netzwerk gefunden';

  @override
  String get ipMobPhoneNoMacNote =>
      'Auf Mobilgeräten gibt es kein Ping und kein ARP: Die Erreichbarkeit wird über TCP-Verbindungsversuche und Namensauflösung ermittelt; MAC- und Herstellerangaben können nicht angezeigt werden.';

  @override
  String get cvMobNotOnMobile => 'Auf Mobilgeräten nicht verfügbar';

  @override
  String get cvMobSpeechNote =>
      'Sprache-zu-Text (whisper.cpp) ist in der Mobilversion nicht enthalten; die Einstellungen bleiben erhalten und werden am Desktop angewendet.';

  @override
  String get cvMobOcrNote =>
      'Text aus Bildern (OCR, Tesseract) ist in der Mobilversion nicht enthalten; die Einstellungen bleiben erhalten und werden am Desktop angewendet.';

  @override
  String get cvMobFolderNote =>
      'Auf Mobilgeräten kann kein Quellordner gewählt werden; Dateien werden einzeln oder aus der Galerie hinzugefügt.';

  @override
  String get cvMobConcurrencyHint =>
      'Auf Mobilgeräten werden höchstens 2 Dateien gleichzeitig konvertiert.';

  @override
  String get cvMobAddFiles => 'Dateien hinzufügen';

  @override
  String get cvMobAddFromGallery => 'Aus Galerie hinzufügen';

  @override
  String get cvMobPickFilesHint =>
      'Fügen Sie die zu konvertierenden Dateien hinzu; die Ausgaben werden in den Dokumenten der App gespeichert.';

  @override
  String get cvMobShareOutput => 'Ausgabe teilen';

  @override
  String get cvMobShareAllOutputs => 'Alle Ausgaben teilen';

  @override
  String get cvMobSourceCopies => 'Quellkopien';

  @override
  String get cvMobModuleSettings => 'Convert Master-Einstellungen';

  @override
  String get cvMobDefaultConcurrency =>
      'Gleichzeitig konvertierte Dateien in neuen Projekten';

  @override
  String get cvMobStorage => 'Speicher';

  @override
  String get cvMobConversion => 'Konvertierung';

  @override
  String get cvMobClearOrphans => 'Dateien gelöschter Projekte aufräumen';

  @override
  String get cvMobStorageNote =>
      'Konvertierte Dateien und Quellkopien liegen im Dokumentenordner der App; sie verlassen Ihr Gerät nicht.';

  @override
  String get cvMobCleared => 'Bereinigt';

  @override
  String get cvMobNoOutputsYet => 'Noch keine konvertierten Dateien.';

  @override
  String cvMobFilesAdded(int n) {
    return '$n Dateien hinzugefügt';
  }

  @override
  String get cvMobUnsupportedExt =>
      'Nicht unter den Quellerweiterungen dieses Projekts';

  @override
  String get cvMobUnsupportedOnMobile => 'Auf Mobilgeräten nicht unterstützt';

  @override
  String get cvMobLicense =>
      'Video- und Audiokonvertierung erfolgt mit FFmpegKit (LGPL 3.0, ohne GPL-Komponenten); die H.264/H.265-Kodierung nutzt den Hardware-Encoder des Geräts (iOS VideoToolbox, Android MediaCodec).';

  @override
  String cvMobConverted(int n) {
    return '$n Dateien konvertiert';
  }

  @override
  String cvMobFilesCount(int n) {
    return '$n Dateien';
  }

  @override
  String get sqMobUnsupportedMobile =>
      'Diese Engine wird auf Mobilgeräten noch nicht unterstützt';

  @override
  String get sqMobPickFile => 'Auswählen';

  @override
  String get sqMobFileCopied =>
      'Datei in das Dokumentenverzeichnis der App kopiert';

  @override
  String get sqMobSshKeyPaste => 'PEM-Schlüssel einfügen oder aus Datei wählen';

  @override
  String get sqMobErrHost => 'Serveradresse erforderlich';

  @override
  String get sqMobErrFile => 'Datenbankdatei auswählen';

  @override
  String get sqMobErrSshHost => 'SSH-Server und Benutzername erforderlich';

  @override
  String get sqMobErrSshKey => 'Privater SSH-Schlüssel erforderlich';

  @override
  String get sqMobSslVerifyNote =>
      'Der MySQL-Treiber prüft keine Zertifikate; die Option „prüfen“ verhält sich wie „erforderlich“.';

  @override
  String get sqMobRowDetail => 'Zeilendetails';

  @override
  String get sqMobNoResult => 'Kein Ergebnis — mit Ausführen beginnen';

  @override
  String get sqMobExportJsonl => 'JSONL (ein JSON pro Zeile)';

  @override
  String get sqMobExportNoRows => 'Keine Zeilen zum Exportieren';

  @override
  String get sqMobSettingsTitle => 'SQL Master-Einstellungen';

  @override
  String get sqMobRowLimit => 'Zeilenlimit für Abfragen';

  @override
  String get sqMobPreviewRows => 'Zeilen in der Tabellenvorschau';

  @override
  String get sqMobEditorFont => 'Schriftgröße des Editors';

  @override
  String get sqMobCopyCell => 'Wert kopieren';

  @override
  String get sqMobSelectionRun => 'Auswahl ausführen';

  @override
  String get sqMobTunnelOpening => 'SSH-Tunnel wird geöffnet…';

  @override
  String get sqMobConnectingDb => 'Verbindung zur Datenbank wird hergestellt…';

  @override
  String get sqMobOpEq => '= (gleich)';

  @override
  String get sqMobOpNe => '≠ (ungleich)';

  @override
  String get sqMobOpLt => '< (kleiner)';

  @override
  String get sqMobOpGt => '> (größer)';

  @override
  String get sqMobOpLe => '≤ (kleiner oder gleich)';

  @override
  String get npMobSaveAs => 'Speichern unter…';

  @override
  String get npMobSaveAsTitle => 'Speichern unter';

  @override
  String get npMobDefaultProjectName => 'Projekt';

  @override
  String get npMobLocalPathExample => 'Dokumente/Notepad Master/…';

  @override
  String get npMobReplaceAll => 'Alle ersetzen';
}
