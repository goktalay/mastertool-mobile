// ignore: unused_import
import 'package:intl/intl.dart' as intl;

import 'mt_strings.dart';

// ignore_for_file: type=lint

/// The translations for Turkish (`tr`).
class MtStringsTr extends MtStrings {
  MtStringsTr([String locale = 'tr']) : super(locale);

  @override
  String get setGeneral => 'Genel';

  @override
  String get setAccount => 'Hesap';

  @override
  String get setAbout => 'Hakkında';

  @override
  String aboutVersion(String version) {
    return 'Sürüm $version';
  }

  @override
  String get aboutFamily =>
      'Mastertool ailesi: SSH Master · FTP Masters · SQL Master · Notepad Master · Convert Master · IP Tools';

  @override
  String get aboutCheckUpdate => 'Güncellemeleri denetle';

  @override
  String get aboutChecking => 'Denetleniyor…';

  @override
  String aboutUpToDate(String app) {
    return '$app güncel.';
  }

  @override
  String aboutCheckFailed(String msg) {
    return 'Güncelleme denetlenemedi: $msg';
  }

  @override
  String get aboutLicenses => 'Açık kaynak lisansları';

  @override
  String aboutLicensesIntro(String app) {
    return '$app şu açık kaynak bileşenleri kullanır:';
  }

  @override
  String authErrAppDisabled(String app) {
    return 'Bu hesapta $app kullanımı yönetici tarafından kapatılmış. Hesap yöneticinizle iletişime geçin.';
  }

  @override
  String authErrWrongApp(String app) {
    return 'Bu oturum başka bir uygulamaya ait. Lütfen $app için yeniden giriş yapın.';
  }

  @override
  String get authSignedOut =>
      'Bu bilgisayardaki bir Mastertool uygulamasında çıkış yapıldı. Tekrar giriş yapın.';

  @override
  String get authSubtitle => 'Hesabınızla giriş yapın';

  @override
  String get authEmail => 'E-posta';

  @override
  String get authPassword => 'Şifre';

  @override
  String get authRemember => 'Beni hatırla';

  @override
  String get authForgot => 'Şifremi unuttum';

  @override
  String get authNoAccount => 'Hesabınız yok mu?';

  @override
  String get authRegister => 'Hesap oluştur';

  @override
  String get authSubmit => 'Giriş yap';

  @override
  String get authWorking => 'Giriş yapılıyor…';

  @override
  String get authErrRequired => 'E-posta ve şifre gerekli.';

  @override
  String get authErrBadCredentials => 'E-posta veya şifre hatalı.';

  @override
  String get authErrUnverified =>
      'E-posta adresiniz henüz doğrulanmadı. Gelen kutunuzdaki bağlantıya tıklayın.';

  @override
  String get authErrSuspended => 'Hesabınız askıya alınmış.';

  @override
  String get authErrRateLimited =>
      'Çok fazla deneme yapıldı. Bir dakika sonra tekrar deneyin.';

  @override
  String get authErrOffline =>
      'Sunucuya ulaşılamıyor. İnternet bağlantınızı kontrol edin.';

  @override
  String get authErrSessionExpired =>
      'Oturumunuzun süresi doldu ya da şifreniz değişti. Lütfen yeniden giriş yapın.';

  @override
  String authErrServer(String msg) {
    return 'Giriş yapılamadı: $msg';
  }

  @override
  String get acctSection => 'Hesap ve senkronizasyon';

  @override
  String acctSignedInAs(String email) {
    return '$email olarak giriş yapıldı';
  }

  @override
  String get acctSyncToggle => 'Bağlantıları web ile senkronize et';

  @override
  String get acctSyncHint =>
      'Bağlantılar, klasörler ve kısayollar uçtan uca şifrelenerek hesabınıza yedeklenir; sunucu içeriği okuyamaz. Yazı boyutu, tepsi gibi cihaz ayarları gönderilmez.';

  @override
  String acctLastSync(String time) {
    return 'Son senkron: $time';
  }

  @override
  String get acctNever => 'Henüz senkronize edilmedi';

  @override
  String get acctSyncNow => 'Şimdi senkronize et';

  @override
  String get acctDeleteRemote => 'Sunucudaki kopyayı sil';

  @override
  String get acctDeleteRemoteMsg =>
      'Hesabınızdaki şifreli kütüphane kopyası silinecek ve senkronizasyon kapatılacak. Bu bilgisayardaki bağlantılar silinmez.';

