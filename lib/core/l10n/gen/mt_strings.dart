import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:intl/intl.dart' as intl;

import 'mt_strings_ar.dart';
import 'mt_strings_de.dart';
import 'mt_strings_en.dart';
import 'mt_strings_es.dart';
import 'mt_strings_fr.dart';
import 'mt_strings_ru.dart';
import 'mt_strings_tr.dart';
import 'mt_strings_zh.dart';

// ignore_for_file: type=lint

/// Callers can lookup localized strings with an instance of MtStrings
/// returned by `MtStrings.of(context)`.
///
/// Applications need to include `MtStrings.delegate()` in their app's
/// `localizationDelegates` list, and the locales they support in the app's
/// `supportedLocales` list. For example:
///
/// ```dart
/// import 'gen/mt_strings.dart';
///
/// return MaterialApp(
///   localizationsDelegates: MtStrings.localizationsDelegates,
///   supportedLocales: MtStrings.supportedLocales,
///   home: MyApplicationHome(),
/// );
/// ```
///
/// ## Update pubspec.yaml
///
/// Please make sure to update your pubspec.yaml to include the following
/// packages:
///
/// ```yaml
/// dependencies:
///   # Internationalization support.
///   flutter_localizations:
///     sdk: flutter
///   intl: any # Use the pinned version from flutter_localizations
///
///   # Rest of dependencies
/// ```
///
/// ## iOS Applications
///
/// iOS applications define key application metadata, including supported
/// locales, in an Info.plist file that is built into the application bundle.
/// To configure the locales supported by your app, you’ll need to edit this
/// file.
///
/// First, open your project’s ios/Runner.xcworkspace Xcode workspace file.
/// Then, in the Project Navigator, open the Info.plist file under the Runner
/// project’s Runner folder.
///
/// Next, select the Information Property List item, select Add Item from the
/// Editor menu, then select Localizations from the pop-up menu.
///
/// Select and expand the newly-created Localizations item then, for each
/// locale your application supports, add a new item and select the locale
/// you wish to add from the pop-up menu in the Value field. This list should
/// be consistent with the languages listed in the MtStrings.supportedLocales
/// property.
abstract class MtStrings {
  MtStrings(String locale)
    : localeName = intl.Intl.canonicalizedLocale(locale.toString());

  final String localeName;

  static MtStrings of(BuildContext context) {
    return Localizations.of<MtStrings>(context, MtStrings)!;
  }

  static const LocalizationsDelegate<MtStrings> delegate = _MtStringsDelegate();

  /// A list of this localizations delegate along with the default localizations
  /// delegates.
  ///
  /// Returns a list of localizations delegates containing this delegate along with
  /// GlobalMaterialLocalizations.delegate, GlobalCupertinoLocalizations.delegate,
  /// and GlobalWidgetsLocalizations.delegate.
  ///
  /// Additional delegates can be added by appending to this list in
  /// MaterialApp. This list does not have to be used at all if a custom list
  /// of delegates is preferred or required.
  static const List<LocalizationsDelegate<dynamic>> localizationsDelegates =
      <LocalizationsDelegate<dynamic>>[
        delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
      ];

  /// A list of this localizations delegate's supported locales.
  static const List<Locale> supportedLocales = <Locale>[
    Locale('ar'),
    Locale('de'),
    Locale('en'),
    Locale('es'),
    Locale('fr'),
    Locale('ru'),
    Locale('tr'),
    Locale('zh'),
  ];

  /// No description provided for @setGeneral.
  ///
  /// In tr, this message translates to:
  /// **'Genel'**
  String get setGeneral;

  /// No description provided for @setAccount.
  ///
  /// In tr, this message translates to:
  /// **'Hesap'**
  String get setAccount;

  /// No description provided for @setAbout.
  ///
  /// In tr, this message translates to:
  /// **'Hakkında'**
  String get setAbout;

  /// No description provided for @aboutVersion.
  ///
  /// In tr, this message translates to:
  /// **'Sürüm {version}'**
  String aboutVersion(String version);

  /// No description provided for @aboutFamily.
  ///
  /// In tr, this message translates to:
  /// **'Mastertool ailesi: SSH Master · FTP Masters · SQL Master · Notepad Master · Convert Master · IP Tools'**
  String get aboutFamily;

  /// No description provided for @aboutCheckUpdate.
  ///
  /// In tr, this message translates to:
  /// **'Güncellemeleri denetle'**
  String get aboutCheckUpdate;

  /// No description provided for @aboutChecking.
  ///
  /// In tr, this message translates to:
  /// **'Denetleniyor…'**
  String get aboutChecking;

  /// No description provided for @aboutUpToDate.
  ///
  /// In tr, this message translates to:
  /// **'{app} güncel.'**
  String aboutUpToDate(String app);

  /// No description provided for @aboutCheckFailed.
  ///
  /// In tr, this message translates to:
  /// **'Güncelleme denetlenemedi: {msg}'**
  String aboutCheckFailed(String msg);

  /// No description provided for @aboutLicenses.
  ///
  /// In tr, this message translates to:
  /// **'Açık kaynak lisansları'**
  String get aboutLicenses;

  /// No description provided for @aboutLicensesIntro.
  ///
  /// In tr, this message translates to:
  /// **'{app} şu açık kaynak bileşenleri kullanır:'**
  String aboutLicensesIntro(String app);

  /// No description provided for @authErrAppDisabled.
  ///
  /// In tr, this message translates to:
  /// **'Bu hesapta {app} kullanımı yönetici tarafından kapatılmış. Hesap yöneticinizle iletişime geçin.'**
  String authErrAppDisabled(String app);

  /// No description provided for @authErrWrongApp.
  ///
  /// In tr, this message translates to:
  /// **'Bu oturum başka bir uygulamaya ait. Lütfen {app} için yeniden giriş yapın.'**
  String authErrWrongApp(String app);

  /// No description provided for @authSignedOut.
  ///
  /// In tr, this message translates to:
  /// **'Bu bilgisayardaki bir Mastertool uygulamasında çıkış yapıldı. Tekrar giriş yapın.'**
  String get authSignedOut;

  /// No description provided for @authSubtitle.
  ///
  /// In tr, this message translates to:
  /// **'Hesabınızla giriş yapın'**
  String get authSubtitle;

  /// No description provided for @authEmail.
  ///
  /// In tr, this message translates to:
  /// **'E-posta'**
  String get authEmail;

  /// No description provided for @authPassword.
  ///
  /// In tr, this message translates to:
  /// **'Şifre'**
  String get authPassword;

  /// No description provided for @authRemember.
  ///
  /// In tr, this message translates to:
  /// **'Beni hatırla'**
  String get authRemember;

  /// No description provided for @authForgot.
  ///
  /// In tr, this message translates to:
  /// **'Şifremi unuttum'**
  String get authForgot;

  /// No description provided for @authNoAccount.
  ///
  /// In tr, this message translates to:
  /// **'Hesabınız yok mu?'**
  String get authNoAccount;

  /// No description provided for @authRegister.
  ///
  /// In tr, this message translates to:
  /// **'Hesap oluştur'**
  String get authRegister;

  /// No description provided for @authSubmit.
  ///
  /// In tr, this message translates to:
  /// **'Giriş yap'**
  String get authSubmit;

