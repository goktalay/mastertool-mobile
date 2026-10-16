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

  @override
  String get smAppSearchPh => 'Rechercher des connexions…  (Ctrl+F)';

  @override
  String get smAppNewConn => 'Nouvelle connexion';

  @override
  String smAppSplit(String n) {
    return 'Ouvrir en partagé ($n)';
  }

  @override
  String get smAppSplitTitle =>
      'Ouvrir les connexions sélectionnées en partagé dans une seule fenêtre';

  @override
  String get smAppSettings => 'Paramètres';

  @override
  String smAppStats(String c, String f) {
    return '$c connexions · $f dossiers';
  }

  @override
  String get smAppWelcome => 'Bienvenue';

  @override
  String smAppResults(String q) {
    return 'Résultats pour « $q »';
  }

  @override
  String get smAppAll => 'Toutes les connexions';

  @override
  String get smAppWelcomeHint =>
      'Créez votre première connexion SSH.<br>Saisissez les informations du serveur, testez et enregistrez.';

  @override
  String get smAppFolders => 'Dossiers';

  @override
  String get smAppConnections => 'Connexions';

  @override
  String get smAppMultiHint =>
      'Ctrl+clic pour en sélectionner plusieurs et les ouvrir en partagé dans une seule fenêtre';

  @override
  String get smAppNoMatch => 'Aucune connexion correspondante.';

  @override
  String smAppFolderCount(String n) {
    return '$n connexions';
  }

  @override
  String get smAppFolderOpenSplit =>
      'Ouvrir les connexions du dossier en partagé';

  @override
  String get smAppNewConnHere => 'Nouvelle connexion dans ce dossier';

  @override
  String get smAppNewSubfolder => 'Créer un sous-dossier';

  @override
  String get smAppKeyTag => 'Clé';

  @override
  String get smAppLastDir => 'Dernier dossier';

  @override
  String get smAppLastDirTag => 'dernier dossier';

  @override
  String smAppMultiOpenSplit(String n) {
    return 'Ouvrir $n connexions en partagé dans une fenêtre';
  }

  @override
  String get smAppOpenSeparate => 'Ouvrir chacune dans sa propre fenêtre';

  @override
  String get smAppClearSelection => 'Effacer la sélection';

  @override
  String get smAppSideBySide => 'Ouvrir deux sessions côte à côte';

  @override
  String get smAppDuplicate => 'Dupliquer';

  @override
  String get smAppMoveToFolder => 'Déplacer vers un dossier…';

  @override
  String get smAppResetLastDir => 'Réinitialiser le dernier dossier';

  @override
  String get smAppConnMoved => 'Connexion déplacée';

  @override
  String get smAppFolderIntoSelf =>
      'Un dossier ne peut pas être déplacé dans son propre sous-dossier';

  @override
  String get smAppFolderPh => 'ex. Serveurs de production';

  @override
  String get smAppRenameFolder => 'Renommer le dossier';

  @override
  String get smAppDeleteFolder => 'Supprimer le dossier';

  @override
  String smAppDeleteFolderMsg(String name) {
    return 'Le dossier <b>$name</b> sera supprimé.';
  }

  @override
  String smAppDeleteFolderConns(String n) {
    return ' Ses $n connexions ne sont pas supprimées ; elles remontent d’un niveau.';
  }

  @override
  String get smAppRootFolder => 'Toutes les connexions (racine)';

  @override
  String smAppMoveTitle(String name) {
    return 'Déplacer « $name »';
  }

  @override
  String get smAppTargetFolder => 'Dossier cible';

  @override
  String get smAppDeleteConn => 'Supprimer la connexion';

  @override
  String smAppDeleteConnMsg(String name, String target) {
    return '<b>$name</b> ($target) sera supprimée définitivement.';
  }

  @override
  String get smAppMaxPanes => 'Au plus 6 volets peuvent être ouverts';

  @override
  String get smAppMaxPanesSub => 'Les 6 premières connexions ont été ouvertes';

  @override
  String get smFormTitleNew => 'Nouvelle connexion SSH';

  @override
  String get smFormTitleEdit => 'Modifier la connexion';

  @override
  String get smFormName => 'Nom de la connexion';

  @override
  String get smFormNamePh => 'ex. Serveur web';

  @override
  String get smFormHost => 'Adresse IP / Hôte';

  @override
  String get smFormHostPh => '192.168.1.10 ou serveur.com';

  @override
  String get smFormPort => 'Port';

  @override
  String get smFormUser => 'Nom d’utilisateur';

  @override
  String get smFormAuth => 'Authentification';

  @override
  String get smFormPassword => 'Mot de passe';

  @override
  String get smFormPrivateKey => 'Clé privée';

  @override
  String get smFormPwSaved => '•••••••• (enregistré — saisissez pour modifier)';

  @override
  String get smFormKeyFile => 'Fichier de clé';

  @override
  String get smFormPassphrase => 'Phrase secrète de la clé (le cas échéant)';

  @override
  String get smFormPassSaved => '•••••••• (enregistrée)';

  @override
  String get smFormPassEmpty => 'Laissez vide s’il n’y en a pas';

  @override
  String get smFormFolder => 'Dossier';

  @override
  String get smFormColor => 'Couleur';

  @override
  String get smFormPalette => 'Palette de couleurs de la console';

  @override
  String get smFormLastDir => 'Aller au dernier dossier utilisé';

  @override
  String get smFormLastDirHint =>
      'À la connexion, le terminal et le gestionnaire de fichiers s’ouvrent dans le dernier dossier utilisé.';

  @override
  String get smFormLastDirNow => 'Actuellement :';

  @override
  String get smFormConnecting => 'Connexion…';

  @override
  String get smFormTestOk => 'Connexion réussie';

  @override
  String smFormHostKey(String fp) {
    return 'Clé d’hôte (SHA256) : $fp';
  }

  @override
  String get smFormTestFail => 'Échec de la connexion';

  @override
  String get smFormSaved => 'Connexion enregistrée';

  @override
  String get smFormChangesSaved => 'Modifications enregistrées';

  @override
  String get smFormTest => 'Tester la connexion';

  @override
  String get smFormSaveConnect => 'Enregistrer et se connecter';

  @override
  String get smPaneToggleSidebar =>
      'Afficher/masquer le panneau latéral (Ctrl+B)';

  @override
  String get smPaneDefaultName => 'Connexion';

  @override
  String get smPaneSplitRight => 'Partager à droite';

  @override
  String get smPaneSplitDown => 'Partager en bas';

  @override
  String get smPaneReconnect => 'Se reconnecter';

  @override
  String get smPaneClose => 'Fermer le volet';

  @override
  String get smPaneSaveSelShortcut =>
      'Enregistrer la sélection comme raccourci';

  @override
  String get smPanePaletteMenu => 'Palette de couleurs de la console…';

  @override
  String get smPaneSelectAll => 'Tout sélectionner';

  @override
  String get smPaneClear => 'Effacer l’écran';

  @override
  String get smPaneStatusConnecting => 'connexion…';

  @override
  String get smPaneStatusNoConn => 'non connecté';

  @override
  String get smPaneStatusClosed => 'connexion fermée';

  @override
  String get smTermConnecting => 'Connexion…';

  @override
  String get smTermConnectFailed => 'Connexion impossible :';

  @override
  String get smTermRetryEnter => 'Appuyez sur Entrée pour réessayer.';

  @override
  String get smTermClosed => 'Connexion fermée.';

  @override
  String get smTermReconnectEnter =>
      'Appuyez sur Entrée pour vous reconnecter.';

  @override
  String smTermMaxPanes(String n) {
    return 'Au plus $n volets peuvent être ouverts dans une fenêtre';
  }

  @override
  String smTermSessions(String n) {
    return '$n sessions';
  }

  @override
  String get smTermToggleAll => 'Afficher/masquer tous les panneaux latéraux';

  @override
  String get smTermSplitRightTitle =>
      'Partager le volet actif à droite (Ctrl+Shift+E)';

  @override
  String get smTermSplitDownTitle =>
      'Partager le volet actif en bas (Ctrl+Shift+O)';

  @override
  String get smTermSyncOn => 'Saisie dans tous les volets';

  @override
  String get smTermSyncOff => 'Saisir dans tous les volets';

  @override
  String get smTermSyncTitle =>
      'Ce que vous tapez est envoyé à tous les volets connectés';

  @override
  String get smPickerSearch => 'Rechercher une connexion…';

  @override
  String get smPickerSameServer => 'même serveur';

  @override
  String get smPickerNone => 'Aucune connexion correspondante';

  @override
  String get smPickerTitleRight => 'Partager à droite — choisir une connexion';

  @override
  String get smPickerTitleDown => 'Partager en bas — choisir une connexion';

  @override
  String get smPaletteTitle => 'Palette de couleurs de la console';

  @override
  String smPaletteHint(String name) {
    return 'La palette choisie est prévisualisée immédiatement dans ce volet. Si vous l’enregistrez, toutes les sessions de cette connexion ($name) l’utiliseront.';
  }

  @override
  String get smPaletteSaved => 'Palette de couleurs enregistrée';

  @override
  String get smScTitleNew => 'Nouveau raccourci';

  @override
  String get smScTitleEdit => 'Modifier le raccourci';

  @override
  String get smScName => 'Nom du raccourci';

  @override
  String get smScNamePh => 'ex. Redémarrer Nginx';

  @override
  String get smScCommand => 'Commande';

  @override
  String get smScEnter => 'Appuyer sur Entrée après le collage';

  @override
  String get smScEnterHint =>
      'Si désactivé, la commande est seulement saisie au curseur et vous l’exécutez vous-même.';

  @override
  String get smScEmpty =>
      'Aucun raccourci pour l’instant.<br>Ajoutez vos commandes fréquentes avec <b>+</b> et double-cliquez pour les coller dans le terminal.';

  @override
  String get smScItemTitle =>
      'Double-clic : coller dans le terminal de ce volet';

  @override
  String get smScAutoEnter => 'Entrée auto';

  @override
  String get smScPaste => 'Coller dans le terminal';

  @override
  String get smScPasteNoEnter => 'Coller sans Entrée';

  @override
  String get smScPasteRun => 'Coller et exécuter';

  @override
  String get smScCopy => 'Copier dans le presse-papiers';

  @override
  String get smScNew => 'Nouveau raccourci';

  @override
  String get smSbShortcuts => 'Raccourcis';

  @override
  String get smSbAddShortcut => 'Ajouter un raccourci';

  @override
  String get smSbServer => 'Serveur';

  @override
  String smSbServerHost(String host) {
    return 'Serveur · $host';
  }

  @override
  String get smSbFollow => 'Suivre le dossier du terminal';

  @override
  String get smSbHome => 'Dossier personnel';

  @override
  String get smSbUp => 'Dossier parent';

  @override
  String get smSbComputer => 'Ce PC';

  @override
  String get smSbPlaces => 'Lecteurs et emplacements';

  @override
  String get smSbResize => 'Faites glisser pour redimensionner';

  @override
  String get smFmLoading => 'Chargement…';

  @override
  String smFmOpenFailed(String msg) {
    return 'Ouverture impossible : $msg';
  }

  @override
  String get smFmEmpty => 'Le dossier est vide';

  @override
  String get smFmNoConn => 'Non connecté.';

  @override
  String get smFmClosed => 'Connexion fermée.';

  @override
  String get smFmWaiting => 'En attente de connexion…';

  @override
  String smFmDownloadTo(String path) {
    return 'Télécharger → $path';
  }

  @override
  String smFmUploadTo(String path) {
    return 'Envoyer → $path';
  }

  @override
  String get smFmServer => 'serveur';

  @override
  String get smFmCdHere => 'Aller à ce dossier dans le terminal';

  @override
  String get smFmPastePath => 'Coller le chemin dans le terminal';

  @override
  String smFmDeleteWhat(String what) {
    return 'Supprimer ($what)';
  }

  @override
  String smFmNItems(String n) {
    return '$n éléments';
  }

  @override
  String get smFmOpenDefault => 'Ouvrir avec l’application par défaut';

  @override
  String get smFmReveal => 'Afficher dans l’Explorateur';

  @override
  String get smFmOpenExplorer => 'Ouvrir dans l’Explorateur';

  @override
  String get smFmFollowing =>
      'Le gestionnaire de fichiers suit le dossier du terminal';

  @override
  String get smFmFollowOff => 'Suivi désactivé';

  @override
  String get smFmNewRemote => 'Nouveau dossier sur le serveur';

  @override
  String get smFmDeleteTitle => 'Supprimer du serveur';

  @override
  String smFmAndMore(String n) {
    return ' et $n de plus';
  }

  @override
  String smFmDeleteMsg(String names) {
    return '$names sera supprimé du serveur <b>définitivement</b>. Les dossiers sont supprimés avec leur contenu.';
  }

  @override
  String get smPlaceDesktop => 'Bureau';

  @override
  String get smPlaceDownloads => 'Téléchargements';

  @override
  String get smPlaceDocuments => 'Documents';

  @override
  String get smPlaceHome => 'Dossier utilisateur';

  @override
  String smPlaceDrive(String d) {
    return 'Disque local ($d)';
  }

  @override
  String get smErrNoConn => 'Non connecté';

  @override
  String get smErrConnectFirst => 'Connectez-vous d’abord au serveur';

  @override
  String get smErrMkdir => 'Impossible de créer le dossier';

  @override
  String get smErrRename => 'Impossible de renommer';

  @override
  String smErrDelete(String name) {
    return 'Impossible de supprimer : $name';
  }

  @override
  String get smTrPanelTitle => 'Transferts';

  @override
  String get smTrClearDone => 'Effacer les terminés';

  @override
  String get smTrQueued => 'En attente';

  @override
  String get smTrScanning => 'Analyse des fichiers…';

  @override
  String smTrFileCount(String i, String n) {
    return '$i / $n fichiers';
  }

  @override
  String smTrEta(String time) {
    return '~$time restant';
  }

  @override
  String smTrDownloading(String name) {
    return 'Téléchargement : $name';
  }

  @override
  String smTrUploading(String name) {
    return 'Envoi : $name';
  }

  @override
  String get smTrDone => 'Terminé';

  @override
  String get smTrCancelled => 'Annulé';

  @override
  String get smTrFailed => 'Échec';

  @override
  String get smTrRemoveFromList => 'Retirer de la liste';

  @override
  String get smTrAlwaysBackground =>
      'Désormais, toujours afficher les gros transferts en arrière-plan';

  @override
  String get smTrShowInBackground => 'Continuer en arrière-plan';

  @override
  String get smTrDownloadDone => 'Téléchargement terminé';

  @override
  String get smTrUploadDone => 'Envoi terminé';

  @override
  String smTrDownloadFailed(String name) {
    return 'Échec du téléchargement : $name';
  }

  @override
  String smTrUploadFailed(String name) {
    return 'Échec de l’envoi : $name';
  }

  @override
  String get smTrCancelledToast => 'Transfert annulé';

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
      'Échec de l’authentification : nom d’utilisateur ou mot de passe incorrect.';

  @override
  String get smMainErrRefused =>
      'Connexion refusée : le port est fermé ou le service SSH ne fonctionne pas.';

  @override
  String get smMainErrTimeout => 'Délai dépassé : serveur injoignable.';

  @override
  String get smMainErrDns => 'Le nom d’hôte n’a pas pu être résolu (DNS).';

  @override
  String get smMainErrUnreach => 'Le serveur est injoignable sur le réseau.';

  @override
  String get smMainErrKeyFile => 'Fichier de clé introuvable.';

  @override
  String smMainErrHostKey(String newFp, String oldFp) {
    return 'La clé d’hôte du serveur a changé ! Enregistrée : $oldFp, reçue : $newFp. Connexion refusée par sécurité.';
  }

  @override
  String get smMainErrConnNotFound => 'Connexion introuvable';

  @override
  String get smMainErrNoSession => 'Aucune session SSH active';

  @override
  String get smMainErrHostUser =>
      'L’adresse du serveur et le nom d’utilisateur sont requis.';

  @override
  String get smMainTrayShow => 'Afficher SSH Master';

  @override
  String get smMainTrayQuick => 'Connexion rapide';

  @override
  String get smMainTrayNone => 'Aucune connexion enregistrée';

  @override
  String get smMainTrayQuit => 'Quitter';

  @override
  String get smMainBalloonTitle => 'SSH Master fonctionne en arrière-plan';

  @override
  String get smMainBalloonBody => 'Cliquez sur l’icône pour le rouvrir.';

  @override
  String get smMainPickKey => 'Choisir un fichier de clé privée';

  @override
  String get smMainCopySuffix => ' (copie)';

  @override
  String get smMainDefDisk => 'Utilisation du disque';

  @override
  String get smMainDefMem => 'Mémoire';

  @override
  String get smMainDefTop => 'Processus (top)';

  @override
  String get smAppNotesLabel => 'Notes';

  @override
  String get fmAppSearchPh => 'Rechercher des sites…  (Ctrl+F)';

  @override
  String get fmAppNewConn => 'Nouveau site';

  @override
  String get fmAppSettings => 'Paramètres';

  @override
  String fmAppStats(String c, String f) {
    return '$c sites · $f dossiers';
  }

  @override
  String get fmAppWelcome => 'Bienvenue';

  @override
  String fmAppResults(String q) {
    return 'Résultats pour “$q”';
  }

  @override
  String get fmAppAll => 'Tous les sites';

  @override
  String get fmAppWelcomeHint =>
      'Créez votre premier site FTP / SFTP.<br>Saisissez les informations du serveur, testez la connexion et enregistrez.';

  @override
  String get fmAppFolders => 'Dossiers';

  @override
  String get fmAppConnections => 'Sites';

  @override
  String get fmAppDblHint => 'Double-cliquez sur une carte pour vous connecter';

  @override
  String get fmAppNoMatch => 'Aucun site correspondant.';

  @override
  String fmAppFolderCount(String n) {
    return '$n sites';
  }

  @override
  String get fmAppNewConnHere => 'Nouveau site dans ce dossier';

  @override
  String get fmAppNewSubfolder => 'Nouveau sous-dossier';

  @override
  String get fmAppKeyTag => 'Clé';

  @override
  String get fmAppLastDir => 'Dernier dossier';

  @override
  String get fmAppLastDirTag => 'dernier dossier';

  @override
  String get fmAppDuplicate => 'Dupliquer';

  @override
  String get fmAppMoveToFolder => 'Déplacer vers un dossier…';

  @override
  String get fmAppResetLastDir => 'Réinitialiser le dernier dossier';

  @override
  String get fmAppConnMoved => 'Site déplacé';

  @override
  String get fmAppFolderIntoSelf =>
      'Un dossier ne peut pas être déplacé dans lui-même';

  @override
  String get fmAppFolderPh => 'ex. Clients';

  @override
  String get fmAppRenameFolder => 'Renommer le dossier';

  @override
  String get fmAppDeleteFolder => 'Supprimer le dossier';

  @override
  String fmAppDeleteFolderMsg(String name) {
    return 'Supprimer le dossier <b>$name</b> ?';
  }

  @override
  String fmAppDeleteFolderConns(String n) {
    return '<br>Ses $n sites seront déplacés vers le dossier parent.';
  }

  @override
  String get fmAppRootFolder => 'Niveau supérieur (aucun dossier)';

  @override
  String fmAppMoveTitle(String name) {
    return 'Déplacer “$name”';
  }

  @override
  String get fmAppTargetFolder => 'Dossier cible';

  @override
  String get fmAppDeleteConn => 'Supprimer le site';

  @override
  String fmAppDeleteConnMsg(String name, String target) {
    return 'Supprimer le site <b>$name</b> ($target) ?';
  }

  @override
  String get fmFormTitleNew => 'Nouveau site';

  @override
  String fmFormTitleEdit(String name) {
    return 'Propriétés du site : $name';
  }

  @override
  String get fmFormTabGeneral => 'Général';

  @override
  String get fmFormTabActions => 'Actions';

  @override
  String get fmFormTabType => 'Type';

  @override
  String get fmFormTabOptions => 'Options';

  @override
  String get fmFormName => 'Libellé';

  @override
  String get fmFormNamePh => 'ex. Site web de l’entreprise';

  @override
  String get fmFormHost => 'Adresse de l’hôte';

  @override
  String get fmFormHostPh => 'ftp.example.com ou 192.168.1.10';

  @override
  String get fmFormPort => 'Port';

  @override
  String get fmFormUser => 'Nom d’utilisateur';

  @override
  String get fmFormPassword => 'Mot de passe';

  @override
  String get fmFormPwSaved => '•••••••• (enregistré, saisissez pour modifier)';

  @override
  String get fmFormLoginMethod => 'Méthode de connexion';

  @override
  String get fmFormLoginNormal => 'Normale';

  @override
  String get fmFormLoginAnon => 'Anonyme';

  @override
  String get fmFormAuth => 'Authentification SFTP';

  @override
  String get fmFormPrivateKey => 'Clé privée';

  @override
  String get fmFormKeyFile => 'Fichier de clé privée';

  @override
  String get fmFormPassphrase => 'Phrase secrète de la clé';

  @override
  String get fmFormPassSaved => '(enregistrée)';

  @override
  String get fmFormPassEmpty => 'Laissez vide s’il n’y en a pas';

  @override
  String get fmFormFolder => 'Dossier';

  @override
  String get fmFormColor => 'Couleur';

  @override
  String get fmFormComments => 'Commentaires';

  @override
  String get fmFormRemoteDir =>
      'Une fois connecté, aller dans ce dossier distant';

  @override
  String get fmFormLocalDir => 'Une fois connecté, aller dans ce dossier local';

  @override
  String get fmFormLocalDirPh => 'ex. C:\\Projets\\site';

  @override
  String get fmFormLastDir => 'Reprendre dans le dossier où je me suis arrêté';

  @override
  String get fmFormLastDirHint =>
      'Si activé, le site s’ouvre dans les derniers dossiers du serveur et de l’ordinateur où vous avez travaillé (au lieu des dossiers ci-dessus).';

  @override
  String get fmFormLastDirNow => 'Actuellement :';

  @override
  String get fmFormCache => 'Cache pour la navigation';

  @override
  String get fmFormCacheSession => 'Utiliser le cache pendant la session';

  @override
  String get fmFormCacheAlways =>
      'Toujours utiliser le cache (tant que l’application est ouverte)';

  @override
  String get fmFormCacheNever =>
      'Ne jamais utiliser le cache (toujours relister)';

  @override
  String get fmFormUploadCase =>
      'Lors de l’envoi, appliquer cette règle aux noms de fichiers et de dossiers';

  @override
  String get fmFormCasePreserve => 'Conserver la casse';

  @override
  String get fmFormCaseLower => 'Minuscules';

  @override
  String get fmFormCaseUpper => 'Majuscules';

  @override
  String get fmFormTest => 'Tester la connexion';

  @override
  String get fmFormSaveConnect => 'Enregistrer et se connecter';

  @override
  String get fmFormConnecting => 'Connexion…';

  @override
  String get fmFormTestOk => 'Connexion réussie';

  @override
  String get fmFormTestFail => 'Connexion impossible';

  @override
  String fmFormHomeDir(String dir) {
    return 'Dossier de départ : $dir';
  }

  @override
  String get fmFormRemoteDirMissing =>
      'Attention : le dossier distant n’a pas pu être ouvert.';

  @override
  String fmFormHostKey(String fp) {
    return 'Clé d’hôte SSH (SHA256) : $fp';
  }

  @override
  String get fmFormSaved => 'Site enregistré';

  @override
  String get fmFormChangesSaved => 'Modifications enregistrées';

  @override
  String get fmTypeProtocol => 'Protocole';

  @override
  String get fmTypeFtp => 'FTP (protocole de transfert de fichiers standard)';

  @override
  String get fmTypeFtpsImplicit => 'FTP avec TLS/SSL (implicite, port 990)';

  @override
  String get fmTypeFtpsSsl => 'FTP avec SSL (AUTH SSL, explicite)';

  @override
  String get fmTypeFtpsTls => 'FTP avec TLS/SSL (AUTH TLS, explicite)';

  @override
  String get fmTypeSftp => 'SFTP via SSH2 (Secure Shell)';

  @override
  String get fmTypeNoteFtp =>
      'Utilise le protocole FTP standard pour les connexions de commande et de données, sans sécurité (en texte clair).';

  @override
  String get fmTypeNoteFtpsImplicit =>
      'La connexion est chiffrée en TLS/SSL dès le départ (généralement port 990). Les commandes et les données sont protégées.';

  @override
  String get fmTypeNoteFtpsSsl =>
      'Se connecte en FTP simple puis passe à une session chiffrée avec AUTH SSL. Les commandes et les données sont protégées.';

  @override
  String get fmTypeNoteFtpsTls =>
      'Se connecte en FTP simple puis passe à une session chiffrée avec AUTH TLS (le type FTPS le plus courant).';

  @override
  String get fmTypeNoteSftp =>
      'Transfert de fichiers chiffré via SSH (port 22). Connexion par mot de passe ou clé privée ; la clé d’hôte est enregistrée à la première connexion.';

  @override
  String get fmTypeTransferType => 'Type de transfert';

  @override
  String get fmTypeBinary => 'Binaire';

  @override
  String get fmTypeAscii => 'ASCII (texte)';

  @override
  String get fmTypeAuto => 'Auto (fichiers texte en ASCII)';

  @override
  String fmTypeUseGlobal(String v) {
    return 'Utiliser le paramètre global ($v)';
  }

  @override
  String get fmTypeDataConn => 'Connexion de données';

  @override
  String get fmTypePassive => 'Passive (PASV / EPSV)';

  @override
  String get fmTypeTimezone => 'Décalage horaire du serveur';

  @override
  String get fmTypeTzNone => 'Aucun décalage';

  @override
  String get fmTypeTzHours => 'heures';

  @override
  String get fmTypeTimezoneHint =>
      'Les heures des fichiers listées par le serveur sont décalées de cette valeur.';

  @override
  String get fmOptSiteOptions => 'Options propres au site';

  @override
  String get fmOptUseGlobal =>
      'Utiliser les paramètres globaux pour toutes les options';

  @override
  String get fmOptCustom => 'Utiliser des paramètres propres à ce site';

  @override
  String get fmOptRetry => 'Nombre de tentatives';

  @override
  String get fmOptRetryDelay => 'Délai entre les tentatives (s)';

  @override
  String get fmOptMaxConcurrent => 'Transferts simultanés max.';

  @override
  String get fmOptConflict => 'Si un fichier du même nom existe';

  @override
  String get fmOptConflictOverwrite => 'Remplacer';

  @override
  String get fmOptConflictRename => 'Renommer automatiquement (nom (1).ext)';

  @override
  String get fmOptConflictSkip => 'Ignorer';

  @override
  String get fmOptEncoding => 'Encodage des noms de fichiers';

  @override
  String get fmOptEncAuto => 'Auto';

  @override
  String get fmSiteLocal => 'Mon ordinateur';

  @override
  String get fmSiteRemote => 'Serveur';

  @override
  String get fmSiteTransfers => 'Transferts';

  @override
  String get fmSiteToggleLocal => 'Afficher/masquer Mon ordinateur (Ctrl+B)';

  @override
  String get fmSiteToggleTransfers =>
      'Afficher/masquer les transferts (Ctrl+J)';

  @override
  String get fmSiteReconnect => 'Se reconnecter';

  @override
  String get fmSitePlaces => 'Accès rapide et lecteurs';

  @override
  String get fmSiteUp => 'Dossier parent (Backspace)';

  @override
  String get fmSiteHome => 'Dossier de départ';

  @override
  String get fmSiteColName => 'Nom';

  @override
  String get fmSiteColSize => 'Taille';

  @override
  String get fmSiteColDate => 'Modifié';

  @override
  String get fmSiteLoading => 'Chargement…';

  @override
  String get fmSiteEmptyDir => 'Ce dossier est vide';

  @override
  String get fmSiteDesktop => 'Bureau';

  @override
  String get fmSiteDownloads => 'Téléchargements';

  @override
  String get fmSiteDocuments => 'Documents';

  @override
  String get fmSiteHomeDir => 'Dossier utilisateur';

  @override
  String get fmSiteOpenExplorer => 'Ouvrir dans l’Explorateur';

  @override
  String get fmSiteOpenFile => 'Ouvrir avec l’application par défaut';

  @override
  String get fmSiteShowExplorer => 'Afficher dans l’Explorateur';

  @override
  String get fmSiteUpload => 'Envoyer';

  @override
  String fmSiteUploadN(String n) {
    return 'Envoyer $n éléments';
  }

  @override
  String fmSiteUploadTo(String dir) {
    return 'Cible : $dir';
  }

  @override
  String get fmSiteDownload => 'Télécharger';

  @override
  String fmSiteDownloadN(String n) {
    return 'Télécharger $n éléments';
  }

  @override
  String fmSiteDownloadTo(String dir) {
    return 'Cible : $dir';
  }

  @override
  String get fmSiteTrash => 'Placer dans la Corbeille';

  @override
  String get fmSiteTrashOk => 'Déplacer';

  @override
  String fmSiteTrashOne(String name) {
    return 'Placer <b>$name</b> dans la Corbeille ?';
  }

  @override
  String fmSiteTrashMany(String n) {
    return 'Placer $n éléments dans la Corbeille ?';
  }

  @override
  String get fmSiteMkdirFail => 'Impossible de créer le dossier';

  @override
  String get fmSiteRenameFail => 'Impossible de renommer';

  @override
  String get fmSiteDeleteFail => 'Impossible de supprimer';

  @override
  String get fmSiteDeleteTitle => 'Supprimer du serveur';

  @override
  String fmSiteDelOne(String name) {
    return 'Supprimer définitivement le fichier <b>$name</b> du serveur ?';
  }

  @override
  String fmSiteDelDirOne(String name) {
    return 'Supprimer définitivement le dossier <b>$name</b> et tout son contenu du serveur ?';
  }

  @override
  String fmSiteDelMany(String n) {
    return 'Supprimer définitivement $n éléments (dossiers avec tout leur contenu) du serveur ?';
  }

  @override
  String get fmSiteDeleting => 'Suppression…';

  @override
  String get fmSiteDeleted => 'Supprimé';

  @override
  String fmSiteItems(String n) {
    return '$n éléments';
  }

  @override
  String get fmSiteOffline => 'Non connecté';

  @override
  String fmSiteLimit(String v) {
    return 'Limite de vitesse : $v';
  }

  @override
  String get fmSiteNoLimit => 'Aucune limite de vitesse';

  @override
  String get fmSiteLimitTitle => 'Définir la limite de vitesse';

  @override
  String fmSiteConnectFail(String msg) {
    return 'Impossible de se connecter au serveur : $msg';
  }

  @override
  String get fmSiteConnectFailTitle => 'Échec de la connexion';

  @override
  String get fmSiteStateConnected => 'Connecté';

  @override
  String get fmSiteStateConnecting => 'Connexion…';

  @override
  String get fmSiteStateDisconnected => 'Déconnecté';

  @override
  String get fmTrColName => 'Nom';

  @override
  String get fmTrColSize => 'Taille';

  @override
  String get fmTrColProgress => 'Progression';

  @override
  String get fmTrColStatus => 'État';

  @override
  String get fmTrEmpty =>
      'Aucun transfert pour l’instant.\nFaites un clic droit sur un fichier ou un dossier et choisissez Télécharger / Envoyer, ou faites glisser entre les panneaux.';

  @override
  String get fmTrQueued => 'En attente';

  @override
  String get fmTrActive => 'Transfert en cours';

  @override
  String get fmTrDone => 'Terminé';

  @override
  String fmTrDoneFiles(String n) {
    return '$n fichiers terminés';
  }

  @override
  String get fmTrError => 'Erreur';

  @override
  String get fmTrCancelled => 'Annulé';

  @override
  String get fmTrSkipped => 'Ignoré (existe déjà)';

  @override
  String fmTrScanning(String n) {
    return 'Analyse… $n fichiers';
  }

  @override
  String get fmTrRetrying => 'Nouvelle tentative…';

  @override
  String get fmTrCancel => 'Annuler';

  @override
  String get fmTrCancelDir => 'Annuler le transfert du dossier';

  @override
  String get fmTrCancelAll => 'Annuler tous les transferts';

  @override
  String get fmTrCancelAllMsg =>
      'Annuler tous les transferts en cours et en attente ?';

  @override
  String get fmTrCancelAllOk => 'Tout annuler';

  @override
  String get fmTrRetry => 'Réessayer';

  @override
  String get fmTrShowLocal => 'Afficher dans l’Explorateur';

  @override
  String get fmTrShowRemote => 'Afficher sur le serveur';

  @override
  String get fmTrCopyError => 'Copier le message d’erreur';

  @override
  String get fmTrRemove => 'Retirer de la liste';

  @override
  String get fmTrRemoveRoot => 'Retirer ce transfert de la liste';

  @override
  String get fmTrClearDone => 'Effacer les terminés';

  @override
  String fmTrActiveN(String n) {
    return '$n transferts en cours';
  }

  @override
  String get fmTrDownloadDone => 'Téléchargement terminé';

  @override
  String get fmTrUploadDone => 'Envoi terminé';

  @override
  String fmTrDownloadFailed(String name) {
    return 'Téléchargement incomplet : $name';
  }

  @override
  String fmTrUploadFailed(String name) {
    return 'Envoi incomplet : $name';
  }

  @override
  String fmTrFailedFiles(String n) {
    return '$n fichiers en échec';
  }

  @override
  String get fmMainErrAuth =>
      'Échec de l’authentification : nom d’utilisateur ou mot de passe incorrect.';

  @override
  String get fmMainErrRefused =>
      'Connexion refusée : le port est fermé ou le serveur n’est pas démarré.';

  @override
  String get fmMainErrTimeout => 'Délai dépassé : serveur injoignable.';

  @override
  String get fmMainErrDns => 'Impossible de résoudre le nom d’hôte (DNS).';

  @override
  String get fmMainErrUnreach => 'Le serveur est injoignable sur le réseau.';

  @override
  String get fmMainErrReset => 'Le serveur a fermé la connexion.';

  @override
  String get fmMainErrNotFound => 'Fichier ou dossier introuvable.';

  @override
  String get fmMainErrPerm => 'Autorisation refusée.';

  @override
  String fmMainErr550(String msg) {
    return 'Le serveur a refusé l’opération (550) : $msg';
  }

  @override
  String get fmMainErr553 =>
      'Le serveur n’a pas accepté le nom de fichier (553).';

  @override
  String fmMainErrTls(String msg) {
    return 'Erreur TLS/SSL — vérifiez le protocole ou le port. ($msg)';
  }

  @override
  String fmMainErrHostKey(String newVal, String oldVal) {
    return 'La clé d’hôte du serveur a changé ! Enregistrée : $oldVal, reçue : $newVal. Connexion refusée par sécurité.';
  }

  @override
  String get fmMainErrConnNotFound => 'Site introuvable';

  @override
  String get fmMainErrNoSession => 'Non connecté au serveur';

  @override
  String get fmMainErrHost => 'L’adresse de l’hôte est requise.';

  @override
  String get fmMainErrUser =>
      'Le nom d’utilisateur est requis (ou choisissez la connexion anonyme).';

  @override
  String get fmMainPickKey => 'Choisir un fichier de clé privée';

  @override
  String get fmMainCopySuffix => ' (copie)';

  @override
  String get fmMainCloseActive =>
      'Des transferts sont encore en cours. Ils seront annulés si vous fermez cette fenêtre.';

  @override
  String get fmMainCloseAnyway => 'Fermer quand même';

  @override
  String get sqAppSearchPh => 'Rechercher des connexions…  (Ctrl+F)';

  @override
  String get sqAppNewConn => 'Ajouter une connexion';

  @override
  String get sqAppAddConn => 'Ajouter une connexion';

  @override
  String get sqAppSettings => 'Paramètres';

  @override
  String sqAppStats(String c, String f) {
    return '$c connexions · $f dossiers';
  }

  @override
  String get sqAppWelcome => 'Bienvenue';

  @override
  String sqAppResults(String q) {
    return 'Résultats pour « $q »';
  }

  @override
  String get sqAppAll => 'Toutes les connexions';

  @override
  String get sqAppWelcomeHint =>
      'Connectez-vous à PostgreSQL, SQL Server, MySQL, SQLite ou à des fichiers CSV/Parquet/Excel.<br>Saisissez les informations, testez la connexion et enregistrez.';

  @override
  String get sqAppFolders => 'Dossiers';

  @override
  String get sqAppConnections => 'Connexions';

  @override
  String get sqAppDblHint => 'Double-cliquez sur une carte pour l’ouvrir';

  @override
  String get sqAppNoMatch => 'Aucune connexion correspondante.';

  @override
  String sqAppFolderCount(String n) {
    return '$n connexions';
  }

  @override
  String get sqAppNewConnHere => 'Nouvelle connexion dans ce dossier';

  @override
  String get sqAppNewSubfolder => 'Nouveau sous-dossier';

  @override
  String get sqAppDuplicate => 'Dupliquer';

  @override
  String get sqAppMoveToFolder => 'Déplacer vers un dossier…';

  @override
  String get sqAppConnMoved => 'Connexion déplacée';

  @override
  String get sqAppFolderIntoSelf =>
      'Un dossier ne peut pas être déplacé dans lui-même';

  @override
  String get sqAppFolderPh => 'ex. Clients';

  @override
  String get sqAppRenameFolder => 'Renommer le dossier';

  @override
  String get sqAppDeleteFolder => 'Supprimer le dossier';

  @override
  String sqAppDeleteFolderMsg(String name) {
    return 'Supprimer le dossier <b>$name</b> ?';
  }

  @override
  String sqAppDeleteFolderConns(String n) {
    return '<br>Ses $n connexions seront déplacées dans le dossier parent.';
  }

  @override
  String get sqAppRootFolder => 'Niveau supérieur (aucun dossier)';

  @override
  String sqAppMoveTitle(String name) {
    return 'Déplacer « $name »';
  }

  @override
  String get sqAppTargetFolder => 'Dossier cible';

  @override
  String get sqAppDeleteConn => 'Supprimer la connexion';

  @override
  String sqAppDeleteConnMsg(String name, String target) {
    return 'Supprimer la connexion <b>$name</b> ($target) ? Son mot de passe enregistré sera également supprimé.';
  }

  @override
  String get sqAppReadOnlyTag => 'Lecture seule';

  @override
  String get sqAppWriteTag => 'Écriture';

  @override
  String get sqFormTitleNew => 'Nouvelle connexion';

  @override
  String sqFormTitleEdit(String name) {
    return 'Connexion : $name';
  }

  @override
  String get sqFormTabGeneral => 'Général';

  @override
  String get sqFormTabSecurity => 'Sécurité';

  @override
  String get sqFormTabSsh => 'Tunnel SSH';

  @override
  String get sqFormName => 'Libellé (nom affiché)';

  @override
  String get sqFormNamePh => 'ex. Base de production';

  @override
  String get sqFormHost => 'Hôte';

  @override
  String get sqFormPort => 'Port';

  @override
  String get sqFormUser => 'Nom d’utilisateur';

  @override
  String get sqFormPassword => 'Mot de passe';

  @override
  String get sqFormPwSaved => '•••••••• (enregistré — saisissez pour modifier)';

  @override
  String get sqFormDatabase => 'Base de données';

  @override
  String get sqFormDatabasePh => 'Laissez vide pour la base par défaut';

  @override
  String get sqFormFile => 'Fichier de base de données';

  @override
  String get sqFormFilePh => 'C:\\Data\\app.db';

  @override
  String get sqFormSqliteHint =>
      'Fichier de base de données SQLite (.db, .sqlite). En mode lecture seule, le fichier n’est jamais modifié.';

  @override
  String get sqFormDuckdbHint =>
      'Choisissez un fichier .duckdb ou laissez vide (en mémoire). Interrogez directement des fichiers CSV, Parquet, JSON et Excel : SELECT * FROM \'C:\\data\\sales.csv\'';

  @override
  String get sqFormInMemory => 'En mémoire';

  @override
  String get sqFormFolder => 'Dossier';

  @override
  String get sqFormColor => 'Couleur';

  @override
  String get sqFormComments => 'Notes';

  @override
  String get sqFormReadOnly => 'Mode lecture seule';

  @override
  String get sqFormReadOnlyHint =>
      'Recommandé. Les INSERT/UPDATE/DELETE et le DDL sont bloqués avant exécution ; vous pouvez les autoriser ponctuellement. Lorsque c’est possible, la session elle-même est aussi en lecture seule.';

  @override
  String get sqFormSavePassword => 'Enregistrer le mot de passe';

  @override
  String get sqFormSavePasswordHint =>
      'Le mot de passe est stocké uniquement dans le trousseau du système (Windows : DPAPI). Si l’option est désactivée, il est demandé à chaque connexion.';

  @override
  String get sqFormSsl => 'TLS / SSL';

  @override
  String get sqFormSslPrefer =>
      'Préférer (chiffré si le serveur le prend en charge)';

  @override
  String get sqFormSslRequire => 'Exiger (certificat non vérifié)';

  @override
  String get sqFormSslVerify => 'Exiger + vérifier le certificat';

  @override
  String get sqFormSslDisable => 'Désactivé (non chiffré)';

  @override
  String get sqFormSslHint =>
      'TLS est tenté par défaut ; la fenêtre de connexion vous avertit si le serveur ne le prend pas en charge.';

  @override
  String get sqFormSshEnable => 'Se connecter via un tunnel SSH';

  @override
  String get sqFormSshHint =>
      'La base de données est atteinte en passant d’abord par un serveur SSH. L’authentification par clé est recommandée.';

  @override
  String get sqFormSshHost => 'Serveur SSH';

  @override
  String get sqFormSshAuth => 'Authentification SSH';

  @override
  String get sqFormSshKey => 'Clé privée';

  @override
  String get sqFormSshAgent => 'Agent (Pageant)';

  @override
  String get sqFormKeyFile => 'Fichier de clé privée';

  @override
  String get sqFormPassphrase => 'Phrase secrète de la clé';

  @override
  String get sqFormPassSaved => '(enregistrée)';

  @override
  String get sqFormPassEmpty => 'Laissez vide s’il n’y en a pas';

  @override
  String get sqFormSshPassword => 'Mot de passe SSH';

  @override
  String sqFormHostKey(String fp) {
    return 'Clé d’hôte SSH : $fp';
  }

  @override
  String get sqFormTest => 'Tester la connexion';

  @override
  String get sqFormSaveConnect => 'Enregistrer et ouvrir';

  @override
  String get sqFormConnecting => 'Connexion…';

  @override
  String get sqFormTestOk => 'Connexion réussie';

  @override
  String get sqFormTestFail => 'Échec de la connexion';

  @override
  String sqFormTestDb(String db, String user) {
    return 'Base de données : $db · Utilisateur : $user';
  }

  @override
  String get sqFormNoTls =>
      'Attention : la connexion n’est pas chiffrée (le serveur ne prend pas en charge TLS).';

  @override
  String get sqFormSaved => 'Connexion enregistrée';

  @override
  String get sqFormChangesSaved => 'Modifications enregistrées';

  @override
  String get sqCwObjects => 'Objets';

  @override
  String get sqCwCollapseAll => 'Tout réduire';

  @override
  String get sqCwFilterPh => 'Filtrer les objets chargés…';

  @override
  String get sqCwEmpty => '(vide)';

  @override
  String get sqCwOpenData => 'Ouvrir les données';

  @override
  String get sqCwShowDdl => 'Afficher le DDL';

  @override
  String get sqCwOpenCode => 'Ouvrir le code';

  @override
  String get sqCwSelectSql => 'Générer un SELECT';

  @override
  String get sqCwAddToBuilder => 'Ajouter au générateur de requêtes';

  @override
  String get sqCwNewSqlHere => 'Nouveau SQL ici';

  @override
  String get sqCwCopyName => 'Copier le nom';

  @override
  String get sqCwCopied => 'Copié dans le presse-papiers';

  @override
  String get sqCwNewSql => 'Nouveau SQL';

  @override
  String get sqCwBuilder => 'Générateur de requêtes';

  @override
  String get sqCwReconnect => 'Se reconnecter';

  @override
  String get sqCwReadOnly => 'Lecture seule';

  @override
  String get sqCwReadWrite => 'Écriture activée';

  @override
  String get sqCwReadOnlyTip =>
      'Lecture seule : le DML/DDL nécessite une approbation. Cliquez pour désactiver';

  @override
  String get sqCwReadWriteTip =>
      'Écriture activée : les commandes s’exécutent sans approbation. Cliquez pour revenir en lecture seule';

  @override
  String get sqCwDisableRo => 'Désactiver le mode lecture seule ?';

  @override
  String get sqCwDisableRoMsg =>
      'Jusqu’à la fermeture de cette fenêtre, les INSERT/UPDATE/DELETE et le DDL s’exécuteront sans confirmation.';

  @override
  String get sqCwDisableRoOk => 'Autoriser l’écriture';

  @override
  String get sqCwRoOn => 'Mode lecture seule activé';

  @override
  String get sqCwRoOff => 'Écriture autorisée — soyez prudent';

  @override
  String get sqCwPasswordTitle => 'Mot de passe requis';

  @override
  String sqCwPasswordFor(String host, String user) {
    return 'Mot de passe pour $user@$host';
  }

  @override
  String get sqCwNotConnected => 'Non connecté';

  @override
  String get sqCwConnected => 'Connecté';

  @override
  String get sqCwConnecting => 'Connexion…';

  @override
  String get sqCwNoTls => 'Non chiffré';

  @override
  String get sqCwConnectFailed => 'Échec de la connexion';

  @override
  String get sqCwRetry => 'Réessayer';

  @override
  String get sqCwResetCancel =>
      'La requête n’a pas répondu à l’annulation ; reconnexion en cours.';

  @override
  String get sqCwResetExit =>
      'La connexion à la base de données a été interrompue ; reconnexion en cours.';

  @override
  String get sqCwEmptyWorkspace =>
      'Double-cliquez sur une table dans l’arborescence ou appuyez sur Ctrl+T pour un nouvel onglet SQL.';

  @override
  String get sqCwCloseTab => 'Fermer l’onglet ?';

  @override
  String sqCwCloseTabMsg(String name) {
    return 'Le SQL de « $name » n’est pas enregistré.';
  }

  @override
  String get sqCwCloseTabOk => 'Fermer';

  @override
  String get sqTreeTables => 'Tables';

  @override
  String get sqTreeViews => 'Vues';

  @override
  String get sqTreeMatviews => 'Vues matérialisées';

  @override
  String get sqTreeForeignTables => 'Tables externes';

  @override
  String get sqTreeFunctions => 'Fonctions';

  @override
  String get sqTreeProcedures => 'Procédures';

  @override
  String get sqTreeTriggers => 'Déclencheurs';

  @override
  String get sqTreeSequences => 'Séquences';

  @override
  String get sqTreeTypes => 'Types';

  @override
  String get sqTreeColumns => 'Colonnes';

  @override
  String get sqTreeIndexes => 'Index';

  @override
  String get sqTreeConstraints => 'Contraintes';

  @override
  String get sqTreeFiles => 'Fichiers';

  @override
  String get sqKindTable => 'Table';

  @override
  String get sqKindView => 'Vue';

  @override
  String get sqKindMatview => 'Vue matérialisée';

  @override
  String get sqKindForeignTable => 'Table externe';

  @override
  String get sqKindFunction => 'Fonction';

  @override
  String get sqKindProcedure => 'Procédure';

  @override
  String get sqKindTrigger => 'Déclencheur';

  @override
  String get sqKindSequence => 'Séquence';

  @override
  String get sqKindType => 'Type';

  @override
  String get sqKindIndex => 'Index';

  @override
  String get sqKindConstraint => 'Contrainte';

  @override
  String get sqSqlRun => 'Exécuter';

  @override
  String get sqSqlRunStatement => 'Exécuter l’instruction';

  @override
  String get sqSqlCancel => 'Annuler';

  @override
  String get sqSqlDatabase => 'Base de données';

  @override
  String get sqSqlHistory => 'Historique';

  @override
  String get sqSqlExport => 'Exporter';

  @override
  String get sqSqlRunning => 'Exécution…';

  @override
  String sqSqlDone(String ms) {
    return 'Terminé · $ms ms';
  }

  @override
  String sqSqlDoneErrors(String ms, String n) {
    return '$n erreurs · $ms ms';
  }

  @override
  String get sqSqlDdlHint =>
      'Le schéma a changé : utilisez Actualiser pour recharger l’arborescence.';

  @override
  String get sqSqlPlaceholder =>
      'Saisissez du SQL… Ctrl+Enter : exécuter la sélection/tout · Ctrl+Shift+Enter : instruction sous le curseur · Ctrl+Space : compléter';

  @override
  String sqSqlTabTitle(String n) {
    return 'SQL $n';
  }

  @override
  String get sqSqlHistoryEmpty => 'Aucun historique pour cette connexion.';

  @override
  String get sqSqlRowsShort => 'lignes';

  @override
  String sqResResult(String n) {
    return 'Résultat $n';
  }

  @override
  String get sqResMessages => 'Messages';

  @override
  String sqResRows(String ms, String n) {
    return '$n lignes · $ms ms';
  }

  @override
  String sqResRowsTruncated(String ms, String n) {
    return 'Affichage des $n premières lignes (limite) · $ms ms';
  }

  @override
  String get sqResNoRows => 'Aucune ligne';

  @override
  String sqResAffected(String cmd, String ms, String n) {
    return '$cmd : $n lignes affectées · $ms ms';
  }

  @override
  String sqResCommand(String cmd, String ms) {
    return '$cmd · $ms ms';
  }

  @override
  String get sqResCancelled => 'Annulé';

  @override
  String get sqGridCopy => 'Copier';

  @override
  String get sqGridCopyHeaders => 'Copier avec les en-têtes';

  @override
  String get sqGridExport => 'Exporter ce résultat…';

  @override
  String get sqDataColumns => 'Colonnes';

  @override
  String sqDataColumnsHidden(String n, String total) {
    return 'Colonnes ($n/$total)';
  }

  @override
  String get sqDataAddFilter => 'Filtre';

  @override
  String get sqDataLimit => 'Nombre de lignes';

  @override
  String sqDataFirstN(String n) {
    return '$n premières';
  }

  @override
  String get sqDataAll => 'Toutes (limitées)';

  @override
  String get sqDataOpenInEditor => 'Ouvrir dans l’éditeur SQL';

  @override
  String get sqDataClearFilters => 'Effacer les filtres';

  @override
  String sqDataRows(String ms, String n) {
    return '$n lignes · $ms ms';
  }

  @override
  String sqDataRowsMore(String ms, String n) {
    return '$n premières lignes · $ms ms';
  }

  @override
  String get sqDataError => 'Impossible de charger les données';

  @override
  String get sqDataSortAsc => 'Tri croissant';

  @override
  String get sqDataSortDesc => 'Tri décroissant';

  @override
  String get sqDataSortClear => 'Effacer le tri';

  @override
  String get sqDataFilterColumn => 'Filtrer sur cette colonne…';

  @override
  String get sqDataHideColumn => 'Masquer la colonne';

  @override
  String get sqDataShowAll => 'Afficher toutes les colonnes';

  @override
  String sqDataFilterEq(String v) {
    return 'Égal à « $v »';
  }

  @override
  String sqDataFilterNe(String v) {
    return 'Différent de « $v »';
  }

  @override
  String get sqDataFilterNull => 'NULL / non NULL';

  @override
  String get sqDataColumn => 'Colonne';

  @override
  String get sqDataOperator => 'Condition';

  @override
  String get sqDataValue => 'Valeur';

  @override
  String get sqDataInHint =>
      'Pour « dans la liste », séparez les valeurs par des virgules.';

  @override
  String get sqDataFilterTitle => 'Filtre';

  @override
  String get sqDataSelectAll => 'Tout';

  @override
  String get sqDataSelectNone => 'Aucun';

  @override
  String get sqOpContains => 'contient';

  @override
  String get sqOpStarts => 'commence par';

  @override
  String get sqOpEnds => 'se termine par';

  @override
  String get sqOpLike => 'LIKE';

  @override
  String get sqOpIn => 'dans la liste';

  @override
  String get sqCodeExecute => 'Exécuter';

  @override
  String get sqCodeLoading => 'Chargement…';

  @override
  String get sqCodeEmpty => 'Aucune définition trouvée';

  @override
  String get sqQbAddTable => 'Ajouter une table';

  @override
  String get sqQbLimit => 'Limite';

  @override
  String get sqQbClear => 'Effacer';

  @override
  String get sqQbHint =>
      'Faites glisser des tables depuis l’arborescence ou cliquez sur « Ajouter une table ». Faites glisser une colonne sur la colonne d’une autre table pour créer une JOIN.';

  @override
  String get sqQbColumns => 'Colonnes';

  @override
  String get sqQbConditions => 'Conditions';

  @override
  String get sqQbResults => 'Résultats';

  @override
  String get sqQbGenerated => 'SQL généré';

  @override
  String get sqQbRegenerate => 'Régénérer à partir du diagramme';

  @override
  String get sqQbOtherDb =>
      'Le générateur de requêtes fonctionne avec les tables d’une seule base de données.';

  @override
  String get sqQbDragJoin =>
      'Faites glisser sur la colonne d’une autre table pour une JOIN';

  @override
  String get sqQbSwapJoin => 'Inverser le sens';

  @override
  String get sqQbDeleteJoin => 'Supprimer la JOIN';

  @override
  String get sqQbNoColumns =>
      'Cochez les colonnes dans les tables (aucune = SELECT *).';

  @override
  String get sqQbOutput => 'Afficher';

  @override
  String get sqQbColumn => 'Colonne';

  @override
  String get sqQbAlias => 'Alias';

  @override
  String get sqQbAggregate => 'Agrégat';

  @override
  String get sqQbSort => 'Tri';

  @override
  String get sqQbAddCondition => 'Ajouter une condition';

  @override
  String sqQbTabTitle(String n) {
    return 'Requête $n';
  }

  @override
  String get sqRoTitle => 'Mode lecture seule';

  @override
  String get sqRoMessage =>
      'Cette connexion est en mode lecture seule. Les instructions suivantes peuvent modifier les données ou le schéma :';

  @override
  String get sqRoHint =>
      'Vous pouvez les autoriser pour cette exécution uniquement ; le mode lecture seule est rétabli ensuite.';

  @override
  String get sqRoRunOnce => 'Exécuter une seule fois';

  @override
  String get sqRoNotRun => 'Mode lecture seule : non exécuté';

  @override
  String sqRoBlockedMsg(String n) {
    return 'Mode lecture seule : $n instructions nécessitent une approbation.';
  }

  @override
  String get sqExpTitle => 'Exporter';

  @override
  String get sqExpHint =>
      'La requête est réexécutée sans limite de lignes et les résultats sont écrits directement dans le fichier.';

  @override
  String get sqExpRunning => 'Exportation…';

  @override
  String sqExpDone(String n) {
    return '$n lignes exportées';
  }

  @override
  String get sqExpFailed => 'Échec de l’exportation';

  @override
  String get sqErrRefused =>
      'Connexion refusée : le port est fermé ou le serveur n’est pas démarré.';

  @override
  String get sqErrDns => 'Impossible de résoudre le nom d’hôte (DNS).';

  @override
  String get sqErrTimeout => 'Délai dépassé : le serveur est injoignable.';

  @override
  String get sqErrReset => 'Le serveur a fermé la connexion.';

  @override
  String get sqErrUnreach => 'Le serveur est inaccessible sur le réseau.';

  @override
  String get sqErrSshAuth =>
      'Échec de la connexion SSH : nom d’utilisateur, clé ou mot de passe incorrect.';

  @override
  String sqErrTls(String msg) {
    return 'Erreur TLS/SSL — le certificat n’a pas pu être vérifié ou le serveur ne prend pas en charge TLS. ($msg)';
  }

  @override
  String get sqErrHostExit =>
      'Le processus de base de données s’est arrêté de manière inattendue.';

  @override
  String get sqErrUnknown => 'Erreur inconnue';

  @override
  String get sqMainCloseAnyway => 'Fermer quand même';

  @override
  String get sqMainCloseRunning =>
      'Des requêtes sont encore en cours. Elles seront annulées si vous fermez cette fenêtre.';

  @override
  String get sqMainCopySuffix => ' (copie)';

  @override
  String get sqMainErrConnNotFound => 'Connexion introuvable';

  @override
  String get sqMainErrNoSession => 'Cette fenêtre n’a aucune connexion';

  @override
  String sqMainErrKeyFile(String path) {
    return 'Impossible de lire le fichier de clé SSH : $path';
  }

  @override
  String get sqMainTrayShow => 'Afficher SQL Master';

  @override
  String get sqMainTrayQuick => 'Connexion rapide';

  @override
  String get sqMainTrayNone => 'Aucune connexion enregistrée';

  @override
  String get sqMainTrayQuit => 'Quitter';

  @override
  String get npKindSsh => 'Projet SSH';

  @override
  String get npKindFtp => 'Projet FTP';

  @override
  String get npKindLocal => 'Dossier local';

  @override
  String get npKindFile => 'Fichier de projet';

  @override
  String get npKindSshHint => 'Un dossier de serveur via SSH (SFTP)';

  @override
  String get npKindFtpHint => 'Un serveur FTP, FTPS ou SFTP';

  @override
  String get npKindLocalHint => 'Un dossier sur cet ordinateur';

  @override
  String get npKindFileHint => 'Modifier un seul fichier';

  @override
  String get npAppSearchPh => 'Rechercher des connexions…  (Ctrl+F)';

  @override
  String get npAppNewConn => 'Nouvelle connexion';

  @override
  String get npAppSettings => 'Paramètres';

  @override
  String npAppStats(String c, String f) {
    return '$c connexions · $f dossiers';
  }

  @override
  String get npAppWelcome => 'Bienvenue';

  @override
  String npAppResults(String q) {
    return 'Résultats pour « $q »';
  }

  @override
  String get npAppAll => 'Toutes les connexions';

  @override
  String get npAppWelcomeHint =>
      'Ajoutez un serveur SSH ou FTP, un dossier local ou un fichier.<br>Double-cliquez sur une carte pour ouvrir le projet dans sa propre fenêtre.';

  @override
  String get npAppFolders => 'Dossiers';

  @override
  String get npAppConnections => 'Connexions';

  @override
  String get npAppDblHint => 'Double-cliquez sur une carte pour l’ouvrir';

  @override
  String get npAppNoMatch => 'Aucune connexion correspondante.';

  @override
  String npAppFolderCount(String n) {
    return '$n connexions';
  }

  @override
  String get npAppNewConnHere => 'Nouvelle connexion dans ce dossier';

  @override
  String get npAppNewSubfolder => 'Nouveau sous-dossier';

  @override
  String get npAppKeyTag => 'Clé';

  @override
  String get npAppDuplicate => 'Dupliquer';

  @override
  String get npAppMoveToFolder => 'Déplacer vers un dossier…';

  @override
  String get npAppConnMoved => 'Connexion déplacée';

  @override
  String get npAppFolderIntoSelf =>
      'Un dossier ne peut pas être déplacé dans lui-même';

  @override
  String get npAppFolderPh => 'ex. Clients';

  @override
  String get npAppRenameFolder => 'Renommer le dossier';

  @override
  String get npAppDeleteFolder => 'Supprimer le dossier';

  @override
  String npAppDeleteFolderMsg(String name) {
    return 'Supprimer le dossier <b>$name</b> ?';
  }

  @override
  String npAppDeleteFolderConns(String n) {
    return '<br>Ses $n connexions seront déplacées vers le dossier parent.';
  }

  @override
  String get npAppRootFolder => 'Niveau supérieur (aucun dossier)';

  @override
  String npAppMoveTitle(String name) {
    return 'Déplacer « $name »';
  }

  @override
  String get npAppTargetFolder => 'Dossier cible';

  @override
  String get npAppDeleteConn => 'Supprimer la connexion';

  @override
  String npAppDeleteConnMsg(String name, String target) {
    return 'Supprimer la connexion <b>$name</b> ($target) ?<br>Les fichiers sur le serveur ou dans le dossier ne sont pas touchés ; seules cette connexion et sa copie de travail sont supprimées.';
  }

  @override
  String get npAppNoLocalPath =>
      'Aucun chemin choisi sur cet ordinateur — il vous sera demandé à l’ouverture';

  @override
  String get npAppChangeLocalPath => 'Modifier le chemin sur cet ordinateur…';

  @override
  String get npAppOpenTabs => 'Onglets ouverts';

  @override
  String get npAppCustomEditor => 'Paramètres d’éditeur propres à la connexion';

  @override
  String get npFormTitleNew => 'Nouvelle connexion';

  @override
  String npFormTitleEdit(String name) {
    return 'Connexion : $name';
  }

  @override
  String get npFormTabConn => 'Connexion';

  @override
  String get npFormTabProject => 'Projet';

  @override
  String get npFormTabEditor => 'Éditeur (Notepad++)';

  @override
  String get npFormName => 'Nom (affiché)';

  @override
  String get npFormNamePh => 'ex. Site de l’entreprise';

  @override
  String get npFormHost => 'Hôte';

  @override
  String get npFormHostPh => 'serveur.exemple.com ou 192.168.1.10';

  @override
  String get npFormPort => 'Port';

  @override
  String get npFormUser => 'Nom d’utilisateur';

  @override
  String get npFormPassword => 'Mot de passe';

  @override
  String get npFormPwSaved => '•••••••• (enregistré — saisissez pour modifier)';

  @override
  String get npFormLoginMethod => 'Mode de connexion';

  @override
  String get npFormLoginNormal => 'Normal';

  @override
  String get npFormLoginAnon => 'Anonyme';

  @override
  String get npFormAuth => 'Authentification SSH';

  @override
  String get npFormPrivateKey => 'Clé privée';

  @override
  String get npFormKeyFile => 'Fichier de clé privée';

  @override
  String get npFormPassphrase => 'Phrase secrète de la clé';

  @override
  String get npFormPassSaved => '(enregistrée)';

  @override
  String get npFormPassEmpty => 'Laissez vide s’il n’y en a pas';

  @override
  String get npFormFolder => 'Dossier';

  @override
  String get npFormColor => 'Couleur';

  @override
  String get npFormComments => 'Notes';

  @override
  String get npFormRootDir => 'Dossier du projet (sur le serveur)';

  @override
  String get npFormBrowse => 'Choisir le dossier';

  @override
  String get npFormBrowseHint =>
      'Cliquez d’abord sur « Tester la connexion » pour parcourir le serveur et choisir le dossier. Si le champ est vide, le dossier de connexion est ouvert.';

  @override
  String get npFormBrowseTitle => 'Choisir un dossier sur le serveur';

  @override
  String get npFormBrowseSelect => 'Sélectionner ce dossier';

  @override
  String get npFormBrowseEmpty => 'Aucun sous-dossier';

  @override
  String get npFormFolderPath => 'Dossier';

  @override
  String get npFormFilePath => 'Fichier';

  @override
  String get npFormLocalPathHint =>
      'Le chemin local n’est enregistré que sur cet ordinateur ; les autres ordinateurs le demandent la première fois.';

  @override
  String get npFormCacheNote =>
      'Chaque fichier ouvert est enregistré, avec son arborescence, dans une copie de travail (cache). L’enregistrement envoie le fichier sur le serveur et met à jour la copie de travail.';

  @override
  String get npFormRestoreTabs => 'Mémoriser les onglets ouverts';

  @override
  String get npFormRestoreTabsHint =>
      'Le projet se rouvre avec les mêmes fichiers la prochaine fois (sur cet ordinateur uniquement).';

  @override
  String get npFormShowHidden => 'Afficher les fichiers cachés';

  @override
  String get npFormShowHiddenHint =>
      'Fichiers et dossiers commençant par un point (.env, .htaccess, .git…)';

  @override
  String get npFormExclude => 'Masquer dans l’arborescence';

  @override
  String get npFormExcludeHint =>
      'Noms ou motifs séparés par des virgules ; * et ? sont autorisés.';

  @override
  String get npFormEditorMode => 'Paramètres de l’éditeur';

  @override
  String get npFormEdGlobal =>
      'Utiliser les paramètres globaux de l’éditeur (Paramètres › Éditeur)';

  @override
  String get npFormEdCustom =>
      'Utiliser des paramètres propres à cette connexion';

  @override
  String get npFormTest => 'Tester la connexion';

  @override
  String get npFormSaveOpen => 'Enregistrer et ouvrir';

  @override
  String get npFormConnecting => 'Connexion…';

  @override
  String get npFormTestOk => 'Connexion réussie';

  @override
  String get npFormTestFail => 'Échec de la connexion';

  @override
  String npFormHomeDir(String dir) {
    return 'Dossier de connexion : $dir';
  }

  @override
  String get npFormRootMissing =>
      'Attention : le dossier du projet n’a pas pu être ouvert.';

  @override
  String npFormHostKey(String fp) {
    return 'Clé d’hôte SSH (SHA256) : $fp';
  }

  @override
  String get npFormSaved => 'Connexion enregistrée';

  @override
  String get npFormChangesSaved => 'Modifications enregistrées';

  @override
  String get npTypeProtocol => 'Protocole';

  @override
  String get npTypeFtp => 'FTP (standard)';

  @override
  String get npTypeFtpsImplicit => 'FTPS — TLS/SSL implicite (port 990)';

  @override
  String get npTypeFtpsSsl => 'FTPS — Explicite (AUTH SSL)';

  @override
  String get npTypeFtpsTls => 'FTPS — Explicite (AUTH TLS)';

  @override
  String get npTypeSftp => 'SFTP — SSH2';

  @override
  String get npTypeNoteFtp =>
      'FTP simple ; le mot de passe et les fichiers sont envoyés en clair.';

  @override
  String get npTypeNoteFtpsImplicit =>
      'La connexion est chiffrée en TLS/SSL dès le départ (généralement port 990).';

  @override
  String get npTypeNoteFtpsSsl =>
      'Se connecte en FTP simple puis passe à une session chiffrée avec AUTH SSL.';

  @override
  String get npTypeNoteFtpsTls =>
      'Se connecte en FTP simple puis passe à une session chiffrée avec AUTH TLS (le FTPS le plus courant).';

  @override
  String get npTypeNoteSftp =>
      'Accès chiffré aux fichiers via SSH (port 22). La clé d’hôte du serveur est enregistrée à la première connexion.';

  @override
  String get npOptEncoding => 'Encodage des noms de fichiers';

  @override
  String get npOptEncAuto => 'Auto';

  @override
  String get npEdSecEncoding => 'Encodage et fins de ligne';

  @override
  String get npEdEncoding => 'Encodage à l’ouverture des fichiers';

  @override
  String get npEdEncAuto => 'Détection auto (BOM / UTF-8)';

  @override
  String get npEdFallback => 'Si ce n’est pas de l’UTF-8 (ANSI)';

  @override
  String get npEdEol => 'Fins de ligne';

  @override
  String get npEdEolAuto => 'Conserver celles du fichier';

  @override
  String npEdEolConvert(String eol) {
    return 'Convertir en $eol à l’ouverture';
  }

  @override
  String get npEdNewDoc => 'Nouveau fichier : encodage · fin de ligne';

  @override
  String get npEdSecIndent => 'Indentation et langage';

  @override
  String get npEdTabSize => 'Taille de tabulation';

  @override
  String get npEdLanguage => 'Langage (syntaxe)';

  @override
  String get npEdLangAuto => 'Auto (extension / première ligne)';

  @override
  String get npEdInsertSpaces => 'Insérer des espaces au lieu de tabulations';

  @override
  String get npEdDetectIndent => 'Détecter l’indentation à partir du fichier';

  @override
  String get npEdDetectIndentHint =>
      'Les fichiers indentés par tabulations continuent d’utiliser des tabulations.';

  @override
  String get npEdAutoIndent => 'Indentation automatique';

  @override
  String get npEdAutoClose => 'Fermer automatiquement crochets et guillemets';

  @override
  String get npEdSecLook => 'Apparence';

  @override
  String get npEdTheme => 'Thème de couleurs';

  @override
  String get npEdThemeAuto => 'Auto (suivre le thème de l’application)';

  @override
  String get npEdWhitespace => 'Afficher les espaces et tabulations';

  @override
  String get npEdWsNone => 'Ne pas afficher';

  @override
  String get npEdWsBoundary => 'Tous sauf les espaces simples entre les mots';

  @override
  String get npEdWsTrailing => 'En fin de ligne uniquement';

  @override
  String get npEdWsAll => 'Tous';

  @override
  String get npEdFont => 'Police';

  @override
  String get npEdFontSize => 'Taille';

  @override
  String get npEdRulers => 'Règles';

  @override
  String get npEdWordWrap => 'Retour à la ligne automatique';

  @override
  String get npEdLineNumbers => 'Numéros de ligne';

  @override
  String get npEdHighlightLine => 'Surligner la ligne courante';

  @override
  String get npEdSmartHighlight => 'Surlignage intelligent (mots identiques)';

  @override
  String get npEdIndentGuides => 'Guides d’indentation';

  @override
  String get npEdFolding => 'Repli du code';

  @override
  String get npEdBracketColors => 'Coloriser les paires de crochets';

  @override
  String get npEdMinimap => 'Minimap (carte du document)';

  @override
  String get npEdControlChars => 'Afficher les caractères invisibles';

  @override
  String get npEdSecSave => 'Enregistrement';

  @override
  String get npEdTrimTrailing =>
      'Supprimer les espaces de fin de ligne à l’enregistrement';

  @override
  String get npEdFinalNewline => 'Insérer un saut de ligne final';

  @override
  String get npEdCheckRemote =>
      'Vérifier les modifications avant d’enregistrer';

  @override
  String get npEdCheckRemoteHint =>
      'Vous avertit si quelqu’un a modifié le fichier sur le serveur après son ouverture.';

  @override
  String get npEdAutoSave => 'Enregistrement automatique';

  @override
  String get npEdSec => 's';

  @override
  String get npEdAutoSaveHint =>
      '0 = désactivé. S’il est activé, le fichier est enregistré et envoyé ce délai après une modification.';

  @override
  String get npMainBalloonTitle => 'Notepad Master fonctionne en arrière-plan';

  @override
  String get npMainBalloonBody => 'Cliquez sur l’icône pour le rouvrir.';

  @override
  String get npMainTrayShow => 'Afficher Notepad Master';

  @override
  String get npMainTrayQuick => 'Ouverture rapide';

  @override
  String get npMainTrayNone => 'Aucune connexion enregistrée';

  @override
  String get npMainTrayQuit => 'Quitter';

  @override
  String get npProjToggleTree => 'Afficher/masquer l’arborescence (Ctrl+B)';

  @override
  String get npProjReconnect => 'Se reconnecter';

  @override
  String get npProjReconnected => 'Reconnecté';

  @override
  String get npProjConnectFail => 'Connexion impossible';

  @override
  String get npProjStatusOn => 'Connecté';

  @override
  String get npProjStatusOff => 'Déconnecté';

  @override
  String get npProjStatusConnecting => 'Connexion…';

  @override
  String get npProjSave => 'Enregistrer';

  @override
  String get npProjSaveAll => 'Tout enregistrer';

  @override
  String get npProjUndo => 'Annuler';

  @override
  String get npProjRedo => 'Rétablir';

  @override
  String get npProjFind => 'Rechercher';

  @override
  String get npProjReplace => 'Remplacer';

  @override
  String get npProjGoto => 'Aller à la ligne';

  @override
  String get npProjShowWs => 'Afficher les espaces et tabulations';

  @override
  String get npProjZoomIn => 'Zoom avant';

  @override
  String get npProjZoomOut => 'Zoom arrière';

  @override
  String get npProjShowCache => 'Afficher la copie de travail';

  @override
  String get npProjPalette => 'Palette de commandes';

  @override
  String get npProjCloseTab => 'Fermer';

  @override
  String get npProjCloseOthers => 'Fermer les autres';

  @override
  String get npProjCloseAll => 'Tout fermer';

  @override
  String get npProjReload => 'Recharger';

  @override
  String npProjReloadMsg(String name) {
    return 'Les modifications non enregistrées de <b>$name</b> seront perdues. Recharger le fichier ?';
  }

  @override
  String get npProjRevealTree => 'Afficher dans l’arborescence';

  @override
  String get npProjUnsavedTitle => 'Modifications non enregistrées';

  @override
  String npProjUnsavedMsg(String name) {
    return 'Enregistrer les modifications de <b>$name</b> ?';
  }

  @override
  String get npProjDontSave => 'Ne pas enregistrer';

  @override
  String npProjOpenFail(String name) {
    return 'Impossible d’ouvrir $name';
  }

  @override
  String npProjTooLarge(String name, String size) {
    return '$name est trop volumineux ($size) ; la limite est de 50 Mo.';
  }

  @override
  String npProjBinary(String name) {
    return '$name n’est pas un fichier texte (binaire) ; il n’a pas été ouvert dans l’éditeur.';
  }

  @override
  String npProjSaveFail(String name) {
    return 'Impossible d’enregistrer $name';
  }

  @override
  String npProjSaved(String name) {
    return '$name enregistré';
  }

  @override
  String npProjSavedRemote(String name) {
    return '$name enregistré et envoyé';
  }

  @override
  String get npProjLossyTitle => 'Avertissement d’encodage';

  @override
  String npProjLossyMsg(String enc) {
    return 'Certains caractères ne peuvent pas être stockés en <b>$enc</b> et seront enregistrés comme « ? ». Il est recommandé de convertir en UTF-8 depuis la barre d’état.';
  }

  @override
  String get npProjSaveAnyway => 'Enregistrer quand même';

  @override
  String get npProjConflictTitle => 'Fichier modifié ailleurs';

  @override
  String npProjConflictMsg(String name) {
    return '<b>$name</b> a été modifié sur le serveur après son ouverture. Que voulez-vous faire ?';
  }

  @override
  String get npProjConflictOverwrite => 'Écraser';

  @override
  String get npProjConflictReload => 'Charger la version du serveur';

  @override
  String npProjConflictAuto(String name) {
    return '$name a été modifié sur le serveur ; enregistrement automatique ignoré.';
  }

  @override
  String npProjPos(String col, String ln) {
    return 'Ln $ln, Col $col';
  }

  @override
  String npProjSel(String n) {
    return '$n sélectionné(s)';
  }

  @override
  String npProjSpaces(String n) {
    return 'Espaces : $n';
  }

  @override
  String npProjTabWidth(String n) {
    return 'Taille de tabulation : $n';
  }

  @override
  String get npProjIndentToSpaces => 'Convertir l’indentation en espaces';

  @override
  String get npProjIndentToTabs => 'Convertir l’indentation en tabulations';

  @override
  String npProjEncTitle(String name) {
    return 'Encodage : $name';
  }

  @override
  String get npProjEncConvert =>
      'Convertir dans cet encodage (à l’enregistrement)';

  @override
  String get npProjEncConvertHint =>
      'Le texte reste identique ; le fichier est écrit dans l’encodage choisi lors de l’enregistrement.';

  @override
  String get npProjEncReopen => 'Rouvrir avec cet encodage';

  @override
  String get npProjEncReopenHint =>
      'Si des caractères s’affichent mal, relisez le fichier avec le bon encodage.';

  @override
  String npProjEolTo(String eol) {
    return 'Convertir en $eol';
  }

  @override
  String get npProjLangTitle => 'Choisir le langage';

  @override
  String get npProjLangSearch => 'Rechercher un langage…';

  @override
  String get npProjCacheCopy => 'Copie de travail';

  @override
  String get npProjInitFail => 'La fenêtre du projet n’a pas pu démarrer';

  @override
  String get npProjEmptyHint =>
      'Double-cliquez sur un fichier dans l’arborescence à gauche ; il s’ouvre ici dans un onglet avec la coloration syntaxique de son langage.';

  @override
  String get npProjEmptyFile => 'Ouverture du fichier…';

  @override
  String get npTreeNewFile => 'Nouveau fichier';

  @override
  String get npTreeFileName => 'Nom du fichier';

  @override
  String get npTreeBadName => 'Nom invalide';

  @override
  String get npTreeCreateFail => 'Création impossible';

  @override
  String get npTreeRenameFail => 'Impossible de renommer';

  @override
  String get npTreeRenameDirty =>
      'Enregistrez d’abord les fichiers ouverts de ce dossier.';

  @override
  String get npTreeDeleteTitle => 'Supprimer';

  @override
  String npTreeDeleteMsg(String name) {
    return 'Supprimer le fichier <b>$name</b> ?';
  }

  @override
  String npTreeDeleteDirMsg(String name) {
    return 'Supprimer le dossier <b>$name</b> et tout son contenu ?';
  }

  @override
  String get npTreeDeleteFail => 'Suppression impossible';

  @override
  String get npTreeTrashNote =>
      'Les fichiers locaux sont placés dans la Corbeille.';

  @override
  String get npTreeEmpty => 'Dossier vide';

  @override
  String get npTreeCollapseAll => 'Tout réduire';

  @override
  String get npTreeShowExplorer => 'Afficher dans l’Explorateur';

  @override
  String get npTreeUp => 'Dossier parent';

  @override
  String get npTreeHome => 'Dossier de connexion';

  @override
  String get npMainErrAuth =>
      'Échec de l’authentification : nom d’utilisateur ou mot de passe incorrect.';

  @override
  String get npMainErrRefused =>
      'Connexion refusée : le port est fermé ou le serveur ne fonctionne pas.';

  @override
  String get npMainErrTimeout => 'Délai dépassé : serveur injoignable.';

  @override
  String get npMainErrDns => 'Le nom d’hôte n’a pas pu être résolu (DNS).';

  @override
  String get npMainErrUnreach => 'Le serveur est injoignable sur le réseau.';

  @override
  String get npMainErrReset => 'Le serveur a fermé la connexion.';

  @override
  String get npMainErrNotFound => 'Fichier ou dossier introuvable.';

  @override
  String get npMainErrPerm => 'Autorisation refusée.';

  @override
  String get npMainErrExists =>
      'Un fichier ou dossier portant ce nom existe déjà.';

  @override
  String npMainErr550(String msg) {
    return 'Le serveur a refusé l’opération (550) : $msg';
  }

  @override
  String get npMainErr553 =>
      'Le serveur n’a pas accepté le nom de fichier (553).';

  @override
  String npMainErrTls(String msg) {
    return 'Erreur TLS/SSL — vérifiez le protocole ou le port. ($msg)';
  }

  @override
  String npMainErrHostKey(String newVal, String oldVal) {
    return 'La clé d’hôte du serveur a changé ! Enregistrée : $oldVal, reçue : $newVal. Connexion refusée par sécurité.';
  }

  @override
  String get npMainErrNoKey => 'Le fichier de clé privée n’a pas pu être lu.';

  @override
  String get npMainErrKey =>
      'Impossible de lire la clé privée : phrase secrète incorrecte ou format non pris en charge.';

  @override
  String get npMainErrNoLocal =>
      'Le dossier ou le fichier est introuvable sur cet ordinateur. Modifiez le chemin depuis le menu de la carte dans la fenêtre principale.';

  @override
  String get npMainErrConnNotFound => 'Connexion introuvable';

  @override
  String get npMainErrNoSession => 'Non connecté';

  @override
  String get npMainErrHost => 'L’adresse de l’hôte est requise.';

  @override
  String get npMainErrUser =>
      'Le nom d’utilisateur est requis (ou choisissez la connexion anonyme).';

  @override
  String get npMainPickKey => 'Choisir un fichier de clé privée';

  @override
  String get npMainCopySuffix => ' (copie)';

  @override
  String get npMainCloseDirty =>
      'Des fichiers ne sont pas enregistrés. Fermer la fenêtre fera perdre les modifications.';

  @override
  String get npMainCloseDiscard => 'Fermer sans enregistrer';

  @override
  String get ipAppNewFolder => 'Nouveau dossier';

  @override
  String get ipAppNewRecord => 'Nouvel enregistrement';

  @override
  String get ipAppSearchPh =>
      'Rechercher enregistrements, IP, noms, MAC ou services…';

  @override
  String ipAppStats(String n) {
    return '$n enregistrements';
  }

  @override
  String get ipColIp => 'IP';

  @override
  String get ipColMac => 'MAC';

  @override
  String get ipColName => 'Nom';

  @override
  String get ipColRtt => 'Réponse';

  @override
  String get ipColServices => 'Services';

  @override
  String get ipColStatus => 'État';

  @override
  String get ipColVendor => 'Fabricant';

  @override
  String get ipCtxCopyIp => 'Copier l’adresse IP';

  @override
  String get ipCtxCopyMac => 'Copier l’adresse MAC';

  @override
  String get ipCtxCopyName => 'Copier le nom';

  @override
  String get ipCtxCopyRange => 'Copier la plage';

  @override
  String get ipCtxOpenWeb => 'Ouvrir dans le navigateur';

  @override
  String ipFolderDeleteMsg(String name) {
    return 'Le dossier « $name » sera supprimé ; ses enregistrements et dossiers sont déplacés vers le dossier parent.';
  }

  @override
  String get ipFolderEmpty => 'Dossier vide';

  @override
  String get ipFolderName => 'Nom du dossier';

  @override
  String get ipFolderRename => 'Renommer le dossier';

  @override
  String get ipHostAlive => 'Présence';

  @override
  String get ipHostBanner => 'Message d’accueil';

  @override
  String get ipHostCert => 'Certificat';

  @override
  String get ipHostCertExpires => 'Valide jusqu’au';

  @override
  String get ipHostCertIssuer => 'Émetteur';

  @override
  String get ipHostDetails => 'Détails';

  @override
  String get ipHostLocalMac => 'adresse privée';

  @override
  String get ipHostNoServices => 'Aucun des ports de la liste n’est ouvert.';

  @override
  String get ipHostSelfSigned => 'auto-signé';

  @override
  String get ipHostServer => 'Serveur';

  @override
  String get ipHostTitle => 'Titre';

  @override
  String get ipHostUnknown => '(nom non résolu)';

  @override
  String get ipNoticeAccept => 'Compris';

  @override
  String get ipNoticeBody =>
      'IP Tools ne découvre que votre réseau local : il trouve les appareils par ping, tente de se connecter à une courte liste de ports et résout leurs noms. N’analysez que les réseaux dont vous êtes propriétaire ou pour lesquels vous êtes autorisé.';

  @override
  String get ipNoticeLimits =>
      'Par conception, seules les adresses privées (10.x, 172.16–31.x, 192.168.x, 169.254.x) sont analysées ; aucun test de vulnérabilité, aucune tentative de mot de passe ni analyse de ports étendue.';

  @override
  String get ipNoticeShort => 'N’analysez que les réseaux autorisés';

  @override
  String get ipNoticeText =>
      'N’analysez que les réseaux dont vous êtes propriétaire ou pour lesquels vous êtes autorisé.';

  @override
  String get ipNoticeTitle => 'Découverte du réseau local';

  @override
  String get ipPrivacyNote =>
      'Confidentialité : les résultats d’analyse sont stockés uniquement sur cet ordinateur et ne sont jamais envoyés. Seules les adresses privées/locales sont analysées.';

  @override
  String get ipRangeErrEmpty => 'Saisissez une plage d’adresses IP.';

  @override
  String ipRangeErrInvalid(String token) {
    return 'Adresse ou plage non valide : $token';
  }

  @override
  String ipRangeErrIpv6(String token) {
    return 'Les adresses IPv6 ne sont pas prises en charge : $token';
  }

  @override
  String ipRangeErrNotPrivate(String token) {
    return 'Seules les adresses privées/locales peuvent être analysées (10.x, 172.16–31.x, 192.168.x, 169.254.x) : $token';
  }

  @override
  String ipRangeErrReversed(String token) {
    return 'Le début de la plage est supérieur à sa fin : $token';
  }

  @override
  String ipRangeErrTooMany(String count) {
    return 'Plage trop grande (au plus 65 536 adresses, un /16) : $count';
  }

  @override
  String ipRangeOk(String n) {
    return '$n adresses seront analysées';
  }

  @override
  String get ipRecColor => 'Couleur';

  @override
  String ipRecDeleteMsg(String name) {
    return 'L’enregistrement « $name » et son résultat d’analyse sur cet ordinateur seront supprimés.';
  }

  @override
  String ipRecDevices(String n) {
    return '$n appareils';
  }

  @override
  String get ipRecEdit => 'Modifier l’enregistrement';

  @override
  String get ipRecFolder => 'Dossier';

  @override
  String ipRecItems(String n) {
    return '$n éléments';
  }

  @override
  String ipRecLastScan(String time) {
    return 'Dernière analyse : $time';
  }

  @override
  String get ipRecMove => 'Déplacer';

  @override
  String get ipRecMoveTitle => 'Déplacer l’enregistrement';

  @override
  String get ipRecName => 'Nom';

  @override
  String get ipRecNever => 'Pas encore analysé';

  @override
  String ipRecNewDevices(String n) {
    return '$n nouveaux';
  }

  @override
  String get ipRecRange => 'Plage IP';

  @override
  String get ipRecRangeHint =>
      'Exemples : 192.168.1.0/24 · 192.168.1.1-192.168.1.255 · 10.0.0.5 · plusieurs séparées par des virgules. Au plus /16.';

  @override
  String get ipRecRootFolder => 'Enregistrements';

  @override
  String get ipRecSaved => 'Enregistrement sauvegardé';

  @override
  String get ipScanBusy =>
      'Une autre analyse est en cours ; arrêtez-la d’abord.';

  @override
  String ipScanDone(String n) {
    return 'Analyse terminée : $n appareils';
  }

  @override
  String get ipScanEmptyBody =>
      'Appuyez sur Analyser ou cliquez sur ▶ sur la carte. Les appareils découverts s’affichent ici.';

  @override
  String get ipScanEmptyTitle =>
      'Cet enregistrement n’a pas encore été analysé';

  @override
  String get ipScanExport => 'Exporter';

  @override
  String get ipScanExportCsv => 'Enregistrer en CSV…';

  @override
  String get ipScanExportJson => 'Enregistrer en JSON…';

  @override
  String get ipScanExported => 'Exporté';

  @override
  String ipScanFailed(String msg) {
    return 'Échec de l’analyse : $msg';
  }

  @override
  String get ipScanFilter => 'Filtre';

  @override
  String get ipScanFilterAll => 'Tous';

  @override
  String get ipScanFilterGone => 'Disparus';

  @override
  String get ipScanFilterNew => 'Nouveaux';

  @override
  String get ipScanFilterServices => 'Avec services';

  @override
  String ipScanFound(String n) {
    return '$n appareils trouvés';
  }

  @override
  String get ipScanNoMatch => 'Aucun appareil ne correspond au filtre.';

  @override
  String get ipScanPhaseNames => 'Résolution des noms';

  @override
  String get ipScanPhasePing => 'Recherche des appareils';

  @override
  String get ipScanPhasePorts => 'Test des services';

  @override
  String ipScanProgress(String done, String total) {
    return '$done/$total';
  }

  @override
  String ipScanRateLimited(String s) {
    return 'Le même enregistrement pourra être réanalysé dans $s s au plus tôt.';
  }

  @override
  String get ipScanScan => 'Analyser';

  @override
  String get ipScanScanning => 'Analyse…';

  @override
  String get ipScanSelectHint =>
      'Cliquez sur un enregistrement à gauche : la plage est analysée et les appareils trouvés s’affichent ici.';

  @override
  String get ipScanSelectRecord => 'Sélectionnez un enregistrement';

  @override
  String get ipScanStop => 'Arrêter';

  @override
  String get ipScanStopped => 'Analyse arrêtée';

  @override
  String get ipStatusAliveArp =>
      'Vu dans la table ARP (n’a pas répondu au ping)';

  @override
  String get ipStatusAlivePing => 'A répondu au ping';

  @override
  String get ipStatusGone => 'Disparu (présent lors de l’analyse précédente)';

  @override
  String get ipStatusLive => 'Analyse en cours';

  @override
  String get ipStatusNew => 'Nouveau (absent de l’analyse précédente)';

  @override
  String get ipStatusSame => 'En ligne';

  @override
  String ipTagCopied(String text) {
    return 'Copié dans le presse-papiers : $text';
  }

  @override
  String get ipTagFailed => 'Impossible d’ouvrir';

  @override
  String get ipTagGroupCamera => 'Caméra (RTSP)';

  @override
  String get ipTagGroupDb => 'Base de données';

  @override
  String get ipTagGroupFtp => 'FTP';

  @override
  String get ipTagGroupPrinter => 'Imprimante';

  @override
  String get ipTagGroupRdp => 'Bureau à distance';

  @override
  String get ipTagGroupSmb => 'Partage de fichiers';

  @override
  String get ipTagGroupSsh => 'SSH';

  @override
  String get ipTagGroupVnc => 'VNC';

  @override
  String get ipTagGroupWeb => 'Web';

  @override
  String ipTagOpened(String text) {
    return 'Ouverture : $text';
  }

  @override
  String get ipTrayHiddenHint =>
      'IP Tools continue de fonctionner dans la zone de notification. Cliquez sur l’icône pour rouvrir la fenêtre.';

  @override
  String get ipTrayQuit => 'Quitter';

  @override
  String get ipTrayShow => 'Afficher IP Tools';

  @override
  String get ipWelcomeBody =>
      'Enregistrez une plage IP (ex. 192.168.1.0/24). Un clic sur l’enregistrement analyse la plage ; les appareils trouvés sont listés avec leur nom, leur fabricant et leurs services ouverts. Cliquez sur une étiquette de service pour ouvrir l’application correspondante.';

  @override
  String get ipWelcomeTitle => 'Qu’y a-t-il sur votre réseau local ?';

  @override
  String get cvTypeVideo => 'Vidéo';

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
  String get cvTypeVideoAll => 'Tous les fichiers vidéo';

  @override
  String get cvTypeImageAll => 'Tous les fichiers image';

  @override
  String get cvTypeAudioAll => 'Tous les fichiers audio';

  @override
  String get cvAppSearchPh => 'Rechercher des projets…  (Ctrl+F)';

  @override
  String get cvAppNewProject => 'Nouveau projet';

  @override
  String get cvAppSettings => 'Paramètres';

  @override
  String cvAppStats(String c, String f) {
    return '$c projets · $f dossiers';
  }

  @override
  String get cvAppWelcome => 'Bienvenue';

  @override
  String cvAppResults(String q) {
    return 'Résultats pour « $q »';
  }

  @override
  String get cvAppAll => 'Tous les projets';

  @override
  String get cvAppWelcomeHint =>
      'Créez votre premier projet de conversion.<br>Choisissez vidéo, image ou audio, sélectionnez les extensions source et cible, puis indiquez un fichier ou un dossier.';

  @override
  String get cvAppFolders => 'Dossiers';

  @override
  String get cvAppProjects => 'Projets';

  @override
  String get cvAppDblHint => 'Double-cliquez sur un projet pour l’ouvrir';

  @override
  String get cvAppNoMatch => 'Aucun projet correspondant.';

  @override
  String cvAppFolderCount(String n) {
    return '$n projets';
  }

  @override
  String get cvAppNewProjectHere => 'Nouveau projet dans ce dossier';

  @override
  String get cvAppNewSubfolder => 'Créer un sous-dossier';

  @override
  String get cvAppDuplicate => 'Dupliquer';

  @override
  String get cvAppMoveToFolder => 'Déplacer vers un dossier…';

  @override
  String get cvAppProjectMoved => 'Projet déplacé';

  @override
  String get cvAppFolderIntoSelf =>
      'Un dossier ne peut pas être déplacé dans lui-même';

  @override
  String get cvAppFolderPh => 'p. ex. Vidéos clients';

  @override
  String get cvAppRenameFolder => 'Renommer le dossier';

  @override
  String get cvAppDeleteFolder => 'Supprimer le dossier';

  @override
  String cvAppDeleteFolderMsg(String name) {
    return 'Supprimer le dossier <b>$name</b> ?';
  }

  @override
  String cvAppDeleteFolderProjects(String n) {
    return '<br>Ses $n projets seront déplacés vers le dossier parent.';
  }

  @override
  String get cvAppRootFolder => 'Niveau supérieur (aucun dossier)';

  @override
  String cvAppMoveTitle(String name) {
    return 'Déplacer « $name »';
  }

  @override
  String get cvAppTargetFolder => 'Dossier de destination';

  @override
  String get cvAppDeleteProject => 'Supprimer le projet';

  @override
  String cvAppDeleteProjectMsg(String name) {
    return 'Supprimer le projet <b>$name</b> ?<br>Ses fichiers convertis et ses transcriptions seront également supprimés. Vos fichiers source ne sont pas modifiés.';
  }

  @override
  String get cvAppProjectSettings => 'Paramètres du projet';

  @override
  String get cvAppNoSource => 'Aucune source choisie sur cet ordinateur';

  @override
  String get cvAppAllExts => 'Toutes';

  @override
  String get cvAppRunning => 'En cours';

  @override
  String cvAppDoneCount(String n) {
    return '$n terminés';
  }

  @override
  String cvAppErrorCount(String n) {
    return '$n en échec';
  }

  @override
  String get cvAppProjectSaved => 'Projet enregistré';

  @override
  String get cvAppClearOutputs => 'Supprimer les fichiers convertis';

  @override
  String cvAppClearOutputsMsg(String name) {
    return 'Supprimer les fichiers convertis de <b>$name</b> ? Vos fichiers source ne sont pas modifiés ; vous pouvez relancer la conversion à tout moment.';
  }

  @override
  String get cvPfTitleNew => 'Nouveau projet';

  @override
  String cvPfTitleEdit(String name) {
    return 'Paramètres du projet : $name';
  }

  @override
  String get cvPfCreate => 'Enregistrer';

  @override
  String get cvPfTabGeneral => 'Général';

  @override
  String get cvPfTabOutput => 'Paramètres de conversion';

  @override
  String get cvPfTabSpeech => 'Parole';

  @override
  String get cvPfName => 'Nom du projet';

  @override
  String get cvPfNamePh => 'p. ex. Vidéos de vacances';

  @override
  String get cvPfType => 'Type';

  @override
  String get cvPfSourceExt => 'Extension des fichiers source';

  @override
  String get cvPfTargetExt => 'Extension des fichiers cible';

  @override
  String get cvPfSelectAll => 'Tout sélectionner';

  @override
  String get cvPfSelectNone => 'Aucune';

  @override
  String get cvPfGroupVideo => 'Vidéo';

  @override
  String get cvPfGroupAnim => 'Animation';

  @override
  String get cvPfGroupAudioOnly => 'Audio seul (extrait de la vidéo)';

  @override
  String get cvPfAudioOnlyHint =>
      'Seule la piste audio de la vidéo est conservée.';

  @override
  String get cvPfGifHint => 'GIF animé (30 images/s au maximum).';

  @override
  String get cvPfSource => 'Source';

  @override
  String get cvPfModeFile => 'Fichier';

  @override
  String get cvPfModeFolder => 'Dossier';

  @override
  String get cvPfPathFile => 'Fichier à convertir';

  @override
  String get cvPfPathFolder => 'Dossier à convertir';

  @override
  String get cvPfPathNone => 'Pas encore choisi — cliquez sur Parcourir…';

  @override
  String get cvPfSubfolders => 'Inclure les sous-dossiers';

  @override
  String get cvPfConcurrency => 'Fichiers convertis simultanément';

  @override
  String get cvPfConcurrencyHint =>
      'Une valeur élevée termine plus vite, mais sollicite davantage le processeur et le disque.';

  @override
  String get cvPfFolder => 'Dossier du projet';

  @override
  String get cvPfSpeechAsk => 'Convertir la parole en texte';

  @override
  String get cvPfSpeechAskHint =>
      'La parole de la vidéo ou de l’audio est transcrite : la seconde, la langue et le texte de chaque phrase apparaissent dans des colonnes distinctes.';

  @override
  String get cvPfSpeechModel => 'Modèle vocal';

  @override
  String get cvPfSpeechLang => 'Langue parlée';

  @override
  String get cvPfPerWindow => 'Redétecter la langue toutes les 30 secondes';

  @override
  String get cvPfPerWindowHint =>
      'Pour les enregistrements multilingues. Plus lent.';

  @override
  String get cvPfModels => 'Modèles';

  @override
  String get cvPfSpeechNote =>
      'La reconnaissance vocale s’exécute hors ligne sur cet ordinateur (whisper.cpp) ; l’audio n’est jamais envoyé à un serveur. Le modèle est téléchargé une seule fois, à la première utilisation.';

  @override
  String get cvPfErrExt => 'Choisissez au moins une extension source.';

  @override
  String get cvOutQuality => 'Qualité';

  @override
  String get cvOutQHigh => 'Élevée (fichier volumineux)';

  @override
  String get cvOutQMedium => 'Moyenne (recommandée)';

  @override
  String get cvOutQLow => 'Faible (petit fichier)';

  @override
  String get cvOutResolution => 'Résolution';

  @override
  String get cvOutAsSource => 'Identique à la source';

  @override
  String get cvOutResolutionHint =>
      'Réduction uniquement ; les vidéos plus petites ne sont pas agrandies.';

  @override
  String get cvOutFps => 'Fréquence d’images';

  @override
  String get cvOutCodec => 'Codec vidéo';

  @override
  String get cvOutH264 => 'H.264 (le plus compatible)';

  @override
  String get cvOutH265 => 'H.265 / HEVC (plus compact)';

  @override
  String get cvOutCodecHint =>
      'H.265 n’est utilisé que pour les cibles MP4, MKV, MOV et M4V.';

  @override
  String get cvOutSpeed => 'Vitesse d’encodage';

  @override
  String get cvOutSpeedVeryfast => 'Très rapide';

  @override
  String get cvOutSpeedFast => 'Rapide';

  @override
  String get cvOutSpeedMedium => 'Équilibrée';

  @override
  String get cvOutSpeedSlow => 'Lente (fichier plus petit)';

  @override
  String get cvOutAudioBitrate => 'Débit audio';

  @override
  String get cvOutNoAudio => 'Supprimer l’audio';

  @override
  String get cvOutImgQuality => 'Qualité';

  @override
  String get cvOutImgQualityHint =>
      'Pour JPG, WEBP, AVIF et TIFF. Le PNG est sans perte ; en dessous de 80, une palette de couleurs est utilisée.';

  @override
  String get cvOutMaxWidth => 'Largeur maximale';

  @override
  String get cvOutMaxHeight => 'Hauteur maximale';

  @override
  String get cvOutNoLimit => 'Aucune limite';

  @override
  String get cvOutResizeHint =>
      'Les proportions sont conservées ; les images plus petites ne sont pas agrandies.';

  @override
  String get cvOutKeepMeta =>
      'Conserver les métadonnées (EXIF, profil colorimétrique)';

  @override
  String get cvOutKeepMetaHint =>
      'Si désactivé, les données personnelles comme la localisation ne sont pas écrites dans le fichier de sortie.';

  @override
  String get cvOutBitrate => 'Débit';

  @override
  String get cvOutBitrateHint =>
      'WAV, FLAC et AIFF sont sans perte ; le débit ne s’applique pas.';

  @override
  String get cvOutSampleRate => 'Fréquence d’échantillonnage';

  @override
  String get cvOutChannels => 'Canaux';

  @override
  String get cvOutStereo => 'Stéréo';

  @override
  String get cvOutMono => 'Mono';

  @override
  String get cvSpeechModelTiny => 'Tiny (le plus rapide)';

  @override
  String get cvSpeechModelBase => 'Base (recommandé)';

  @override
  String get cvSpeechModelSmall => 'Small (plus précis)';

  @override
  String get cvSpeechModelMedium => 'Medium (haute précision)';

  @override
  String get cvSpeechModelTurbo => 'Large v3 Turbo (le plus précis)';

  @override
  String get cvSpeechLangAuto => 'Détection automatique';

  @override
  String get cvSpeechDownload => 'Télécharger';

  @override
  String cvSpeechInstalled(String size) {
    return 'Installé · $size';
  }

  @override
  String get cvSpeechDownloadFailed => 'Le modèle n’a pas pu être téléchargé';

  @override
  String get cvSpeechDlEngine => 'Téléchargement du moteur vocal';

  @override
  String cvSpeechDlModel(String model) {
    return 'Téléchargement du modèle vocal : $model';
  }

  @override
  String get cvSpeechEngineAuto =>
      'Le moteur vocal (whisper.cpp) sera téléchargé à la première utilisation.';

  @override
  String get cvSpeechEngineMissing =>
      'Le moteur vocal (whisper-cli) est introuvable.';

  @override
  String get cvPjOriginal => 'Original';

  @override
  String get cvPjConverted => 'Converti';

  @override
  String get cvPjFolders => 'Dossiers';

  @override
  String get cvPjFiles => 'Fichiers';

  @override
  String get cvPjTranscript => 'Texte';

  @override
  String get cvPjTrSecond => 'Seconde';

  @override
  String get cvPjTrLang => 'Langue';

  @override
  String get cvPjTrText => 'Texte';

  @override
  String get cvPjSecUnit => 's';

  @override
  String get cvPjStart => 'Démarrer';

  @override
  String get cvPjStop => 'Arrêter';

  @override
  String get cvPjChangeSource => 'Changer de source';

  @override
  String get cvPjPickSource => 'Choisir la source';

  @override
  String get cvPjOpenOutDir => 'Ouvrir le dossier des fichiers convertis';

  @override
  String get cvPjExportOutputs =>
      'Copier les fichiers convertis vers un autre dossier…';

  @override
  String get cvPjClearOutputs => 'Supprimer les fichiers convertis';

  @override
  String get cvPjLinkPreview => 'Lire les deux aperçus ensemble';

  @override
  String get cvPjFilterPh => 'Rechercher des fichiers';

  @override
  String get cvPjFAll => 'Tous';

  @override
  String get cvPjFPending => 'En attente';

  @override
  String get cvPjFActive => 'En cours';

  @override
  String get cvPjFDone => 'Terminés';

  @override
  String get cvPjFError => 'En échec';

  @override
  String get cvPjExpandAll => 'Tout développer';

  @override
  String get cvPjCollapseAll => 'Tout réduire';

  @override
  String get cvPjRescan => 'Réanalyser';

  @override
  String get cvPjColName => 'Nom';

  @override
  String get cvPjColFolder => 'Dossier';

  @override
  String get cvPjColSize => 'Taille';

  @override
  String get cvPjColProgress => 'Progression';

  @override
  String get cvPjColStatus => 'État';

  @override
  String get cvPjColSpeech => 'Texte';

  @override
  String get cvPjColOut => 'Sortie';

  @override
  String cvPjSegments(String n) {
    return '$n phrases';
  }

  @override
  String get cvPjNoAudio => 'Pas d’audio';

  @override
  String cvPjNoFiles(String exts) {
    return 'Aucun fichier avec les extensions choisies dans ce dossier ($exts).';
  }

  @override
  String get cvPjNoMatch => 'Aucun fichier correspondant.';

  @override
  String get cvPjNoneChecked =>
      'La liste est vide. Cochez les fichiers à convertir dans l’arborescence à gauche.';

  @override
  String get cvPjConvertThis => 'Convertir ce fichier';

  @override
  String get cvPjReconvert => 'Reconvertir';

  @override
  String get cvPjTranscribeThis => 'Transcrire';

  @override
  String get cvPjRetranscribe => 'Transcrire à nouveau';

  @override
  String get cvPjOpenOut => 'Ouvrir le fichier converti';

  @override
  String get cvPjRevealOut => 'Afficher le fichier converti dans le dossier';

  @override
  String get cvPjOpenSrc => 'Ouvrir le fichier original';

  @override
  String get cvPjRevealSrc => 'Afficher l’original dans le dossier';

  @override
  String get cvPjExportThis => 'Copier vers un autre dossier…';

  @override
  String get cvPjDeleteOut => 'Supprimer le fichier converti';

  @override
  String get cvPjUncheck => 'Retirer de la liste';

  @override
  String cvPjExported(String n) {
    return '$n fichiers copiés';
  }

  @override
  String get cvPjFileMissing => 'Le fichier source est introuvable.';

  @override
  String get cvPjPickToPreview =>
      'Sélectionnez un fichier dans la liste pour l’afficher en aperçu.';

  @override
  String get cvPjOutPreviewHint => 'Il apparaîtra ici une fois converti.';

  @override
  String get cvPjConverting => 'Conversion…';

  @override
  String get cvPjCantPlay => 'Ce format ne peut pas être lu directement ici.';

  @override
  String get cvPjMakePreview => 'Créer un aperçu';

  @override
  String get cvPjMakingPreview => 'Préparation de l’aperçu…';

  @override
  String get cvPjNoSourceTitle => 'Aucune source choisie sur cet ordinateur';

  @override
  String get cvPjNoSourceHint =>
      'Le projet a été synchronisé depuis un autre appareil ou aucune source n’a encore été choisie. Choisissez le fichier ou le dossier à convertir.';

  @override
  String get cvPjSourceGone => 'Source introuvable';

  @override
  String get cvPjTrImage =>
      'La conversion de la parole en texte est disponible dans les projets vidéo et audio.';

  @override
  String get cvPjTrPick => 'Sélectionnez un fichier pour voir son texte.';

  @override
  String get cvPjTrAfter =>
      'La parole sera transcrite une fois le fichier converti.';

  @override
  String get cvPjTrOff =>
      'La conversion de la parole en texte est désactivée dans ce projet. Vous pouvez la lancer maintenant pour ce fichier.';

  @override
  String cvPjTrRunning(String p) {
    return 'Transcription… $p %';
  }

  @override
  String get cvPjTrNone => 'Aucune parole n’a été détectée dans ce fichier.';

  @override
  String get cvPjTrNoExport => 'Il n’y a aucun texte à exporter.';

  @override
  String get cvPjTrSaved => 'Texte enregistré';

  @override
  String get cvPjExportTranscript => 'Exporter le texte';

  @override
  String get cvPjFmtSrt => 'Sous-titres SRT';

  @override
  String get cvPjFmtVtt => 'Sous-titres WebVTT';

  @override
  String get cvPjFmtTxt => 'Texte brut (TXT)';

  @override
  String get cvPjFmtCsv => 'Feuille de calcul (CSV)';

  @override
  String cvPjStTotal(String n) {
    return '$n fichiers';
  }

  @override
  String cvPjStDone(String n) {
    return '$n terminés';
  }

  @override
  String cvPjStErr(String n) {
    return '$n en échec';
  }

  @override
  String cvPjStActive(String n) {
    return '$n en conversion';
  }

  @override
  String cvPjStSpeech(String n) {
    return '$n en transcription';
  }

  @override
  String cvPjStOut(String size) {
    return 'Sortie : $size';
  }

  @override
  String cvPjStConc(String n) {
    return 'Simultanés : $n';
  }

  @override
  String get cvPjFinished => 'Conversion terminée';

  @override
  String cvPjFinishedSub(String done, String err, String total) {
    return '$done/$total fichiers terminés · $err en échec';
  }

  @override
  String get cvStPending => 'En attente';

  @override
  String get cvStQueued => 'Dans la file';

  @override
  String get cvStConverting => 'Conversion';

  @override
  String get cvStDone => 'Terminé';

  @override
  String get cvStError => 'Erreur';

  @override
  String get cvStCanceled => 'Annulé';

  @override
  String get cvMainBalloonTitle =>
      'Convert Master est toujours en cours d’exécution';

  @override
  String get cvMainBalloonBody =>
      'Cliquez sur l’icône de la zone de notification pour rouvrir la fenêtre.';

  @override
  String get cvMainTrayShow => 'Afficher Convert Master';

  @override
  String get cvMainTrayProjects => 'Projets';

  @override
  String get cvMainTrayNone => '(aucun projet)';

  @override
  String get cvMainTrayQuit => 'Quitter';

  @override
  String get cvErrCanceled => 'Annulé';

  @override
  String get cvErrNoVideo => 'Le fichier ne contient pas de flux vidéo.';

  @override
  String get cvErrNoAudio => 'Le fichier ne contient pas d’audio.';

  @override
  String get cvPjOcrThis => 'Lire le texte (OCR)';

  @override
  String get cvPjReocr => 'Relire le texte (OCR)';

  @override
  String get cvPjNoText => 'Aucun texte';

  @override
  String get cvPjNoTextHint =>
      'Aucun texte lisible n’a été trouvé dans l’image.';

  @override
  String get cvPjOcrPanel => 'Texte (OCR)';

  @override
  String get cvPjTrLine => 'Ligne';

  @override
  String get cvPjTrConf => 'Confiance';

  @override
  String cvPjLines(String n) {
    return '$n lignes';
  }

  @override
  String get cvPjOcrAfter =>
      'Le texte de l’image sera lu une fois celle-ci convertie.';

  @override
  String get cvPjOcrOff =>
      'L’OCR est désactivé dans ce projet. Vous pouvez le lancer maintenant pour cette image.';

  @override
  String cvPjOcrRunning(String p) {
    return 'Lecture du texte… $p %';
  }

  @override
  String get cvPjCopyAll => 'Tout copier';

  @override
  String get cvPjCopied => 'Texte copié dans le presse-papiers';

  @override
  String cvOcrDl(String lang) {
    return 'Téléchargement des données de langue OCR : $lang';
  }

  @override
  String get cvOcrNotInstalled => 'Téléchargé à la première utilisation';

  @override
  String get cvOcrDownloadFailed =>
      'Impossible de télécharger les données de langue OCR';

  @override
  String get cvPfTabOcr => 'OCR';

  @override
  String get cvPfOcrAsk => 'Lire le texte des images (OCR)';

  @override
  String get cvPfOcrAskHint =>
      'Le texte des images est extrait : chaque ligne, sa fiabilité de lecture et le texte apparaissent dans des colonnes distinctes. Laissez désactivé si vous n’en avez pas besoin.';

  @override
  String get cvPfOcrLangs => 'Langue du texte des images';

  @override
  String get cvPfOcrLangsHint =>
      'Jusqu’à 6 langues ; moins de langues, c’est plus rapide et plus précis.';

  @override
  String get cvPfOcrData => 'Données de langue';

  @override
  String get cvPfOcrNote =>
      'L’OCR fonctionne hors ligne sur cet ordinateur (Tesseract) ; les images ne sont jamais envoyées à un serveur. Chaque langue est téléchargée une seule fois, à la première utilisation.';

  @override
  String cvErrOcr(String msg) {
    return 'Impossible de lire le texte : $msg';
  }

  @override
  String get cvErrUnreadable =>
      'Le fichier n’a pas pu être lu (endommagé ou non pris en charge).';

  @override
  String get cvErrUnsupported => 'Cette conversion n’est pas prise en charge.';

  @override
  String cvErrFfmpegMissing(String msg) {
    return 'Le moteur de conversion (ffmpeg) n’a pas pu être démarré : $msg';
  }

  @override
  String get cvErrEngineMissing =>
      'Le moteur vocal (whisper.cpp) est introuvable.';

  @override
  String cvErrDownload(String msg) {
    return 'Échec du téléchargement : $msg';
  }

  @override
  String get cvErrNotFound => 'Fichier introuvable.';

  @override
  String get cvErrAccess => 'Accès refusé.';

  @override
  String get cvErrBusy => 'Le fichier est utilisé par un autre programme.';

  @override
  String get cvErrNoSpace => 'Le disque est plein.';

  @override
  String cvErrFfmpeg(String msg) {
    return 'Conversion impossible : $msg';
  }

  @override
  String cvErrWhisper(String msg) {
    return 'Transcription impossible : $msg';
  }

  @override
  String get cvMainCloseActive =>
      'Une conversion est en cours. Fermer la fenêtre l’arrêtera.';

  @override
  String get cvMainCloseAnyway => 'Fermer quand même';

  @override
  String get cvMainCopySuffix => ' (copie)';

  @override
  String get cvMainErrProjectNotFound => 'Projet introuvable';

  @override
  String get cvMainExportTo => 'Dossier où copier les fichiers convertis';

  @override
  String get cvMainPickFile => 'Choisir le fichier à convertir';

  @override
  String get cvMainPickFolder => 'Choisir le dossier à convertir';

  @override
  String get cvMainSaveTranscript => 'Enregistrer le texte';

  @override
  String get cvMainUntitled => 'Projet sans titre';

  @override
  String get sqOp => 'supérieur ou égal';

  @override
  String get sqOpNotcontains => 'ne contient pas';

  @override
  String get sqOpNotlike => 'NOT LIKE';

  @override
  String get sqOpNotin => 'pas dans la liste';

  @override
  String get sqOpIsnull => 'est NULL';

  @override
  String get sqOpIsnotnull => 'n’est pas NULL';

  @override
  String get ipMobScanThis => 'Analyser ce réseau';

  @override
  String get ipMobDeleteRecord => 'Supprimer l\'enregistrement';

  @override
  String get ipMobNewRecordHere => 'Nouvel enregistrement ici';

  @override
  String get ipMobNoMatch => 'Aucun enregistrement correspondant.';

  @override
  String ipMobAddresses(int n) {
    return '$n adresses';
  }

  @override
  String get ipMobAllRecords => 'Tous les enregistrements';

  @override
  String get ipMobSetScan => 'Analyse';

  @override
  String get ipMobSetPorts => 'Services à tester';

  @override
  String get ipMobSetPortsHint =>
      'Une seule tentative de connexion TCP standard est effectuée pour chaque port. La liste est fixe ; vous pouvez désactiver ceux dont vous n\'avez pas besoin.';

  @override
  String get ipMobSetSpeed => 'Vitesse';

  @override
  String get ipMobSetConcurrency => 'Connexions simultanées';

  @override
  String get ipMobSetConcurrencyHint =>
      'Au plus 64 tentatives de connexion à la fois (limite de conception).';

  @override
  String get ipMobSetTimeout => 'Délai d\'attente';

  @override
  String get ipMobSetTimeoutHint => 'Attente maximale de 1000 ms par appareil.';

  @override
  String get ipMobSetLimitsNote =>
      'IP Tools est uniquement un outil de découverte et d\'inventaire : la liste des ports ne peut pas être étendue, aucun test de vulnérabilité ni essai de mot de passe n\'est effectué, et seules les adresses privées/locales sont analysées.';

  @override
  String get ipMobMacMobile => 'indisponible sur mobile';

  @override
  String get ipMobAliveTcp => 'A répondu à la connexion TCP';

  @override
  String get ipMobAliveName => 'A répondu à la résolution de nom';

  @override
  String get ipMobOpenInSsh => 'Ouvrir dans SSH Master';

  @override
  String get ipMobOpenInSshNote =>
      'Adresse copiée dans le presse-papiers ; collez-la dans le formulaire SSH Master › Nouvelle connexion.';

  @override
  String get ipMobCopyAddress => 'Copier l\'adresse';

  @override
  String get ipMobSuggestLocal => 'Réseau de cet appareil';

  @override
  String get ipMobSuggestLocalNone => 'Aucun réseau Wi-Fi trouvé';

  @override
  String get ipMobPhoneNoMacNote =>
      'Sur mobile, ni ping ni ARP : la présence est déterminée par des tentatives de connexion TCP et la résolution de nom ; les informations MAC et fabricant ne peuvent pas être affichées.';

  @override
  String get cvMobNotOnMobile => 'Indisponible sur mobile';

  @override
  String get cvMobSpeechNote =>
      'La transcription de la parole (whisper.cpp) n\'est pas disponible dans la version mobile ; les paramètres sont conservés et appliqués sur ordinateur.';

  @override
  String get cvMobOcrNote =>
      'L\'extraction de texte des images (OCR, Tesseract) n\'est pas disponible dans la version mobile ; les paramètres sont conservés et appliqués sur ordinateur.';

  @override
  String get cvMobFolderNote =>
      'Impossible de choisir un dossier source sur mobile ; les fichiers sont ajoutés un par un ou depuis la galerie.';

  @override
  String get cvMobConcurrencyHint =>
      'Sur mobile, au plus 2 fichiers sont convertis à la fois.';

  @override
  String get cvMobAddFiles => 'Ajouter des fichiers';

  @override
  String get cvMobAddFromGallery => 'Ajouter depuis la galerie';

  @override
  String get cvMobPickFilesHint =>
      'Ajoutez les fichiers à convertir ; les sorties sont enregistrées dans les documents de l\'application.';

  @override
  String get cvMobShareOutput => 'Partager la sortie';

  @override
  String get cvMobShareAllOutputs => 'Partager toutes les sorties';

  @override
  String get cvMobSourceCopies => 'Copies des sources';

  @override
  String get cvMobModuleSettings => 'Paramètres de Convert Master';

  @override
  String get cvMobDefaultConcurrency =>
      'Fichiers convertis simultanément dans les nouveaux projets';

  @override
  String get cvMobStorage => 'Stockage';

  @override
  String get cvMobConversion => 'Conversion';

  @override
  String get cvMobClearOrphans => 'Nettoyer les fichiers des projets supprimés';

  @override
  String get cvMobStorageNote =>
      'Les fichiers convertis et les copies des sources sont conservés dans le dossier documents de l\'application ; ils ne quittent jamais votre appareil.';

  @override
  String get cvMobCleared => 'Nettoyé';

  @override
  String get cvMobNoOutputsYet => 'Aucun fichier converti pour l\'instant.';

  @override
  String cvMobFilesAdded(int n) {
    return '$n fichiers ajoutés';
  }

  @override
  String get cvMobUnsupportedExt =>
      'Ne fait pas partie des extensions sources de ce projet';

  @override
  String get cvMobUnsupportedOnMobile => 'Non pris en charge sur mobile';

  @override
  String get cvMobLicense =>
      'La conversion vidéo et audio utilise FFmpegKit (LGPL 3.0, sans composant GPL) ; l\'encodage H.264 / H.265 utilise l\'encodeur matériel de l\'appareil (iOS VideoToolbox, Android MediaCodec).';

  @override
  String cvMobConverted(int n) {
    return '$n fichiers convertis';
  }

  @override
  String cvMobFilesCount(int n) {
    return '$n fichiers';
  }

  @override
  String get sqMobUnsupportedMobile =>
      'Ce moteur n\'est pas encore pris en charge sur mobile';

  @override
  String get sqMobPickFile => 'Choisir';

  @override
  String get sqMobFileCopied =>
      'Fichier copié dans le répertoire documents de l\'application';

  @override
  String get sqMobSshKeyPaste => 'Collez une clé PEM ou choisissez un fichier';

  @override
  String get sqMobErrHost => 'L\'adresse du serveur est requise';

  @override
  String get sqMobErrFile => 'Choisissez un fichier de base de données';

  @override
  String get sqMobErrSshHost =>
      'Le serveur SSH et le nom d\'utilisateur sont requis';

  @override
  String get sqMobErrSshKey => 'La clé privée SSH est requise';

  @override
  String get sqMobSslVerifyNote =>
      'Le pilote MySQL ne vérifie pas les certificats ; l\'option « vérifier » se comporte comme « obligatoire ».';

  @override
  String get sqMobRowDetail => 'Détail de la ligne';

  @override
  String get sqMobNoResult => 'Aucun résultat — commencez par Exécuter';

  @override
  String get sqMobExportJsonl => 'JSONL (un JSON par ligne)';

  @override
  String get sqMobExportNoRows => 'Aucune ligne à exporter';

  @override
  String get sqMobSettingsTitle => 'Paramètres de SQL Master';

  @override
  String get sqMobRowLimit => 'Limite de lignes par requête';

  @override
  String get sqMobPreviewRows => 'Lignes d\'aperçu de table';

  @override
  String get sqMobEditorFont => 'Taille de police de l\'éditeur';

  @override
  String get sqMobCopyCell => 'Copier la valeur';

  @override
  String get sqMobSelectionRun => 'Exécuter la sélection';

  @override
  String get sqMobTunnelOpening => 'Ouverture du tunnel SSH…';

  @override
  String get sqMobConnectingDb => 'Connexion à la base de données…';

  @override
  String get sqMobOpEq => '= (égal)';

  @override
  String get sqMobOpNe => '≠ (différent)';

  @override
  String get sqMobOpLt => '< (inférieur)';

  @override
  String get sqMobOpGt => '> (supérieur)';

  @override
  String get sqMobOpLe => '≤ (inférieur ou égal)';

  @override
  String get npMobSaveAs => 'Enregistrer sous…';

  @override
  String get npMobSaveAsTitle => 'Enregistrer sous';

  @override
  String get npMobDefaultProjectName => 'Projet';

  @override
  String get npMobLocalPathExample => 'Documents/Notepad Master/…';

  @override
  String get npMobReplaceAll => 'Tout remplacer';
}
