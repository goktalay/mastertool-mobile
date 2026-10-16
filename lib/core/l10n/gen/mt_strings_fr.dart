// ignore: unused_import
import 'package:intl/intl.dart' as intl;

import 'mt_strings.dart';

// ignore_for_file: type=lint

/// The translations for French (`fr`).
class MtStringsFr extends MtStrings {
  MtStringsFr([String locale = 'fr']) : super(locale);

  @override
  String get setGeneral => 'Général';

  @override
  String get setAccount => 'Compte';

  @override
  String get setAbout => 'À propos';

  @override
  String aboutVersion(String version) {
    return 'Version $version';
  }

  @override
  String get aboutFamily =>
      'Fait partie de la famille Mastertool : SSH Master · FTP Masters · SQL Master · Notepad Master · Convert Master · IP Tools';

  @override
  String get aboutCheckUpdate => 'Rechercher des mises à jour';

  @override
  String get aboutChecking => 'Vérification…';

  @override
  String aboutUpToDate(String app) {
    return '$app est à jour.';
  }

  @override
  String aboutCheckFailed(String msg) {
    return 'Impossible de rechercher des mises à jour : $msg';
  }

  @override
  String get aboutLicenses => 'Licences open source';

  @override
  String aboutLicensesIntro(String app) {
    return '$app utilise les composants open source suivants :';
  }

  @override
  String authErrAppDisabled(String app) {
    return '$app a été désactivé pour ce compte par un administrateur. Contactez l’administrateur de votre compte.';
  }

  @override
  String authErrWrongApp(String app) {
    return 'Cette session appartient à une autre application. Reconnectez-vous à $app.';
  }

  @override
  String get authSignedOut =>
      'Vous vous êtes déconnecté dans une application Mastertool sur cet ordinateur. Reconnectez-vous.';

  @override
  String get authSubtitle => 'Connectez-vous avec votre compte';

  @override
  String get authEmail => 'E-mail';

  @override
  String get authPassword => 'Mot de passe';

  @override
  String get authRemember => 'Se souvenir de moi';

  @override
  String get authForgot => 'Mot de passe oublié';

  @override
  String get authNoAccount => 'Pas encore de compte ?';

  @override
  String get authRegister => 'Créer un compte';

  @override
  String get authSubmit => 'Se connecter';

  @override
  String get authWorking => 'Connexion…';

  @override
  String get authErrRequired => 'L’e-mail et le mot de passe sont requis.';

  @override
  String get authErrBadCredentials => 'E-mail ou mot de passe incorrect.';

  @override
  String get authErrUnverified =>
      'Votre adresse e-mail n’est pas encore vérifiée. Cliquez sur le lien reçu par e-mail.';

  @override
  String get authErrSuspended => 'Votre compte est suspendu.';

  @override
  String get authErrRateLimited =>
      'Trop de tentatives. Réessayez dans une minute.';

  @override
  String get authErrOffline =>
      'Serveur injoignable. Vérifiez votre connexion Internet.';

  @override
  String get authErrSessionExpired =>
      'Votre session a expiré ou votre mot de passe a changé. Reconnectez-vous.';

  @override
  String authErrServer(String msg) {
    return 'Connexion impossible : $msg';
  }

  @override
  String get acctSection => 'Compte et synchronisation';

  @override
  String acctSignedInAs(String email) {
    return 'Connecté en tant que $email';
  }

  @override
  String get acctSyncToggle => 'Synchroniser les connexions avec le web';

  @override
  String get acctSyncHint =>
      'Les connexions, dossiers et raccourcis sont sauvegardés sur votre compte avec un chiffrement de bout en bout ; le serveur ne peut pas les lire. Les réglages de l’appareil (taille de police, zone de notification) ne sont pas envoyés.';

  @override
  String acctLastSync(String time) {
    return 'Dernière synchronisation : $time';
  }

  @override
  String get acctNever => 'Pas encore synchronisé';

  @override
  String get acctSyncNow => 'Synchroniser maintenant';

  @override
  String get acctDeleteRemote => 'Supprimer la copie du serveur';

  @override
  String get acctDeleteRemoteMsg =>
      'La copie chiffrée de la bibliothèque dans votre compte sera supprimée et la synchronisation désactivée. Les connexions de cet ordinateur ne sont pas supprimées.';