  /// No description provided for @authWorking.
  ///
  /// In tr, this message translates to:
  /// **'Giriş yapılıyor…'**
  String get authWorking;

  /// No description provided for @authErrRequired.
  ///
  /// In tr, this message translates to:
  /// **'E-posta ve şifre gerekli.'**
  String get authErrRequired;

  /// No description provided for @authErrBadCredentials.
  ///
  /// In tr, this message translates to:
  /// **'E-posta veya şifre hatalı.'**
  String get authErrBadCredentials;

  /// No description provided for @authErrUnverified.
  ///
  /// In tr, this message translates to:
  /// **'E-posta adresiniz henüz doğrulanmadı. Gelen kutunuzdaki bağlantıya tıklayın.'**
  String get authErrUnverified;

  /// No description provided for @authErrSuspended.
  ///
  /// In tr, this message translates to:
  /// **'Hesabınız askıya alınmış.'**
  String get authErrSuspended;

  /// No description provided for @authErrRateLimited.
  ///
  /// In tr, this message translates to:
  /// **'Çok fazla deneme yapıldı. Bir dakika sonra tekrar deneyin.'**
  String get authErrRateLimited;

  /// No description provided for @authErrOffline.
  ///
  /// In tr, this message translates to:
  /// **'Sunucuya ulaşılamıyor. İnternet bağlantınızı kontrol edin.'**
  String get authErrOffline;

  /// No description provided for @authErrSessionExpired.
  ///
  /// In tr, this message translates to:
  /// **'Oturumunuzun süresi doldu ya da şifreniz değişti. Lütfen yeniden giriş yapın.'**
  String get authErrSessionExpired;

  /// No description provided for @authErrServer.
  ///
  /// In tr, this message translates to:
  /// **'Giriş yapılamadı: {msg}'**
  String authErrServer(String msg);

  /// No description provided for @acctSection.
  ///
  /// In tr, this message translates to:
  /// **'Hesap ve senkronizasyon'**
  String get acctSection;

  /// No description provided for @acctSignedInAs.
  ///
  /// In tr, this message translates to:
  /// **'{email} olarak giriş yapıldı'**
  String acctSignedInAs(String email);

  /// No description provided for @acctSyncToggle.
  ///
  /// In tr, this message translates to:
  /// **'Bağlantıları web ile senkronize et'**
  String get acctSyncToggle;

  /// No description provided for @acctSyncHint.
  ///
  /// In tr, this message translates to:
  /// **'Bağlantılar, klasörler ve kısayollar uçtan uca şifrelenerek hesabınıza yedeklenir; sunucu içeriği okuyamaz. Yazı boyutu, tepsi gibi cihaz ayarları gönderilmez.'**
  String get acctSyncHint;

  /// No description provided for @acctLastSync.
  ///
  /// In tr, this message translates to:
  /// **'Son senkron: {time}'**
  String acctLastSync(String time);

  /// No description provided for @acctNever.
  ///
  /// In tr, this message translates to:
  /// **'Henüz senkronize edilmedi'**
  String get acctNever;

  /// No description provided for @acctSyncNow.
  ///
  /// In tr, this message translates to:
  /// **'Şimdi senkronize et'**
  String get acctSyncNow;

  /// No description provided for @acctDeleteRemote.
  ///
  /// In tr, this message translates to:
  /// **'Sunucudaki kopyayı sil'**
  String get acctDeleteRemote;

  /// No description provided for @acctDeleteRemoteMsg.
  ///
  /// In tr, this message translates to:
  /// **'Hesabınızdaki şifreli kütüphane kopyası silinecek ve senkronizasyon kapatılacak. Bu bilgisayardaki bağlantılar silinmez.'**
  String get acctDeleteRemoteMsg;

  /// No description provided for @acctDeleteRemoteDone.
  ///
  /// In tr, this message translates to:
  /// **'Sunucudaki kopya silindi; senkronizasyon kapatıldı'**
  String get acctDeleteRemoteDone;

  /// No description provided for @acctLogout.
  ///
  /// In tr, this message translates to:
  /// **'Çıkış yap'**
  String get acctLogout;

  /// No description provided for @acctLogoutMsg.
  ///
  /// In tr, this message translates to:
  /// **'Hesabınızdan çıkış yapılacak. Bu cihazdaki bağlantılar ve projeler silinmez.'**
  String get acctLogoutMsg;

  /// No description provided for @acctMyAccount.
  ///
  /// In tr, this message translates to:
  /// **'Hesabım (web)'**
  String get acctMyAccount;

  /// No description provided for @acctBackupNotice.
  ///
  /// In tr, this message translates to:
  /// **'Farklı bir hesapla giriş yapıldı; bu bilgisayardaki önceki bağlantılar yedeklendi.'**
  String get acctBackupNotice;

  /// No description provided for @syncOff.
  ///
  /// In tr, this message translates to:
  /// **'Senkronizasyon kapalı'**
  String get syncOff;

  /// No description provided for @syncSyncing.
  ///
  /// In tr, this message translates to:
  /// **'Senkronize ediliyor…'**
  String get syncSyncing;

  /// No description provided for @syncOffline.
  ///
  /// In tr, this message translates to:
  /// **'Çevrimdışı — değişiklikler bağlantı gelince gönderilecek'**
  String get syncOffline;

  /// No description provided for @syncErrDecrypt.
  ///
  /// In tr, this message translates to:
  /// **'Sunucudaki kopya bu hesabın anahtarıyla çözülemedi; bu bilgisayardaki bağlantılar korunuyor.'**
  String get syncErrDecrypt;

  /// No description provided for @syncErrTooLarge.
  ///
  /// In tr, this message translates to:
  /// **'Kütüphane 5 MB sınırını aşıyor; senkronize edilemedi.'**
  String get syncErrTooLarge;

  /// No description provided for @syncError.
  ///
  /// In tr, this message translates to:
  /// **'Senkron hatası: {msg}'**
  String syncError(String msg);

  /// No description provided for @commonCancel.
  ///
  /// In tr, this message translates to:
  /// **'İptal'**
  String get commonCancel;

  /// No description provided for @commonSave.
  ///
  /// In tr, this message translates to:
  /// **'Kaydet'**
  String get commonSave;

  /// No description provided for @commonCreate.
  ///
  /// In tr, this message translates to:
  /// **'Oluştur'**
  String get commonCreate;

  /// No description provided for @commonOk.
  ///
  /// In tr, this message translates to:
  /// **'Tamam'**
  String get commonOk;

  /// No description provided for @commonDelete.
  ///
  /// In tr, this message translates to:
  /// **'Sil'**
  String get commonDelete;

  /// No description provided for @commonGiveUp.
  ///
  /// In tr, this message translates to:
  /// **'Vazgeç'**
  String get commonGiveUp;

  /// No description provided for @commonOpen.
  ///
  /// In tr, this message translates to:
  /// **'Aç'**
  String get commonOpen;

  /// No description provided for @commonEdit.
  ///
  /// In tr, this message translates to:
  /// **'Düzenle'**
  String get commonEdit;

  /// No description provided for @commonRename.
  ///
  /// In tr, this message translates to:
  /// **'Yeniden adlandır'**
  String get commonRename;

  /// No description provided for @commonRefresh.
  ///
  /// In tr, this message translates to:
  /// **'Yenile'**
  String get commonRefresh;