  @override
  String get acctDeleteRemoteDone =>
      'Sunucudaki kopya silindi; senkronizasyon kapatıldı';

  @override
  String get acctLogout => 'Çıkış yap';

  @override
  String get acctLogoutMsg =>
      'Hesabınızdan çıkış yapılacak. Bu cihazdaki bağlantılar ve projeler silinmez.';

  @override
  String get acctMyAccount => 'Hesabım (web)';

  @override
  String get acctBackupNotice =>
      'Farklı bir hesapla giriş yapıldı; bu bilgisayardaki önceki bağlantılar yedeklendi.';

  @override
  String get syncOff => 'Senkronizasyon kapalı';

  @override
  String get syncSyncing => 'Senkronize ediliyor…';

  @override
  String get syncOffline =>
      'Çevrimdışı — değişiklikler bağlantı gelince gönderilecek';

  @override
  String get syncErrDecrypt =>
      'Sunucudaki kopya bu hesabın anahtarıyla çözülemedi; bu bilgisayardaki bağlantılar korunuyor.';

  @override
  String get syncErrTooLarge =>
      'Kütüphane 5 MB sınırını aşıyor; senkronize edilemedi.';

  @override
  String syncError(String msg) {
    return 'Senkron hatası: $msg';
  }

  @override
  String get commonCancel => 'İptal';

  @override
  String get commonSave => 'Kaydet';

  @override
  String get commonCreate => 'Oluştur';

  @override
  String get commonOk => 'Tamam';

  @override
  String get commonDelete => 'Sil';

  @override
  String get commonGiveUp => 'Vazgeç';

  @override
  String get commonOpen => 'Aç';

  @override
  String get commonEdit => 'Düzenle';

  @override
  String get commonRename => 'Yeniden adlandır';

  @override
  String get commonRefresh => 'Yenile';

  @override
  String get commonNewFolder => 'Yeni klasör';

  @override
  String get commonCopyPath => 'Yolu kopyala';

  @override
  String get commonMove => 'Taşı';

  @override
  String get commonMoveEllipsis => 'Taşı…';

  @override
  String get commonShow => 'Göster';

  @override
  String get commonChoose => 'Seç…';

  @override
  String get commonConnect => 'Bağlan';

  @override
  String get commonNew => 'Yeni';

  @override
  String get commonCopy => 'Kopyala';

  @override
  String get commonPaste => 'Yapıştır';

  @override
  String commonLocation(String path) {
    return 'Konum: $path';
  }

  @override
  String get commonNewName => 'Yeni ad';

  @override
  String get commonFolderName => 'Klasör adı';

  @override
  String get setTitle => 'Ayarlar';

  @override
  String get setAppearance => 'Görünüm';

  @override
  String get setTheme => 'Tema';

  @override
  String get setThemeDark => 'Gece';

  @override
  String get setThemeLight => 'Gündüz';

  @override
  String get setThemeSystem => 'Sistem tercihi';

  @override
  String get setLanguage => 'Dil';

  @override
  String get setLanguageHint => 'Dil hemen uygulanır.';

  @override
  String get setSaved => 'Ayarlar kaydedildi';

  @override
  String get mobModules => 'Modüller';

  @override
  String get mobDisabled => 'Hesabınızda kapalı';

  @override
  String get mobSoon => 'Bu modül hazırlanıyor';

  @override
  String get mobOpen => 'Aç';

  @override
  String get mobRefresh => 'Yenile';

  @override
  String get mobSettings => 'Ayarlar';

  @override
  String mobWelcome(String name) {
    return 'Hoş geldiniz, $name';
  }

  @override
  String get mobNoModules =>
      'Modül listesi alınamadı. Bağlantınızı denetleyip yenileyin.';

  @override
  String get mobSite => 'mastertool.download';

  @override
  String get mobLangSystem => 'Sistem dili';

  @override
  String get mobSsoHint =>
      'Bir kez giriş yapmanız yeter: SSH Master, FTP Masters, SQL Master, Notepad Master, Convert Master ve IP Tools bu uygulamanın içinde açılır.';

  @override
  String mobOpenCount(String open, String total) {
    return '$open/$total modül açık';
  }

  @override
  String get mobModulesHint => 'Tıklayınca açılır';

  @override
  String get mobTapToOpen => 'Kullanıma hazır';

  @override
  String get mobVisitSite => 'Web sitesini ziyaret et';
}
