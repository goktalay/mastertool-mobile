// ignore: unused_import
import 'package:intl/intl.dart' as intl;

import 'mt_strings.dart';

// ignore_for_file: type=lint

/// The translations for Spanish Castilian (`es`).
class MtStringsEs extends MtStrings {
  MtStringsEs([String locale = 'es']) : super(locale);

  @override
  String get setGeneral => 'General';

  @override
  String get setAccount => 'Cuenta';

  @override
  String get setAbout => 'Acerca de';

  @override
  String aboutVersion(String version) {
    return 'Versión $version';
  }

  @override
  String get aboutFamily =>
      'Parte de la familia Mastertool: SSH Master · FTP Masters · SQL Master · Notepad Master · Convert Master · IP Tools';

  @override
  String get aboutCheckUpdate => 'Buscar actualizaciones';

  @override
  String get aboutChecking => 'Comprobando…';

  @override
  String aboutUpToDate(String app) {
    return '$app está actualizado.';
  }

  @override
  String aboutCheckFailed(String msg) {
    return 'No se pudieron buscar actualizaciones: $msg';
  }

  @override
  String get aboutLicenses => 'Licencias de código abierto';

  @override
  String aboutLicensesIntro(String app) {
    return '$app utiliza los siguientes componentes de código abierto:';
  }

  @override
  String authErrAppDisabled(String app) {
    return 'Un administrador ha desactivado $app para esta cuenta. Contacta con el administrador de tu cuenta.';
  }

  @override
  String authErrWrongApp(String app) {
    return 'Esta sesión pertenece a otra aplicación. Vuelve a iniciar sesión en $app.';
  }

  @override
  String get authSignedOut =>
      'Se cerró la sesión en una aplicación Mastertool de este equipo. Vuelve a iniciar sesión.';

  @override
  String get authSubtitle => 'Inicia sesión con tu cuenta';

  @override
  String get authEmail => 'Correo electrónico';

  @override
  String get authPassword => 'Contraseña';

  @override
  String get authRemember => 'Recordarme';

  @override
  String get authForgot => 'Olvidé mi contraseña';

  @override
  String get authNoAccount => '¿No tienes cuenta?';

  @override
  String get authRegister => 'Crear cuenta';

  @override
  String get authSubmit => 'Iniciar sesión';

  @override
  String get authWorking => 'Iniciando sesión…';

  @override
  String get authErrRequired => 'Se requieren el correo y la contraseña.';

  @override
  String get authErrBadCredentials => 'Correo o contraseña incorrectos.';

  @override
  String get authErrUnverified =>
      'Tu correo aún no está verificado. Haz clic en el enlace de tu bandeja de entrada.';

  @override
  String get authErrSuspended => 'Tu cuenta está suspendida.';

  @override
  String get authErrRateLimited =>
      'Demasiados intentos. Vuelve a intentarlo en un minuto.';

  @override
  String get authErrOffline =>
      'No se puede acceder al servidor. Comprueba tu conexión a Internet.';

  @override
  String get authErrSessionExpired =>
      'Tu sesión caducó o tu contraseña cambió. Vuelve a iniciar sesión.';

  @override
  String authErrServer(String msg) {
    return 'No se pudo iniciar sesión: $msg';
  }

  @override
  String get acctSection => 'Cuenta y sincronización';

  @override
  String acctSignedInAs(String email) {
    return 'Sesión iniciada como $email';
  }

  @override
  String get acctSyncToggle => 'Sincronizar conexiones con la web';

  @override
  String get acctSyncHint =>
      'Las conexiones, carpetas y atajos se guardan en tu cuenta con cifrado de extremo a extremo; el servidor no puede leerlos. Los ajustes del dispositivo, como el tamaño de fuente o la bandeja, no se envían.';

  @override
  String acctLastSync(String time) {
    return 'Última sincronización: $time';
  }

  @override
  String get acctNever => 'Aún no sincronizado';

  @override
  String get acctSyncNow => 'Sincronizar ahora';

  @override
  String get acctDeleteRemote => 'Eliminar la copia del servidor';

  @override
  String get acctDeleteRemoteMsg =>
      'Se eliminará la copia cifrada de la biblioteca de tu cuenta y se desactivará la sincronización. Las conexiones de este equipo no se eliminan.';

