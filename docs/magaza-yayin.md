# Master Tool mobil — mağaza yayın tarifi

Tek uygulama: **Master Tool** (Android paket adı `download.mastertool.master_tool`, iOS bundle id `download.mastertool.masterTool`).
Yayın akışı: `vX.Y.Z` etiketi → `.github/workflows/build.yml` → Android AAB/APK (GitHub Release + isteğe bağlı Play iç test) ve
iOS IPA → TestFlight. Mağaza sayfası metin/görselleri konsollarda elle hazırlanır. Gizlilik politikası: `https://mastertool.download/gizlilik`.

## 1. Google Play (tek seferlik)
1. Play Console › Uygulama oluştur: ad **Master Tool**, varsayılan dil Türkçe, uygulama (oyun değil), ücretsiz.
2. **Yükleme anahtarı** (kendi anahtarımız; Play App Signing açık kalır):
   ```
   keytool -genkeypair -v -keystore upload.jks -alias mastertool -keyalg RSA -keysize 4096 -validity 10000 \
     -dname "CN=SKYREX HAVACILIK TEKNOLOJI, O=SKYREX, C=TR"
   base64 -w0 upload.jks > upload.jks.b64
   ```
   GitHub › depo › Settings › Secrets and variables › Actions: `ANDROID_KEYSTORE_B64` (dosya içeriği), `ANDROID_KEYSTORE_PASSWORD`,
   `ANDROID_KEY_ALIAS` (= mastertool), `ANDROID_KEY_PASSWORD`. upload.jks dosyasını güvenli yerde saklayın (kaybolursa Play'den sıfırlama istenir).
3. İlk AAB **elle** yüklenir (Play, ilk sürümde paket adını ve imzayı öğrenir): etiket atıp Actions'tan `app-release.aab` indirin → Play Console › Test › İç test › Yeni sürüm.
4. Otomatik yükleme (isteğe bağlı): Google Cloud'da hizmet hesabı → JSON anahtarı → Play Console › Kullanıcılar ve izinler'de bu hesabı
   "Sürüm yöneticisi" yapın → GitHub secret `PLAY_SERVICE_ACCOUNT_JSON` (JSON içeriği). Sonraki etiketler iç test kanalına otomatik gider.
5. Mağaza kaydı: kısa açıklama (80), uzun açıklama (4000), simge 512×512 (assets/icon/icon.png), öne çıkan görsel 1024×500,
   telefon ekran görüntüleri (en az 2; 16:9 ya da 9:16), 7" ve 10" tablet görüntüleri (tablet desteği için), içerik derecelendirme anketi,
   veri güvenliği formu (toplanan: e-posta — hesap; cihaz adı — oturum; şifrelenmiş kitaplık — sunucu okuyamaz; üçüncü tarafa paylaşım yok),
   hedef kitle 18+, reklam yok.

## 2. Apple App Store (tek seferlik)
1. developer.apple.com › Certificates, Identifiers & Profiles:
   - Identifier: App ID `download.mastertool.masterTool` (Explicit). Capabilities: yok (yerel ağ izni Info.plist ile).
   - Certificate: **Apple Distribution** (CSR'ı Mac'te Keychain Access ile ya da `openssl req -new -newkey rsa:2048 -nodes -keyout dist.key -out dist.csr` ile üretin; .cer'i .p12'ye çevirin).
   - Profile: App Store Connect dağıtım profili, adı **Master Tool App Store** (ios/ExportOptions.plist bu adı bekler).
2. App Store Connect › Users and Access › Integrations › App Store Connect API: anahtar oluştur (rol: App Manager). `Issuer ID`, `Key ID`, `.p8` dosyası.
3. GitHub secrets: `IOS_CERT_P12_B64` (`base64 -w0 dist.p12`), `IOS_CERT_PASSWORD`, `IOS_PROVISION_B64` (`base64 -w0 profil.mobileprovision`),
   `APPSTORE_ISSUER_ID`, `APPSTORE_KEY_ID`, `APPSTORE_PRIVATE_KEY` (.p8 içeriği).
4. ios/Runner.xcodeproj'de `DEVELOPMENT_TEAM` = Team ID (CI'da imza manuel; `flutter build ipa --export-options-plist` profili adıyla bulur).
5. App Store Connect › My Apps › New App: ad **Master Tool**, bundle id yukarıdaki, SKU `mastertool`, birincil dil Türkçe.
   Etiket sonrası derleme TestFlight'a düşer; dahili test → inceleme. Mağaza kaydı: 6.7" ve 6.5" iPhone görüntüleri, 12.9" iPad görüntüleri
   (iPad desteği açık), gizlilik beyanı (App Privacy: e-posta hesapla ilişkili; cihaz adı; veri izleme yok), yaş 4+, dışa aktarma uyumu: şifreleme kullanıyor →
   muafiyet (standart TLS + kullanıcı verisi şifreleme; `ITSAppUsesNonExemptEncryption` = NO yalnız standart algoritmalar için — biz AES/PBKDF2 kullanıyoruz, "muaf" seçilir).

## 3. Her sürümde
1. `pubspec.yaml` `version:` güncelle (ör. 1.0.0+1 — CI build-number'ı run number ile ezer).
2. Kayıt + etiket: `git tag v1.0.0 && git push origin v1.0.0`.
3. Actions › build: `check` (analiz/test/debug APK) → `android-release` ve `ios-release` paralel.
4. Play: iç test → kapalı test → üretim (aşamalı). App Store: TestFlight → inceleme gönder.

## 4. İzinler ve beyanlar (uygulamada)
- Android: INTERNET; (IP Tools) ACCESS_WIFI_STATE/ACCESS_NETWORK_STATE; dosya seçici SAF (ek izin yok).
- iOS: NSLocalNetworkUsageDescription ("Yerel ağınızdaki cihazları keşfetmek için"), NSBonjourServices (mDNS), fotoğraf/dosya erişimi sistem seçiciyle.
- Mağaza yönergeleri: "yalnız yetkili olduğunuz ağları tarayın" uyarısı ürün içinde kalıcı; zafiyet taraması yok.