  /// No description provided for @commonNewFolder.
  ///
  /// In tr, this message translates to:
  /// **'Yeni klasör'**
  String get commonNewFolder;

  /// No description provided for @commonCopyPath.
  ///
  /// In tr, this message translates to:
  /// **'Yolu kopyala'**
  String get commonCopyPath;

  /// No description provided for @commonMove.
  ///
  /// In tr, this message translates to:
  /// **'Taşı'**
  String get commonMove;

  /// No description provided for @commonMoveEllipsis.
  ///
  /// In tr, this message translates to:
  /// **'Taşı…'**
  String get commonMoveEllipsis;

  /// No description provided for @commonShow.
  ///
  /// In tr, this message translates to:
  /// **'Göster'**
  String get commonShow;

  /// No description provided for @commonChoose.
  ///
  /// In tr, this message translates to:
  /// **'Seç…'**
  String get commonChoose;

  /// No description provided for @commonConnect.
  ///
  /// In tr, this message translates to:
  /// **'Bağlan'**
  String get commonConnect;

  /// No description provided for @commonNew.
  ///
  /// In tr, this message translates to:
  /// **'Yeni'**
  String get commonNew;

  /// No description provided for @commonCopy.
  ///
  /// In tr, this message translates to:
  /// **'Kopyala'**
  String get commonCopy;

  /// No description provided for @commonPaste.
  ///
  /// In tr, this message translates to:
  /// **'Yapıştır'**
  String get commonPaste;

  /// No description provided for @commonLocation.
  ///
  /// In tr, this message translates to:
  /// **'Konum: {path}'**
  String commonLocation(String path);

  /// No description provided for @commonNewName.
  ///
  /// In tr, this message translates to:
  /// **'Yeni ad'**
  String get commonNewName;

  /// No description provided for @commonFolderName.
  ///
  /// In tr, this message translates to:
  /// **'Klasör adı'**
  String get commonFolderName;

  /// No description provided for @setTitle.
  ///
  /// In tr, this message translates to:
  /// **'Ayarlar'**
  String get setTitle;

  /// No description provided for @setAppearance.
  ///
  /// In tr, this message translates to:
  /// **'Görünüm'**
  String get setAppearance;

  /// No description provided for @setTheme.
  ///
  /// In tr, this message translates to:
  /// **'Tema'**
  String get setTheme;

  /// No description provided for @setThemeDark.
  ///
  /// In tr, this message translates to:
  /// **'Gece'**
  String get setThemeDark;

  /// No description provided for @setThemeLight.
  ///
  /// In tr, this message translates to:
  /// **'Gündüz'**
  String get setThemeLight;

  /// No description provided for @setThemeSystem.
  ///
  /// In tr, this message translates to:
  /// **'Sistem tercihi'**
  String get setThemeSystem;

  /// No description provided for @setLanguage.
  ///
  /// In tr, this message translates to:
  /// **'Dil'**
  String get setLanguage;

  /// No description provided for @setLanguageHint.
  ///
  /// In tr, this message translates to:
  /// **'Dil hemen uygulanır.'**
  String get setLanguageHint;

  /// No description provided for @setSaved.
  ///
  /// In tr, this message translates to:
  /// **'Ayarlar kaydedildi'**
  String get setSaved;

  /// No description provided for @mobModules.
  ///
  /// In tr, this message translates to:
  /// **'Modüller'**
  String get mobModules;

  /// No description provided for @mobDisabled.
  ///
  /// In tr, this message translates to:
  /// **'Hesabınızda kapalı'**
  String get mobDisabled;

  /// No description provided for @mobSoon.
  ///
  /// In tr, this message translates to:
  /// **'Bu modül hazırlanıyor'**
  String get mobSoon;

  /// No description provided for @mobOpen.
  ///
  /// In tr, this message translates to:
  /// **'Aç'**
  String get mobOpen;

  /// No description provided for @mobRefresh.
  ///
  /// In tr, this message translates to:
  /// **'Yenile'**
  String get mobRefresh;

  /// No description provided for @mobSettings.
  ///
  /// In tr, this message translates to:
  /// **'Ayarlar'**
  String get mobSettings;

  /// No description provided for @mobWelcome.
  ///
  /// In tr, this message translates to:
  /// **'Hoş geldiniz, {name}'**
  String mobWelcome(String name);

  /// No description provided for @mobNoModules.
  ///
  /// In tr, this message translates to:
  /// **'Modül listesi alınamadı. Bağlantınızı denetleyip yenileyin.'**
  String get mobNoModules;

  /// No description provided for @mobSite.
  ///
  /// In tr, this message translates to:
  /// **'mastertool.download'**
  String get mobSite;

  /// No description provided for @mobLangSystem.
  ///
  /// In tr, this message translates to:
  /// **'Sistem dili'**
  String get mobLangSystem;

  /// No description provided for @mobSsoHint.
  ///
  /// In tr, this message translates to:
  /// **'Bir kez giriş yapmanız yeter: SSH Master, FTP Masters, SQL Master, Notepad Master, Convert Master ve IP Tools bu uygulamanın içinde açılır.'**
  String get mobSsoHint;

  /// No description provided for @mobOpenCount.
  ///
  /// In tr, this message translates to:
  /// **'{open}/{total} modül açık'**
  String mobOpenCount(String open, String total);

  /// No description provided for @mobModulesHint.
  ///
  /// In tr, this message translates to:
  /// **'Tıklayınca açılır'**
  String get mobModulesHint;

  /// No description provided for @mobTapToOpen.
  ///
  /// In tr, this message translates to:
  /// **'Kullanıma hazır'**
  String get mobTapToOpen;

  /// No description provided for @mobVisitSite.
  ///
  /// In tr, this message translates to:
  /// **'Web sitesini ziyaret et'**
  String get mobVisitSite;

  /// No description provided for @smAppSearchPh.
  ///
  /// In tr, this message translates to:
  /// **'Bağlantılarda ara…  (Ctrl+F)'**
  String get smAppSearchPh;

  /// No description provided for @smAppNewConn.
  ///
  /// In tr, this message translates to:
  /// **'Yeni bağlantı'**
  String get smAppNewConn;

  /// No description provided for @smAppSplit.
  ///
  /// In tr, this message translates to:
  /// **'Bölünmüş aç ({n})'**
  String smAppSplit(String n);

  /// No description provided for @smAppSplitTitle.
  ///
  /// In tr, this message translates to:
  /// **'Seçili bağlantıları tek pencerede bölünmüş aç'**
  String get smAppSplitTitle;

  /// No description provided for @smAppSettings.
  ///
  /// In tr, this message translates to:
  /// **'Ayarlar'**
  String get smAppSettings;

  /// No description provided for @smAppStats.
  ///
  /// In tr, this message translates to:
  /// **'{c} bağlantı · {f} klasör'**
  String smAppStats(String c, String f);

  /// No description provided for @smAppWelcome.
  ///
  /// In tr, this message translates to:
  /// **'Hoş geldiniz'**
  String get smAppWelcome;

  /// No description provided for @smAppResults.
  ///
  /// In tr, this message translates to:
  /// **'“{q}” için sonuçlar'**
  String smAppResults(String q);

  /// No description provided for @smAppAll.
  ///
  /// In tr, this message translates to:
  /// **'Tüm bağlantılar'**
  String get smAppAll;