  @override
  String get acctDeleteRemoteDone =>
      'Copia del servidor eliminada; sincronización desactivada';

  @override
  String get acctLogout => 'Cerrar sesión';

  @override
  String get acctLogoutMsg =>
      'Se cerrará la sesión. Las conexiones y proyectos de este dispositivo se conservan.';

  @override
  String get acctMyAccount => 'Mi cuenta (web)';

  @override
  String get acctBackupNotice =>
      'Has iniciado sesión con otra cuenta; se hizo una copia de seguridad de las conexiones anteriores de este equipo.';

  @override
  String get syncOff => 'Sincronización desactivada';

  @override
  String get syncSyncing => 'Sincronizando…';

  @override
  String get syncOffline =>
      'Sin conexión — los cambios se enviarán al recuperar la conexión';

  @override
  String get syncErrDecrypt =>
      'No se pudo descifrar la copia del servidor con la clave de esta cuenta; se conservan las conexiones de este equipo.';

  @override
  String get syncErrTooLarge =>
      'La biblioteca supera el límite de 5 MB y no se pudo sincronizar.';

  @override
  String syncError(String msg) {
    return 'Error de sincronización: $msg';
  }

  @override
  String get commonCancel => 'Cancelar';

  @override
  String get commonSave => 'Guardar';

  @override
  String get commonCreate => 'Crear';

  @override
  String get commonOk => 'Aceptar';

  @override
  String get commonDelete => 'Eliminar';

  @override
  String get commonGiveUp => 'Cancelar';

  @override
  String get commonOpen => 'Abrir';

  @override
  String get commonEdit => 'Editar';

  @override
  String get commonRename => 'Cambiar nombre';

  @override
  String get commonRefresh => 'Actualizar';

  @override
  String get commonNewFolder => 'Nueva carpeta';

  @override
  String get commonCopyPath => 'Copiar ruta';

  @override
  String get commonMove => 'Mover';

  @override
  String get commonMoveEllipsis => 'Mover…';

  @override
  String get commonShow => 'Mostrar';

  @override
  String get commonChoose => 'Examinar…';

  @override
  String get commonConnect => 'Conectar';

  @override
  String get commonNew => 'Nuevo';

  @override
  String get commonCopy => 'Copiar';

  @override
  String get commonPaste => 'Pegar';

  @override
  String commonLocation(String path) {
    return 'Ubicación: $path';
  }

  @override
  String get commonNewName => 'Nuevo nombre';

  @override
  String get commonFolderName => 'Nombre de la carpeta';

  @override
  String get setTitle => 'Ajustes';

  @override
  String get setAppearance => 'Apariencia';

  @override
  String get setTheme => 'Tema';

  @override
  String get setThemeDark => 'Noche';

  @override
  String get setThemeLight => 'Día';

  @override
  String get setThemeSystem => 'Preferencia del sistema';

  @override
  String get setLanguage => 'Idioma';

  @override
  String get setLanguageHint => 'El idioma se aplica de inmediato.';

  @override
  String get setSaved => 'Ajustes guardados';

  @override
  String get mobModules => 'Módulos';

  @override
  String get mobDisabled => 'Desactivado en su cuenta';

  @override
  String get mobSoon => 'Este módulo está en preparación';

  @override
  String get mobOpen => 'Abrir';

  @override
  String get mobRefresh => 'Actualizar';

  @override
  String get mobSettings => 'Ajustes';

  @override
  String mobWelcome(String name) {
    return 'Bienvenido, $name';
  }

  @override
  String get mobNoModules =>
      'No se pudieron cargar los módulos. Compruebe la conexión y actualice.';

  @override
  String get mobSite => 'mastertool.download';

  @override
  String get mobLangSystem => 'Idioma del sistema';

  @override
  String get mobSsoHint =>
      'Basta con iniciar sesión una vez: SSH Master, FTP Masters, SQL Master, Notepad Master, Convert Master e IP Tools se abren dentro de esta aplicación.';

  @override
  String mobOpenCount(String open, String total) {
    return '$open/$total módulos activos';
  }

  @override
  String get mobModulesHint => 'Toque para abrir';

  @override
  String get mobTapToOpen => 'Listo para usar';

  @override
  String get mobVisitSite => 'Visitar el sitio web';
}
