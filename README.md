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
lib/modules/   sm ssh · fm ftp · sq sql · np notepad · cv convert · ip iptools
tools/         vectors.js — Node ile kripto test vektörleri (masaüstü formülleri)
```

## Geliştirme
```
flutter pub get && flutter gen-l10n
flutter analyze && flutter test
flutter build apk --debug
```
Diller: tr, en, fr, de, es, ar (sağdan sola), zh, ru — `lib/core/l10n/app_<dil>.arb`; her dilde anahtar sayısı eşit olmalı.
Tema: Gece / Gündüz / Sistem (varsayılan Sistem).

## Yayın
`vX.Y.Z` etiketi → `.github/workflows/build.yml`: Android AAB+APK (GitHub Release, isteğe bağlı Play iç test kanalı) ve
iOS IPA → TestFlight. Gizli değerler iş akışı dosyasının başında listelenir. Mağaza sayfaları (metin, görseller, gizlilik
bağlantısı `https://mastertool.download/gizlilik`) mağaza konsollarında elle hazırlanır.

Paket adı Android: `download.mastertool.master_tool` · iOS bundle id: `download.mastertool.masterTool`.