  /// No description provided for @smAppWelcomeHint.
  ///
  /// In tr, this message translates to:
  /// **'İlk SSH bağlantınızı oluşturun.<br>Sunucu bilgilerini girin, test edin ve kaydedin.'**
  String get smAppWelcomeHint;

  /// No description provided for @smAppFolders.
  ///
  /// In tr, this message translates to:
  /// **'Klasörler'**
  String get smAppFolders;

  /// No description provided for @smAppConnections.
  ///
  /// In tr, this message translates to:
  /// **'Bağlantılar'**
  String get smAppConnections;

  /// No description provided for @smAppMultiHint.
  ///
  /// In tr, this message translates to:
  /// **'Ctrl+tık ile birden fazla seçip tek pencerede bölünmüş açabilirsiniz'**
  String get smAppMultiHint;

  /// No description provided for @smAppNoMatch.
  ///
  /// In tr, this message translates to:
  /// **'Eşleşen bağlantı bulunamadı.'**
  String get smAppNoMatch;

  /// No description provided for @smAppFolderCount.
  ///
  /// In tr, this message translates to:
  /// **'{n} bağlantı'**
  String smAppFolderCount(String n);

  /// No description provided for @smAppFolderOpenSplit.
  ///
  /// In tr, this message translates to:
  /// **'Klasördeki bağlantıları bölünmüş aç'**
  String get smAppFolderOpenSplit;

  /// No description provided for @smAppNewConnHere.
  ///
  /// In tr, this message translates to:
  /// **'Bu klasörde yeni bağlantı'**
  String get smAppNewConnHere;

  /// No description provided for @smAppNewSubfolder.
  ///
  /// In tr, this message translates to:
  /// **'Alt klasör oluştur'**
  String get smAppNewSubfolder;

  /// No description provided for @smAppKeyTag.
  ///
  /// In tr, this message translates to:
  /// **'Anahtar'**
  String get smAppKeyTag;

  /// No description provided for @smAppLastDir.
  ///
  /// In tr, this message translates to:
  /// **'Son klasör'**
  String get smAppLastDir;

  /// No description provided for @smAppLastDirTag.
  ///
  /// In tr, this message translates to:
  /// **'son klasör'**
  String get smAppLastDirTag;

  /// No description provided for @smAppMultiOpenSplit.
  ///
  /// In tr, this message translates to:
  /// **'{n} bağlantıyı tek pencerede bölünmüş aç'**
  String smAppMultiOpenSplit(String n);

  /// No description provided for @smAppOpenSeparate.
  ///
  /// In tr, this message translates to:
  /// **'Her birini ayrı pencerede aç'**
  String get smAppOpenSeparate;

  /// No description provided for @smAppClearSelection.
  ///
  /// In tr, this message translates to:
  /// **'Seçimi temizle'**
  String get smAppClearSelection;

  /// No description provided for @smAppSideBySide.
  ///
  /// In tr, this message translates to:
  /// **'Yan yana iki oturum aç'**
  String get smAppSideBySide;

  /// No description provided for @smAppDuplicate.
  ///
  /// In tr, this message translates to:
  /// **'Kopyasını oluştur'**
  String get smAppDuplicate;

  /// No description provided for @smAppMoveToFolder.
  ///
  /// In tr, this message translates to:
  /// **'Klasöre taşı…'**
  String get smAppMoveToFolder;

  /// No description provided for @smAppResetLastDir.
  ///
  /// In tr, this message translates to:
  /// **'Son klasörü sıfırla'**
  String get smAppResetLastDir;

  /// No description provided for @smAppConnMoved.
  ///
  /// In tr, this message translates to:
  /// **'Bağlantı taşındı'**
  String get smAppConnMoved;

  /// No description provided for @smAppFolderIntoSelf.
  ///
  /// In tr, this message translates to:
  /// **'Klasör kendi alt klasörüne taşınamaz'**
  String get smAppFolderIntoSelf;

  /// No description provided for @smAppFolderPh.
  ///
  /// In tr, this message translates to:
  /// **'ör. Üretim sunucuları'**
  String get smAppFolderPh;

  /// No description provided for @smAppRenameFolder.
  ///
  /// In tr, this message translates to:
  /// **'Klasörü yeniden adlandır'**
  String get smAppRenameFolder;

  /// No description provided for @smAppDeleteFolder.
  ///
  /// In tr, this message translates to:
  /// **'Klasörü sil'**
  String get smAppDeleteFolder;

  /// No description provided for @smAppDeleteFolderMsg.
  ///
  /// In tr, this message translates to:
  /// **'<b>{name}</b> klasörü silinecek.'**
  String smAppDeleteFolderMsg(String name);

  /// No description provided for @smAppDeleteFolderConns.
  ///
  /// In tr, this message translates to:
  /// **' İçindeki {n} bağlantı silinmez, bir üst klasöre taşınır.'**
  String smAppDeleteFolderConns(String n);

  /// No description provided for @smAppRootFolder.
  ///
  /// In tr, this message translates to:
  /// **'Tüm bağlantılar (kök)'**
  String get smAppRootFolder;

  /// No description provided for @smAppMoveTitle.
  ///
  /// In tr, this message translates to:
  /// **'“{name}” taşı'**
  String smAppMoveTitle(String name);

  /// No description provided for @smAppTargetFolder.
  ///
  /// In tr, this message translates to:
  /// **'Hedef klasör'**
  String get smAppTargetFolder;

  /// No description provided for @smAppDeleteConn.
  ///
  /// In tr, this message translates to:
  /// **'Bağlantıyı sil'**
  String get smAppDeleteConn;

  /// No description provided for @smAppDeleteConnMsg.
  ///
  /// In tr, this message translates to:
  /// **'<b>{name}</b> ({target}) kalıcı olarak silinecek.'**
  String smAppDeleteConnMsg(String name, String target);

  /// No description provided for @smAppMaxPanes.
  ///
  /// In tr, this message translates to:
  /// **'En fazla 6 bölme açılabilir'**
  String get smAppMaxPanes;

  /// No description provided for @smAppMaxPanesSub.
  ///
  /// In tr, this message translates to:
  /// **'İlk 6 bağlantı açıldı'**
  String get smAppMaxPanesSub;

  /// No description provided for @smFormTitleNew.
  ///
  /// In tr, this message translates to:
  /// **'Yeni SSH bağlantısı'**
  String get smFormTitleNew;

  /// No description provided for @smFormTitleEdit.
  ///
  /// In tr, this message translates to:
  /// **'Bağlantıyı düzenle'**
  String get smFormTitleEdit;

  /// No description provided for @smFormName.
  ///
  /// In tr, this message translates to:
  /// **'Bağlantı adı'**
  String get smFormName;

  /// No description provided for @smFormNamePh.
  ///
  /// In tr, this message translates to:
  /// **'ör. Web sunucusu'**
  String get smFormNamePh;

  /// No description provided for @smFormHost.
  ///
  /// In tr, this message translates to:
  /// **'IP adresi / Sunucu'**
  String get smFormHost;

  /// No description provided for @smFormHostPh.
  ///
  /// In tr, this message translates to:
  /// **'192.168.1.10 veya sunucu.com'**
  String get smFormHostPh;

