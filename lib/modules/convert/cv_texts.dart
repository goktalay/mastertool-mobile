// Sözlükte (mt_strings `cv*`) karşılığı olmayan mobil metinler — Türkçe sabit; ARB'ye eklenince buradan s.* çağrılarına geçilecek.
class CvT {
  static const notOnMobile = 'Mobilde kullanılamaz';
  static const speechMobileNote = 'Konuşmadan metne (whisper.cpp) mobil sürümde yoktur; ayarlar korunur ve masaüstünde uygulanır.';
  static const ocrMobileNote = 'Resimden metin (OCR, Tesseract) mobil sürümde yoktur; ayarlar korunur ve masaüstünde uygulanır.';
  static const folderMobileNote = 'Mobilde kaynak klasör seçilemez; dosyalar tek tek ya da galeriden eklenir.';
  static const concurrencyMobileHint = 'Mobilde en çok 2 dosya aynı anda dönüştürülür.';
  static const addFiles = 'Dosya ekle';
  static const addFromGallery = 'Galeriden ekle';
  static const pickFilesHint = 'Dönüştürülecek dosyaları ekleyin; çıktılar uygulama belgeleri altında saklanır.';
  static const shareOutput = 'Çıktıyı paylaş';
  static const shareAllOutputs = 'Tüm çıktıları paylaş';
  static const outputFolder = 'Çıktı klasörü';
  static const sourceCopies = 'Kaynak kopyaları';
  static const moduleSettings = 'Convert Master ayarları';
  static const defaultConcurrency = 'Yeni projelerde aynı anda çevrilecek dosya sayısı';
  static const storage = 'Depolama';
  static const conversion = 'Dönüştürme';
  static const clearAllOutputs = 'Tüm çevrilmiş dosyaları sil';
  static const clearOrphans = 'Silinmiş projelerin dosyalarını temizle';
  static const storageNote = 'Dönüştürülmüş dosyalar ve kaynak kopyaları uygulamanın belgeler klasöründe tutulur; cihazınızdan ayrılmaz.';
  static const cleared = 'Temizlendi';
  static const noOutputsYet = 'Henüz dönüştürülmüş dosya yok.';
  static const sourceCopied = 'Dosya eklendi';
  static const unsupportedExt = 'Bu projenin kaynak uzantıları arasında değil';
  static const cancel = 'İptal';
  static const mobileUnsupportedExt = 'Mobilde desteklenmiyor';
  static const detail = 'Ayrıntı';
  static const original = 'Orijinal';
  static const output = 'Çıktı';
  static const license = 'Video ve ses dönüştürme FFmpegKit (LGPL/GPL) ile yapılır.';
  static String converted(int n) => '$n dosya dönüştürüldü';
  static String filesCount(int n) => '$n dosya';
}
