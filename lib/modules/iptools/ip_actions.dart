// Servis etiketine dokununca ne olacağı (masaüstü iptools/src/actions.js'in mobil uyarlaması; saf karar işlevi).
//   web, printer → tarayıcıda http(s)://ip[:port]
//   ssh          → "SSH Master'da aç": şimdilik adres panoya kopyalanır (bu modülün bağlantı formuna derin bağlantı sonra)
//   rdp, smb, ftp, db, vnc, camera → adresi panoya kopyala (mobilde mstsc / Gezgin yok)
import 'ip_ports.dart';

enum ActionKind { open, copy }

class HostAction {
  const HostAction(this.kind, this.target, this.text);
  final ActionKind kind;
  final String target, text;
}

HostAction actionFor(String group, String ip, int port) {
  final p = port;
  switch (group) {
    case 'web':
      final scheme = portInfo(p)?.probe == Probe.tls ? 'https' : 'http';
      final std = (scheme == 'http' && p == 80) || (scheme == 'https' && p == 443);
      final url = '$scheme://$ip${std ? '' : ':$p'}/';
      return HostAction(ActionKind.open, url, url);
    case 'printer':
      return HostAction(ActionKind.open, 'http://$ip/', 'http://$ip/');
    case 'rdp':
      return HostAction(ActionKind.copy, ip, ip);
    case 'smb':
      return HostAction(ActionKind.copy, 'smb://$ip/', 'smb://$ip/');
    case 'ssh':
      return HostAction(ActionKind.copy, p != 22 ? 'ssh -p $p $ip' : 'ssh $ip', ip);
    case 'ftp':
      return HostAction(ActionKind.copy, 'ftp://$ip${p != 21 ? ':$p' : ''}/', 'ftp://$ip/');
    case 'camera':
      return HostAction(ActionKind.copy, 'rtsp://$ip${p != 554 ? ':$p' : ''}/', 'rtsp://$ip/');
    case 'vnc':
      return HostAction(ActionKind.copy, '$ip${p != 5900 ? ':${p - 5900}' : ''}', ip);
    case 'db':
      return HostAction(ActionKind.copy, '$ip:$p', '$ip:$p');
    default:
      return HostAction(ActionKind.copy, ip, ip);
  }
}