  /// No description provided for @smFormPort.
  ///
  /// In tr, this message translates to:
  /// **'Port'**
  String get smFormPort;

  /// No description provided for @smFormUser.
  ///
  /// In tr, this message translates to:
  /// **'Kullanıcı adı'**
  String get smFormUser;

  /// No description provided for @smFormAuth.
  ///
  /// In tr, this message translates to:
  /// **'Kimlik doğrulama'**
  String get smFormAuth;

  /// No description provided for @smFormPassword.
  ///
  /// In tr, this message translates to:
  /// **'Şifre'**
  String get smFormPassword;

  /// No description provided for @smFormPrivateKey.
  ///
  /// In tr, this message translates to:
  /// **'Özel anahtar'**
  String get smFormPrivateKey;

  /// No description provided for @smFormPwSaved.
  ///
  /// In tr, this message translates to:
  /// **'•••••••• (kayıtlı — değiştirmek için yazın)'**
  String get smFormPwSaved;

  /// No description provided for @smFormKeyFile.
  ///
  /// In tr, this message translates to:
  /// **'Anahtar dosyası'**
  String get smFormKeyFile;

  /// No description provided for @smFormPassphrase.
  ///
  /// In tr, this message translates to:
  /// **'Anahtar parolası (varsa)'**
  String get smFormPassphrase;

  /// No description provided for @smFormPassSaved.
  ///
  /// In tr, this message translates to:
  /// **'•••••••• (kayıtlı)'**
  String get smFormPassSaved;

  /// No description provided for @smFormPassEmpty.
  ///
  /// In tr, this message translates to:
  /// **'Yoksa boş bırakın'**
  String get smFormPassEmpty;

  /// No description provided for @smFormFolder.
  ///
  /// In tr, this message translates to:
  /// **'Klasör'**
  String get smFormFolder;

  /// No description provided for @smFormColor.
  ///
  /// In tr, this message translates to:
  /// **'Renk'**
  String get smFormColor;

  /// No description provided for @smFormPalette.
  ///
  /// In tr, this message translates to:
  /// **'Konsol renk paleti'**
  String get smFormPalette;

  /// No description provided for @smFormLastDir.
  ///
  /// In tr, this message translates to:
  /// **'Son kaldığım klasöre git'**
  String get smFormLastDir;

  /// No description provided for @smFormLastDirHint.
  ///
  /// In tr, this message translates to:
  /// **'Bağlanınca terminal ve dosya yöneticisi en son çalıştığınız klasörde açılır.'**
  String get smFormLastDirHint;

  /// No description provided for @smFormLastDirNow.
  ///
  /// In tr, this message translates to:
  /// **'Şu an:'**
  String get smFormLastDirNow;

  /// No description provided for @smFormConnecting.
  ///
  /// In tr, this message translates to:
  /// **'Bağlanılıyor…'**
  String get smFormConnecting;

  /// No description provided for @smFormTestOk.
  ///
  /// In tr, this message translates to:
  /// **'Bağlantı başarılı'**
  String get smFormTestOk;

  /// No description provided for @smFormHostKey.
  ///
  /// In tr, this message translates to:
  /// **'Host anahtarı (SHA256): {fp}'**
  String smFormHostKey(String fp);

  /// No description provided for @smFormTestFail.
  ///
  /// In tr, this message translates to:
  /// **'Bağlantı başarısız'**
  String get smFormTestFail;

  /// No description provided for @smFormSaved.
  ///
  /// In tr, this message translates to:
  /// **'Bağlantı kaydedildi'**
  String get smFormSaved;

  /// No description provided for @smFormChangesSaved.
  ///
  /// In tr, this message translates to:
  /// **'Değişiklikler kaydedildi'**
  String get smFormChangesSaved;

  /// No description provided for @smFormTest.
  ///
  /// In tr, this message translates to:
  /// **'Bağlantıyı test et'**
  String get smFormTest;

  /// No description provided for @smFormSaveConnect.
  ///
  /// In tr, this message translates to:
  /// **'Kaydet ve bağlan'**
  String get smFormSaveConnect;

  /// No description provided for @smPaneToggleSidebar.
  ///
  /// In tr, this message translates to:
  /// **'Sol paneli aç/kapat (Ctrl+B)'**
  String get smPaneToggleSidebar;

  /// No description provided for @smPaneDefaultName.
  ///
  /// In tr, this message translates to:
  /// **'Bağlantı'**
  String get smPaneDefaultName;

  /// No description provided for @smPaneSplitRight.
  ///
  /// In tr, this message translates to:
  /// **'Sağa böl'**
  String get smPaneSplitRight;

  /// No description provided for @smPaneSplitDown.
  ///
  /// In tr, this message translates to:
  /// **'Aşağı böl'**
  String get smPaneSplitDown;

  /// No description provided for @smPaneReconnect.
  ///
  /// In tr, this message translates to:
  /// **'Yeniden bağlan'**
  String get smPaneReconnect;

  /// No description provided for @smPaneClose.
  ///
  /// In tr, this message translates to:
  /// **'Bölmeyi kapat'**
  String get smPaneClose;

  /// No description provided for @smPaneSaveSelShortcut.
  ///
  /// In tr, this message translates to:
  /// **'Seçimi kısayol olarak kaydet'**
  String get smPaneSaveSelShortcut;

  /// No description provided for @smPanePaletteMenu.
  ///
  /// In tr, this message translates to:
  /// **'Konsol renk paleti…'**
  String get smPanePaletteMenu;

  /// No description provided for @smPaneSelectAll.
  ///
  /// In tr, this message translates to:
  /// **'Tümünü seç'**
  String get smPaneSelectAll;

  /// No description provided for @smPaneClear.
  ///
  /// In tr, this message translates to:
  /// **'Ekranı temizle'**
  String get smPaneClear;

  /// No description provided for @smPaneStatusConnecting.
  ///
  /// In tr, this message translates to:
  /// **'bağlanılıyor…'**
  String get smPaneStatusConnecting;

  /// No description provided for @smPaneStatusNoConn.
  ///
  /// In tr, this message translates to:
  /// **'bağlantı yok'**
  String get smPaneStatusNoConn;

  /// No description provided for @smPaneStatusClosed.
  ///
  /// In tr, this message translates to:
  /// **'bağlantı kapandı'**
  String get smPaneStatusClosed;

  /// No description provided for @smTermConnecting.
  ///
  /// In tr, this message translates to:
  /// **'Bağlanılıyor…'**
  String get smTermConnecting;

  /// No description provided for @smTermConnectFailed.
  ///
  /// In tr, this message translates to:
  /// **'Bağlantı kurulamadı:'**
  String get smTermConnectFailed;

  /// No description provided for @smTermRetryEnter.
  ///
  /// In tr, this message translates to:
  /// **'Yeniden denemek için Enter\'a basın.'**
  String get smTermRetryEnter;

  /// No description provided for @smTermClosed.
  ///
  /// In tr, this message translates to:
  /// **'Bağlantı kapandı.'**
  String get smTermClosed;

  /// No description provided for @smTermReconnectEnter.
  ///
  /// In tr, this message translates to:
  /// **'Yeniden bağlanmak için Enter\'a basın.'**
  String get smTermReconnectEnter;

  /// No description provided for @smTermMaxPanes.
  ///
  /// In tr, this message translates to:
  /// **'Bir pencerede en fazla {n} bölme açılabilir'**
  String smTermMaxPanes(String n);

