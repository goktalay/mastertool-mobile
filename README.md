# Master Tool — Android ve iPhone

Mastertool ailesinin tek mobil uygulaması. Bir kez giriş yapılır; hesapta açık olan modüller (SSH Master, FTP Masters,
SQL Master, Notepad Master, Convert Master, IP Tools) uygulamanın içinde çalışır. Masaüstü uygulamalarla aynı hesap ve
aynı uçtan uca şifreli senkron kullanılır: bilgisayarda kayıtlı SSH/FTP bağlantıları telefonda da görünür.

Sunucu sözleşmesi: fabrika-yonetim `docs/mastertool-api.md` (v1) ve kardeş belgeler. Mobil istemci `/api/mt/auth/login`
gövdesinde `client: "android" | "ios"` gönderir; modül oturumları `/api/<app>/auth/sso` ile şifresiz açılır.

## Yapı
```
lib/core/      crypto (PBKDF2/HKDF/AES-GCM, masaüstüyle birebir), api, account (oturum, modül token'ları, encKey),
               prefs (dil/tema), theme (Mastertool renkleri), module (modül arayüzü), l10n (8 dil ARB → MtStrings)
lib/screens/   giriş, ana ekran (modül kutucukları), ayarlar (Genel · Hesap · Hakkında)
lib/modules/   ssh (dartssh2 + xterm; terminal, kısayollar, SFTP yok) · ftp (kendi FTP/FTPS/FTPES istemcisi + SFTP; gezgin, aktarımlar)
               sql (PostgreSQL / MySQL-MariaDB / SQLite; SSH tüneli; salt okunur sınıflandırıcı; ağaç, tablo verisi, editör, dışa aktarma)
               notepad (SSH/FTP/Lokal/Dosya projeleri; kodlama ve satır sonu; re_editor; çakışma koruması)
               iptools (yerel ağ keşfi: 15 sabit port, TCP connect, ters DNS + mDNS; tasarım sınırları koda gömülü)
               convert (resim: saf Dart `image`; video/ses: FFmpegKit LGPL + donanım H.264/H.265)
lib/widgets/   mt_widgets (düğme/girdi/segment/onay/kutu/toast/rozet) · library_screen (tüm modüllerin ortak kitaplık ekranı)
tools/         vectors.js — Node ile kripto test vektörleri (masaüstü formülleri)
docs/          magaza-yayin.md — Google Play / App Store yayın tarifi
```

## Geliştirme
```
flutter pub get && flutter gen-l10n
flutter analyze && flutter test            # golden'lar: flutter test --update-goldens (telefon/tablet × gece/gündüz)
flutter build apk --debug
```
Canlı testler: `test/ftp_live_test.dart` yerel pyftpdlib sunucuları (2121 FTP, 2122 FTPES) çalışıyorsa koşar, yoksa atlanır.
Mobilde olmayanlar: SQL Server ve DuckDB sürücüleri, konuşmadan metne / OCR, MAC/üretici (ARP), SFTP dosya paneli (SSH modülünde; FTP modülü SFTP'yi kapsar).
Diller: tr, en, fr, de, es, ar (sağdan sola), zh, ru — `lib/core/l10n/app_<dil>.arb`; her dilde anahtar sayısı eşit olmalı.
Tema: Gece / Gündüz / Sistem (varsayılan Sistem).

## Yayın
`vX.Y.Z` etiketi → `.github/workflows/build.yml`: Android AAB+APK (GitHub Release, isteğe bağlı Play iç test kanalı) ve
iOS IPA → TestFlight. Gizli değerler iş akışı dosyasının başında listelenir. Mağaza sayfaları (metin, görseller, gizlilik
bağlantısı `https://mastertool.download/gizlilik`) mağaza konsollarında elle hazırlanır.

Paket adı Android: `download.mastertool.master_tool` · iOS bundle id: `download.mastertool.masterTool`.
