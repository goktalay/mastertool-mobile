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

  @override
  String get smAppSearchPh => 'Buscar conexiones…  (Ctrl+F)';

  @override
  String get smAppNewConn => 'Nueva conexión';

  @override
  String smAppSplit(String n) {
    return 'Abrir dividido ($n)';
  }

  @override
  String get smAppSplitTitle =>
      'Abrir las conexiones seleccionadas divididas en una ventana';

  @override
  String get smAppSettings => 'Ajustes';

  @override
  String smAppStats(String c, String f) {
    return '$c conexiones · $f carpetas';
  }

  @override
  String get smAppWelcome => 'Bienvenido';

  @override
  String smAppResults(String q) {
    return 'Resultados de «$q»';
  }

  @override
  String get smAppAll => 'Todas las conexiones';

  @override
  String get smAppWelcomeHint =>
      'Crea tu primera conexión SSH.<br>Introduce los datos del servidor, pruébala y guárdala.';

  @override
  String get smAppFolders => 'Carpetas';

  @override
  String get smAppConnections => 'Conexiones';

  @override
  String get smAppMultiHint =>
      'Ctrl+clic para seleccionar varias y abrirlas divididas en una ventana';

  @override
  String get smAppNoMatch => 'No hay conexiones que coincidan.';

  @override
  String smAppFolderCount(String n) {
    return '$n conexiones';
  }

  @override
  String get smAppFolderOpenSplit => 'Abrir conexiones de la carpeta divididas';

  @override
  String get smAppNewConnHere => 'Nueva conexión en esta carpeta';

  @override
  String get smAppNewSubfolder => 'Crear subcarpeta';

  @override
  String get smAppKeyTag => 'Clave';

  @override
  String get smAppLastDir => 'Última carpeta';

  @override
  String get smAppLastDirTag => 'última carpeta';

  @override
  String smAppMultiOpenSplit(String n) {
    return 'Abrir $n conexiones divididas en una ventana';
  }

  @override
  String get smAppOpenSeparate => 'Abrir cada una en su propia ventana';

  @override
  String get smAppClearSelection => 'Borrar selección';

  @override
  String get smAppSideBySide => 'Abrir dos sesiones lado a lado';

  @override
  String get smAppDuplicate => 'Duplicar';

  @override
  String get smAppMoveToFolder => 'Mover a carpeta…';

  @override
  String get smAppResetLastDir => 'Restablecer última carpeta';

  @override
  String get smAppConnMoved => 'Conexión movida';

  @override
  String get smAppFolderIntoSelf =>
      'Una carpeta no puede moverse dentro de su propia subcarpeta';

  @override
  String get smAppFolderPh => 'p. ej. Servidores de producción';

  @override
  String get smAppRenameFolder => 'Cambiar nombre de la carpeta';

  @override
  String get smAppDeleteFolder => 'Eliminar carpeta';

  @override
  String smAppDeleteFolderMsg(String name) {
    return 'Se eliminará la carpeta <b>$name</b>.';
  }

  @override
  String smAppDeleteFolderConns(String n) {
    return ' Sus $n conexiones no se eliminan; suben un nivel.';
  }

  @override
  String get smAppRootFolder => 'Todas las conexiones (raíz)';

  @override
  String smAppMoveTitle(String name) {
    return 'Mover «$name»';
  }

  @override
  String get smAppTargetFolder => 'Carpeta de destino';

  @override
  String get smAppDeleteConn => 'Eliminar conexión';

  @override
  String smAppDeleteConnMsg(String name, String target) {
    return '<b>$name</b> ($target) se eliminará de forma permanente.';
  }

  @override
  String get smAppMaxPanes => 'Se pueden abrir como máximo 6 paneles';

  @override
  String get smAppMaxPanesSub => 'Se abrieron las 6 primeras conexiones';

  @override
  String get smFormTitleNew => 'Nueva conexión SSH';

  @override
  String get smFormTitleEdit => 'Editar conexión';

  @override
  String get smFormName => 'Nombre de la conexión';

  @override
  String get smFormNamePh => 'p. ej. Servidor web';

  @override
  String get smFormHost => 'Dirección IP / Host';

  @override
  String get smFormHostPh => '192.168.1.10 o servidor.com';

  @override
  String get smFormPort => 'Puerto';

  @override
  String get smFormUser => 'Usuario';

  @override
  String get smFormAuth => 'Autenticación';

  @override
  String get smFormPassword => 'Contraseña';

  @override
  String get smFormPrivateKey => 'Clave privada';

  @override
  String get smFormPwSaved => '•••••••• (guardada — escribe para cambiarla)';

  @override
  String get smFormKeyFile => 'Archivo de clave';

  @override
  String get smFormPassphrase => 'Frase de contraseña de la clave (si la hay)';

  @override
  String get smFormPassSaved => '•••••••• (guardada)';

  @override
  String get smFormPassEmpty => 'Déjalo vacío si no hay';

  @override
  String get smFormFolder => 'Carpeta';

  @override
  String get smFormColor => 'Color';

  @override
  String get smFormPalette => 'Paleta de colores de la consola';

  @override
  String get smFormLastDir => 'Ir a la última carpeta usada';

  @override
  String get smFormLastDirHint =>
      'Al conectar, el terminal y el gestor de archivos se abren en la última carpeta en la que trabajaste.';

  @override
  String get smFormLastDirNow => 'Actualmente:';

  @override
  String get smFormConnecting => 'Conectando…';

  @override
  String get smFormTestOk => 'Conexión correcta';

  @override
  String smFormHostKey(String fp) {
    return 'Clave de host (SHA256): $fp';
  }

  @override
  String get smFormTestFail => 'Error de conexión';

  @override
  String get smFormSaved => 'Conexión guardada';

  @override
  String get smFormChangesSaved => 'Cambios guardados';

  @override
  String get smFormTest => 'Probar conexión';

  @override
  String get smFormSaveConnect => 'Guardar y conectar';

  @override
  String get smPaneToggleSidebar => 'Mostrar/ocultar panel lateral (Ctrl+B)';

  @override
  String get smPaneDefaultName => 'Conexión';

  @override
  String get smPaneSplitRight => 'Dividir a la derecha';

  @override
  String get smPaneSplitDown => 'Dividir hacia abajo';

  @override
  String get smPaneReconnect => 'Reconectar';

  @override
  String get smPaneClose => 'Cerrar panel';

  @override
  String get smPaneSaveSelShortcut => 'Guardar selección como atajo';

  @override
  String get smPanePaletteMenu => 'Paleta de colores de la consola…';

  @override
  String get smPaneSelectAll => 'Seleccionar todo';

  @override
  String get smPaneClear => 'Limpiar pantalla';

  @override
  String get smPaneStatusConnecting => 'conectando…';

  @override
  String get smPaneStatusNoConn => 'sin conexión';

  @override
  String get smPaneStatusClosed => 'conexión cerrada';

  @override
  String get smTermConnecting => 'Conectando…';

  @override
  String get smTermConnectFailed => 'No se pudo conectar:';

  @override
  String get smTermRetryEnter => 'Pulsa Intro para reintentar.';

  @override
  String get smTermClosed => 'Conexión cerrada.';

  @override
  String get smTermReconnectEnter => 'Pulsa Intro para reconectar.';

  @override
  String smTermMaxPanes(String n) {
    return 'Se pueden abrir como máximo $n paneles en una ventana';
  }

  @override
  String smTermSessions(String n) {
    return '$n sesiones';
  }

  @override
  String get smTermToggleAll => 'Mostrar/ocultar todos los paneles laterales';

  @override
  String get smTermSplitRightTitle =>
      'Dividir el panel activo a la derecha (Ctrl+Shift+E)';

  @override
  String get smTermSplitDownTitle =>
      'Dividir el panel activo hacia abajo (Ctrl+Shift+O)';

  @override
  String get smTermSyncOn => 'Escribiendo en todos los paneles';

  @override
  String get smTermSyncOff => 'Escribir en todos los paneles';

  @override
  String get smTermSyncTitle =>
      'Lo que escribes se envía a todos los paneles conectados';

  @override
  String get smPickerSearch => 'Buscar conexión…';

  @override
  String get smPickerSameServer => 'mismo servidor';

  @override
  String get smPickerNone => 'No hay conexiones que coincidan';

  @override
  String get smPickerTitleRight => 'Dividir a la derecha — elige una conexión';

  @override
  String get smPickerTitleDown => 'Dividir hacia abajo — elige una conexión';

  @override
  String get smPaletteTitle => 'Paleta de colores de la consola';

  @override
  String smPaletteHint(String name) {
    return 'La paleta elegida se previsualiza al instante en este panel. Si la guardas, la usarán todas las sesiones de esta conexión ($name).';
  }

  @override
  String get smPaletteSaved => 'Paleta de colores guardada';

  @override
  String get smScTitleNew => 'Nuevo atajo';

  @override
  String get smScTitleEdit => 'Editar atajo';

  @override
  String get smScName => 'Nombre del atajo';

  @override
  String get smScNamePh => 'p. ej. Reiniciar Nginx';

  @override
  String get smScCommand => 'Comando';

  @override
  String get smScEnter => 'Pulsar Intro después de pegar';

  @override
  String get smScEnterHint =>
      'Si está desactivado, el comando solo se escribe en el cursor y lo ejecutas tú.';

  @override
  String get smScEmpty =>
      'Aún no hay atajos.<br>Añade los comandos que usas a menudo con <b>+</b> y haz doble clic para pegarlos en el terminal.';

  @override
  String get smScItemTitle => 'Doble clic: pegar en el terminal de este panel';

  @override
  String get smScAutoEnter => 'Intro automático';

  @override
  String get smScPaste => 'Pegar en el terminal';

  @override
  String get smScPasteNoEnter => 'Pegar sin Intro';

  @override
  String get smScPasteRun => 'Pegar y ejecutar';

  @override
  String get smScCopy => 'Copiar al portapapeles';

  @override
  String get smScNew => 'Nuevo atajo';

  @override
  String get smSbShortcuts => 'Atajos';

  @override
  String get smSbAddShortcut => 'Añadir atajo';

  @override
  String get smSbServer => 'Servidor';

  @override
  String smSbServerHost(String host) {
    return 'Servidor · $host';
  }

  @override
  String get smSbFollow => 'Seguir la carpeta del terminal';

  @override
  String get smSbHome => 'Carpeta personal';

  @override
  String get smSbUp => 'Carpeta superior';

  @override
  String get smSbComputer => 'Este equipo';

  @override
  String get smSbPlaces => 'Unidades y ubicaciones';

  @override
  String get smSbResize => 'Arrastra para cambiar el ancho';

  @override
  String get smFmLoading => 'Cargando…';

  @override
  String smFmOpenFailed(String msg) {
    return 'No se pudo abrir: $msg';
  }

  @override
  String get smFmEmpty => 'La carpeta está vacía';

  @override
  String get smFmNoConn => 'Sin conexión.';

  @override
  String get smFmClosed => 'Conexión cerrada.';

  @override
  String get smFmWaiting => 'Esperando conexión…';

  @override
  String smFmDownloadTo(String path) {
    return 'Descargar → $path';
  }

  @override
  String smFmUploadTo(String path) {
    return 'Subir → $path';
  }

  @override
  String get smFmServer => 'servidor';

  @override
  String get smFmCdHere => 'Ir a esta carpeta en el terminal';

  @override
  String get smFmPastePath => 'Pegar ruta en el terminal';

  @override
  String smFmDeleteWhat(String what) {
    return 'Eliminar ($what)';
  }

  @override
  String smFmNItems(String n) {
    return '$n elementos';
  }

  @override
  String get smFmOpenDefault => 'Abrir con la aplicación predeterminada';

  @override
  String get smFmReveal => 'Mostrar en el Explorador';

  @override
  String get smFmOpenExplorer => 'Abrir en el Explorador';

  @override
  String get smFmFollowing =>
      'El gestor de archivos sigue la carpeta del terminal';

  @override
  String get smFmFollowOff => 'Seguimiento desactivado';

  @override
  String get smFmNewRemote => 'Nueva carpeta en el servidor';

  @override
  String get smFmDeleteTitle => 'Eliminar del servidor';

  @override
  String smFmAndMore(String n) {
    return ' y $n más';
  }

  @override
  String smFmDeleteMsg(String names) {
    return '$names se eliminará del servidor <b>de forma permanente</b>. Las carpetas se eliminan con su contenido.';
  }

  @override
  String get smPlaceDesktop => 'Escritorio';

  @override
  String get smPlaceDownloads => 'Descargas';

  @override
  String get smPlaceDocuments => 'Documentos';

  @override
  String get smPlaceHome => 'Carpeta de usuario';

  @override
  String smPlaceDrive(String d) {
    return 'Disco local ($d)';
  }

  @override
  String get smErrNoConn => 'Sin conexión';

  @override
  String get smErrConnectFirst => 'Conéctate primero al servidor';

  @override
  String get smErrMkdir => 'No se pudo crear la carpeta';

  @override
  String get smErrRename => 'No se pudo cambiar el nombre';

  @override
  String smErrDelete(String name) {
    return 'No se pudo eliminar: $name';
  }

  @override
  String get smTrPanelTitle => 'Transferencias';

  @override
  String get smTrClearDone => 'Borrar terminadas';

  @override
  String get smTrQueued => 'En cola';

  @override
  String get smTrScanning => 'Analizando archivos…';

  @override
  String smTrFileCount(String i, String n) {
    return '$i / $n archivos';
  }

  @override
  String smTrEta(String time) {
    return 'quedan ~$time';
  }

  @override
  String smTrDownloading(String name) {
    return 'Descargando: $name';
  }

  @override
  String smTrUploading(String name) {
    return 'Subiendo: $name';
  }

  @override
  String get smTrDone => 'Completado';

  @override
  String get smTrCancelled => 'Cancelado';

  @override
  String get smTrFailed => 'Fallido';

  @override
  String get smTrRemoveFromList => 'Quitar de la lista';

  @override
  String get smTrAlwaysBackground =>
      'A partir de ahora, mostrar siempre las transferencias grandes en segundo plano';

  @override
  String get smTrShowInBackground => 'Seguir en segundo plano';

  @override
  String get smTrDownloadDone => 'Descarga completada';

  @override
  String get smTrUploadDone => 'Subida completada';

  @override
  String smTrDownloadFailed(String name) {
    return 'Error al descargar: $name';
  }

  @override
  String smTrUploadFailed(String name) {
    return 'Error al subir: $name';
  }

  @override
  String get smTrCancelledToast => 'Transferencia cancelada';

  @override
  String smTimeHm(String h, String m) {
    return '$h h $m min';
  }

  @override
  String smTimeMs(String m, String s) {
    return '$m min $s s';
  }

  @override
  String smTimeS(String s) {
    return '$s s';
  }

  @override
  String get smMainErrAuth =>
      'Error de autenticación: usuario o contraseña incorrectos.';

  @override
  String get smMainErrRefused =>
      'Conexión rechazada: el puerto está cerrado o el servicio SSH no está en ejecución.';

  @override
  String get smMainErrTimeout =>
      'Tiempo agotado: no se pudo alcanzar el servidor.';

  @override
  String get smMainErrDns => 'No se pudo resolver el nombre del host (DNS).';

  @override
  String get smMainErrUnreach => 'El servidor no es accesible por la red.';

  @override
  String get smMainErrKeyFile => 'No se encontró el archivo de clave.';

  @override
  String smMainErrHostKey(String newFp, String oldFp) {
    return '¡La clave de host del servidor ha cambiado! Guardada: $oldFp, recibida: $newFp. Conexión rechazada por seguridad.';
  }

  @override
  String get smMainErrConnNotFound => 'Conexión no encontrada';

  @override
  String get smMainErrNoSession => 'No hay ninguna sesión SSH activa';

  @override
  String get smMainErrHostUser =>
      'Se requieren la dirección del servidor y el usuario.';

  @override
  String get smMainTrayShow => 'Mostrar SSH Master';

  @override
  String get smMainTrayQuick => 'Conexión rápida';

  @override
  String get smMainTrayNone => 'No hay conexiones guardadas';

  @override
  String get smMainTrayQuit => 'Salir';

  @override
  String get smMainBalloonTitle =>
      'SSH Master se está ejecutando en segundo plano';

  @override
  String get smMainBalloonBody =>
      'Haz clic en el icono de la bandeja para volver a abrirlo.';

  @override
  String get smMainPickKey => 'Elegir un archivo de clave privada';

  @override
  String get smMainCopySuffix => ' (copia)';

  @override
  String get smMainDefDisk => 'Uso del disco';

  @override
  String get smMainDefMem => 'Memoria';

  @override
  String get smMainDefTop => 'Procesos (top)';

  @override
  String get smAppNotesLabel => 'Notas';

  @override
  String get fmAppSearchPh => 'Buscar sitios…  (Ctrl+F)';

  @override
  String get fmAppNewConn => 'Nuevo sitio';

  @override
  String get fmAppSettings => 'Ajustes';

  @override
  String fmAppStats(String c, String f) {
    return '$c sitios · $f carpetas';
  }

  @override
  String get fmAppWelcome => 'Bienvenido';

  @override
  String fmAppResults(String q) {
    return 'Resultados de “$q”';
  }

  @override
  String get fmAppAll => 'Todos los sitios';

  @override
  String get fmAppWelcomeHint =>
      'Crea tu primer sitio FTP / SFTP.<br>Introduce los datos del servidor, prueba la conexión y guárdalo.';

  @override
  String get fmAppFolders => 'Carpetas';

  @override
  String get fmAppConnections => 'Sitios';

  @override
  String get fmAppDblHint => 'Haz doble clic en una tarjeta para conectar';

  @override
  String get fmAppNoMatch => 'No hay sitios que coincidan.';

  @override
  String fmAppFolderCount(String n) {
    return '$n sitios';
  }

  @override
  String get fmAppNewConnHere => 'Nuevo sitio en esta carpeta';

  @override
  String get fmAppNewSubfolder => 'Nueva subcarpeta';

  @override
  String get fmAppKeyTag => 'Clave';

  @override
  String get fmAppLastDir => 'Última carpeta';

  @override
  String get fmAppLastDirTag => 'última carpeta';

  @override
  String get fmAppDuplicate => 'Duplicar';

  @override
  String get fmAppMoveToFolder => 'Mover a carpeta…';

  @override
  String get fmAppResetLastDir => 'Restablecer última carpeta';

  @override
  String get fmAppConnMoved => 'Sitio movido';

  @override
  String get fmAppFolderIntoSelf =>
      'Una carpeta no puede moverse dentro de sí misma';

  @override
  String get fmAppFolderPh => 'p. ej. Clientes';

  @override
  String get fmAppRenameFolder => 'Cambiar nombre de la carpeta';

  @override
  String get fmAppDeleteFolder => 'Eliminar carpeta';

  @override
  String fmAppDeleteFolderMsg(String name) {
    return '¿Eliminar la carpeta <b>$name</b>?';
  }

  @override
  String fmAppDeleteFolderConns(String n) {
    return '<br>Sus $n sitios se moverán a la carpeta superior.';
  }

  @override
  String get fmAppRootFolder => 'Nivel superior (sin carpeta)';

  @override
  String fmAppMoveTitle(String name) {
    return 'Mover “$name”';
  }

  @override
  String get fmAppTargetFolder => 'Carpeta de destino';

  @override
  String get fmAppDeleteConn => 'Eliminar sitio';

  @override
  String fmAppDeleteConnMsg(String name, String target) {
    return '¿Eliminar el sitio <b>$name</b> ($target)?';
  }

  @override
  String get fmFormTitleNew => 'Nuevo sitio';

  @override
  String fmFormTitleEdit(String name) {
    return 'Propiedades del sitio: $name';
  }

  @override
  String get fmFormTabGeneral => 'General';

  @override
  String get fmFormTabActions => 'Acciones';

  @override
  String get fmFormTabType => 'Tipo';

  @override
  String get fmFormTabOptions => 'Opciones';

  @override
  String get fmFormName => 'Etiqueta';

  @override
  String get fmFormNamePh => 'p. ej. Web de la empresa';

  @override
  String get fmFormHost => 'Dirección del host';

  @override
  String get fmFormHostPh => 'ftp.ejemplo.com o 192.168.1.10';

  @override
  String get fmFormPort => 'Puerto';

  @override
  String get fmFormUser => 'Usuario';

  @override
  String get fmFormPassword => 'Contraseña';

  @override
  String get fmFormPwSaved => '•••••••• (guardada, escribe para cambiarla)';

  @override
  String get fmFormLoginMethod => 'Método de inicio de sesión';

  @override
  String get fmFormLoginNormal => 'Normal';

  @override
  String get fmFormLoginAnon => 'Anónimo';

  @override
  String get fmFormAuth => 'Autenticación SFTP';

  @override
  String get fmFormPrivateKey => 'Clave privada';

  @override
  String get fmFormKeyFile => 'Archivo de clave privada';

  @override
  String get fmFormPassphrase => 'Frase de contraseña de la clave';

  @override
  String get fmFormPassSaved => '(guardada)';

  @override
  String get fmFormPassEmpty => 'Déjalo vacío si no hay';

  @override
  String get fmFormFolder => 'Carpeta';

  @override
  String get fmFormColor => 'Color';

  @override
  String get fmFormComments => 'Comentarios';

  @override
  String get fmFormRemoteDir => 'Al conectar, ir a esta carpeta remota';

  @override
  String get fmFormLocalDir => 'Al conectar, ir a esta carpeta local';

  @override
  String get fmFormLocalDirPh => 'p. ej. C:\\Proyectos\\sitio';

  @override
  String get fmFormLastDir => 'Ir a la última carpeta usada';

  @override
  String get fmFormLastDirHint =>
      'Si está activado, el sitio se abre en las carpetas del servidor y del equipo en las que trabajaste por última vez (en lugar de las carpetas anteriores).';

  @override
  String get fmFormLastDirNow => 'Actualmente:';

  @override
  String get fmFormCache => 'Caché de navegación';

  @override
  String get fmFormCacheSession => 'Usar caché durante la sesión';

  @override
  String get fmFormCacheAlways =>
      'Usar siempre la caché (mientras la aplicación esté abierta)';

  @override
  String get fmFormCacheNever =>
      'No usar nunca la caché (listar siempre de nuevo)';

  @override
  String get fmFormUploadCase =>
      'Al subir, aplicar esta regla a los nombres de archivos y carpetas';

  @override
  String get fmFormCasePreserve => 'Conservar mayúsculas y minúsculas';

  @override
  String get fmFormCaseLower => 'Minúsculas';

  @override
  String get fmFormCaseUpper => 'Mayúsculas';

  @override
  String get fmFormTest => 'Probar conexión';

  @override
  String get fmFormSaveConnect => 'Guardar y conectar';

  @override
  String get fmFormConnecting => 'Conectando…';

  @override
  String get fmFormTestOk => 'Conexión correcta';

  @override
  String get fmFormTestFail => 'No se pudo conectar';

  @override
  String fmFormHomeDir(String dir) {
    return 'Carpeta de inicio: $dir';
  }

  @override
  String get fmFormRemoteDirMissing =>
      'Aviso: no se pudo abrir la carpeta remota.';

  @override
  String fmFormHostKey(String fp) {
    return 'Clave de host SSH (SHA256): $fp';
  }

  @override
  String get fmFormSaved => 'Sitio guardado';

  @override
  String get fmFormChangesSaved => 'Cambios guardados';

  @override
  String get fmTypeProtocol => 'Protocolo';

  @override
  String get fmTypeFtp =>
      'FTP (protocolo de transferencia de archivos estándar)';

  @override
  String get fmTypeFtpsImplicit => 'FTP con TLS/SSL (implícito, puerto 990)';

  @override
  String get fmTypeFtpsSsl => 'FTP con SSL (AUTH SSL, explícito)';

  @override
  String get fmTypeFtpsTls => 'FTP con TLS/SSL (AUTH TLS, explícito)';

  @override
  String get fmTypeSftp => 'SFTP mediante SSH2 (Secure Shell)';

  @override
  String get fmTypeNoteFtp =>
      'Usa el protocolo FTP estándar para las conexiones de comandos y de datos, sin cifrar (texto plano).';

  @override
  String get fmTypeNoteFtpsImplicit =>
      'La conexión se cifra con TLS/SSL desde el principio (normalmente en el puerto 990). Los comandos y los datos están protegidos.';

  @override
  String get fmTypeNoteFtpsSsl =>
      'Se conecta con FTP sin cifrar y pasa a una sesión cifrada con AUTH SSL. Los comandos y los datos están protegidos.';

  @override
  String get fmTypeNoteFtpsTls =>
      'Se conecta con FTP sin cifrar y pasa a una sesión cifrada con AUTH TLS (el tipo de FTPS más común).';

  @override
  String get fmTypeNoteSftp =>
      'Transferencia de archivos cifrada mediante SSH (puerto 22). Inicia sesión con contraseña o clave privada; la clave de host se guarda en la primera conexión.';

  @override
  String get fmTypeTransferType => 'Tipo de transferencia';

  @override
  String get fmTypeBinary => 'Binario';

  @override
  String get fmTypeAscii => 'ASCII (texto)';

  @override
  String get fmTypeAuto => 'Automático (archivos de texto como ASCII)';

  @override
  String fmTypeUseGlobal(String v) {
    return 'Usar ajuste global ($v)';
  }

  @override
  String get fmTypeDataConn => 'Conexión de datos';

  @override
  String get fmTypePassive => 'Pasiva (PASV / EPSV)';

  @override
  String get fmTypeTimezone => 'Diferencia horaria del servidor';

  @override
  String get fmTypeTzNone => 'Sin diferencia';

  @override
  String get fmTypeTzHours => 'horas';

  @override
  String get fmTypeTimezoneHint =>
      'Las horas de los archivos que muestra el servidor se desplazan esta cantidad.';

  @override
  String get fmOptSiteOptions => 'Opciones específicas del sitio';

  @override
  String get fmOptUseGlobal =>
      'Usar los ajustes globales para todas las opciones';

  @override
  String get fmOptCustom => 'Usar ajustes específicos de este sitio';

  @override
  String get fmOptRetry => 'Número de reintentos';

  @override
  String get fmOptRetryDelay => 'Espera entre reintentos (s)';

  @override
  String get fmOptMaxConcurrent => 'Máx. transferencias simultáneas';

  @override
  String get fmOptConflict => 'Si existe un archivo con el mismo nombre';

  @override
  String get fmOptConflictOverwrite => 'Sobrescribir';

  @override
  String get fmOptConflictRename =>
      'Cambiar nombre automáticamente (nombre (1).ext)';

  @override
  String get fmOptConflictSkip => 'Omitir';

  @override
  String get fmOptEncoding => 'Codificación de nombres de archivo';

  @override
  String get fmOptEncAuto => 'Automática';

  @override
  String get fmSiteLocal => 'Mi equipo';

  @override
  String get fmSiteRemote => 'Servidor';

  @override
  String get fmSiteTransfers => 'Transferencias';

  @override
  String get fmSiteToggleLocal => 'Mostrar/ocultar Mi equipo (Ctrl+B)';

  @override
  String get fmSiteToggleTransfers => 'Mostrar/ocultar Transferencias (Ctrl+J)';

  @override
  String get fmSiteReconnect => 'Reconectar';

  @override
  String get fmSitePlaces => 'Acceso rápido y unidades';

  @override
  String get fmSiteUp => 'Carpeta superior (Backspace)';

  @override
  String get fmSiteHome => 'Carpeta de inicio';

  @override
  String get fmSiteColName => 'Nombre';

  @override
  String get fmSiteColSize => 'Tamaño';

  @override
  String get fmSiteColDate => 'Modificado';

  @override
  String get fmSiteLoading => 'Cargando…';

  @override
  String get fmSiteEmptyDir => 'Esta carpeta está vacía';

  @override
  String get fmSiteDesktop => 'Escritorio';

  @override
  String get fmSiteDownloads => 'Descargas';

  @override
  String get fmSiteDocuments => 'Documentos';

  @override
  String get fmSiteHomeDir => 'Carpeta de usuario';

  @override
  String get fmSiteOpenExplorer => 'Abrir en el Explorador';

  @override
  String get fmSiteOpenFile => 'Abrir con la aplicación predeterminada';

  @override
  String get fmSiteShowExplorer => 'Mostrar en el Explorador';

  @override
  String get fmSiteUpload => 'Subir';

  @override
  String fmSiteUploadN(String n) {
    return 'Subir $n elementos';
  }

  @override
  String fmSiteUploadTo(String dir) {
    return 'Destino: $dir';
  }

  @override
  String get fmSiteDownload => 'Descargar';

  @override
  String fmSiteDownloadN(String n) {
    return 'Descargar $n elementos';
  }

  @override
  String fmSiteDownloadTo(String dir) {
    return 'Destino: $dir';
  }

  @override
  String get fmSiteTrash => 'Mover a la Papelera de reciclaje';

  @override
  String get fmSiteTrashOk => 'Mover';

  @override
  String fmSiteTrashOne(String name) {
    return '¿Mover <b>$name</b> a la Papelera de reciclaje?';
  }

  @override
  String fmSiteTrashMany(String n) {
    return '¿Mover $n elementos a la Papelera de reciclaje?';
  }

  @override
  String get fmSiteMkdirFail => 'No se pudo crear la carpeta';

  @override
  String get fmSiteRenameFail => 'No se pudo cambiar el nombre';

  @override
  String get fmSiteDeleteFail => 'No se pudo eliminar';

  @override
  String get fmSiteDeleteTitle => 'Eliminar del servidor';

  @override
  String fmSiteDelOne(String name) {
    return '¿Eliminar de forma permanente el archivo <b>$name</b> del servidor?';
  }

  @override
  String fmSiteDelDirOne(String name) {
    return '¿Eliminar de forma permanente la carpeta <b>$name</b> y todo su contenido del servidor?';
  }

  @override
  String fmSiteDelMany(String n) {
    return '¿Eliminar de forma permanente $n elementos (las carpetas con todo su contenido) del servidor?';
  }

  @override
  String get fmSiteDeleting => 'Eliminando…';

  @override
  String get fmSiteDeleted => 'Eliminado';

  @override
  String fmSiteItems(String n) {
    return '$n elementos';
  }

  @override
  String get fmSiteOffline => 'Sin conexión';

  @override
  String fmSiteLimit(String v) {
    return 'Límite de velocidad: $v';
  }

  @override
  String get fmSiteNoLimit => 'Sin límite de velocidad';

  @override
  String get fmSiteLimitTitle => 'Establecer límite de velocidad';

  @override
  String fmSiteConnectFail(String msg) {
    return 'No se pudo conectar al servidor: $msg';
  }

  @override
  String get fmSiteConnectFailTitle => 'Error de conexión';

  @override
  String get fmSiteStateConnected => 'Conectado';

  @override
  String get fmSiteStateConnecting => 'Conectando…';

  @override
  String get fmSiteStateDisconnected => 'Desconectado';

  @override
  String get fmTrColName => 'Nombre';

  @override
  String get fmTrColSize => 'Tamaño';

  @override
  String get fmTrColProgress => 'Progreso';

  @override
  String get fmTrColStatus => 'Estado';

  @override
  String get fmTrEmpty =>
      'Aún no hay transferencias.\nHaz clic derecho en un archivo o carpeta y elige Descargar / Subir, o arrastra entre los paneles.';

  @override
  String get fmTrQueued => 'En cola';

  @override
  String get fmTrActive => 'Transfiriendo';

  @override
  String get fmTrDone => 'Completado';

  @override
  String fmTrDoneFiles(String n) {
    return '$n archivos completados';
  }

  @override
  String get fmTrError => 'Error';

  @override
  String get fmTrCancelled => 'Cancelado';

  @override
  String get fmTrSkipped => 'Omitido (ya existe)';

  @override
  String fmTrScanning(String n) {
    return 'Analizando… $n archivos';
  }

  @override
  String get fmTrRetrying => 'Se reintentará…';

  @override
  String get fmTrCancel => 'Cancelar';

  @override
  String get fmTrCancelDir => 'Cancelar transferencia de carpeta';

  @override
  String get fmTrCancelAll => 'Cancelar todas las transferencias';

  @override
  String get fmTrCancelAllMsg =>
      '¿Cancelar todas las transferencias en curso y en cola?';

  @override
  String get fmTrCancelAllOk => 'Cancelar todas';

  @override
  String get fmTrRetry => 'Reintentar';

  @override
  String get fmTrShowLocal => 'Mostrar en el Explorador';

  @override
  String get fmTrShowRemote => 'Mostrar en el servidor';

  @override
  String get fmTrCopyError => 'Copiar mensaje de error';

  @override
  String get fmTrRemove => 'Quitar de la lista';

  @override
  String get fmTrRemoveRoot => 'Quitar esta transferencia de la lista';

  @override
  String get fmTrClearDone => 'Borrar terminadas';

  @override
  String fmTrActiveN(String n) {
    return '$n transferencias en curso';
  }

  @override
  String get fmTrDownloadDone => 'Descarga completada';

  @override
  String get fmTrUploadDone => 'Subida completada';

  @override
  String fmTrDownloadFailed(String name) {
    return 'Descarga incompleta: $name';
  }

  @override
  String fmTrUploadFailed(String name) {
    return 'Subida incompleta: $name';
  }

  @override
  String fmTrFailedFiles(String n) {
    return '$n archivos con error';
  }

  @override
  String get fmMainErrAuth =>
      'Error de inicio de sesión: usuario o contraseña incorrectos.';

  @override
  String get fmMainErrRefused =>
      'Conexión rechazada: el puerto está cerrado o el servidor no está en ejecución.';

  @override
  String get fmMainErrTimeout =>
      'Tiempo agotado: no se pudo alcanzar el servidor.';

  @override
  String get fmMainErrDns => 'No se pudo resolver el nombre del host (DNS).';

  @override
  String get fmMainErrUnreach => 'El servidor no es accesible por la red.';

  @override
  String get fmMainErrReset => 'El servidor cerró la conexión.';

  @override
  String get fmMainErrNotFound => 'No se encontró el archivo o la carpeta.';

  @override
  String get fmMainErrPerm => 'Permiso denegado.';

  @override
  String fmMainErr550(String msg) {
    return 'El servidor rechazó la operación (550): $msg';
  }

  @override
  String get fmMainErr553 =>
      'El servidor no aceptó el nombre de archivo (553).';

  @override
  String fmMainErrTls(String msg) {
    return 'Error de TLS/SSL — comprueba el protocolo o el puerto. ($msg)';
  }

  @override
  String fmMainErrHostKey(String newVal, String oldVal) {
    return '¡La clave de host del servidor ha cambiado! Guardada: $oldVal, recibida: $newVal. Conexión rechazada por seguridad.';
  }

  @override
  String get fmMainErrConnNotFound => 'Sitio no encontrado';

  @override
  String get fmMainErrNoSession => 'No hay conexión con el servidor';

  @override
  String get fmMainErrHost => 'La dirección del host es obligatoria.';

  @override
  String get fmMainErrUser =>
      'El usuario es obligatorio (o elige el inicio de sesión anónimo).';

  @override
  String get fmMainPickKey => 'Elegir un archivo de clave privada';

  @override
  String get fmMainCopySuffix => ' (copia)';

  @override
  String get fmMainCloseActive =>
      'Todavía hay transferencias en curso. Se cancelarán si cierras esta ventana.';

  @override
  String get fmMainCloseAnyway => 'Cerrar de todos modos';

  @override
  String get sqAppSearchPh => 'Buscar conexiones…  (Ctrl+F)';

  @override
  String get sqAppNewConn => 'Añadir conexión';

  @override
  String get sqAppAddConn => 'Añadir conexión';

  @override
  String get sqAppSettings => 'Ajustes';

  @override
  String sqAppStats(String c, String f) {
    return '$c conexiones · $f carpetas';
  }

  @override
  String get sqAppWelcome => 'Bienvenido';

  @override
  String sqAppResults(String q) {
    return 'Resultados para «$q»';
  }

  @override
  String get sqAppAll => 'Todas las conexiones';

  @override
  String get sqAppWelcomeHint =>
      'Conéctate a PostgreSQL, SQL Server, MySQL, SQLite o a archivos CSV/Parquet/Excel.<br>Introduce los datos, prueba la conexión y guárdala.';

  @override
  String get sqAppFolders => 'Carpetas';

  @override
  String get sqAppConnections => 'Conexiones';

  @override
  String get sqAppDblHint => 'Doble clic en una tarjeta para abrirla';

  @override
  String get sqAppNoMatch => 'No hay conexiones que coincidan.';

  @override
  String sqAppFolderCount(String n) {
    return '$n conexiones';
  }

  @override
  String get sqAppNewConnHere => 'Nueva conexión en esta carpeta';

  @override
  String get sqAppNewSubfolder => 'Nueva subcarpeta';

  @override
  String get sqAppDuplicate => 'Duplicar';

  @override
  String get sqAppMoveToFolder => 'Mover a carpeta…';

  @override
  String get sqAppConnMoved => 'Conexión movida';

  @override
  String get sqAppFolderIntoSelf =>
      'Una carpeta no se puede mover dentro de sí misma';

  @override
  String get sqAppFolderPh => 'p. ej. Clientes';

  @override
  String get sqAppRenameFolder => 'Cambiar nombre de la carpeta';

  @override
  String get sqAppDeleteFolder => 'Eliminar carpeta';

  @override
  String sqAppDeleteFolderMsg(String name) {
    return '¿Eliminar la carpeta <b>$name</b>?';
  }

  @override
  String sqAppDeleteFolderConns(String n) {
    return '<br>Sus $n conexiones se moverán a la carpeta superior.';
  }

  @override
  String get sqAppRootFolder => 'Nivel superior (sin carpeta)';

  @override
  String sqAppMoveTitle(String name) {
    return 'Mover «$name»';
  }

  @override
  String get sqAppTargetFolder => 'Carpeta de destino';

  @override
  String get sqAppDeleteConn => 'Eliminar conexión';

  @override
  String sqAppDeleteConnMsg(String name, String target) {
    return '¿Eliminar la conexión <b>$name</b> ($target)? También se elimina su contraseña guardada.';
  }

  @override
  String get sqAppReadOnlyTag => 'Solo lectura';

  @override
  String get sqAppWriteTag => 'Escritura';

  @override
  String get sqFormTitleNew => 'Nueva conexión';

  @override
  String sqFormTitleEdit(String name) {
    return 'Conexión: $name';
  }

  @override
  String get sqFormTabGeneral => 'General';

  @override
  String get sqFormTabSecurity => 'Seguridad';

  @override
  String get sqFormTabSsh => 'Túnel SSH';

  @override
  String get sqFormName => 'Etiqueta (nombre visible)';

  @override
  String get sqFormNamePh => 'p. ej. Base de datos de producción';

  @override
  String get sqFormHost => 'Host';

  @override
  String get sqFormPort => 'Puerto';

  @override
  String get sqFormUser => 'Usuario';

  @override
  String get sqFormPassword => 'Contraseña';

  @override
  String get sqFormPwSaved => '•••••••• (guardada, escribe para cambiarla)';

  @override
  String get sqFormDatabase => 'Base de datos';

  @override
  String get sqFormDatabasePh =>
      'Déjalo vacío para usar la base de datos predeterminada';

  @override
  String get sqFormFile => 'Archivo de base de datos';

  @override
  String get sqFormFilePh => 'C:\\Data\\app.db';

  @override
  String get sqFormSqliteHint =>
      'Archivo de base de datos SQLite (.db, .sqlite). En modo de solo lectura el archivo nunca se modifica.';

  @override
  String get sqFormDuckdbHint =>
      'Elige un archivo .duckdb o déjalo vacío (en memoria). Consulta archivos CSV, Parquet, JSON y Excel directamente: SELECT * FROM \'C:\\data\\sales.csv\'';

  @override
  String get sqFormInMemory => 'En memoria';

  @override
  String get sqFormFolder => 'Carpeta';

  @override
  String get sqFormColor => 'Color';

  @override
  String get sqFormComments => 'Notas';

  @override
  String get sqFormReadOnly => 'Modo de solo lectura';

  @override
  String get sqFormReadOnlyHint =>
      'Recomendado. INSERT/UPDATE/DELETE y DDL se bloquean antes de ejecutarse; puedes aprobarlos una vez. Donde se admite, la propia sesión también es de solo lectura.';

  @override
  String get sqFormSavePassword => 'Guardar contraseña';

  @override
  String get sqFormSavePasswordHint =>
      'La contraseña se guarda solo en el llavero del sistema (Windows: DPAPI). Si está desactivado, se pide en cada conexión.';

  @override
  String get sqFormSsl => 'TLS / SSL';

  @override
  String get sqFormSslPrefer => 'Preferir (cifrado si el servidor lo admite)';

  @override
  String get sqFormSslRequire => 'Exigir (sin verificar el certificado)';

  @override
  String get sqFormSslVerify => 'Exigir y verificar el certificado';

  @override
  String get sqFormSslDisable => 'Desactivado (sin cifrar)';

  @override
  String get sqFormSslHint =>
      'TLS se intenta de forma predeterminada; la ventana de conexión avisa si el servidor no lo admite.';

  @override
  String get sqFormSshEnable => 'Conectar a través de un túnel SSH';

  @override
  String get sqFormSshHint =>
      'Primero se accede a un servidor SSH y desde allí a la base de datos. Se recomienda la autenticación con clave.';

  @override
  String get sqFormSshHost => 'Servidor SSH';

  @override
  String get sqFormSshAuth => 'Autenticación SSH';

  @override
  String get sqFormSshKey => 'Clave privada';

  @override
  String get sqFormSshAgent => 'Agente (Pageant)';

  @override
  String get sqFormKeyFile => 'Archivo de clave privada';

  @override
  String get sqFormPassphrase => 'Frase de contraseña de la clave';

  @override
  String get sqFormPassSaved => '(guardada)';

  @override
  String get sqFormPassEmpty => 'Déjalo vacío si no tiene';

  @override
  String get sqFormSshPassword => 'Contraseña SSH';

  @override
  String sqFormHostKey(String fp) {
    return 'Clave de host SSH: $fp';
  }

  @override
  String get sqFormTest => 'Probar conexión';

  @override
  String get sqFormSaveConnect => 'Guardar y abrir';

  @override
  String get sqFormConnecting => 'Conectando…';

  @override
  String get sqFormTestOk => 'Conexión correcta';

  @override
  String get sqFormTestFail => 'No se pudo conectar';

  @override
  String sqFormTestDb(String db, String user) {
    return 'Base de datos: $db · Usuario: $user';
  }

  @override
  String get sqFormNoTls =>
      'Aviso: la conexión no está cifrada (el servidor no admite TLS).';

  @override
  String get sqFormSaved => 'Conexión guardada';

  @override
  String get sqFormChangesSaved => 'Cambios guardados';

  @override
  String get sqCwObjects => 'Objetos';

  @override
  String get sqCwCollapseAll => 'Contraer todo';

  @override
  String get sqCwFilterPh => 'Filtrar objetos cargados…';

  @override
  String get sqCwEmpty => '(vacío)';

  @override
  String get sqCwOpenData => 'Abrir datos';

  @override
  String get sqCwShowDdl => 'Mostrar DDL';

  @override
  String get sqCwOpenCode => 'Abrir código';

  @override
  String get sqCwSelectSql => 'Generar SELECT';

  @override
  String get sqCwAddToBuilder => 'Añadir al generador de consultas';

  @override
  String get sqCwNewSqlHere => 'Nuevo SQL aquí';

  @override
  String get sqCwCopyName => 'Copiar nombre';

  @override
  String get sqCwCopied => 'Copiado al portapapeles';

  @override
  String get sqCwNewSql => 'Nuevo SQL';

  @override
  String get sqCwBuilder => 'Generador de consultas';

  @override
  String get sqCwReconnect => 'Reconectar';

  @override
  String get sqCwReadOnly => 'Solo lectura';

  @override
  String get sqCwReadWrite => 'Escritura activada';

  @override
  String get sqCwReadOnlyTip =>
      'Solo lectura: DML/DDL requiere aprobación. Haz clic para desactivarlo';

  @override
  String get sqCwReadWriteTip =>
      'Escritura activada: los comandos se ejecutan sin aprobación. Haz clic para volver a solo lectura';

  @override
  String get sqCwDisableRo => '¿Desactivar el modo de solo lectura?';

  @override
  String get sqCwDisableRoMsg =>
      'Hasta que se cierre esta ventana, INSERT/UPDATE/DELETE y DDL se ejecutarán sin preguntar.';

  @override
  String get sqCwDisableRoOk => 'Permitir escritura';

  @override
  String get sqCwRoOn => 'Modo de solo lectura activado';

  @override
  String get sqCwRoOff => 'Escritura permitida — ten cuidado';

  @override
  String get sqCwPasswordTitle => 'Se requiere contraseña';

  @override
  String sqCwPasswordFor(String host, String user) {
    return 'Contraseña para $user@$host';
  }

  @override
  String get sqCwNotConnected => 'Sin conexión';

  @override
  String get sqCwConnected => 'Conectado';

  @override
  String get sqCwConnecting => 'Conectando…';

  @override
  String get sqCwNoTls => 'Sin cifrar';

  @override
  String get sqCwConnectFailed => 'No se pudo conectar';

  @override
  String get sqCwRetry => 'Reintentar';

  @override
  String get sqCwResetCancel =>
      'La consulta no respondió a la cancelación; reconectando.';

  @override
  String get sqCwResetExit =>
      'Se perdió la conexión con la base de datos; reconectando.';

  @override
  String get sqCwEmptyWorkspace =>
      'Haz doble clic en una tabla del árbol o pulsa Ctrl+T para abrir una nueva pestaña SQL.';

  @override
  String get sqCwCloseTab => '¿Cerrar la pestaña?';

  @override
  String sqCwCloseTabMsg(String name) {
    return 'El SQL de «$name» no está guardado.';
  }

  @override
  String get sqCwCloseTabOk => 'Cerrar';

  @override
  String get sqTreeTables => 'Tablas';

  @override
  String get sqTreeViews => 'Vistas';

  @override
  String get sqTreeMatviews => 'Vistas materializadas';

  @override
  String get sqTreeForeignTables => 'Tablas externas';

  @override
  String get sqTreeFunctions => 'Funciones';

  @override
  String get sqTreeProcedures => 'Procedimientos';

  @override
  String get sqTreeTriggers => 'Triggers';

  @override
  String get sqTreeSequences => 'Secuencias';

  @override
  String get sqTreeTypes => 'Tipos';

  @override
  String get sqTreeColumns => 'Columnas';

  @override
  String get sqTreeIndexes => 'Índices';

  @override
  String get sqTreeConstraints => 'Restricciones';

  @override
  String get sqTreeFiles => 'Archivos';

  @override
  String get sqKindTable => 'Tabla';

  @override
  String get sqKindView => 'Vista';

  @override
  String get sqKindMatview => 'Vista materializada';

  @override
  String get sqKindForeignTable => 'Tabla externa';

  @override
  String get sqKindFunction => 'Función';

  @override
  String get sqKindProcedure => 'Procedimiento';

  @override
  String get sqKindTrigger => 'Trigger';

  @override
  String get sqKindSequence => 'Secuencia';

  @override
  String get sqKindType => 'Tipo';

  @override
  String get sqKindIndex => 'Índice';

  @override
  String get sqKindConstraint => 'Restricción';

  @override
  String get sqSqlRun => 'Ejecutar';

  @override
  String get sqSqlRunStatement => 'Ejecutar sentencia';

  @override
  String get sqSqlCancel => 'Cancelar';

  @override
  String get sqSqlDatabase => 'Base de datos';

  @override
  String get sqSqlHistory => 'Historial';

  @override
  String get sqSqlExport => 'Exportar';

  @override
  String get sqSqlRunning => 'Ejecutando…';

  @override
  String sqSqlDone(String ms) {
    return 'Listo · $ms ms';
  }

  @override
  String sqSqlDoneErrors(String ms, String n) {
    return '$n errores · $ms ms';
  }

  @override
  String get sqSqlDdlHint =>
      'El esquema cambió: usa Actualizar para recargar el árbol.';

  @override
  String get sqSqlPlaceholder =>
      'Escribe SQL… Ctrl+Enter: ejecutar selección/todo · Ctrl+Shift+Enter: sentencia en el cursor · Ctrl+Space: autocompletar';

  @override
  String sqSqlTabTitle(String n) {
    return 'SQL $n';
  }

  @override
  String get sqSqlHistoryEmpty => 'No hay historial para esta conexión.';

  @override
  String get sqSqlRowsShort => 'filas';

  @override
  String sqResResult(String n) {
    return 'Resultado $n';
  }

  @override
  String get sqResMessages => 'Mensajes';

  @override
  String sqResRows(String ms, String n) {
    return '$n filas · $ms ms';
  }

  @override
  String sqResRowsTruncated(String ms, String n) {
    return 'Mostrando las primeras $n filas (límite) · $ms ms';
  }

  @override
  String get sqResNoRows => 'Sin filas';

  @override
  String sqResAffected(String cmd, String ms, String n) {
    return '$cmd: $n filas afectadas · $ms ms';
  }

  @override
  String sqResCommand(String cmd, String ms) {
    return '$cmd · $ms ms';
  }

  @override
  String get sqResCancelled => 'Cancelado';

  @override
  String get sqGridCopy => 'Copiar';

  @override
  String get sqGridCopyHeaders => 'Copiar con encabezados';

  @override
  String get sqGridExport => 'Exportar este resultado…';

  @override
  String get sqDataColumns => 'Columnas';

  @override
  String sqDataColumnsHidden(String n, String total) {
    return 'Columnas ($n/$total)';
  }

  @override
  String get sqDataAddFilter => 'Filtrar';

  @override
  String get sqDataLimit => 'Número de filas';

  @override
  String sqDataFirstN(String n) {
    return 'Primeras $n';
  }

  @override
  String get sqDataAll => 'Todas (con límite)';

  @override
  String get sqDataOpenInEditor => 'Abrir en el editor SQL';

  @override
  String get sqDataClearFilters => 'Quitar filtros';

  @override
  String sqDataRows(String ms, String n) {
    return '$n filas · $ms ms';
  }

  @override
  String sqDataRowsMore(String ms, String n) {
    return 'Primeras $n filas · $ms ms';
  }

  @override
  String get sqDataError => 'No se pudieron cargar los datos';

  @override
  String get sqDataSortAsc => 'Orden ascendente';

  @override
  String get sqDataSortDesc => 'Orden descendente';

  @override
  String get sqDataSortClear => 'Quitar orden';

  @override
  String get sqDataFilterColumn => 'Filtrar por esta columna…';

  @override
  String get sqDataHideColumn => 'Ocultar columna';

  @override
  String get sqDataShowAll => 'Mostrar todas las columnas';

  @override
  String sqDataFilterEq(String v) {
    return 'Igual a «$v»';
  }

  @override
  String sqDataFilterNe(String v) {
    return 'Distinto de «$v»';
  }

  @override
  String get sqDataFilterNull => 'NULL / no NULL';

  @override
  String get sqDataColumn => 'Columna';

  @override
  String get sqDataOperator => 'Condición';

  @override
  String get sqDataValue => 'Valor';

  @override
  String get sqDataInHint =>
      'Para «en la lista», separa los valores con comas.';

  @override
  String get sqDataFilterTitle => 'Filtro';

  @override
  String get sqDataSelectAll => 'Todas';

  @override
  String get sqDataSelectNone => 'Ninguna';

  @override
  String get sqOpContains => 'contiene';

  @override
  String get sqOpStarts => 'empieza por';

  @override
  String get sqOpEnds => 'termina en';

  @override
  String get sqOpLike => 'LIKE';

  @override
  String get sqOpIn => 'en la lista';

  @override
  String get sqCodeExecute => 'Ejecutar';

  @override
  String get sqCodeLoading => 'Cargando…';

  @override
  String get sqCodeEmpty => 'No se encontró ninguna definición';

  @override
  String get sqQbAddTable => 'Añadir tabla';

  @override
  String get sqQbLimit => 'Límite';

  @override
  String get sqQbClear => 'Limpiar';

  @override
  String get sqQbHint =>
      'Arrastra tablas aquí desde el árbol o haz clic en «Añadir tabla». Arrastra una columna sobre la columna de otra tabla para crear un JOIN.';

  @override
  String get sqQbColumns => 'Columnas';

  @override
  String get sqQbConditions => 'Condiciones';

  @override
  String get sqQbResults => 'Resultados';

  @override
  String get sqQbGenerated => 'SQL generado';

  @override
  String get sqQbRegenerate => 'Regenerar desde el diagrama';

  @override
  String get sqQbOtherDb =>
      'El generador de consultas funciona con tablas de una sola base de datos.';

  @override
  String get sqQbDragJoin =>
      'Arrastra sobre la columna de otra tabla para hacer JOIN';

  @override
  String get sqQbSwapJoin => 'Invertir dirección';

  @override
  String get sqQbDeleteJoin => 'Eliminar JOIN';

  @override
  String get sqQbNoColumns =>
      'Marca las casillas de columna en las tablas (ninguna = SELECT *).';

  @override
  String get sqQbOutput => 'Mostrar';

  @override
  String get sqQbColumn => 'Columna';

  @override
  String get sqQbAlias => 'Alias';

  @override
  String get sqQbAggregate => 'Agregado';

  @override
  String get sqQbSort => 'Orden';

  @override
  String get sqQbAddCondition => 'Añadir condición';

  @override
  String sqQbTabTitle(String n) {
    return 'Consulta $n';
  }

  @override
  String get sqRoTitle => 'Modo de solo lectura';

  @override
  String get sqRoMessage =>
      'Esta conexión está en modo de solo lectura. Las siguientes sentencias pueden modificar datos o el esquema:';

  @override
  String get sqRoHint =>
      'Puedes permitirlas solo para esta ejecución; después se restablece el modo de solo lectura.';

  @override
  String get sqRoRunOnce => 'Ejecutar esta vez';

  @override
  String get sqRoNotRun => 'Modo de solo lectura: no se ejecutó';

  @override
  String sqRoBlockedMsg(String n) {
    return 'Modo de solo lectura: $n sentencias requieren aprobación.';
  }

  @override
  String get sqExpTitle => 'Exportar';

  @override
  String get sqExpHint =>
      'La consulta se vuelve a ejecutar sin límite de filas y los resultados se escriben directamente en el archivo.';

  @override
  String get sqExpRunning => 'Exportando…';

  @override
  String sqExpDone(String n) {
    return '$n filas exportadas';
  }

  @override
  String get sqExpFailed => 'Error al exportar';

  @override
  String get sqErrRefused =>
      'Conexión rechazada: el puerto está cerrado o el servidor no está en ejecución.';

  @override
  String get sqErrDns => 'No se pudo resolver el nombre de host (DNS).';

  @override
  String get sqErrTimeout =>
      'Tiempo de espera agotado: no se pudo acceder al servidor.';

  @override
  String get sqErrReset => 'El servidor cerró la conexión.';

  @override
  String get sqErrUnreach => 'El servidor no es accesible en la red.';

  @override
  String get sqErrSshAuth =>
      'Error de inicio de sesión SSH: usuario, clave o contraseña incorrectos.';

  @override
  String sqErrTls(String msg) {
    return 'Error de TLS/SSL — no se pudo verificar el certificado o el servidor no admite TLS. ($msg)';
  }

  @override
  String get sqErrHostExit =>
      'El proceso de la base de datos terminó inesperadamente.';

  @override
  String get sqErrUnknown => 'Error desconocido';

  @override
  String get sqMainCloseAnyway => 'Cerrar de todos modos';

  @override
  String get sqMainCloseRunning =>
      'Todavía hay consultas en ejecución. Se cancelarán si cierras esta ventana.';

  @override
  String get sqMainCopySuffix => ' (copia)';

  @override
  String get sqMainErrConnNotFound => 'Conexión no encontrada';

  @override
  String get sqMainErrNoSession => 'Esta ventana no tiene conexión';

  @override
  String sqMainErrKeyFile(String path) {
    return 'No se pudo leer el archivo de clave SSH: $path';
  }

  @override
  String get sqMainTrayShow => 'Mostrar SQL Master';

  @override
  String get sqMainTrayQuick => 'Conexión rápida';

  @override
  String get sqMainTrayNone => 'No hay conexiones guardadas';

  @override
  String get sqMainTrayQuit => 'Salir';

  @override
  String get npKindSsh => 'Proyecto SSH';

  @override
  String get npKindFtp => 'Proyecto FTP';

  @override
  String get npKindLocal => 'Carpeta local';

  @override
  String get npKindFile => 'Archivo de proyecto';

  @override
  String get npKindSshHint => 'Una carpeta del servidor por SSH (SFTP)';

  @override
  String get npKindFtpHint => 'Un servidor FTP, FTPS o SFTP';

  @override
  String get npKindLocalHint => 'Una carpeta de este equipo';

  @override
  String get npKindFileHint => 'Editar un solo archivo';

  @override
  String get npAppSearchPh => 'Buscar conexiones…  (Ctrl+F)';

  @override
  String get npAppNewConn => 'Nueva conexión';

  @override
  String get npAppSettings => 'Ajustes';

  @override
  String npAppStats(String c, String f) {
    return '$c conexiones · $f carpetas';
  }

  @override
  String get npAppWelcome => 'Bienvenido';

  @override
  String npAppResults(String q) {
    return 'Resultados de «$q»';
  }

  @override
  String get npAppAll => 'Todas las conexiones';

  @override
  String get npAppWelcomeHint =>
      'Añade un servidor SSH o FTP, una carpeta local o un solo archivo.<br>Haz doble clic en una tarjeta para abrir el proyecto en su propia ventana.';

  @override
  String get npAppFolders => 'Carpetas';

  @override
  String get npAppConnections => 'Conexiones';

  @override
  String get npAppDblHint => 'Haz doble clic en una tarjeta para abrirla';

  @override
  String get npAppNoMatch => 'No hay conexiones que coincidan.';

  @override
  String npAppFolderCount(String n) {
    return '$n conexiones';
  }

  @override
  String get npAppNewConnHere => 'Nueva conexión en esta carpeta';

  @override
  String get npAppNewSubfolder => 'Nueva subcarpeta';

  @override
  String get npAppKeyTag => 'Clave';

  @override
  String get npAppDuplicate => 'Duplicar';

  @override
  String get npAppMoveToFolder => 'Mover a carpeta…';

  @override
  String get npAppConnMoved => 'Conexión movida';

  @override
  String get npAppFolderIntoSelf =>
      'Una carpeta no puede moverse dentro de sí misma';

  @override
  String get npAppFolderPh => 'p. ej. Clientes';

  @override
  String get npAppRenameFolder => 'Cambiar nombre de la carpeta';

  @override
  String get npAppDeleteFolder => 'Eliminar carpeta';

  @override
  String npAppDeleteFolderMsg(String name) {
    return '¿Eliminar la carpeta <b>$name</b>?';
  }

  @override
  String npAppDeleteFolderConns(String n) {
    return '<br>Sus $n conexiones se moverán a la carpeta superior.';
  }

  @override
  String get npAppRootFolder => 'Nivel superior (sin carpeta)';

  @override
  String npAppMoveTitle(String name) {
    return 'Mover «$name»';
  }

  @override
  String get npAppTargetFolder => 'Carpeta de destino';

  @override
  String get npAppDeleteConn => 'Eliminar conexión';

  @override
  String npAppDeleteConnMsg(String name, String target) {
    return '¿Eliminar la conexión <b>$name</b> ($target)?<br>Los archivos del servidor o de la carpeta no se tocan; solo se eliminan esta conexión y su copia de trabajo.';
  }

  @override
  String get npAppNoLocalPath =>
      'No se ha elegido ninguna ruta en este equipo; se te preguntará al abrir';

  @override
  String get npAppChangeLocalPath => 'Cambiar la ruta en este equipo…';

  @override
  String get npAppOpenTabs => 'Pestañas abiertas';

  @override
  String get npAppCustomEditor => 'Ajustes del editor propios de la conexión';

  @override
  String get npFormTitleNew => 'Nueva conexión';

  @override
  String npFormTitleEdit(String name) {
    return 'Conexión: $name';
  }

  @override
  String get npFormTabConn => 'Conexión';

  @override
  String get npFormTabProject => 'Proyecto';

  @override
  String get npFormTabEditor => 'Editor (Notepad++)';

  @override
  String get npFormName => 'Nombre (visible)';

  @override
  String get npFormNamePh => 'p. ej. Web de la empresa';

  @override
  String get npFormHost => 'Host';

  @override
  String get npFormHostPh => 'server.example.com o 192.168.1.10';

  @override
  String get npFormPort => 'Puerto';

  @override
  String get npFormUser => 'Usuario';

  @override
  String get npFormPassword => 'Contraseña';

  @override
  String get npFormPwSaved => '•••••••• (guardada — escribe para cambiarla)';

  @override
  String get npFormLoginMethod => 'Método de inicio de sesión';

  @override
  String get npFormLoginNormal => 'Normal';

  @override
  String get npFormLoginAnon => 'Anónimo';

  @override
  String get npFormAuth => 'Autenticación SSH';

  @override
  String get npFormPrivateKey => 'Clave privada';

  @override
  String get npFormKeyFile => 'Archivo de clave privada';

  @override
  String get npFormPassphrase => 'Frase de contraseña de la clave';

  @override
  String get npFormPassSaved => '(guardada)';

  @override
  String get npFormPassEmpty => 'Déjalo vacío si no hay';

  @override
  String get npFormFolder => 'Carpeta';

  @override
  String get npFormColor => 'Color';

  @override
  String get npFormComments => 'Notas';

  @override
  String get npFormRootDir => 'Carpeta del proyecto (en el servidor)';

  @override
  String get npFormBrowse => 'Elegir carpeta';

  @override
  String get npFormBrowseHint =>
      'Pulsa primero «Probar conexión» para explorar el servidor y elegir la carpeta. Si se deja vacío, se abre la carpeta de inicio de sesión.';

  @override
  String get npFormBrowseTitle => 'Elegir una carpeta del servidor';

  @override
  String get npFormBrowseSelect => 'Seleccionar esta carpeta';

  @override
  String get npFormBrowseEmpty => 'No hay subcarpetas';

  @override
  String get npFormFolderPath => 'Carpeta';

  @override
  String get npFormFilePath => 'Archivo';

  @override
  String get npFormLocalPathHint =>
      'La ruta local solo se guarda en este equipo; los demás equipos la piden la primera vez.';

  @override
  String get npFormCacheNote =>
      'Cada archivo abierto se guarda, con su estructura de carpetas, en una copia de trabajo (caché). Al guardar, el archivo se sube al servidor y se actualiza la copia de trabajo.';

  @override
  String get npFormRestoreTabs => 'Recordar las pestañas abiertas';

  @override
  String get npFormRestoreTabsHint =>
      'La próxima vez el proyecto se abre con los mismos archivos (solo en este equipo).';

  @override
  String get npFormShowHidden => 'Mostrar archivos ocultos';

  @override
  String get npFormShowHiddenHint =>
      'Archivos y carpetas que empiezan por punto (.env, .htaccess, .git…)';

  @override
  String get npFormExclude => 'Ocultar en el árbol';

  @override
  String get npFormExcludeHint =>
      'Nombres o patrones separados por comas; se permiten * y ?.';

  @override
  String get npFormEditorMode => 'Ajustes del editor';

  @override
  String get npFormEdGlobal =>
      'Usar los ajustes generales del editor (Ajustes › Editor)';

  @override
  String get npFormEdCustom => 'Usar ajustes propios de esta conexión';

  @override
  String get npFormTest => 'Probar conexión';

  @override
  String get npFormSaveOpen => 'Guardar y abrir';

  @override
  String get npFormConnecting => 'Conectando…';

  @override
  String get npFormTestOk => 'Conexión correcta';

  @override
  String get npFormTestFail => 'No se pudo conectar';

  @override
  String npFormHomeDir(String dir) {
    return 'Carpeta de inicio de sesión: $dir';
  }

  @override
  String get npFormRootMissing =>
      'Aviso: no se pudo abrir la carpeta del proyecto.';

  @override
  String npFormHostKey(String fp) {
    return 'Clave de host SSH (SHA256): $fp';
  }

  @override
  String get npFormSaved => 'Conexión guardada';

  @override
  String get npFormChangesSaved => 'Cambios guardados';

  @override
  String get npTypeProtocol => 'Protocolo';

  @override
  String get npTypeFtp => 'FTP (estándar)';

  @override
  String get npTypeFtpsImplicit => 'FTPS — TLS/SSL implícito (puerto 990)';

  @override
  String get npTypeFtpsSsl => 'FTPS — Explícito (AUTH SSL)';

  @override
  String get npTypeFtpsTls => 'FTPS — Explícito (AUTH TLS)';

  @override
  String get npTypeSftp => 'SFTP — SSH2';

  @override
  String get npTypeNoteFtp =>
      'FTP simple; la contraseña y los archivos se envían sin cifrar.';

  @override
  String get npTypeNoteFtpsImplicit =>
      'La conexión se cifra con TLS/SSL desde el principio (normalmente el puerto 990).';

  @override
  String get npTypeNoteFtpsSsl =>
      'Se conecta con FTP simple y pasa a una sesión cifrada con AUTH SSL.';

  @override
  String get npTypeNoteFtpsTls =>
      'Se conecta con FTP simple y pasa a una sesión cifrada con AUTH TLS (el FTPS más habitual).';

  @override
  String get npTypeNoteSftp =>
      'Acceso cifrado a archivos por SSH (puerto 22). La clave de host del servidor se guarda en la primera conexión.';

  @override
  String get npOptEncoding => 'Codificación de nombres de archivo';

  @override
  String get npOptEncAuto => 'Automática';

  @override
  String get npEdSecEncoding => 'Codificación y fin de línea';

  @override
  String get npEdEncoding => 'Codificación al abrir archivos';

  @override
  String get npEdEncAuto => 'Detectar automáticamente (BOM / UTF-8)';

  @override
  String get npEdFallback => 'Si no es UTF-8 (ANSI)';

  @override
  String get npEdEol => 'Fin de línea';

  @override
  String get npEdEolAuto => 'Mantener el del archivo';

  @override
  String npEdEolConvert(String eol) {
    return 'Convertir a $eol al abrir';
  }

  @override
  String get npEdNewDoc => 'Archivo nuevo: codificación · fin de línea';

  @override
  String get npEdSecIndent => 'Sangría e idioma';

  @override
  String get npEdTabSize => 'Tamaño de tabulación';

  @override
  String get npEdLanguage => 'Lenguaje (sintaxis)';

  @override
  String get npEdLangAuto => 'Automático (extensión / primera línea)';

  @override
  String get npEdInsertSpaces => 'Insertar espacios en lugar de tabulaciones';

  @override
  String get npEdDetectIndent => 'Detectar la sangría del archivo';

  @override
  String get npEdDetectIndentHint =>
      'Los archivos con sangría de tabulaciones siguen usando tabulaciones.';

  @override
  String get npEdAutoIndent => 'Sangría automática';

  @override
  String get npEdAutoClose => 'Cerrar automáticamente paréntesis y comillas';

  @override
  String get npEdSecLook => 'Apariencia';

  @override
  String get npEdTheme => 'Tema de color';

  @override
  String get npEdThemeAuto => 'Automático (según el tema de la aplicación)';

  @override
  String get npEdWhitespace => 'Mostrar espacios y tabulaciones';

  @override
  String get npEdWsNone => 'No mostrar';

  @override
  String get npEdWsBoundary =>
      'Todos excepto los espacios simples entre palabras';

  @override
  String get npEdWsTrailing => 'Solo al final de línea';

  @override
  String get npEdWsAll => 'Todos';

  @override
  String get npEdFont => 'Fuente';

  @override
  String get npEdFontSize => 'Tamaño';

  @override
  String get npEdRulers => 'Reglas';

  @override
  String get npEdWordWrap => 'Ajuste de línea';

  @override
  String get npEdLineNumbers => 'Números de línea';

  @override
  String get npEdHighlightLine => 'Resaltar la línea actual';

  @override
  String get npEdSmartHighlight => 'Resaltado inteligente (mismas palabras)';

  @override
  String get npEdIndentGuides => 'Guías de sangría';

  @override
  String get npEdFolding => 'Plegado de código';

  @override
  String get npEdBracketColors => 'Colorear pares de paréntesis';

  @override
  String get npEdMinimap => 'Minimapa (mapa del documento)';

  @override
  String get npEdControlChars => 'Mostrar caracteres invisibles';

  @override
  String get npEdSecSave => 'Guardado';

  @override
  String get npEdTrimTrailing => 'Eliminar espacios finales al guardar';

  @override
  String get npEdFinalNewline => 'Insertar salto de línea final';

  @override
  String get npEdCheckRemote => 'Comprobar cambios antes de guardar';

  @override
  String get npEdCheckRemoteHint =>
      'Pregunta si alguien cambió el archivo en el servidor después de abrirlo.';

  @override
  String get npEdAutoSave => 'Guardado automático';

  @override
  String get npEdSec => 's';

  @override
  String get npEdAutoSaveHint =>
      '0 = desactivado. Si está activado, el archivo se guarda y se sube este tiempo después de un cambio.';

  @override
  String get npMainBalloonTitle =>
      'Notepad Master se está ejecutando en segundo plano';

  @override
  String get npMainBalloonBody =>
      'Haz clic en el icono de la bandeja para volver a abrirlo.';

  @override
  String get npMainTrayShow => 'Mostrar Notepad Master';

  @override
  String get npMainTrayQuick => 'Apertura rápida';

  @override
  String get npMainTrayNone => 'No hay conexiones guardadas';

  @override
  String get npMainTrayQuit => 'Salir';

  @override
  String get npProjToggleTree => 'Mostrar/ocultar árbol de carpetas (Ctrl+B)';

  @override
  String get npProjReconnect => 'Volver a conectar';

  @override
  String get npProjReconnected => 'Conectado de nuevo';

  @override
  String get npProjConnectFail => 'No se pudo conectar';

  @override
  String get npProjStatusOn => 'Conectado';

  @override
  String get npProjStatusOff => 'Desconectado';

  @override
  String get npProjStatusConnecting => 'Conectando…';

  @override
  String get npProjSave => 'Guardar';

  @override
  String get npProjSaveAll => 'Guardar todo';

  @override
  String get npProjUndo => 'Deshacer';

  @override
  String get npProjRedo => 'Rehacer';

  @override
  String get npProjFind => 'Buscar';

  @override
  String get npProjReplace => 'Reemplazar';

  @override
  String get npProjGoto => 'Ir a la línea';

  @override
  String get npProjShowWs => 'Mostrar espacios y tabulaciones';

  @override
  String get npProjZoomIn => 'Acercar';

  @override
  String get npProjZoomOut => 'Alejar';

  @override
  String get npProjShowCache => 'Mostrar copia de trabajo';

  @override
  String get npProjPalette => 'Paleta de comandos';

  @override
  String get npProjCloseTab => 'Cerrar';

  @override
  String get npProjCloseOthers => 'Cerrar las demás';

  @override
  String get npProjCloseAll => 'Cerrar todas';

  @override
  String get npProjReload => 'Recargar';

  @override
  String npProjReloadMsg(String name) {
    return 'Se perderán los cambios no guardados de <b>$name</b>. ¿Recargar el archivo?';
  }

  @override
  String get npProjRevealTree => 'Mostrar en el árbol';

  @override
  String get npProjUnsavedTitle => 'Cambios sin guardar';

  @override
  String npProjUnsavedMsg(String name) {
    return '¿Guardar los cambios de <b>$name</b>?';
  }

  @override
  String get npProjDontSave => 'No guardar';

  @override
  String npProjOpenFail(String name) {
    return 'No se pudo abrir $name';
  }

  @override
  String npProjTooLarge(String name, String size) {
    return '$name es demasiado grande ($size); el límite es de 50 MB.';
  }

  @override
  String npProjBinary(String name) {
    return '$name no es un archivo de texto (binario); no se ha abierto en el editor.';
  }

  @override
  String npProjSaveFail(String name) {
    return 'No se pudo guardar $name';
  }

  @override
  String npProjSaved(String name) {
    return '$name guardado';
  }

  @override
  String npProjSavedRemote(String name) {
    return '$name guardado y subido';
  }

  @override
  String get npProjLossyTitle => 'Aviso de codificación';

  @override
  String npProjLossyMsg(String enc) {
    return 'Algunos caracteres no se pueden guardar en <b>$enc</b> y se guardarán como «?». Se recomienda convertir a UTF-8 desde la barra de estado.';
  }

  @override
  String get npProjSaveAnyway => 'Guardar de todos modos';

  @override
  String get npProjConflictTitle => 'El archivo cambió en otro lugar';

  @override
  String npProjConflictMsg(String name) {
    return '<b>$name</b> se modificó en el servidor después de que lo abrieras. ¿Qué quieres hacer?';
  }

  @override
  String get npProjConflictOverwrite => 'Sobrescribir';

  @override
  String get npProjConflictReload => 'Cargar la versión del servidor';

  @override
  String npProjConflictAuto(String name) {
    return '$name cambió en el servidor; se omitió el guardado automático.';
  }

  @override
  String npProjPos(String col, String ln) {
    return 'Lín. $ln, col. $col';
  }

  @override
  String npProjSel(String n) {
    return '$n seleccionados';
  }

  @override
  String npProjSpaces(String n) {
    return 'Espacios: $n';
  }

  @override
  String npProjTabWidth(String n) {
    return 'Tabulación: $n';
  }

  @override
  String get npProjIndentToSpaces => 'Convertir sangría a espacios';

  @override
  String get npProjIndentToTabs => 'Convertir sangría a tabulaciones';

  @override
  String npProjEncTitle(String name) {
    return 'Codificación: $name';
  }

  @override
  String get npProjEncConvert => 'Convertir a esta codificación (al guardar)';

  @override
  String get npProjEncConvertHint =>
      'El texto no cambia; el archivo se escribe con la codificación elegida al guardarlo.';

  @override
  String get npProjEncReopen => 'Volver a abrir con esta codificación';

  @override
  String get npProjEncReopenHint =>
      'Si los caracteres se ven mal, vuelve a leer el archivo con la codificación correcta.';

  @override
  String npProjEolTo(String eol) {
    return 'Convertir a $eol';
  }

  @override
  String get npProjLangTitle => 'Elegir lenguaje';

  @override
  String get npProjLangSearch => 'Buscar lenguajes…';

  @override
  String get npProjCacheCopy => 'Copia de trabajo';

  @override
  String get npProjInitFail => 'No se pudo iniciar la ventana del proyecto';

  @override
  String get npProjEmptyHint =>
      'Haz doble clic en un archivo del árbol de la izquierda; se abrirá aquí en una pestaña con el resaltado de sintaxis de su lenguaje.';

  @override
  String get npProjEmptyFile => 'Abriendo el archivo…';

  @override
  String get npTreeNewFile => 'Nuevo archivo';

  @override
  String get npTreeFileName => 'Nombre del archivo';

  @override
  String get npTreeBadName => 'Nombre no válido';

  @override
  String get npTreeCreateFail => 'No se pudo crear';

  @override
  String get npTreeRenameFail => 'No se pudo cambiar el nombre';

  @override
  String get npTreeRenameDirty =>
      'Guarda primero los archivos abiertos de esta carpeta.';

  @override
  String get npTreeDeleteTitle => 'Eliminar';

  @override
  String npTreeDeleteMsg(String name) {
    return '¿Eliminar el archivo <b>$name</b>?';
  }

  @override
  String npTreeDeleteDirMsg(String name) {
    return '¿Eliminar la carpeta <b>$name</b> y todo su contenido?';
  }

  @override
  String get npTreeDeleteFail => 'No se pudo eliminar';

  @override
  String get npTreeTrashNote =>
      'Los archivos locales se mueven a la Papelera de reciclaje.';

  @override
  String get npTreeEmpty => 'Carpeta vacía';

  @override
  String get npTreeCollapseAll => 'Contraer todo';

  @override
  String get npTreeShowExplorer => 'Mostrar en el Explorador';

  @override
  String get npTreeUp => 'Carpeta superior';

  @override
  String get npTreeHome => 'Carpeta de inicio de sesión';

  @override
  String get npMainErrAuth =>
      'Error de inicio de sesión: usuario o contraseña incorrectos.';

  @override
  String get npMainErrRefused =>
      'Conexión rechazada: el puerto está cerrado o el servidor no está en ejecución.';

  @override
  String get npMainErrTimeout =>
      'Tiempo agotado: no se pudo alcanzar el servidor.';

  @override
  String get npMainErrDns => 'No se pudo resolver el nombre del host (DNS).';

  @override
  String get npMainErrUnreach => 'El servidor no es accesible por la red.';

  @override
  String get npMainErrReset => 'El servidor cerró la conexión.';

  @override
  String get npMainErrNotFound => 'No se encontró el archivo o la carpeta.';

  @override
  String get npMainErrPerm => 'Permiso denegado.';

  @override
  String get npMainErrExists =>
      'Ya existe un archivo o carpeta con este nombre.';

  @override
  String npMainErr550(String msg) {
    return 'El servidor rechazó la operación (550): $msg';
  }

  @override
  String get npMainErr553 =>
      'El servidor no aceptó el nombre de archivo (553).';

  @override
  String npMainErrTls(String msg) {
    return 'Error de TLS/SSL: comprueba el protocolo o el puerto. ($msg)';
  }

  @override
  String npMainErrHostKey(String newVal, String oldVal) {
    return '¡La clave de host del servidor ha cambiado! Guardada: $oldVal, recibida: $newVal. Conexión rechazada por seguridad.';
  }

  @override
  String get npMainErrNoKey => 'No se pudo leer el archivo de clave privada.';

  @override
  String get npMainErrKey =>
      'No se pudo leer la clave privada: frase de contraseña incorrecta o formato no compatible.';

  @override
  String get npMainErrNoLocal =>
      'No se encontró la carpeta o el archivo en este equipo. Cambia la ruta desde el menú de la tarjeta en la ventana principal.';

  @override
  String get npMainErrConnNotFound => 'Conexión no encontrada';

  @override
  String get npMainErrNoSession => 'No conectado';

  @override
  String get npMainErrHost => 'La dirección del host es obligatoria.';

  @override
  String get npMainErrUser =>
      'El nombre de usuario es obligatorio (o elige el inicio de sesión anónimo).';

  @override
  String get npMainPickKey => 'Elegir un archivo de clave privada';

  @override
  String get npMainCopySuffix => ' (copia)';

  @override
  String get npMainCloseDirty =>
      'Hay archivos sin guardar. Si cierras la ventana, se perderán los cambios.';

  @override
  String get npMainCloseDiscard => 'Cerrar sin guardar';

  @override
  String get ipAppNewFolder => 'Nueva carpeta';

  @override
  String get ipAppNewRecord => 'Nuevo registro';

  @override
  String get ipAppSearchPh => 'Buscar registros, IP, nombres, MAC o servicios…';

  @override
  String ipAppStats(String n) {
    return '$n registros';
  }

  @override
  String get ipColIp => 'IP';

  @override
  String get ipColMac => 'MAC';

  @override
  String get ipColName => 'Nombre';

  @override
  String get ipColRtt => 'Respuesta';

  @override
  String get ipColServices => 'Servicios';

  @override
  String get ipColStatus => 'Estado';

  @override
  String get ipColVendor => 'Fabricante';

  @override
  String get ipCtxCopyIp => 'Copiar dirección IP';

  @override
  String get ipCtxCopyMac => 'Copiar dirección MAC';

  @override
  String get ipCtxCopyName => 'Copiar nombre';

  @override
  String get ipCtxCopyRange => 'Copiar rango';

  @override
  String get ipCtxOpenWeb => 'Abrir en el navegador';

  @override
  String ipFolderDeleteMsg(String name) {
    return 'Se eliminará la carpeta «$name»; sus registros y carpetas se mueven a la carpeta superior.';
  }

  @override
  String get ipFolderEmpty => 'Carpeta vacía';

  @override
  String get ipFolderName => 'Nombre de la carpeta';

  @override
  String get ipFolderRename => 'Cambiar nombre de la carpeta';

  @override
  String get ipHostAlive => 'Presencia';

  @override
  String get ipHostBanner => 'Saludo';

  @override
  String get ipHostCert => 'Certificado';

  @override
  String get ipHostCertExpires => 'Válido hasta';

  @override
  String get ipHostCertIssuer => 'Emisor';

  @override
  String get ipHostDetails => 'Detalles';

  @override
  String get ipHostLocalMac => 'dirección privada';

  @override
  String get ipHostNoServices =>
      'Ninguno de los puertos de la lista está abierto.';

  @override
  String get ipHostSelfSigned => 'autofirmado';

  @override
  String get ipHostServer => 'Servidor';

  @override
  String get ipHostTitle => 'Título';

  @override
  String get ipHostUnknown => '(nombre no resuelto)';

  @override
  String get ipNoticeAccept => 'Entendido';

  @override
  String get ipNoticeBody =>
      'IP Tools solo descubre su red local: encuentra dispositivos con ping, intenta conectarse a una lista corta de puertos y resuelve sus nombres. Analice solo redes de su propiedad o para las que esté autorizado.';

  @override
  String get ipNoticeLimits =>
      'Por diseño solo se analizan direcciones privadas (10.x, 172.16–31.x, 192.168.x, 169.254.x); sin pruebas de vulnerabilidades, sin intentos de contraseña ni análisis amplio de puertos.';

  @override
  String get ipNoticeShort => 'Analice solo redes autorizadas';

  @override
  String get ipNoticeText =>
      'Analice solo redes de su propiedad o para las que esté autorizado.';

  @override
  String get ipNoticeTitle => 'Descubrimiento de la red local';

  @override
  String get ipPrivacyNote =>
      'Privacidad: los resultados de análisis se guardan solo en este equipo y nunca se envían. Solo se analizan direcciones privadas/locales.';

  @override
  String get ipRangeErrEmpty => 'Introduzca un rango de IP.';

  @override
  String ipRangeErrInvalid(String token) {
    return 'Dirección o rango no válido: $token';
  }

  @override
  String ipRangeErrIpv6(String token) {
    return 'Las direcciones IPv6 no son compatibles: $token';
  }

  @override
  String ipRangeErrNotPrivate(String token) {
    return 'Solo se pueden analizar direcciones privadas/locales (10.x, 172.16–31.x, 192.168.x, 169.254.x): $token';
  }

  @override
  String ipRangeErrReversed(String token) {
    return 'El inicio del rango es mayor que su fin: $token';
  }

  @override
  String ipRangeErrTooMany(String count) {
    return 'Rango demasiado grande (como máximo 65 536 direcciones, un /16): $count';
  }

  @override
  String ipRangeOk(String n) {
    return 'Se analizarán $n direcciones';
  }

  @override
  String get ipRecColor => 'Color';

  @override
  String ipRecDeleteMsg(String name) {
    return 'Se eliminarán el registro «$name» y su resultado de análisis en este equipo.';
  }

  @override
  String ipRecDevices(String n) {
    return '$n dispositivos';
  }

  @override
  String get ipRecEdit => 'Editar registro';

  @override
  String get ipRecFolder => 'Carpeta';

  @override
  String ipRecItems(String n) {
    return '$n elementos';
  }

  @override
  String ipRecLastScan(String time) {
    return 'Último análisis: $time';
  }

  @override
  String get ipRecMove => 'Mover';

  @override
  String get ipRecMoveTitle => 'Mover registro';

  @override
  String get ipRecName => 'Nombre';

  @override
  String get ipRecNever => 'Sin analizar todavía';

  @override
  String ipRecNewDevices(String n) {
    return '$n nuevos';
  }

  @override
  String get ipRecRange => 'Rango de IP';

  @override
  String get ipRecRangeHint =>
      'Ejemplos: 192.168.1.0/24 · 192.168.1.1-192.168.1.255 · 10.0.0.5 · varios separados por comas. Como máximo /16.';

  @override
  String get ipRecRootFolder => 'Registros';

  @override
  String get ipRecSaved => 'Registro guardado';

  @override
  String get ipScanBusy => 'Hay otro análisis en curso; deténgalo primero.';

  @override
  String ipScanDone(String n) {
    return 'Análisis terminado: $n dispositivos';
  }

  @override
  String get ipScanEmptyBody =>
      'Pulse Analizar o haga clic en ▶ en la tarjeta. Los dispositivos encontrados se listan aquí.';

  @override
  String get ipScanEmptyTitle => 'Este registro aún no se ha analizado';

  @override
  String get ipScanExport => 'Exportar';

  @override
  String get ipScanExportCsv => 'Guardar como CSV…';

  @override
  String get ipScanExportJson => 'Guardar como JSON…';

  @override
  String get ipScanExported => 'Exportado';

  @override
  String ipScanFailed(String msg) {
    return 'El análisis falló: $msg';
  }

  @override
  String get ipScanFilter => 'Filtro';

  @override
  String get ipScanFilterAll => 'Todos';

  @override
  String get ipScanFilterGone => 'Desaparecidos';

  @override
  String get ipScanFilterNew => 'Nuevos';

  @override
  String get ipScanFilterServices => 'Con servicios';

  @override
  String ipScanFound(String n) {
    return '$n dispositivos encontrados';
  }

  @override
  String get ipScanNoMatch => 'Ningún dispositivo coincide con el filtro.';

  @override
  String get ipScanPhaseNames => 'Resolviendo nombres';

  @override
  String get ipScanPhasePing => 'Buscando dispositivos';

  @override
  String get ipScanPhasePorts => 'Probando servicios';

  @override
  String ipScanProgress(String done, String total) {
    return '$done/$total';
  }

  @override
  String ipScanRateLimited(String s) {
    return 'El mismo registro podrá analizarse de nuevo dentro de $s s como mínimo.';
  }

  @override
  String get ipScanScan => 'Analizar';

  @override
  String get ipScanScanning => 'Analizando…';

  @override
  String get ipScanSelectHint =>
      'Haga clic en un registro a la izquierda: se analiza el rango y los dispositivos encontrados se listan aquí.';

  @override
  String get ipScanSelectRecord => 'Seleccione un registro';

  @override
  String get ipScanStop => 'Detener';

  @override
  String get ipScanStopped => 'Análisis detenido';

  @override
  String get ipStatusAliveArp => 'Visto en la tabla ARP (no respondió al ping)';

  @override
  String get ipStatusAlivePing => 'Respondió al ping';

  @override
  String get ipStatusGone => 'Desaparecido (presente en el análisis anterior)';

  @override
  String get ipStatusLive => 'Analizando';

  @override
  String get ipStatusNew => 'Nuevo (no estaba en el análisis anterior)';

  @override
  String get ipStatusSame => 'En línea';

  @override
  String ipTagCopied(String text) {
    return 'Copiado al portapapeles: $text';
  }

  @override
  String get ipTagFailed => 'No se pudo abrir';

  @override
  String get ipTagGroupCamera => 'Cámara (RTSP)';

  @override
  String get ipTagGroupDb => 'Base de datos';

  @override
  String get ipTagGroupFtp => 'FTP';

  @override
  String get ipTagGroupPrinter => 'Impresora';

  @override
  String get ipTagGroupRdp => 'Escritorio remoto';

  @override
  String get ipTagGroupSmb => 'Uso compartido de archivos';

  @override
  String get ipTagGroupSsh => 'SSH';

  @override
  String get ipTagGroupVnc => 'VNC';

  @override
  String get ipTagGroupWeb => 'Web';

  @override
  String ipTagOpened(String text) {
    return 'Abriendo: $text';
  }

  @override
  String get ipTrayHiddenHint =>
      'IP Tools sigue funcionando en la bandeja. Haga clic en el icono para recuperar la ventana.';

  @override
  String get ipTrayQuit => 'Salir';

  @override
  String get ipTrayShow => 'Mostrar IP Tools';

  @override
  String get ipWelcomeBody =>
      'Guarde un rango de IP (p. ej. 192.168.1.0/24). Al hacer clic en el registro se analiza el rango; los dispositivos encontrados se listan con su nombre, fabricante y servicios abiertos. Haga clic en una etiqueta de servicio para abrir la aplicación correspondiente.';

  @override
  String get ipWelcomeTitle => '¿Qué hay en su red local?';

  @override
  String get cvTypeVideo => 'Vídeo';

  @override
  String get cvTypeImage => 'Imagen';

  @override
  String get cvTypeAudio => 'Audio';

  @override
  String get cvTypeVideoHint => 'MP4, MKV, AVI, MOV…';

  @override
  String get cvTypeImageHint => 'JPG, PNG, WEBP, AVIF…';

  @override
  String get cvTypeAudioHint => 'MP3, WAV, FLAC, M4A…';

  @override
  String get cvTypeVideoAll => 'Todos los archivos de vídeo';

  @override
  String get cvTypeImageAll => 'Todos los archivos de imagen';

  @override
  String get cvTypeAudioAll => 'Todos los archivos de audio';

  @override
  String get cvAppSearchPh => 'Buscar proyectos…  (Ctrl+F)';

  @override
  String get cvAppNewProject => 'Nuevo proyecto';

  @override
  String get cvAppSettings => 'Ajustes';

  @override
  String cvAppStats(String c, String f) {
    return '$c proyectos · $f carpetas';
  }

  @override
  String get cvAppWelcome => 'Bienvenido';

  @override
  String cvAppResults(String q) {
    return 'Resultados de «$q»';
  }

  @override
  String get cvAppAll => 'Todos los proyectos';

  @override
  String get cvAppWelcomeHint =>
      'Crea tu primer proyecto de conversión.<br>Elige vídeo, imagen o audio, selecciona las extensiones de origen y destino e indica un archivo o una carpeta.';

  @override
  String get cvAppFolders => 'Carpetas';

  @override
  String get cvAppProjects => 'Proyectos';

  @override
  String get cvAppDblHint => 'Haz doble clic en un proyecto para abrirlo';

  @override
  String get cvAppNoMatch => 'No hay proyectos que coincidan.';

  @override
  String cvAppFolderCount(String n) {
    return '$n proyectos';
  }

  @override
  String get cvAppNewProjectHere => 'Nuevo proyecto en esta carpeta';

  @override
  String get cvAppNewSubfolder => 'Crear subcarpeta';

  @override
  String get cvAppDuplicate => 'Duplicar';

  @override
  String get cvAppMoveToFolder => 'Mover a carpeta…';

  @override
  String get cvAppProjectMoved => 'Proyecto movido';

  @override
  String get cvAppFolderIntoSelf =>
      'Una carpeta no puede moverse dentro de sí misma';

  @override
  String get cvAppFolderPh => 'p. ej. Vídeos de clientes';

  @override
  String get cvAppRenameFolder => 'Cambiar nombre de la carpeta';

  @override
  String get cvAppDeleteFolder => 'Eliminar carpeta';

  @override
  String cvAppDeleteFolderMsg(String name) {
    return '¿Eliminar la carpeta <b>$name</b>?';
  }

  @override
  String cvAppDeleteFolderProjects(String n) {
    return '<br>Sus $n proyectos se moverán a la carpeta superior.';
  }

  @override
  String get cvAppRootFolder => 'Nivel superior (sin carpeta)';

  @override
  String cvAppMoveTitle(String name) {
    return 'Mover «$name»';
  }

  @override
  String get cvAppTargetFolder => 'Carpeta de destino';

  @override
  String get cvAppDeleteProject => 'Eliminar proyecto';

  @override
  String cvAppDeleteProjectMsg(String name) {
    return '¿Eliminar el proyecto <b>$name</b>?<br>También se eliminarán sus archivos convertidos y transcripciones. Tus archivos de origen no se modifican.';
  }

  @override
  String get cvAppProjectSettings => 'Ajustes del proyecto';

  @override
  String get cvAppNoSource => 'No se ha elegido un origen en este equipo';

  @override
  String get cvAppAllExts => 'Todas';

  @override
  String get cvAppRunning => 'En curso';

  @override
  String cvAppDoneCount(String n) {
    return '$n completados';
  }

  @override
  String cvAppErrorCount(String n) {
    return '$n con error';
  }

  @override
  String get cvAppProjectSaved => 'Proyecto guardado';

  @override
  String get cvAppClearOutputs => 'Eliminar archivos convertidos';

  @override
  String cvAppClearOutputsMsg(String name) {
    return '¿Eliminar los archivos convertidos de <b>$name</b>? Tus archivos de origen no se modifican; puedes volver a convertir cuando quieras.';
  }

  @override
  String get cvPfTitleNew => 'Nuevo proyecto';

  @override
  String cvPfTitleEdit(String name) {
    return 'Ajustes del proyecto: $name';
  }

  @override
  String get cvPfCreate => 'Guardar';

  @override
  String get cvPfTabGeneral => 'General';

  @override
  String get cvPfTabOutput => 'Ajustes de conversión';

  @override
  String get cvPfTabSpeech => 'Voz';

  @override
  String get cvPfName => 'Nombre del proyecto';

  @override
  String get cvPfNamePh => 'p. ej. Vídeos de vacaciones';

  @override
  String get cvPfType => 'Tipo';

  @override
  String get cvPfSourceExt => 'Extensión de origen';

  @override
  String get cvPfTargetExt => 'Extensión de destino';

  @override
  String get cvPfSelectAll => 'Seleccionar todo';

  @override
  String get cvPfSelectNone => 'Ninguna';

  @override
  String get cvPfGroupVideo => 'Vídeo';

  @override
  String get cvPfGroupAnim => 'Animación';

  @override
  String get cvPfGroupAudioOnly => 'Solo audio (extraer del vídeo)';

  @override
  String get cvPfAudioOnlyHint =>
      'Solo se conserva la pista de audio del vídeo.';

  @override
  String get cvPfGifHint => 'GIF animado (máximo 30 fotogramas/s).';

  @override
  String get cvPfSource => 'Origen';

  @override
  String get cvPfModeFile => 'Archivo';

  @override
  String get cvPfModeFolder => 'Carpeta';

  @override
  String get cvPfPathFile => 'Archivo que se convertirá';

  @override
  String get cvPfPathFolder => 'Carpeta que se convertirá';

  @override
  String get cvPfPathNone => 'Aún no elegido — pulsa Examinar…';

  @override
  String get cvPfSubfolders => 'Incluir subcarpetas';

  @override
  String get cvPfConcurrency => 'Archivos convertidos a la vez';

  @override
  String get cvPfConcurrencyHint =>
      'Los valores altos terminan antes, pero cargan más la CPU y el disco.';

  @override
  String get cvPfFolder => 'Carpeta del proyecto';

  @override
  String get cvPfSpeechAsk => 'Convertir voz a texto';

  @override
  String get cvPfSpeechAskHint =>
      'Se transcribe la voz del vídeo o audio: el segundo, el idioma y el texto de cada frase aparecen en columnas separadas.';

  @override
  String get cvPfSpeechModel => 'Modelo de voz';

  @override
  String get cvPfSpeechLang => 'Idioma hablado';

  @override
  String get cvPfPerWindow => 'Detectar el idioma de nuevo cada 30 segundos';

  @override
  String get cvPfPerWindowHint =>
      'Para grabaciones con varios idiomas. Más lento.';

  @override
  String get cvPfModels => 'Modelos';

  @override
  String get cvPfSpeechNote =>
      'El reconocimiento de voz funciona sin conexión en este equipo (whisper.cpp); el audio nunca se envía a un servidor. El modelo se descarga una sola vez, la primera vez que se usa.';

  @override
  String get cvPfErrExt => 'Elige al menos una extensión de origen.';

  @override
  String get cvOutQuality => 'Calidad';

  @override
  String get cvOutQHigh => 'Alta (archivo grande)';

  @override
  String get cvOutQMedium => 'Media (recomendada)';

  @override
  String get cvOutQLow => 'Baja (archivo pequeño)';

  @override
  String get cvOutResolution => 'Resolución';

  @override
  String get cvOutAsSource => 'Igual que el origen';

  @override
  String get cvOutResolutionHint =>
      'Solo reduce; los vídeos más pequeños no se amplían.';

  @override
  String get cvOutFps => 'Velocidad de fotogramas';

  @override
  String get cvOutCodec => 'Códec de vídeo';

  @override
  String get cvOutH264 => 'H.264 (más compatible)';

  @override
  String get cvOutH265 => 'H.265 / HEVC (más pequeño)';

  @override
  String get cvOutCodecHint =>
      'H.265 solo se usa con destinos MP4, MKV, MOV y M4V.';

  @override
  String get cvOutSpeed => 'Velocidad de codificación';

  @override
  String get cvOutSpeedVeryfast => 'Muy rápida';

  @override
  String get cvOutSpeedFast => 'Rápida';

  @override
  String get cvOutSpeedMedium => 'Equilibrada';

  @override
  String get cvOutSpeedSlow => 'Lenta (archivo más pequeño)';

  @override
  String get cvOutAudioBitrate => 'Tasa de bits de audio';

  @override
  String get cvOutNoAudio => 'Quitar el audio';

  @override
  String get cvOutImgQuality => 'Calidad';

  @override
  String get cvOutImgQualityHint =>
      'Para JPG, WEBP, AVIF y TIFF. PNG es sin pérdida; por debajo de 80 se usa una paleta de colores.';

  @override
  String get cvOutMaxWidth => 'Ancho máximo';

  @override
  String get cvOutMaxHeight => 'Alto máximo';

  @override
  String get cvOutNoLimit => 'Sin límite';

  @override
  String get cvOutResizeHint =>
      'Se mantiene la relación de aspecto; las imágenes más pequeñas no se amplían.';

  @override
  String get cvOutKeepMeta => 'Conservar metadatos (EXIF, perfil de color)';

  @override
  String get cvOutKeepMetaHint =>
      'Si está desactivado, los datos personales como la ubicación no se escriben en el resultado.';

  @override
  String get cvOutBitrate => 'Tasa de bits';

  @override
  String get cvOutBitrateHint =>
      'WAV, FLAC y AIFF son sin pérdida; la tasa de bits no se aplica.';

  @override
  String get cvOutSampleRate => 'Frecuencia de muestreo';

  @override
  String get cvOutChannels => 'Canales';

  @override
  String get cvOutStereo => 'Estéreo';

  @override
  String get cvOutMono => 'Mono';

  @override
  String get cvSpeechModelTiny => 'Tiny (el más rápido)';

  @override
  String get cvSpeechModelBase => 'Base (recomendado)';

  @override
  String get cvSpeechModelSmall => 'Small (más preciso)';

  @override
  String get cvSpeechModelMedium => 'Medium (alta precisión)';

  @override
  String get cvSpeechModelTurbo => 'Large v3 Turbo (el más preciso)';

  @override
  String get cvSpeechLangAuto => 'Detectar automáticamente';

  @override
  String get cvSpeechDownload => 'Descargar';

  @override
  String cvSpeechInstalled(String size) {
    return 'Instalado · $size';
  }

  @override
  String get cvSpeechDownloadFailed => 'No se pudo descargar el modelo';

  @override
  String get cvSpeechDlEngine => 'Descargando el motor de voz';

  @override
  String cvSpeechDlModel(String model) {
    return 'Descargando el modelo de voz: $model';
  }

  @override
  String get cvSpeechEngineAuto =>
      'El motor de voz (whisper.cpp) se descargará la primera vez que se use.';

  @override
  String get cvSpeechEngineMissing =>
      'No se encontró el motor de voz (whisper-cli).';

  @override
  String get cvPjOriginal => 'Original';

  @override
  String get cvPjConverted => 'Convertido';

  @override
  String get cvPjFolders => 'Carpetas';

  @override
  String get cvPjFiles => 'Archivos';

  @override
  String get cvPjTranscript => 'Texto';

  @override
  String get cvPjTrSecond => 'Segundo';

  @override
  String get cvPjTrLang => 'Idioma';

  @override
  String get cvPjTrText => 'Texto';

  @override
  String get cvPjSecUnit => 's';

  @override
  String get cvPjStart => 'Iniciar';

  @override
  String get cvPjStop => 'Detener';

  @override
  String get cvPjChangeSource => 'Cambiar origen';

  @override
  String get cvPjPickSource => 'Elegir origen';

  @override
  String get cvPjOpenOutDir => 'Abrir la carpeta de archivos convertidos';

  @override
  String get cvPjExportOutputs =>
      'Copiar los archivos convertidos a otra carpeta…';

  @override
  String get cvPjClearOutputs => 'Eliminar archivos convertidos';

  @override
  String get cvPjLinkPreview => 'Reproducir ambas vistas previas a la vez';

  @override
  String get cvPjFilterPh => 'Buscar archivos';

  @override
  String get cvPjFAll => 'Todos';

  @override
  String get cvPjFPending => 'Pendientes';

  @override
  String get cvPjFActive => 'En curso';

  @override
  String get cvPjFDone => 'Completados';

  @override
  String get cvPjFError => 'Con error';

  @override
  String get cvPjExpandAll => 'Expandir todo';

  @override
  String get cvPjCollapseAll => 'Contraer todo';

  @override
  String get cvPjRescan => 'Volver a examinar';

  @override
  String get cvPjColName => 'Nombre';

  @override
  String get cvPjColFolder => 'Carpeta';

  @override
  String get cvPjColSize => 'Tamaño';

  @override
  String get cvPjColProgress => 'Progreso';

  @override
  String get cvPjColStatus => 'Estado';

  @override
  String get cvPjColSpeech => 'Texto';

  @override
  String get cvPjColOut => 'Resultado';

  @override
  String cvPjSegments(String n) {
    return '$n frases';
  }

  @override
  String get cvPjNoAudio => 'Sin audio';

  @override
  String cvPjNoFiles(String exts) {
    return 'No hay archivos con las extensiones elegidas en esta carpeta ($exts).';
  }

  @override
  String get cvPjNoMatch => 'No hay archivos que coincidan.';

  @override
  String get cvPjNoneChecked =>
      'La lista está vacía. Marca los archivos que quieras convertir en el árbol de la izquierda.';

  @override
  String get cvPjConvertThis => 'Convertir este archivo';

  @override
  String get cvPjReconvert => 'Volver a convertir';

  @override
  String get cvPjTranscribeThis => 'Transcribir';

  @override
  String get cvPjRetranscribe => 'Volver a transcribir';

  @override
  String get cvPjOpenOut => 'Abrir archivo convertido';

  @override
  String get cvPjRevealOut => 'Mostrar el convertido en la carpeta';

  @override
  String get cvPjOpenSrc => 'Abrir archivo original';

  @override
  String get cvPjRevealSrc => 'Mostrar el original en la carpeta';

  @override
  String get cvPjExportThis => 'Copiar a otra carpeta…';

  @override
  String get cvPjDeleteOut => 'Eliminar archivo convertido';

  @override
  String get cvPjUncheck => 'Quitar de la lista';

  @override
  String cvPjExported(String n) {
    return '$n archivos copiados';
  }

  @override
  String get cvPjFileMissing => 'No se encontró el archivo de origen.';

  @override
  String get cvPjPickToPreview =>
      'Selecciona un archivo de la lista para previsualizarlo.';

  @override
  String get cvPjOutPreviewHint => 'Aparecerá aquí cuando se convierta.';

  @override
  String get cvPjConverting => 'Convirtiendo…';

  @override
  String get cvPjCantPlay =>
      'Este formato no se puede reproducir aquí directamente.';

  @override
  String get cvPjMakePreview => 'Crear vista previa';

  @override
  String get cvPjMakingPreview => 'Preparando vista previa…';

  @override
  String get cvPjNoSourceTitle => 'No se ha elegido un origen en este equipo';

  @override
  String get cvPjNoSourceHint =>
      'El proyecto se sincronizó desde otro dispositivo o aún no se ha elegido un origen. Elige el archivo o la carpeta que quieras convertir.';

  @override
  String get cvPjSourceGone => 'No se encontró el origen';

  @override
  String get cvPjTrImage =>
      'La conversión de voz a texto está disponible en proyectos de vídeo y audio.';

  @override
  String get cvPjTrPick => 'Selecciona un archivo para ver su texto.';

  @override
  String get cvPjTrAfter =>
      'La voz se transcribirá cuando se convierta el archivo.';

  @override
  String get cvPjTrOff =>
      'La conversión de voz a texto está desactivada en este proyecto. Puedes ejecutarla ahora para este archivo.';

  @override
  String cvPjTrRunning(String p) {
    return 'Transcribiendo… $p%';
  }

  @override
  String get cvPjTrNone => 'No se encontró voz en este archivo.';

  @override
  String get cvPjTrNoExport => 'No hay texto para exportar.';

  @override
  String get cvPjTrSaved => 'Texto guardado';

  @override
  String get cvPjExportTranscript => 'Exportar texto';

  @override
  String get cvPjFmtSrt => 'Subtítulos SRT';

  @override
  String get cvPjFmtVtt => 'Subtítulos WebVTT';

  @override
  String get cvPjFmtTxt => 'Texto sin formato (TXT)';

  @override
  String get cvPjFmtCsv => 'Hoja de cálculo (CSV)';

  @override
  String cvPjStTotal(String n) {
    return '$n archivos';
  }

  @override
  String cvPjStDone(String n) {
    return '$n completados';
  }

  @override
  String cvPjStErr(String n) {
    return '$n con error';
  }

  @override
  String cvPjStActive(String n) {
    return '$n convirtiéndose';
  }

  @override
  String cvPjStSpeech(String n) {
    return '$n transcribiéndose';
  }

  @override
  String cvPjStOut(String size) {
    return 'Resultado: $size';
  }

  @override
  String cvPjStConc(String n) {
    return 'A la vez: $n';
  }

  @override
  String get cvPjFinished => 'Conversión finalizada';

  @override
  String cvPjFinishedSub(String done, String err, String total) {
    return '$done/$total archivos completados · $err con error';
  }

  @override
  String get cvStPending => 'Pendiente';

  @override
  String get cvStQueued => 'En cola';

  @override
  String get cvStConverting => 'Convirtiendo';

  @override
  String get cvStDone => 'Completado';

  @override
  String get cvStError => 'Error';

  @override
  String get cvStCanceled => 'Cancelado';

  @override
  String get cvMainBalloonTitle => 'Convert Master sigue en ejecución';

  @override
  String get cvMainBalloonBody =>
      'Haz clic en el icono de la bandeja para volver a abrir la ventana.';

  @override
  String get cvMainTrayShow => 'Mostrar Convert Master';

  @override
  String get cvMainTrayProjects => 'Proyectos';

  @override
  String get cvMainTrayNone => '(sin proyectos)';

  @override
  String get cvMainTrayQuit => 'Salir';

  @override
  String get cvErrCanceled => 'Cancelado';

  @override
  String get cvErrNoVideo => 'El archivo no tiene pista de vídeo.';

  @override
  String get cvErrNoAudio => 'El archivo no tiene audio.';

  @override
  String get cvPjOcrThis => 'Leer texto (OCR)';

  @override
  String get cvPjReocr => 'Volver a leer el texto (OCR)';

  @override
  String get cvPjNoText => 'Sin texto';

  @override
  String get cvPjNoTextHint => 'No se encontró texto legible en la imagen.';

  @override
  String get cvPjOcrPanel => 'Texto (OCR)';

  @override
  String get cvPjTrLine => 'Línea';

  @override
  String get cvPjTrConf => 'Confianza';

  @override
  String cvPjLines(String n) {
    return '$n líneas';
  }

  @override
  String get cvPjOcrAfter =>
      'El texto de la imagen se leerá cuando se convierta.';

  @override
  String get cvPjOcrOff =>
      'El OCR está desactivado en este proyecto. Puedes ejecutarlo ahora para esta imagen.';

  @override
  String cvPjOcrRunning(String p) {
    return 'Leyendo texto… $p %';
  }

  @override
  String get cvPjCopyAll => 'Copiar todo';

  @override
  String get cvPjCopied => 'Texto copiado al portapapeles';

  @override
  String cvOcrDl(String lang) {
    return 'Descargando datos de idioma para OCR: $lang';
  }

  @override
  String get cvOcrNotInstalled => 'Se descarga en el primer uso';

  @override
  String get cvOcrDownloadFailed =>
      'No se pudieron descargar los datos de idioma para OCR';

  @override
  String get cvPfTabOcr => 'OCR';

  @override
  String get cvPfOcrAsk => 'Leer el texto de las imágenes (OCR)';

  @override
  String get cvPfOcrAskHint =>
      'Se extrae el texto de las imágenes: cada línea, su confianza de lectura y el texto aparecen en columnas separadas. Déjalo desactivado si no lo necesitas.';

  @override
  String get cvPfOcrLangs => 'Idioma del texto de las imágenes';

  @override
  String get cvPfOcrLangsHint =>
      'Hasta 6 idiomas; menos idiomas es más rápido y preciso.';

  @override
  String get cvPfOcrData => 'Datos de idioma';

  @override
  String get cvPfOcrNote =>
      'El OCR funciona sin conexión en este equipo (Tesseract); las imágenes nunca se envían a un servidor. Cada idioma se descarga una sola vez en el primer uso.';

  @override
  String cvErrOcr(String msg) {
    return 'No se pudo leer el texto: $msg';
  }

  @override
  String get cvErrUnreadable =>
      'No se pudo leer el archivo (dañado o no compatible).';

  @override
  String get cvErrUnsupported => 'Esta conversión no es compatible.';

  @override
  String cvErrFfmpegMissing(String msg) {
    return 'No se pudo iniciar el motor de conversión (ffmpeg): $msg';
  }

  @override
  String get cvErrEngineMissing =>
      'No se encontró el motor de voz (whisper.cpp).';

  @override
  String cvErrDownload(String msg) {
    return 'Error en la descarga: $msg';
  }

  @override
  String get cvErrNotFound => 'No se encontró el archivo.';

  @override
  String get cvErrAccess => 'Acceso denegado.';

  @override
  String get cvErrBusy => 'Otro programa está usando el archivo.';

  @override
  String get cvErrNoSpace => 'El disco está lleno.';

  @override
  String cvErrFfmpeg(String msg) {
    return 'No se pudo convertir: $msg';
  }

  @override
  String cvErrWhisper(String msg) {
    return 'No se pudo transcribir: $msg';
  }

  @override
  String get cvMainCloseActive =>
      'Hay una conversión en curso. Si cierras la ventana, se detendrá.';

  @override
  String get cvMainCloseAnyway => 'Cerrar de todos modos';

  @override
  String get cvMainCopySuffix => ' (copia)';

  @override
  String get cvMainErrProjectNotFound => 'No se encontró el proyecto';

  @override
  String get cvMainExportTo =>
      'Carpeta a la que copiar los archivos convertidos';

  @override
  String get cvMainPickFile => 'Elige el archivo que quieras convertir';

  @override
  String get cvMainPickFolder => 'Elige la carpeta que quieras convertir';

  @override
  String get cvMainSaveTranscript => 'Guardar texto';

  @override
  String get cvMainUntitled => 'Proyecto sin título';

  @override
  String get sqOp => 'mayor o igual';

  @override
  String get sqOpNotcontains => 'no contiene';

  @override
  String get sqOpNotlike => 'NOT LIKE';

  @override
  String get sqOpNotin => 'no en la lista';

  @override
  String get sqOpIsnull => 'es NULL';

  @override
  String get sqOpIsnotnull => 'no es NULL';

  @override
  String get ipMobScanThis => 'Escanear esta red';

  @override
  String get ipMobDeleteRecord => 'Eliminar registro';

  @override
  String get ipMobNewRecordHere => 'Nuevo registro aquí';

  @override
  String get ipMobNoMatch => 'No se encontraron registros coincidentes.';

  @override
  String ipMobAddresses(int n) {
    return '$n direcciones';
  }

  @override
  String get ipMobAllRecords => 'Todos los registros';

  @override
  String get ipMobSetScan => 'Escaneo';

  @override
  String get ipMobSetPorts => 'Servicios a comprobar';

  @override
  String get ipMobSetPortsHint =>
      'Para cada puerto solo se realiza un intento de conexión TCP estándar. La lista es fija; puede desactivar los que no necesite.';

  @override
  String get ipMobSetSpeed => 'Velocidad';

  @override
  String get ipMobSetConcurrency => 'Conexiones simultáneas';

  @override
  String get ipMobSetConcurrencyHint =>
      'Como máximo 64 intentos de conexión a la vez (límite de diseño).';

  @override
  String get ipMobSetTimeout => 'Tiempo de espera';

  @override
  String get ipMobSetTimeoutHint =>
      'Se espera como máximo 1000 ms por dispositivo.';

  @override
  String get ipMobSetLimitsNote =>
      'IP Tools es solo una herramienta de descubrimiento e inventario: la lista de puertos no puede ampliarse, no se realizan pruebas de vulnerabilidades ni de contraseñas, y solo se escanean direcciones privadas/locales.';

  @override
  String get ipMobMacMobile => 'no disponible en móvil';

  @override
  String get ipMobAliveTcp => 'Respondió a la conexión TCP';

  @override
  String get ipMobAliveName => 'Respondió a la resolución de nombre';

  @override
  String get ipMobOpenInSsh => 'Abrir en SSH Master';

  @override
  String get ipMobOpenInSshNote =>
      'Dirección copiada al portapapeles; péguela en el formulario SSH Master › Nueva conexión.';

  @override
  String get ipMobCopyAddress => 'Copiar dirección';

  @override
  String get ipMobSuggestLocal => 'Red de este dispositivo';

  @override
  String get ipMobSuggestLocalNone => 'No se encontró ninguna red Wi-Fi';

  @override
  String get ipMobPhoneNoMacNote =>
      'En móvil no hay ping ni ARP: la actividad se determina mediante intentos de conexión TCP y resolución de nombres; no se puede mostrar la información de MAC y fabricante.';

  @override
  String get cvMobNotOnMobile => 'No disponible en móvil';

  @override
  String get cvMobSpeechNote =>
      'El reconocimiento de voz se ejecuta en el dispositivo, sin conexión (whisper.cpp); el audio nunca se envía a un servidor. El modelo se descarga una vez en el primer uso (Tiny 75 MB · Base 142 MB · Small 466 MB; se recomienda Wi-Fi) y se gestiona en Ajustes › Modelos de voz.';

  @override
  String get cvMobOcrNote =>
      'El texto desde imagen se procesa en el dispositivo (Google ML Kit); las imágenes nunca se envían a un servidor. Escrituras reconocidas: latina (incluido turco), china, japonesa, coreana y devanagari (hindi). En Android el modelo de reconocimiento viene con la aplicación.';

  @override
  String get cvMobFolderNote =>
      'En móvil no se puede seleccionar una carpeta de origen; los archivos se añaden uno a uno o desde la galería.';

  @override
  String get cvMobConcurrencyHint =>
      'En móvil se convierten como máximo 2 archivos a la vez.';

  @override
  String get cvMobAddFiles => 'Añadir archivos';

  @override
  String get cvMobAddFromGallery => 'Añadir desde la galería';

  @override
  String get cvMobPickFilesHint =>
      'Añada los archivos a convertir; las salidas se guardan en los documentos de la aplicación.';

  @override
  String get cvMobShareOutput => 'Compartir salida';

  @override
  String get cvMobShareAllOutputs => 'Compartir todas las salidas';

  @override
  String get cvMobSourceCopies => 'Copias de origen';

  @override
  String get cvMobModuleSettings => 'Ajustes de Convert Master';

  @override
  String get cvMobDefaultConcurrency =>
      'Archivos convertidos a la vez en proyectos nuevos';

  @override
  String get cvMobStorage => 'Almacenamiento';

  @override
  String get cvMobConversion => 'Conversión';

  @override
  String get cvMobClearOrphans => 'Limpiar archivos de proyectos eliminados';

  @override
  String get cvMobStorageNote =>
      'Los archivos convertidos y las copias de origen se guardan en la carpeta de documentos de la aplicación; nunca salen de su dispositivo.';

  @override
  String get cvMobCleared => 'Limpiado';

  @override
  String get cvMobNoOutputsYet => 'Todavía no hay archivos convertidos.';

  @override
  String cvMobFilesAdded(int n) {
    return '$n archivos añadidos';
  }

  @override
  String get cvMobUnsupportedExt =>
      'No está entre las extensiones de origen de este proyecto';

  @override
  String get cvMobUnsupportedOnMobile => 'No compatible en móvil';

  @override
  String get cvMobLicense =>
      'La conversión de vídeo y audio usa FFmpegKit (LGPL 3.0, sin componentes GPL); la codificación H.264 / H.265 usa el codificador de hardware del dispositivo (iOS VideoToolbox, Android MediaCodec).';

  @override
  String cvMobConverted(int n) {
    return '$n archivos convertidos';
  }

  @override
  String cvMobFilesCount(int n) {
    return '$n archivos';
  }

  @override
  String get sqMobUnsupportedMobile =>
      'Este motor aún no es compatible en móvil';

  @override
  String get sqMobPickFile => 'Elegir';

  @override
  String get sqMobFileCopied =>
      'Archivo copiado al directorio de documentos de la aplicación';

  @override
  String get sqMobSshKeyPaste => 'Pegue una clave PEM o elija desde un archivo';

  @override
  String get sqMobErrHost => 'Se requiere la dirección del servidor';

  @override
  String get sqMobErrFile => 'Elija un archivo de base de datos';

  @override
  String get sqMobErrSshHost =>
      'Se requieren el servidor SSH y el nombre de usuario';

  @override
  String get sqMobErrSshKey => 'Se requiere la clave privada SSH';

  @override
  String get sqMobSslVerifyNote =>
      'El controlador MySQL no verifica certificados; la opción «verificar» se comporta como «obligatorio».';

  @override
  String get sqMobRowDetail => 'Detalle de la fila';

  @override
  String get sqMobNoResult => 'Sin resultados — empiece con Ejecutar';

  @override
  String get sqMobExportJsonl => 'JSONL (un JSON por línea)';

  @override
  String get sqMobExportNoRows => 'No hay filas para exportar';

  @override
  String get sqMobSettingsTitle => 'Ajustes de SQL Master';

  @override
  String get sqMobRowLimit => 'Límite de filas por consulta';

  @override
  String get sqMobPreviewRows => 'Filas de vista previa de tabla';

  @override
  String get sqMobEditorFont => 'Tamaño de fuente del editor';

  @override
  String get sqMobCopyCell => 'Copiar valor';

  @override
  String get sqMobSelectionRun => 'Ejecutar selección';

  @override
  String get sqMobTunnelOpening => 'Abriendo túnel SSH…';

  @override
  String get sqMobConnectingDb => 'Conectando a la base de datos…';

  @override
  String get sqMobOpEq => '= (igual)';

  @override
  String get sqMobOpNe => '≠ (distinto)';

  @override
  String get sqMobOpLt => '< (menor)';

  @override
  String get sqMobOpGt => '> (mayor)';

  @override
  String get sqMobOpLe => '≤ (menor o igual)';

  @override
  String get npMobSaveAs => 'Guardar como…';

  @override
  String get npMobSaveAsTitle => 'Guardar como';

  @override
  String get npMobDefaultProjectName => 'Proyecto';

  @override
  String get npMobLocalPathExample => 'Documentos/Notepad Master/…';

  @override
  String get npMobReplaceAll => 'Reemplazar todo';

  @override
  String get sqMobDuckExcelNote =>
      'Los archivos Excel (.xlsx) requieren la extensión \"excel\" de DuckDB; si no se puede cargar en este dispositivo, la apertura falla. CSV, Parquet y JSON no necesitan instalación adicional.';

  @override
  String get sqMobDuckExcelUnsupported =>
      'No se pudo abrir el archivo Excel: la extensión \"excel\" de DuckDB no se pudo cargar en este dispositivo. Guarde el archivo como CSV e inténtelo de nuevo.';

  @override
  String get sqMobDuckFileNotFound => 'Archivo no encontrado';

  @override
  String get sqMobDuckNativeMissing =>
      'No se pudo cargar la biblioteca nativa de DuckDB (libduckdb). Es posible que la aplicación se haya compilado sin un binario de DuckDB para esta plataforma.';

  @override
  String get sqMobMssqlNativeMissing =>
      'La biblioteca nativa de SQL Server (FreeTDS libsybdb.so) no está incluida en la aplicación. Debe añadirse el directorio jniLibs de mssql_connection a la compilación de Android.';

  @override
  String get sqMobMssqlConnectFailed =>
      'No se pudo conectar a SQL Server. Compruebe la dirección del servidor, el puerto, el usuario/contraseña y el modo TLS (detalles en \"MssqlClient\" en el registro del dispositivo).';

  @override
  String get sqMobMssqlIosUnsupported =>
      'El controlador de SQL Server aún no es compatible con iOS (la biblioteca FreeTDS no está incluida).';

  @override
  String get cvMobSpeechModelFallback =>
      'Este modelo no está disponible en móvil; en este dispositivo se usa el modelo Base. Su elección se aplica en el escritorio.';

  @override
  String get cvMobPerWindowNote =>
      'La versión móvil no informa del idioma detectado; esta opción se aplica en el escritorio.';

  @override
  String get cvMobOcrUnsupported =>
      'No legible en móvil (sin modelo ML Kit); se usa en el escritorio';

  @override
  String get cvMobOcrMax => 'Se pueden seleccionar hasta 6 idiomas.';

  @override
  String get cvMobShareAllTexts => 'Compartir todos los textos';

  @override
  String get cvMobShareText => 'Compartir texto';

  @override
  String get cvMobDeleteText => 'Eliminar texto';

  @override
  String get cvMobCancelText => 'Cancelar tarea de texto';

  @override
  String get cvMobPhaseDownload => 'Descargando modelo de voz';

  @override
  String get cvMobPhaseWav => 'Preparando audio (WAV de 16 kHz)…';

  @override
  String get cvMobPhaseRunSpeech =>
      'Transcribiendo voz… (el tiempo depende de la duración del archivo)';

  @override
  String get cvMobPhaseRunOcr => 'Leyendo texto…';

  @override
  String cvMobTextsCount(int n) {
    return '$n textos';
  }

  @override
  String get cvMobNoTextsYet => 'Aún no hay textos.';

  @override
  String get cvMobSpeechModels => 'Modelos de voz';

  @override
  String get cvMobSpeechModelsNote =>
      'El reconocimiento de voz (whisper.cpp) se ejecuta en este dispositivo; el modelo se descarga en el primer uso y aquí puede descargarlo por adelantado o eliminarlo. Los modelos Medium y Large v3 Turbo no están disponibles en móvil.';

  @override
  String get cvMobTexts => 'Textos (voz / OCR)';

  @override
  String get cvMobOcrSettingsNote =>
      'El texto desde imagen se procesa en el dispositivo con Google ML Kit; se admiten las escrituras latina (incluido turco), china, japonesa, coreana y devanagari. Los modelos de reconocimiento vienen con la aplicación; no se requiere descarga.';

  @override
  String get npMobDocumentsRoot => 'Documentos';

  @override
  String get smMobFiles => 'Archivos';
}