  /// No description provided for @smTermSessions.
  ///
  /// In tr, this message translates to:
  /// **'{n} oturum'**
  String smTermSessions(String n);

  /// No description provided for @smTermToggleAll.
  ///
  /// In tr, this message translates to:
  /// **'Tüm sol panelleri aç/kapat'**
  String get smTermToggleAll;

  /// No description provided for @smTermSplitRightTitle.
  ///
  /// In tr, this message translates to:
  /// **'Aktif bölmeyi sağa böl (Ctrl+Shift+E)'**
  String get smTermSplitRightTitle;

  /// No description provided for @smTermSplitDownTitle.
  ///
  /// In tr, this message translates to:
  /// **'Aktif bölmeyi aşağı böl (Ctrl+Shift+O)'**
  String get smTermSplitDownTitle;

  /// No description provided for @smTermSyncOn.
  ///
  /// In tr, this message translates to:
  /// **'Tüm bölmelere yazılıyor'**
  String get smTermSyncOn;

  /// No description provided for @smTermSyncOff.
  ///
  /// In tr, this message translates to:
  /// **'Tüm bölmelere yaz'**
  String get smTermSyncOff;

  /// No description provided for @smTermSyncTitle.
  ///
  /// In tr, this message translates to:
  /// **'Yazdıklarınız tüm bağlı bölmelere gönderilir'**
  String get smTermSyncTitle;

  /// No description provided for @smPickerSearch.
  ///
  /// In tr, this message translates to:
  /// **'Bağlantı ara…'**
  String get smPickerSearch;

  /// No description provided for @smPickerSameServer.
  ///
  /// In tr, this message translates to:
  /// **'aynı sunucu'**
  String get smPickerSameServer;

  /// No description provided for @smPickerNone.
  ///
  /// In tr, this message translates to:
  /// **'Eşleşen bağlantı yok'**
  String get smPickerNone;

  /// No description provided for @smPickerTitleRight.
  ///
  /// In tr, this message translates to:
  /// **'Sağa böl — bağlantı seç'**
  String get smPickerTitleRight;

  /// No description provided for @smPickerTitleDown.
  ///
  /// In tr, this message translates to:
  /// **'Aşağı böl — bağlantı seç'**
  String get smPickerTitleDown;

  /// No description provided for @smPaletteTitle.
  ///
  /// In tr, this message translates to:
  /// **'Konsol renk paleti'**
  String get smPaletteTitle;

  /// No description provided for @smPaletteHint.
  ///
  /// In tr, this message translates to:
  /// **'Seçtiğiniz palet bu bölmede anında önizlenir. Kaydederseniz bu bağlantının ({name}) tüm oturumlarında kullanılır.'**
  String smPaletteHint(String name);

  /// No description provided for @smPaletteSaved.
  ///
  /// In tr, this message translates to:
  /// **'Renk paleti kaydedildi'**
  String get smPaletteSaved;

  /// No description provided for @smScTitleNew.
  ///
  /// In tr, this message translates to:
  /// **'Yeni kısayol'**
  String get smScTitleNew;

  /// No description provided for @smScTitleEdit.
  ///
  /// In tr, this message translates to:
  /// **'Kısayolu düzenle'**
  String get smScTitleEdit;

  /// No description provided for @smScName.
  ///
  /// In tr, this message translates to:
  /// **'Kısayol adı'**
  String get smScName;

  /// No description provided for @smScNamePh.
  ///
  /// In tr, this message translates to:
  /// **'ör. Nginx yeniden başlat'**
  String get smScNamePh;

  /// No description provided for @smScCommand.
  ///
  /// In tr, this message translates to:
  /// **'Komut'**
  String get smScCommand;

  /// No description provided for @smScEnter.
  ///
  /// In tr, this message translates to:
  /// **'Yapıştırdıktan sonra Enter\'a bas'**
  String get smScEnter;

  /// No description provided for @smScEnterHint.
  ///
  /// In tr, this message translates to:
  /// **'Kapalıysa komut sadece imlecin olduğu yere yazılır, siz çalıştırırsınız.'**
  String get smScEnterHint;

  /// No description provided for @smScEmpty.
  ///
  /// In tr, this message translates to:
  /// **'Henüz kısayol yok.<br>Sık kullandığınız komutları <b>+</b> ile ekleyin, çift tıklayarak terminale yapıştırın.'**
  String get smScEmpty;

  /// No description provided for @smScItemTitle.
  ///
  /// In tr, this message translates to:
  /// **'Çift tıkla: bu bölmenin terminaline yapıştır'**
  String get smScItemTitle;

  /// No description provided for @smScAutoEnter.
  ///
  /// In tr, this message translates to:
  /// **'Otomatik Enter'**
  String get smScAutoEnter;

  /// No description provided for @smScPaste.
  ///
  /// In tr, this message translates to:
  /// **'Terminale yapıştır'**
  String get smScPaste;

  /// No description provided for @smScPasteNoEnter.
  ///
  /// In tr, this message translates to:
  /// **'Enter olmadan yapıştır'**
  String get smScPasteNoEnter;

  /// No description provided for @smScPasteRun.
  ///
  /// In tr, this message translates to:
  /// **'Yapıştır ve çalıştır'**
  String get smScPasteRun;

  /// No description provided for @smScCopy.
  ///
  /// In tr, this message translates to:
  /// **'Panoya kopyala'**
  String get smScCopy;

  /// No description provided for @smScNew.
  ///
  /// In tr, this message translates to:
  /// **'Yeni kısayol'**
  String get smScNew;

  /// No description provided for @smSbShortcuts.
  ///
  /// In tr, this message translates to:
  /// **'Kısayollar'**
  String get smSbShortcuts;

  /// No description provided for @smSbAddShortcut.
  ///
  /// In tr, this message translates to:
  /// **'Kısayol ekle'**
  String get smSbAddShortcut;

  /// No description provided for @smSbServer.
  ///
  /// In tr, this message translates to:
  /// **'Sunucu'**
  String get smSbServer;

  /// No description provided for @smSbServerHost.
  ///
  /// In tr, this message translates to:
  /// **'Sunucu · {host}'**
  String smSbServerHost(String host);

  /// No description provided for @smSbFollow.
  ///
  /// In tr, this message translates to:
  /// **'Terminal klasörünü takip et'**
  String get smSbFollow;

  /// No description provided for @smSbHome.
  ///
  /// In tr, this message translates to:
  /// **'Ev klasörü'**
  String get smSbHome;

  /// No description provided for @smSbUp.
  ///
  /// In tr, this message translates to:
  /// **'Üst klasör'**
  String get smSbUp;

  /// No description provided for @smSbComputer.
  ///
  /// In tr, this message translates to:
  /// **'Bilgisayarım'**
  String get smSbComputer;

  /// No description provided for @smSbPlaces.
  ///
  /// In tr, this message translates to:
  /// **'Sürücüler ve konumlar'**
  String get smSbPlaces;

  /// No description provided for @smSbResize.
  ///
  /// In tr, this message translates to:
  /// **'Sürükleyerek genişliği değiştirin'**
  String get smSbResize;

  /// No description provided for @smFmLoading.
  ///
  /// In tr, this message translates to:
  /// **'Yükleniyor…'**
  String get smFmLoading;

