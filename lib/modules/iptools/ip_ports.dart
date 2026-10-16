// Sabit ve kısa port listesi — IP Tools'un tasarım sınırı (masaüstü iptools/src/ports.js birebir).
//
// Kullanıcı bu listeyi genişletemez; Ayarlar › Tarama'da yalnız kapatabilir. Her port için yalnız standart bir TCP
// bağlantı denemesi yapılır (bağlandı / bağlanamadı). Bağlantı açılınca en çok şu kadarı yapılır (probe):
//   banner — sunucunun kendi gönderdiği karşılama satırı okunur (SSH, FTP, VNC); biz hiçbir şey göndermeyiz
//   http   — tek bir "GET /" isteği; yalnız <title> ve Server başlığı alınır (2 sn)
//   tls    — TLS el sıkışması; yalnız sunucunun sunduğu sertifikanın konu adı okunur, sonra http gibi "GET /"
//   none   — hiçbir şey okunmaz ve gönderilmez (yazıcı ham portu 9100, RTSP, SMB, RDP, veritabanları)
import 'dart:ui';

enum Probe { banner, http, tls, none }

class PortInfo {
  const PortInfo(this.port, this.group, this.name, this.probe);
  final int port;
  final String group; // etiket grubu (renk ve tıklama eylemi)
  final String name; // etiket üstündeki ad
  final Probe probe;
}

const kPorts = <PortInfo>[
  PortInfo(80, 'web', 'HTTP', Probe.http),
  PortInfo(443, 'web', 'HTTPS', Probe.tls),
  PortInfo(8080, 'web', 'HTTP 8080', Probe.http),
  PortInfo(8443, 'web', 'HTTPS 8443', Probe.tls),
  PortInfo(22, 'ssh', 'SSH', Probe.banner),
  PortInfo(21, 'ftp', 'FTP', Probe.banner),
  PortInfo(3389, 'rdp', 'RDP', Probe.none),
  PortInfo(445, 'smb', 'SMB', Probe.none),
  PortInfo(5432, 'db', 'PostgreSQL', Probe.none),
  PortInfo(3306, 'db', 'MySQL', Probe.none),
  PortInfo(1433, 'db', 'SQL Server', Probe.none),
  PortInfo(9100, 'printer', 'JetDirect', Probe.none),
  PortInfo(631, 'printer', 'IPP', Probe.http),
  PortInfo(5900, 'vnc', 'VNC', Probe.banner),
  PortInfo(554, 'camera', 'RTSP', Probe.none),
];

/// Etiket grupları ve renkleri (masaüstü app.css .g-*)
const kGroups = ['web', 'ssh', 'ftp', 'rdp', 'smb', 'db', 'printer', 'vnc', 'camera'];
const kGroupColors = <String, Color>{
  'web': Color(0xFF22D3EE), 'ssh': Color(0xFF34D399), 'ftp': Color(0xFFFBBF24), 'rdp': Color(0xFF6366F1), 'smb': Color(0xFF3B82F6),
  'db': Color(0xFFA855F7), 'printer': Color(0xFF94A3B8), 'vnc': Color(0xFFEC4899), 'camera': Color(0xFFF97316),
};

PortInfo? portInfo(int port) {
  for (final p in kPorts) {
    if (p.port == port) return p;
  }
  return null;
}

List<int> allPorts() => [for (final p in kPorts) p.port];

/// Ayarlardaki kapalı portlar düşülmüş liste. Liste hiçbir koşulda genişlemez: tanınmayan portlar yok sayılır.
List<int> activePorts(Iterable<int>? disabled) {
  final off = {...?disabled};
  return [for (final p in kPorts) if (!off.contains(p.port)) p.port];
}

/// Kapalı port listesini temizler: yalnız listedeki portlar, tekrarsız, sıralı
List<int> sanitizeDisabled(Object? list) {
  final out = <int>{};
  if (list is List) {
    for (final v in list) {
      final n = v is num ? v.toInt() : int.tryParse(v.toString());
      if (n != null && portInfo(n) != null) out.add(n);
    }
  }
  return out.toList()..sort();
}