  @override
  String get acctDeleteRemoteDone =>
      'Copie du serveur supprimée ; synchronisation désactivée';

  @override
  String get acctLogout => 'Se déconnecter';

  @override
  String get acctLogoutMsg =>
      'Vous serez déconnecté. Les connexions et projets sur cet appareil sont conservés.';

  @override
  String get acctMyAccount => 'Mon compte (web)';

  @override
  String get acctBackupNotice =>
      'Connexion avec un autre compte ; les connexions précédentes de cet ordinateur ont été sauvegardées.';

  @override
  String get syncOff => 'Synchronisation désactivée';

  @override
  String get syncSyncing => 'Synchronisation…';

  @override
  String get syncOffline =>
      'Hors ligne — les modifications seront envoyées au retour de la connexion';

  @override
  String get syncErrDecrypt =>
      'La copie du serveur n’a pas pu être déchiffrée avec la clé de ce compte ; les connexions de cet ordinateur sont conservées.';

  @override
  String get syncErrTooLarge =>
      'La bibliothèque dépasse la limite de 5 Mo et n’a pas pu être synchronisée.';

  @override
  String syncError(String msg) {
    return 'Erreur de synchronisation : $msg';
  }

  @override
  String get commonCancel => 'Annuler';

  @override
  String get commonSave => 'Enregistrer';

  @override
  String get commonCreate => 'Créer';

  @override
  String get commonOk => 'OK';

  @override
  String get commonDelete => 'Supprimer';

  @override
  String get commonGiveUp => 'Annuler';

  @override
  String get commonOpen => 'Ouvrir';

  @override
  String get commonEdit => 'Modifier';

  @override
  String get commonRename => 'Renommer';

  @override
  String get commonRefresh => 'Actualiser';

  @override
  String get commonNewFolder => 'Nouveau dossier';

  @override
  String get commonCopyPath => 'Copier le chemin';

  @override
  String get commonMove => 'Déplacer';

  @override
  String get commonMoveEllipsis => 'Déplacer…';

  @override
  String get commonShow => 'Afficher';

  @override
  String get commonChoose => 'Parcourir…';

  @override
  String get commonConnect => 'Se connecter';

  @override
  String get commonNew => 'Nouveau';

  @override
  String get commonCopy => 'Copier';

  @override
  String get commonPaste => 'Coller';

  @override
  String commonLocation(String path) {
    return 'Emplacement : $path';
  }

  @override
  String get commonNewName => 'Nouveau nom';

  @override
  String get commonFolderName => 'Nom du dossier';

  @override
  String get setTitle => 'Paramètres';

  @override
  String get setAppearance => 'Apparence';

  @override
  String get setTheme => 'Thème';

  @override
  String get setThemeDark => 'Nuit';

  @override
  String get setThemeLight => 'Jour';

  @override
  String get setThemeSystem => 'Préférence du système';

  @override
  String get setLanguage => 'Langue';

  @override
  String get setLanguageHint => 'La langue est appliquée immédiatement.';

  @override
  String get setSaved => 'Paramètres enregistrés';

  @override
  String get mobModules => 'Modules';

  @override
  String get mobDisabled => 'Désactivé sur votre compte';

  @override
  String get mobSoon => 'Ce module arrive bientôt';

  @override
  String get mobOpen => 'Ouvrir';

  @override
  String get mobRefresh => 'Actualiser';

  @override
  String get mobSettings => 'Paramètres';

  @override
  String mobWelcome(String name) {
    return 'Bienvenue, $name';
  }

  @override
  String get mobNoModules =>
      'Impossible de charger les modules. Vérifiez la connexion et actualisez.';

  @override
  String get mobSite => 'mastertool.download';

  @override
  String get mobLangSystem => 'Langue du système';

  @override
  String get mobSsoHint =>
      'Une seule connexion suffit : SSH Master, FTP Masters, SQL Master, Notepad Master, Convert Master et IP Tools s’ouvrent dans cette application.';

  @override
  String mobOpenCount(String open, String total) {
    return '$open/$total modules actifs';
  }

  @override
  String get mobModulesHint => 'Touchez pour ouvrir';

  @override
  String get mobTapToOpen => 'Prêt à l’emploi';

  @override
  String get mobVisitSite => 'Visiter le site web';
}
