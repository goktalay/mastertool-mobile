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
