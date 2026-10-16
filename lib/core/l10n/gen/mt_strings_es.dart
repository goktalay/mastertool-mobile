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
}
