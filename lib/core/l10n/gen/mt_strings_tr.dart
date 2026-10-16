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

  @override
  String get smAppSearchPh => 'Bağlantılarda ara…  (Ctrl+F)';

  @override
  String get smAppNewConn => 'Yeni bağlantı';

  @override
  String smAppSplit(String n) {
    return 'Bölünmüş aç ($n)';
  }

  @override
  String get smAppSplitTitle => 'Seçili bağlantıları tek pencerede bölünmüş aç';

  @override
  String get smAppSettings => 'Ayarlar';

  @override
  String smAppStats(String c, String f) {
    return '$c bağlantı · $f klasör';
  }

  @override
  String get smAppWelcome => 'Hoş geldiniz';

  @override
  String smAppResults(String q) {
    return '“$q” için sonuçlar';
  }

  @override
  String get smAppAll => 'Tüm bağlantılar';

  @override
  String get smAppWelcomeHint =>
      'İlk SSH bağlantınızı oluşturun.<br>Sunucu bilgilerini girin, test edin ve kaydedin.';

  @override
  String get smAppFolders => 'Klasörler';

  @override
  String get smAppConnections => 'Bağlantılar';

  @override
  String get smAppMultiHint =>
      'Ctrl+tık ile birden fazla seçip tek pencerede bölünmüş açabilirsiniz';

  @override
  String get smAppNoMatch => 'Eşleşen bağlantı bulunamadı.';

  @override
  String smAppFolderCount(String n) {
    return '$n bağlantı';
  }

  @override
  String get smAppFolderOpenSplit => 'Klasördeki bağlantıları bölünmüş aç';

  @override
  String get smAppNewConnHere => 'Bu klasörde yeni bağlantı';

  @override
  String get smAppNewSubfolder => 'Alt klasör oluştur';

  @override
  String get smAppKeyTag => 'Anahtar';

  @override
  String get smAppLastDir => 'Son klasör';

  @override
  String get smAppLastDirTag => 'son klasör';

  @override
  String smAppMultiOpenSplit(String n) {
    return '$n bağlantıyı tek pencerede bölünmüş aç';
  }

  @override
  String get smAppOpenSeparate => 'Her birini ayrı pencerede aç';

  @override
  String get smAppClearSelection => 'Seçimi temizle';

  @override
  String get smAppSideBySide => 'Yan yana iki oturum aç';

  @override
  String get smAppDuplicate => 'Kopyasını oluştur';

  @override
  String get smAppMoveToFolder => 'Klasöre taşı…';

  @override
  String get smAppResetLastDir => 'Son klasörü sıfırla';

  @override
  String get smAppConnMoved => 'Bağlantı taşındı';

  @override
  String get smAppFolderIntoSelf => 'Klasör kendi alt klasörüne taşınamaz';

  @override
  String get smAppFolderPh => 'ör. Üretim sunucuları';

  @override
  String get smAppRenameFolder => 'Klasörü yeniden adlandır';

  @override
  String get smAppDeleteFolder => 'Klasörü sil';

  @override
  String smAppDeleteFolderMsg(String name) {
    return '<b>$name</b> klasörü silinecek.';
  }

  @override
  String smAppDeleteFolderConns(String n) {
    return ' İçindeki $n bağlantı silinmez, bir üst klasöre taşınır.';
  }

  @override
  String get smAppRootFolder => 'Tüm bağlantılar (kök)';

  @override
  String smAppMoveTitle(String name) {
    return '“$name” taşı';
  }

  @override
  String get smAppTargetFolder => 'Hedef klasör';

  @override
  String get smAppDeleteConn => 'Bağlantıyı sil';

  @override
  String smAppDeleteConnMsg(String name, String target) {
    return '<b>$name</b> ($target) kalıcı olarak silinecek.';
  }

  @override
  String get smAppMaxPanes => 'En fazla 6 bölme açılabilir';

  @override
  String get smAppMaxPanesSub => 'İlk 6 bağlantı açıldı';

  @override
  String get smFormTitleNew => 'Yeni SSH bağlantısı';

  @override
  String get smFormTitleEdit => 'Bağlantıyı düzenle';

  @override
  String get smFormName => 'Bağlantı adı';

  @override
  String get smFormNamePh => 'ör. Web sunucusu';

  @override
  String get smFormHost => 'IP adresi / Sunucu';

  @override
  String get smFormHostPh => '192.168.1.10 veya sunucu.com';

  @override
  String get smFormPort => 'Port';

  @override
  String get smFormUser => 'Kullanıcı adı';

  @override
  String get smFormAuth => 'Kimlik doğrulama';

  @override
  String get smFormPassword => 'Şifre';

  @override
  String get smFormPrivateKey => 'Özel anahtar';

  @override
  String get smFormPwSaved => '•••••••• (kayıtlı — değiştirmek için yazın)';

  @override
  String get smFormKeyFile => 'Anahtar dosyası';

  @override
  String get smFormPassphrase => 'Anahtar parolası (varsa)';

  @override
  String get smFormPassSaved => '•••••••• (kayıtlı)';

  @override
  String get smFormPassEmpty => 'Yoksa boş bırakın';

  @override
  String get smFormFolder => 'Klasör';

  @override
  String get smFormColor => 'Renk';

  @override
  String get smFormPalette => 'Konsol renk paleti';

  @override
  String get smFormLastDir => 'Son kaldığım klasöre git';

  @override
  String get smFormLastDirHint =>
      'Bağlanınca terminal ve dosya yöneticisi en son çalıştığınız klasörde açılır.';

  @override
  String get smFormLastDirNow => 'Şu an:';

  @override
  String get smFormConnecting => 'Bağlanılıyor…';

  @override
  String get smFormTestOk => 'Bağlantı başarılı';

  @override
  String smFormHostKey(String fp) {
    return 'Host anahtarı (SHA256): $fp';
  }

  @override
  String get smFormTestFail => 'Bağlantı başarısız';

  @override
  String get smFormSaved => 'Bağlantı kaydedildi';

  @override
  String get smFormChangesSaved => 'Değişiklikler kaydedildi';

  @override
  String get smFormTest => 'Bağlantıyı test et';

  @override
  String get smFormSaveConnect => 'Kaydet ve bağlan';

  @override
  String get smPaneToggleSidebar => 'Sol paneli aç/kapat (Ctrl+B)';

  @override
  String get smPaneDefaultName => 'Bağlantı';

  @override
  String get smPaneSplitRight => 'Sağa böl';

  @override
  String get smPaneSplitDown => 'Aşağı böl';

  @override
  String get smPaneReconnect => 'Yeniden bağlan';

  @override
  String get smPaneClose => 'Bölmeyi kapat';

  @override
  String get smPaneSaveSelShortcut => 'Seçimi kısayol olarak kaydet';

  @override
  String get smPanePaletteMenu => 'Konsol renk paleti…';

  @override
  String get smPaneSelectAll => 'Tümünü seç';

  @override
  String get smPaneClear => 'Ekranı temizle';

  @override
  String get smPaneStatusConnecting => 'bağlanılıyor…';

  @override
  String get smPaneStatusNoConn => 'bağlantı yok';

  @override
  String get smPaneStatusClosed => 'bağlantı kapandı';

  @override
  String get smTermConnecting => 'Bağlanılıyor…';

  @override
  String get smTermConnectFailed => 'Bağlantı kurulamadı:';

  @override
  String get smTermRetryEnter => 'Yeniden denemek için Enter\'a basın.';

  @override
  String get smTermClosed => 'Bağlantı kapandı.';

  @override
  String get smTermReconnectEnter => 'Yeniden bağlanmak için Enter\'a basın.';

  @override
  String smTermMaxPanes(String n) {
    return 'Bir pencerede en fazla $n bölme açılabilir';
  }

  @override
  String smTermSessions(String n) {
    return '$n oturum';
  }

  @override
  String get smTermToggleAll => 'Tüm sol panelleri aç/kapat';

  @override
  String get smTermSplitRightTitle => 'Aktif bölmeyi sağa böl (Ctrl+Shift+E)';

  @override
  String get smTermSplitDownTitle => 'Aktif bölmeyi aşağı böl (Ctrl+Shift+O)';

  @override
  String get smTermSyncOn => 'Tüm bölmelere yazılıyor';

  @override
  String get smTermSyncOff => 'Tüm bölmelere yaz';

  @override
  String get smTermSyncTitle => 'Yazdıklarınız tüm bağlı bölmelere gönderilir';

  @override
  String get smPickerSearch => 'Bağlantı ara…';

  @override
  String get smPickerSameServer => 'aynı sunucu';

  @override
  String get smPickerNone => 'Eşleşen bağlantı yok';

  @override
  String get smPickerTitleRight => 'Sağa böl — bağlantı seç';

  @override
  String get smPickerTitleDown => 'Aşağı böl — bağlantı seç';

  @override
  String get smPaletteTitle => 'Konsol renk paleti';

  @override
  String smPaletteHint(String name) {
    return 'Seçtiğiniz palet bu bölmede anında önizlenir. Kaydederseniz bu bağlantının ($name) tüm oturumlarında kullanılır.';
  }

  @override
  String get smPaletteSaved => 'Renk paleti kaydedildi';

  @override
  String get smScTitleNew => 'Yeni kısayol';

  @override
  String get smScTitleEdit => 'Kısayolu düzenle';

  @override
  String get smScName => 'Kısayol adı';

  @override
  String get smScNamePh => 'ör. Nginx yeniden başlat';

  @override
  String get smScCommand => 'Komut';

  @override
  String get smScEnter => 'Yapıştırdıktan sonra Enter\'a bas';

  @override
  String get smScEnterHint =>
      'Kapalıysa komut sadece imlecin olduğu yere yazılır, siz çalıştırırsınız.';

  @override
  String get smScEmpty =>
      'Henüz kısayol yok.<br>Sık kullandığınız komutları <b>+</b> ile ekleyin, çift tıklayarak terminale yapıştırın.';

  @override
  String get smScItemTitle => 'Çift tıkla: bu bölmenin terminaline yapıştır';

  @override
  String get smScAutoEnter => 'Otomatik Enter';

  @override
  String get smScPaste => 'Terminale yapıştır';

  @override
  String get smScPasteNoEnter => 'Enter olmadan yapıştır';

  @override
  String get smScPasteRun => 'Yapıştır ve çalıştır';

  @override
  String get smScCopy => 'Panoya kopyala';

  @override
  String get smScNew => 'Yeni kısayol';

  @override
  String get smSbShortcuts => 'Kısayollar';

  @override
  String get smSbAddShortcut => 'Kısayol ekle';

  @override
  String get smSbServer => 'Sunucu';

  @override
  String smSbServerHost(String host) {
    return 'Sunucu · $host';
  }

  @override
  String get smSbFollow => 'Terminal klasörünü takip et';

  @override
  String get smSbHome => 'Ev klasörü';

  @override
  String get smSbUp => 'Üst klasör';

  @override
  String get smSbComputer => 'Bilgisayarım';

  @override
  String get smSbPlaces => 'Sürücüler ve konumlar';

  @override
  String get smSbResize => 'Sürükleyerek genişliği değiştirin';

  @override
  String get smFmLoading => 'Yükleniyor…';

  @override
  String smFmOpenFailed(String msg) {
    return 'Açılamadı: $msg';
  }

  @override
  String get smFmEmpty => 'Klasör boş';

  @override
  String get smFmNoConn => 'Bağlantı yok.';

  @override
  String get smFmClosed => 'Bağlantı kapandı.';

  @override
  String get smFmWaiting => 'Bağlantı bekleniyor…';

  @override
  String smFmDownloadTo(String path) {
    return 'İndir → $path';
  }

  @override
  String smFmUploadTo(String path) {
    return 'Yükle → $path';
  }

  @override
  String get smFmServer => 'sunucu';

  @override
  String get smFmCdHere => 'Terminalde bu klasöre git';

  @override
  String get smFmPastePath => 'Yolu terminale yapıştır';

  @override
  String smFmDeleteWhat(String what) {
    return 'Sil ($what)';
  }

  @override
  String smFmNItems(String n) {
    return '$n öğe';
  }

  @override
  String get smFmOpenDefault => 'Varsayılan uygulamayla aç';

  @override
  String get smFmReveal => 'Gezgin’de göster';

  @override
  String get smFmOpenExplorer => 'Gezgin’de aç';

  @override
  String get smFmFollowing =>
      'Dosya yöneticisi terminal klasörünü takip ediyor';

  @override
  String get smFmFollowOff => 'Takip kapatıldı';

  @override
  String get smFmNewRemote => 'Sunucuda yeni klasör';

  @override
  String get smFmDeleteTitle => 'Sunucudan sil';

  @override
  String smFmAndMore(String n) {
    return ' ve $n öğe daha';
  }

  @override
  String smFmDeleteMsg(String names) {
    return '$names sunucudan <b>kalıcı olarak</b> silinecek. Klasörler içerikleriyle birlikte silinir.';
  }

  @override
  String get smPlaceDesktop => 'Masaüstü';

  @override
  String get smPlaceDownloads => 'İndirilenler';

  @override
  String get smPlaceDocuments => 'Belgeler';

  @override
  String get smPlaceHome => 'Kullanıcı klasörü';

  @override
  String smPlaceDrive(String d) {
    return 'Yerel Disk ($d)';
  }

  @override
  String get smErrNoConn => 'Bağlantı yok';

  @override
  String get smErrConnectFirst => 'Önce sunucuya bağlanın';

  @override
  String get smErrMkdir => 'Klasör oluşturulamadı';

  @override
  String get smErrRename => 'Yeniden adlandırılamadı';

  @override
  String smErrDelete(String name) {
    return 'Silinemedi: $name';
  }

  @override
  String get smTrPanelTitle => 'Aktarımlar';

  @override
  String get smTrClearDone => 'Bitenleri temizle';

  @override
  String get smTrQueued => 'Sırada';

  @override
  String get smTrScanning => 'Dosyalar taranıyor…';

  @override
  String smTrFileCount(String i, String n) {
    return '$i / $n dosya';
  }

  @override
  String smTrEta(String time) {
    return '~$time kaldı';
  }

  @override
  String smTrDownloading(String name) {
    return 'İndiriliyor: $name';
  }

  @override
  String smTrUploading(String name) {
    return 'Yükleniyor: $name';
  }

  @override
  String get smTrDone => 'Tamamlandı';

  @override
  String get smTrCancelled => 'İptal edildi';

  @override
  String get smTrFailed => 'Başarısız';

  @override
  String get smTrRemoveFromList => 'Listeden kaldır';

  @override
  String get smTrAlwaysBackground =>
      'Büyük aktarımları bundan sonra hep arka planda göster';

  @override
  String get smTrShowInBackground => 'Arka planda göster';

  @override
  String get smTrDownloadDone => 'İndirme tamamlandı';

  @override
  String get smTrUploadDone => 'Yükleme tamamlandı';

  @override
  String smTrDownloadFailed(String name) {
    return 'İndirilemedi: $name';
  }

  @override
  String smTrUploadFailed(String name) {
    return 'Yüklenemedi: $name';
  }

  @override
  String get smTrCancelledToast => 'Aktarım iptal edildi';

  @override
  String smTimeHm(String h, String m) {
    return '$h sa $m dk';
  }

  @override
  String smTimeMs(String m, String s) {
    return '$m dk $s sn';
  }

  @override
  String smTimeS(String s) {
    return '$s sn';
  }

  @override
  String get smMainErrAuth =>
      'Kimlik doğrulama başarısız: kullanıcı adı veya şifre hatalı.';

  @override
  String get smMainErrRefused =>
      'Bağlantı reddedildi: port kapalı veya SSH servisi çalışmıyor.';

  @override
  String get smMainErrTimeout => 'Zaman aşımı: sunucuya ulaşılamadı.';

  @override
  String get smMainErrDns => 'Sunucu adı çözümlenemedi (DNS).';

  @override
  String get smMainErrUnreach => 'Sunucuya ağ üzerinden ulaşılamıyor.';

  @override
  String get smMainErrKeyFile => 'Anahtar dosyası bulunamadı.';

  @override
  String smMainErrHostKey(String newFp, String oldFp) {
    return 'Sunucu host anahtarı değişmiş! Kayıtlı: $oldFp, gelen: $newFp. Güvenlik nedeniyle bağlantı reddedildi.';
  }

  @override
  String get smMainErrConnNotFound => 'Bağlantı bulunamadı';

  @override
  String get smMainErrNoSession => 'Aktif SSH oturumu yok';

  @override
  String get smMainErrHostUser => 'Sunucu adresi ve kullanıcı adı gerekli.';

  @override
  String get smMainTrayShow => 'SSH Master’ı göster';

  @override
  String get smMainTrayQuick => 'Hızlı bağlan';

  @override
  String get smMainTrayNone => 'Kayıtlı bağlantı yok';

  @override
  String get smMainTrayQuit => 'Çıkış';

  @override
  String get smMainBalloonTitle => 'SSH Master arka planda çalışıyor';

  @override
  String get smMainBalloonBody =>
      'Tekrar açmak için tepsideki simgeye tıklayın.';

  @override
  String get smMainPickKey => 'Özel anahtar dosyası seç';

  @override
  String get smMainCopySuffix => ' (kopya)';

  @override
  String get smMainDefDisk => 'Disk kullanımı';

  @override
  String get smMainDefMem => 'Bellek';

  @override
  String get smMainDefTop => 'Süreçler (top)';

  @override
  String get smAppNotesLabel => 'Notlar';

  @override
  String get fmAppSearchPh => 'Sitelerde ara…  (Ctrl+F)';

  @override
  String get fmAppNewConn => 'Yeni site';

  @override
  String get fmAppSettings => 'Ayarlar';

  @override
  String fmAppStats(String c, String f) {
    return '$c site · $f klasör';
  }

  @override
  String get fmAppWelcome => 'Hoş geldiniz';

  @override
  String fmAppResults(String q) {
    return '“$q” için sonuçlar';
  }

  @override
  String get fmAppAll => 'Tüm siteler';

  @override
  String get fmAppWelcomeHint =>
      'İlk FTP / SFTP sitenizi oluşturun.<br>Sunucu bilgilerini girin, bağlantıyı test edin ve kaydedin.';

  @override
  String get fmAppFolders => 'Klasörler';

  @override
  String get fmAppConnections => 'Siteler';

  @override
  String get fmAppDblHint => 'Bağlanmak için karta çift tıklayın';

  @override
  String get fmAppNoMatch => 'Eşleşen site bulunamadı.';

  @override
  String fmAppFolderCount(String n) {
    return '$n site';
  }

  @override
  String get fmAppNewConnHere => 'Bu klasörde yeni site';

  @override
  String get fmAppNewSubfolder => 'Alt klasör oluştur';

  @override
  String get fmAppKeyTag => 'Anahtar';

  @override
  String get fmAppLastDir => 'Son klasör';

  @override
  String get fmAppLastDirTag => 'son klasör';

  @override
  String get fmAppDuplicate => 'Kopyasını oluştur';

  @override
  String get fmAppMoveToFolder => 'Klasöre taşı…';

  @override
  String get fmAppResetLastDir => 'Son klasörü sıfırla';

  @override
  String get fmAppConnMoved => 'Site taşındı';

  @override
  String get fmAppFolderIntoSelf => 'Klasör kendi içine taşınamaz';

  @override
  String get fmAppFolderPh => 'Örn. Müşteriler';

  @override
  String get fmAppRenameFolder => 'Klasörü yeniden adlandır';

  @override
  String get fmAppDeleteFolder => 'Klasörü sil';

  @override
  String fmAppDeleteFolderMsg(String name) {
    return '<b>$name</b> klasörü silinsin mi?';
  }

  @override
  String fmAppDeleteFolderConns(String n) {
    return '<br>İçindeki $n site üst klasöre taşınacak.';
  }

  @override
  String get fmAppRootFolder => 'Ana dizin (klasörsüz)';

  @override
  String fmAppMoveTitle(String name) {
    return '“$name” taşı';
  }

  @override
  String get fmAppTargetFolder => 'Hedef klasör';

  @override
  String get fmAppDeleteConn => 'Siteyi sil';

  @override
  String fmAppDeleteConnMsg(String name, String target) {
    return '<b>$name</b> ($target) sitesi silinsin mi?';
  }

  @override
  String get fmFormTitleNew => 'Yeni site';

  @override
  String fmFormTitleEdit(String name) {
    return 'Site özellikleri: $name';
  }

  @override
  String get fmFormTabGeneral => 'Genel';

  @override
  String get fmFormTabActions => 'Eylemler';

  @override
  String get fmFormTabType => 'Tür';

  @override
  String get fmFormTabOptions => 'Seçenekler';

  @override
  String get fmFormName => 'Etiket (görünen ad)';

  @override
  String get fmFormNamePh => 'Örn. Şirket web sitesi';

  @override
  String get fmFormHost => 'Sunucu adresi';

  @override
  String get fmFormHostPh => 'ftp.ornek.com veya 192.168.1.10';

  @override
  String get fmFormPort => 'Port';

  @override
  String get fmFormUser => 'Kullanıcı adı';

  @override
  String get fmFormPassword => 'Şifre';

  @override
  String get fmFormPwSaved => '•••••••• (kayıtlı, değiştirmek için yazın)';

  @override
  String get fmFormLoginMethod => 'Giriş yöntemi';

  @override
  String get fmFormLoginNormal => 'Normal';

  @override
  String get fmFormLoginAnon => 'Anonim';

  @override
  String get fmFormAuth => 'SFTP kimlik doğrulama';

  @override
  String get fmFormPrivateKey => 'Özel anahtar';

  @override
  String get fmFormKeyFile => 'Özel anahtar dosyası';

  @override
  String get fmFormPassphrase => 'Anahtar parolası';

  @override
  String get fmFormPassSaved => '(kayıtlı)';

  @override
  String get fmFormPassEmpty => 'Yoksa boş bırakın';

  @override
  String get fmFormFolder => 'Klasör';

  @override
  String get fmFormColor => 'Renk';

  @override
  String get fmFormComments => 'Notlar';

  @override
  String get fmFormRemoteDir => 'Bağlanınca bu uzak klasöre geç';

  @override
  String get fmFormLocalDir => 'Bağlanınca bu yerel klasöre geç';

  @override
  String get fmFormLocalDirPh => 'Örn. C:\\Projeler\\site';

  @override
  String get fmFormLastDir => 'Son kaldığım klasöre git';

  @override
  String get fmFormLastDirHint =>
      'Açıkken site, en son çalıştığınız sunucu ve bilgisayar klasörleriyle açılır (yukarıdaki klasörlerin yerine).';

  @override
  String get fmFormLastDirNow => 'Şu an:';

  @override
  String get fmFormCache => 'Gezinmede önbellek kullanımı';

  @override
  String get fmFormCacheSession => 'Oturum boyunca önbellek kullan';

  @override
  String get fmFormCacheAlways =>
      'Her zaman önbellek kullan (uygulama açık kaldıkça)';

  @override
  String get fmFormCacheNever =>
      'Önbellek kullanma (her seferinde yeniden listele)';

  @override
  String get fmFormUploadCase =>
      'Yüklerken dosya ve klasör adlarına uygulanacak kural';

  @override
  String get fmFormCasePreserve => 'Büyük/küçük harfi koru';

  @override
  String get fmFormCaseLower => 'Küçük harfe çevir';

  @override
  String get fmFormCaseUpper => 'Büyük harfe çevir';

  @override
  String get fmFormTest => 'Bağlantıyı dene';

  @override
  String get fmFormSaveConnect => 'Kaydet ve bağlan';

  @override
  String get fmFormConnecting => 'Bağlanılıyor…';

  @override
  String get fmFormTestOk => 'Bağlantı başarılı';

  @override
  String get fmFormTestFail => 'Bağlantı kurulamadı';

  @override
  String fmFormHomeDir(String dir) {
    return 'Başlangıç klasörü: $dir';
  }

  @override
  String get fmFormRemoteDirMissing =>
      'Uyarı: belirtilen uzak klasör açılamadı.';

  @override
  String fmFormHostKey(String fp) {
    return 'SSH host anahtarı (SHA256): $fp';
  }

  @override
  String get fmFormSaved => 'Site kaydedildi';

  @override
  String get fmFormChangesSaved => 'Değişiklikler kaydedildi';

  @override
  String get fmTypeProtocol => 'Protokol';

  @override
  String get fmTypeFtp => 'FTP (standart dosya aktarım protokolü)';

  @override
  String get fmTypeFtpsImplicit => 'FTP — TLS/SSL (Implicit, port 990)';

  @override
  String get fmTypeFtpsSsl => 'FTP — SSL (AUTH SSL, Explicit)';

  @override
  String get fmTypeFtpsTls => 'FTP — TLS/SSL (AUTH TLS, Explicit)';

  @override
  String get fmTypeSftp => 'SFTP — SSH2 (Güvenli Kabuk)';

  @override
  String get fmTypeNoteFtp =>
      'Komut ve veri bağlantıları için standart FTP kullanılır; şifre ve dosyalar şifrelenmeden (düz metin) gönderilir.';

  @override
  String get fmTypeNoteFtpsImplicit =>
      'Bağlantı en baştan TLS/SSL ile şifrelenir (genellikle port 990). Komutlar ve veriler korunur.';

  @override
  String get fmTypeNoteFtpsSsl =>
      'Düz FTP ile bağlanıp AUTH SSL komutuyla şifreli oturuma geçilir. Komutlar ve veriler korunur.';

  @override
  String get fmTypeNoteFtpsTls =>
      'Düz FTP ile bağlanıp AUTH TLS komutuyla şifreli oturuma geçilir (en yaygın FTPS türü).';

  @override
  String get fmTypeNoteSftp =>
      'SSH üzerinden şifreli dosya aktarımı (port 22). Şifre veya özel anahtarla giriş yapılır; sunucu host anahtarı ilk bağlantıda kaydedilir.';

  @override
  String get fmTypeTransferType => 'Aktarım türü';

  @override
  String get fmTypeBinary => 'İkili (Binary)';

  @override
  String get fmTypeAscii => 'ASCII (metin)';

  @override
  String get fmTypeAuto => 'Otomatik (metin dosyaları ASCII)';

  @override
  String fmTypeUseGlobal(String v) {
    return 'Genel ayarı kullan ($v)';
  }

  @override
  String get fmTypeDataConn => 'Veri bağlantısı';

  @override
  String get fmTypePassive => 'Pasif (PASV / EPSV)';

  @override
  String get fmTypeTimezone => 'Sunucu saat dilimi farkı';

  @override
  String get fmTypeTzNone => 'Fark yok';

  @override
  String get fmTypeTzHours => 'saat';

  @override
  String get fmTypeTimezoneHint =>
      'Sunucunun listelediği dosya saatleri bu kadar kaydırılarak gösterilir.';

  @override
  String get fmOptSiteOptions => 'Siteye özel ayarlar';

  @override
  String get fmOptUseGlobal => 'Tüm seçenekler için genel ayarları kullan';

  @override
  String get fmOptCustom => 'Bu siteye özel ayarlar kullan';

  @override
  String get fmOptRetry => 'Tekrar deneme sayısı';

  @override
  String get fmOptRetryDelay => 'Denemeler arası bekleme (sn)';

  @override
  String get fmOptMaxConcurrent => 'Aynı anda en fazla aktarım';

  @override
  String get fmOptConflict => 'Hedefte aynı adlı dosya varsa';

  @override
  String get fmOptConflictOverwrite => 'Üzerine yaz';

  @override
  String get fmOptConflictRename => 'Otomatik yeniden adlandır (ad (1).uzantı)';

  @override
  String get fmOptConflictSkip => 'Atla';

  @override
  String get fmOptEncoding => 'Dosya adı kodlaması';

  @override
  String get fmOptEncAuto => 'Otomatik';

  @override
  String get fmSiteLocal => 'Bilgisayarım';

  @override
  String get fmSiteRemote => 'Sunucu';

  @override
  String get fmSiteTransfers => 'Aktarımlar';

  @override
  String get fmSiteToggleLocal => 'Bilgisayarım panelini aç/kapat (Ctrl+B)';

  @override
  String get fmSiteToggleTransfers => 'Aktarımlar panelini aç/kapat (Ctrl+J)';

  @override
  String get fmSiteReconnect => 'Yeniden bağlan';

  @override
  String get fmSitePlaces => 'Hızlı erişim ve sürücüler';

  @override
  String get fmSiteUp => 'Üst klasör (Backspace)';

  @override
  String get fmSiteHome => 'Başlangıç klasörü';

  @override
  String get fmSiteColName => 'Ad';

  @override
  String get fmSiteColSize => 'Boyut';

  @override
  String get fmSiteColDate => 'Değiştirilme';

  @override
  String get fmSiteLoading => 'Yükleniyor…';

  @override
  String get fmSiteEmptyDir => 'Bu klasör boş';

  @override
  String get fmSiteDesktop => 'Masaüstü';

  @override
  String get fmSiteDownloads => 'İndirilenler';

  @override
  String get fmSiteDocuments => 'Belgeler';

  @override
  String get fmSiteHomeDir => 'Kullanıcı klasörü';

  @override
  String get fmSiteOpenExplorer => 'Gezgin\'de aç';

  @override
  String get fmSiteOpenFile => 'Varsayılan uygulamayla aç';

  @override
  String get fmSiteShowExplorer => 'Gezgin\'de göster';

  @override
  String get fmSiteUpload => 'Yükle (Upload)';

  @override
  String fmSiteUploadN(String n) {
    return '$n öğeyi yükle (Upload)';
  }

  @override
  String fmSiteUploadTo(String dir) {
    return 'Hedef: $dir';
  }

  @override
  String get fmSiteDownload => 'İndir (Download)';

  @override
  String fmSiteDownloadN(String n) {
    return '$n öğeyi indir (Download)';
  }

  @override
  String fmSiteDownloadTo(String dir) {
    return 'Hedef: $dir';
  }

  @override
  String get fmSiteTrash => 'Geri Dönüşüm Kutusu\'na taşı';

  @override
  String get fmSiteTrashOk => 'Taşı';

  @override
  String fmSiteTrashOne(String name) {
    return '<b>$name</b> Geri Dönüşüm Kutusu\'na taşınsın mı?';
  }

  @override
  String fmSiteTrashMany(String n) {
    return '$n öğe Geri Dönüşüm Kutusu\'na taşınsın mı?';
  }

  @override
  String get fmSiteMkdirFail => 'Klasör oluşturulamadı';

  @override
  String get fmSiteRenameFail => 'Yeniden adlandırılamadı';

  @override
  String get fmSiteDeleteFail => 'Silinemedi';

  @override
  String get fmSiteDeleteTitle => 'Sunucudan sil';

  @override
  String fmSiteDelOne(String name) {
    return '<b>$name</b> dosyası sunucudan kalıcı olarak silinsin mi?';
  }

  @override
  String fmSiteDelDirOne(String name) {
    return '<b>$name</b> klasörü ve tüm içeriği sunucudan kalıcı olarak silinsin mi?';
  }

  @override
  String fmSiteDelMany(String n) {
    return '$n öğe (klasörler tüm içerikleriyle) sunucudan kalıcı olarak silinsin mi?';
  }

  @override
  String get fmSiteDeleting => 'Siliniyor…';

  @override
  String get fmSiteDeleted => 'Silindi';

  @override
  String fmSiteItems(String n) {
    return '$n öğe';
  }

  @override
  String get fmSiteOffline => 'Bağlı değil';

  @override
  String fmSiteLimit(String v) {
    return 'Hız sınırı: $v';
  }

  @override
  String get fmSiteNoLimit => 'Hız sınırı yok';

  @override
  String get fmSiteLimitTitle => 'Hız sınırını ayarla';

  @override
  String fmSiteConnectFail(String msg) {
    return 'Sunucuya bağlanılamadı: $msg';
  }

  @override
  String get fmSiteConnectFailTitle => 'Bağlantı kurulamadı';

  @override
  String get fmSiteStateConnected => 'Bağlı';

  @override
  String get fmSiteStateConnecting => 'Bağlanılıyor…';

  @override
  String get fmSiteStateDisconnected => 'Bağlantı yok';

  @override
  String get fmTrColName => 'Ad';

  @override
  String get fmTrColSize => 'Boyut';

  @override
  String get fmTrColProgress => 'İlerleme';

  @override
  String get fmTrColStatus => 'Durum';

  @override
  String get fmTrEmpty =>
      'Henüz aktarım yok.\nBir dosyaya veya klasöre sağ tıklayıp İndir / Yükle seçin ya da paneller arasında sürükleyin.';

  @override
  String get fmTrQueued => 'Sırada';

  @override
  String get fmTrActive => 'Aktarılıyor';

  @override
  String get fmTrDone => 'Tamamlandı';

  @override
  String fmTrDoneFiles(String n) {
    return '$n dosya tamam';
  }

  @override
  String get fmTrError => 'Hata';

  @override
  String get fmTrCancelled => 'İptal edildi';

  @override
  String get fmTrSkipped => 'Atlandı (mevcut)';

  @override
  String fmTrScanning(String n) {
    return 'Taranıyor… $n dosya';
  }

  @override
  String get fmTrRetrying => 'Tekrar denenecek…';

  @override
  String get fmTrCancel => 'İptal et';

  @override
  String get fmTrCancelDir => 'Klasör aktarımını iptal et';

  @override
  String get fmTrCancelAll => 'Tüm aktarımları iptal et';

  @override
  String get fmTrCancelAllMsg =>
      'Süren ve sıradaki tüm aktarımlar iptal edilsin mi?';

  @override
  String get fmTrCancelAllOk => 'Tümünü iptal et';

  @override
  String get fmTrRetry => 'Yeniden dene';

  @override
  String get fmTrShowLocal => 'Gezgin\'de göster';

  @override
  String get fmTrShowRemote => 'Sunucuda göster';

  @override
  String get fmTrCopyError => 'Hata mesajını kopyala';

  @override
  String get fmTrRemove => 'Listeden kaldır';

  @override
  String get fmTrRemoveRoot => 'Bu aktarımı listeden kaldır';

  @override
  String get fmTrClearDone => 'Bitenleri temizle';

  @override
  String fmTrActiveN(String n) {
    return '$n aktarım sürüyor';
  }

  @override
  String get fmTrDownloadDone => 'İndirme tamamlandı';

  @override
  String get fmTrUploadDone => 'Yükleme tamamlandı';

  @override
  String fmTrDownloadFailed(String name) {
    return 'İndirme tamamlanamadı: $name';
  }

  @override
  String fmTrUploadFailed(String name) {
    return 'Yükleme tamamlanamadı: $name';
  }

  @override
  String fmTrFailedFiles(String n) {
    return '$n dosya aktarılamadı';
  }

  @override
  String get fmMainErrAuth =>
      'Giriş başarısız: kullanıcı adı veya şifre hatalı.';

  @override
  String get fmMainErrRefused =>
      'Bağlantı reddedildi: port kapalı veya sunucu çalışmıyor.';

  @override
  String get fmMainErrTimeout => 'Zaman aşımı: sunucuya ulaşılamadı.';

  @override
  String get fmMainErrDns => 'Sunucu adresi çözümlenemedi (DNS).';

  @override
  String get fmMainErrUnreach => 'Sunucuya ağ üzerinden erişilemiyor.';

  @override
  String get fmMainErrReset => 'Sunucu bağlantıyı kapattı.';

  @override
  String get fmMainErrNotFound => 'Dosya veya klasör bulunamadı.';

  @override
  String get fmMainErrPerm => 'Erişim izni yok.';

  @override
  String fmMainErr550(String msg) {
    return 'Sunucu işlemi reddetti (550): $msg';
  }

  @override
  String get fmMainErr553 =>
      'Dosya adı sunucu tarafından kabul edilmedi (553).';

  @override
  String fmMainErrTls(String msg) {
    return 'TLS/SSL hatası — protokolü veya portu kontrol edin. ($msg)';
  }

  @override
  String fmMainErrHostKey(String newVal, String oldVal) {
    return 'Sunucunun host anahtarı değişmiş! Kayıtlı: $oldVal, gelen: $newVal. Güvenlik için bağlantı reddedildi.';
  }

  @override
  String get fmMainErrConnNotFound => 'Site bulunamadı';

  @override
  String get fmMainErrNoSession => 'Sunucuya bağlı değil';

  @override
  String get fmMainErrHost => 'Sunucu adresi gerekli.';

  @override
  String get fmMainErrUser =>
      'Kullanıcı adı gerekli (veya Anonim girişi seçin).';

  @override
  String get fmMainPickKey => 'Özel anahtar dosyası seçin';

  @override
  String get fmMainCopySuffix => ' (kopya)';

  @override
  String get fmMainCloseActive =>
      'Süren aktarımlar var. Pencere kapatılırsa iptal edilecekler.';

  @override
  String get fmMainCloseAnyway => 'Yine de kapat';

  @override
  String get sqAppSearchPh => 'Bağlantılarda ara…  (Ctrl+F)';

  @override
  String get sqAppNewConn => 'Bağlantı ekle';

  @override
  String get sqAppAddConn => 'Bağlantı ekle';

  @override
  String get sqAppSettings => 'Ayarlar';

  @override
  String sqAppStats(String c, String f) {
    return '$c bağlantı · $f klasör';
  }

  @override
  String get sqAppWelcome => 'Hoş geldiniz';

  @override
  String sqAppResults(String q) {
    return '“$q” için sonuçlar';
  }

  @override
  String get sqAppAll => 'Tüm bağlantılar';

  @override
  String get sqAppWelcomeHint =>
      'PostgreSQL, SQL Server, MySQL, SQLite ya da CSV/Parquet/Excel dosyalarına bağlanın.<br>Bilgileri girin, bağlantıyı deneyin ve kaydedin.';

  @override
  String get sqAppFolders => 'Klasörler';

  @override
  String get sqAppConnections => 'Bağlantılar';

  @override
  String get sqAppDblHint => 'Açmak için karta çift tıklayın';

  @override
  String get sqAppNoMatch => 'Eşleşen bağlantı bulunamadı.';

  @override
  String sqAppFolderCount(String n) {
    return '$n bağlantı';
  }

  @override
  String get sqAppNewConnHere => 'Bu klasörde yeni bağlantı';

  @override
  String get sqAppNewSubfolder => 'Alt klasör oluştur';

  @override
  String get sqAppDuplicate => 'Kopyasını oluştur';

  @override
  String get sqAppMoveToFolder => 'Klasöre taşı…';

  @override
  String get sqAppConnMoved => 'Bağlantı taşındı';

  @override
  String get sqAppFolderIntoSelf => 'Klasör kendi içine taşınamaz';

  @override
  String get sqAppFolderPh => 'Örn. Müşteriler';

  @override
  String get sqAppRenameFolder => 'Klasörü yeniden adlandır';

  @override
  String get sqAppDeleteFolder => 'Klasörü sil';

  @override
  String sqAppDeleteFolderMsg(String name) {
    return '<b>$name</b> klasörü silinsin mi?';
  }

  @override
  String sqAppDeleteFolderConns(String n) {
    return '<br>İçindeki $n bağlantı üst klasöre taşınacak.';
  }

  @override
  String get sqAppRootFolder => 'Ana dizin (klasörsüz)';

  @override
  String sqAppMoveTitle(String name) {
    return '“$name” taşı';
  }

  @override
  String get sqAppTargetFolder => 'Hedef klasör';

  @override
  String get sqAppDeleteConn => 'Bağlantıyı sil';

  @override
  String sqAppDeleteConnMsg(String name, String target) {
    return '<b>$name</b> ($target) bağlantısı silinsin mi? Kayıtlı parolası da silinir.';
  }

  @override
  String get sqAppReadOnlyTag => 'Salt okunur';

  @override
  String get sqAppWriteTag => 'Yazılabilir';

  @override
  String get sqFormTitleNew => 'Yeni bağlantı';

  @override
  String sqFormTitleEdit(String name) {
    return 'Bağlantı: $name';
  }

  @override
  String get sqFormTabGeneral => 'Genel';

  @override
  String get sqFormTabSecurity => 'Güvenlik';

  @override
  String get sqFormTabSsh => 'SSH tüneli';

  @override
  String get sqFormName => 'Etiket (görünen ad)';

  @override
  String get sqFormNamePh => 'Örn. Üretim veritabanı';

  @override
  String get sqFormHost => 'Sunucu adresi';

  @override
  String get sqFormPort => 'Port';

  @override
  String get sqFormUser => 'Kullanıcı adı';

  @override
  String get sqFormPassword => 'Parola';

  @override
  String get sqFormPwSaved => '•••••••• (kayıtlı, değiştirmek için yazın)';

  @override
  String get sqFormDatabase => 'Veritabanı';

  @override
  String get sqFormDatabasePh => 'Boş bırakılırsa varsayılan veritabanı';

  @override
  String get sqFormFile => 'Veritabanı dosyası';

  @override
  String get sqFormFilePh => 'C:\\Veriler\\uygulama.db';

  @override
  String get sqFormSqliteHint =>
      'SQLite veritabanı dosyası (.db, .sqlite). Salt okunur kipte dosya değiştirilmez.';

  @override
  String get sqFormDuckdbHint =>
      'Bir .duckdb dosyası seçin ya da boş bırakın (bellek içi). CSV, Parquet, JSON ve Excel dosyalarını doğrudan sorgulayabilirsiniz: SELECT * FROM \'C:\\veri\\satis.csv\'';

  @override
  String get sqFormInMemory => 'Bellek içi';

  @override
  String get sqFormFolder => 'Klasör';

  @override
  String get sqFormColor => 'Renk';

  @override
  String get sqFormComments => 'Notlar';

  @override
  String get sqFormReadOnly => 'Salt okunur mod';

  @override
  String get sqFormReadOnlyHint =>
      'Önerilir. INSERT/UPDATE/DELETE ve DDL komutları çalıştırılmadan önce engellenir; isterseniz tek seferlik onaylarsınız. Desteklenen veritabanlarında oturum da salt okunur açılır.';

  @override
  String get sqFormSavePassword => 'Parolayı kaydet';

  @override
  String get sqFormSavePasswordHint =>
      'Parola yalnızca işletim sisteminin anahtar zincirinde (Windows: DPAPI) şifreli saklanır. Kapalıysa her bağlantıda sorulur.';

  @override
  String get sqFormSsl => 'TLS / SSL';

  @override
  String get sqFormSslPrefer => 'Tercih et (sunucu destekliyorsa şifreli)';

  @override
  String get sqFormSslRequire => 'Zorunlu (sertifika doğrulanmaz)';

  @override
  String get sqFormSslVerify => 'Zorunlu + sertifikayı doğrula';

  @override
  String get sqFormSslDisable => 'Kapalı (şifresiz)';

  @override
  String get sqFormSslHint =>
      'Varsayılan olarak TLS denenir; sunucu desteklemiyorsa bağlantı penceresi uyarı gösterir.';

  @override
  String get sqFormSshEnable => 'SSH tüneli üzerinden bağlan';

  @override
  String get sqFormSshHint =>
      'Veritabanına önce bir SSH sunucusuna bağlanılarak ulaşılır. Anahtarla giriş önerilir.';

  @override
  String get sqFormSshHost => 'SSH sunucusu';

  @override
  String get sqFormSshAuth => 'SSH kimlik doğrulama';

  @override
  String get sqFormSshKey => 'Özel anahtar';

  @override
  String get sqFormSshAgent => 'Ajan (Pageant)';

  @override
  String get sqFormKeyFile => 'Özel anahtar dosyası';

  @override
  String get sqFormPassphrase => 'Anahtar parolası';

  @override
  String get sqFormPassSaved => '(kayıtlı)';

  @override
  String get sqFormPassEmpty => 'Yoksa boş bırakın';

  @override
  String get sqFormSshPassword => 'SSH parolası';

  @override
  String sqFormHostKey(String fp) {
    return 'SSH sunucu anahtarı: $fp';
  }

  @override
  String get sqFormTest => 'Bağlantıyı dene';

  @override
  String get sqFormSaveConnect => 'Kaydet ve aç';

  @override
  String get sqFormConnecting => 'Bağlanılıyor…';

  @override
  String get sqFormTestOk => 'Bağlantı başarılı';

  @override
  String get sqFormTestFail => 'Bağlantı kurulamadı';

  @override
  String sqFormTestDb(String db, String user) {
    return 'Veritabanı: $db · Kullanıcı: $user';
  }

  @override
  String get sqFormNoTls =>
      'Uyarı: bağlantı şifresiz (sunucu TLS desteklemiyor).';

  @override
  String get sqFormSaved => 'Bağlantı kaydedildi';

  @override
  String get sqFormChangesSaved => 'Değişiklikler kaydedildi';

  @override
  String get sqCwObjects => 'Nesneler';

  @override
  String get sqCwCollapseAll => 'Tümünü daralt';

  @override
  String get sqCwFilterPh => 'Yüklenmiş nesnelerde süz…';

  @override
  String get sqCwEmpty => '(boş)';

  @override
  String get sqCwOpenData => 'Veriyi aç';

  @override
  String get sqCwShowDdl => 'DDL göster';

  @override
  String get sqCwOpenCode => 'Kodu aç';

  @override
  String get sqCwSelectSql => 'SELECT ifadesi oluştur';

  @override
  String get sqCwAddToBuilder => 'Sorgu oluşturucuya ekle';

  @override
  String get sqCwNewSqlHere => 'Burada yeni SQL';

  @override
  String get sqCwCopyName => 'Adı kopyala';

  @override
  String get sqCwCopied => 'Panoya kopyalandı';

  @override
  String get sqCwNewSql => 'Yeni SQL';

  @override
  String get sqCwBuilder => 'Sorgu oluşturucu';

  @override
  String get sqCwReconnect => 'Yeniden bağlan';

  @override
  String get sqCwReadOnly => 'Salt okunur';

  @override
  String get sqCwReadWrite => 'Yazma açık';

  @override
  String get sqCwReadOnlyTip =>
      'Salt okunur kip: DML/DDL onay olmadan çalışmaz. Tıklayın: kapat';

  @override
  String get sqCwReadWriteTip =>
      'Yazma açık: komutlar onaysız çalışır. Tıklayın: salt okunura dön';

  @override
  String get sqCwDisableRo => 'Salt okunur kip kapatılsın mı?';

  @override
  String get sqCwDisableRoMsg =>
      'Bu pencere kapanana kadar INSERT/UPDATE/DELETE ve DDL komutları onay sorulmadan çalışacak.';

  @override
  String get sqCwDisableRoOk => 'Yazmayı aç';

  @override
  String get sqCwRoOn => 'Salt okunur kip açık';

  @override
  String get sqCwRoOff => 'Yazma açık — dikkatli olun';

  @override
  String get sqCwPasswordTitle => 'Parola gerekli';

  @override
  String sqCwPasswordFor(String host, String user) {
    return '$user@$host için parola';
  }

  @override
  String get sqCwNotConnected => 'Bağlı değil';

  @override
  String get sqCwConnected => 'Bağlı';

  @override
  String get sqCwConnecting => 'Bağlanılıyor…';

  @override
  String get sqCwNoTls => 'Şifresiz';

  @override
  String get sqCwConnectFailed => 'Bağlantı kurulamadı';

  @override
  String get sqCwRetry => 'Tekrar dene';

  @override
  String get sqCwResetCancel =>
      'Sorgu iptale yanıt vermedi; bağlantı yeniden kuruluyor.';

  @override
  String get sqCwResetExit => 'Veritabanı bağlantısı koptu; yeniden kuruluyor.';

  @override
  String get sqCwEmptyWorkspace =>
      'Soldaki ağaçtan bir tabloya çift tıklayın ya da Ctrl+T ile yeni SQL sekmesi açın.';

  @override
  String get sqCwCloseTab => 'Sekme kapatılsın mı?';

  @override
  String sqCwCloseTabMsg(String name) {
    return '“$name” sekmesindeki SQL kaydedilmedi.';
  }

  @override
  String get sqCwCloseTabOk => 'Kapat';

  @override
  String get sqTreeTables => 'Tablolar';

  @override
  String get sqTreeViews => 'Görünümler';

  @override
  String get sqTreeMatviews => 'Materialized view’lar';

  @override
  String get sqTreeForeignTables => 'Yabancı tablolar';

  @override
  String get sqTreeFunctions => 'Fonksiyonlar';

  @override
  String get sqTreeProcedures => 'Prosedürler';

  @override
  String get sqTreeTriggers => 'Trigger’lar';

  @override
  String get sqTreeSequences => 'Sequence’ler';

  @override
  String get sqTreeTypes => 'Tipler';

  @override
  String get sqTreeColumns => 'Kolonlar';

  @override
  String get sqTreeIndexes => 'İndeksler';

  @override
  String get sqTreeConstraints => 'Kısıtlar';

  @override
  String get sqTreeFiles => 'Dosyalar';

  @override
  String get sqKindTable => 'Tablo';

  @override
  String get sqKindView => 'Görünüm';

  @override
  String get sqKindMatview => 'Materialized view';

  @override
  String get sqKindForeignTable => 'Yabancı tablo';

  @override
  String get sqKindFunction => 'Fonksiyon';

  @override
  String get sqKindProcedure => 'Prosedür';

  @override
  String get sqKindTrigger => 'Trigger';

  @override
  String get sqKindSequence => 'Sequence';

  @override
  String get sqKindType => 'Tip';

  @override
  String get sqKindIndex => 'İndeks';

  @override
  String get sqKindConstraint => 'Kısıt';

  @override
  String get sqSqlRun => 'Çalıştır';

  @override
  String get sqSqlRunStatement => 'İfadeyi çalıştır';

  @override
  String get sqSqlCancel => 'İptal';

  @override
  String get sqSqlDatabase => 'Veritabanı';

  @override
  String get sqSqlHistory => 'Geçmiş';

  @override
  String get sqSqlExport => 'Dışa aktar';

  @override
  String get sqSqlRunning => 'Çalışıyor…';

  @override
  String sqSqlDone(String ms) {
    return 'Tamamlandı · $ms ms';
  }

  @override
  String sqSqlDoneErrors(String ms, String n) {
    return '$n hata · $ms ms';
  }

  @override
  String get sqSqlDdlHint =>
      'Şema değişti: ağacı yenilemek için Yenile düğmesini kullanın.';

  @override
  String get sqSqlPlaceholder =>
      'SQL yazın… Ctrl+Enter: seçili/tümünü çalıştır · Ctrl+Shift+Enter: imleçteki ifade · Ctrl+Boşluk: tamamla';

  @override
  String sqSqlTabTitle(String n) {
    return 'SQL $n';
  }

  @override
  String get sqSqlHistoryEmpty => 'Bu bağlantı için geçmiş yok.';

  @override
  String get sqSqlRowsShort => 'satır';

  @override
  String sqResResult(String n) {
    return 'Sonuç $n';
  }

  @override
  String get sqResMessages => 'Mesajlar';

  @override
  String sqResRows(String ms, String n) {
    return '$n satır · $ms ms';
  }

  @override
  String sqResRowsTruncated(String ms, String n) {
    return 'İlk $n satır gösteriliyor (sınır) · $ms ms';
  }

  @override
  String get sqResNoRows => 'Kayıt yok';

  @override
  String sqResAffected(String cmd, String ms, String n) {
    return '$cmd: $n satır etkilendi · $ms ms';
  }

  @override
  String sqResCommand(String cmd, String ms) {
    return '$cmd · $ms ms';
  }

  @override
  String get sqResCancelled => 'İptal edildi';

  @override
  String get sqGridCopy => 'Kopyala';

  @override
  String get sqGridCopyHeaders => 'Başlıklarla kopyala';

  @override
  String get sqGridExport => 'Bu sonucu dışa aktar…';

  @override
  String get sqDataColumns => 'Kolonlar';

  @override
  String sqDataColumnsHidden(String n, String total) {
    return 'Kolonlar ($n/$total)';
  }

  @override
  String get sqDataAddFilter => 'Filtre';

  @override
  String get sqDataLimit => 'Kayıt sayısı';

  @override
  String sqDataFirstN(String n) {
    return 'İlk $n';
  }

  @override
  String get sqDataAll => 'Tümü (sınırla)';

  @override
  String get sqDataOpenInEditor => 'SQL editöründe aç';

  @override
  String get sqDataClearFilters => 'Filtreleri temizle';

  @override
  String sqDataRows(String ms, String n) {
    return '$n kayıt · $ms ms';
  }

  @override
  String sqDataRowsMore(String ms, String n) {
    return 'İlk $n kayıt · $ms ms';
  }

  @override
  String get sqDataError => 'Veri alınamadı';

  @override
  String get sqDataSortAsc => 'Artan sırala';

  @override
  String get sqDataSortDesc => 'Azalan sırala';

  @override
  String get sqDataSortClear => 'Sıralamayı kaldır';

  @override
  String get sqDataFilterColumn => 'Bu kolona göre filtrele…';

  @override
  String get sqDataHideColumn => 'Kolonu gizle';

  @override
  String get sqDataShowAll => 'Tüm kolonları göster';

  @override
  String sqDataFilterEq(String v) {
    return '= “$v” olanlar';
  }

  @override
  String sqDataFilterNe(String v) {
    return '≠ “$v” olanlar';
  }

  @override
  String get sqDataFilterNull => 'NULL olanlar / olmayanlar';

  @override
  String get sqDataColumn => 'Kolon';

  @override
  String get sqDataOperator => 'Koşul';

  @override
  String get sqDataValue => 'Değer';

  @override
  String get sqDataInHint => '“içinde” için değerleri virgülle ayırın.';

  @override
  String get sqDataFilterTitle => 'Filtre';

  @override
  String get sqDataSelectAll => 'Tümü';

  @override
  String get sqDataSelectNone => 'Hiçbiri';

  @override
  String get sqOpContains => 'içerir';

  @override
  String get sqOpStarts => 'ile başlar';

  @override
  String get sqOpEnds => 'ile biter';

  @override
  String get sqOpLike => 'LIKE';

  @override
  String get sqOpIn => 'içinde (liste)';

  @override
  String get sqCodeExecute => 'Çalıştır';

  @override
  String get sqCodeLoading => 'Yükleniyor…';

  @override
  String get sqCodeEmpty => 'Tanım bulunamadı';

  @override
  String get sqQbAddTable => 'Tablo ekle';

  @override
  String get sqQbLimit => 'Sınır';

  @override
  String get sqQbClear => 'Temizle';

  @override
  String get sqQbHint =>
      'Tabloları soldaki ağaçtan buraya sürükleyin ya da “Tablo ekle”ye tıklayın. Bir kolonu başka tablonun kolonuna sürükleyerek JOIN oluşturun.';

  @override
  String get sqQbColumns => 'Kolonlar';

  @override
  String get sqQbConditions => 'Koşullar';

  @override
  String get sqQbResults => 'Sonuçlar';

  @override
  String get sqQbGenerated => 'Üretilen SQL';

  @override
  String get sqQbRegenerate => 'Diyagramdan yeniden üret';

  @override
  String get sqQbOtherDb =>
      'Sorgu oluşturucu tek bir veritabanındaki tablolarla çalışır.';

  @override
  String get sqQbDragJoin => 'JOIN için başka tablonun kolonuna sürükleyin';

  @override
  String get sqQbSwapJoin => 'Yönü değiştir';

  @override
  String get sqQbDeleteJoin => 'JOIN’i sil';

  @override
  String get sqQbNoColumns =>
      'Tablolardaki kolon kutucuklarını işaretleyin (boşsa SELECT *).';

  @override
  String get sqQbOutput => 'Göster';

  @override
  String get sqQbColumn => 'Kolon';

  @override
  String get sqQbAlias => 'Takma ad';

  @override
  String get sqQbAggregate => 'Toplama';

  @override
  String get sqQbSort => 'Sıralama';

  @override
  String get sqQbAddCondition => 'Koşul ekle';

  @override
  String sqQbTabTitle(String n) {
    return 'Sorgu $n';
  }

  @override
  String get sqRoTitle => 'Salt okunur kip';

  @override
  String get sqRoMessage =>
      'Bu bağlantı salt okunur kipte. Aşağıdaki ifadeler veri ya da şemayı değiştirebilir:';

  @override
  String get sqRoHint =>
      'Yalnızca bu çalıştırma için izin verebilirsiniz; kip ardından yeniden açılır.';

  @override
  String get sqRoRunOnce => 'Bu seferlik çalıştır';

  @override
  String get sqRoNotRun => 'Salt okunur kip: çalıştırılmadı';

  @override
  String sqRoBlockedMsg(String n) {
    return 'Salt okunur kip: $n ifade onay bekliyor.';
  }

  @override
  String get sqExpTitle => 'Dışa aktar';

  @override
  String get sqExpHint =>
      'Sorgu sınırsız olarak yeniden çalıştırılır ve sonuçlar belleğe alınmadan doğrudan dosyaya yazılır.';

  @override
  String get sqExpRunning => 'Dışa aktarılıyor…';

  @override
  String sqExpDone(String n) {
    return '$n satır dışa aktarıldı';
  }

  @override
  String get sqExpFailed => 'Dışa aktarım başarısız';

  @override
  String get sqErrRefused =>
      'Bağlantı reddedildi: port kapalı ya da sunucu çalışmıyor.';

  @override
  String get sqErrDns => 'Sunucu adı çözümlenemedi (DNS).';

  @override
  String get sqErrTimeout => 'Zaman aşımı: sunucuya ulaşılamadı.';

  @override
  String get sqErrReset => 'Sunucu bağlantıyı kapattı.';

  @override
  String get sqErrUnreach => 'Sunucuya ağ üzerinden ulaşılamıyor.';

  @override
  String get sqErrSshAuth =>
      'SSH girişi başarısız: kullanıcı adı, anahtar ya da parola hatalı.';

  @override
  String sqErrTls(String msg) {
    return 'TLS/SSL hatası — sertifika doğrulanamadı ya da sunucu TLS desteklemiyor. ($msg)';
  }

  @override
  String get sqErrHostExit => 'Veritabanı süreci beklenmedik şekilde kapandı.';

  @override
  String get sqErrUnknown => 'Bilinmeyen hata';

  @override
  String get sqMainCloseAnyway => 'Yine de kapat';

  @override
  String get sqMainCloseRunning =>
      'Çalışan sorgular var. Pencere kapanırsa iptal edilecek.';

  @override
  String get sqMainCopySuffix => ' (kopya)';

  @override
  String get sqMainErrConnNotFound => 'Bağlantı bulunamadı';

  @override
  String get sqMainErrNoSession => 'Bu pencerenin bağlantısı yok';

  @override
  String sqMainErrKeyFile(String path) {
    return 'SSH anahtar dosyası okunamadı: $path';
  }

  @override
  String get sqMainTrayShow => 'SQL Master’ı göster';

  @override
  String get sqMainTrayQuick => 'Hızlı bağlan';

  @override
  String get sqMainTrayNone => 'Kayıtlı bağlantı yok';

  @override
  String get sqMainTrayQuit => 'Çıkış';

  @override
  String get npKindSsh => 'SSH Projesi';

  @override
  String get npKindFtp => 'FTP Projesi';

  @override
  String get npKindLocal => 'Lokal Klasör';

  @override
  String get npKindFile => 'Proje Dosyası';

  @override
  String get npKindSshHint => 'SSH (SFTP) ile sunucudaki klasör';

  @override
  String get npKindFtpHint => 'FTP, FTPS veya SFTP sunucusu';

  @override
  String get npKindLocalHint => 'Bu bilgisayardaki bir klasör';

  @override
  String get npKindFileHint => 'Tek bir dosyayı düzenle';

  @override
  String get npAppSearchPh => 'Bağlantılarda ara…  (Ctrl+F)';

  @override
  String get npAppNewConn => 'Yeni bağlantı';

  @override
  String get npAppSettings => 'Ayarlar';

  @override
  String npAppStats(String c, String f) {
    return '$c bağlantı · $f klasör';
  }

  @override
  String get npAppWelcome => 'Hoş geldiniz';

  @override
  String npAppResults(String q) {
    return '“$q” için sonuçlar';
  }

  @override
  String get npAppAll => 'Tüm bağlantılar';

  @override
  String get npAppWelcomeHint =>
      'SSH, FTP, lokal klasör ya da tek dosya ekleyin.<br>Karta çift tıklayınca proje ayrı pencerede açılır.';

  @override
  String get npAppFolders => 'Klasörler';

  @override
  String get npAppConnections => 'Bağlantılar';

  @override
  String get npAppDblHint => 'Açmak için karta çift tıklayın';

  @override
  String get npAppNoMatch => 'Eşleşen bağlantı bulunamadı.';

  @override
  String npAppFolderCount(String n) {
    return '$n bağlantı';
  }

  @override
  String get npAppNewConnHere => 'Bu klasörde yeni bağlantı';

  @override
  String get npAppNewSubfolder => 'Alt klasör oluştur';

  @override
  String get npAppKeyTag => 'Anahtar';

  @override
  String get npAppDuplicate => 'Kopyasını oluştur';

  @override
  String get npAppMoveToFolder => 'Klasöre taşı…';

  @override
  String get npAppConnMoved => 'Bağlantı taşındı';

  @override
  String get npAppFolderIntoSelf => 'Klasör kendi içine taşınamaz';

  @override
  String get npAppFolderPh => 'Örn. Müşteriler';

  @override
  String get npAppRenameFolder => 'Klasörü yeniden adlandır';

  @override
  String get npAppDeleteFolder => 'Klasörü sil';

  @override
  String npAppDeleteFolderMsg(String name) {
    return '<b>$name</b> klasörü silinsin mi?';
  }

  @override
  String npAppDeleteFolderConns(String n) {
    return '<br>İçindeki $n bağlantı üst klasöre taşınacak.';
  }

  @override
  String get npAppRootFolder => 'Ana dizin (klasörsüz)';

  @override
  String npAppMoveTitle(String name) {
    return '“$name” taşı';
  }

  @override
  String get npAppTargetFolder => 'Hedef klasör';

  @override
  String get npAppDeleteConn => 'Bağlantıyı sil';

  @override
  String npAppDeleteConnMsg(String name, String target) {
    return '<b>$name</b> ($target) bağlantısı silinsin mi?<br>Sunucudaki ya da klasördeki dosyalara dokunulmaz; yalnız bu bağlantı ve çalışma kopyası silinir.';
  }

  @override
  String get npAppNoLocalPath =>
      'Bu bilgisayarda yol seçilmedi — açınca sorulur';

  @override
  String get npAppChangeLocalPath => 'Bu bilgisayardaki yolu değiştir…';

  @override
  String get npAppOpenTabs => 'Açık sekmeler';

  @override
  String get npAppCustomEditor => 'Bağlantıya özel editör ayarları';

  @override
  String get npFormTitleNew => 'Yeni bağlantı';

  @override
  String npFormTitleEdit(String name) {
    return 'Bağlantı: $name';
  }

  @override
  String get npFormTabConn => 'Bağlantı';

  @override
  String get npFormTabProject => 'Proje';

  @override
  String get npFormTabEditor => 'Editör (Notepad++)';

  @override
  String get npFormName => 'Ad (görünen)';

  @override
  String get npFormNamePh => 'Örn. Şirket web sitesi';

  @override
  String get npFormHost => 'Sunucu adresi';

  @override
  String get npFormHostPh => 'sunucu.ornek.com veya 192.168.1.10';

  @override
  String get npFormPort => 'Port';

  @override
  String get npFormUser => 'Kullanıcı adı';

  @override
  String get npFormPassword => 'Şifre';

  @override
  String get npFormPwSaved => '•••••••• (kayıtlı, değiştirmek için yazın)';

  @override
  String get npFormLoginMethod => 'Giriş yöntemi';

  @override
  String get npFormLoginNormal => 'Normal';

  @override
  String get npFormLoginAnon => 'Anonim';

  @override
  String get npFormAuth => 'SSH kimlik doğrulama';

  @override
  String get npFormPrivateKey => 'Özel anahtar';

  @override
  String get npFormKeyFile => 'Özel anahtar dosyası';

  @override
  String get npFormPassphrase => 'Anahtar parolası';

  @override
  String get npFormPassSaved => '(kayıtlı)';

  @override
  String get npFormPassEmpty => 'Yoksa boş bırakın';

  @override
  String get npFormFolder => 'Klasör';

  @override
  String get npFormColor => 'Renk';

  @override
  String get npFormComments => 'Notlar';

  @override
  String get npFormRootDir => 'Proje klasörü (sunucuda)';

  @override
  String get npFormBrowse => 'Klasör seç';

  @override
  String get npFormBrowseHint =>
      'Klasörü sunucuda gezerek seçmek için önce “Bağlantıyı dene”ye basın. Boş bırakılırsa giriş klasörü açılır.';

  @override
  String get npFormBrowseTitle => 'Sunucuda klasör seçin';

  @override
  String get npFormBrowseSelect => 'Bu klasörü seç';

  @override
  String get npFormBrowseEmpty => 'Alt klasör yok';

  @override
  String get npFormFolderPath => 'Klasör';

  @override
  String get npFormFilePath => 'Dosya';

  @override
  String get npFormLocalPathHint =>
      'Yerel yol yalnız bu bilgisayarda saklanır; diğer bilgisayarlarda ilk açılışta sorulur.';

  @override
  String get npFormCacheNote =>
      'Açılan her dosya, klasör yapısıyla birlikte çalışma kopyasına (önbellek) kaydedilir. Kaydedince dosya sunucuya yüklenir ve çalışma kopyası güncellenir.';

  @override
  String get npFormRestoreTabs => 'Açık sekmeleri hatırla';

  @override
  String get npFormRestoreTabsHint =>
      'Proje bir sonraki açılışta aynı dosyalarla açılır (yalnız bu bilgisayarda).';

  @override
  String get npFormShowHidden => 'Gizli dosyaları göster';

  @override
  String get npFormShowHiddenHint =>
      'Noktayla başlayan dosya ve klasörler (.env, .htaccess, .git…)';

  @override
  String get npFormExclude => 'Ağaçta gösterme';

  @override
  String get npFormExcludeHint =>
      'Virgülle ayrılmış adlar ya da kalıplar; * ve ? kullanılabilir.';

  @override
  String get npFormEditorMode => 'Editör ayarları';

  @override
  String get npFormEdGlobal =>
      'Genel editör ayarlarını kullan (Ayarlar › Editör)';

  @override
  String get npFormEdCustom => 'Bu bağlantıya özel ayarlar kullan';

  @override
  String get npFormTest => 'Bağlantıyı dene';

  @override
  String get npFormSaveOpen => 'Kaydet ve aç';

  @override
  String get npFormConnecting => 'Bağlanılıyor…';

  @override
  String get npFormTestOk => 'Bağlantı başarılı';

  @override
  String get npFormTestFail => 'Bağlantı kurulamadı';

  @override
  String npFormHomeDir(String dir) {
    return 'Giriş klasörü: $dir';
  }

  @override
  String get npFormRootMissing => 'Uyarı: proje klasörü açılamadı.';

  @override
  String npFormHostKey(String fp) {
    return 'SSH host anahtarı (SHA256): $fp';
  }

  @override
  String get npFormSaved => 'Bağlantı kaydedildi';

  @override
  String get npFormChangesSaved => 'Değişiklikler kaydedildi';

  @override
  String get npTypeProtocol => 'Protokol';

  @override
  String get npTypeFtp => 'FTP (standart)';

  @override
  String get npTypeFtpsImplicit => 'FTPS — TLS/SSL Implicit (port 990)';

  @override
  String get npTypeFtpsSsl => 'FTPS — Explicit (AUTH SSL)';

  @override
  String get npTypeFtpsTls => 'FTPS — Explicit (AUTH TLS)';

  @override
  String get npTypeSftp => 'SFTP — SSH2';

  @override
  String get npTypeNoteFtp =>
      'Standart FTP; şifre ve dosyalar şifrelenmeden (düz metin) gönderilir.';

  @override
  String get npTypeNoteFtpsImplicit =>
      'Bağlantı en baştan TLS/SSL ile şifrelenir (genellikle port 990).';

  @override
  String get npTypeNoteFtpsSsl =>
      'Düz FTP ile bağlanıp AUTH SSL komutuyla şifreli oturuma geçilir.';

  @override
  String get npTypeNoteFtpsTls =>
      'Düz FTP ile bağlanıp AUTH TLS komutuyla şifreli oturuma geçilir (en yaygın FTPS türü).';

  @override
  String get npTypeNoteSftp =>
      'SSH üzerinden şifreli dosya erişimi (port 22). Sunucu host anahtarı ilk bağlantıda kaydedilir.';

  @override
  String get npOptEncoding => 'Dosya adı kodlaması';

  @override
  String get npOptEncAuto => 'Otomatik';

  @override
  String get npEdSecEncoding => 'Kodlama ve satır sonu';

  @override
  String get npEdEncoding => 'Dosyaları açarken kodlama';

  @override
  String get npEdEncAuto => 'Otomatik algıla (BOM / UTF-8)';

  @override
  String get npEdFallback => 'UTF-8 değilse (ANSI)';

  @override
  String get npEdEol => 'Satır sonu';

  @override
  String get npEdEolAuto => 'Dosyanınkini koru';

  @override
  String npEdEolConvert(String eol) {
    return 'Açarken $eol biçimine çevir';
  }

  @override
  String get npEdNewDoc => 'Yeni dosya: kodlama · satır sonu';

  @override
  String get npEdSecIndent => 'Girinti ve dil';

  @override
  String get npEdTabSize => 'Sekme genişliği';

  @override
  String get npEdLanguage => 'Dil (sözdizimi)';

  @override
  String get npEdLangAuto => 'Otomatik (uzantı / ilk satır)';

  @override
  String get npEdInsertSpaces => 'Sekme yerine boşluk kullan';

  @override
  String get npEdDetectIndent => 'Girintiyi dosyadan algıla';

  @override
  String get npEdDetectIndentHint =>
      'Dosya sekme kullanıyorsa sekmeyle devam eder.';

  @override
  String get npEdAutoIndent => 'Otomatik girinti';

  @override
  String get npEdAutoClose => 'Parantez ve tırnakları otomatik kapat';

  @override
  String get npEdSecLook => 'Görünüm';

  @override
  String get npEdTheme => 'Renk teması';

  @override
  String get npEdThemeAuto => 'Otomatik (uygulama temasına göre)';

  @override
  String get npEdWhitespace => 'Boşluk ve sekmeleri göster';

  @override
  String get npEdWsNone => 'Gösterme';

  @override
  String get npEdWsBoundary => 'Sözcük aralarındakiler hariç';

  @override
  String get npEdWsTrailing => 'Yalnız satır sonundakiler';

  @override
  String get npEdWsAll => 'Tümü';

  @override
  String get npEdFont => 'Yazı tipi';

  @override
  String get npEdFontSize => 'Boyut';

  @override
  String get npEdRulers => 'Kenar çizgileri';

  @override
  String get npEdWordWrap => 'Satır kaydır';

  @override
  String get npEdLineNumbers => 'Satır numaraları';

  @override
  String get npEdHighlightLine => 'Geçerli satırı vurgula';

  @override
  String get npEdSmartHighlight => 'Akıllı vurgulama (aynı sözcükler)';

  @override
  String get npEdIndentGuides => 'Girinti kılavuzları';

  @override
  String get npEdFolding => 'Kod katlama';

  @override
  String get npEdBracketColors => 'Parantez çiftlerini renklendir';

  @override
  String get npEdMinimap => 'Mini harita (belge haritası)';

  @override
  String get npEdControlChars => 'Görünmez karakterleri göster';

  @override
  String get npEdSecSave => 'Kaydetme';

  @override
  String get npEdTrimTrailing => 'Kaydederken satır sonu boşluklarını sil';

  @override
  String get npEdFinalNewline => 'Dosya sonuna satır sonu ekle';

  @override
  String get npEdCheckRemote => 'Kaydetmeden önce değişiklik kontrolü';

  @override
  String get npEdCheckRemoteHint =>
      'Dosya açıldıktan sonra sunucuda başkası değiştirdiyse sorar.';

  @override
  String get npEdAutoSave => 'Otomatik kaydet';

  @override
  String get npEdSec => 'sn';

  @override
  String get npEdAutoSaveHint =>
      '0 = kapalı. Açıkken değişiklikten bu kadar sonra kaydedilip sunucuya yüklenir.';

  @override
  String get npMainBalloonTitle => 'Notepad Master arka planda çalışıyor';

  @override
  String get npMainBalloonBody =>
      'Tekrar açmak için tepsideki simgeye tıklayın.';

  @override
  String get npMainTrayShow => 'Notepad Master’ı göster';

  @override
  String get npMainTrayQuick => 'Hızlı aç';

  @override
  String get npMainTrayNone => 'Kayıtlı bağlantı yok';

  @override
  String get npMainTrayQuit => 'Çıkış';

  @override
  String get npProjToggleTree => 'Klasör ağacını aç/kapat (Ctrl+B)';

  @override
  String get npProjReconnect => 'Yeniden bağlan';

  @override
  String get npProjReconnected => 'Yeniden bağlanıldı';

  @override
  String get npProjConnectFail => 'Bağlanılamadı';

  @override
  String get npProjStatusOn => 'Bağlı';

  @override
  String get npProjStatusOff => 'Bağlantı yok';

  @override
  String get npProjStatusConnecting => 'Bağlanılıyor…';

  @override
  String get npProjSave => 'Kaydet';

  @override
  String get npProjSaveAll => 'Tümünü kaydet';

  @override
  String get npProjUndo => 'Geri al';

  @override
  String get npProjRedo => 'Yinele';

  @override
  String get npProjFind => 'Bul';

  @override
  String get npProjReplace => 'Değiştir';

  @override
  String get npProjGoto => 'Satıra git';

  @override
  String get npProjShowWs => 'Boşluk ve sekmeleri göster';

  @override
  String get npProjZoomIn => 'Yakınlaştır';

  @override
  String get npProjZoomOut => 'Uzaklaştır';

  @override
  String get npProjShowCache => 'Çalışma kopyasını göster';

  @override
  String get npProjPalette => 'Komut paleti';

  @override
  String get npProjCloseTab => 'Kapat';

  @override
  String get npProjCloseOthers => 'Diğerlerini kapat';

  @override
  String get npProjCloseAll => 'Tümünü kapat';

  @override
  String get npProjReload => 'Yeniden yükle';

  @override
  String npProjReloadMsg(String name) {
    return '<b>$name</b> içindeki kaydedilmemiş değişiklikler kaybolacak. Dosya yeniden yüklensin mi?';
  }

  @override
  String get npProjRevealTree => 'Ağaçta göster';

  @override
  String get npProjUnsavedTitle => 'Kaydedilmemiş değişiklikler';

  @override
  String npProjUnsavedMsg(String name) {
    return '<b>$name</b> dosyasındaki değişiklikler kaydedilsin mi?';
  }

  @override
  String get npProjDontSave => 'Kaydetme';

  @override
  String npProjOpenFail(String name) {
    return '$name açılamadı';
  }

  @override
  String npProjTooLarge(String name, String size) {
    return '$name çok büyük ($size); en fazla 50 MB açılabilir.';
  }

  @override
  String npProjBinary(String name) {
    return '$name metin dosyası değil (ikili); editörde açılmadı.';
  }

  @override
  String npProjSaveFail(String name) {
    return '$name kaydedilemedi';
  }

  @override
  String npProjSaved(String name) {
    return '$name kaydedildi';
  }

  @override
  String npProjSavedRemote(String name) {
    return '$name kaydedildi ve yüklendi';
  }

  @override
  String get npProjLossyTitle => 'Kodlama uyarısı';

  @override
  String npProjLossyMsg(String enc) {
    return 'Metindeki bazı karakterler <b>$enc</b> kodlamasında saklanamıyor ve “?” olarak kaydedilecek. Durum çubuğundan UTF-8’e çevirmeniz önerilir.';
  }

  @override
  String get npProjSaveAnyway => 'Yine de kaydet';

  @override
  String get npProjConflictTitle => 'Dosya başka yerde değişmiş';

  @override
  String npProjConflictMsg(String name) {
    return '<b>$name</b> siz açtıktan sonra sunucuda değiştirilmiş. Ne yapılsın?';
  }

  @override
  String get npProjConflictOverwrite => 'Üzerine yaz';

  @override
  String get npProjConflictReload => 'Sunucudakini yükle';

  @override
  String npProjConflictAuto(String name) {
    return '$name sunucuda değişmiş; otomatik kaydetme yapılmadı.';
  }

  @override
  String npProjPos(String col, String ln) {
    return 'Sat $ln, Süt $col';
  }

  @override
  String npProjSel(String n) {
    return '$n seçili';
  }

  @override
  String npProjSpaces(String n) {
    return 'Boşluk: $n';
  }

  @override
  String npProjTabWidth(String n) {
    return 'Sekme: $n';
  }

  @override
  String get npProjIndentToSpaces => 'Girintiyi boşluğa çevir';

  @override
  String get npProjIndentToTabs => 'Girintiyi sekmeye çevir';

  @override
  String npProjEncTitle(String name) {
    return 'Kodlama: $name';
  }

  @override
  String get npProjEncConvert => 'Bu kodlamaya çevir (kaydedince)';

  @override
  String get npProjEncConvertHint =>
      'Metin aynı kalır; dosya kaydedilirken seçilen kodlamayla yazılır.';

  @override
  String get npProjEncReopen => 'Bu kodlamayla yeniden aç';

  @override
  String get npProjEncReopenHint =>
      'Karakterler bozuk görünüyorsa dosyayı doğru kodlamayla yeniden okuyun.';

  @override
  String npProjEolTo(String eol) {
    return '$eol biçimine çevir';
  }

  @override
  String get npProjLangTitle => 'Dil seçin';

  @override
  String get npProjLangSearch => 'Dil ara…';

  @override
  String get npProjCacheCopy => 'Çalışma kopyası';

  @override
  String get npProjInitFail => 'Proje penceresi başlatılamadı';

  @override
  String get npProjEmptyHint =>
      'Soldaki ağaçta bir dosyaya çift tıklayın; dosya diline uygun renklendirmeyle burada sekme olarak açılır.';

  @override
  String get npProjEmptyFile => 'Dosya açılıyor…';

  @override
  String get npTreeNewFile => 'Yeni dosya';

  @override
  String get npTreeFileName => 'Dosya adı';

  @override
  String get npTreeBadName => 'Geçersiz ad';

  @override
  String get npTreeCreateFail => 'Oluşturulamadı';

  @override
  String get npTreeRenameFail => 'Yeniden adlandırılamadı';

  @override
  String get npTreeRenameDirty => 'Önce bu klasördeki açık dosyaları kaydedin.';

  @override
  String get npTreeDeleteTitle => 'Sil';

  @override
  String npTreeDeleteMsg(String name) {
    return '<b>$name</b> dosyası silinsin mi?';
  }

  @override
  String npTreeDeleteDirMsg(String name) {
    return '<b>$name</b> klasörü ve içindeki her şey silinsin mi?';
  }

  @override
  String get npTreeDeleteFail => 'Silinemedi';

  @override
  String get npTreeTrashNote =>
      'Yerel dosyalar Geri Dönüşüm Kutusu’na taşınır.';

  @override
  String get npTreeEmpty => 'Boş klasör';

  @override
  String get npTreeCollapseAll => 'Tümünü daralt';

  @override
  String get npTreeShowExplorer => 'Gezgin’de göster';

  @override
  String get npTreeUp => 'Üst klasör';

  @override
  String get npTreeHome => 'Giriş klasörü';

  @override
  String get npMainErrAuth =>
      'Giriş başarısız: kullanıcı adı veya şifre hatalı.';

  @override
  String get npMainErrRefused =>
      'Bağlantı reddedildi: port kapalı veya sunucu çalışmıyor.';

  @override
  String get npMainErrTimeout => 'Zaman aşımı: sunucuya ulaşılamadı.';

  @override
  String get npMainErrDns => 'Sunucu adresi çözümlenemedi (DNS).';

  @override
  String get npMainErrUnreach => 'Sunucuya ağ üzerinden erişilemiyor.';

  @override
  String get npMainErrReset => 'Sunucu bağlantıyı kapattı.';

  @override
  String get npMainErrNotFound => 'Dosya veya klasör bulunamadı.';

  @override
  String get npMainErrPerm => 'Erişim izni yok.';

  @override
  String get npMainErrExists => 'Bu adda bir dosya veya klasör zaten var.';

  @override
  String npMainErr550(String msg) {
    return 'Sunucu işlemi reddetti (550): $msg';
  }

  @override
  String get npMainErr553 =>
      'Dosya adı sunucu tarafından kabul edilmedi (553).';

  @override
  String npMainErrTls(String msg) {
    return 'TLS/SSL hatası — protokolü veya portu kontrol edin. ($msg)';
  }

  @override
  String npMainErrHostKey(String newVal, String oldVal) {
    return 'Sunucunun host anahtarı değişmiş! Kayıtlı: $oldVal, gelen: $newVal. Güvenlik için bağlantı reddedildi.';
  }

  @override
  String get npMainErrNoKey => 'Özel anahtar dosyası okunamadı.';

  @override
  String get npMainErrKey =>
      'Özel anahtar okunamadı: parola yanlış ya da biçim desteklenmiyor.';

  @override
  String get npMainErrNoLocal =>
      'Klasör ya da dosya bu bilgisayarda bulunamadı. Ana pencerede kartın menüsünden yolu değiştirin.';

  @override
  String get npMainErrConnNotFound => 'Bağlantı bulunamadı';

  @override
  String get npMainErrNoSession => 'Bağlı değil';

  @override
  String get npMainErrHost => 'Sunucu adresi gerekli.';

  @override
  String get npMainErrUser =>
      'Kullanıcı adı gerekli (veya Anonim girişi seçin).';

  @override
  String get npMainPickKey => 'Özel anahtar dosyası seçin';

  @override
  String get npMainCopySuffix => ' (kopya)';

  @override
  String get npMainCloseDirty =>
      'Kaydedilmemiş dosyalar var. Pencere kapatılırsa değişiklikler kaybolacak.';

  @override
  String get npMainCloseDiscard => 'Kaydetmeden kapat';

  @override
  String get ipAppNewFolder => 'Yeni klasör';

  @override
  String get ipAppNewRecord => 'Yeni kayıt';

  @override
  String get ipAppSearchPh => 'Kayıt, IP, ad, MAC ya da servis ara…';

  @override
  String ipAppStats(String n) {
    return '$n kayıt';
  }

  @override
  String get ipColIp => 'IP';

  @override
  String get ipColMac => 'MAC';

  @override
  String get ipColName => 'Ad';

  @override
  String get ipColRtt => 'Yanıt';

  @override
  String get ipColServices => 'Servisler';

  @override
  String get ipColStatus => 'Durum';

  @override
  String get ipColVendor => 'Üretici';

  @override
  String get ipCtxCopyIp => 'IP adresini kopyala';

  @override
  String get ipCtxCopyMac => 'MAC adresini kopyala';

  @override
  String get ipCtxCopyName => 'Adı kopyala';

  @override
  String get ipCtxCopyRange => 'Aralığı kopyala';

  @override
  String get ipCtxOpenWeb => 'Tarayıcıda aç';

  @override
  String ipFolderDeleteMsg(String name) {
    return '“$name” klasörü silinecek; içindeki kayıtlar ve klasörler üst klasöre taşınır.';
  }

  @override
  String get ipFolderEmpty => 'Boş klasör';

  @override
  String get ipFolderName => 'Klasör adı';

  @override
  String get ipFolderRename => 'Klasörü yeniden adlandır';

  @override
  String get ipHostAlive => 'Canlılık';

  @override
  String get ipHostBanner => 'Karşılama';

  @override
  String get ipHostCert => 'Sertifika';

  @override
  String get ipHostCertExpires => 'Geçerlilik sonu';

  @override
  String get ipHostCertIssuer => 'Veren';

  @override
  String get ipHostDetails => 'Ayrıntılar';

  @override
  String get ipHostLocalMac => 'özel adres';

  @override
  String get ipHostNoServices => 'Listedeki portlardan hiçbiri açık değil.';

  @override
  String get ipHostSelfSigned => 'kendinden imzalı';

  @override
  String get ipHostServer => 'Sunucu';

  @override
  String get ipHostTitle => 'Başlık';

  @override
  String get ipHostUnknown => '(ad çözülemedi)';

  @override
  String get ipNoticeAccept => 'Anladım';

  @override
  String get ipNoticeBody =>
      'IP Tools yalnız yerel ağınızı keşfeder: cihazları ping ile bulur, kısa bir port listesine bağlanmayı dener ve adlarını çözer. Yalnız sahibi olduğunuz ya da yetkili olduğunuz ağları tarayın.';

  @override
  String get ipNoticeLimits =>
      'Tasarım gereği yalnız özel adresler (10.x, 172.16–31.x, 192.168.x, 169.254.x) taranır; zafiyet denemesi, parola deneme ya da geniş port taraması yapılmaz.';

  @override
  String get ipNoticeShort => 'Yalnız yetkili olduğunuz ağları tarayın';

  @override
  String get ipNoticeText =>
      'Yalnız sahibi olduğunuz ya da yetkili olduğunuz ağları tarayın.';

  @override
  String get ipNoticeTitle => 'Yerel ağ keşfi';

  @override
  String get ipPrivacyNote =>
      'Gizlilik: tarama sonuçları yalnız bu bilgisayarda saklanır ve hiçbir yere gönderilmez. Yalnız özel/yerel adresler taranır.';

  @override
  String get ipRangeErrEmpty => 'Bir IP aralığı girin.';

  @override
  String ipRangeErrInvalid(String token) {
    return 'Geçersiz adres ya da aralık: $token';
  }

  @override
  String ipRangeErrIpv6(String token) {
    return 'IPv6 adresleri desteklenmiyor: $token';
  }

  @override
  String ipRangeErrNotPrivate(String token) {
    return 'Yalnız özel/yerel adresler taranabilir (10.x, 172.16–31.x, 192.168.x, 169.254.x): $token';
  }

  @override
  String ipRangeErrReversed(String token) {
    return 'Aralığın başlangıcı bitişinden büyük: $token';
  }

  @override
  String ipRangeErrTooMany(String count) {
    return 'Aralık çok geniş (en çok 65.536 adres, bir /16): $count';
  }

  @override
  String ipRangeOk(String n) {
    return '$n adres taranacak';
  }

  @override
  String get ipRecColor => 'Renk';

  @override
  String ipRecDeleteMsg(String name) {
    return '“$name” kaydı ve bu bilgisayardaki tarama sonucu silinecek.';
  }

  @override
  String ipRecDevices(String n) {
    return '$n cihaz';
  }

  @override
  String get ipRecEdit => 'Kaydı düzenle';

  @override
  String get ipRecFolder => 'Klasör';

  @override
  String ipRecItems(String n) {
    return '$n öğe';
  }

  @override
  String ipRecLastScan(String time) {
    return 'Son tarama: $time';
  }

  @override
  String get ipRecMove => 'Taşı';

  @override
  String get ipRecMoveTitle => 'Kaydı taşı';

  @override
  String get ipRecName => 'Ad';

  @override
  String get ipRecNever => 'Henüz taranmadı';

  @override
  String ipRecNewDevices(String n) {
    return '$n yeni';
  }

  @override
  String get ipRecRange => 'IP aralığı';

  @override
  String get ipRecRangeHint =>
      'Örnekler: 192.168.1.0/24 · 192.168.1.1-192.168.1.255 · 10.0.0.5 · virgülle birden çok. En çok /16.';

  @override
  String get ipRecRootFolder => 'Kayıtlar';

  @override
  String get ipRecSaved => 'Kayıt kaydedildi';

  @override
  String get ipScanBusy => 'Başka bir tarama sürüyor; önce onu durdurun.';

  @override
  String ipScanDone(String n) {
    return 'Tarama bitti: $n cihaz';
  }

  @override
  String get ipScanEmptyBody =>
      'Tara düğmesine basın ya da karttaki ▶ simgesine tıklayın. Bulunan cihazlar burada listelenir.';

  @override
  String get ipScanEmptyTitle => 'Bu kayıt henüz taranmadı';

  @override
  String get ipScanExport => 'Dışa aktar';

  @override
  String get ipScanExportCsv => 'CSV olarak kaydet…';

  @override
  String get ipScanExportJson => 'JSON olarak kaydet…';

  @override
  String get ipScanExported => 'Dışa aktarıldı';

  @override
  String ipScanFailed(String msg) {
    return 'Tarama yapılamadı: $msg';
  }

  @override
  String get ipScanFilter => 'Filtre';

  @override
  String get ipScanFilterAll => 'Tümü';

  @override
  String get ipScanFilterGone => 'Kaybolan';

  @override
  String get ipScanFilterNew => 'Yeni';

  @override
  String get ipScanFilterServices => 'Servisli';

  @override
  String ipScanFound(String n) {
    return '$n cihaz bulundu';
  }

  @override
  String get ipScanNoMatch => 'Filtreye uyan cihaz yok.';

  @override
  String get ipScanPhaseNames => 'Adlar çözülüyor';

  @override
  String get ipScanPhasePing => 'Cihazlar aranıyor';

  @override
  String get ipScanPhasePorts => 'Servisler deneniyor';

  @override
  String ipScanProgress(String done, String total) {
    return '$done/$total';
  }

  @override
  String ipScanRateLimited(String s) {
    return 'Aynı kayıt en erken $s sn sonra yeniden taranabilir.';
  }

  @override
  String get ipScanScan => 'Tara';

  @override
  String get ipScanScanning => 'Taranıyor…';

  @override
  String get ipScanSelectHint =>
      'Soldaki bir kayda tıklayın: aralık taranır ve bulunan cihazlar burada listelenir.';

  @override
  String get ipScanSelectRecord => 'Bir kayıt seçin';

  @override
  String get ipScanStop => 'Durdur';

  @override
  String get ipScanStopped => 'Tarama durduruldu';

  @override
  String get ipStatusAliveArp =>
      'ARP tablosunda görüldü (ping\'e yanıt vermedi)';

  @override
  String get ipStatusAlivePing => 'Ping\'e yanıt verdi';

  @override
  String get ipStatusGone => 'Kayboldu (önceki taramada vardı)';

  @override
  String get ipStatusLive => 'Taranıyor';

  @override
  String get ipStatusNew => 'Yeni (önceki taramada yoktu)';

  @override
  String get ipStatusSame => 'Çevrimiçi';

  @override
  String ipTagCopied(String text) {
    return 'Panoya kopyalandı: $text';
  }

  @override
  String get ipTagFailed => 'Açılamadı';

  @override
  String get ipTagGroupCamera => 'Kamera (RTSP)';

  @override
  String get ipTagGroupDb => 'Veritabanı';

  @override
  String get ipTagGroupFtp => 'FTP';

  @override
  String get ipTagGroupPrinter => 'Yazıcı';

  @override
  String get ipTagGroupRdp => 'Uzak Masaüstü';

  @override
  String get ipTagGroupSmb => 'Dosya paylaşımı';

  @override
  String get ipTagGroupSsh => 'SSH';

  @override
  String get ipTagGroupVnc => 'VNC';

  @override
  String get ipTagGroupWeb => 'Web';

  @override
  String ipTagOpened(String text) {
    return 'Açılıyor: $text';
  }

  @override
  String get ipTrayHiddenHint =>
      'IP Tools tepside çalışmaya devam ediyor. Simgeye tıklayınca pencere geri açılır.';

  @override
  String get ipTrayQuit => 'Çıkış';

  @override
  String get ipTrayShow => 'IP Tools\'u göster';

  @override
  String get ipWelcomeBody =>
      'Bir IP aralığı kaydedin (ör. 192.168.1.0/24). Kayda tıkladığınızda aralık taranır; bulunan cihazların adı, üreticisi ve açık servisleri listelenir. Servis etiketine tıklayınca ilgili uygulama açılır.';

  @override
  String get ipWelcomeTitle => 'Yerel ağınızda ne var?';

  @override
  String get cvTypeVideo => 'Video';

  @override
  String get cvTypeImage => 'Resim';

  @override
  String get cvTypeAudio => 'Ses';

  @override
  String get cvTypeVideoHint => 'MP4, MKV, AVI, MOV…';

  @override
  String get cvTypeImageHint => 'JPG, PNG, WEBP, AVIF…';

  @override
  String get cvTypeAudioHint => 'MP3, WAV, FLAC, M4A…';

  @override
  String get cvTypeVideoAll => 'Tüm video dosyaları';

  @override
  String get cvTypeImageAll => 'Tüm resim dosyaları';

  @override
  String get cvTypeAudioAll => 'Tüm ses dosyaları';

  @override
  String get cvAppSearchPh => 'Projelerde ara…  (Ctrl+F)';

  @override
  String get cvAppNewProject => 'Yeni proje';

  @override
  String get cvAppSettings => 'Ayarlar';

  @override
  String cvAppStats(String c, String f) {
    return '$c proje · $f klasör';
  }

  @override
  String get cvAppWelcome => 'Hoş geldiniz';

  @override
  String cvAppResults(String q) {
    return '“$q” için sonuçlar';
  }

  @override
  String get cvAppAll => 'Tüm projeler';

  @override
  String get cvAppWelcomeHint =>
      'İlk dönüştürme projenizi oluşturun.<br>Video, resim ya da ses seçin, kaynak ve hedef uzantıyı belirleyin, dosya veya klasörü gösterin.';

  @override
  String get cvAppFolders => 'Klasörler';

  @override
  String get cvAppProjects => 'Projeler';

  @override
  String get cvAppDblHint => 'Açmak için projeye çift tıklayın';

  @override
  String get cvAppNoMatch => 'Eşleşen proje bulunamadı.';

  @override
  String cvAppFolderCount(String n) {
    return '$n proje';
  }

  @override
  String get cvAppNewProjectHere => 'Bu klasörde yeni proje';

  @override
  String get cvAppNewSubfolder => 'Alt klasör oluştur';

  @override
  String get cvAppDuplicate => 'Kopyasını oluştur';

  @override
  String get cvAppMoveToFolder => 'Klasöre taşı…';

  @override
  String get cvAppProjectMoved => 'Proje taşındı';

  @override
  String get cvAppFolderIntoSelf => 'Klasör kendi içine taşınamaz';

  @override
  String get cvAppFolderPh => 'Örn. Müşteri videoları';

  @override
  String get cvAppRenameFolder => 'Klasörü yeniden adlandır';

  @override
  String get cvAppDeleteFolder => 'Klasörü sil';

  @override
  String cvAppDeleteFolderMsg(String name) {
    return '<b>$name</b> klasörü silinsin mi?';
  }

  @override
  String cvAppDeleteFolderProjects(String n) {
    return '<br>İçindeki $n proje üst klasöre taşınacak.';
  }

  @override
  String get cvAppRootFolder => 'Ana dizin (klasörsüz)';

  @override
  String cvAppMoveTitle(String name) {
    return '“$name” taşı';
  }

  @override
  String get cvAppTargetFolder => 'Hedef klasör';

  @override
  String get cvAppDeleteProject => 'Projeyi sil';

  @override
  String cvAppDeleteProjectMsg(String name) {
    return '<b>$name</b> projesi silinsin mi?<br>Bu projenin dönüştürülmüş dosyaları ve metinleri de silinir. Kaynak dosyalarınıza dokunulmaz.';
  }

  @override
  String get cvAppProjectSettings => 'Proje ayarları';

  @override
  String get cvAppNoSource => 'Bu bilgisayarda kaynak seçilmedi';

  @override
  String get cvAppAllExts => 'Tümü';

  @override
  String get cvAppRunning => 'Çalışıyor';

  @override
  String cvAppDoneCount(String n) {
    return '$n tamam';
  }

  @override
  String cvAppErrorCount(String n) {
    return '$n hata';
  }

  @override
  String get cvAppProjectSaved => 'Proje kaydedildi';

  @override
  String get cvAppClearOutputs => 'Çevrilmiş dosyaları sil';

  @override
  String cvAppClearOutputsMsg(String name) {
    return '<b>$name</b> projesinin dönüştürülmüş dosyaları silinsin mi? Kaynak dosyalarınıza dokunulmaz; istediğinizde yeniden dönüştürebilirsiniz.';
  }

  @override
  String get cvPfTitleNew => 'Yeni proje';

  @override
  String cvPfTitleEdit(String name) {
    return 'Proje ayarları: $name';
  }

  @override
  String get cvPfCreate => 'Kaydet';

  @override
  String get cvPfTabGeneral => 'Genel';

  @override
  String get cvPfTabOutput => 'Dönüştürme ayarları';

  @override
  String get cvPfTabSpeech => 'Konuşma';

  @override
  String get cvPfName => 'Proje ismi';

  @override
  String get cvPfNamePh => 'Örn. Tatil videoları';

  @override
  String get cvPfType => 'Tür';

  @override
  String get cvPfSourceExt => 'Kaynak dosya uzantısı';

  @override
  String get cvPfTargetExt => 'Hedef dosya uzantısı';

  @override
  String get cvPfSelectAll => 'Tümünü seç';

  @override
  String get cvPfSelectNone => 'Hiçbiri';

  @override
  String get cvPfGroupVideo => 'Video';

  @override
  String get cvPfGroupAnim => 'Animasyon';

  @override
  String get cvPfGroupAudioOnly => 'Yalnız ses (videodan ses çıkar)';

  @override
  String get cvPfAudioOnlyHint => 'Videonun yalnız sesi alınır.';

  @override
  String get cvPfGifHint => 'Animasyonlu GIF (en fazla 30 kare/sn).';

  @override
  String get cvPfSource => 'Kaynak';

  @override
  String get cvPfModeFile => 'Dosya';

  @override
  String get cvPfModeFolder => 'Klasör';

  @override
  String get cvPfPathFile => 'Dönüştürülecek dosya';

  @override
  String get cvPfPathFolder => 'Dönüştürülecek klasör';

  @override
  String get cvPfPathNone => 'Henüz seçilmedi — Seç… düğmesine basın';

  @override
  String get cvPfSubfolders => 'Alt klasörleri de dahil et';

  @override
  String get cvPfConcurrency => 'Aynı anda çevrilecek dosya sayısı';

  @override
  String get cvPfConcurrencyHint =>
      'Yüksek değer daha hızlı bitirir ama işlemciyi ve diski daha çok yorar.';

  @override
  String get cvPfFolder => 'Proje klasörü';

  @override
  String get cvPfSpeechAsk => 'Konuşmayı metne çevir (speech)';

  @override
  String get cvPfSpeechAskHint =>
      'Video veya sesteki konuşma metne çevrilir: cümlenin geçtiği saniye, dil ve metin ayrı sütunlarda görünür.';

  @override
  String get cvPfSpeechModel => 'Konuşma modeli';

  @override
  String get cvPfSpeechLang => 'Konuşma dili';

  @override
  String get cvPfPerWindow => 'Her 30 saniyede dili yeniden algıla';

  @override
  String get cvPfPerWindowHint =>
      'Birden çok dil konuşulan kayıtlar için. Daha yavaştır.';

  @override
  String get cvPfModels => 'Modeller';

  @override
  String get cvPfSpeechNote =>
      'Konuşma tanıma bu bilgisayarda, çevrimdışı çalışır (whisper.cpp); ses hiçbir sunucuya gönderilmez. Model ilk kullanımda bir kez indirilir.';

  @override
  String get cvPfErrExt => 'En az bir kaynak uzantısı seçin.';

  @override
  String get cvOutQuality => 'Kalite';

  @override
  String get cvOutQHigh => 'Yüksek (büyük dosya)';

  @override
  String get cvOutQMedium => 'Orta (önerilen)';

  @override
  String get cvOutQLow => 'Düşük (küçük dosya)';

  @override
  String get cvOutResolution => 'Çözünürlük';

  @override
  String get cvOutAsSource => 'Kaynakla aynı';

  @override
  String get cvOutResolutionHint =>
      'Yalnız küçültür; daha küçük videolar büyütülmez.';

  @override
  String get cvOutFps => 'Kare hızı';

  @override
  String get cvOutCodec => 'Video kodeği';

  @override
  String get cvOutH264 => 'H.264 (en uyumlu)';

  @override
  String get cvOutH265 => 'H.265 / HEVC (daha küçük)';

  @override
  String get cvOutCodecHint =>
      'H.265 yalnız MP4, MKV, MOV ve M4V hedeflerinde kullanılır.';

  @override
  String get cvOutSpeed => 'Kodlama hızı';

  @override
  String get cvOutSpeedVeryfast => 'Çok hızlı';

  @override
  String get cvOutSpeedFast => 'Hızlı';

  @override
  String get cvOutSpeedMedium => 'Dengeli';

  @override
  String get cvOutSpeedSlow => 'Yavaş (daha küçük dosya)';

  @override
  String get cvOutAudioBitrate => 'Ses bit hızı';

  @override
  String get cvOutNoAudio => 'Sesi kaldır';

  @override
  String get cvOutImgQuality => 'Kalite';

  @override
  String get cvOutImgQualityHint =>
      'JPG, WEBP, AVIF ve TIFF için. PNG kayıpsızdır; 80 altında renk paleti kullanılır.';

  @override
  String get cvOutMaxWidth => 'En fazla genişlik';

  @override
  String get cvOutMaxHeight => 'En fazla yükseklik';

  @override
  String get cvOutNoLimit => 'Sınırsız';

  @override
  String get cvOutResizeHint =>
      'En-boy oranı korunur; küçük resimler büyütülmez.';

  @override
  String get cvOutKeepMeta => 'Meta verileri koru (EXIF, renk profili)';

  @override
  String get cvOutKeepMetaHint =>
      'Kapalıyken konum gibi kişisel bilgiler çıktıya yazılmaz.';

  @override
  String get cvOutBitrate => 'Bit hızı';

  @override
  String get cvOutBitrateHint =>
      'WAV, FLAC ve AIFF kayıpsızdır; bit hızı uygulanmaz.';

  @override
  String get cvOutSampleRate => 'Örnekleme hızı';

  @override
  String get cvOutChannels => 'Kanallar';

  @override
  String get cvOutStereo => 'Stereo';

  @override
  String get cvOutMono => 'Mono';

  @override
  String get cvSpeechModelTiny => 'Çok küçük (en hızlı)';

  @override
  String get cvSpeechModelBase => 'Temel (önerilen)';

  @override
  String get cvSpeechModelSmall => 'Küçük (daha doğru)';

  @override
  String get cvSpeechModelMedium => 'Orta (yüksek doğruluk)';

  @override
  String get cvSpeechModelTurbo => 'Large v3 Turbo (en doğru)';

  @override
  String get cvSpeechLangAuto => 'Otomatik algıla';

  @override
  String get cvSpeechDownload => 'İndir';

  @override
  String cvSpeechInstalled(String size) {
    return 'Yüklü · $size';
  }

  @override
  String get cvSpeechDownloadFailed => 'Model indirilemedi';

  @override
  String get cvSpeechDlEngine => 'Konuşma motoru indiriliyor';

  @override
  String cvSpeechDlModel(String model) {
    return 'Konuşma modeli indiriliyor: $model';
  }

  @override
  String get cvSpeechEngineAuto =>
      'Konuşma motoru (whisper.cpp) ilk kullanımda indirilecek.';

  @override
  String get cvSpeechEngineMissing =>
      'Konuşma motoru (whisper-cli) bulunamadı.';

  @override
  String get cvPjOriginal => 'Orijinal';

  @override
  String get cvPjConverted => 'Dönüştürülmüş';

  @override
  String get cvPjFolders => 'Klasörler';

  @override
  String get cvPjFiles => 'Dosyalar';

  @override
  String get cvPjTranscript => 'Metin';

  @override
  String get cvPjTrSecond => 'Saniye';

  @override
  String get cvPjTrLang => 'Dil';

  @override
  String get cvPjTrText => 'Metin';

  @override
  String get cvPjSecUnit => 'sn';

  @override
  String get cvPjStart => 'Başlat';

  @override
  String get cvPjStop => 'Durdur';

  @override
  String get cvPjChangeSource => 'Kaynağı değiştir';

  @override
  String get cvPjPickSource => 'Kaynak seç';

  @override
  String get cvPjOpenOutDir => 'Dönüştürülmüş dosyalar klasörünü aç';

  @override
  String get cvPjExportOutputs =>
      'Dönüştürülmüş dosyaları başka klasöre kopyala…';

  @override
  String get cvPjClearOutputs => 'Çevrilmiş dosyaları sil';

  @override
  String get cvPjLinkPreview => 'İki önizlemeyi birlikte oynat';

  @override
  String get cvPjFilterPh => 'Dosyalarda ara';

  @override
  String get cvPjFAll => 'Tümü';

  @override
  String get cvPjFPending => 'Bekleyen';

  @override
  String get cvPjFActive => 'Süren';

  @override
  String get cvPjFDone => 'Tamamlanan';

  @override
  String get cvPjFError => 'Hatalı';

  @override
  String get cvPjExpandAll => 'Tümünü aç';

  @override
  String get cvPjCollapseAll => 'Tümünü kapat';

  @override
  String get cvPjRescan => 'Yeniden tara';

  @override
  String get cvPjColName => 'Ad';

  @override
  String get cvPjColFolder => 'Klasör';

  @override
  String get cvPjColSize => 'Boyut';

  @override
  String get cvPjColProgress => 'İlerleme';

  @override
  String get cvPjColStatus => 'Durum';

  @override
  String get cvPjColSpeech => 'Metin';

  @override
  String get cvPjColOut => 'Çıktı';

  @override
  String cvPjSegments(String n) {
    return '$n cümle';
  }

  @override
  String get cvPjNoAudio => 'Ses yok';

  @override
  String cvPjNoFiles(String exts) {
    return 'Bu klasörde seçili uzantılarda dosya yok ($exts).';
  }

  @override
  String get cvPjNoMatch => 'Eşleşen dosya yok.';

  @override
  String get cvPjNoneChecked =>
      'Listede dosya yok. Soldaki ağaçtan dönüştürülecek dosyaları işaretleyin.';

  @override
  String get cvPjConvertThis => 'Bu dosyayı dönüştür';

  @override
  String get cvPjReconvert => 'Yeniden dönüştür';

  @override
  String get cvPjTranscribeThis => 'Metne çevir';

  @override
  String get cvPjRetranscribe => 'Yeniden metne çevir';

  @override
  String get cvPjOpenOut => 'Dönüştürülmüş dosyayı aç';

  @override
  String get cvPjRevealOut => 'Dönüştürülmüşü klasörde göster';

  @override
  String get cvPjOpenSrc => 'Orijinal dosyayı aç';

  @override
  String get cvPjRevealSrc => 'Orijinali klasörde göster';

  @override
  String get cvPjExportThis => 'Başka klasöre kopyala…';

  @override
  String get cvPjDeleteOut => 'Dönüştürülmüş dosyayı sil';

  @override
  String get cvPjUncheck => 'Listeden çıkar';

  @override
  String cvPjExported(String n) {
    return '$n dosya kopyalandı';
  }

  @override
  String get cvPjFileMissing => 'Kaynak dosya bulunamadı.';

  @override
  String get cvPjPickToPreview => 'Önizlemek için listeden bir dosya seçin.';

  @override
  String get cvPjOutPreviewHint => 'Dönüştürülünce burada görünecek.';

  @override
  String get cvPjConverting => 'Dönüştürülüyor…';

  @override
  String get cvPjCantPlay => 'Bu biçim burada doğrudan oynatılamıyor.';

  @override
  String get cvPjMakePreview => 'Önizleme oluştur';

  @override
  String get cvPjMakingPreview => 'Önizleme hazırlanıyor…';

  @override
  String get cvPjNoSourceTitle => 'Bu bilgisayarda kaynak seçilmedi';

  @override
  String get cvPjNoSourceHint =>
      'Proje başka bir cihazdan senkronlandı ya da kaynak henüz seçilmedi. Dönüştürülecek dosyayı veya klasörü seçin.';

  @override
  String get cvPjSourceGone => 'Kaynak bulunamadı';

  @override
  String get cvPjTrImage =>
      'Konuşmadan metne yalnız video ve ses projelerinde kullanılır.';

  @override
  String get cvPjTrPick => 'Metnini görmek için bir dosya seçin.';

  @override
  String get cvPjTrAfter => 'Dosya dönüştürülünce konuşma metne çevrilecek.';

  @override
  String get cvPjTrOff =>
      'Bu projede konuşmadan metne kapalı. İsterseniz bu dosya için şimdi çalıştırın.';

  @override
  String cvPjTrRunning(String p) {
    return 'Konuşma metne çevriliyor… %$p';
  }

  @override
  String get cvPjTrNone => 'Bu dosyada konuşma bulunamadı.';

  @override
  String get cvPjTrNoExport => 'Dışa aktarılacak metin yok.';

  @override
  String get cvPjTrSaved => 'Metin kaydedildi';

  @override
  String get cvPjExportTranscript => 'Metni dışa aktar';

  @override
  String get cvPjFmtSrt => 'SRT altyazı';

  @override
  String get cvPjFmtVtt => 'WebVTT altyazı';

  @override
  String get cvPjFmtTxt => 'Düz metin (TXT)';

  @override
  String get cvPjFmtCsv => 'Tablo (CSV)';

  @override
  String cvPjStTotal(String n) {
    return '$n dosya';
  }

  @override
  String cvPjStDone(String n) {
    return '$n tamam';
  }

  @override
  String cvPjStErr(String n) {
    return '$n hata';
  }

  @override
  String cvPjStActive(String n) {
    return '$n dönüştürülüyor';
  }

  @override
  String cvPjStSpeech(String n) {
    return '$n metne çevriliyor';
  }

  @override
  String cvPjStOut(String size) {
    return 'Çıktı: $size';
  }

  @override
  String cvPjStConc(String n) {
    return 'Aynı anda: $n';
  }

  @override
  String get cvPjFinished => 'Dönüştürme tamamlandı';

  @override
  String cvPjFinishedSub(String done, String err, String total) {
    return '$done/$total dosya tamam · $err hata';
  }

  @override
  String get cvStPending => 'Bekliyor';

  @override
  String get cvStQueued => 'Sırada';

  @override
  String get cvStConverting => 'Dönüştürülüyor';

  @override
  String get cvStDone => 'Tamamlandı';

  @override
  String get cvStError => 'Hata';

  @override
  String get cvStCanceled => 'İptal edildi';

  @override
  String get cvMainBalloonTitle => 'Convert Master çalışmaya devam ediyor';

  @override
  String get cvMainBalloonBody =>
      'Tepsideki simgeye tıklayarak pencereyi yeniden açabilirsiniz.';

  @override
  String get cvMainTrayShow => 'Convert Master\'ı göster';

  @override
  String get cvMainTrayProjects => 'Projeler';

  @override
  String get cvMainTrayNone => '(proje yok)';

  @override
  String get cvMainTrayQuit => 'Çık';

  @override
  String get cvErrCanceled => 'İptal edildi';

  @override
  String get cvErrNoVideo => 'Dosyada video akışı yok.';

  @override
  String get cvErrNoAudio => 'Dosyada ses yok.';

  @override
  String get cvPjOcrThis => 'Metni oku (OCR)';

  @override
  String get cvPjReocr => 'Metni yeniden oku (OCR)';

  @override
  String get cvPjNoText => 'Metin yok';

  @override
  String get cvPjNoTextHint => 'Resimde okunabilir metin bulunamadı.';

  @override
  String get cvPjOcrPanel => 'Metin (OCR)';

  @override
  String get cvPjTrLine => 'Satır';

  @override
  String get cvPjTrConf => 'Güven';

  @override
  String cvPjLines(String n) {
    return '$n satır';
  }

  @override
  String get cvPjOcrAfter => 'Resim dönüştürülünce içindeki metin okunacak.';

  @override
  String get cvPjOcrOff =>
      'Bu projede OCR kapalı. İsterseniz bu resim için şimdi çalıştırın.';

  @override
  String cvPjOcrRunning(String p) {
    return 'Metin okunuyor… %$p';
  }

  @override
  String get cvPjCopyAll => 'Tümünü kopyala';

  @override
  String get cvPjCopied => 'Metin panoya kopyalandı';

  @override
  String cvOcrDl(String lang) {
    return 'OCR dil verisi indiriliyor: $lang';
  }

  @override
  String get cvOcrNotInstalled => 'İlk kullanımda indirilir';

  @override
  String get cvOcrDownloadFailed => 'OCR dil verisi indirilemedi';

  @override
  String get cvPfTabOcr => 'OCR';

  @override
  String get cvPfOcrAsk => 'Resimdeki metni oku (OCR)';

  @override
  String get cvPfOcrAskHint =>
      'Resimlerdeki yazılar metne çevrilir: her satır, okuma güveni ve metin ayrı sütunlarda görünür. İstemezseniz kapalı bırakın.';

  @override
  String get cvPfOcrLangs => 'Resimdeki metnin dili';

  @override
  String get cvPfOcrLangsHint =>
      'En çok 6 dil seçilebilir; az dil daha hızlı ve doğrudur.';

  @override
  String get cvPfOcrData => 'Dil verileri';

  @override
  String get cvPfOcrNote =>
      'OCR bu bilgisayarda, çevrimdışı çalışır (Tesseract); resimler hiçbir sunucuya gönderilmez. Her dilin verisi ilk kullanımda bir kez indirilir.';

  @override
  String cvErrOcr(String msg) {
    return 'Metin okunamadı: $msg';
  }

  @override
  String get cvErrUnreadable =>
      'Dosya okunamadı (bozuk ya da desteklenmeyen dosya).';

  @override
  String get cvErrUnsupported => 'Bu dönüşüm desteklenmiyor.';

  @override
  String cvErrFfmpegMissing(String msg) {
    return 'Dönüştürme motoru (ffmpeg) çalıştırılamadı: $msg';
  }

  @override
  String get cvErrEngineMissing => 'Konuşma motoru (whisper.cpp) bulunamadı.';

  @override
  String cvErrDownload(String msg) {
    return 'İndirme başarısız: $msg';
  }

  @override
  String get cvErrNotFound => 'Dosya bulunamadı.';

  @override
  String get cvErrAccess => 'Erişim reddedildi.';

  @override
  String get cvErrBusy => 'Dosya başka bir program tarafından kullanılıyor.';

  @override
  String get cvErrNoSpace => 'Diskte yer kalmadı.';

  @override
  String cvErrFfmpeg(String msg) {
    return 'Dönüştürülemedi: $msg';
  }

  @override
  String cvErrWhisper(String msg) {
    return 'Metne çevrilemedi: $msg';
  }

  @override
  String get cvMainCloseActive =>
      'Dönüştürme sürüyor. Pencereyi kapatırsanız süren işler durdurulur.';

  @override
  String get cvMainCloseAnyway => 'Yine de kapat';

  @override
  String get cvMainCopySuffix => ' (kopya)';

  @override
  String get cvMainErrProjectNotFound => 'Proje bulunamadı';

  @override
  String get cvMainExportTo => 'Dönüştürülmüş dosyaların kopyalanacağı klasör';

  @override
  String get cvMainPickFile => 'Dönüştürülecek dosyayı seçin';

  @override
  String get cvMainPickFolder => 'Dönüştürülecek klasörü seçin';

  @override
  String get cvMainSaveTranscript => 'Metni kaydet';

  @override
  String get cvMainUntitled => 'Adsız proje';

  @override
  String get sqOp => 'büyük ya da eşit';

  @override
  String get sqOpNotcontains => 'içermez';

  @override
  String get sqOpNotlike => 'NOT LIKE';

  @override
  String get sqOpNotin => 'içinde değil';

  @override
  String get sqOpIsnull => 'boş (NULL)';

  @override
  String get sqOpIsnotnull => 'boş değil';

  @override
  String get ipMobScanThis => 'Bu ağı tara';

  @override
  String get ipMobDeleteRecord => 'Kaydı sil';

  @override
  String get ipMobNewRecordHere => 'Burada yeni kayıt';

  @override
  String get ipMobNoMatch => 'Eşleşen kayıt bulunamadı.';

  @override
  String ipMobAddresses(int n) {
    return '$n adres';
  }

  @override
  String get ipMobAllRecords => 'Tüm kayıtlar';

  @override
  String get ipMobSetScan => 'Tarama';

  @override
  String get ipMobSetPorts => 'Denenecek servisler';

  @override
  String get ipMobSetPortsHint =>
      'Her port için yalnız standart bir TCP bağlantı denemesi yapılır. Liste sabittir; istemediklerinizi kapatabilirsiniz.';

  @override
  String get ipMobSetSpeed => 'Hız';

  @override
  String get ipMobSetConcurrency => 'Eşzamanlı bağlantı';

  @override
  String get ipMobSetConcurrencyHint =>
      'Aynı anda en çok 64 bağlantı denemesi (tasarım sınırı).';

  @override
  String get ipMobSetTimeout => 'Zaman aşımı';

  @override
  String get ipMobSetTimeoutHint => 'Cihaz başına en çok 1000 ms beklenir.';

  @override
  String get ipMobSetLimitsNote =>
      'IP Tools yalnız keşif ve envanter aracıdır: port listesi genişletilemez, zafiyet denemesi ve parola deneme yapılmaz, yalnız özel/yerel adresler taranır.';

  @override
  String get ipMobMacMobile => 'mobilde kullanılamaz';

  @override
  String get ipMobAliveTcp => 'TCP bağlantısına yanıt verdi';

  @override
  String get ipMobAliveName => 'Ad çözümüne yanıt verdi';

  @override
  String get ipMobOpenInSsh => 'SSH Master\'da aç';

  @override
  String get ipMobOpenInSshNote =>
      'Adres panoya kopyalandı; SSH Master › Yeni bağlantı formuna yapıştırın.';

  @override
  String get ipMobCopyAddress => 'Adresi kopyala';

  @override
  String get ipMobSuggestLocal => 'Bu cihazın ağı';

  @override
  String get ipMobSuggestLocalNone => 'Wi-Fi ağı bulunamadı';

  @override
  String get ipMobPhoneNoMacNote =>
      'Mobilde ping ve ARP yoktur: canlılık TCP bağlantı denemesi ve ad çözümüyle belirlenir; MAC ve üretici bilgisi gösterilemez.';

  @override
  String get cvMobNotOnMobile => 'Mobilde kullanılamaz';

  @override
  String get cvMobSpeechNote =>
      'Konuşmadan metne (whisper.cpp) mobil sürümde yoktur; ayarlar korunur ve masaüstünde uygulanır.';

  @override
  String get cvMobOcrNote =>
      'Resimden metin (OCR, Tesseract) mobil sürümde yoktur; ayarlar korunur ve masaüstünde uygulanır.';

  @override
  String get cvMobFolderNote =>
      'Mobilde kaynak klasör seçilemez; dosyalar tek tek ya da galeriden eklenir.';

  @override
  String get cvMobConcurrencyHint =>
      'Mobilde en çok 2 dosya aynı anda dönüştürülür.';

  @override
  String get cvMobAddFiles => 'Dosya ekle';

  @override
  String get cvMobAddFromGallery => 'Galeriden ekle';

  @override
  String get cvMobPickFilesHint =>
      'Dönüştürülecek dosyaları ekleyin; çıktılar uygulama belgeleri altında saklanır.';

  @override
  String get cvMobShareOutput => 'Çıktıyı paylaş';

  @override
  String get cvMobShareAllOutputs => 'Tüm çıktıları paylaş';

  @override
  String get cvMobSourceCopies => 'Kaynak kopyaları';

  @override
  String get cvMobModuleSettings => 'Convert Master ayarları';

  @override
  String get cvMobDefaultConcurrency =>
      'Yeni projelerde aynı anda çevrilecek dosya sayısı';

  @override
  String get cvMobStorage => 'Depolama';

  @override
  String get cvMobConversion => 'Dönüştürme';

  @override
  String get cvMobClearOrphans => 'Silinmiş projelerin dosyalarını temizle';

  @override
  String get cvMobStorageNote =>
      'Dönüştürülmüş dosyalar ve kaynak kopyaları uygulamanın belgeler klasöründe tutulur; cihazınızdan ayrılmaz.';

  @override
  String get cvMobCleared => 'Temizlendi';

  @override
  String get cvMobNoOutputsYet => 'Henüz dönüştürülmüş dosya yok.';

  @override
  String cvMobFilesAdded(int n) {
    return '$n dosya eklendi';
  }

  @override
  String get cvMobUnsupportedExt =>
      'Bu projenin kaynak uzantıları arasında değil';

  @override
  String get cvMobUnsupportedOnMobile => 'Mobilde desteklenmiyor';

  @override
  String get cvMobLicense =>
      'Video ve ses dönüştürme FFmpegKit (LGPL 3.0, GPL bileşeni yok) ile yapılır; H.264 / H.265 kodlama cihazın donanım kodlayıcısını (iOS VideoToolbox, Android MediaCodec) kullanır.';

  @override
  String cvMobConverted(int n) {
    return '$n dosya dönüştürüldü';
  }

  @override
  String cvMobFilesCount(int n) {
    return '$n dosya';
  }

  @override
  String get sqMobUnsupportedMobile => 'Bu motor mobilde henüz desteklenmiyor';

  @override
  String get sqMobPickFile => 'Seç';

  @override
  String get sqMobFileCopied =>
      'Dosya uygulamanın belgeler dizinine kopyalandı';

  @override
  String get sqMobSshKeyPaste => 'PEM anahtarı yapıştırın ya da dosyadan seçin';

  @override
  String get sqMobErrHost => 'Sunucu adresi gerekli';

  @override
  String get sqMobErrFile => 'Veritabanı dosyası seçin';

  @override
  String get sqMobErrSshHost => 'SSH sunucusu ve kullanıcı adı gerekli';

  @override
  String get sqMobErrSshKey => 'SSH özel anahtarı gerekli';

  @override
  String get sqMobSslVerifyNote =>
      'MySQL sürücüsü sertifika doğrulamaz; \"doğrula\" seçeneği \"zorunlu\" gibi davranır.';

  @override
  String get sqMobRowDetail => 'Satır ayrıntısı';

  @override
  String get sqMobNoResult => 'Sonuç yok — Çalıştır ile başlayın';

  @override
  String get sqMobExportJsonl => 'JSONL (satır başına JSON)';

  @override
  String get sqMobExportNoRows => 'Dışa aktarılacak satır yok';

  @override
  String get sqMobSettingsTitle => 'SQL Master ayarları';

  @override
  String get sqMobRowLimit => 'Sorgu satır sınırı';

  @override
  String get sqMobPreviewRows => 'Tablo önizleme satırı';

  @override
  String get sqMobEditorFont => 'Editör yazı boyutu';

  @override
  String get sqMobCopyCell => 'Değeri kopyala';

  @override
  String get sqMobSelectionRun => 'Seçimi çalıştır';

  @override
  String get sqMobTunnelOpening => 'SSH tüneli açılıyor…';

  @override
  String get sqMobConnectingDb => 'Veritabanına bağlanılıyor…';

  @override
  String get sqMobOpEq => '= (eşittir)';

  @override
  String get sqMobOpNe => '≠ (eşit değil)';

  @override
  String get sqMobOpLt => '< (küçük)';

  @override
  String get sqMobOpGt => '> (büyük)';

  @override
  String get sqMobOpLe => '≤ (küçük ya da eşit)';

  @override
  String get npMobSaveAs => 'Farklı kaydet…';

  @override
  String get npMobSaveAsTitle => 'Farklı kaydet';

  @override
  String get npMobDefaultProjectName => 'Proje';

  @override
  String get npMobLocalPathExample => 'Belgeler/Notepad Master/…';

  @override
  String get npMobReplaceAll => 'Tümünü değiştir';
}