  /// No description provided for @smFmOpenFailed.
  ///
  /// In tr, this message translates to:
  /// **'Açılamadı: {msg}'**
  String smFmOpenFailed(String msg);

  /// No description provided for @smFmEmpty.
  ///
  /// In tr, this message translates to:
  /// **'Klasör boş'**
  String get smFmEmpty;

  /// No description provided for @smFmNoConn.
  ///
  /// In tr, this message translates to:
  /// **'Bağlantı yok.'**
  String get smFmNoConn;

  /// No description provided for @smFmClosed.
  ///
  /// In tr, this message translates to:
  /// **'Bağlantı kapandı.'**
  String get smFmClosed;

  /// No description provided for @smFmWaiting.
  ///
  /// In tr, this message translates to:
  /// **'Bağlantı bekleniyor…'**
  String get smFmWaiting;

  /// No description provided for @smFmDownloadTo.
  ///
  /// In tr, this message translates to:
  /// **'İndir → {path}'**
  String smFmDownloadTo(String path);

  /// No description provided for @smFmUploadTo.
  ///
  /// In tr, this message translates to:
  /// **'Yükle → {path}'**
  String smFmUploadTo(String path);

  /// No description provided for @smFmServer.
  ///
  /// In tr, this message translates to:
  /// **'sunucu'**
  String get smFmServer;

  /// No description provided for @smFmCdHere.
  ///
  /// In tr, this message translates to:
  /// **'Terminalde bu klasöre git'**
  String get smFmCdHere;

  /// No description provided for @smFmPastePath.
  ///
  /// In tr, this message translates to:
  /// **'Yolu terminale yapıştır'**
  String get smFmPastePath;

  /// No description provided for @smFmDeleteWhat.
  ///
  /// In tr, this message translates to:
  /// **'Sil ({what})'**
  String smFmDeleteWhat(String what);

  /// No description provided for @smFmNItems.
  ///
  /// In tr, this message translates to:
  /// **'{n} öğe'**
  String smFmNItems(String n);

  /// No description provided for @smFmOpenDefault.
  ///
  /// In tr, this message translates to:
  /// **'Varsayılan uygulamayla aç'**
  String get smFmOpenDefault;

  /// No description provided for @smFmReveal.
  ///
  /// In tr, this message translates to:
  /// **'Gezgin’de göster'**
  String get smFmReveal;

  /// No description provided for @smFmOpenExplorer.
  ///
  /// In tr, this message translates to:
  /// **'Gezgin’de aç'**
  String get smFmOpenExplorer;

  /// No description provided for @smFmFollowing.
  ///
  /// In tr, this message translates to:
  /// **'Dosya yöneticisi terminal klasörünü takip ediyor'**
  String get smFmFollowing;

  /// No description provided for @smFmFollowOff.
  ///
  /// In tr, this message translates to:
  /// **'Takip kapatıldı'**
  String get smFmFollowOff;

  /// No description provided for @smFmNewRemote.
  ///
  /// In tr, this message translates to:
  /// **'Sunucuda yeni klasör'**
  String get smFmNewRemote;

  /// No description provided for @smFmDeleteTitle.
  ///
  /// In tr, this message translates to:
  /// **'Sunucudan sil'**
  String get smFmDeleteTitle;

  /// No description provided for @smFmAndMore.
  ///
  /// In tr, this message translates to:
  /// **' ve {n} öğe daha'**
  String smFmAndMore(String n);

  /// No description provided for @smFmDeleteMsg.
  ///
  /// In tr, this message translates to:
  /// **'{names} sunucudan <b>kalıcı olarak</b> silinecek. Klasörler içerikleriyle birlikte silinir.'**
  String smFmDeleteMsg(String names);

  /// No description provided for @smPlaceDesktop.
  ///
  /// In tr, this message translates to:
  /// **'Masaüstü'**
  String get smPlaceDesktop;

  /// No description provided for @smPlaceDownloads.
  ///
  /// In tr, this message translates to:
  /// **'İndirilenler'**
  String get smPlaceDownloads;

  /// No description provided for @smPlaceDocuments.
  ///
  /// In tr, this message translates to:
  /// **'Belgeler'**
  String get smPlaceDocuments;

  /// No description provided for @smPlaceHome.
  ///
  /// In tr, this message translates to:
  /// **'Kullanıcı klasörü'**
  String get smPlaceHome;

  /// No description provided for @smPlaceDrive.
  ///
  /// In tr, this message translates to:
  /// **'Yerel Disk ({d})'**
  String smPlaceDrive(String d);

  /// No description provided for @smErrNoConn.
  ///
  /// In tr, this message translates to:
  /// **'Bağlantı yok'**
  String get smErrNoConn;

  /// No description provided for @smErrConnectFirst.
  ///
  /// In tr, this message translates to:
  /// **'Önce sunucuya bağlanın'**
  String get smErrConnectFirst;

  /// No description provided for @smErrMkdir.
  ///
  /// In tr, this message translates to:
  /// **'Klasör oluşturulamadı'**
  String get smErrMkdir;

  /// No description provided for @smErrRename.
  ///
  /// In tr, this message translates to:
  /// **'Yeniden adlandırılamadı'**
  String get smErrRename;

  /// No description provided for @smErrDelete.
  ///
  /// In tr, this message translates to:
  /// **'Silinemedi: {name}'**
  String smErrDelete(String name);

  /// No description provided for @smTrPanelTitle.
  ///
  /// In tr, this message translates to:
  /// **'Aktarımlar'**
  String get smTrPanelTitle;

  /// No description provided for @smTrClearDone.
  ///
  /// In tr, this message translates to:
  /// **'Bitenleri temizle'**
  String get smTrClearDone;

  /// No description provided for @smTrQueued.
  ///
  /// In tr, this message translates to:
  /// **'Sırada'**
  String get smTrQueued;

  /// No description provided for @smTrScanning.
  ///
  /// In tr, this message translates to:
  /// **'Dosyalar taranıyor…'**
  String get smTrScanning;

  /// No description provided for @smTrFileCount.
  ///
  /// In tr, this message translates to:
  /// **'{i} / {n} dosya'**
  String smTrFileCount(String i, String n);

  /// No description provided for @smTrEta.
  ///
  /// In tr, this message translates to:
  /// **'~{time} kaldı'**
  String smTrEta(String time);

  /// No description provided for @smTrDownloading.
  ///
  /// In tr, this message translates to:
  /// **'İndiriliyor: {name}'**
  String smTrDownloading(String name);

  /// No description provided for @smTrUploading.
  ///
  /// In tr, this message translates to:
  /// **'Yükleniyor: {name}'**
  String smTrUploading(String name);

  /// No description provided for @smTrDone.
  ///
  /// In tr, this message translates to:
  /// **'Tamamlandı'**
  String get smTrDone;

  /// No description provided for @smTrCancelled.
  ///
  /// In tr, this message translates to:
  /// **'İptal edildi'**
  String get smTrCancelled;

  /// No description provided for @smTrFailed.
  ///
  /// In tr, this message translates to:
  /// **'Başarısız'**
  String get smTrFailed;

  /// No description provided for @smTrRemoveFromList.
  ///
  /// In tr, this message translates to:
  /// **'Listeden kaldır'**
  String get smTrRemoveFromList;

