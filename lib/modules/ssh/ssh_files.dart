// SSH Master "Dosyalar" paneli — masaüstü SSH Master'daki "Sunucu" dosya panelinin mobil karşılığı: aynı bağlantı bilgileriyle
// (host/port/kullanıcı/şifre/anahtar/parola/hostKey) SFTP gezgini. FTP Masters'ın FtpBrowserScreen'i yeniden kullanılır:
// SshConnection'dan protocol 'sftp' bir FtpSite türetilir, başlangıç klasörü terminalin izlediği "cd" dizinidir (lastDir).
// Telefonda ayrı sayfa, tablette terminalin sağında 360 px panel (ssh_terminal.dart).
import 'package:flutter/material.dart';

import '../../core/sync.dart';
import '../ftp/ftp_browser.dart';
import '../ftp/ftp_model.dart';
import 'ssh_model.dart';

const kSshFilesPanelWidth = 360.0;

/// SSH bağlantısından SFTP site kaydı (yalnız bellekte; FTP kitaplığına yazılmaz).
FtpSite sftpSiteFor(SshConnection c, {String startDir = ''}) => FtpSite(c.id, {
      ...FtpSite.blank(), 'name': c.name.isEmpty ? c.host : c.name, 'host': c.host, 'port': c.port, 'protocol': 'sftp', 'username': c.username,
      'authType': c.authType, 'password': c.password, 'passphrase': c.passphrase, 'privateKey': c.privateKey, 'hostKey': c.hostKey,
      'color': c.color, 'remoteDir': startDir, 'rememberLastDir': false, 'maxConcurrent': 2,
    });

class SshFilesPanel extends StatelessWidget {
  const SshFilesPanel({super.key, required this.conn, this.engine, this.startDir = '', required this.onHostKey, this.onCdHere, this.onClose,
      this.embedded = false, this.fsFactory});
  final SshConnection conn;
  final SyncEngine? engine;
  /// Gezginin açılacağı klasör (boşsa sunucudaki ev dizini).
  final String startDir;
  final ValueChanged<String> onHostKey;
  /// "Terminalde bu klasöre git" — terminal yokken (kitaplıktan açılış) null bırakılır, menüde çıkmaz.
  final ValueChanged<String>? onCdHere;
  final VoidCallback? onClose;
  final bool embedded;
  final RemoteFsFactory? fsFactory;

  @override
  Widget build(BuildContext context) => FtpBrowserScreen(
        site: sftpSiteFor(conn, startDir: startDir), engine: engine, onLastDir: (_) {}, onHostKey: onHostKey,
        fsFactory: fsFactory, embedded: embedded, onClose: onClose, onCdHere: onCdHere,
      );
}
