// IP Tools — mobil sözlükte (mt_strings) henüz bulunmayan metinler. ARB'ye eklenince buradan s.ip… anahtarlarına taşınacak.
// (Masaüstü i18n.js'teki set.* anahtarları ve yalnız mobile özgü notlar.)
class IpTr {
  static const scanThis = 'Bu ağı tara'; // form: kaydet ve tara
  static const deleteRecord = 'Kaydı sil';
  static const newRecordHere = 'Burada yeni kayıt';
  static const noMatch = 'Eşleşen kayıt bulunamadı.';
  static const addresses = 'adres'; // "254 adres" etiketi
  static const settingsTitle = 'IP Tools ayarları';
  static const setScan = 'Tarama';
  static const setPorts = 'Denenecek servisler';
  static const setPortsHint = 'Her port için yalnız standart bir TCP bağlantı denemesi yapılır. Liste sabittir; istemediklerinizi kapatabilirsiniz.';
  static const setSpeed = 'Hız';
  static const setConcurrency = 'Eşzamanlı bağlantı';
  static const setConcurrencyHint = 'Aynı anda en çok 64 bağlantı denemesi (tasarım sınırı).';
  static const setTimeout = 'Zaman aşımı';
  static const setTimeoutHint = 'Cihaz başına en çok 1000 ms beklenir.';
  static const setLimitsNote = 'IP Tools yalnız keşif ve envanter aracıdır: port listesi genişletilemez, zafiyet denemesi ve parola deneme yapılmaz, yalnız özel/yerel adresler taranır.';
  static const macMobile = 'mobilde kullanılamaz'; // MAC / üretici: Android 10+ ve iOS ARP tablosunu vermez
  static const aliveTcp = 'TCP bağlantısına yanıt verdi';
  static const aliveName = 'Ad çözümüne yanıt verdi';
  static const openInSsh = "SSH Master'da aç";
  static const openInSshNote = 'Adres panoya kopyalandı; SSH Master › Yeni bağlantı formuna yapıştırın.';
  static const copyAddress = 'Adresi kopyala';
  static const suggestLocal = 'Bu cihazın ağı'; // form: Wi-Fi alt ağını öner
  static const suggestLocalNone = 'Wi-Fi ağı bulunamadı';
  static const historyTitle = 'Tarama geçmişi';
  static const phoneNoMacNote = 'Mobilde ping ve ARP yoktur: canlılık TCP bağlantı denemesi ve ad çözümüyle belirlenir; MAC ve üretici bilgisi gösterilemez.';
}
