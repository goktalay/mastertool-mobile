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
}
