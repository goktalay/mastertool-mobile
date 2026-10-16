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

  /// No description provided for @fmAppSearchPh.
  ///
  /// In tr, this message translates to:
  /// **'Sitelerde ara…  (Ctrl+F)'**
  String get fmAppSearchPh;

  /// No description provided for @fmAppNewConn.
  ///
  /// In tr, this message translates to:
  /// **'Yeni site'**
  String get fmAppNewConn;

  /// No description provided for @fmAppSettings.
  ///
  /// In tr, this message translates to:
  /// **'Ayarlar'**
  String get fmAppSettings;

  /// No description provided for @fmAppStats.
  ///
  /// In tr, this message translates to:
  /// **'{c} site · {f} klasör'**
  String fmAppStats(String c, String f);

  /// No description provided for @fmAppWelcome.
  ///
  /// In tr, this message translates to:
  /// **'Hoş geldiniz'**
  String get fmAppWelcome;

  /// No description provided for @fmAppResults.
  ///
  /// In tr, this message translates to:
  /// **'“{q}” için sonuçlar'**
  String fmAppResults(String q);

  /// No description provided for @fmAppAll.
  ///
  /// In tr, this message translates to:
  /// **'Tüm siteler'**
  String get fmAppAll;

  /// No description provided for @fmAppWelcomeHint.
  ///
  /// In tr, this message translates to:
  /// **'İlk FTP / SFTP sitenizi oluşturun.<br>Sunucu bilgilerini girin, bağlantıyı test edin ve kaydedin.'**
  String get fmAppWelcomeHint;

  /// No description provided for @fmAppFolders.
  ///
  /// In tr, this message translates to:
  /// **'Klasörler'**
  String get fmAppFolders;

  /// No description provided for @fmAppConnections.
  ///
  /// In tr, this message translates to:
  /// **'Siteler'**
  String get fmAppConnections;

  /// No description provided for @fmAppDblHint.
  ///
  /// In tr, this message translates to:
  /// **'Bağlanmak için karta çift tıklayın'**
  String get fmAppDblHint;

  /// No description provided for @fmAppNoMatch.
  ///
  /// In tr, this message translates to:
  /// **'Eşleşen site bulunamadı.'**
  String get fmAppNoMatch;

  /// No description provided for @fmAppFolderCount.
  ///
  /// In tr, this message translates to:
  /// **'{n} site'**
  String fmAppFolderCount(String n);

  /// No description provided for @fmAppNewConnHere.
  ///
  /// In tr, this message translates to:
  /// **'Bu klasörde yeni site'**
  String get fmAppNewConnHere;

  /// No description provided for @fmAppNewSubfolder.
  ///
  /// In tr, this message translates to:
  /// **'Alt klasör oluştur'**
  String get fmAppNewSubfolder;

  /// No description provided for @fmAppKeyTag.
  ///
  /// In tr, this message translates to:
  /// **'Anahtar'**
  String get fmAppKeyTag;

  /// No description provided for @fmAppLastDir.
  ///
  /// In tr, this message translates to:
  /// **'Son klasör'**
  String get fmAppLastDir;

  /// No description provided for @fmAppLastDirTag.
  ///
  /// In tr, this message translates to:
  /// **'son klasör'**
  String get fmAppLastDirTag;

  /// No description provided for @fmAppDuplicate.
  ///
  /// In tr, this message translates to:
  /// **'Kopyasını oluştur'**
  String get fmAppDuplicate;

  /// No description provided for @fmAppMoveToFolder.
  ///
  /// In tr, this message translates to:
  /// **'Klasöre taşı…'**
  String get fmAppMoveToFolder;

  /// No description provided for @fmAppResetLastDir.
  ///
  /// In tr, this message translates to:
  /// **'Son klasörü sıfırla'**
  String get fmAppResetLastDir;

  /// No description provided for @fmAppConnMoved.
  ///
  /// In tr, this message translates to:
  /// **'Site taşındı'**
  String get fmAppConnMoved;

  /// No description provided for @fmAppFolderIntoSelf.
  ///
  /// In tr, this message translates to:
  /// **'Klasör kendi içine taşınamaz'**
  String get fmAppFolderIntoSelf;

  /// No description provided for @fmAppFolderPh.
  ///
  /// In tr, this message translates to:
  /// **'Örn. Müşteriler'**
  String get fmAppFolderPh;

  /// No description provided for @fmAppRenameFolder.
  ///
  /// In tr, this message translates to:
  /// **'Klasörü yeniden adlandır'**
  String get fmAppRenameFolder;

  /// No description provided for @fmAppDeleteFolder.
  ///
  /// In tr, this message translates to:
  /// **'Klasörü sil'**
  String get fmAppDeleteFolder;

  /// No description provided for @fmAppDeleteFolderMsg.
  ///
  /// In tr, this message translates to:
  /// **'<b>{name}</b> klasörü silinsin mi?'**
  String fmAppDeleteFolderMsg(String name);

  /// No description provided for @fmAppDeleteFolderConns.
  ///
  /// In tr, this message translates to:
  /// **'<br>İçindeki {n} site üst klasöre taşınacak.'**
  String fmAppDeleteFolderConns(String n);

  /// No description provided for @fmAppRootFolder.
  ///
  /// In tr, this message translates to:
  /// **'Ana dizin (klasörsüz)'**
  String get fmAppRootFolder;

  /// No description provided for @fmAppMoveTitle.
  ///
  /// In tr, this message translates to:
  /// **'“{name}” taşı'**
  String fmAppMoveTitle(String name);

  /// No description provided for @fmAppTargetFolder.
  ///
  /// In tr, this message translates to:
  /// **'Hedef klasör'**
  String get fmAppTargetFolder;

  /// No description provided for @fmAppDeleteConn.
  ///
  /// In tr, this message translates to:
  /// **'Siteyi sil'**
  String get fmAppDeleteConn;

  /// No description provided for @fmAppDeleteConnMsg.
  ///
  /// In tr, this message translates to:
  /// **'<b>{name}</b> ({target}) sitesi silinsin mi?'**
  String fmAppDeleteConnMsg(String name, String target);

  /// No description provided for @fmFormTitleNew.
  ///
  /// In tr, this message translates to:
  /// **'Yeni site'**
  String get fmFormTitleNew;

  /// No description provided for @fmFormTitleEdit.
  ///
  /// In tr, this message translates to:
  /// **'Site özellikleri: {name}'**
  String fmFormTitleEdit(String name);

  /// No description provided for @fmFormTabGeneral.
  ///
  /// In tr, this message translates to:
  /// **'Genel'**
  String get fmFormTabGeneral;

  /// No description provided for @fmFormTabActions.
  ///
  /// In tr, this message translates to:
  /// **'Eylemler'**
  String get fmFormTabActions;

  /// No description provided for @fmFormTabType.
  ///
  /// In tr, this message translates to:
  /// **'Tür'**
  String get fmFormTabType;

  /// No description provided for @fmFormTabOptions.
  ///
  /// In tr, this message translates to:
  /// **'Seçenekler'**
  String get fmFormTabOptions;

  /// No description provided for @fmFormName.
  ///
  /// In tr, this message translates to:
  /// **'Etiket (görünen ad)'**
  String get fmFormName;

  /// No description provided for @fmFormNamePh.
  ///
  /// In tr, this message translates to:
  /// **'Örn. Şirket web sitesi'**
  String get fmFormNamePh;

  /// No description provided for @fmFormHost.
  ///
  /// In tr, this message translates to:
  /// **'Sunucu adresi'**
  String get fmFormHost;

  /// No description provided for @fmFormHostPh.
  ///
  /// In tr, this message translates to:
  /// **'ftp.ornek.com veya 192.168.1.10'**
  String get fmFormHostPh;

  /// No description provided for @fmFormPort.
  ///
  /// In tr, this message translates to:
  /// **'Port'**
  String get fmFormPort;

  /// No description provided for @fmFormUser.
  ///
  /// In tr, this message translates to:
  /// **'Kullanıcı adı'**
  String get fmFormUser;

  /// No description provided for @fmFormPassword.
  ///
  /// In tr, this message translates to:
  /// **'Şifre'**
  String get fmFormPassword;

  /// No description provided for @fmFormPwSaved.
  ///
  /// In tr, this message translates to:
  /// **'•••••••• (kayıtlı, değiştirmek için yazın)'**
  String get fmFormPwSaved;

  /// No description provided for @fmFormLoginMethod.
  ///
  /// In tr, this message translates to:
  /// **'Giriş yöntemi'**
  String get fmFormLoginMethod;

  /// No description provided for @fmFormLoginNormal.
  ///
  /// In tr, this message translates to:
  /// **'Normal'**
  String get fmFormLoginNormal;

  /// No description provided for @fmFormLoginAnon.
  ///
  /// In tr, this message translates to:
  /// **'Anonim'**
  String get fmFormLoginAnon;

  /// No description provided for @fmFormAuth.
  ///
  /// In tr, this message translates to:
  /// **'SFTP kimlik doğrulama'**
  String get fmFormAuth;

  /// No description provided for @fmFormPrivateKey.
  ///
  /// In tr, this message translates to:
  /// **'Özel anahtar'**
  String get fmFormPrivateKey;

  /// No description provided for @fmFormKeyFile.
  ///
  /// In tr, this message translates to:
  /// **'Özel anahtar dosyası'**
  String get fmFormKeyFile;

  /// No description provided for @fmFormPassphrase.
  ///
  /// In tr, this message translates to:
  /// **'Anahtar parolası'**
  String get fmFormPassphrase;

  /// No description provided for @fmFormPassSaved.
  ///
  /// In tr, this message translates to:
  /// **'(kayıtlı)'**
  String get fmFormPassSaved;

  /// No description provided for @fmFormPassEmpty.
  ///
  /// In tr, this message translates to:
  /// **'Yoksa boş bırakın'**
  String get fmFormPassEmpty;

  /// No description provided for @fmFormFolder.
  ///
  /// In tr, this message translates to:
  /// **'Klasör'**
  String get fmFormFolder;

  /// No description provided for @fmFormColor.
  ///
  /// In tr, this message translates to:
  /// **'Renk'**
  String get fmFormColor;

  /// No description provided for @fmFormComments.
  ///
  /// In tr, this message translates to:
  /// **'Notlar'**
  String get fmFormComments;

  /// No description provided for @fmFormRemoteDir.
  ///
  /// In tr, this message translates to:
  /// **'Bağlanınca bu uzak klasöre geç'**
  String get fmFormRemoteDir;

  /// No description provided for @fmFormLocalDir.
  ///
  /// In tr, this message translates to:
  /// **'Bağlanınca bu yerel klasöre geç'**
  String get fmFormLocalDir;

  /// No description provided for @fmFormLocalDirPh.
  ///
  /// In tr, this message translates to:
  /// **'Örn. C:\\Projeler\\site'**
  String get fmFormLocalDirPh;

  /// No description provided for @fmFormLastDir.
  ///
  /// In tr, this message translates to:
  /// **'Son kaldığım klasöre git'**
  String get fmFormLastDir;

  /// No description provided for @fmFormLastDirHint.
  ///
  /// In tr, this message translates to:
  /// **'Açıkken site, en son çalıştığınız sunucu ve bilgisayar klasörleriyle açılır (yukarıdaki klasörlerin yerine).'**
  String get fmFormLastDirHint;

  /// No description provided for @fmFormLastDirNow.
  ///
  /// In tr, this message translates to:
  /// **'Şu an:'**
  String get fmFormLastDirNow;

  /// No description provided for @fmFormCache.
  ///
  /// In tr, this message translates to:
  /// **'Gezinmede önbellek kullanımı'**
  String get fmFormCache;

  /// No description provided for @fmFormCacheSession.
  ///
  /// In tr, this message translates to:
  /// **'Oturum boyunca önbellek kullan'**
  String get fmFormCacheSession;

  /// No description provided for @fmFormCacheAlways.
  ///
  /// In tr, this message translates to:
  /// **'Her zaman önbellek kullan (uygulama açık kaldıkça)'**
  String get fmFormCacheAlways;

  /// No description provided for @fmFormCacheNever.
  ///
  /// In tr, this message translates to:
  /// **'Önbellek kullanma (her seferinde yeniden listele)'**
  String get fmFormCacheNever;

  /// No description provided for @fmFormUploadCase.
  ///
  /// In tr, this message translates to:
  /// **'Yüklerken dosya ve klasör adlarına uygulanacak kural'**
  String get fmFormUploadCase;

  /// No description provided for @fmFormCasePreserve.
  ///
  /// In tr, this message translates to:
  /// **'Büyük/küçük harfi koru'**
  String get fmFormCasePreserve;

  /// No description provided for @fmFormCaseLower.
  ///
  /// In tr, this message translates to:
  /// **'Küçük harfe çevir'**
  String get fmFormCaseLower;

  /// No description provided for @fmFormCaseUpper.
  ///
  /// In tr, this message translates to:
  /// **'Büyük harfe çevir'**
  String get fmFormCaseUpper;

  /// No description provided for @fmFormTest.
  ///
  /// In tr, this message translates to:
  /// **'Bağlantıyı dene'**
  String get fmFormTest;

  /// No description provided for @fmFormSaveConnect.
  ///
  /// In tr, this message translates to:
  /// **'Kaydet ve bağlan'**
  String get fmFormSaveConnect;

  /// No description provided for @fmFormConnecting.
  ///
  /// In tr, this message translates to:
  /// **'Bağlanılıyor…'**
  String get fmFormConnecting;

  /// No description provided for @fmFormTestOk.
  ///
  /// In tr, this message translates to:
  /// **'Bağlantı başarılı'**
  String get fmFormTestOk;

  /// No description provided for @fmFormTestFail.
  ///
  /// In tr, this message translates to:
  /// **'Bağlantı kurulamadı'**
  String get fmFormTestFail;

  /// No description provided for @fmFormHomeDir.
  ///
  /// In tr, this message translates to:
  /// **'Başlangıç klasörü: {dir}'**
  String fmFormHomeDir(String dir);

  /// No description provided for @fmFormRemoteDirMissing.
  ///
  /// In tr, this message translates to:
  /// **'Uyarı: belirtilen uzak klasör açılamadı.'**
  String get fmFormRemoteDirMissing;

  /// No description provided for @fmFormHostKey.
  ///
  /// In tr, this message translates to:
  /// **'SSH host anahtarı (SHA256): {fp}'**
  String fmFormHostKey(String fp);

  /// No description provided for @fmFormSaved.
  ///
  /// In tr, this message translates to:
  /// **'Site kaydedildi'**
  String get fmFormSaved;

  /// No description provided for @fmFormChangesSaved.
  ///
  /// In tr, this message translates to:
  /// **'Değişiklikler kaydedildi'**
  String get fmFormChangesSaved;

  /// No description provided for @fmTypeProtocol.
  ///
  /// In tr, this message translates to:
  /// **'Protokol'**
  String get fmTypeProtocol;

  /// No description provided for @fmTypeFtp.
  ///
  /// In tr, this message translates to:
  /// **'FTP (standart dosya aktarım protokolü)'**
  String get fmTypeFtp;

  /// No description provided for @fmTypeFtpsImplicit.
  ///
  /// In tr, this message translates to:
  /// **'FTP — TLS/SSL (Implicit, port 990)'**
  String get fmTypeFtpsImplicit;

  /// No description provided for @fmTypeFtpsSsl.
  ///
  /// In tr, this message translates to:
  /// **'FTP — SSL (AUTH SSL, Explicit)'**
  String get fmTypeFtpsSsl;

  /// No description provided for @fmTypeFtpsTls.
  ///
  /// In tr, this message translates to:
  /// **'FTP — TLS/SSL (AUTH TLS, Explicit)'**
  String get fmTypeFtpsTls;

  /// No description provided for @fmTypeSftp.
  ///
  /// In tr, this message translates to:
  /// **'SFTP — SSH2 (Güvenli Kabuk)'**
  String get fmTypeSftp;

  /// No description provided for @fmTypeNoteFtp.
  ///
  /// In tr, this message translates to:
  /// **'Komut ve veri bağlantıları için standart FTP kullanılır; şifre ve dosyalar şifrelenmeden (düz metin) gönderilir.'**
  String get fmTypeNoteFtp;

  /// No description provided for @fmTypeNoteFtpsImplicit.
  ///
  /// In tr, this message translates to:
  /// **'Bağlantı en baştan TLS/SSL ile şifrelenir (genellikle port 990). Komutlar ve veriler korunur.'**
  String get fmTypeNoteFtpsImplicit;

  /// No description provided for @fmTypeNoteFtpsSsl.
  ///
  /// In tr, this message translates to:
  /// **'Düz FTP ile bağlanıp AUTH SSL komutuyla şifreli oturuma geçilir. Komutlar ve veriler korunur.'**
  String get fmTypeNoteFtpsSsl;

  /// No description provided for @fmTypeNoteFtpsTls.
  ///
  /// In tr, this message translates to:
  /// **'Düz FTP ile bağlanıp AUTH TLS komutuyla şifreli oturuma geçilir (en yaygın FTPS türü).'**
  String get fmTypeNoteFtpsTls;

  /// No description provided for @fmTypeNoteSftp.
  ///
  /// In tr, this message translates to:
  /// **'SSH üzerinden şifreli dosya aktarımı (port 22). Şifre veya özel anahtarla giriş yapılır; sunucu host anahtarı ilk bağlantıda kaydedilir.'**
  String get fmTypeNoteSftp;

  /// No description provided for @fmTypeTransferType.
  ///
  /// In tr, this message translates to:
  /// **'Aktarım türü'**
  String get fmTypeTransferType;

  /// No description provided for @fmTypeBinary.
  ///
  /// In tr, this message translates to:
  /// **'İkili (Binary)'**
  String get fmTypeBinary;

  /// No description provided for @fmTypeAscii.
  ///
  /// In tr, this message translates to:
  /// **'ASCII (metin)'**
  String get fmTypeAscii;

  /// No description provided for @fmTypeAuto.
  ///
  /// In tr, this message translates to:
  /// **'Otomatik (metin dosyaları ASCII)'**
  String get fmTypeAuto;

  /// No description provided for @fmTypeUseGlobal.
  ///
  /// In tr, this message translates to:
  /// **'Genel ayarı kullan ({v})'**
  String fmTypeUseGlobal(String v);

  /// No description provided for @fmTypeDataConn.
  ///
  /// In tr, this message translates to:
  /// **'Veri bağlantısı'**
  String get fmTypeDataConn;

  /// No description provided for @fmTypePassive.
  ///
  /// In tr, this message translates to:
  /// **'Pasif (PASV / EPSV)'**
  String get fmTypePassive;

  /// No description provided for @fmTypeTimezone.
  ///
  /// In tr, this message translates to:
  /// **'Sunucu saat dilimi farkı'**
  String get fmTypeTimezone;

  /// No description provided for @fmTypeTzNone.
  ///
  /// In tr, this message translates to:
  /// **'Fark yok'**
  String get fmTypeTzNone;

  /// No description provided for @fmTypeTzHours.
  ///
  /// In tr, this message translates to:
  /// **'saat'**
  String get fmTypeTzHours;

  /// No description provided for @fmTypeTimezoneHint.
  ///
  /// In tr, this message translates to:
  /// **'Sunucunun listelediği dosya saatleri bu kadar kaydırılarak gösterilir.'**
  String get fmTypeTimezoneHint;

  /// No description provided for @fmOptSiteOptions.
  ///
  /// In tr, this message translates to:
  /// **'Siteye özel ayarlar'**
  String get fmOptSiteOptions;

  /// No description provided for @fmOptUseGlobal.
  ///
  /// In tr, this message translates to:
  /// **'Tüm seçenekler için genel ayarları kullan'**
  String get fmOptUseGlobal;

  /// No description provided for @fmOptCustom.
  ///
  /// In tr, this message translates to:
  /// **'Bu siteye özel ayarlar kullan'**
  String get fmOptCustom;

  /// No description provided for @fmOptRetry.
  ///
  /// In tr, this message translates to:
  /// **'Tekrar deneme sayısı'**
  String get fmOptRetry;

  /// No description provided for @fmOptRetryDelay.
  ///
  /// In tr, this message translates to:
  /// **'Denemeler arası bekleme (sn)'**
  String get fmOptRetryDelay;

  /// No description provided for @fmOptMaxConcurrent.
  ///
  /// In tr, this message translates to:
  /// **'Aynı anda en fazla aktarım'**
  String get fmOptMaxConcurrent;

  /// No description provided for @fmOptConflict.
  ///
  /// In tr, this message translates to:
  /// **'Hedefte aynı adlı dosya varsa'**
  String get fmOptConflict;

  /// No description provided for @fmOptConflictOverwrite.
  ///
  /// In tr, this message translates to:
  /// **'Üzerine yaz'**
  String get fmOptConflictOverwrite;

  /// No description provided for @fmOptConflictRename.
  ///
  /// In tr, this message translates to:
  /// **'Otomatik yeniden adlandır (ad (1).uzantı)'**
  String get fmOptConflictRename;

  /// No description provided for @fmOptConflictSkip.
  ///
  /// In tr, this message translates to:
  /// **'Atla'**
  String get fmOptConflictSkip;

  /// No description provided for @fmOptEncoding.
  ///
  /// In tr, this message translates to:
  /// **'Dosya adı kodlaması'**
  String get fmOptEncoding;

  /// No description provided for @fmOptEncAuto.
  ///
  /// In tr, this message translates to:
  /// **'Otomatik'**
  String get fmOptEncAuto;

  /// No description provided for @fmSiteLocal.
  ///
  /// In tr, this message translates to:
  /// **'Bilgisayarım'**
  String get fmSiteLocal;

  /// No description provided for @fmSiteRemote.
  ///
  /// In tr, this message translates to:
  /// **'Sunucu'**
  String get fmSiteRemote;

  /// No description provided for @fmSiteTransfers.
  ///
  /// In tr, this message translates to:
  /// **'Aktarımlar'**
  String get fmSiteTransfers;

  /// No description provided for @fmSiteToggleLocal.
  ///
  /// In tr, this message translates to:
  /// **'Bilgisayarım panelini aç/kapat (Ctrl+B)'**
  String get fmSiteToggleLocal;

  /// No description provided for @fmSiteToggleTransfers.
  ///
  /// In tr, this message translates to:
  /// **'Aktarımlar panelini aç/kapat (Ctrl+J)'**
  String get fmSiteToggleTransfers;

  /// No description provided for @fmSiteReconnect.
  ///
  /// In tr, this message translates to:
  /// **'Yeniden bağlan'**
  String get fmSiteReconnect;

  /// No description provided for @fmSitePlaces.
  ///
  /// In tr, this message translates to:
  /// **'Hızlı erişim ve sürücüler'**
  String get fmSitePlaces;

  /// No description provided for @fmSiteUp.
  ///
  /// In tr, this message translates to:
  /// **'Üst klasör (Backspace)'**
  String get fmSiteUp;

  /// No description provided for @fmSiteHome.
  ///
  /// In tr, this message translates to:
  /// **'Başlangıç klasörü'**
  String get fmSiteHome;

  /// No description provided for @fmSiteColName.
  ///
  /// In tr, this message translates to:
  /// **'Ad'**
  String get fmSiteColName;

  /// No description provided for @fmSiteColSize.
  ///
  /// In tr, this message translates to:
  /// **'Boyut'**
  String get fmSiteColSize;

  /// No description provided for @fmSiteColDate.
  ///
  /// In tr, this message translates to:
  /// **'Değiştirilme'**
  String get fmSiteColDate;

  /// No description provided for @fmSiteLoading.
  ///
  /// In tr, this message translates to:
  /// **'Yükleniyor…'**
  String get fmSiteLoading;

  /// No description provided for @fmSiteEmptyDir.
  ///
  /// In tr, this message translates to:
  /// **'Bu klasör boş'**
  String get fmSiteEmptyDir;

  /// No description provided for @fmSiteDesktop.
  ///
  /// In tr, this message translates to:
  /// **'Masaüstü'**
  String get fmSiteDesktop;

  /// No description provided for @fmSiteDownloads.
  ///
  /// In tr, this message translates to:
  /// **'İndirilenler'**
  String get fmSiteDownloads;

  /// No description provided for @fmSiteDocuments.
  ///
  /// In tr, this message translates to:
  /// **'Belgeler'**
  String get fmSiteDocuments;

  /// No description provided for @fmSiteHomeDir.
  ///
  /// In tr, this message translates to:
  /// **'Kullanıcı klasörü'**
  String get fmSiteHomeDir;

  /// No description provided for @fmSiteOpenExplorer.
  ///
  /// In tr, this message translates to:
  /// **'Gezgin\'de aç'**
  String get fmSiteOpenExplorer;

  /// No description provided for @fmSiteOpenFile.
  ///
  /// In tr, this message translates to:
  /// **'Varsayılan uygulamayla aç'**
  String get fmSiteOpenFile;

  /// No description provided for @fmSiteShowExplorer.
  ///
  /// In tr, this message translates to:
  /// **'Gezgin\'de göster'**
  String get fmSiteShowExplorer;

  /// No description provided for @fmSiteUpload.
  ///
  /// In tr, this message translates to:
  /// **'Yükle (Upload)'**
  String get fmSiteUpload;

  /// No description provided for @fmSiteUploadN.
  ///
  /// In tr, this message translates to:
  /// **'{n} öğeyi yükle (Upload)'**
  String fmSiteUploadN(String n);

  /// No description provided for @fmSiteUploadTo.
  ///
  /// In tr, this message translates to:
  /// **'Hedef: {dir}'**
  String fmSiteUploadTo(String dir);

  /// No description provided for @fmSiteDownload.
  ///
  /// In tr, this message translates to:
  /// **'İndir (Download)'**
  String get fmSiteDownload;

  /// No description provided for @fmSiteDownloadN.
  ///
  /// In tr, this message translates to:
  /// **'{n} öğeyi indir (Download)'**
  String fmSiteDownloadN(String n);

  /// No description provided for @fmSiteDownloadTo.
  ///
  /// In tr, this message translates to:
  /// **'Hedef: {dir}'**
  String fmSiteDownloadTo(String dir);

  /// No description provided for @fmSiteTrash.
  ///
  /// In tr, this message translates to:
  /// **'Geri Dönüşüm Kutusu\'na taşı'**
  String get fmSiteTrash;

  /// No description provided for @fmSiteTrashOk.
  ///
  /// In tr, this message translates to:
  /// **'Taşı'**
  String get fmSiteTrashOk;

  /// No description provided for @fmSiteTrashOne.
  ///
  /// In tr, this message translates to:
  /// **'<b>{name}</b> Geri Dönüşüm Kutusu\'na taşınsın mı?'**
  String fmSiteTrashOne(String name);

  /// No description provided for @fmSiteTrashMany.
  ///
  /// In tr, this message translates to:
  /// **'{n} öğe Geri Dönüşüm Kutusu\'na taşınsın mı?'**
  String fmSiteTrashMany(String n);

  /// No description provided for @fmSiteMkdirFail.
  ///
  /// In tr, this message translates to:
  /// **'Klasör oluşturulamadı'**
  String get fmSiteMkdirFail;

  /// No description provided for @fmSiteRenameFail.
  ///
  /// In tr, this message translates to:
  /// **'Yeniden adlandırılamadı'**
  String get fmSiteRenameFail;

  /// No description provided for @fmSiteDeleteFail.
  ///
  /// In tr, this message translates to:
  /// **'Silinemedi'**
  String get fmSiteDeleteFail;

  /// No description provided for @fmSiteDeleteTitle.
  ///
  /// In tr, this message translates to:
  /// **'Sunucudan sil'**
  String get fmSiteDeleteTitle;

  /// No description provided for @fmSiteDelOne.
  ///
  /// In tr, this message translates to:
  /// **'<b>{name}</b> dosyası sunucudan kalıcı olarak silinsin mi?'**
  String fmSiteDelOne(String name);

  /// No description provided for @fmSiteDelDirOne.
  ///
  /// In tr, this message translates to:
  /// **'<b>{name}</b> klasörü ve tüm içeriği sunucudan kalıcı olarak silinsin mi?'**
  String fmSiteDelDirOne(String name);

  /// No description provided for @fmSiteDelMany.
  ///
  /// In tr, this message translates to:
  /// **'{n} öğe (klasörler tüm içerikleriyle) sunucudan kalıcı olarak silinsin mi?'**
  String fmSiteDelMany(String n);

  /// No description provided for @fmSiteDeleting.
  ///
  /// In tr, this message translates to:
  /// **'Siliniyor…'**
  String get fmSiteDeleting;

  /// No description provided for @fmSiteDeleted.
  ///
  /// In tr, this message translates to:
  /// **'Silindi'**
  String get fmSiteDeleted;

  /// No description provided for @fmSiteItems.
  ///
  /// In tr, this message translates to:
  /// **'{n} öğe'**
  String fmSiteItems(String n);

  /// No description provided for @fmSiteOffline.
  ///
  /// In tr, this message translates to:
  /// **'Bağlı değil'**
  String get fmSiteOffline;

  /// No description provided for @fmSiteLimit.
  ///
  /// In tr, this message translates to:
  /// **'Hız sınırı: {v}'**
  String fmSiteLimit(String v);

  /// No description provided for @fmSiteNoLimit.
  ///
  /// In tr, this message translates to:
  /// **'Hız sınırı yok'**
  String get fmSiteNoLimit;

  /// No description provided for @fmSiteLimitTitle.
  ///
  /// In tr, this message translates to:
  /// **'Hız sınırını ayarla'**
  String get fmSiteLimitTitle;

  /// No description provided for @fmSiteConnectFail.
  ///
  /// In tr, this message translates to:
  /// **'Sunucuya bağlanılamadı: {msg}'**
  String fmSiteConnectFail(String msg);

  /// No description provided for @fmSiteConnectFailTitle.
  ///
  /// In tr, this message translates to:
  /// **'Bağlantı kurulamadı'**
  String get fmSiteConnectFailTitle;

  /// No description provided for @fmSiteStateConnected.
  ///
  /// In tr, this message translates to:
  /// **'Bağlı'**
  String get fmSiteStateConnected;

  /// No description provided for @fmSiteStateConnecting.
  ///
  /// In tr, this message translates to:
  /// **'Bağlanılıyor…'**
  String get fmSiteStateConnecting;

  /// No description provided for @fmSiteStateDisconnected.
  ///
  /// In tr, this message translates to:
  /// **'Bağlantı yok'**
  String get fmSiteStateDisconnected;

  /// No description provided for @fmTrColName.
  ///
  /// In tr, this message translates to:
  /// **'Ad'**
  String get fmTrColName;

  /// No description provided for @fmTrColSize.
  ///
  /// In tr, this message translates to:
  /// **'Boyut'**
  String get fmTrColSize;

  /// No description provided for @fmTrColProgress.
  ///
  /// In tr, this message translates to:
  /// **'İlerleme'**
  String get fmTrColProgress;

  /// No description provided for @fmTrColStatus.
  ///
  /// In tr, this message translates to:
  /// **'Durum'**
  String get fmTrColStatus;

  /// No description provided for @fmTrEmpty.
  ///
  /// In tr, this message translates to:
  /// **'Henüz aktarım yok.\nBir dosyaya veya klasöre sağ tıklayıp İndir / Yükle seçin ya da paneller arasında sürükleyin.'**
  String get fmTrEmpty;

  /// No description provided for @fmTrQueued.
  ///
  /// In tr, this message translates to:
  /// **'Sırada'**
  String get fmTrQueued;

  /// No description provided for @fmTrActive.
  ///
  /// In tr, this message translates to:
  /// **'Aktarılıyor'**
  String get fmTrActive;

  /// No description provided for @fmTrDone.
  ///
  /// In tr, this message translates to:
  /// **'Tamamlandı'**
  String get fmTrDone;

  /// No description provided for @fmTrDoneFiles.
  ///
  /// In tr, this message translates to:
  /// **'{n} dosya tamam'**
  String fmTrDoneFiles(String n);

  /// No description provided for @fmTrError.
  ///
  /// In tr, this message translates to:
  /// **'Hata'**
  String get fmTrError;

  /// No description provided for @fmTrCancelled.
  ///
  /// In tr, this message translates to:
  /// **'İptal edildi'**
  String get fmTrCancelled;

  /// No description provided for @fmTrSkipped.
  ///
  /// In tr, this message translates to:
  /// **'Atlandı (mevcut)'**
  String get fmTrSkipped;

  /// No description provided for @fmTrScanning.
  ///
  /// In tr, this message translates to:
  /// **'Taranıyor… {n} dosya'**
  String fmTrScanning(String n);

  /// No description provided for @fmTrRetrying.
  ///
  /// In tr, this message translates to:
  /// **'Tekrar denenecek…'**
  String get fmTrRetrying;

  /// No description provided for @fmTrCancel.
  ///
  /// In tr, this message translates to:
  /// **'İptal et'**
  String get fmTrCancel;

  /// No description provided for @fmTrCancelDir.
  ///
  /// In tr, this message translates to:
  /// **'Klasör aktarımını iptal et'**
  String get fmTrCancelDir;

  /// No description provided for @fmTrCancelAll.
  ///
  /// In tr, this message translates to:
  /// **'Tüm aktarımları iptal et'**
  String get fmTrCancelAll;

  /// No description provided for @fmTrCancelAllMsg.
  ///
  /// In tr, this message translates to:
  /// **'Süren ve sıradaki tüm aktarımlar iptal edilsin mi?'**
  String get fmTrCancelAllMsg;

  /// No description provided for @fmTrCancelAllOk.
  ///
  /// In tr, this message translates to:
  /// **'Tümünü iptal et'**
  String get fmTrCancelAllOk;

  /// No description provided for @fmTrRetry.
  ///
  /// In tr, this message translates to:
  /// **'Yeniden dene'**
  String get fmTrRetry;

  /// No description provided for @fmTrShowLocal.
  ///
  /// In tr, this message translates to:
  /// **'Gezgin\'de göster'**
  String get fmTrShowLocal;

  /// No description provided for @fmTrShowRemote.
  ///
  /// In tr, this message translates to:
  /// **'Sunucuda göster'**
  String get fmTrShowRemote;

  /// No description provided for @fmTrCopyError.
  ///
  /// In tr, this message translates to:
  /// **'Hata mesajını kopyala'**
  String get fmTrCopyError;

  /// No description provided for @fmTrRemove.
  ///
  /// In tr, this message translates to:
  /// **'Listeden kaldır'**
  String get fmTrRemove;

  /// No description provided for @fmTrRemoveRoot.
  ///
  /// In tr, this message translates to:
  /// **'Bu aktarımı listeden kaldır'**
  String get fmTrRemoveRoot;

  /// No description provided for @fmTrClearDone.
  ///
  /// In tr, this message translates to:
  /// **'Bitenleri temizle'**
  String get fmTrClearDone;

  /// No description provided for @fmTrActiveN.
  ///
  /// In tr, this message translates to:
  /// **'{n} aktarım sürüyor'**
  String fmTrActiveN(String n);

  /// No description provided for @fmTrDownloadDone.
  ///
  /// In tr, this message translates to:
  /// **'İndirme tamamlandı'**
  String get fmTrDownloadDone;

  /// No description provided for @fmTrUploadDone.
  ///
  /// In tr, this message translates to:
  /// **'Yükleme tamamlandı'**
  String get fmTrUploadDone;

  /// No description provided for @fmTrDownloadFailed.
  ///
  /// In tr, this message translates to:
  /// **'İndirme tamamlanamadı: {name}'**
  String fmTrDownloadFailed(String name);

  /// No description provided for @fmTrUploadFailed.
  ///
  /// In tr, this message translates to:
  /// **'Yükleme tamamlanamadı: {name}'**
  String fmTrUploadFailed(String name);

  /// No description provided for @fmTrFailedFiles.
  ///
  /// In tr, this message translates to:
  /// **'{n} dosya aktarılamadı'**
  String fmTrFailedFiles(String n);

  /// No description provided for @fmMainErrAuth.
  ///
  /// In tr, this message translates to:
  /// **'Giriş başarısız: kullanıcı adı veya şifre hatalı.'**
  String get fmMainErrAuth;

  /// No description provided for @fmMainErrRefused.
  ///
  /// In tr, this message translates to:
  /// **'Bağlantı reddedildi: port kapalı veya sunucu çalışmıyor.'**
  String get fmMainErrRefused;

  /// No description provided for @fmMainErrTimeout.
  ///
  /// In tr, this message translates to:
  /// **'Zaman aşımı: sunucuya ulaşılamadı.'**
  String get fmMainErrTimeout;

  /// No description provided for @fmMainErrDns.
  ///
  /// In tr, this message translates to:
  /// **'Sunucu adresi çözümlenemedi (DNS).'**
  String get fmMainErrDns;

  /// No description provided for @fmMainErrUnreach.
  ///
  /// In tr, this message translates to:
  /// **'Sunucuya ağ üzerinden erişilemiyor.'**
  String get fmMainErrUnreach;

  /// No description provided for @fmMainErrReset.
  ///
  /// In tr, this message translates to:
  /// **'Sunucu bağlantıyı kapattı.'**
  String get fmMainErrReset;

  /// No description provided for @fmMainErrNotFound.
  ///
  /// In tr, this message translates to:
  /// **'Dosya veya klasör bulunamadı.'**
  String get fmMainErrNotFound;

  /// No description provided for @fmMainErrPerm.
  ///
  /// In tr, this message translates to:
  /// **'Erişim izni yok.'**
  String get fmMainErrPerm;

  /// No description provided for @fmMainErr550.
  ///
  /// In tr, this message translates to:
  /// **'Sunucu işlemi reddetti (550): {msg}'**
  String fmMainErr550(String msg);

  /// No description provided for @fmMainErr553.
  ///
  /// In tr, this message translates to:
  /// **'Dosya adı sunucu tarafından kabul edilmedi (553).'**
  String get fmMainErr553;

  /// No description provided for @fmMainErrTls.
  ///
  /// In tr, this message translates to:
  /// **'TLS/SSL hatası — protokolü veya portu kontrol edin. ({msg})'**
  String fmMainErrTls(String msg);

  /// No description provided for @fmMainErrHostKey.
  ///
  /// In tr, this message translates to:
  /// **'Sunucunun host anahtarı değişmiş! Kayıtlı: {oldVal}, gelen: {newVal}. Güvenlik için bağlantı reddedildi.'**
  String fmMainErrHostKey(String newVal, String oldVal);

  /// No description provided for @fmMainErrConnNotFound.
  ///
  /// In tr, this message translates to:
  /// **'Site bulunamadı'**
  String get fmMainErrConnNotFound;

  /// No description provided for @fmMainErrNoSession.
  ///
  /// In tr, this message translates to:
  /// **'Sunucuya bağlı değil'**
  String get fmMainErrNoSession;

  /// No description provided for @fmMainErrHost.
  ///
  /// In tr, this message translates to:
  /// **'Sunucu adresi gerekli.'**
  String get fmMainErrHost;

  /// No description provided for @fmMainErrUser.
  ///
  /// In tr, this message translates to:
  /// **'Kullanıcı adı gerekli (veya Anonim girişi seçin).'**
  String get fmMainErrUser;

  /// No description provided for @fmMainPickKey.
  ///
  /// In tr, this message translates to:
  /// **'Özel anahtar dosyası seçin'**
  String get fmMainPickKey;

  /// No description provided for @fmMainCopySuffix.
  ///
  /// In tr, this message translates to:
  /// **' (kopya)'**
  String get fmMainCopySuffix;

  /// No description provided for @fmMainCloseActive.
  ///
  /// In tr, this message translates to:
  /// **'Süren aktarımlar var. Pencere kapatılırsa iptal edilecekler.'**
  String get fmMainCloseActive;

  /// No description provided for @fmMainCloseAnyway.
  ///
  /// In tr, this message translates to:
  /// **'Yine de kapat'**
  String get fmMainCloseAnyway;

  /// No description provided for @sqAppSearchPh.
  ///
  /// In tr, this message translates to:
  /// **'Bağlantılarda ara…  (Ctrl+F)'**
  String get sqAppSearchPh;

  /// No description provided for @sqAppNewConn.
  ///
  /// In tr, this message translates to:
  /// **'Bağlantı ekle'**
  String get sqAppNewConn;

  /// No description provided for @sqAppAddConn.
  ///
  /// In tr, this message translates to:
  /// **'Bağlantı ekle'**
  String get sqAppAddConn;

  /// No description provided for @sqAppSettings.
  ///
  /// In tr, this message translates to:
  /// **'Ayarlar'**
  String get sqAppSettings;

  /// No description provided for @sqAppStats.
  ///
  /// In tr, this message translates to:
  /// **'{c} bağlantı · {f} klasör'**
  String sqAppStats(String c, String f);

  /// No description provided for @sqAppWelcome.
  ///
  /// In tr, this message translates to:
  /// **'Hoş geldiniz'**
  String get sqAppWelcome;

  /// No description provided for @sqAppResults.
  ///
  /// In tr, this message translates to:
  /// **'“{q}” için sonuçlar'**
  String sqAppResults(String q);

  /// No description provided for @sqAppAll.
  ///
  /// In tr, this message translates to:
  /// **'Tüm bağlantılar'**
  String get sqAppAll;

  /// No description provided for @sqAppWelcomeHint.
  ///
  /// In tr, this message translates to:
  /// **'PostgreSQL, SQL Server, MySQL, SQLite ya da CSV/Parquet/Excel dosyalarına bağlanın.<br>Bilgileri girin, bağlantıyı deneyin ve kaydedin.'**
  String get sqAppWelcomeHint;

  /// No description provided for @sqAppFolders.
  ///
  /// In tr, this message translates to:
  /// **'Klasörler'**
  String get sqAppFolders;

  /// No description provided for @sqAppConnections.
  ///
  /// In tr, this message translates to:
  /// **'Bağlantılar'**
  String get sqAppConnections;

  /// No description provided for @sqAppDblHint.
  ///
  /// In tr, this message translates to:
  /// **'Açmak için karta çift tıklayın'**
  String get sqAppDblHint;

  /// No description provided for @sqAppNoMatch.
  ///
  /// In tr, this message translates to:
  /// **'Eşleşen bağlantı bulunamadı.'**
  String get sqAppNoMatch;

  /// No description provided for @sqAppFolderCount.
  ///
  /// In tr, this message translates to:
  /// **'{n} bağlantı'**
  String sqAppFolderCount(String n);

  /// No description provided for @sqAppNewConnHere.
  ///
  /// In tr, this message translates to:
  /// **'Bu klasörde yeni bağlantı'**
  String get sqAppNewConnHere;

  /// No description provided for @sqAppNewSubfolder.
  ///
  /// In tr, this message translates to:
  /// **'Alt klasör oluştur'**
  String get sqAppNewSubfolder;

  /// No description provided for @sqAppDuplicate.
  ///
  /// In tr, this message translates to:
  /// **'Kopyasını oluştur'**
  String get sqAppDuplicate;

  /// No description provided for @sqAppMoveToFolder.
  ///
  /// In tr, this message translates to:
  /// **'Klasöre taşı…'**
  String get sqAppMoveToFolder;

  /// No description provided for @sqAppConnMoved.
  ///
  /// In tr, this message translates to:
  /// **'Bağlantı taşındı'**
  String get sqAppConnMoved;

  /// No description provided for @sqAppFolderIntoSelf.
  ///
  /// In tr, this message translates to:
  /// **'Klasör kendi içine taşınamaz'**
  String get sqAppFolderIntoSelf;

  /// No description provided for @sqAppFolderPh.
  ///
  /// In tr, this message translates to:
  /// **'Örn. Müşteriler'**
  String get sqAppFolderPh;

  /// No description provided for @sqAppRenameFolder.
  ///
  /// In tr, this message translates to:
  /// **'Klasörü yeniden adlandır'**
  String get sqAppRenameFolder;

  /// No description provided for @sqAppDeleteFolder.
  ///
  /// In tr, this message translates to:
  /// **'Klasörü sil'**
  String get sqAppDeleteFolder;

  /// No description provided for @sqAppDeleteFolderMsg.
  ///
  /// In tr, this message translates to:
  /// **'<b>{name}</b> klasörü silinsin mi?'**
  String sqAppDeleteFolderMsg(String name);

  /// No description provided for @sqAppDeleteFolderConns.
  ///
  /// In tr, this message translates to:
  /// **'<br>İçindeki {n} bağlantı üst klasöre taşınacak.'**
  String sqAppDeleteFolderConns(String n);

  /// No description provided for @sqAppRootFolder.
  ///
  /// In tr, this message translates to:
  /// **'Ana dizin (klasörsüz)'**
  String get sqAppRootFolder;

  /// No description provided for @sqAppMoveTitle.
  ///
  /// In tr, this message translates to:
  /// **'“{name}” taşı'**
  String sqAppMoveTitle(String name);

  /// No description provided for @sqAppTargetFolder.
  ///
  /// In tr, this message translates to:
  /// **'Hedef klasör'**
  String get sqAppTargetFolder;

  /// No description provided for @sqAppDeleteConn.
  ///
  /// In tr, this message translates to:
  /// **'Bağlantıyı sil'**
  String get sqAppDeleteConn;

  /// No description provided for @sqAppDeleteConnMsg.
  ///
  /// In tr, this message translates to:
  /// **'<b>{name}</b> ({target}) bağlantısı silinsin mi? Kayıtlı parolası da silinir.'**
  String sqAppDeleteConnMsg(String name, String target);

  /// No description provided for @sqAppReadOnlyTag.
  ///
  /// In tr, this message translates to:
  /// **'Salt okunur'**
  String get sqAppReadOnlyTag;

  /// No description provided for @sqAppWriteTag.
  ///
  /// In tr, this message translates to:
  /// **'Yazılabilir'**
  String get sqAppWriteTag;

  /// No description provided for @sqFormTitleNew.
  ///
  /// In tr, this message translates to:
  /// **'Yeni bağlantı'**
  String get sqFormTitleNew;

  /// No description provided for @sqFormTitleEdit.
  ///
  /// In tr, this message translates to:
  /// **'Bağlantı: {name}'**
  String sqFormTitleEdit(String name);

  /// No description provided for @sqFormTabGeneral.
  ///
  /// In tr, this message translates to:
  /// **'Genel'**
  String get sqFormTabGeneral;

  /// No description provided for @sqFormTabSecurity.
  ///
  /// In tr, this message translates to:
  /// **'Güvenlik'**
  String get sqFormTabSecurity;

  /// No description provided for @sqFormTabSsh.
  ///
  /// In tr, this message translates to:
  /// **'SSH tüneli'**
  String get sqFormTabSsh;

  /// No description provided for @sqFormName.
  ///
  /// In tr, this message translates to:
  /// **'Etiket (görünen ad)'**
  String get sqFormName;

  /// No description provided for @sqFormNamePh.
  ///
  /// In tr, this message translates to:
  /// **'Örn. Üretim veritabanı'**
  String get sqFormNamePh;

  /// No description provided for @sqFormHost.
  ///
  /// In tr, this message translates to:
  /// **'Sunucu adresi'**
  String get sqFormHost;

  /// No description provided for @sqFormPort.
  ///
  /// In tr, this message translates to:
  /// **'Port'**
  String get sqFormPort;

  /// No description provided for @sqFormUser.
  ///
  /// In tr, this message translates to:
  /// **'Kullanıcı adı'**
  String get sqFormUser;

  /// No description provided for @sqFormPassword.
  ///
  /// In tr, this message translates to:
  /// **'Parola'**
  String get sqFormPassword;

  /// No description provided for @sqFormPwSaved.
  ///
  /// In tr, this message translates to:
  /// **'•••••••• (kayıtlı, değiştirmek için yazın)'**
  String get sqFormPwSaved;

  /// No description provided for @sqFormDatabase.
  ///
  /// In tr, this message translates to:
  /// **'Veritabanı'**
  String get sqFormDatabase;

  /// No description provided for @sqFormDatabasePh.
  ///
  /// In tr, this message translates to:
  /// **'Boş bırakılırsa varsayılan veritabanı'**
  String get sqFormDatabasePh;

  /// No description provided for @sqFormFile.
  ///
  /// In tr, this message translates to:
  /// **'Veritabanı dosyası'**
  String get sqFormFile;

  /// No description provided for @sqFormFilePh.
  ///
  /// In tr, this message translates to:
  /// **'C:\\Veriler\\uygulama.db'**
  String get sqFormFilePh;

  /// No description provided for @sqFormSqliteHint.
  ///
  /// In tr, this message translates to:
  /// **'SQLite veritabanı dosyası (.db, .sqlite). Salt okunur kipte dosya değiştirilmez.'**
  String get sqFormSqliteHint;

  /// No description provided for @sqFormDuckdbHint.
  ///
  /// In tr, this message translates to:
  /// **'Bir .duckdb dosyası seçin ya da boş bırakın (bellek içi). CSV, Parquet, JSON ve Excel dosyalarını doğrudan sorgulayabilirsiniz: SELECT * FROM \'C:\\veri\\satis.csv\''**
  String get sqFormDuckdbHint;

  /// No description provided for @sqFormInMemory.
  ///
  /// In tr, this message translates to:
  /// **'Bellek içi'**
  String get sqFormInMemory;

  /// No description provided for @sqFormFolder.
  ///
  /// In tr, this message translates to:
  /// **'Klasör'**
  String get sqFormFolder;

  /// No description provided for @sqFormColor.
  ///
  /// In tr, this message translates to:
  /// **'Renk'**
  String get sqFormColor;

  /// No description provided for @sqFormComments.
  ///
  /// In tr, this message translates to:
  /// **'Notlar'**
  String get sqFormComments;

  /// No description provided for @sqFormReadOnly.
  ///
  /// In tr, this message translates to:
  /// **'Salt okunur mod'**
  String get sqFormReadOnly;

  /// No description provided for @sqFormReadOnlyHint.
  ///
  /// In tr, this message translates to:
  /// **'Önerilir. INSERT/UPDATE/DELETE ve DDL komutları çalıştırılmadan önce engellenir; isterseniz tek seferlik onaylarsınız. Desteklenen veritabanlarında oturum da salt okunur açılır.'**
  String get sqFormReadOnlyHint;

  /// No description provided for @sqFormSavePassword.
  ///
  /// In tr, this message translates to:
  /// **'Parolayı kaydet'**
  String get sqFormSavePassword;

  /// No description provided for @sqFormSavePasswordHint.
  ///
  /// In tr, this message translates to:
  /// **'Parola yalnızca işletim sisteminin anahtar zincirinde (Windows: DPAPI) şifreli saklanır. Kapalıysa her bağlantıda sorulur.'**
  String get sqFormSavePasswordHint;

  /// No description provided for @sqFormSsl.
  ///
  /// In tr, this message translates to:
  /// **'TLS / SSL'**
  String get sqFormSsl;

  /// No description provided for @sqFormSslPrefer.
  ///
  /// In tr, this message translates to:
  /// **'Tercih et (sunucu destekliyorsa şifreli)'**
  String get sqFormSslPrefer;

  /// No description provided for @sqFormSslRequire.
  ///
  /// In tr, this message translates to:
  /// **'Zorunlu (sertifika doğrulanmaz)'**
  String get sqFormSslRequire;

  /// No description provided for @sqFormSslVerify.
  ///
  /// In tr, this message translates to:
  /// **'Zorunlu + sertifikayı doğrula'**
  String get sqFormSslVerify;

  /// No description provided for @sqFormSslDisable.
  ///
  /// In tr, this message translates to:
  /// **'Kapalı (şifresiz)'**
  String get sqFormSslDisable;

  /// No description provided for @sqFormSslHint.
  ///
  /// In tr, this message translates to:
  /// **'Varsayılan olarak TLS denenir; sunucu desteklemiyorsa bağlantı penceresi uyarı gösterir.'**
  String get sqFormSslHint;

  /// No description provided for @sqFormSshEnable.
  ///
  /// In tr, this message translates to:
  /// **'SSH tüneli üzerinden bağlan'**
  String get sqFormSshEnable;

  /// No description provided for @sqFormSshHint.
  ///
  /// In tr, this message translates to:
  /// **'Veritabanına önce bir SSH sunucusuna bağlanılarak ulaşılır. Anahtarla giriş önerilir.'**
  String get sqFormSshHint;

  /// No description provided for @sqFormSshHost.
  ///
  /// In tr, this message translates to:
  /// **'SSH sunucusu'**
  String get sqFormSshHost;

  /// No description provided for @sqFormSshAuth.
  ///
  /// In tr, this message translates to:
  /// **'SSH kimlik doğrulama'**
  String get sqFormSshAuth;

  /// No description provided for @sqFormSshKey.
  ///
  /// In tr, this message translates to:
  /// **'Özel anahtar'**
  String get sqFormSshKey;

  /// No description provided for @sqFormSshAgent.
  ///
  /// In tr, this message translates to:
  /// **'Ajan (Pageant)'**
  String get sqFormSshAgent;

  /// No description provided for @sqFormKeyFile.
  ///
  /// In tr, this message translates to:
  /// **'Özel anahtar dosyası'**
  String get sqFormKeyFile;

  /// No description provided for @sqFormPassphrase.
  ///
  /// In tr, this message translates to:
  /// **'Anahtar parolası'**
  String get sqFormPassphrase;

  /// No description provided for @sqFormPassSaved.
  ///
  /// In tr, this message translates to:
  /// **'(kayıtlı)'**
  String get sqFormPassSaved;

  /// No description provided for @sqFormPassEmpty.
  ///
  /// In tr, this message translates to:
  /// **'Yoksa boş bırakın'**
  String get sqFormPassEmpty;

  /// No description provided for @sqFormSshPassword.
  ///
  /// In tr, this message translates to:
  /// **'SSH parolası'**
  String get sqFormSshPassword;

  /// No description provided for @sqFormHostKey.
  ///
  /// In tr, this message translates to:
  /// **'SSH sunucu anahtarı: {fp}'**
  String sqFormHostKey(String fp);

  /// No description provided for @sqFormTest.
  ///
  /// In tr, this message translates to:
  /// **'Bağlantıyı dene'**
  String get sqFormTest;

  /// No description provided for @sqFormSaveConnect.
  ///
  /// In tr, this message translates to:
  /// **'Kaydet ve aç'**
  String get sqFormSaveConnect;

  /// No description provided for @sqFormConnecting.
  ///
  /// In tr, this message translates to:
  /// **'Bağlanılıyor…'**
  String get sqFormConnecting;

  /// No description provided for @sqFormTestOk.
  ///
  /// In tr, this message translates to:
  /// **'Bağlantı başarılı'**
  String get sqFormTestOk;

  /// No description provided for @sqFormTestFail.
  ///
  /// In tr, this message translates to:
  /// **'Bağlantı kurulamadı'**
  String get sqFormTestFail;

  /// No description provided for @sqFormTestDb.
  ///
  /// In tr, this message translates to:
  /// **'Veritabanı: {db} · Kullanıcı: {user}'**
  String sqFormTestDb(String db, String user);

  /// No description provided for @sqFormNoTls.
  ///
  /// In tr, this message translates to:
  /// **'Uyarı: bağlantı şifresiz (sunucu TLS desteklemiyor).'**
  String get sqFormNoTls;

  /// No description provided for @sqFormSaved.
  ///
  /// In tr, this message translates to:
  /// **'Bağlantı kaydedildi'**
  String get sqFormSaved;

  /// No description provided for @sqFormChangesSaved.
  ///
  /// In tr, this message translates to:
  /// **'Değişiklikler kaydedildi'**
  String get sqFormChangesSaved;

  /// No description provided for @sqCwObjects.
  ///
  /// In tr, this message translates to:
  /// **'Nesneler'**
  String get sqCwObjects;

  /// No description provided for @sqCwCollapseAll.
  ///
  /// In tr, this message translates to:
  /// **'Tümünü daralt'**
  String get sqCwCollapseAll;

  /// No description provided for @sqCwFilterPh.
  ///
  /// In tr, this message translates to:
  /// **'Yüklenmiş nesnelerde süz…'**
  String get sqCwFilterPh;

  /// No description provided for @sqCwEmpty.
  ///
  /// In tr, this message translates to:
  /// **'(boş)'**
  String get sqCwEmpty;

  /// No description provided for @sqCwOpenData.
  ///
  /// In tr, this message translates to:
  /// **'Veriyi aç'**
  String get sqCwOpenData;

  /// No description provided for @sqCwShowDdl.
  ///
  /// In tr, this message translates to:
  /// **'DDL göster'**
  String get sqCwShowDdl;

  /// No description provided for @sqCwOpenCode.
  ///
  /// In tr, this message translates to:
  /// **'Kodu aç'**
  String get sqCwOpenCode;

  /// No description provided for @sqCwSelectSql.
  ///
  /// In tr, this message translates to:
  /// **'SELECT ifadesi oluştur'**
  String get sqCwSelectSql;

  /// No description provided for @sqCwAddToBuilder.
  ///
  /// In tr, this message translates to:
  /// **'Sorgu oluşturucuya ekle'**
  String get sqCwAddToBuilder;

  /// No description provided for @sqCwNewSqlHere.
  ///
  /// In tr, this message translates to:
  /// **'Burada yeni SQL'**
  String get sqCwNewSqlHere;

  /// No description provided for @sqCwCopyName.
  ///
  /// In tr, this message translates to:
  /// **'Adı kopyala'**
  String get sqCwCopyName;

  /// No description provided for @sqCwCopied.
  ///
  /// In tr, this message translates to:
  /// **'Panoya kopyalandı'**
  String get sqCwCopied;

  /// No description provided for @sqCwNewSql.
  ///
  /// In tr, this message translates to:
  /// **'Yeni SQL'**
  String get sqCwNewSql;

  /// No description provided for @sqCwBuilder.
  ///
  /// In tr, this message translates to:
  /// **'Sorgu oluşturucu'**
  String get sqCwBuilder;

  /// No description provided for @sqCwReconnect.
  ///
  /// In tr, this message translates to:
  /// **'Yeniden bağlan'**
  String get sqCwReconnect;

  /// No description provided for @sqCwReadOnly.
  ///
  /// In tr, this message translates to:
  /// **'Salt okunur'**
  String get sqCwReadOnly;

  /// No description provided for @sqCwReadWrite.
  ///
  /// In tr, this message translates to:
  /// **'Yazma açık'**
  String get sqCwReadWrite;

  /// No description provided for @sqCwReadOnlyTip.
  ///
  /// In tr, this message translates to:
  /// **'Salt okunur kip: DML/DDL onay olmadan çalışmaz. Tıklayın: kapat'**
  String get sqCwReadOnlyTip;

  /// No description provided for @sqCwReadWriteTip.
  ///
  /// In tr, this message translates to:
  /// **'Yazma açık: komutlar onaysız çalışır. Tıklayın: salt okunura dön'**
  String get sqCwReadWriteTip;

  /// No description provided for @sqCwDisableRo.
  ///
  /// In tr, this message translates to:
  /// **'Salt okunur kip kapatılsın mı?'**
  String get sqCwDisableRo;

  /// No description provided for @sqCwDisableRoMsg.
  ///
  /// In tr, this message translates to:
  /// **'Bu pencere kapanana kadar INSERT/UPDATE/DELETE ve DDL komutları onay sorulmadan çalışacak.'**
  String get sqCwDisableRoMsg;

  /// No description provided for @sqCwDisableRoOk.
  ///
  /// In tr, this message translates to:
  /// **'Yazmayı aç'**
  String get sqCwDisableRoOk;

  /// No description provided for @sqCwRoOn.
  ///
  /// In tr, this message translates to:
  /// **'Salt okunur kip açık'**
  String get sqCwRoOn;

  /// No description provided for @sqCwRoOff.
  ///
  /// In tr, this message translates to:
  /// **'Yazma açık — dikkatli olun'**
  String get sqCwRoOff;

  /// No description provided for @sqCwPasswordTitle.
  ///
  /// In tr, this message translates to:
  /// **'Parola gerekli'**
  String get sqCwPasswordTitle;

  /// No description provided for @sqCwPasswordFor.
  ///
  /// In tr, this message translates to:
  /// **'{user}@{host} için parola'**
  String sqCwPasswordFor(String host, String user);

  /// No description provided for @sqCwNotConnected.
  ///
  /// In tr, this message translates to:
  /// **'Bağlı değil'**
  String get sqCwNotConnected;

  /// No description provided for @sqCwConnected.
  ///
  /// In tr, this message translates to:
  /// **'Bağlı'**
  String get sqCwConnected;

  /// No description provided for @sqCwConnecting.
  ///
  /// In tr, this message translates to:
  /// **'Bağlanılıyor…'**
  String get sqCwConnecting;

  /// No description provided for @sqCwNoTls.
  ///
  /// In tr, this message translates to:
  /// **'Şifresiz'**
  String get sqCwNoTls;

  /// No description provided for @sqCwConnectFailed.
  ///
  /// In tr, this message translates to:
  /// **'Bağlantı kurulamadı'**
  String get sqCwConnectFailed;

  /// No description provided for @sqCwRetry.
  ///
  /// In tr, this message translates to:
  /// **'Tekrar dene'**
  String get sqCwRetry;

  /// No description provided for @sqCwResetCancel.
  ///
  /// In tr, this message translates to:
  /// **'Sorgu iptale yanıt vermedi; bağlantı yeniden kuruluyor.'**
  String get sqCwResetCancel;

  /// No description provided for @sqCwResetExit.
  ///
  /// In tr, this message translates to:
  /// **'Veritabanı bağlantısı koptu; yeniden kuruluyor.'**
  String get sqCwResetExit;

  /// No description provided for @sqCwEmptyWorkspace.
  ///
  /// In tr, this message translates to:
  /// **'Soldaki ağaçtan bir tabloya çift tıklayın ya da Ctrl+T ile yeni SQL sekmesi açın.'**
  String get sqCwEmptyWorkspace;

  /// No description provided for @sqCwCloseTab.
  ///
  /// In tr, this message translates to:
  /// **'Sekme kapatılsın mı?'**
  String get sqCwCloseTab;

  /// No description provided for @sqCwCloseTabMsg.
  ///
  /// In tr, this message translates to:
  /// **'“{name}” sekmesindeki SQL kaydedilmedi.'**
  String sqCwCloseTabMsg(String name);

  /// No description provided for @sqCwCloseTabOk.
  ///
  /// In tr, this message translates to:
  /// **'Kapat'**
  String get sqCwCloseTabOk;

  /// No description provided for @sqTreeTables.
  ///
  /// In tr, this message translates to:
  /// **'Tablolar'**
  String get sqTreeTables;

  /// No description provided for @sqTreeViews.
  ///
  /// In tr, this message translates to:
  /// **'Görünümler'**
  String get sqTreeViews;

  /// No description provided for @sqTreeMatviews.
  ///
  /// In tr, this message translates to:
  /// **'Materialized view’lar'**
  String get sqTreeMatviews;

  /// No description provided for @sqTreeForeignTables.
  ///
  /// In tr, this message translates to:
  /// **'Yabancı tablolar'**
  String get sqTreeForeignTables;

  /// No description provided for @sqTreeFunctions.
  ///
  /// In tr, this message translates to:
  /// **'Fonksiyonlar'**
  String get sqTreeFunctions;

  /// No description provided for @sqTreeProcedures.
  ///
  /// In tr, this message translates to:
  /// **'Prosedürler'**
  String get sqTreeProcedures;

  /// No description provided for @sqTreeTriggers.
  ///
  /// In tr, this message translates to:
  /// **'Trigger’lar'**
  String get sqTreeTriggers;

  /// No description provided for @sqTreeSequences.
  ///
  /// In tr, this message translates to:
  /// **'Sequence’ler'**
  String get sqTreeSequences;

  /// No description provided for @sqTreeTypes.
  ///
  /// In tr, this message translates to:
  /// **'Tipler'**
  String get sqTreeTypes;

  /// No description provided for @sqTreeColumns.
  ///
  /// In tr, this message translates to:
  /// **'Kolonlar'**
  String get sqTreeColumns;

  /// No description provided for @sqTreeIndexes.
  ///
  /// In tr, this message translates to:
  /// **'İndeksler'**
  String get sqTreeIndexes;

  /// No description provided for @sqTreeConstraints.
  ///
  /// In tr, this message translates to:
  /// **'Kısıtlar'**
  String get sqTreeConstraints;

  /// No description provided for @sqTreeFiles.
  ///
  /// In tr, this message translates to:
  /// **'Dosyalar'**
  String get sqTreeFiles;

  /// No description provided for @sqKindTable.
  ///
  /// In tr, this message translates to:
  /// **'Tablo'**
  String get sqKindTable;

  /// No description provided for @sqKindView.
  ///
  /// In tr, this message translates to:
  /// **'Görünüm'**
  String get sqKindView;

  /// No description provided for @sqKindMatview.
  ///
  /// In tr, this message translates to:
  /// **'Materialized view'**
  String get sqKindMatview;

  /// No description provided for @sqKindForeignTable.
  ///
  /// In tr, this message translates to:
  /// **'Yabancı tablo'**
  String get sqKindForeignTable;

  /// No description provided for @sqKindFunction.
  ///
  /// In tr, this message translates to:
  /// **'Fonksiyon'**
  String get sqKindFunction;

  /// No description provided for @sqKindProcedure.
  ///
  /// In tr, this message translates to:
  /// **'Prosedür'**
  String get sqKindProcedure;

  /// No description provided for @sqKindTrigger.
  ///
  /// In tr, this message translates to:
  /// **'Trigger'**
  String get sqKindTrigger;

  /// No description provided for @sqKindSequence.
  ///
  /// In tr, this message translates to:
  /// **'Sequence'**
  String get sqKindSequence;

  /// No description provided for @sqKindType.
  ///
  /// In tr, this message translates to:
  /// **'Tip'**
  String get sqKindType;

  /// No description provided for @sqKindIndex.
  ///
  /// In tr, this message translates to:
  /// **'İndeks'**
  String get sqKindIndex;

  /// No description provided for @sqKindConstraint.
  ///
  /// In tr, this message translates to:
  /// **'Kısıt'**
  String get sqKindConstraint;

  /// No description provided for @sqSqlRun.
  ///
  /// In tr, this message translates to:
  /// **'Çalıştır'**
  String get sqSqlRun;

  /// No description provided for @sqSqlRunStatement.
  ///
  /// In tr, this message translates to:
  /// **'İfadeyi çalıştır'**
  String get sqSqlRunStatement;

  /// No description provided for @sqSqlCancel.
  ///
  /// In tr, this message translates to:
  /// **'İptal'**
  String get sqSqlCancel;

  /// No description provided for @sqSqlDatabase.
  ///
  /// In tr, this message translates to:
  /// **'Veritabanı'**
  String get sqSqlDatabase;

  /// No description provided for @sqSqlHistory.
  ///
  /// In tr, this message translates to:
  /// **'Geçmiş'**
  String get sqSqlHistory;

  /// No description provided for @sqSqlExport.
  ///
  /// In tr, this message translates to:
  /// **'Dışa aktar'**
  String get sqSqlExport;

  /// No description provided for @sqSqlRunning.
  ///
  /// In tr, this message translates to:
  /// **'Çalışıyor…'**
  String get sqSqlRunning;

  /// No description provided for @sqSqlDone.
  ///
  /// In tr, this message translates to:
  /// **'Tamamlandı · {ms} ms'**
  String sqSqlDone(String ms);

  /// No description provided for @sqSqlDoneErrors.
  ///
  /// In tr, this message translates to:
  /// **'{n} hata · {ms} ms'**
  String sqSqlDoneErrors(String ms, String n);

  /// No description provided for @sqSqlDdlHint.
  ///
  /// In tr, this message translates to:
  /// **'Şema değişti: ağacı yenilemek için Yenile düğmesini kullanın.'**
  String get sqSqlDdlHint;

  /// No description provided for @sqSqlPlaceholder.
  ///
  /// In tr, this message translates to:
  /// **'SQL yazın… Ctrl+Enter: seçili/tümünü çalıştır · Ctrl+Shift+Enter: imleçteki ifade · Ctrl+Boşluk: tamamla'**
  String get sqSqlPlaceholder;

  /// No description provided for @sqSqlTabTitle.
  ///
  /// In tr, this message translates to:
  /// **'SQL {n}'**
  String sqSqlTabTitle(String n);

  /// No description provided for @sqSqlHistoryEmpty.
  ///
  /// In tr, this message translates to:
  /// **'Bu bağlantı için geçmiş yok.'**
  String get sqSqlHistoryEmpty;

  /// No description provided for @sqSqlRowsShort.
  ///
  /// In tr, this message translates to:
  /// **'satır'**
  String get sqSqlRowsShort;

  /// No description provided for @sqResResult.
  ///
  /// In tr, this message translates to:
  /// **'Sonuç {n}'**
  String sqResResult(String n);

  /// No description provided for @sqResMessages.
  ///
  /// In tr, this message translates to:
  /// **'Mesajlar'**
  String get sqResMessages;

  /// No description provided for @sqResRows.
  ///
  /// In tr, this message translates to:
  /// **'{n} satır · {ms} ms'**
  String sqResRows(String ms, String n);

  /// No description provided for @sqResRowsTruncated.
  ///
  /// In tr, this message translates to:
  /// **'İlk {n} satır gösteriliyor (sınır) · {ms} ms'**
  String sqResRowsTruncated(String ms, String n);

  /// No description provided for @sqResNoRows.
  ///
  /// In tr, this message translates to:
  /// **'Kayıt yok'**
  String get sqResNoRows;

  /// No description provided for @sqResAffected.
  ///
  /// In tr, this message translates to:
  /// **'{cmd}: {n} satır etkilendi · {ms} ms'**
  String sqResAffected(String cmd, String ms, String n);

  /// No description provided for @sqResCommand.
  ///
  /// In tr, this message translates to:
  /// **'{cmd} · {ms} ms'**
  String sqResCommand(String cmd, String ms);

  /// No description provided for @sqResCancelled.
  ///
  /// In tr, this message translates to:
  /// **'İptal edildi'**
  String get sqResCancelled;

  /// No description provided for @sqGridCopy.
  ///
  /// In tr, this message translates to:
  /// **'Kopyala'**
  String get sqGridCopy;

  /// No description provided for @sqGridCopyHeaders.
  ///
  /// In tr, this message translates to:
  /// **'Başlıklarla kopyala'**
  String get sqGridCopyHeaders;

  /// No description provided for @sqGridExport.
  ///
  /// In tr, this message translates to:
  /// **'Bu sonucu dışa aktar…'**
  String get sqGridExport;

  /// No description provided for @sqDataColumns.
  ///
  /// In tr, this message translates to:
  /// **'Kolonlar'**
  String get sqDataColumns;

  /// No description provided for @sqDataColumnsHidden.
  ///
  /// In tr, this message translates to:
  /// **'Kolonlar ({n}/{total})'**
  String sqDataColumnsHidden(String n, String total);

  /// No description provided for @sqDataAddFilter.
  ///
  /// In tr, this message translates to:
  /// **'Filtre'**
  String get sqDataAddFilter;

  /// No description provided for @sqDataLimit.
  ///
  /// In tr, this message translates to:
  /// **'Kayıt sayısı'**
  String get sqDataLimit;

  /// No description provided for @sqDataFirstN.
  ///
  /// In tr, this message translates to:
  /// **'İlk {n}'**
  String sqDataFirstN(String n);

  /// No description provided for @sqDataAll.
  ///
  /// In tr, this message translates to:
  /// **'Tümü (sınırla)'**
  String get sqDataAll;

  /// No description provided for @sqDataOpenInEditor.
  ///
  /// In tr, this message translates to:
  /// **'SQL editöründe aç'**
  String get sqDataOpenInEditor;

  /// No description provided for @sqDataClearFilters.
  ///
  /// In tr, this message translates to:
  /// **'Filtreleri temizle'**
  String get sqDataClearFilters;

  /// No description provided for @sqDataRows.
  ///
  /// In tr, this message translates to:
  /// **'{n} kayıt · {ms} ms'**
  String sqDataRows(String ms, String n);

  /// No description provided for @sqDataRowsMore.
  ///
  /// In tr, this message translates to:
  /// **'İlk {n} kayıt · {ms} ms'**
  String sqDataRowsMore(String ms, String n);

  /// No description provided for @sqDataError.
  ///
  /// In tr, this message translates to:
  /// **'Veri alınamadı'**
  String get sqDataError;

  /// No description provided for @sqDataSortAsc.
  ///
  /// In tr, this message translates to:
  /// **'Artan sırala'**
  String get sqDataSortAsc;

  /// No description provided for @sqDataSortDesc.
  ///
  /// In tr, this message translates to:
  /// **'Azalan sırala'**
  String get sqDataSortDesc;

  /// No description provided for @sqDataSortClear.
  ///
  /// In tr, this message translates to:
  /// **'Sıralamayı kaldır'**
  String get sqDataSortClear;

  /// No description provided for @sqDataFilterColumn.
  ///
  /// In tr, this message translates to:
  /// **'Bu kolona göre filtrele…'**
  String get sqDataFilterColumn;

  /// No description provided for @sqDataHideColumn.
  ///
  /// In tr, this message translates to:
  /// **'Kolonu gizle'**
  String get sqDataHideColumn;

  /// No description provided for @sqDataShowAll.
  ///
  /// In tr, this message translates to:
  /// **'Tüm kolonları göster'**
  String get sqDataShowAll;

  /// No description provided for @sqDataFilterEq.
  ///
  /// In tr, this message translates to:
  /// **'= “{v}” olanlar'**
  String sqDataFilterEq(String v);

  /// No description provided for @sqDataFilterNe.
  ///
  /// In tr, this message translates to:
  /// **'≠ “{v}” olanlar'**
  String sqDataFilterNe(String v);

  /// No description provided for @sqDataFilterNull.
  ///
  /// In tr, this message translates to:
  /// **'NULL olanlar / olmayanlar'**
  String get sqDataFilterNull;

  /// No description provided for @sqDataColumn.
  ///
  /// In tr, this message translates to:
  /// **'Kolon'**
  String get sqDataColumn;

  /// No description provided for @sqDataOperator.
  ///
  /// In tr, this message translates to:
  /// **'Koşul'**
  String get sqDataOperator;

  /// No description provided for @sqDataValue.
  ///
  /// In tr, this message translates to:
  /// **'Değer'**
  String get sqDataValue;

  /// No description provided for @sqDataInHint.
  ///
  /// In tr, this message translates to:
  /// **'“içinde” için değerleri virgülle ayırın.'**
  String get sqDataInHint;

  /// No description provided for @sqDataFilterTitle.
  ///
  /// In tr, this message translates to:
  /// **'Filtre'**
  String get sqDataFilterTitle;

  /// No description provided for @sqDataSelectAll.
  ///
  /// In tr, this message translates to:
  /// **'Tümü'**
  String get sqDataSelectAll;

  /// No description provided for @sqDataSelectNone.
  ///
  /// In tr, this message translates to:
  /// **'Hiçbiri'**
  String get sqDataSelectNone;

  /// No description provided for @sqOpContains.
  ///
  /// In tr, this message translates to:
  /// **'içerir'**
  String get sqOpContains;

  /// No description provided for @sqOpStarts.
  ///
  /// In tr, this message translates to:
  /// **'ile başlar'**
  String get sqOpStarts;

  /// No description provided for @sqOpEnds.
  ///
  /// In tr, this message translates to:
  /// **'ile biter'**
  String get sqOpEnds;

  /// No description provided for @sqOpLike.
  ///
  /// In tr, this message translates to:
  /// **'LIKE'**
  String get sqOpLike;

  /// No description provided for @sqOpIn.
  ///
  /// In tr, this message translates to:
  /// **'içinde (liste)'**
  String get sqOpIn;

  /// No description provided for @sqCodeExecute.
  ///
  /// In tr, this message translates to:
  /// **'Çalıştır'**
  String get sqCodeExecute;

  /// No description provided for @sqCodeLoading.
  ///
  /// In tr, this message translates to:
  /// **'Yükleniyor…'**
  String get sqCodeLoading;

  /// No description provided for @sqCodeEmpty.
  ///
  /// In tr, this message translates to:
  /// **'Tanım bulunamadı'**
  String get sqCodeEmpty;

  /// No description provided for @sqQbAddTable.
  ///
  /// In tr, this message translates to:
  /// **'Tablo ekle'**
  String get sqQbAddTable;

  /// No description provided for @sqQbLimit.
  ///
  /// In tr, this message translates to:
  /// **'Sınır'**
  String get sqQbLimit;

  /// No description provided for @sqQbClear.
  ///
  /// In tr, this message translates to:
  /// **'Temizle'**
  String get sqQbClear;

  /// No description provided for @sqQbHint.
  ///
  /// In tr, this message translates to:
  /// **'Tabloları soldaki ağaçtan buraya sürükleyin ya da “Tablo ekle”ye tıklayın. Bir kolonu başka tablonun kolonuna sürükleyerek JOIN oluşturun.'**
  String get sqQbHint;

  /// No description provided for @sqQbColumns.
  ///
  /// In tr, this message translates to:
  /// **'Kolonlar'**
  String get sqQbColumns;

  /// No description provided for @sqQbConditions.
  ///
  /// In tr, this message translates to:
  /// **'Koşullar'**
  String get sqQbConditions;

  /// No description provided for @sqQbResults.
  ///
  /// In tr, this message translates to:
  /// **'Sonuçlar'**
  String get sqQbResults;

  /// No description provided for @sqQbGenerated.
  ///
  /// In tr, this message translates to:
  /// **'Üretilen SQL'**
  String get sqQbGenerated;

  /// No description provided for @sqQbRegenerate.
  ///
  /// In tr, this message translates to:
  /// **'Diyagramdan yeniden üret'**
  String get sqQbRegenerate;

  /// No description provided for @sqQbOtherDb.
  ///
  /// In tr, this message translates to:
  /// **'Sorgu oluşturucu tek bir veritabanındaki tablolarla çalışır.'**
  String get sqQbOtherDb;

  /// No description provided for @sqQbDragJoin.
  ///
  /// In tr, this message translates to:
  /// **'JOIN için başka tablonun kolonuna sürükleyin'**
  String get sqQbDragJoin;

  /// No description provided for @sqQbSwapJoin.
  ///
  /// In tr, this message translates to:
  /// **'Yönü değiştir'**
  String get sqQbSwapJoin;

  /// No description provided for @sqQbDeleteJoin.
  ///
  /// In tr, this message translates to:
  /// **'JOIN’i sil'**
  String get sqQbDeleteJoin;

  /// No description provided for @sqQbNoColumns.
  ///
  /// In tr, this message translates to:
  /// **'Tablolardaki kolon kutucuklarını işaretleyin (boşsa SELECT *).'**
  String get sqQbNoColumns;

  /// No description provided for @sqQbOutput.
  ///
  /// In tr, this message translates to:
  /// **'Göster'**
  String get sqQbOutput;

  /// No description provided for @sqQbColumn.
  ///
  /// In tr, this message translates to:
  /// **'Kolon'**
  String get sqQbColumn;

  /// No description provided for @sqQbAlias.
  ///
  /// In tr, this message translates to:
  /// **'Takma ad'**
  String get sqQbAlias;

  /// No description provided for @sqQbAggregate.
  ///
  /// In tr, this message translates to:
  /// **'Toplama'**
  String get sqQbAggregate;

  /// No description provided for @sqQbSort.
  ///
  /// In tr, this message translates to:
  /// **'Sıralama'**
  String get sqQbSort;

  /// No description provided for @sqQbAddCondition.
  ///
  /// In tr, this message translates to:
  /// **'Koşul ekle'**
  String get sqQbAddCondition;

  /// No description provided for @sqQbTabTitle.
  ///
  /// In tr, this message translates to:
  /// **'Sorgu {n}'**
  String sqQbTabTitle(String n);

  /// No description provided for @sqRoTitle.
  ///
  /// In tr, this message translates to:
  /// **'Salt okunur kip'**
  String get sqRoTitle;

  /// No description provided for @sqRoMessage.
  ///
  /// In tr, this message translates to:
  /// **'Bu bağlantı salt okunur kipte. Aşağıdaki ifadeler veri ya da şemayı değiştirebilir:'**
  String get sqRoMessage;

  /// No description provided for @sqRoHint.
  ///
  /// In tr, this message translates to:
  /// **'Yalnızca bu çalıştırma için izin verebilirsiniz; kip ardından yeniden açılır.'**
  String get sqRoHint;

  /// No description provided for @sqRoRunOnce.
  ///
  /// In tr, this message translates to:
  /// **'Bu seferlik çalıştır'**
  String get sqRoRunOnce;

  /// No description provided for @sqRoNotRun.
  ///
  /// In tr, this message translates to:
  /// **'Salt okunur kip: çalıştırılmadı'**
  String get sqRoNotRun;

  /// No description provided for @sqRoBlockedMsg.
  ///
  /// In tr, this message translates to:
  /// **'Salt okunur kip: {n} ifade onay bekliyor.'**
  String sqRoBlockedMsg(String n);

  /// No description provided for @sqExpTitle.
  ///
  /// In tr, this message translates to:
  /// **'Dışa aktar'**
  String get sqExpTitle;

  /// No description provided for @sqExpHint.
  ///
  /// In tr, this message translates to:
  /// **'Sorgu sınırsız olarak yeniden çalıştırılır ve sonuçlar belleğe alınmadan doğrudan dosyaya yazılır.'**
  String get sqExpHint;

  /// No description provided for @sqExpRunning.
  ///
  /// In tr, this message translates to:
  /// **'Dışa aktarılıyor…'**
  String get sqExpRunning;

  /// No description provided for @sqExpDone.
  ///
  /// In tr, this message translates to:
  /// **'{n} satır dışa aktarıldı'**
  String sqExpDone(String n);

  /// No description provided for @sqExpFailed.
  ///
  /// In tr, this message translates to:
  /// **'Dışa aktarım başarısız'**
  String get sqExpFailed;

  /// No description provided for @sqErrRefused.
  ///
  /// In tr, this message translates to:
  /// **'Bağlantı reddedildi: port kapalı ya da sunucu çalışmıyor.'**
  String get sqErrRefused;

  /// No description provided for @sqErrDns.
  ///
  /// In tr, this message translates to:
  /// **'Sunucu adı çözümlenemedi (DNS).'**
  String get sqErrDns;

  /// No description provided for @sqErrTimeout.
  ///
  /// In tr, this message translates to:
  /// **'Zaman aşımı: sunucuya ulaşılamadı.'**
  String get sqErrTimeout;

  /// No description provided for @sqErrReset.
  ///
  /// In tr, this message translates to:
  /// **'Sunucu bağlantıyı kapattı.'**
  String get sqErrReset;

  /// No description provided for @sqErrUnreach.
  ///
  /// In tr, this message translates to:
  /// **'Sunucuya ağ üzerinden ulaşılamıyor.'**
  String get sqErrUnreach;

  /// No description provided for @sqErrSshAuth.
  ///
  /// In tr, this message translates to:
  /// **'SSH girişi başarısız: kullanıcı adı, anahtar ya da parola hatalı.'**
  String get sqErrSshAuth;

  /// No description provided for @sqErrTls.
  ///
  /// In tr, this message translates to:
  /// **'TLS/SSL hatası — sertifika doğrulanamadı ya da sunucu TLS desteklemiyor. ({msg})'**
  String sqErrTls(String msg);

  /// No description provided for @sqErrHostExit.
  ///
  /// In tr, this message translates to:
  /// **'Veritabanı süreci beklenmedik şekilde kapandı.'**
  String get sqErrHostExit;

  /// No description provided for @sqErrUnknown.
  ///
  /// In tr, this message translates to:
  /// **'Bilinmeyen hata'**
  String get sqErrUnknown;

  /// No description provided for @sqMainCloseAnyway.
  ///
  /// In tr, this message translates to:
  /// **'Yine de kapat'**
  String get sqMainCloseAnyway;

  /// No description provided for @sqMainCloseRunning.
  ///
  /// In tr, this message translates to:
  /// **'Çalışan sorgular var. Pencere kapanırsa iptal edilecek.'**
  String get sqMainCloseRunning;

  /// No description provided for @sqMainCopySuffix.
  ///
  /// In tr, this message translates to:
  /// **' (kopya)'**
  String get sqMainCopySuffix;

  /// No description provided for @sqMainErrConnNotFound.
  ///
  /// In tr, this message translates to:
  /// **'Bağlantı bulunamadı'**
  String get sqMainErrConnNotFound;

  /// No description provided for @sqMainErrNoSession.
  ///
  /// In tr, this message translates to:
  /// **'Bu pencerenin bağlantısı yok'**
  String get sqMainErrNoSession;

  /// No description provided for @sqMainErrKeyFile.
  ///
  /// In tr, this message translates to:
  /// **'SSH anahtar dosyası okunamadı: {path}'**
  String sqMainErrKeyFile(String path);

  /// No description provided for @sqMainTrayShow.
  ///
  /// In tr, this message translates to:
  /// **'SQL Master’ı göster'**
  String get sqMainTrayShow;

  /// No description provided for @sqMainTrayQuick.
  ///
  /// In tr, this message translates to:
  /// **'Hızlı bağlan'**
  String get sqMainTrayQuick;

  /// No description provided for @sqMainTrayNone.
  ///
  /// In tr, this message translates to:
  /// **'Kayıtlı bağlantı yok'**
  String get sqMainTrayNone;

  /// No description provided for @sqMainTrayQuit.
  ///
  /// In tr, this message translates to:
  /// **'Çıkış'**
  String get sqMainTrayQuit;

  /// No description provided for @npKindSsh.
  ///
  /// In tr, this message translates to:
  /// **'SSH Projesi'**
  String get npKindSsh;

  /// No description provided for @npKindFtp.
  ///
  /// In tr, this message translates to:
  /// **'FTP Projesi'**
  String get npKindFtp;

  /// No description provided for @npKindLocal.
  ///
  /// In tr, this message translates to:
  /// **'Lokal Klasör'**
  String get npKindLocal;

  /// No description provided for @npKindFile.
  ///
  /// In tr, this message translates to:
  /// **'Proje Dosyası'**
  String get npKindFile;

  /// No description provided for @npKindSshHint.
  ///
  /// In tr, this message translates to:
  /// **'SSH (SFTP) ile sunucudaki klasör'**
  String get npKindSshHint;

  /// No description provided for @npKindFtpHint.
  ///
  /// In tr, this message translates to:
  /// **'FTP, FTPS veya SFTP sunucusu'**
  String get npKindFtpHint;

  /// No description provided for @npKindLocalHint.
  ///
  /// In tr, this message translates to:
  /// **'Bu bilgisayardaki bir klasör'**
  String get npKindLocalHint;

  /// No description provided for @npKindFileHint.
  ///
  /// In tr, this message translates to:
  /// **'Tek bir dosyayı düzenle'**
  String get npKindFileHint;

  /// No description provided for @npAppSearchPh.
  ///
  /// In tr, this message translates to:
  /// **'Bağlantılarda ara…  (Ctrl+F)'**
  String get npAppSearchPh;

  /// No description provided for @npAppNewConn.
  ///
  /// In tr, this message translates to:
  /// **'Yeni bağlantı'**
  String get npAppNewConn;

  /// No description provided for @npAppSettings.
  ///
  /// In tr, this message translates to:
  /// **'Ayarlar'**
  String get npAppSettings;

  /// No description provided for @npAppStats.
  ///
  /// In tr, this message translates to:
  /// **'{c} bağlantı · {f} klasör'**
  String npAppStats(String c, String f);

  /// No description provided for @npAppWelcome.
  ///
  /// In tr, this message translates to:
  /// **'Hoş geldiniz'**
  String get npAppWelcome;

  /// No description provided for @npAppResults.
  ///
  /// In tr, this message translates to:
  /// **'“{q}” için sonuçlar'**
  String npAppResults(String q);

  /// No description provided for @npAppAll.
  ///
  /// In tr, this message translates to:
  /// **'Tüm bağlantılar'**
  String get npAppAll;

  /// No description provided for @npAppWelcomeHint.
  ///
  /// In tr, this message translates to:
  /// **'SSH, FTP, lokal klasör ya da tek dosya ekleyin.<br>Karta çift tıklayınca proje ayrı pencerede açılır.'**
  String get npAppWelcomeHint;

  /// No description provided for @npAppFolders.
  ///
  /// In tr, this message translates to:
  /// **'Klasörler'**
  String get npAppFolders;

  /// No description provided for @npAppConnections.
  ///
  /// In tr, this message translates to:
  /// **'Bağlantılar'**
  String get npAppConnections;

  /// No description provided for @npAppDblHint.
  ///
  /// In tr, this message translates to:
  /// **'Açmak için karta çift tıklayın'**
  String get npAppDblHint;

  /// No description provided for @npAppNoMatch.
  ///
  /// In tr, this message translates to:
  /// **'Eşleşen bağlantı bulunamadı.'**
  String get npAppNoMatch;

  /// No description provided for @npAppFolderCount.
  ///
  /// In tr, this message translates to:
  /// **'{n} bağlantı'**
  String npAppFolderCount(String n);

  /// No description provided for @npAppNewConnHere.
  ///
  /// In tr, this message translates to:
  /// **'Bu klasörde yeni bağlantı'**
  String get npAppNewConnHere;

  /// No description provided for @npAppNewSubfolder.
  ///
  /// In tr, this message translates to:
  /// **'Alt klasör oluştur'**
  String get npAppNewSubfolder;

  /// No description provided for @npAppKeyTag.
  ///
  /// In tr, this message translates to:
  /// **'Anahtar'**
  String get npAppKeyTag;

  /// No description provided for @npAppDuplicate.
  ///
  /// In tr, this message translates to:
  /// **'Kopyasını oluştur'**
  String get npAppDuplicate;

  /// No description provided for @npAppMoveToFolder.
  ///
  /// In tr, this message translates to:
  /// **'Klasöre taşı…'**
  String get npAppMoveToFolder;

  /// No description provided for @npAppConnMoved.
  ///
  /// In tr, this message translates to:
  /// **'Bağlantı taşındı'**
  String get npAppConnMoved;

  /// No description provided for @npAppFolderIntoSelf.
  ///
  /// In tr, this message translates to:
  /// **'Klasör kendi içine taşınamaz'**
  String get npAppFolderIntoSelf;

  /// No description provided for @npAppFolderPh.
  ///
  /// In tr, this message translates to:
  /// **'Örn. Müşteriler'**
  String get npAppFolderPh;

  /// No description provided for @npAppRenameFolder.
  ///
  /// In tr, this message translates to:
  /// **'Klasörü yeniden adlandır'**
  String get npAppRenameFolder;

  /// No description provided for @npAppDeleteFolder.
  ///
  /// In tr, this message translates to:
  /// **'Klasörü sil'**
  String get npAppDeleteFolder;

  /// No description provided for @npAppDeleteFolderMsg.
  ///
  /// In tr, this message translates to:
  /// **'<b>{name}</b> klasörü silinsin mi?'**
  String npAppDeleteFolderMsg(String name);

  /// No description provided for @npAppDeleteFolderConns.
  ///
  /// In tr, this message translates to:
  /// **'<br>İçindeki {n} bağlantı üst klasöre taşınacak.'**
  String npAppDeleteFolderConns(String n);

  /// No description provided for @npAppRootFolder.
  ///
  /// In tr, this message translates to:
  /// **'Ana dizin (klasörsüz)'**
  String get npAppRootFolder;

  /// No description provided for @npAppMoveTitle.
  ///
  /// In tr, this message translates to:
  /// **'“{name}” taşı'**
  String npAppMoveTitle(String name);

  /// No description provided for @npAppTargetFolder.
  ///
  /// In tr, this message translates to:
  /// **'Hedef klasör'**
  String get npAppTargetFolder;

  /// No description provided for @npAppDeleteConn.
  ///
  /// In tr, this message translates to:
  /// **'Bağlantıyı sil'**
  String get npAppDeleteConn;

  /// No description provided for @npAppDeleteConnMsg.
  ///
  /// In tr, this message translates to:
  /// **'<b>{name}</b> ({target}) bağlantısı silinsin mi?<br>Sunucudaki ya da klasördeki dosyalara dokunulmaz; yalnız bu bağlantı ve çalışma kopyası silinir.'**
  String npAppDeleteConnMsg(String name, String target);

  /// No description provided for @npAppNoLocalPath.
  ///
  /// In tr, this message translates to:
  /// **'Bu bilgisayarda yol seçilmedi — açınca sorulur'**
  String get npAppNoLocalPath;

  /// No description provided for @npAppChangeLocalPath.
  ///
  /// In tr, this message translates to:
  /// **'Bu bilgisayardaki yolu değiştir…'**
  String get npAppChangeLocalPath;

  /// No description provided for @npAppOpenTabs.
  ///
  /// In tr, this message translates to:
  /// **'Açık sekmeler'**
  String get npAppOpenTabs;

  /// No description provided for @npAppCustomEditor.
  ///
  /// In tr, this message translates to:
  /// **'Bağlantıya özel editör ayarları'**
  String get npAppCustomEditor;

  /// No description provided for @npFormTitleNew.
  ///
  /// In tr, this message translates to:
  /// **'Yeni bağlantı'**
  String get npFormTitleNew;

  /// No description provided for @npFormTitleEdit.
  ///
  /// In tr, this message translates to:
  /// **'Bağlantı: {name}'**
  String npFormTitleEdit(String name);

  /// No description provided for @npFormTabConn.
  ///
  /// In tr, this message translates to:
  /// **'Bağlantı'**
  String get npFormTabConn;

  /// No description provided for @npFormTabProject.
  ///
  /// In tr, this message translates to:
  /// **'Proje'**
  String get npFormTabProject;

  /// No description provided for @npFormTabEditor.
  ///
  /// In tr, this message translates to:
  /// **'Editör (Notepad++)'**
  String get npFormTabEditor;

  /// No description provided for @npFormName.
  ///
  /// In tr, this message translates to:
  /// **'Ad (görünen)'**
  String get npFormName;

  /// No description provided for @npFormNamePh.
  ///
  /// In tr, this message translates to:
  /// **'Örn. Şirket web sitesi'**
  String get npFormNamePh;

  /// No description provided for @npFormHost.
  ///
  /// In tr, this message translates to:
  /// **'Sunucu adresi'**
  String get npFormHost;

  /// No description provided for @npFormHostPh.
  ///
  /// In tr, this message translates to:
  /// **'sunucu.ornek.com veya 192.168.1.10'**
  String get npFormHostPh;

  /// No description provided for @npFormPort.
  ///
  /// In tr, this message translates to:
  /// **'Port'**
  String get npFormPort;

  /// No description provided for @npFormUser.
  ///
  /// In tr, this message translates to:
  /// **'Kullanıcı adı'**
  String get npFormUser;

  /// No description provided for @npFormPassword.
  ///
  /// In tr, this message translates to:
  /// **'Şifre'**
  String get npFormPassword;

  /// No description provided for @npFormPwSaved.
  ///
  /// In tr, this message translates to:
  /// **'•••••••• (kayıtlı, değiştirmek için yazın)'**
  String get npFormPwSaved;

  /// No description provided for @npFormLoginMethod.
  ///
  /// In tr, this message translates to:
  /// **'Giriş yöntemi'**
  String get npFormLoginMethod;

  /// No description provided for @npFormLoginNormal.
  ///
  /// In tr, this message translates to:
  /// **'Normal'**
  String get npFormLoginNormal;

  /// No description provided for @npFormLoginAnon.
  ///
  /// In tr, this message translates to:
  /// **'Anonim'**
  String get npFormLoginAnon;

  /// No description provided for @npFormAuth.
  ///
  /// In tr, this message translates to:
  /// **'SSH kimlik doğrulama'**
  String get npFormAuth;

  /// No description provided for @npFormPrivateKey.
  ///
  /// In tr, this message translates to:
  /// **'Özel anahtar'**
  String get npFormPrivateKey;

  /// No description provided for @npFormKeyFile.
  ///
  /// In tr, this message translates to:
  /// **'Özel anahtar dosyası'**
  String get npFormKeyFile;

  /// No description provided for @npFormPassphrase.
  ///
  /// In tr, this message translates to:
  /// **'Anahtar parolası'**
  String get npFormPassphrase;

  /// No description provided for @npFormPassSaved.
  ///
  /// In tr, this message translates to:
  /// **'(kayıtlı)'**
  String get npFormPassSaved;

  /// No description provided for @npFormPassEmpty.
  ///
  /// In tr, this message translates to:
  /// **'Yoksa boş bırakın'**
  String get npFormPassEmpty;

  /// No description provided for @npFormFolder.
  ///
  /// In tr, this message translates to:
  /// **'Klasör'**
  String get npFormFolder;

  /// No description provided for @npFormColor.
  ///
  /// In tr, this message translates to:
  /// **'Renk'**
  String get npFormColor;

  /// No description provided for @npFormComments.
  ///
  /// In tr, this message translates to:
  /// **'Notlar'**
  String get npFormComments;

  /// No description provided for @npFormRootDir.
  ///
  /// In tr, this message translates to:
  /// **'Proje klasörü (sunucuda)'**
  String get npFormRootDir;

  /// No description provided for @npFormBrowse.
  ///
  /// In tr, this message translates to:
  /// **'Klasör seç'**
  String get npFormBrowse;

  /// No description provided for @npFormBrowseHint.
  ///
  /// In tr, this message translates to:
  /// **'Klasörü sunucuda gezerek seçmek için önce “Bağlantıyı dene”ye basın. Boş bırakılırsa giriş klasörü açılır.'**
  String get npFormBrowseHint;

  /// No description provided for @npFormBrowseTitle.
  ///
  /// In tr, this message translates to:
  /// **'Sunucuda klasör seçin'**
  String get npFormBrowseTitle;

  /// No description provided for @npFormBrowseSelect.
  ///
  /// In tr, this message translates to:
  /// **'Bu klasörü seç'**
  String get npFormBrowseSelect;

  /// No description provided for @npFormBrowseEmpty.
  ///
  /// In tr, this message translates to:
  /// **'Alt klasör yok'**
  String get npFormBrowseEmpty;

  /// No description provided for @npFormFolderPath.
  ///
  /// In tr, this message translates to:
  /// **'Klasör'**
  String get npFormFolderPath;

  /// No description provided for @npFormFilePath.
  ///
  /// In tr, this message translates to:
  /// **'Dosya'**
  String get npFormFilePath;

  /// No description provided for @npFormLocalPathHint.
  ///
  /// In tr, this message translates to:
  /// **'Yerel yol yalnız bu bilgisayarda saklanır; diğer bilgisayarlarda ilk açılışta sorulur.'**
  String get npFormLocalPathHint;

  /// No description provided for @npFormCacheNote.
  ///
  /// In tr, this message translates to:
  /// **'Açılan her dosya, klasör yapısıyla birlikte çalışma kopyasına (önbellek) kaydedilir. Kaydedince dosya sunucuya yüklenir ve çalışma kopyası güncellenir.'**
  String get npFormCacheNote;

  /// No description provided for @npFormRestoreTabs.
  ///
  /// In tr, this message translates to:
  /// **'Açık sekmeleri hatırla'**
  String get npFormRestoreTabs;

  /// No description provided for @npFormRestoreTabsHint.
  ///
  /// In tr, this message translates to:
  /// **'Proje bir sonraki açılışta aynı dosyalarla açılır (yalnız bu bilgisayarda).'**
  String get npFormRestoreTabsHint;

  /// No description provided for @npFormShowHidden.
  ///
  /// In tr, this message translates to:
  /// **'Gizli dosyaları göster'**
  String get npFormShowHidden;

  /// No description provided for @npFormShowHiddenHint.
  ///
  /// In tr, this message translates to:
  /// **'Noktayla başlayan dosya ve klasörler (.env, .htaccess, .git…)'**
  String get npFormShowHiddenHint;

  /// No description provided for @npFormExclude.
  ///
  /// In tr, this message translates to:
  /// **'Ağaçta gösterme'**
  String get npFormExclude;

  /// No description provided for @npFormExcludeHint.
  ///
  /// In tr, this message translates to:
  /// **'Virgülle ayrılmış adlar ya da kalıplar; * ve ? kullanılabilir.'**
  String get npFormExcludeHint;

  /// No description provided for @npFormEditorMode.
  ///
  /// In tr, this message translates to:
  /// **'Editör ayarları'**
  String get npFormEditorMode;

  /// No description provided for @npFormEdGlobal.
  ///
  /// In tr, this message translates to:
  /// **'Genel editör ayarlarını kullan (Ayarlar › Editör)'**
  String get npFormEdGlobal;

  /// No description provided for @npFormEdCustom.
  ///
  /// In tr, this message translates to:
  /// **'Bu bağlantıya özel ayarlar kullan'**
  String get npFormEdCustom;

  /// No description provided for @npFormTest.
  ///
  /// In tr, this message translates to:
  /// **'Bağlantıyı dene'**
  String get npFormTest;

  /// No description provided for @npFormSaveOpen.
  ///
  /// In tr, this message translates to:
  /// **'Kaydet ve aç'**
  String get npFormSaveOpen;

  /// No description provided for @npFormConnecting.
  ///
  /// In tr, this message translates to:
  /// **'Bağlanılıyor…'**
  String get npFormConnecting;

  /// No description provided for @npFormTestOk.
  ///
  /// In tr, this message translates to:
  /// **'Bağlantı başarılı'**
  String get npFormTestOk;

  /// No description provided for @npFormTestFail.
  ///
  /// In tr, this message translates to:
  /// **'Bağlantı kurulamadı'**
  String get npFormTestFail;

  /// No description provided for @npFormHomeDir.
  ///
  /// In tr, this message translates to:
  /// **'Giriş klasörü: {dir}'**
  String npFormHomeDir(String dir);

  /// No description provided for @npFormRootMissing.
  ///
  /// In tr, this message translates to:
  /// **'Uyarı: proje klasörü açılamadı.'**
  String get npFormRootMissing;

  /// No description provided for @npFormHostKey.
  ///
  /// In tr, this message translates to:
  /// **'SSH host anahtarı (SHA256): {fp}'**
  String npFormHostKey(String fp);

  /// No description provided for @npFormSaved.
  ///
  /// In tr, this message translates to:
  /// **'Bağlantı kaydedildi'**
  String get npFormSaved;

  /// No description provided for @npFormChangesSaved.
  ///
  /// In tr, this message translates to:
  /// **'Değişiklikler kaydedildi'**
  String get npFormChangesSaved;

  /// No description provided for @npTypeProtocol.
  ///
  /// In tr, this message translates to:
  /// **'Protokol'**
  String get npTypeProtocol;

  /// No description provided for @npTypeFtp.
  ///
  /// In tr, this message translates to:
  /// **'FTP (standart)'**
  String get npTypeFtp;

  /// No description provided for @npTypeFtpsImplicit.
  ///
  /// In tr, this message translates to:
  /// **'FTPS — TLS/SSL Implicit (port 990)'**
  String get npTypeFtpsImplicit;

  /// No description provided for @npTypeFtpsSsl.
  ///
  /// In tr, this message translates to:
  /// **'FTPS — Explicit (AUTH SSL)'**
  String get npTypeFtpsSsl;

  /// No description provided for @npTypeFtpsTls.
  ///
  /// In tr, this message translates to:
  /// **'FTPS — Explicit (AUTH TLS)'**
  String get npTypeFtpsTls;

  /// No description provided for @npTypeSftp.
  ///
  /// In tr, this message translates to:
  /// **'SFTP — SSH2'**
  String get npTypeSftp;

  /// No description provided for @npTypeNoteFtp.
  ///
  /// In tr, this message translates to:
  /// **'Standart FTP; şifre ve dosyalar şifrelenmeden (düz metin) gönderilir.'**
  String get npTypeNoteFtp;

  /// No description provided for @npTypeNoteFtpsImplicit.
  ///
  /// In tr, this message translates to:
  /// **'Bağlantı en baştan TLS/SSL ile şifrelenir (genellikle port 990).'**
  String get npTypeNoteFtpsImplicit;

  /// No description provided for @npTypeNoteFtpsSsl.
  ///
  /// In tr, this message translates to:
  /// **'Düz FTP ile bağlanıp AUTH SSL komutuyla şifreli oturuma geçilir.'**
  String get npTypeNoteFtpsSsl;

  /// No description provided for @npTypeNoteFtpsTls.
  ///
  /// In tr, this message translates to:
  /// **'Düz FTP ile bağlanıp AUTH TLS komutuyla şifreli oturuma geçilir (en yaygın FTPS türü).'**
  String get npTypeNoteFtpsTls;

  /// No description provided for @npTypeNoteSftp.
  ///
  /// In tr, this message translates to:
  /// **'SSH üzerinden şifreli dosya erişimi (port 22). Sunucu host anahtarı ilk bağlantıda kaydedilir.'**
  String get npTypeNoteSftp;

  /// No description provided for @npOptEncoding.
  ///
  /// In tr, this message translates to:
  /// **'Dosya adı kodlaması'**
  String get npOptEncoding;

  /// No description provided for @npOptEncAuto.
  ///
  /// In tr, this message translates to:
  /// **'Otomatik'**
  String get npOptEncAuto;

  /// No description provided for @npEdSecEncoding.
  ///
  /// In tr, this message translates to:
  /// **'Kodlama ve satır sonu'**
  String get npEdSecEncoding;

  /// No description provided for @npEdEncoding.
  ///
  /// In tr, this message translates to:
  /// **'Dosyaları açarken kodlama'**
  String get npEdEncoding;

  /// No description provided for @npEdEncAuto.
  ///
  /// In tr, this message translates to:
  /// **'Otomatik algıla (BOM / UTF-8)'**
  String get npEdEncAuto;

  /// No description provided for @npEdFallback.
  ///
  /// In tr, this message translates to:
  /// **'UTF-8 değilse (ANSI)'**
  String get npEdFallback;

  /// No description provided for @npEdEol.
  ///
  /// In tr, this message translates to:
  /// **'Satır sonu'**
  String get npEdEol;

  /// No description provided for @npEdEolAuto.
  ///
  /// In tr, this message translates to:
  /// **'Dosyanınkini koru'**
  String get npEdEolAuto;

  /// No description provided for @npEdEolConvert.
  ///
  /// In tr, this message translates to:
  /// **'Açarken {eol} biçimine çevir'**
  String npEdEolConvert(String eol);

  /// No description provided for @npEdNewDoc.
  ///
  /// In tr, this message translates to:
  /// **'Yeni dosya: kodlama · satır sonu'**
  String get npEdNewDoc;

  /// No description provided for @npEdSecIndent.
  ///
  /// In tr, this message translates to:
  /// **'Girinti ve dil'**
  String get npEdSecIndent;

  /// No description provided for @npEdTabSize.
  ///
  /// In tr, this message translates to:
  /// **'Sekme genişliği'**
  String get npEdTabSize;

  /// No description provided for @npEdLanguage.
  ///
  /// In tr, this message translates to:
  /// **'Dil (sözdizimi)'**
  String get npEdLanguage;

  /// No description provided for @npEdLangAuto.
  ///
  /// In tr, this message translates to:
  /// **'Otomatik (uzantı / ilk satır)'**
  String get npEdLangAuto;

  /// No description provided for @npEdInsertSpaces.
  ///
  /// In tr, this message translates to:
  /// **'Sekme yerine boşluk kullan'**
  String get npEdInsertSpaces;

  /// No description provided for @npEdDetectIndent.
  ///
  /// In tr, this message translates to:
  /// **'Girintiyi dosyadan algıla'**
  String get npEdDetectIndent;

  /// No description provided for @npEdDetectIndentHint.
  ///
  /// In tr, this message translates to:
  /// **'Dosya sekme kullanıyorsa sekmeyle devam eder.'**
  String get npEdDetectIndentHint;

  /// No description provided for @npEdAutoIndent.
  ///
  /// In tr, this message translates to:
  /// **'Otomatik girinti'**
  String get npEdAutoIndent;

  /// No description provided for @npEdAutoClose.
  ///
  /// In tr, this message translates to:
  /// **'Parantez ve tırnakları otomatik kapat'**
  String get npEdAutoClose;

  /// No description provided for @npEdSecLook.
  ///
  /// In tr, this message translates to:
  /// **'Görünüm'**
  String get npEdSecLook;

  /// No description provided for @npEdTheme.
  ///
  /// In tr, this message translates to:
  /// **'Renk teması'**
  String get npEdTheme;

  /// No description provided for @npEdThemeAuto.
  ///
  /// In tr, this message translates to:
  /// **'Otomatik (uygulama temasına göre)'**
  String get npEdThemeAuto;

  /// No description provided for @npEdWhitespace.
  ///
  /// In tr, this message translates to:
  /// **'Boşluk ve sekmeleri göster'**
  String get npEdWhitespace;

  /// No description provided for @npEdWsNone.
  ///
  /// In tr, this message translates to:
  /// **'Gösterme'**
  String get npEdWsNone;

  /// No description provided for @npEdWsBoundary.
  ///
  /// In tr, this message translates to:
  /// **'Sözcük aralarındakiler hariç'**
  String get npEdWsBoundary;

  /// No description provided for @npEdWsTrailing.
  ///
  /// In tr, this message translates to:
  /// **'Yalnız satır sonundakiler'**
  String get npEdWsTrailing;

  /// No description provided for @npEdWsAll.
  ///
  /// In tr, this message translates to:
  /// **'Tümü'**
  String get npEdWsAll;

  /// No description provided for @npEdFont.
  ///
  /// In tr, this message translates to:
  /// **'Yazı tipi'**
  String get npEdFont;

  /// No description provided for @npEdFontSize.
  ///
  /// In tr, this message translates to:
  /// **'Boyut'**
  String get npEdFontSize;

  /// No description provided for @npEdRulers.
  ///
  /// In tr, this message translates to:
  /// **'Kenar çizgileri'**
  String get npEdRulers;

  /// No description provided for @npEdWordWrap.
  ///
  /// In tr, this message translates to:
  /// **'Satır kaydır'**
  String get npEdWordWrap;

  /// No description provided for @npEdLineNumbers.
  ///
  /// In tr, this message translates to:
  /// **'Satır numaraları'**
  String get npEdLineNumbers;

  /// No description provided for @npEdHighlightLine.
  ///
  /// In tr, this message translates to:
  /// **'Geçerli satırı vurgula'**
  String get npEdHighlightLine;

  /// No description provided for @npEdSmartHighlight.
  ///
  /// In tr, this message translates to:
  /// **'Akıllı vurgulama (aynı sözcükler)'**
  String get npEdSmartHighlight;

  /// No description provided for @npEdIndentGuides.
  ///
  /// In tr, this message translates to:
  /// **'Girinti kılavuzları'**
  String get npEdIndentGuides;

  /// No description provided for @npEdFolding.
  ///
  /// In tr, this message translates to:
  /// **'Kod katlama'**
  String get npEdFolding;

  /// No description provided for @npEdBracketColors.
  ///
  /// In tr, this message translates to:
  /// **'Parantez çiftlerini renklendir'**
  String get npEdBracketColors;

  /// No description provided for @npEdMinimap.
  ///
  /// In tr, this message translates to:
  /// **'Mini harita (belge haritası)'**
  String get npEdMinimap;

  /// No description provided for @npEdControlChars.
  ///
  /// In tr, this message translates to:
  /// **'Görünmez karakterleri göster'**
  String get npEdControlChars;

  /// No description provided for @npEdSecSave.
  ///
  /// In tr, this message translates to:
  /// **'Kaydetme'**
  String get npEdSecSave;

  /// No description provided for @npEdTrimTrailing.
  ///
  /// In tr, this message translates to:
  /// **'Kaydederken satır sonu boşluklarını sil'**
  String get npEdTrimTrailing;

  /// No description provided for @npEdFinalNewline.
  ///
  /// In tr, this message translates to:
  /// **'Dosya sonuna satır sonu ekle'**
  String get npEdFinalNewline;

  /// No description provided for @npEdCheckRemote.
  ///
  /// In tr, this message translates to:
  /// **'Kaydetmeden önce değişiklik kontrolü'**
  String get npEdCheckRemote;

  /// No description provided for @npEdCheckRemoteHint.
  ///
  /// In tr, this message translates to:
  /// **'Dosya açıldıktan sonra sunucuda başkası değiştirdiyse sorar.'**
  String get npEdCheckRemoteHint;

  /// No description provided for @npEdAutoSave.
  ///
  /// In tr, this message translates to:
  /// **'Otomatik kaydet'**
  String get npEdAutoSave;

  /// No description provided for @npEdSec.
  ///
  /// In tr, this message translates to:
  /// **'sn'**
  String get npEdSec;

  /// No description provided for @npEdAutoSaveHint.
  ///
  /// In tr, this message translates to:
  /// **'0 = kapalı. Açıkken değişiklikten bu kadar sonra kaydedilip sunucuya yüklenir.'**
  String get npEdAutoSaveHint;

  /// No description provided for @npMainBalloonTitle.
  ///
  /// In tr, this message translates to:
  /// **'Notepad Master arka planda çalışıyor'**
  String get npMainBalloonTitle;

  /// No description provided for @npMainBalloonBody.
  ///
  /// In tr, this message translates to:
  /// **'Tekrar açmak için tepsideki simgeye tıklayın.'**
  String get npMainBalloonBody;

  /// No description provided for @npMainTrayShow.
  ///
  /// In tr, this message translates to:
  /// **'Notepad Master’ı göster'**
  String get npMainTrayShow;

  /// No description provided for @npMainTrayQuick.
  ///
  /// In tr, this message translates to:
  /// **'Hızlı aç'**
  String get npMainTrayQuick;

  /// No description provided for @npMainTrayNone.
  ///
  /// In tr, this message translates to:
  /// **'Kayıtlı bağlantı yok'**
  String get npMainTrayNone;

  /// No description provided for @npMainTrayQuit.
  ///
  /// In tr, this message translates to:
  /// **'Çıkış'**
  String get npMainTrayQuit;

  /// No description provided for @npProjToggleTree.
  ///
  /// In tr, this message translates to:
  /// **'Klasör ağacını aç/kapat (Ctrl+B)'**
  String get npProjToggleTree;

  /// No description provided for @npProjReconnect.
  ///
  /// In tr, this message translates to:
  /// **'Yeniden bağlan'**
  String get npProjReconnect;

  /// No description provided for @npProjReconnected.
  ///
  /// In tr, this message translates to:
  /// **'Yeniden bağlanıldı'**
  String get npProjReconnected;

  /// No description provided for @npProjConnectFail.
  ///
  /// In tr, this message translates to:
  /// **'Bağlanılamadı'**
  String get npProjConnectFail;

  /// No description provided for @npProjStatusOn.
  ///
  /// In tr, this message translates to:
  /// **'Bağlı'**
  String get npProjStatusOn;

  /// No description provided for @npProjStatusOff.
  ///
  /// In tr, this message translates to:
  /// **'Bağlantı yok'**
  String get npProjStatusOff;

  /// No description provided for @npProjStatusConnecting.
  ///
  /// In tr, this message translates to:
  /// **'Bağlanılıyor…'**
  String get npProjStatusConnecting;

  /// No description provided for @npProjSave.
  ///
  /// In tr, this message translates to:
  /// **'Kaydet'**
  String get npProjSave;

  /// No description provided for @npProjSaveAll.
  ///
  /// In tr, this message translates to:
  /// **'Tümünü kaydet'**
  String get npProjSaveAll;

  /// No description provided for @npProjUndo.
  ///
  /// In tr, this message translates to:
  /// **'Geri al'**
  String get npProjUndo;

  /// No description provided for @npProjRedo.
  ///
  /// In tr, this message translates to:
  /// **'Yinele'**
  String get npProjRedo;

  /// No description provided for @npProjFind.
  ///
  /// In tr, this message translates to:
  /// **'Bul'**
  String get npProjFind;

  /// No description provided for @npProjReplace.
  ///
  /// In tr, this message translates to:
  /// **'Değiştir'**
  String get npProjReplace;

  /// No description provided for @npProjGoto.
  ///
  /// In tr, this message translates to:
  /// **'Satıra git'**
  String get npProjGoto;

  /// No description provided for @npProjShowWs.
  ///
  /// In tr, this message translates to:
  /// **'Boşluk ve sekmeleri göster'**
  String get npProjShowWs;

  /// No description provided for @npProjZoomIn.
  ///
  /// In tr, this message translates to:
  /// **'Yakınlaştır'**
  String get npProjZoomIn;

  /// No description provided for @npProjZoomOut.
  ///
  /// In tr, this message translates to:
  /// **'Uzaklaştır'**
  String get npProjZoomOut;

  /// No description provided for @npProjShowCache.
  ///
  /// In tr, this message translates to:
  /// **'Çalışma kopyasını göster'**
  String get npProjShowCache;

  /// No description provided for @npProjPalette.
  ///
  /// In tr, this message translates to:
  /// **'Komut paleti'**
  String get npProjPalette;

  /// No description provided for @npProjCloseTab.
  ///
  /// In tr, this message translates to:
  /// **'Kapat'**
  String get npProjCloseTab;

  /// No description provided for @npProjCloseOthers.
  ///
  /// In tr, this message translates to:
  /// **'Diğerlerini kapat'**
  String get npProjCloseOthers;

  /// No description provided for @npProjCloseAll.
  ///
  /// In tr, this message translates to:
  /// **'Tümünü kapat'**
  String get npProjCloseAll;

  /// No description provided for @npProjReload.
  ///
  /// In tr, this message translates to:
  /// **'Yeniden yükle'**
  String get npProjReload;

  /// No description provided for @npProjReloadMsg.
  ///
  /// In tr, this message translates to:
  /// **'<b>{name}</b> içindeki kaydedilmemiş değişiklikler kaybolacak. Dosya yeniden yüklensin mi?'**
  String npProjReloadMsg(String name);

  /// No description provided for @npProjRevealTree.
  ///
  /// In tr, this message translates to:
  /// **'Ağaçta göster'**
  String get npProjRevealTree;

  /// No description provided for @npProjUnsavedTitle.
  ///
  /// In tr, this message translates to:
  /// **'Kaydedilmemiş değişiklikler'**
  String get npProjUnsavedTitle;

  /// No description provided for @npProjUnsavedMsg.
  ///
  /// In tr, this message translates to:
  /// **'<b>{name}</b> dosyasındaki değişiklikler kaydedilsin mi?'**
  String npProjUnsavedMsg(String name);

  /// No description provided for @npProjDontSave.
  ///
  /// In tr, this message translates to:
  /// **'Kaydetme'**
  String get npProjDontSave;

  /// No description provided for @npProjOpenFail.
  ///
  /// In tr, this message translates to:
  /// **'{name} açılamadı'**
  String npProjOpenFail(String name);

  /// No description provided for @npProjTooLarge.
  ///
  /// In tr, this message translates to:
  /// **'{name} çok büyük ({size}); en fazla 50 MB açılabilir.'**
  String npProjTooLarge(String name, String size);

  /// No description provided for @npProjBinary.
  ///
  /// In tr, this message translates to:
  /// **'{name} metin dosyası değil (ikili); editörde açılmadı.'**
  String npProjBinary(String name);

  /// No description provided for @npProjSaveFail.
  ///
  /// In tr, this message translates to:
  /// **'{name} kaydedilemedi'**
  String npProjSaveFail(String name);

  /// No description provided for @npProjSaved.
  ///
  /// In tr, this message translates to:
  /// **'{name} kaydedildi'**
  String npProjSaved(String name);

  /// No description provided for @npProjSavedRemote.
  ///
  /// In tr, this message translates to:
  /// **'{name} kaydedildi ve yüklendi'**
  String npProjSavedRemote(String name);

  /// No description provided for @npProjLossyTitle.
  ///
  /// In tr, this message translates to:
  /// **'Kodlama uyarısı'**
  String get npProjLossyTitle;

  /// No description provided for @npProjLossyMsg.
  ///
  /// In tr, this message translates to:
  /// **'Metindeki bazı karakterler <b>{enc}</b> kodlamasında saklanamıyor ve “?” olarak kaydedilecek. Durum çubuğundan UTF-8’e çevirmeniz önerilir.'**
  String npProjLossyMsg(String enc);

  /// No description provided for @npProjSaveAnyway.
  ///
  /// In tr, this message translates to:
  /// **'Yine de kaydet'**
  String get npProjSaveAnyway;

  /// No description provided for @npProjConflictTitle.
  ///
  /// In tr, this message translates to:
  /// **'Dosya başka yerde değişmiş'**
  String get npProjConflictTitle;

  /// No description provided for @npProjConflictMsg.
  ///
  /// In tr, this message translates to:
  /// **'<b>{name}</b> siz açtıktan sonra sunucuda değiştirilmiş. Ne yapılsın?'**
  String npProjConflictMsg(String name);

  /// No description provided for @npProjConflictOverwrite.
  ///
  /// In tr, this message translates to:
  /// **'Üzerine yaz'**
  String get npProjConflictOverwrite;

  /// No description provided for @npProjConflictReload.
  ///
  /// In tr, this message translates to:
  /// **'Sunucudakini yükle'**
  String get npProjConflictReload;

  /// No description provided for @npProjConflictAuto.
  ///
  /// In tr, this message translates to:
  /// **'{name} sunucuda değişmiş; otomatik kaydetme yapılmadı.'**
  String npProjConflictAuto(String name);

  /// No description provided for @npProjPos.
  ///
  /// In tr, this message translates to:
  /// **'Sat {ln}, Süt {col}'**
  String npProjPos(String col, String ln);

  /// No description provided for @npProjSel.
  ///
  /// In tr, this message translates to:
  /// **'{n} seçili'**
  String npProjSel(String n);

  /// No description provided for @npProjSpaces.
  ///
  /// In tr, this message translates to:
  /// **'Boşluk: {n}'**
  String npProjSpaces(String n);

  /// No description provided for @npProjTabWidth.
  ///
  /// In tr, this message translates to:
  /// **'Sekme: {n}'**
  String npProjTabWidth(String n);

  /// No description provided for @npProjIndentToSpaces.
  ///
  /// In tr, this message translates to:
  /// **'Girintiyi boşluğa çevir'**
  String get npProjIndentToSpaces;

  /// No description provided for @npProjIndentToTabs.
  ///
  /// In tr, this message translates to:
  /// **'Girintiyi sekmeye çevir'**
  String get npProjIndentToTabs;

  /// No description provided for @npProjEncTitle.
  ///
  /// In tr, this message translates to:
  /// **'Kodlama: {name}'**
  String npProjEncTitle(String name);

  /// No description provided for @npProjEncConvert.
  ///
  /// In tr, this message translates to:
  /// **'Bu kodlamaya çevir (kaydedince)'**
  String get npProjEncConvert;

  /// No description provided for @npProjEncConvertHint.
  ///
  /// In tr, this message translates to:
  /// **'Metin aynı kalır; dosya kaydedilirken seçilen kodlamayla yazılır.'**
  String get npProjEncConvertHint;

  /// No description provided for @npProjEncReopen.
  ///
  /// In tr, this message translates to:
  /// **'Bu kodlamayla yeniden aç'**
  String get npProjEncReopen;

  /// No description provided for @npProjEncReopenHint.
  ///
  /// In tr, this message translates to:
  /// **'Karakterler bozuk görünüyorsa dosyayı doğru kodlamayla yeniden okuyun.'**
  String get npProjEncReopenHint;

  /// No description provided for @npProjEolTo.
  ///
  /// In tr, this message translates to:
  /// **'{eol} biçimine çevir'**
  String npProjEolTo(String eol);

  /// No description provided for @npProjLangTitle.
  ///
  /// In tr, this message translates to:
  /// **'Dil seçin'**
  String get npProjLangTitle;

  /// No description provided for @npProjLangSearch.
  ///
  /// In tr, this message translates to:
  /// **'Dil ara…'**
  String get npProjLangSearch;

  /// No description provided for @npProjCacheCopy.
  ///
  /// In tr, this message translates to:
  /// **'Çalışma kopyası'**
  String get npProjCacheCopy;

  /// No description provided for @npProjInitFail.
  ///
  /// In tr, this message translates to:
  /// **'Proje penceresi başlatılamadı'**
  String get npProjInitFail;

  /// No description provided for @npProjEmptyHint.
  ///
  /// In tr, this message translates to:
  /// **'Soldaki ağaçta bir dosyaya çift tıklayın; dosya diline uygun renklendirmeyle burada sekme olarak açılır.'**
  String get npProjEmptyHint;

  /// No description provided for @npProjEmptyFile.
  ///
  /// In tr, this message translates to:
  /// **'Dosya açılıyor…'**
  String get npProjEmptyFile;

  /// No description provided for @npTreeNewFile.
  ///
  /// In tr, this message translates to:
  /// **'Yeni dosya'**
  String get npTreeNewFile;

  /// No description provided for @npTreeFileName.
  ///
  /// In tr, this message translates to:
  /// **'Dosya adı'**
  String get npTreeFileName;

  /// No description provided for @npTreeBadName.
  ///
  /// In tr, this message translates to:
  /// **'Geçersiz ad'**
  String get npTreeBadName;

  /// No description provided for @npTreeCreateFail.
  ///
  /// In tr, this message translates to:
  /// **'Oluşturulamadı'**
  String get npTreeCreateFail;

  /// No description provided for @npTreeRenameFail.
  ///
  /// In tr, this message translates to:
  /// **'Yeniden adlandırılamadı'**
  String get npTreeRenameFail;

  /// No description provided for @npTreeRenameDirty.
  ///
  /// In tr, this message translates to:
  /// **'Önce bu klasördeki açık dosyaları kaydedin.'**
  String get npTreeRenameDirty;

  /// No description provided for @npTreeDeleteTitle.
  ///
  /// In tr, this message translates to:
  /// **'Sil'**
  String get npTreeDeleteTitle;

  /// No description provided for @npTreeDeleteMsg.
  ///
  /// In tr, this message translates to:
  /// **'<b>{name}</b> dosyası silinsin mi?'**
  String npTreeDeleteMsg(String name);

  /// No description provided for @npTreeDeleteDirMsg.
  ///
  /// In tr, this message translates to:
  /// **'<b>{name}</b> klasörü ve içindeki her şey silinsin mi?'**
  String npTreeDeleteDirMsg(String name);

  /// No description provided for @npTreeDeleteFail.
  ///
  /// In tr, this message translates to:
  /// **'Silinemedi'**
  String get npTreeDeleteFail;

  /// No description provided for @npTreeTrashNote.
  ///
  /// In tr, this message translates to:
  /// **'Yerel dosyalar Geri Dönüşüm Kutusu’na taşınır.'**
  String get npTreeTrashNote;

  /// No description provided for @npTreeEmpty.
  ///
  /// In tr, this message translates to:
  /// **'Boş klasör'**
  String get npTreeEmpty;

  /// No description provided for @npTreeCollapseAll.
  ///
  /// In tr, this message translates to:
  /// **'Tümünü daralt'**
  String get npTreeCollapseAll;

  /// No description provided for @npTreeShowExplorer.
  ///
  /// In tr, this message translates to:
  /// **'Gezgin’de göster'**
  String get npTreeShowExplorer;

  /// No description provided for @npTreeUp.
  ///
  /// In tr, this message translates to:
  /// **'Üst klasör'**
  String get npTreeUp;

  /// No description provided for @npTreeHome.
  ///
  /// In tr, this message translates to:
  /// **'Giriş klasörü'**
  String get npTreeHome;

  /// No description provided for @npMainErrAuth.
  ///
  /// In tr, this message translates to:
  /// **'Giriş başarısız: kullanıcı adı veya şifre hatalı.'**
  String get npMainErrAuth;

  /// No description provided for @npMainErrRefused.
  ///
  /// In tr, this message translates to:
  /// **'Bağlantı reddedildi: port kapalı veya sunucu çalışmıyor.'**
  String get npMainErrRefused;

  /// No description provided for @npMainErrTimeout.
  ///
  /// In tr, this message translates to:
  /// **'Zaman aşımı: sunucuya ulaşılamadı.'**
  String get npMainErrTimeout;

  /// No description provided for @npMainErrDns.
  ///
  /// In tr, this message translates to:
  /// **'Sunucu adresi çözümlenemedi (DNS).'**
  String get npMainErrDns;

  /// No description provided for @npMainErrUnreach.
  ///
  /// In tr, this message translates to:
  /// **'Sunucuya ağ üzerinden erişilemiyor.'**
  String get npMainErrUnreach;

  /// No description provided for @npMainErrReset.
  ///
  /// In tr, this message translates to:
  /// **'Sunucu bağlantıyı kapattı.'**
  String get npMainErrReset;

  /// No description provided for @npMainErrNotFound.
  ///
  /// In tr, this message translates to:
  /// **'Dosya veya klasör bulunamadı.'**
  String get npMainErrNotFound;

  /// No description provided for @npMainErrPerm.
  ///
  /// In tr, this message translates to:
  /// **'Erişim izni yok.'**
  String get npMainErrPerm;

  /// No description provided for @npMainErrExists.
  ///
  /// In tr, this message translates to:
  /// **'Bu adda bir dosya veya klasör zaten var.'**
  String get npMainErrExists;

  /// No description provided for @npMainErr550.
  ///
  /// In tr, this message translates to:
  /// **'Sunucu işlemi reddetti (550): {msg}'**
  String npMainErr550(String msg);

  /// No description provided for @npMainErr553.
  ///
  /// In tr, this message translates to:
  /// **'Dosya adı sunucu tarafından kabul edilmedi (553).'**
  String get npMainErr553;

  /// No description provided for @npMainErrTls.
  ///
  /// In tr, this message translates to:
  /// **'TLS/SSL hatası — protokolü veya portu kontrol edin. ({msg})'**
  String npMainErrTls(String msg);

  /// No description provided for @npMainErrHostKey.
  ///
  /// In tr, this message translates to:
  /// **'Sunucunun host anahtarı değişmiş! Kayıtlı: {oldVal}, gelen: {newVal}. Güvenlik için bağlantı reddedildi.'**
  String npMainErrHostKey(String newVal, String oldVal);

  /// No description provided for @npMainErrNoKey.
  ///
  /// In tr, this message translates to:
  /// **'Özel anahtar dosyası okunamadı.'**
  String get npMainErrNoKey;

  /// No description provided for @npMainErrKey.
  ///
  /// In tr, this message translates to:
  /// **'Özel anahtar okunamadı: parola yanlış ya da biçim desteklenmiyor.'**
  String get npMainErrKey;

  /// No description provided for @npMainErrNoLocal.
  ///
  /// In tr, this message translates to:
  /// **'Klasör ya da dosya bu bilgisayarda bulunamadı. Ana pencerede kartın menüsünden yolu değiştirin.'**
  String get npMainErrNoLocal;

  /// No description provided for @npMainErrConnNotFound.
  ///
  /// In tr, this message translates to:
  /// **'Bağlantı bulunamadı'**
  String get npMainErrConnNotFound;

  /// No description provided for @npMainErrNoSession.
  ///
  /// In tr, this message translates to:
  /// **'Bağlı değil'**
  String get npMainErrNoSession;

  /// No description provided for @npMainErrHost.
  ///
  /// In tr, this message translates to:
  /// **'Sunucu adresi gerekli.'**
  String get npMainErrHost;

  /// No description provided for @npMainErrUser.
  ///
  /// In tr, this message translates to:
  /// **'Kullanıcı adı gerekli (veya Anonim girişi seçin).'**
  String get npMainErrUser;

  /// No description provided for @npMainPickKey.
  ///
  /// In tr, this message translates to:
  /// **'Özel anahtar dosyası seçin'**
  String get npMainPickKey;

  /// No description provided for @npMainCopySuffix.
  ///
  /// In tr, this message translates to:
  /// **' (kopya)'**
  String get npMainCopySuffix;

  /// No description provided for @npMainCloseDirty.
  ///
  /// In tr, this message translates to:
  /// **'Kaydedilmemiş dosyalar var. Pencere kapatılırsa değişiklikler kaybolacak.'**
  String get npMainCloseDirty;

  /// No description provided for @npMainCloseDiscard.
  ///
  /// In tr, this message translates to:
  /// **'Kaydetmeden kapat'**
  String get npMainCloseDiscard;

  /// No description provided for @ipAppNewFolder.
  ///
  /// In tr, this message translates to:
  /// **'Yeni klasör'**
  String get ipAppNewFolder;

  /// No description provided for @ipAppNewRecord.
  ///
  /// In tr, this message translates to:
  /// **'Yeni kayıt'**
  String get ipAppNewRecord;

  /// No description provided for @ipAppSearchPh.
  ///
  /// In tr, this message translates to:
  /// **'Kayıt, IP, ad, MAC ya da servis ara…'**
  String get ipAppSearchPh;

  /// No description provided for @ipAppStats.
  ///
  /// In tr, this message translates to:
  /// **'{n} kayıt'**
  String ipAppStats(String n);

  /// No description provided for @ipColIp.
  ///
  /// In tr, this message translates to:
  /// **'IP'**
  String get ipColIp;

  /// No description provided for @ipColMac.
  ///
  /// In tr, this message translates to:
  /// **'MAC'**
  String get ipColMac;

  /// No description provided for @ipColName.
  ///
  /// In tr, this message translates to:
  /// **'Ad'**
  String get ipColName;

  /// No description provided for @ipColRtt.
  ///
  /// In tr, this message translates to:
  /// **'Yanıt'**
  String get ipColRtt;

  /// No description provided for @ipColServices.
  ///
  /// In tr, this message translates to:
  /// **'Servisler'**
  String get ipColServices;

  /// No description provided for @ipColStatus.
  ///
  /// In tr, this message translates to:
  /// **'Durum'**
  String get ipColStatus;

  /// No description provided for @ipColVendor.
  ///
  /// In tr, this message translates to:
  /// **'Üretici'**
  String get ipColVendor;

  /// No description provided for @ipCtxCopyIp.
  ///
  /// In tr, this message translates to:
  /// **'IP adresini kopyala'**
  String get ipCtxCopyIp;

  /// No description provided for @ipCtxCopyMac.
  ///
  /// In tr, this message translates to:
  /// **'MAC adresini kopyala'**
  String get ipCtxCopyMac;

  /// No description provided for @ipCtxCopyName.
  ///
  /// In tr, this message translates to:
  /// **'Adı kopyala'**
  String get ipCtxCopyName;

  /// No description provided for @ipCtxCopyRange.
  ///
  /// In tr, this message translates to:
  /// **'Aralığı kopyala'**
  String get ipCtxCopyRange;

  /// No description provided for @ipCtxOpenWeb.
  ///
  /// In tr, this message translates to:
  /// **'Tarayıcıda aç'**
  String get ipCtxOpenWeb;

  /// No description provided for @ipFolderDeleteMsg.
  ///
  /// In tr, this message translates to:
  /// **'“{name}” klasörü silinecek; içindeki kayıtlar ve klasörler üst klasöre taşınır.'**
  String ipFolderDeleteMsg(String name);

  /// No description provided for @ipFolderEmpty.
  ///
  /// In tr, this message translates to:
  /// **'Boş klasör'**
  String get ipFolderEmpty;

  /// No description provided for @ipFolderName.
  ///
  /// In tr, this message translates to:
  /// **'Klasör adı'**
  String get ipFolderName;

  /// No description provided for @ipFolderRename.
  ///
  /// In tr, this message translates to:
  /// **'Klasörü yeniden adlandır'**
  String get ipFolderRename;

  /// No description provided for @ipHostAlive.
  ///
  /// In tr, this message translates to:
  /// **'Canlılık'**
  String get ipHostAlive;

  /// No description provided for @ipHostBanner.
  ///
  /// In tr, this message translates to:
  /// **'Karşılama'**
  String get ipHostBanner;

  /// No description provided for @ipHostCert.
  ///
  /// In tr, this message translates to:
  /// **'Sertifika'**
  String get ipHostCert;

  /// No description provided for @ipHostCertExpires.
  ///
  /// In tr, this message translates to:
  /// **'Geçerlilik sonu'**
  String get ipHostCertExpires;

  /// No description provided for @ipHostCertIssuer.
  ///
  /// In tr, this message translates to:
  /// **'Veren'**
  String get ipHostCertIssuer;

  /// No description provided for @ipHostDetails.
  ///
  /// In tr, this message translates to:
  /// **'Ayrıntılar'**
  String get ipHostDetails;

  /// No description provided for @ipHostLocalMac.
  ///
  /// In tr, this message translates to:
  /// **'özel adres'**
  String get ipHostLocalMac;

  /// No description provided for @ipHostNoServices.
  ///
  /// In tr, this message translates to:
  /// **'Listedeki portlardan hiçbiri açık değil.'**
  String get ipHostNoServices;

  /// No description provided for @ipHostSelfSigned.
  ///
  /// In tr, this message translates to:
  /// **'kendinden imzalı'**
  String get ipHostSelfSigned;

  /// No description provided for @ipHostServer.
  ///
  /// In tr, this message translates to:
  /// **'Sunucu'**
  String get ipHostServer;

  /// No description provided for @ipHostTitle.
  ///
  /// In tr, this message translates to:
  /// **'Başlık'**
  String get ipHostTitle;

  /// No description provided for @ipHostUnknown.
  ///
  /// In tr, this message translates to:
  /// **'(ad çözülemedi)'**
  String get ipHostUnknown;

  /// No description provided for @ipNoticeAccept.
  ///
  /// In tr, this message translates to:
  /// **'Anladım'**
  String get ipNoticeAccept;

  /// No description provided for @ipNoticeBody.
  ///
  /// In tr, this message translates to:
  /// **'IP Tools yalnız yerel ağınızı keşfeder: cihazları ping ile bulur, kısa bir port listesine bağlanmayı dener ve adlarını çözer. Yalnız sahibi olduğunuz ya da yetkili olduğunuz ağları tarayın.'**
  String get ipNoticeBody;

  /// No description provided for @ipNoticeLimits.
  ///
  /// In tr, this message translates to:
  /// **'Tasarım gereği yalnız özel adresler (10.x, 172.16–31.x, 192.168.x, 169.254.x) taranır; zafiyet denemesi, parola deneme ya da geniş port taraması yapılmaz.'**
  String get ipNoticeLimits;

  /// No description provided for @ipNoticeShort.
  ///
  /// In tr, this message translates to:
  /// **'Yalnız yetkili olduğunuz ağları tarayın'**
  String get ipNoticeShort;

  /// No description provided for @ipNoticeText.
  ///
  /// In tr, this message translates to:
  /// **'Yalnız sahibi olduğunuz ya da yetkili olduğunuz ağları tarayın.'**
  String get ipNoticeText;

  /// No description provided for @ipNoticeTitle.
  ///
  /// In tr, this message translates to:
  /// **'Yerel ağ keşfi'**
  String get ipNoticeTitle;

  /// No description provided for @ipPrivacyNote.
  ///
  /// In tr, this message translates to:
  /// **'Gizlilik: tarama sonuçları yalnız bu bilgisayarda saklanır ve hiçbir yere gönderilmez. Yalnız özel/yerel adresler taranır.'**
  String get ipPrivacyNote;

  /// No description provided for @ipRangeErrEmpty.
  ///
  /// In tr, this message translates to:
  /// **'Bir IP aralığı girin.'**
  String get ipRangeErrEmpty;

  /// No description provided for @ipRangeErrInvalid.
  ///
  /// In tr, this message translates to:
  /// **'Geçersiz adres ya da aralık: {token}'**
  String ipRangeErrInvalid(String token);

  /// No description provided for @ipRangeErrIpv6.
  ///
  /// In tr, this message translates to:
  /// **'IPv6 adresleri desteklenmiyor: {token}'**
  String ipRangeErrIpv6(String token);

  /// No description provided for @ipRangeErrNotPrivate.
  ///
  /// In tr, this message translates to:
  /// **'Yalnız özel/yerel adresler taranabilir (10.x, 172.16–31.x, 192.168.x, 169.254.x): {token}'**
  String ipRangeErrNotPrivate(String token);

  /// No description provided for @ipRangeErrReversed.
  ///
  /// In tr, this message translates to:
  /// **'Aralığın başlangıcı bitişinden büyük: {token}'**
  String ipRangeErrReversed(String token);

  /// No description provided for @ipRangeErrTooMany.
  ///
  /// In tr, this message translates to:
  /// **'Aralık çok geniş (en çok 65.536 adres, bir /16): {count}'**
  String ipRangeErrTooMany(String count);

  /// No description provided for @ipRangeOk.
  ///
  /// In tr, this message translates to:
  /// **'{n} adres taranacak'**
  String ipRangeOk(String n);

  /// No description provided for @ipRecColor.
  ///
  /// In tr, this message translates to:
  /// **'Renk'**
  String get ipRecColor;

  /// No description provided for @ipRecDeleteMsg.
  ///
  /// In tr, this message translates to:
  /// **'“{name}” kaydı ve bu bilgisayardaki tarama sonucu silinecek.'**
  String ipRecDeleteMsg(String name);

  /// No description provided for @ipRecDevices.
  ///
  /// In tr, this message translates to:
  /// **'{n} cihaz'**
  String ipRecDevices(String n);

  /// No description provided for @ipRecEdit.
  ///
  /// In tr, this message translates to:
  /// **'Kaydı düzenle'**
  String get ipRecEdit;

  /// No description provided for @ipRecFolder.
  ///
  /// In tr, this message translates to:
  /// **'Klasör'**
  String get ipRecFolder;

  /// No description provided for @ipRecItems.
  ///
  /// In tr, this message translates to:
  /// **'{n} öğe'**
  String ipRecItems(String n);

  /// No description provided for @ipRecLastScan.
  ///
  /// In tr, this message translates to:
  /// **'Son tarama: {time}'**
  String ipRecLastScan(String time);

  /// No description provided for @ipRecMove.
  ///
  /// In tr, this message translates to:
  /// **'Taşı'**
  String get ipRecMove;

  /// No description provided for @ipRecMoveTitle.
  ///
  /// In tr, this message translates to:
  /// **'Kaydı taşı'**
  String get ipRecMoveTitle;

  /// No description provided for @ipRecName.
  ///
  /// In tr, this message translates to:
  /// **'Ad'**
  String get ipRecName;

  /// No description provided for @ipRecNever.
  ///
  /// In tr, this message translates to:
  /// **'Henüz taranmadı'**
  String get ipRecNever;

  /// No description provided for @ipRecNewDevices.
  ///
  /// In tr, this message translates to:
  /// **'{n} yeni'**
  String ipRecNewDevices(String n);

  /// No description provided for @ipRecRange.
  ///
  /// In tr, this message translates to:
  /// **'IP aralığı'**
  String get ipRecRange;

  /// No description provided for @ipRecRangeHint.
  ///
  /// In tr, this message translates to:
  /// **'Örnekler: 192.168.1.0/24 · 192.168.1.1-192.168.1.255 · 10.0.0.5 · virgülle birden çok. En çok /16.'**
  String get ipRecRangeHint;

  /// No description provided for @ipRecRootFolder.
  ///
  /// In tr, this message translates to:
  /// **'Kayıtlar'**
  String get ipRecRootFolder;

  /// No description provided for @ipRecSaved.
  ///
  /// In tr, this message translates to:
  /// **'Kayıt kaydedildi'**
  String get ipRecSaved;

  /// No description provided for @ipScanBusy.
  ///
  /// In tr, this message translates to:
  /// **'Başka bir tarama sürüyor; önce onu durdurun.'**
  String get ipScanBusy;

  /// No description provided for @ipScanDone.
  ///
  /// In tr, this message translates to:
  /// **'Tarama bitti: {n} cihaz'**
  String ipScanDone(String n);

  /// No description provided for @ipScanEmptyBody.
  ///
  /// In tr, this message translates to:
  /// **'Tara düğmesine basın ya da karttaki ▶ simgesine tıklayın. Bulunan cihazlar burada listelenir.'**
  String get ipScanEmptyBody;

  /// No description provided for @ipScanEmptyTitle.
  ///
  /// In tr, this message translates to:
  /// **'Bu kayıt henüz taranmadı'**
  String get ipScanEmptyTitle;

  /// No description provided for @ipScanExport.
  ///
  /// In tr, this message translates to:
  /// **'Dışa aktar'**
  String get ipScanExport;

  /// No description provided for @ipScanExportCsv.
  ///
  /// In tr, this message translates to:
  /// **'CSV olarak kaydet…'**
  String get ipScanExportCsv;

  /// No description provided for @ipScanExportJson.
  ///
  /// In tr, this message translates to:
  /// **'JSON olarak kaydet…'**
  String get ipScanExportJson;

  /// No description provided for @ipScanExported.
  ///
  /// In tr, this message translates to:
  /// **'Dışa aktarıldı'**
  String get ipScanExported;

  /// No description provided for @ipScanFailed.
  ///
  /// In tr, this message translates to:
  /// **'Tarama yapılamadı: {msg}'**
  String ipScanFailed(String msg);

  /// No description provided for @ipScanFilter.
  ///
  /// In tr, this message translates to:
  /// **'Filtre'**
  String get ipScanFilter;

  /// No description provided for @ipScanFilterAll.
  ///
  /// In tr, this message translates to:
  /// **'Tümü'**
  String get ipScanFilterAll;

  /// No description provided for @ipScanFilterGone.
  ///
  /// In tr, this message translates to:
  /// **'Kaybolan'**
  String get ipScanFilterGone;

  /// No description provided for @ipScanFilterNew.
  ///
  /// In tr, this message translates to:
  /// **'Yeni'**
  String get ipScanFilterNew;

  /// No description provided for @ipScanFilterServices.
  ///
  /// In tr, this message translates to:
  /// **'Servisli'**
  String get ipScanFilterServices;

  /// No description provided for @ipScanFound.
  ///
  /// In tr, this message translates to:
  /// **'{n} cihaz bulundu'**
  String ipScanFound(String n);

  /// No description provided for @ipScanNoMatch.
  ///
  /// In tr, this message translates to:
  /// **'Filtreye uyan cihaz yok.'**
  String get ipScanNoMatch;

  /// No description provided for @ipScanPhaseNames.
  ///
  /// In tr, this message translates to:
  /// **'Adlar çözülüyor'**
  String get ipScanPhaseNames;

  /// No description provided for @ipScanPhasePing.
  ///
  /// In tr, this message translates to:
  /// **'Cihazlar aranıyor'**
  String get ipScanPhasePing;

  /// No description provided for @ipScanPhasePorts.
  ///
  /// In tr, this message translates to:
  /// **'Servisler deneniyor'**
  String get ipScanPhasePorts;

  /// No description provided for @ipScanProgress.
  ///
  /// In tr, this message translates to:
  /// **'{done}/{total}'**
  String ipScanProgress(String done, String total);

  /// No description provided for @ipScanRateLimited.
  ///
  /// In tr, this message translates to:
  /// **'Aynı kayıt en erken {s} sn sonra yeniden taranabilir.'**
  String ipScanRateLimited(String s);

  /// No description provided for @ipScanScan.
  ///
  /// In tr, this message translates to:
  /// **'Tara'**
  String get ipScanScan;

  /// No description provided for @ipScanScanning.
  ///
  /// In tr, this message translates to:
  /// **'Taranıyor…'**
  String get ipScanScanning;

  /// No description provided for @ipScanSelectHint.
  ///
  /// In tr, this message translates to:
  /// **'Soldaki bir kayda tıklayın: aralık taranır ve bulunan cihazlar burada listelenir.'**
  String get ipScanSelectHint;

  /// No description provided for @ipScanSelectRecord.
  ///
  /// In tr, this message translates to:
  /// **'Bir kayıt seçin'**
  String get ipScanSelectRecord;

  /// No description provided for @ipScanStop.
  ///
  /// In tr, this message translates to:
  /// **'Durdur'**
  String get ipScanStop;

  /// No description provided for @ipScanStopped.
  ///
  /// In tr, this message translates to:
  /// **'Tarama durduruldu'**
  String get ipScanStopped;

  /// No description provided for @ipStatusAliveArp.
  ///
  /// In tr, this message translates to:
  /// **'ARP tablosunda görüldü (ping\'e yanıt vermedi)'**
  String get ipStatusAliveArp;

  /// No description provided for @ipStatusAlivePing.
  ///
  /// In tr, this message translates to:
  /// **'Ping\'e yanıt verdi'**
  String get ipStatusAlivePing;

  /// No description provided for @ipStatusGone.
  ///
  /// In tr, this message translates to:
  /// **'Kayboldu (önceki taramada vardı)'**
  String get ipStatusGone;

  /// No description provided for @ipStatusLive.
  ///
  /// In tr, this message translates to:
  /// **'Taranıyor'**
  String get ipStatusLive;

  /// No description provided for @ipStatusNew.
  ///
  /// In tr, this message translates to:
  /// **'Yeni (önceki taramada yoktu)'**
  String get ipStatusNew;

  /// No description provided for @ipStatusSame.
  ///
  /// In tr, this message translates to:
  /// **'Çevrimiçi'**
  String get ipStatusSame;

  /// No description provided for @ipTagCopied.
  ///
  /// In tr, this message translates to:
  /// **'Panoya kopyalandı: {text}'**
  String ipTagCopied(String text);

  /// No description provided for @ipTagFailed.
  ///
  /// In tr, this message translates to:
  /// **'Açılamadı'**
  String get ipTagFailed;

  /// No description provided for @ipTagGroupCamera.
  ///
  /// In tr, this message translates to:
  /// **'Kamera (RTSP)'**
  String get ipTagGroupCamera;

  /// No description provided for @ipTagGroupDb.
  ///
  /// In tr, this message translates to:
  /// **'Veritabanı'**
  String get ipTagGroupDb;

  /// No description provided for @ipTagGroupFtp.
  ///
  /// In tr, this message translates to:
  /// **'FTP'**
  String get ipTagGroupFtp;

  /// No description provided for @ipTagGroupPrinter.
  ///
  /// In tr, this message translates to:
  /// **'Yazıcı'**
  String get ipTagGroupPrinter;

  /// No description provided for @ipTagGroupRdp.
  ///
  /// In tr, this message translates to:
  /// **'Uzak Masaüstü'**
  String get ipTagGroupRdp;

  /// No description provided for @ipTagGroupSmb.
  ///
  /// In tr, this message translates to:
  /// **'Dosya paylaşımı'**
  String get ipTagGroupSmb;

  /// No description provided for @ipTagGroupSsh.
  ///
  /// In tr, this message translates to:
  /// **'SSH'**
  String get ipTagGroupSsh;

  /// No description provided for @ipTagGroupVnc.
  ///
  /// In tr, this message translates to:
  /// **'VNC'**
  String get ipTagGroupVnc;

  /// No description provided for @ipTagGroupWeb.
  ///
  /// In tr, this message translates to:
  /// **'Web'**
  String get ipTagGroupWeb;

  /// No description provided for @ipTagOpened.
  ///
  /// In tr, this message translates to:
  /// **'Açılıyor: {text}'**
  String ipTagOpened(String text);

  /// No description provided for @ipTrayHiddenHint.
  ///
  /// In tr, this message translates to:
  /// **'IP Tools tepside çalışmaya devam ediyor. Simgeye tıklayınca pencere geri açılır.'**
  String get ipTrayHiddenHint;

  /// No description provided for @ipTrayQuit.
  ///
  /// In tr, this message translates to:
  /// **'Çıkış'**
  String get ipTrayQuit;

  /// No description provided for @ipTrayShow.
  ///
  /// In tr, this message translates to:
  /// **'IP Tools\'u göster'**
  String get ipTrayShow;

  /// No description provided for @ipWelcomeBody.
  ///
  /// In tr, this message translates to:
  /// **'Bir IP aralığı kaydedin (ör. 192.168.1.0/24). Kayda tıkladığınızda aralık taranır; bulunan cihazların adı, üreticisi ve açık servisleri listelenir. Servis etiketine tıklayınca ilgili uygulama açılır.'**
  String get ipWelcomeBody;

  /// No description provided for @ipWelcomeTitle.
  ///
  /// In tr, this message translates to:
  /// **'Yerel ağınızda ne var?'**
  String get ipWelcomeTitle;

  /// No description provided for @cvTypeVideo.
  ///
  /// In tr, this message translates to:
  /// **'Video'**
  String get cvTypeVideo;

  /// No description provided for @cvTypeImage.
  ///
  /// In tr, this message translates to:
  /// **'Resim'**
  String get cvTypeImage;

  /// No description provided for @cvTypeAudio.
  ///
  /// In tr, this message translates to:
  /// **'Ses'**
  String get cvTypeAudio;

  /// No description provided for @cvTypeVideoHint.
  ///
  /// In tr, this message translates to:
  /// **'MP4, MKV, AVI, MOV…'**
  String get cvTypeVideoHint;

  /// No description provided for @cvTypeImageHint.
  ///
  /// In tr, this message translates to:
  /// **'JPG, PNG, WEBP, AVIF…'**
  String get cvTypeImageHint;

  /// No description provided for @cvTypeAudioHint.
  ///
  /// In tr, this message translates to:
  /// **'MP3, WAV, FLAC, M4A…'**
  String get cvTypeAudioHint;

  /// No description provided for @cvTypeVideoAll.
  ///
  /// In tr, this message translates to:
  /// **'Tüm video dosyaları'**
  String get cvTypeVideoAll;

  /// No description provided for @cvTypeImageAll.
  ///
  /// In tr, this message translates to:
  /// **'Tüm resim dosyaları'**
  String get cvTypeImageAll;

  /// No description provided for @cvTypeAudioAll.
  ///
  /// In tr, this message translates to:
  /// **'Tüm ses dosyaları'**
  String get cvTypeAudioAll;

  /// No description provided for @cvAppSearchPh.
  ///
  /// In tr, this message translates to:
  /// **'Projelerde ara…  (Ctrl+F)'**
  String get cvAppSearchPh;

  /// No description provided for @cvAppNewProject.
  ///
  /// In tr, this message translates to:
  /// **'Yeni proje'**
  String get cvAppNewProject;

  /// No description provided for @cvAppSettings.
  ///
  /// In tr, this message translates to:
  /// **'Ayarlar'**
  String get cvAppSettings;

  /// No description provided for @cvAppStats.
  ///
  /// In tr, this message translates to:
  /// **'{c} proje · {f} klasör'**
  String cvAppStats(String c, String f);

  /// No description provided for @cvAppWelcome.
  ///
  /// In tr, this message translates to:
  /// **'Hoş geldiniz'**
  String get cvAppWelcome;

  /// No description provided for @cvAppResults.
  ///
  /// In tr, this message translates to:
  /// **'“{q}” için sonuçlar'**
  String cvAppResults(String q);

  /// No description provided for @cvAppAll.
  ///
  /// In tr, this message translates to:
  /// **'Tüm projeler'**
  String get cvAppAll;

  /// No description provided for @cvAppWelcomeHint.
  ///
  /// In tr, this message translates to:
  /// **'İlk dönüştürme projenizi oluşturun.<br>Video, resim ya da ses seçin, kaynak ve hedef uzantıyı belirleyin, dosya veya klasörü gösterin.'**
  String get cvAppWelcomeHint;

  /// No description provided for @cvAppFolders.
  ///
  /// In tr, this message translates to:
  /// **'Klasörler'**
  String get cvAppFolders;

  /// No description provided for @cvAppProjects.
  ///
  /// In tr, this message translates to:
  /// **'Projeler'**
  String get cvAppProjects;

  /// No description provided for @cvAppDblHint.
  ///
  /// In tr, this message translates to:
  /// **'Açmak için projeye çift tıklayın'**
  String get cvAppDblHint;

  /// No description provided for @cvAppNoMatch.
  ///
  /// In tr, this message translates to:
  /// **'Eşleşen proje bulunamadı.'**
  String get cvAppNoMatch;

  /// No description provided for @cvAppFolderCount.
  ///
  /// In tr, this message translates to:
  /// **'{n} proje'**
  String cvAppFolderCount(String n);

  /// No description provided for @cvAppNewProjectHere.
  ///
  /// In tr, this message translates to:
  /// **'Bu klasörde yeni proje'**
  String get cvAppNewProjectHere;

  /// No description provided for @cvAppNewSubfolder.
  ///
  /// In tr, this message translates to:
  /// **'Alt klasör oluştur'**
  String get cvAppNewSubfolder;

  /// No description provided for @cvAppDuplicate.
  ///
  /// In tr, this message translates to:
  /// **'Kopyasını oluştur'**
  String get cvAppDuplicate;

  /// No description provided for @cvAppMoveToFolder.
  ///
  /// In tr, this message translates to:
  /// **'Klasöre taşı…'**
  String get cvAppMoveToFolder;

  /// No description provided for @cvAppProjectMoved.
  ///
  /// In tr, this message translates to:
  /// **'Proje taşındı'**
  String get cvAppProjectMoved;

  /// No description provided for @cvAppFolderIntoSelf.
  ///
  /// In tr, this message translates to:
  /// **'Klasör kendi içine taşınamaz'**
  String get cvAppFolderIntoSelf;

  /// No description provided for @cvAppFolderPh.
  ///
  /// In tr, this message translates to:
  /// **'Örn. Müşteri videoları'**
  String get cvAppFolderPh;

  /// No description provided for @cvAppRenameFolder.
  ///
  /// In tr, this message translates to:
  /// **'Klasörü yeniden adlandır'**
  String get cvAppRenameFolder;

  /// No description provided for @cvAppDeleteFolder.
  ///
  /// In tr, this message translates to:
  /// **'Klasörü sil'**
  String get cvAppDeleteFolder;

  /// No description provided for @cvAppDeleteFolderMsg.
  ///
  /// In tr, this message translates to:
  /// **'<b>{name}</b> klasörü silinsin mi?'**
  String cvAppDeleteFolderMsg(String name);

  /// No description provided for @cvAppDeleteFolderProjects.
  ///
  /// In tr, this message translates to:
  /// **'<br>İçindeki {n} proje üst klasöre taşınacak.'**
  String cvAppDeleteFolderProjects(String n);

  /// No description provided for @cvAppRootFolder.
  ///
  /// In tr, this message translates to:
  /// **'Ana dizin (klasörsüz)'**
  String get cvAppRootFolder;

  /// No description provided for @cvAppMoveTitle.
  ///
  /// In tr, this message translates to:
  /// **'“{name}” taşı'**
  String cvAppMoveTitle(String name);

  /// No description provided for @cvAppTargetFolder.
  ///
  /// In tr, this message translates to:
  /// **'Hedef klasör'**
  String get cvAppTargetFolder;

  /// No description provided for @cvAppDeleteProject.
  ///
  /// In tr, this message translates to:
  /// **'Projeyi sil'**
  String get cvAppDeleteProject;

  /// No description provided for @cvAppDeleteProjectMsg.
  ///
  /// In tr, this message translates to:
  /// **'<b>{name}</b> projesi silinsin mi?<br>Bu projenin dönüştürülmüş dosyaları ve metinleri de silinir. Kaynak dosyalarınıza dokunulmaz.'**
  String cvAppDeleteProjectMsg(String name);

  /// No description provided for @cvAppProjectSettings.
  ///
  /// In tr, this message translates to:
  /// **'Proje ayarları'**
  String get cvAppProjectSettings;

  /// No description provided for @cvAppNoSource.
  ///
  /// In tr, this message translates to:
  /// **'Bu bilgisayarda kaynak seçilmedi'**
  String get cvAppNoSource;

  /// No description provided for @cvAppAllExts.
  ///
  /// In tr, this message translates to:
  /// **'Tümü'**
  String get cvAppAllExts;

  /// No description provided for @cvAppRunning.
  ///
  /// In tr, this message translates to:
  /// **'Çalışıyor'**
  String get cvAppRunning;

  /// No description provided for @cvAppDoneCount.
  ///
  /// In tr, this message translates to:
  /// **'{n} tamam'**
  String cvAppDoneCount(String n);

  /// No description provided for @cvAppErrorCount.
  ///
  /// In tr, this message translates to:
  /// **'{n} hata'**
  String cvAppErrorCount(String n);

  /// No description provided for @cvAppProjectSaved.
  ///
  /// In tr, this message translates to:
  /// **'Proje kaydedildi'**
  String get cvAppProjectSaved;

  /// No description provided for @cvAppClearOutputs.
  ///
  /// In tr, this message translates to:
  /// **'Çevrilmiş dosyaları sil'**
  String get cvAppClearOutputs;

  /// No description provided for @cvAppClearOutputsMsg.
  ///
  /// In tr, this message translates to:
  /// **'<b>{name}</b> projesinin dönüştürülmüş dosyaları silinsin mi? Kaynak dosyalarınıza dokunulmaz; istediğinizde yeniden dönüştürebilirsiniz.'**
  String cvAppClearOutputsMsg(String name);

  /// No description provided for @cvPfTitleNew.
  ///
  /// In tr, this message translates to:
  /// **'Yeni proje'**
  String get cvPfTitleNew;

  /// No description provided for @cvPfTitleEdit.
  ///
  /// In tr, this message translates to:
  /// **'Proje ayarları: {name}'**
  String cvPfTitleEdit(String name);

  /// No description provided for @cvPfCreate.
  ///
  /// In tr, this message translates to:
  /// **'Kaydet'**
  String get cvPfCreate;

  /// No description provided for @cvPfTabGeneral.
  ///
  /// In tr, this message translates to:
  /// **'Genel'**
  String get cvPfTabGeneral;

  /// No description provided for @cvPfTabOutput.
  ///
  /// In tr, this message translates to:
  /// **'Dönüştürme ayarları'**
  String get cvPfTabOutput;

  /// No description provided for @cvPfTabSpeech.
  ///
  /// In tr, this message translates to:
  /// **'Konuşma'**
  String get cvPfTabSpeech;

  /// No description provided for @cvPfName.
  ///
  /// In tr, this message translates to:
  /// **'Proje ismi'**
  String get cvPfName;

  /// No description provided for @cvPfNamePh.
  ///
  /// In tr, this message translates to:
  /// **'Örn. Tatil videoları'**
  String get cvPfNamePh;

  /// No description provided for @cvPfType.
  ///
  /// In tr, this message translates to:
  /// **'Tür'**
  String get cvPfType;

  /// No description provided for @cvPfSourceExt.
  ///
  /// In tr, this message translates to:
  /// **'Kaynak dosya uzantısı'**
  String get cvPfSourceExt;

  /// No description provided for @cvPfTargetExt.
  ///
  /// In tr, this message translates to:
  /// **'Hedef dosya uzantısı'**
  String get cvPfTargetExt;

  /// No description provided for @cvPfSelectAll.
  ///
  /// In tr, this message translates to:
  /// **'Tümünü seç'**
  String get cvPfSelectAll;

  /// No description provided for @cvPfSelectNone.
  ///
  /// In tr, this message translates to:
  /// **'Hiçbiri'**
  String get cvPfSelectNone;

  /// No description provided for @cvPfGroupVideo.
  ///
  /// In tr, this message translates to:
  /// **'Video'**
  String get cvPfGroupVideo;

  /// No description provided for @cvPfGroupAnim.
  ///
  /// In tr, this message translates to:
  /// **'Animasyon'**
  String get cvPfGroupAnim;

  /// No description provided for @cvPfGroupAudioOnly.
  ///
  /// In tr, this message translates to:
  /// **'Yalnız ses (videodan ses çıkar)'**
  String get cvPfGroupAudioOnly;

  /// No description provided for @cvPfAudioOnlyHint.
  ///
  /// In tr, this message translates to:
  /// **'Videonun yalnız sesi alınır.'**
  String get cvPfAudioOnlyHint;

  /// No description provided for @cvPfGifHint.
  ///
  /// In tr, this message translates to:
  /// **'Animasyonlu GIF (en fazla 30 kare/sn).'**
  String get cvPfGifHint;

  /// No description provided for @cvPfSource.
  ///
  /// In tr, this message translates to:
  /// **'Kaynak'**
  String get cvPfSource;

  /// No description provided for @cvPfModeFile.
  ///
  /// In tr, this message translates to:
  /// **'Dosya'**
  String get cvPfModeFile;

  /// No description provided for @cvPfModeFolder.
  ///
  /// In tr, this message translates to:
  /// **'Klasör'**
  String get cvPfModeFolder;

  /// No description provided for @cvPfPathFile.
  ///
  /// In tr, this message translates to:
  /// **'Dönüştürülecek dosya'**
  String get cvPfPathFile;

  /// No description provided for @cvPfPathFolder.
  ///
  /// In tr, this message translates to:
  /// **'Dönüştürülecek klasör'**
  String get cvPfPathFolder;

  /// No description provided for @cvPfPathNone.
  ///
  /// In tr, this message translates to:
  /// **'Henüz seçilmedi — Seç… düğmesine basın'**
  String get cvPfPathNone;

  /// No description provided for @cvPfSubfolders.
  ///
  /// In tr, this message translates to:
  /// **'Alt klasörleri de dahil et'**
  String get cvPfSubfolders;

  /// No description provided for @cvPfConcurrency.
  ///
  /// In tr, this message translates to:
  /// **'Aynı anda çevrilecek dosya sayısı'**
  String get cvPfConcurrency;

  /// No description provided for @cvPfConcurrencyHint.
  ///
  /// In tr, this message translates to:
  /// **'Yüksek değer daha hızlı bitirir ama işlemciyi ve diski daha çok yorar.'**
  String get cvPfConcurrencyHint;

  /// No description provided for @cvPfFolder.
  ///
  /// In tr, this message translates to:
  /// **'Proje klasörü'**
  String get cvPfFolder;

  /// No description provided for @cvPfSpeechAsk.
  ///
  /// In tr, this message translates to:
  /// **'Konuşmayı metne çevir (speech)'**
  String get cvPfSpeechAsk;

  /// No description provided for @cvPfSpeechAskHint.
  ///
  /// In tr, this message translates to:
  /// **'Video veya sesteki konuşma metne çevrilir: cümlenin geçtiği saniye, dil ve metin ayrı sütunlarda görünür.'**
  String get cvPfSpeechAskHint;

  /// No description provided for @cvPfSpeechModel.
  ///
  /// In tr, this message translates to:
  /// **'Konuşma modeli'**
  String get cvPfSpeechModel;

  /// No description provided for @cvPfSpeechLang.
  ///
  /// In tr, this message translates to:
  /// **'Konuşma dili'**
  String get cvPfSpeechLang;

  /// No description provided for @cvPfPerWindow.
  ///
  /// In tr, this message translates to:
  /// **'Her 30 saniyede dili yeniden algıla'**
  String get cvPfPerWindow;

  /// No description provided for @cvPfPerWindowHint.
  ///
  /// In tr, this message translates to:
  /// **'Birden çok dil konuşulan kayıtlar için. Daha yavaştır.'**
  String get cvPfPerWindowHint;

  /// No description provided for @cvPfModels.
  ///
  /// In tr, this message translates to:
  /// **'Modeller'**
  String get cvPfModels;

  /// No description provided for @cvPfSpeechNote.
  ///
  /// In tr, this message translates to:
  /// **'Konuşma tanıma bu bilgisayarda, çevrimdışı çalışır (whisper.cpp); ses hiçbir sunucuya gönderilmez. Model ilk kullanımda bir kez indirilir.'**
  String get cvPfSpeechNote;

  /// No description provided for @cvPfErrExt.
  ///
  /// In tr, this message translates to:
  /// **'En az bir kaynak uzantısı seçin.'**
  String get cvPfErrExt;

  /// No description provided for @cvOutQuality.
  ///
  /// In tr, this message translates to:
  /// **'Kalite'**
  String get cvOutQuality;

  /// No description provided for @cvOutQHigh.
  ///
  /// In tr, this message translates to:
  /// **'Yüksek (büyük dosya)'**
  String get cvOutQHigh;

  /// No description provided for @cvOutQMedium.
  ///
  /// In tr, this message translates to:
  /// **'Orta (önerilen)'**
  String get cvOutQMedium;

  /// No description provided for @cvOutQLow.
  ///
  /// In tr, this message translates to:
  /// **'Düşük (küçük dosya)'**
  String get cvOutQLow;

  /// No description provided for @cvOutResolution.
  ///
  /// In tr, this message translates to:
  /// **'Çözünürlük'**
  String get cvOutResolution;

  /// No description provided for @cvOutAsSource.
  ///
  /// In tr, this message translates to:
  /// **'Kaynakla aynı'**
  String get cvOutAsSource;

  /// No description provided for @cvOutResolutionHint.
  ///
  /// In tr, this message translates to:
  /// **'Yalnız küçültür; daha küçük videolar büyütülmez.'**
  String get cvOutResolutionHint;

  /// No description provided for @cvOutFps.
  ///
  /// In tr, this message translates to:
  /// **'Kare hızı'**
  String get cvOutFps;

  /// No description provided for @cvOutCodec.
  ///
  /// In tr, this message translates to:
  /// **'Video kodeği'**
  String get cvOutCodec;

  /// No description provided for @cvOutH264.
  ///
  /// In tr, this message translates to:
  /// **'H.264 (en uyumlu)'**
  String get cvOutH264;

  /// No description provided for @cvOutH265.
  ///
  /// In tr, this message translates to:
  /// **'H.265 / HEVC (daha küçük)'**
  String get cvOutH265;

  /// No description provided for @cvOutCodecHint.
  ///
  /// In tr, this message translates to:
  /// **'H.265 yalnız MP4, MKV, MOV ve M4V hedeflerinde kullanılır.'**
  String get cvOutCodecHint;

  /// No description provided for @cvOutSpeed.
  ///
  /// In tr, this message translates to:
  /// **'Kodlama hızı'**
  String get cvOutSpeed;

  /// No description provided for @cvOutSpeedVeryfast.
  ///
  /// In tr, this message translates to:
  /// **'Çok hızlı'**
  String get cvOutSpeedVeryfast;

  /// No description provided for @cvOutSpeedFast.
  ///
  /// In tr, this message translates to:
  /// **'Hızlı'**
  String get cvOutSpeedFast;

  /// No description provided for @cvOutSpeedMedium.
  ///
  /// In tr, this message translates to:
  /// **'Dengeli'**
  String get cvOutSpeedMedium;

  /// No description provided for @cvOutSpeedSlow.
  ///
  /// In tr, this message translates to:
  /// **'Yavaş (daha küçük dosya)'**
  String get cvOutSpeedSlow;

  /// No description provided for @cvOutAudioBitrate.
  ///
  /// In tr, this message translates to:
  /// **'Ses bit hızı'**
  String get cvOutAudioBitrate;

  /// No description provided for @cvOutNoAudio.
  ///
  /// In tr, this message translates to:
  /// **'Sesi kaldır'**
  String get cvOutNoAudio;

  /// No description provided for @cvOutImgQuality.
  ///
  /// In tr, this message translates to:
  /// **'Kalite'**
  String get cvOutImgQuality;

  /// No description provided for @cvOutImgQualityHint.
  ///
  /// In tr, this message translates to:
  /// **'JPG, WEBP, AVIF ve TIFF için. PNG kayıpsızdır; 80 altında renk paleti kullanılır.'**
  String get cvOutImgQualityHint;

  /// No description provided for @cvOutMaxWidth.
  ///
  /// In tr, this message translates to:
  /// **'En fazla genişlik'**
  String get cvOutMaxWidth;

  /// No description provided for @cvOutMaxHeight.
  ///
  /// In tr, this message translates to:
  /// **'En fazla yükseklik'**
  String get cvOutMaxHeight;

  /// No description provided for @cvOutNoLimit.
  ///
  /// In tr, this message translates to:
  /// **'Sınırsız'**
  String get cvOutNoLimit;

  /// No description provided for @cvOutResizeHint.
  ///
  /// In tr, this message translates to:
  /// **'En-boy oranı korunur; küçük resimler büyütülmez.'**
  String get cvOutResizeHint;

  /// No description provided for @cvOutKeepMeta.
  ///
  /// In tr, this message translates to:
  /// **'Meta verileri koru (EXIF, renk profili)'**
  String get cvOutKeepMeta;

  /// No description provided for @cvOutKeepMetaHint.
  ///
  /// In tr, this message translates to:
  /// **'Kapalıyken konum gibi kişisel bilgiler çıktıya yazılmaz.'**
  String get cvOutKeepMetaHint;

  /// No description provided for @cvOutBitrate.
  ///
  /// In tr, this message translates to:
  /// **'Bit hızı'**
  String get cvOutBitrate;

  /// No description provided for @cvOutBitrateHint.
  ///
  /// In tr, this message translates to:
  /// **'WAV, FLAC ve AIFF kayıpsızdır; bit hızı uygulanmaz.'**
  String get cvOutBitrateHint;

  /// No description provided for @cvOutSampleRate.
  ///
  /// In tr, this message translates to:
  /// **'Örnekleme hızı'**
  String get cvOutSampleRate;

  /// No description provided for @cvOutChannels.
  ///
  /// In tr, this message translates to:
  /// **'Kanallar'**
  String get cvOutChannels;

  /// No description provided for @cvOutStereo.
  ///
  /// In tr, this message translates to:
  /// **'Stereo'**
  String get cvOutStereo;

  /// No description provided for @cvOutMono.
  ///
  /// In tr, this message translates to:
  /// **'Mono'**
  String get cvOutMono;

  /// No description provided for @cvSpeechModelTiny.
  ///
  /// In tr, this message translates to:
  /// **'Çok küçük (en hızlı)'**
  String get cvSpeechModelTiny;

  /// No description provided for @cvSpeechModelBase.
  ///
  /// In tr, this message translates to:
  /// **'Temel (önerilen)'**
  String get cvSpeechModelBase;

  /// No description provided for @cvSpeechModelSmall.
  ///
  /// In tr, this message translates to:
  /// **'Küçük (daha doğru)'**
  String get cvSpeechModelSmall;

  /// No description provided for @cvSpeechModelMedium.
  ///
  /// In tr, this message translates to:
  /// **'Orta (yüksek doğruluk)'**
  String get cvSpeechModelMedium;

  /// No description provided for @cvSpeechModelTurbo.
  ///
  /// In tr, this message translates to:
  /// **'Large v3 Turbo (en doğru)'**
  String get cvSpeechModelTurbo;

  /// No description provided for @cvSpeechLangAuto.
  ///
  /// In tr, this message translates to:
  /// **'Otomatik algıla'**
  String get cvSpeechLangAuto;

  /// No description provided for @cvSpeechDownload.
  ///
  /// In tr, this message translates to:
  /// **'İndir'**
  String get cvSpeechDownload;

  /// No description provided for @cvSpeechInstalled.
  ///
  /// In tr, this message translates to:
  /// **'Yüklü · {size}'**
  String cvSpeechInstalled(String size);

  /// No description provided for @cvSpeechDownloadFailed.
  ///
  /// In tr, this message translates to:
  /// **'Model indirilemedi'**
  String get cvSpeechDownloadFailed;

  /// No description provided for @cvSpeechDlEngine.
  ///
  /// In tr, this message translates to:
  /// **'Konuşma motoru indiriliyor'**
  String get cvSpeechDlEngine;

  /// No description provided for @cvSpeechDlModel.
  ///
  /// In tr, this message translates to:
  /// **'Konuşma modeli indiriliyor: {model}'**
  String cvSpeechDlModel(String model);

  /// No description provided for @cvSpeechEngineAuto.
  ///
  /// In tr, this message translates to:
  /// **'Konuşma motoru (whisper.cpp) ilk kullanımda indirilecek.'**
  String get cvSpeechEngineAuto;

  /// No description provided for @cvSpeechEngineMissing.
  ///
  /// In tr, this message translates to:
  /// **'Konuşma motoru (whisper-cli) bulunamadı.'**
  String get cvSpeechEngineMissing;

  /// No description provided for @cvPjOriginal.
  ///
  /// In tr, this message translates to:
  /// **'Orijinal'**
  String get cvPjOriginal;

  /// No description provided for @cvPjConverted.
  ///
  /// In tr, this message translates to:
  /// **'Dönüştürülmüş'**
  String get cvPjConverted;

  /// No description provided for @cvPjFolders.
  ///
  /// In tr, this message translates to:
  /// **'Klasörler'**
  String get cvPjFolders;

  /// No description provided for @cvPjFiles.
  ///
  /// In tr, this message translates to:
  /// **'Dosyalar'**
  String get cvPjFiles;

  /// No description provided for @cvPjTranscript.
  ///
  /// In tr, this message translates to:
  /// **'Metin'**
  String get cvPjTranscript;

  /// No description provided for @cvPjTrSecond.
  ///
  /// In tr, this message translates to:
  /// **'Saniye'**
  String get cvPjTrSecond;

  /// No description provided for @cvPjTrLang.
  ///
  /// In tr, this message translates to:
  /// **'Dil'**
  String get cvPjTrLang;

  /// No description provided for @cvPjTrText.
  ///
  /// In tr, this message translates to:
  /// **'Metin'**
  String get cvPjTrText;

  /// No description provided for @cvPjSecUnit.
  ///
  /// In tr, this message translates to:
  /// **'sn'**
  String get cvPjSecUnit;

  /// No description provided for @cvPjStart.
  ///
  /// In tr, this message translates to:
  /// **'Başlat'**
  String get cvPjStart;

  /// No description provided for @cvPjStop.
  ///
  /// In tr, this message translates to:
  /// **'Durdur'**
  String get cvPjStop;

  /// No description provided for @cvPjChangeSource.
  ///
  /// In tr, this message translates to:
  /// **'Kaynağı değiştir'**
  String get cvPjChangeSource;

  /// No description provided for @cvPjPickSource.
  ///
  /// In tr, this message translates to:
  /// **'Kaynak seç'**
  String get cvPjPickSource;

  /// No description provided for @cvPjOpenOutDir.
  ///
  /// In tr, this message translates to:
  /// **'Dönüştürülmüş dosyalar klasörünü aç'**
  String get cvPjOpenOutDir;

  /// No description provided for @cvPjExportOutputs.
  ///
  /// In tr, this message translates to:
  /// **'Dönüştürülmüş dosyaları başka klasöre kopyala…'**
  String get cvPjExportOutputs;

  /// No description provided for @cvPjClearOutputs.
  ///
  /// In tr, this message translates to:
  /// **'Çevrilmiş dosyaları sil'**
  String get cvPjClearOutputs;

  /// No description provided for @cvPjLinkPreview.
  ///
  /// In tr, this message translates to:
  /// **'İki önizlemeyi birlikte oynat'**
  String get cvPjLinkPreview;

  /// No description provided for @cvPjFilterPh.
  ///
  /// In tr, this message translates to:
  /// **'Dosyalarda ara'**
  String get cvPjFilterPh;

  /// No description provided for @cvPjFAll.
  ///
  /// In tr, this message translates to:
  /// **'Tümü'**
  String get cvPjFAll;

  /// No description provided for @cvPjFPending.
  ///
  /// In tr, this message translates to:
  /// **'Bekleyen'**
  String get cvPjFPending;

  /// No description provided for @cvPjFActive.
  ///
  /// In tr, this message translates to:
  /// **'Süren'**
  String get cvPjFActive;

  /// No description provided for @cvPjFDone.
  ///
  /// In tr, this message translates to:
  /// **'Tamamlanan'**
  String get cvPjFDone;

  /// No description provided for @cvPjFError.
  ///
  /// In tr, this message translates to:
  /// **'Hatalı'**
  String get cvPjFError;

  /// No description provided for @cvPjExpandAll.
  ///
  /// In tr, this message translates to:
  /// **'Tümünü aç'**
  String get cvPjExpandAll;

  /// No description provided for @cvPjCollapseAll.
  ///
  /// In tr, this message translates to:
  /// **'Tümünü kapat'**
  String get cvPjCollapseAll;

  /// No description provided for @cvPjRescan.
  ///
  /// In tr, this message translates to:
  /// **'Yeniden tara'**
  String get cvPjRescan;

  /// No description provided for @cvPjColName.
  ///
  /// In tr, this message translates to:
  /// **'Ad'**
  String get cvPjColName;

  /// No description provided for @cvPjColFolder.
  ///
  /// In tr, this message translates to:
  /// **'Klasör'**
  String get cvPjColFolder;

  /// No description provided for @cvPjColSize.
  ///
  /// In tr, this message translates to:
  /// **'Boyut'**
  String get cvPjColSize;

  /// No description provided for @cvPjColProgress.
  ///
  /// In tr, this message translates to:
  /// **'İlerleme'**
  String get cvPjColProgress;

  /// No description provided for @cvPjColStatus.
  ///
  /// In tr, this message translates to:
  /// **'Durum'**
  String get cvPjColStatus;

  /// No description provided for @cvPjColSpeech.
  ///
  /// In tr, this message translates to:
  /// **'Metin'**
  String get cvPjColSpeech;

  /// No description provided for @cvPjColOut.
  ///
  /// In tr, this message translates to:
  /// **'Çıktı'**
  String get cvPjColOut;

  /// No description provided for @cvPjSegments.
  ///
  /// In tr, this message translates to:
  /// **'{n} cümle'**
  String cvPjSegments(String n);

  /// No description provided for @cvPjNoAudio.
  ///
  /// In tr, this message translates to:
  /// **'Ses yok'**
  String get cvPjNoAudio;

  /// No description provided for @cvPjNoFiles.
  ///
  /// In tr, this message translates to:
  /// **'Bu klasörde seçili uzantılarda dosya yok ({exts}).'**
  String cvPjNoFiles(String exts);

  /// No description provided for @cvPjNoMatch.
  ///
  /// In tr, this message translates to:
  /// **'Eşleşen dosya yok.'**
  String get cvPjNoMatch;

  /// No description provided for @cvPjNoneChecked.
  ///
  /// In tr, this message translates to:
  /// **'Listede dosya yok. Soldaki ağaçtan dönüştürülecek dosyaları işaretleyin.'**
  String get cvPjNoneChecked;

  /// No description provided for @cvPjConvertThis.
  ///
  /// In tr, this message translates to:
  /// **'Bu dosyayı dönüştür'**
  String get cvPjConvertThis;

  /// No description provided for @cvPjReconvert.
  ///
  /// In tr, this message translates to:
  /// **'Yeniden dönüştür'**
  String get cvPjReconvert;

  /// No description provided for @cvPjTranscribeThis.
  ///
  /// In tr, this message translates to:
  /// **'Metne çevir'**
  String get cvPjTranscribeThis;

  /// No description provided for @cvPjRetranscribe.
  ///
  /// In tr, this message translates to:
  /// **'Yeniden metne çevir'**
  String get cvPjRetranscribe;

  /// No description provided for @cvPjOpenOut.
  ///
  /// In tr, this message translates to:
  /// **'Dönüştürülmüş dosyayı aç'**
  String get cvPjOpenOut;

  /// No description provided for @cvPjRevealOut.
  ///
  /// In tr, this message translates to:
  /// **'Dönüştürülmüşü klasörde göster'**
  String get cvPjRevealOut;

  /// No description provided for @cvPjOpenSrc.
  ///
  /// In tr, this message translates to:
  /// **'Orijinal dosyayı aç'**
  String get cvPjOpenSrc;

  /// No description provided for @cvPjRevealSrc.
  ///
  /// In tr, this message translates to:
  /// **'Orijinali klasörde göster'**
  String get cvPjRevealSrc;

  /// No description provided for @cvPjExportThis.
  ///
  /// In tr, this message translates to:
  /// **'Başka klasöre kopyala…'**
  String get cvPjExportThis;

  /// No description provided for @cvPjDeleteOut.
  ///
  /// In tr, this message translates to:
  /// **'Dönüştürülmüş dosyayı sil'**
  String get cvPjDeleteOut;

  /// No description provided for @cvPjUncheck.
  ///
  /// In tr, this message translates to:
  /// **'Listeden çıkar'**
  String get cvPjUncheck;

  /// No description provided for @cvPjExported.
  ///
  /// In tr, this message translates to:
  /// **'{n} dosya kopyalandı'**
  String cvPjExported(String n);

  /// No description provided for @cvPjFileMissing.
  ///
  /// In tr, this message translates to:
  /// **'Kaynak dosya bulunamadı.'**
  String get cvPjFileMissing;

  /// No description provided for @cvPjPickToPreview.
  ///
  /// In tr, this message translates to:
  /// **'Önizlemek için listeden bir dosya seçin.'**
  String get cvPjPickToPreview;

  /// No description provided for @cvPjOutPreviewHint.
  ///
  /// In tr, this message translates to:
  /// **'Dönüştürülünce burada görünecek.'**
  String get cvPjOutPreviewHint;

  /// No description provided for @cvPjConverting.
  ///
  /// In tr, this message translates to:
  /// **'Dönüştürülüyor…'**
  String get cvPjConverting;

  /// No description provided for @cvPjCantPlay.
  ///
  /// In tr, this message translates to:
  /// **'Bu biçim burada doğrudan oynatılamıyor.'**
  String get cvPjCantPlay;

  /// No description provided for @cvPjMakePreview.
  ///
  /// In tr, this message translates to:
  /// **'Önizleme oluştur'**
  String get cvPjMakePreview;

  /// No description provided for @cvPjMakingPreview.
  ///
  /// In tr, this message translates to:
  /// **'Önizleme hazırlanıyor…'**
  String get cvPjMakingPreview;

  /// No description provided for @cvPjNoSourceTitle.
  ///
  /// In tr, this message translates to:
  /// **'Bu bilgisayarda kaynak seçilmedi'**
  String get cvPjNoSourceTitle;

  /// No description provided for @cvPjNoSourceHint.
  ///
  /// In tr, this message translates to:
  /// **'Proje başka bir cihazdan senkronlandı ya da kaynak henüz seçilmedi. Dönüştürülecek dosyayı veya klasörü seçin.'**
  String get cvPjNoSourceHint;

  /// No description provided for @cvPjSourceGone.
  ///
  /// In tr, this message translates to:
  /// **'Kaynak bulunamadı'**
  String get cvPjSourceGone;

  /// No description provided for @cvPjTrImage.
  ///
  /// In tr, this message translates to:
  /// **'Konuşmadan metne yalnız video ve ses projelerinde kullanılır.'**
  String get cvPjTrImage;

  /// No description provided for @cvPjTrPick.
  ///
  /// In tr, this message translates to:
  /// **'Metnini görmek için bir dosya seçin.'**
  String get cvPjTrPick;

  /// No description provided for @cvPjTrAfter.
  ///
  /// In tr, this message translates to:
  /// **'Dosya dönüştürülünce konuşma metne çevrilecek.'**
  String get cvPjTrAfter;

  /// No description provided for @cvPjTrOff.
  ///
  /// In tr, this message translates to:
  /// **'Bu projede konuşmadan metne kapalı. İsterseniz bu dosya için şimdi çalıştırın.'**
  String get cvPjTrOff;

  /// No description provided for @cvPjTrRunning.
  ///
  /// In tr, this message translates to:
  /// **'Konuşma metne çevriliyor… %{p}'**
  String cvPjTrRunning(String p);

  /// No description provided for @cvPjTrNone.
  ///
  /// In tr, this message translates to:
  /// **'Bu dosyada konuşma bulunamadı.'**
  String get cvPjTrNone;

  /// No description provided for @cvPjTrNoExport.
  ///
  /// In tr, this message translates to:
  /// **'Dışa aktarılacak metin yok.'**
  String get cvPjTrNoExport;

  /// No description provided for @cvPjTrSaved.
  ///
  /// In tr, this message translates to:
  /// **'Metin kaydedildi'**
  String get cvPjTrSaved;

  /// No description provided for @cvPjExportTranscript.
  ///
  /// In tr, this message translates to:
  /// **'Metni dışa aktar'**
  String get cvPjExportTranscript;

  /// No description provided for @cvPjFmtSrt.
  ///
  /// In tr, this message translates to:
  /// **'SRT altyazı'**
  String get cvPjFmtSrt;

  /// No description provided for @cvPjFmtVtt.
  ///
  /// In tr, this message translates to:
  /// **'WebVTT altyazı'**
  String get cvPjFmtVtt;

  /// No description provided for @cvPjFmtTxt.
  ///
  /// In tr, this message translates to:
  /// **'Düz metin (TXT)'**
  String get cvPjFmtTxt;

  /// No description provided for @cvPjFmtCsv.
  ///
  /// In tr, this message translates to:
  /// **'Tablo (CSV)'**
  String get cvPjFmtCsv;

  /// No description provided for @cvPjStTotal.
  ///
  /// In tr, this message translates to:
  /// **'{n} dosya'**
  String cvPjStTotal(String n);

  /// No description provided for @cvPjStDone.
  ///
  /// In tr, this message translates to:
  /// **'{n} tamam'**
  String cvPjStDone(String n);

  /// No description provided for @cvPjStErr.
  ///
  /// In tr, this message translates to:
  /// **'{n} hata'**
  String cvPjStErr(String n);

  /// No description provided for @cvPjStActive.
  ///
  /// In tr, this message translates to:
  /// **'{n} dönüştürülüyor'**
  String cvPjStActive(String n);

  /// No description provided for @cvPjStSpeech.
  ///
  /// In tr, this message translates to:
  /// **'{n} metne çevriliyor'**
  String cvPjStSpeech(String n);

  /// No description provided for @cvPjStOut.
  ///
  /// In tr, this message translates to:
  /// **'Çıktı: {size}'**
  String cvPjStOut(String size);

  /// No description provided for @cvPjStConc.
  ///
  /// In tr, this message translates to:
  /// **'Aynı anda: {n}'**
  String cvPjStConc(String n);

  /// No description provided for @cvPjFinished.
  ///
  /// In tr, this message translates to:
  /// **'Dönüştürme tamamlandı'**
  String get cvPjFinished;

  /// No description provided for @cvPjFinishedSub.
  ///
  /// In tr, this message translates to:
  /// **'{done}/{total} dosya tamam · {err} hata'**
  String cvPjFinishedSub(String done, String err, String total);

  /// No description provided for @cvStPending.
  ///
  /// In tr, this message translates to:
  /// **'Bekliyor'**
  String get cvStPending;

  /// No description provided for @cvStQueued.
  ///
  /// In tr, this message translates to:
  /// **'Sırada'**
  String get cvStQueued;

  /// No description provided for @cvStConverting.
  ///
  /// In tr, this message translates to:
  /// **'Dönüştürülüyor'**
  String get cvStConverting;

  /// No description provided for @cvStDone.
  ///
  /// In tr, this message translates to:
  /// **'Tamamlandı'**
  String get cvStDone;

  /// No description provided for @cvStError.
  ///
  /// In tr, this message translates to:
  /// **'Hata'**
  String get cvStError;

  /// No description provided for @cvStCanceled.
  ///
  /// In tr, this message translates to:
  /// **'İptal edildi'**
  String get cvStCanceled;

  /// No description provided for @cvMainBalloonTitle.
  ///
  /// In tr, this message translates to:
  /// **'Convert Master çalışmaya devam ediyor'**
  String get cvMainBalloonTitle;

  /// No description provided for @cvMainBalloonBody.
  ///
  /// In tr, this message translates to:
  /// **'Tepsideki simgeye tıklayarak pencereyi yeniden açabilirsiniz.'**
  String get cvMainBalloonBody;

  /// No description provided for @cvMainTrayShow.
  ///
  /// In tr, this message translates to:
  /// **'Convert Master\'ı göster'**
  String get cvMainTrayShow;

  /// No description provided for @cvMainTrayProjects.
  ///
  /// In tr, this message translates to:
  /// **'Projeler'**
  String get cvMainTrayProjects;

  /// No description provided for @cvMainTrayNone.
  ///
  /// In tr, this message translates to:
  /// **'(proje yok)'**
  String get cvMainTrayNone;

  /// No description provided for @cvMainTrayQuit.
  ///
  /// In tr, this message translates to:
  /// **'Çık'**
  String get cvMainTrayQuit;

  /// No description provided for @cvErrCanceled.
  ///
  /// In tr, this message translates to:
  /// **'İptal edildi'**
  String get cvErrCanceled;

  /// No description provided for @cvErrNoVideo.
  ///
  /// In tr, this message translates to:
  /// **'Dosyada video akışı yok.'**
  String get cvErrNoVideo;

  /// No description provided for @cvErrNoAudio.
  ///
  /// In tr, this message translates to:
  /// **'Dosyada ses yok.'**
  String get cvErrNoAudio;

  /// No description provided for @cvPjOcrThis.
  ///
  /// In tr, this message translates to:
  /// **'Metni oku (OCR)'**
  String get cvPjOcrThis;

  /// No description provided for @cvPjReocr.
  ///
  /// In tr, this message translates to:
  /// **'Metni yeniden oku (OCR)'**
  String get cvPjReocr;

  /// No description provided for @cvPjNoText.
  ///
  /// In tr, this message translates to:
  /// **'Metin yok'**
  String get cvPjNoText;

  /// No description provided for @cvPjNoTextHint.
  ///
  /// In tr, this message translates to:
  /// **'Resimde okunabilir metin bulunamadı.'**
  String get cvPjNoTextHint;

  /// No description provided for @cvPjOcrPanel.
  ///
  /// In tr, this message translates to:
  /// **'Metin (OCR)'**
  String get cvPjOcrPanel;

  /// No description provided for @cvPjTrLine.
  ///
  /// In tr, this message translates to:
  /// **'Satır'**
  String get cvPjTrLine;

  /// No description provided for @cvPjTrConf.
  ///
  /// In tr, this message translates to:
  /// **'Güven'**
  String get cvPjTrConf;

  /// No description provided for @cvPjLines.
  ///
  /// In tr, this message translates to:
  /// **'{n} satır'**
  String cvPjLines(String n);

  /// No description provided for @cvPjOcrAfter.
  ///
  /// In tr, this message translates to:
  /// **'Resim dönüştürülünce içindeki metin okunacak.'**
  String get cvPjOcrAfter;

  /// No description provided for @cvPjOcrOff.
  ///
  /// In tr, this message translates to:
  /// **'Bu projede OCR kapalı. İsterseniz bu resim için şimdi çalıştırın.'**
  String get cvPjOcrOff;

  /// No description provided for @cvPjOcrRunning.
  ///
  /// In tr, this message translates to:
  /// **'Metin okunuyor… %{p}'**
  String cvPjOcrRunning(String p);

  /// No description provided for @cvPjCopyAll.
  ///
  /// In tr, this message translates to:
  /// **'Tümünü kopyala'**
  String get cvPjCopyAll;

  /// No description provided for @cvPjCopied.
  ///
  /// In tr, this message translates to:
  /// **'Metin panoya kopyalandı'**
  String get cvPjCopied;

  /// No description provided for @cvOcrDl.
  ///
  /// In tr, this message translates to:
  /// **'OCR dil verisi indiriliyor: {lang}'**
  String cvOcrDl(String lang);

  /// No description provided for @cvOcrNotInstalled.
  ///
  /// In tr, this message translates to:
  /// **'İlk kullanımda indirilir'**
  String get cvOcrNotInstalled;

  /// No description provided for @cvOcrDownloadFailed.
  ///
  /// In tr, this message translates to:
  /// **'OCR dil verisi indirilemedi'**
  String get cvOcrDownloadFailed;

  /// No description provided for @cvPfTabOcr.
  ///
  /// In tr, this message translates to:
  /// **'OCR'**
  String get cvPfTabOcr;

  /// No description provided for @cvPfOcrAsk.
  ///
  /// In tr, this message translates to:
  /// **'Resimdeki metni oku (OCR)'**
  String get cvPfOcrAsk;

  /// No description provided for @cvPfOcrAskHint.
  ///
  /// In tr, this message translates to:
  /// **'Resimlerdeki yazılar metne çevrilir: her satır, okuma güveni ve metin ayrı sütunlarda görünür. İstemezseniz kapalı bırakın.'**
  String get cvPfOcrAskHint;

  /// No description provided for @cvPfOcrLangs.
  ///
  /// In tr, this message translates to:
  /// **'Resimdeki metnin dili'**
  String get cvPfOcrLangs;

  /// No description provided for @cvPfOcrLangsHint.
  ///
  /// In tr, this message translates to:
  /// **'En çok 6 dil seçilebilir; az dil daha hızlı ve doğrudur.'**
  String get cvPfOcrLangsHint;

  /// No description provided for @cvPfOcrData.
  ///
  /// In tr, this message translates to:
  /// **'Dil verileri'**
  String get cvPfOcrData;

  /// No description provided for @cvPfOcrNote.
  ///
  /// In tr, this message translates to:
  /// **'OCR bu bilgisayarda, çevrimdışı çalışır (Tesseract); resimler hiçbir sunucuya gönderilmez. Her dilin verisi ilk kullanımda bir kez indirilir.'**
  String get cvPfOcrNote;

  /// No description provided for @cvErrOcr.
  ///
  /// In tr, this message translates to:
  /// **'Metin okunamadı: {msg}'**
  String cvErrOcr(String msg);

  /// No description provided for @cvErrUnreadable.
  ///
  /// In tr, this message translates to:
  /// **'Dosya okunamadı (bozuk ya da desteklenmeyen dosya).'**
  String get cvErrUnreadable;

  /// No description provided for @cvErrUnsupported.
  ///
  /// In tr, this message translates to:
  /// **'Bu dönüşüm desteklenmiyor.'**
  String get cvErrUnsupported;

  /// No description provided for @cvErrFfmpegMissing.
  ///
  /// In tr, this message translates to:
  /// **'Dönüştürme motoru (ffmpeg) çalıştırılamadı: {msg}'**
  String cvErrFfmpegMissing(String msg);

  /// No description provided for @cvErrEngineMissing.
  ///
  /// In tr, this message translates to:
  /// **'Konuşma motoru (whisper.cpp) bulunamadı.'**
  String get cvErrEngineMissing;

  /// No description provided for @cvErrDownload.
  ///
  /// In tr, this message translates to:
  /// **'İndirme başarısız: {msg}'**
  String cvErrDownload(String msg);

  /// No description provided for @cvErrNotFound.
  ///
  /// In tr, this message translates to:
  /// **'Dosya bulunamadı.'**
  String get cvErrNotFound;

  /// No description provided for @cvErrAccess.
  ///
  /// In tr, this message translates to:
  /// **'Erişim reddedildi.'**
  String get cvErrAccess;

  /// No description provided for @cvErrBusy.
  ///
  /// In tr, this message translates to:
  /// **'Dosya başka bir program tarafından kullanılıyor.'**
  String get cvErrBusy;

  /// No description provided for @cvErrNoSpace.
  ///
  /// In tr, this message translates to:
  /// **'Diskte yer kalmadı.'**
  String get cvErrNoSpace;

  /// No description provided for @cvErrFfmpeg.
  ///
  /// In tr, this message translates to:
  /// **'Dönüştürülemedi: {msg}'**
  String cvErrFfmpeg(String msg);

  /// No description provided for @cvErrWhisper.
  ///
  /// In tr, this message translates to:
  /// **'Metne çevrilemedi: {msg}'**
  String cvErrWhisper(String msg);

  /// No description provided for @cvMainCloseActive.
  ///
  /// In tr, this message translates to:
  /// **'Dönüştürme sürüyor. Pencereyi kapatırsanız süren işler durdurulur.'**
  String get cvMainCloseActive;

  /// No description provided for @cvMainCloseAnyway.
  ///
  /// In tr, this message translates to:
  /// **'Yine de kapat'**
  String get cvMainCloseAnyway;

  /// No description provided for @cvMainCopySuffix.
  ///
  /// In tr, this message translates to:
  /// **' (kopya)'**
  String get cvMainCopySuffix;

  /// No description provided for @cvMainErrProjectNotFound.
  ///
  /// In tr, this message translates to:
  /// **'Proje bulunamadı'**
  String get cvMainErrProjectNotFound;

  /// No description provided for @cvMainExportTo.
  ///
  /// In tr, this message translates to:
  /// **'Dönüştürülmüş dosyaların kopyalanacağı klasör'**
  String get cvMainExportTo;

  /// No description provided for @cvMainPickFile.
  ///
  /// In tr, this message translates to:
  /// **'Dönüştürülecek dosyayı seçin'**
  String get cvMainPickFile;

  /// No description provided for @cvMainPickFolder.
  ///
  /// In tr, this message translates to:
  /// **'Dönüştürülecek klasörü seçin'**
  String get cvMainPickFolder;

  /// No description provided for @cvMainSaveTranscript.
  ///
  /// In tr, this message translates to:
  /// **'Metni kaydet'**
  String get cvMainSaveTranscript;

  /// No description provided for @cvMainUntitled.
  ///
  /// In tr, this message translates to:
  /// **'Adsız proje'**
  String get cvMainUntitled;

  /// No description provided for @sqOp.
  ///
  /// In tr, this message translates to:
  /// **'büyük ya da eşit'**
  String get sqOp;

  /// No description provided for @sqOpNotcontains.
  ///
  /// In tr, this message translates to:
  /// **'içermez'**
  String get sqOpNotcontains;

  /// No description provided for @sqOpNotlike.
  ///
  /// In tr, this message translates to:
  /// **'NOT LIKE'**
  String get sqOpNotlike;

  /// No description provided for @sqOpNotin.
  ///
  /// In tr, this message translates to:
  /// **'içinde değil'**
  String get sqOpNotin;

  /// No description provided for @sqOpIsnull.
  ///
  /// In tr, this message translates to:
  /// **'boş (NULL)'**
  String get sqOpIsnull;

  /// No description provided for @sqOpIsnotnull.
  ///
  /// In tr, this message translates to:
  /// **'boş değil'**
  String get sqOpIsnotnull;
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