  /// No description provided for @smTrAlwaysBackground.
  ///
  /// In tr, this message translates to:
  /// **'Büyük aktarımları bundan sonra hep arka planda göster'**
  String get smTrAlwaysBackground;

  /// No description provided for @smTrShowInBackground.
  ///
  /// In tr, this message translates to:
  /// **'Arka planda göster'**
  String get smTrShowInBackground;

  /// No description provided for @smTrDownloadDone.
  ///
  /// In tr, this message translates to:
  /// **'İndirme tamamlandı'**
  String get smTrDownloadDone;

  /// No description provided for @smTrUploadDone.
  ///
  /// In tr, this message translates to:
  /// **'Yükleme tamamlandı'**
  String get smTrUploadDone;

  /// No description provided for @smTrDownloadFailed.
  ///
  /// In tr, this message translates to:
  /// **'İndirilemedi: {name}'**
  String smTrDownloadFailed(String name);

  /// No description provided for @smTrUploadFailed.
  ///
  /// In tr, this message translates to:
  /// **'Yüklenemedi: {name}'**
  String smTrUploadFailed(String name);

  /// No description provided for @smTrCancelledToast.
  ///
  /// In tr, this message translates to:
  /// **'Aktarım iptal edildi'**
  String get smTrCancelledToast;

  /// No description provided for @smTimeHm.
  ///
  /// In tr, this message translates to:
  /// **'{h} sa {m} dk'**
  String smTimeHm(String h, String m);

  /// No description provided for @smTimeMs.
  ///
  /// In tr, this message translates to:
  /// **'{m} dk {s} sn'**
  String smTimeMs(String m, String s);

  /// No description provided for @smTimeS.
  ///
  /// In tr, this message translates to:
  /// **'{s} sn'**
  String smTimeS(String s);

  /// No description provided for @smMainErrAuth.
  ///
  /// In tr, this message translates to:
  /// **'Kimlik doğrulama başarısız: kullanıcı adı veya şifre hatalı.'**
  String get smMainErrAuth;

  /// No description provided for @smMainErrRefused.
  ///
  /// In tr, this message translates to:
  /// **'Bağlantı reddedildi: port kapalı veya SSH servisi çalışmıyor.'**
  String get smMainErrRefused;

  /// No description provided for @smMainErrTimeout.
  ///
  /// In tr, this message translates to:
  /// **'Zaman aşımı: sunucuya ulaşılamadı.'**
  String get smMainErrTimeout;

  /// No description provided for @smMainErrDns.
  ///
  /// In tr, this message translates to:
  /// **'Sunucu adı çözümlenemedi (DNS).'**
  String get smMainErrDns;

  /// No description provided for @smMainErrUnreach.
  ///
  /// In tr, this message translates to:
  /// **'Sunucuya ağ üzerinden ulaşılamıyor.'**
  String get smMainErrUnreach;

  /// No description provided for @smMainErrKeyFile.
  ///
  /// In tr, this message translates to:
  /// **'Anahtar dosyası bulunamadı.'**
  String get smMainErrKeyFile;

  /// No description provided for @smMainErrHostKey.
  ///
  /// In tr, this message translates to:
  /// **'Sunucu host anahtarı değişmiş! Kayıtlı: {oldFp}, gelen: {newFp}. Güvenlik nedeniyle bağlantı reddedildi.'**
  String smMainErrHostKey(String newFp, String oldFp);

  /// No description provided for @smMainErrConnNotFound.
  ///
  /// In tr, this message translates to:
  /// **'Bağlantı bulunamadı'**
  String get smMainErrConnNotFound;

  /// No description provided for @smMainErrNoSession.
  ///
  /// In tr, this message translates to:
  /// **'Aktif SSH oturumu yok'**
  String get smMainErrNoSession;

  /// No description provided for @smMainErrHostUser.
  ///
  /// In tr, this message translates to:
  /// **'Sunucu adresi ve kullanıcı adı gerekli.'**
  String get smMainErrHostUser;

  /// No description provided for @smMainTrayShow.
  ///
  /// In tr, this message translates to:
  /// **'SSH Master’ı göster'**
  String get smMainTrayShow;

  /// No description provided for @smMainTrayQuick.
  ///
  /// In tr, this message translates to:
  /// **'Hızlı bağlan'**
  String get smMainTrayQuick;

  /// No description provided for @smMainTrayNone.
  ///
  /// In tr, this message translates to:
  /// **'Kayıtlı bağlantı yok'**
  String get smMainTrayNone;

  /// No description provided for @smMainTrayQuit.
  ///
  /// In tr, this message translates to:
  /// **'Çıkış'**
  String get smMainTrayQuit;

  /// No description provided for @smMainBalloonTitle.
  ///
  /// In tr, this message translates to:
  /// **'SSH Master arka planda çalışıyor'**
  String get smMainBalloonTitle;

  /// No description provided for @smMainBalloonBody.
  ///
  /// In tr, this message translates to:
  /// **'Tekrar açmak için tepsideki simgeye tıklayın.'**
  String get smMainBalloonBody;

  /// No description provided for @smMainPickKey.
  ///
  /// In tr, this message translates to:
  /// **'Özel anahtar dosyası seç'**
  String get smMainPickKey;

  /// No description provided for @smMainCopySuffix.
  ///
  /// In tr, this message translates to:
  /// **' (kopya)'**
  String get smMainCopySuffix;

  /// No description provided for @smMainDefDisk.
  ///
  /// In tr, this message translates to:
  /// **'Disk kullanımı'**
  String get smMainDefDisk;

  /// No description provided for @smMainDefMem.
  ///
  /// In tr, this message translates to:
  /// **'Bellek'**
  String get smMainDefMem;

  /// No description provided for @smMainDefTop.
  ///
  /// In tr, this message translates to:
  /// **'Süreçler (top)'**
  String get smMainDefTop;

  /// No description provided for @smAppNotesLabel.
  ///
  /// In tr, this message translates to:
  /// **'Notlar'**
  String get smAppNotesLabel;
}

class _MtStringsDelegate extends LocalizationsDelegate<MtStrings> {
  const _MtStringsDelegate();

  @override
  Future<MtStrings> load(Locale locale) {
    return SynchronousFuture<MtStrings>(lookupMtStrings(locale));
  }

  @override
  bool isSupported(Locale locale) => <String>[
    'ar',
    'de',
    'en',
    'es',
    'fr',
    'ru',
    'tr',
    'zh',
  ].contains(locale.languageCode);

  @override
  bool shouldReload(_MtStringsDelegate old) => false;
}

MtStrings lookupMtStrings(Locale locale) {
  // Lookup logic when only language code is specified.
  switch (locale.languageCode) {
    case 'ar':
      return MtStringsAr();
    case 'de':
      return MtStringsDe();
    case 'en':
      return MtStringsEn();
    case 'es':
      return MtStringsEs();
    case 'fr':
      return MtStringsFr();
    case 'ru':
      return MtStringsRu();
    case 'tr':
      return MtStringsTr();
    case 'zh':
      return MtStringsZh();
  }

  throw FlutterError(
    'MtStrings.delegate failed to load unsupported locale "$locale". This is likely '
    'an issue with the localizations generation tool. Please file an issue '
    'on GitHub with a reproducible sample app and the gen-l10n configuration '
    'that was used.',
  );
}
