// Modüller arası derin bağlantılar — modüller birbirini doğrudan içe almaz; sağlayan modül açılışta buraya kayıt yazar,
// kullanan modül kayıt varsa çağırır, yoksa kendi eski davranışına düşer (örn. IP Tools → SSH Master "SSH Master'da aç").
import 'package:flutter/widgets.dart';

/// SSH bağlantı formunu host/port önceden dolu açar; kaydedilince SSH kitaplığına yazar, "Kaydet ve bağlan" ile terminali açar.
typedef OpenSshFor = Future<void> Function(BuildContext context, {required String host, int port});

class CrossLinks {
  CrossLinks._();
  /// SSH Master modülü tarafından kaydedilir (SshModule.registerCrossLinks); modül yoksa null.
  static OpenSshFor? openSsh;
}
