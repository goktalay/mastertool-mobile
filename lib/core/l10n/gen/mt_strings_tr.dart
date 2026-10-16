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
}
