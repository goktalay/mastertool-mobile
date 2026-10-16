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
}
