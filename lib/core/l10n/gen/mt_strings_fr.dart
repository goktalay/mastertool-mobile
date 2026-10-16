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
}
