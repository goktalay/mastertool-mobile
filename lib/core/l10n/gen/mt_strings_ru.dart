// ignore: unused_import
import 'package:intl/intl.dart' as intl;

import 'mt_strings.dart';

// ignore_for_file: type=lint

/// The translations for Russian (`ru`).
class MtStringsRu extends MtStrings {
  MtStringsRu([String locale = 'ru']) : super(locale);

  @override
  String get setGeneral => 'Общие';

  @override
  String get setAccount => 'Учётная запись';

  @override
  String get setAbout => 'О программе';

  @override
  String aboutVersion(String version) {
    return 'Версия $version';
  }

  @override
  String get aboutFamily =>
      'Часть семейства Mastertool: SSH Master · FTP Masters · SQL Master · Notepad Master · Convert Master · IP Tools';

  @override
  String get aboutCheckUpdate => 'Проверить обновления';

  @override
  String get aboutChecking => 'Проверка…';

  @override
  String aboutUpToDate(String app) {
    return 'Установлена последняя версия $app.';
  }

  @override
  String aboutCheckFailed(String msg) {
    return 'Не удалось проверить обновления: $msg';
  }

  @override
  String get aboutLicenses => 'Лицензии открытого ПО';

  @override
  String aboutLicensesIntro(String app) {
    return '$app использует следующие компоненты с открытым исходным кодом:';
  }

  @override
  String authErrAppDisabled(String app) {
    return 'Администратор отключил $app для этой учётной записи. Обратитесь к администратору учётной записи.';
  }

  @override
  String authErrWrongApp(String app) {
    return 'Этот сеанс принадлежит другому приложению. Войдите в $app заново.';
  }

  @override
  String get authSignedOut =>
      'Вы вышли из учётной записи в одном из приложений Mastertool на этом компьютере. Войдите снова.';

  @override
  String get authSubtitle => 'Войдите в свою учётную запись';

  @override
  String get authEmail => 'Эл. почта';

  @override
  String get authPassword => 'Пароль';

  @override
  String get authRemember => 'Запомнить меня';

  @override
  String get authForgot => 'Забыли пароль?';

  @override
  String get authNoAccount => 'Нет учётной записи?';

  @override
  String get authRegister => 'Создать учётную запись';

  @override
  String get authSubmit => 'Войти';

  @override
  String get authWorking => 'Вход…';

  @override
  String get authErrRequired => 'Укажите эл. почту и пароль.';

  @override
  String get authErrBadCredentials => 'Неверная эл. почта или пароль.';

  @override
  String get authErrUnverified =>
      'Адрес эл. почты ещё не подтверждён. Перейдите по ссылке из письма.';

  @override
  String get authErrSuspended => 'Ваша учётная запись приостановлена.';

  @override
  String get authErrRateLimited =>
      'Слишком много попыток. Повторите через минуту.';

  @override
  String get authErrOffline =>
      'Сервер недоступен. Проверьте подключение к интернету.';

  @override
  String get authErrSessionExpired =>
      'Сеанс истёк или пароль был изменён. Войдите снова.';

  @override
  String authErrServer(String msg) {
    return 'Не удалось войти: $msg';
  }

  @override
  String get acctSection => 'Учётная запись и синхронизация';

  @override
  String acctSignedInAs(String email) {
    return 'Вы вошли как $email';
  }

  @override
  String get acctSyncToggle => 'Синхронизировать подключения через веб';

  @override
  String get acctSyncHint =>
      'Подключения, папки и ярлыки сохраняются в вашей учётной записи со сквозным шифрованием; сервер не может их прочитать. Настройки устройства, например размер шрифта и трей, не передаются.';

  @override
  String acctLastSync(String time) {
    return 'Последняя синхронизация: $time';
  }

  @override
  String get acctNever => 'Ещё не синхронизировано';

  @override
  String get acctSyncNow => 'Синхронизировать сейчас';

  @override
  String get acctDeleteRemote => 'Удалить копию на сервере';

  @override
  String get acctDeleteRemoteMsg =>
      'Зашифрованная копия библиотеки в вашей учётной записи будет удалена, а синхронизация отключена. Подключения на этом компьютере не удаляются.';

  @override
  String get acctDeleteRemoteDone =>
      'Копия на сервере удалена; синхронизация отключена';

  @override
  String get acctLogout => 'Выйти';

  @override
  String get acctLogoutMsg =>
      'Вы выйдете из аккаунта. Подключения и проекты на этом устройстве сохранятся.';

  @override
  String get acctMyAccount => 'Моя учётная запись (веб)';

  @override
  String get acctBackupNotice =>
      'Выполнен вход в другую учётную запись; прежние подключения на этом компьютере сохранены в резервную копию.';

  @override
  String get syncOff => 'Синхронизация отключена';

  @override
  String get syncSyncing => 'Синхронизация…';

  @override
  String get syncOffline =>
      'Нет сети — изменения будут отправлены после подключения';

  @override
  String get syncErrDecrypt =>
      'Не удалось расшифровать копию на сервере ключом этой учётной записи; подключения на этом компьютере сохранены.';

  @override
  String get syncErrTooLarge =>
      'Библиотека превышает предел 5 МБ и не может быть синхронизирована.';

  @override
  String syncError(String msg) {
    return 'Ошибка синхронизации: $msg';
  }

  @override
  String get commonCancel => 'Отмена';

  @override
  String get commonSave => 'Сохранить';

  @override
  String get commonCreate => 'Создать';

  @override
  String get commonOk => 'ОК';

  @override
  String get commonDelete => 'Удалить';

  @override
  String get commonGiveUp => 'Отмена';

  @override
  String get commonOpen => 'Открыть';

  @override
  String get commonEdit => 'Изменить';

  @override
  String get commonRename => 'Переименовать';

  @override
  String get commonRefresh => 'Обновить';

  @override
  String get commonNewFolder => 'Новая папка';

  @override
  String get commonCopyPath => 'Копировать путь';

  @override
  String get commonMove => 'Переместить';

  @override
  String get commonMoveEllipsis => 'Переместить…';

  @override
  String get commonShow => 'Показать';

  @override
  String get commonChoose => 'Обзор…';

  @override
  String get commonConnect => 'Подключиться';

  @override
  String get commonNew => 'Новое';

  @override
  String get commonCopy => 'Копировать';

  @override
  String get commonPaste => 'Вставить';

  @override
  String commonLocation(String path) {
    return 'Расположение: $path';
  }

  @override
  String get commonNewName => 'Новое имя';

  @override
  String get commonFolderName => 'Имя папки';

  @override
  String get setTitle => 'Настройки';

  @override
  String get setAppearance => 'Внешний вид';

  @override
  String get setTheme => 'Тема';

  @override
  String get setThemeDark => 'Ночь';

  @override
  String get setThemeLight => 'День';

  @override
  String get setThemeSystem => 'Как в системе';

  @override
  String get setLanguage => 'Язык';

  @override
  String get setLanguageHint => 'Язык применяется сразу.';

  @override
  String get setSaved => 'Настройки сохранены';

  @override
  String get mobModules => 'Модули';

  @override
  String get mobDisabled => 'Отключено в вашем аккаунте';

  @override
  String get mobSoon => 'Этот модуль готовится';

  @override
  String get mobOpen => 'Открыть';

  @override
  String get mobRefresh => 'Обновить';

  @override
  String get mobSettings => 'Настройки';

  @override
  String mobWelcome(String name) {
    return 'Добро пожаловать, $name';
  }

  @override
  String get mobNoModules =>
      'Не удалось загрузить модули. Проверьте подключение и обновите.';

  @override
  String get mobSite => 'mastertool.download';

  @override
  String get mobLangSystem => 'Язык системы';

  @override
  String get mobSsoHint =>
      'Достаточно войти один раз: SSH Master, FTP Masters, SQL Master, Notepad Master, Convert Master и IP Tools открываются внутри этого приложения.';

  @override
  String mobOpenCount(String open, String total) {
    return 'Активно модулей: $open/$total';
  }

  @override
  String get mobModulesHint => 'Нажмите, чтобы открыть';

  @override
  String get mobTapToOpen => 'Готово к работе';

  @override
  String get mobVisitSite => 'Открыть сайт';

  @override
  String get smAppSearchPh => 'Поиск подключений…  (Ctrl+F)';

  @override
  String get smAppNewConn => 'Новое подключение';

  @override
  String smAppSplit(String n) {
    return 'Открыть разделённо ($n)';
  }

  @override
  String get smAppSplitTitle =>
      'Открыть выбранные подключения разделённо в одном окне';

  @override
  String get smAppSettings => 'Настройки';

  @override
  String smAppStats(String c, String f) {
    return 'Подключений: $c · папок: $f';
  }

  @override
  String get smAppWelcome => 'Добро пожаловать';

  @override
  String smAppResults(String q) {
    return 'Результаты для «$q»';
  }

  @override
  String get smAppAll => 'Все подключения';

  @override
  String get smAppWelcomeHint =>
      'Создайте первое SSH-подключение.<br>Укажите данные сервера, проверьте и сохраните.';

  @override
  String get smAppFolders => 'Папки';

  @override
  String get smAppConnections => 'Подключения';

  @override
  String get smAppMultiHint =>
      'Ctrl+щелчок — выбрать несколько и открыть их разделённо в одном окне';

  @override
  String get smAppNoMatch => 'Подходящих подключений нет.';

  @override
  String smAppFolderCount(String n) {
    return 'Подключений: $n';
  }

  @override
  String get smAppFolderOpenSplit => 'Открыть подключения папки разделённо';

  @override
  String get smAppNewConnHere => 'Новое подключение в этой папке';

  @override
  String get smAppNewSubfolder => 'Создать вложенную папку';

  @override
  String get smAppKeyTag => 'Ключ';

  @override
  String get smAppLastDir => 'Последняя папка';

  @override
  String get smAppLastDirTag => 'последняя папка';

  @override
  String smAppMultiOpenSplit(String n) {
    return 'Открыть $n подключений разделённо в одном окне';
  }

  @override
  String get smAppOpenSeparate => 'Открыть каждое в отдельном окне';

  @override
  String get smAppClearSelection => 'Снять выделение';

  @override
  String get smAppSideBySide => 'Открыть два сеанса рядом';

  @override
  String get smAppDuplicate => 'Создать копию';

  @override
  String get smAppMoveToFolder => 'Переместить в папку…';

  @override
  String get smAppResetLastDir => 'Сбросить последнюю папку';

  @override
  String get smAppConnMoved => 'Подключение перемещено';

  @override
  String get smAppFolderIntoSelf =>
      'Папку нельзя переместить в её собственную вложенную папку';

  @override
  String get smAppFolderPh => 'напр. Рабочие серверы';

  @override
  String get smAppRenameFolder => 'Переименовать папку';

  @override
  String get smAppDeleteFolder => 'Удалить папку';

  @override
  String smAppDeleteFolderMsg(String name) {
    return 'Папка <b>$name</b> будет удалена.';
  }

  @override
  String smAppDeleteFolderConns(String n) {
    return ' Её подключения ($n) не удаляются, а перемещаются на уровень выше.';
  }

  @override
  String get smAppRootFolder => 'Все подключения (корень)';

  @override
  String smAppMoveTitle(String name) {
    return 'Переместить «$name»';
  }

  @override
  String get smAppTargetFolder => 'Целевая папка';

  @override
  String get smAppDeleteConn => 'Удалить подключение';

  @override
  String smAppDeleteConnMsg(String name, String target) {
    return '<b>$name</b> ($target) будет удалено безвозвратно.';
  }

  @override
  String get smAppMaxPanes => 'Можно открыть не более 6 панелей';

  @override
  String get smAppMaxPanesSub => 'Открыты первые 6 подключений';

  @override
  String get smFormTitleNew => 'Новое SSH-подключение';

  @override
  String get smFormTitleEdit => 'Изменить подключение';

  @override
  String get smFormName => 'Имя подключения';

  @override
  String get smFormNamePh => 'напр. Веб-сервер';

  @override
  String get smFormHost => 'IP-адрес / хост';

  @override
  String get smFormHostPh => '192.168.1.10 или server.com';

  @override
  String get smFormPort => 'Порт';

  @override
  String get smFormUser => 'Имя пользователя';

  @override
  String get smFormAuth => 'Аутентификация';

  @override
  String get smFormPassword => 'Пароль';

  @override
  String get smFormPrivateKey => 'Закрытый ключ';

  @override
  String get smFormPwSaved => '•••••••• (сохранён — введите для изменения)';

  @override
  String get smFormKeyFile => 'Файл ключа';

  @override
  String get smFormPassphrase => 'Парольная фраза ключа (если есть)';

  @override
  String get smFormPassSaved => '•••••••• (сохранена)';

  @override
  String get smFormPassEmpty => 'Оставьте пустым, если её нет';

  @override
  String get smFormFolder => 'Папка';

  @override
  String get smFormColor => 'Цвет';

  @override
  String get smFormPalette => 'Цветовая схема консоли';

  @override
  String get smFormLastDir => 'Открывать папку, в которой я остановился';

  @override
  String get smFormLastDirHint =>
      'При подключении терминал и файловый менеджер открываются в папке, где вы работали в последний раз.';

  @override
  String get smFormLastDirNow => 'Сейчас:';

  @override
  String get smFormConnecting => 'Подключение…';

  @override
  String get smFormTestOk => 'Подключение установлено';

  @override
  String smFormHostKey(String fp) {
    return 'Ключ хоста (SHA256): $fp';
  }

  @override
  String get smFormTestFail => 'Не удалось подключиться';

  @override
  String get smFormSaved => 'Подключение сохранено';

  @override
  String get smFormChangesSaved => 'Изменения сохранены';

  @override
  String get smFormTest => 'Проверить подключение';

  @override
  String get smFormSaveConnect => 'Сохранить и подключиться';

  @override
  String get smPaneToggleSidebar => 'Показать/скрыть боковую панель (Ctrl+B)';

  @override
  String get smPaneDefaultName => 'Подключение';

  @override
  String get smPaneSplitRight => 'Разделить вправо';

  @override
  String get smPaneSplitDown => 'Разделить вниз';

  @override
  String get smPaneReconnect => 'Переподключиться';

  @override
  String get smPaneClose => 'Закрыть панель';

  @override
  String get smPaneSaveSelShortcut => 'Сохранить выделение как ярлык';

  @override
  String get smPanePaletteMenu => 'Цветовая схема консоли…';

  @override
  String get smPaneSelectAll => 'Выделить всё';

  @override
  String get smPaneClear => 'Очистить экран';

  @override
  String get smPaneStatusConnecting => 'подключение…';

  @override
  String get smPaneStatusNoConn => 'нет подключения';

  @override
  String get smPaneStatusClosed => 'подключение закрыто';

  @override
  String get smTermConnecting => 'Подключение…';

  @override
  String get smTermConnectFailed => 'Не удалось подключиться:';

  @override
  String get smTermRetryEnter => 'Нажмите Enter, чтобы повторить.';

  @override
  String get smTermClosed => 'Подключение закрыто.';

  @override
  String get smTermReconnectEnter => 'Нажмите Enter, чтобы переподключиться.';

  @override
  String smTermMaxPanes(String n) {
    return 'В одном окне можно открыть не более $n панелей';
  }

  @override
  String smTermSessions(String n) {
    return 'Сеансов: $n';
  }

  @override
  String get smTermToggleAll => 'Показать/скрыть все боковые панели';

  @override
  String get smTermSplitRightTitle =>
      'Разделить активную панель вправо (Ctrl+Shift+E)';

  @override
  String get smTermSplitDownTitle =>
      'Разделить активную панель вниз (Ctrl+Shift+O)';

  @override
  String get smTermSyncOn => 'Ввод во все панели';

  @override
  String get smTermSyncOff => 'Вводить во все панели';

  @override
  String get smTermSyncTitle =>
      'Вводимый текст отправляется во все подключённые панели';

  @override
  String get smPickerSearch => 'Поиск подключения…';

  @override
  String get smPickerSameServer => 'тот же сервер';

  @override
  String get smPickerNone => 'Подходящих подключений нет';

  @override
  String get smPickerTitleRight => 'Разделить вправо — выберите подключение';

  @override
  String get smPickerTitleDown => 'Разделить вниз — выберите подключение';

  @override
  String get smPaletteTitle => 'Цветовая схема консоли';

  @override
  String smPaletteHint(String name) {
    return 'Выбранная схема сразу показывается в этой панели. Если сохранить её, она будет использоваться во всех сеансах этого подключения ($name).';
  }

  @override
  String get smPaletteSaved => 'Цветовая схема сохранена';

  @override
  String get smScTitleNew => 'Новый ярлык';

  @override
  String get smScTitleEdit => 'Изменить ярлык';

  @override
  String get smScName => 'Имя ярлыка';

  @override
  String get smScNamePh => 'напр. Перезапустить Nginx';

  @override
  String get smScCommand => 'Команда';

  @override
  String get smScEnter => 'Нажимать Enter после вставки';

  @override
  String get smScEnterHint =>
      'Если выключено, команда только вводится в позиции курсора, а запускаете её вы.';

  @override
  String get smScEmpty =>
      'Ярлыков пока нет.<br>Добавьте часто используемые команды кнопкой <b>+</b> и вставляйте их в терминал двойным щелчком.';

  @override
  String get smScItemTitle => 'Двойной щелчок: вставить в терминал этой панели';

  @override
  String get smScAutoEnter => 'Авто-Enter';

  @override
  String get smScPaste => 'Вставить в терминал';

  @override
  String get smScPasteNoEnter => 'Вставить без Enter';

  @override
  String get smScPasteRun => 'Вставить и выполнить';

  @override
  String get smScCopy => 'Копировать в буфер обмена';

  @override
  String get smScNew => 'Новый ярлык';

  @override
  String get smSbShortcuts => 'Ярлыки';

  @override
  String get smSbAddShortcut => 'Добавить ярлык';

  @override
  String get smSbServer => 'Сервер';

  @override
  String smSbServerHost(String host) {
    return 'Сервер · $host';
  }

  @override
  String get smSbFollow => 'Следовать за папкой терминала';

  @override
  String get smSbHome => 'Домашняя папка';

  @override
  String get smSbUp => 'Родительская папка';

  @override
  String get smSbComputer => 'Этот компьютер';

  @override
  String get smSbPlaces => 'Диски и расположения';

  @override
  String get smSbResize => 'Перетащите, чтобы изменить ширину';

  @override
  String get smFmLoading => 'Загрузка…';

  @override
  String smFmOpenFailed(String msg) {
    return 'Не удалось открыть: $msg';
  }

  @override
  String get smFmEmpty => 'Папка пуста';

  @override
  String get smFmNoConn => 'Нет подключения.';

  @override
  String get smFmClosed => 'Подключение закрыто.';

  @override
  String get smFmWaiting => 'Ожидание подключения…';

  @override
  String smFmDownloadTo(String path) {
    return 'Скачать → $path';
  }

  @override
  String smFmUploadTo(String path) {
    return 'Загрузить → $path';
  }

  @override
  String get smFmServer => 'сервер';

  @override
  String get smFmCdHere => 'Перейти в эту папку в терминале';

  @override
  String get smFmPastePath => 'Вставить путь в терминал';

  @override
  String smFmDeleteWhat(String what) {
    return 'Удалить ($what)';
  }

  @override
  String smFmNItems(String n) {
    return 'объектов: $n';
  }

  @override
  String get smFmOpenDefault => 'Открыть приложением по умолчанию';

  @override
  String get smFmReveal => 'Показать в Проводнике';

  @override
  String get smFmOpenExplorer => 'Открыть в Проводнике';

  @override
  String get smFmFollowing => 'Файловый менеджер следует за папкой терминала';

  @override
  String get smFmFollowOff => 'Следование отключено';

  @override
  String get smFmNewRemote => 'Новая папка на сервере';

  @override
  String get smFmDeleteTitle => 'Удалить с сервера';

  @override
  String smFmAndMore(String n) {
    return ' и ещё $n';
  }

  @override
  String smFmDeleteMsg(String names) {
    return '$names будут <b>безвозвратно</b> удалены с сервера. Папки удаляются вместе с содержимым.';
  }

  @override
  String get smPlaceDesktop => 'Рабочий стол';

  @override
  String get smPlaceDownloads => 'Загрузки';

  @override
  String get smPlaceDocuments => 'Документы';

  @override
  String get smPlaceHome => 'Папка пользователя';

  @override
  String smPlaceDrive(String d) {
    return 'Локальный диск ($d)';
  }

  @override
  String get smErrNoConn => 'Нет подключения';

  @override
  String get smErrConnectFirst => 'Сначала подключитесь к серверу';

  @override
  String get smErrMkdir => 'Не удалось создать папку';

  @override
  String get smErrRename => 'Не удалось переименовать';

  @override
  String smErrDelete(String name) {
    return 'Не удалось удалить: $name';
  }

  @override
  String get smTrPanelTitle => 'Передачи';

  @override
  String get smTrClearDone => 'Убрать завершённые';

  @override
  String get smTrQueued => 'В очереди';

  @override
  String get smTrScanning => 'Сканирование файлов…';

  @override
  String smTrFileCount(String i, String n) {
    return 'Файлы: $i / $n';
  }

  @override
  String smTrEta(String time) {
    return 'осталось ~$time';
  }

  @override
  String smTrDownloading(String name) {
    return 'Скачивание: $name';
  }

  @override
  String smTrUploading(String name) {
    return 'Загрузка: $name';
  }

  @override
  String get smTrDone => 'Завершено';

  @override
  String get smTrCancelled => 'Отменено';

  @override
  String get smTrFailed => 'Ошибка';

  @override
  String get smTrRemoveFromList => 'Убрать из списка';

  @override
  String get smTrAlwaysBackground =>
      'В дальнейшем всегда выполнять крупные передачи в фоне';

  @override
  String get smTrShowInBackground => 'Продолжить в фоне';

  @override
  String get smTrDownloadDone => 'Скачивание завершено';

  @override
  String get smTrUploadDone => 'Загрузка завершена';

  @override
  String smTrDownloadFailed(String name) {
    return 'Не удалось скачать: $name';
  }

  @override
  String smTrUploadFailed(String name) {
    return 'Не удалось загрузить: $name';
  }

  @override
  String get smTrCancelledToast => 'Передача отменена';

  @override
  String smTimeHm(String h, String m) {
    return '$h ч $m мин';
  }

  @override
  String smTimeMs(String m, String s) {
    return '$m мин $s с';
  }

  @override
  String smTimeS(String s) {
    return '$s с';
  }

  @override
  String get smMainErrAuth =>
      'Ошибка аутентификации: неверное имя пользователя или пароль.';

  @override
  String get smMainErrRefused =>
      'В подключении отказано: порт закрыт или служба SSH не запущена.';

  @override
  String get smMainErrTimeout => 'Время ожидания истекло: сервер недоступен.';

  @override
  String get smMainErrDns => 'Не удалось разрешить имя хоста (DNS).';

  @override
  String get smMainErrUnreach => 'Сервер недоступен по сети.';

  @override
  String get smMainErrKeyFile => 'Файл ключа не найден.';

  @override
  String smMainErrHostKey(String newFp, String oldFp) {
    return 'Ключ хоста сервера изменился! Сохранённый: $oldFp, полученный: $newFp. Подключение отклонено из соображений безопасности.';
  }

  @override
  String get smMainErrConnNotFound => 'Подключение не найдено';

  @override
  String get smMainErrNoSession => 'Нет активного SSH-сеанса';

  @override
  String get smMainErrHostUser => 'Укажите адрес сервера и имя пользователя.';

  @override
  String get smMainTrayShow => 'Показать SSH Master';

  @override
  String get smMainTrayQuick => 'Быстрое подключение';

  @override
  String get smMainTrayNone => 'Нет сохранённых подключений';

  @override
  String get smMainTrayQuit => 'Выход';

  @override
  String get smMainBalloonTitle => 'SSH Master работает в фоне';

  @override
  String get smMainBalloonBody =>
      'Щёлкните значок в трее, чтобы открыть его снова.';

  @override
  String get smMainPickKey => 'Выберите файл закрытого ключа';

  @override
  String get smMainCopySuffix => ' (копия)';

  @override
  String get smMainDefDisk => 'Использование диска';

  @override
  String get smMainDefMem => 'Память';

  @override
  String get smMainDefTop => 'Процессы (top)';

  @override
  String get smAppNotesLabel => 'Заметки';

  @override
  String get fmAppSearchPh => 'Поиск сайтов…  (Ctrl+F)';

  @override
  String get fmAppNewConn => 'Новый сайт';

  @override
  String get fmAppSettings => 'Настройки';

  @override
  String fmAppStats(String c, String f) {
    return 'Сайтов: $c · папок: $f';
  }

  @override
  String get fmAppWelcome => 'Добро пожаловать';

  @override
  String fmAppResults(String q) {
    return 'Результаты по запросу «$q»';
  }

  @override
  String get fmAppAll => 'Все сайты';

  @override
  String get fmAppWelcomeHint =>
      'Создайте свой первый FTP / SFTP сайт.<br>Укажите данные сервера, проверьте подключение и сохраните.';

  @override
  String get fmAppFolders => 'Папки';

  @override
  String get fmAppConnections => 'Сайты';

  @override
  String get fmAppDblHint => 'Дважды щёлкните карточку, чтобы подключиться';

  @override
  String get fmAppNoMatch => 'Подходящих сайтов нет.';

  @override
  String fmAppFolderCount(String n) {
    return 'Сайтов: $n';
  }

  @override
  String get fmAppNewConnHere => 'Новый сайт в этой папке';

  @override
  String get fmAppNewSubfolder => 'Новая подпапка';

  @override
  String get fmAppKeyTag => 'Ключ';

  @override
  String get fmAppLastDir => 'Последняя папка';

  @override
  String get fmAppLastDirTag => 'последняя папка';

  @override
  String get fmAppDuplicate => 'Дублировать';

  @override
  String get fmAppMoveToFolder => 'Переместить в папку…';

  @override
  String get fmAppResetLastDir => 'Сбросить последнюю папку';

  @override
  String get fmAppConnMoved => 'Сайт перемещён';

  @override
  String get fmAppFolderIntoSelf => 'Папку нельзя переместить в саму себя';

  @override
  String get fmAppFolderPh => 'напр. Клиенты';

  @override
  String get fmAppRenameFolder => 'Переименовать папку';

  @override
  String get fmAppDeleteFolder => 'Удалить папку';

  @override
  String fmAppDeleteFolderMsg(String name) {
    return 'Удалить папку <b>$name</b>?';
  }

  @override
  String fmAppDeleteFolderConns(String n) {
    return '<br>Сайты из неё ($n) будут перемещены в родительскую папку.';
  }

  @override
  String get fmAppRootFolder => 'Верхний уровень (без папки)';

  @override
  String fmAppMoveTitle(String name) {
    return 'Переместить «$name»';
  }

  @override
  String get fmAppTargetFolder => 'Целевая папка';

  @override
  String get fmAppDeleteConn => 'Удалить сайт';

  @override
  String fmAppDeleteConnMsg(String name, String target) {
    return 'Удалить сайт <b>$name</b> ($target)?';
  }

  @override
  String get fmFormTitleNew => 'Новый сайт';

  @override
  String fmFormTitleEdit(String name) {
    return 'Свойства сайта: $name';
  }

  @override
  String get fmFormTabGeneral => 'Общие';

  @override
  String get fmFormTabActions => 'Действия';

  @override
  String get fmFormTabType => 'Тип';

  @override
  String get fmFormTabOptions => 'Параметры';

  @override
  String get fmFormName => 'Название';

  @override
  String get fmFormNamePh => 'напр. Сайт компании';

  @override
  String get fmFormHost => 'Адрес хоста';

  @override
  String get fmFormHostPh => 'ftp.example.com или 192.168.1.10';

  @override
  String get fmFormPort => 'Порт';

  @override
  String get fmFormUser => 'Имя пользователя';

  @override
  String get fmFormPassword => 'Пароль';

  @override
  String get fmFormPwSaved => '•••••••• (сохранён, введите для изменения)';

  @override
  String get fmFormLoginMethod => 'Способ входа';

  @override
  String get fmFormLoginNormal => 'Обычный';

  @override
  String get fmFormLoginAnon => 'Анонимный';

  @override
  String get fmFormAuth => 'Аутентификация SFTP';

  @override
  String get fmFormPrivateKey => 'Закрытый ключ';

  @override
  String get fmFormKeyFile => 'Файл закрытого ключа';

  @override
  String get fmFormPassphrase => 'Парольная фраза ключа';

  @override
  String get fmFormPassSaved => '(сохранена)';

  @override
  String get fmFormPassEmpty => 'Оставьте пустым, если её нет';

  @override
  String get fmFormFolder => 'Папка';

  @override
  String get fmFormColor => 'Цвет';

  @override
  String get fmFormComments => 'Комментарии';

  @override
  String get fmFormRemoteDir =>
      'После подключения перейти в эту папку на сервере';

  @override
  String get fmFormLocalDir =>
      'После подключения перейти в эту локальную папку';

  @override
  String get fmFormLocalDirPh => 'напр. C:\\Projects\\site';

  @override
  String get fmFormLastDir => 'Открывать папку, где я остановился';

  @override
  String get fmFormLastDirHint =>
      'Если включено, сайт открывается в папках сервера и компьютера, где вы работали в последний раз (вместо указанных выше).';

  @override
  String get fmFormLastDirNow => 'Сейчас:';

  @override
  String get fmFormCache => 'Кэширование при навигации';

  @override
  String get fmFormCacheSession => 'Использовать кэш в течение сеанса';

  @override
  String get fmFormCacheAlways =>
      'Всегда использовать кэш (пока приложение открыто)';

  @override
  String get fmFormCacheNever =>
      'Не использовать кэш (всегда загружать список заново)';

  @override
  String get fmFormUploadCase =>
      'При загрузке на сервер применять к именам файлов и папок';

  @override
  String get fmFormCasePreserve => 'Сохранять регистр';

  @override
  String get fmFormCaseLower => 'Строчные буквы';

  @override
  String get fmFormCaseUpper => 'Прописные буквы';

  @override
  String get fmFormTest => 'Проверить подключение';

  @override
  String get fmFormSaveConnect => 'Сохранить и подключиться';

  @override
  String get fmFormConnecting => 'Подключение…';

  @override
  String get fmFormTestOk => 'Подключение успешно';

  @override
  String get fmFormTestFail => 'Не удалось подключиться';

  @override
  String fmFormHomeDir(String dir) {
    return 'Начальная папка: $dir';
  }

  @override
  String get fmFormRemoteDirMissing =>
      'Внимание: не удалось открыть папку на сервере.';

  @override
  String fmFormHostKey(String fp) {
    return 'Ключ хоста SSH (SHA256): $fp';
  }

  @override
  String get fmFormSaved => 'Сайт сохранён';

  @override
  String get fmFormChangesSaved => 'Изменения сохранены';

  @override
  String get fmTypeProtocol => 'Протокол';

  @override
  String get fmTypeFtp => 'FTP (стандартный протокол передачи файлов)';

  @override
  String get fmTypeFtpsImplicit => 'FTP через TLS/SSL (неявный, порт 990)';

  @override
  String get fmTypeFtpsSsl => 'FTP через SSL (AUTH SSL, явный)';

  @override
  String get fmTypeFtpsTls => 'FTP через TLS/SSL (AUTH TLS, явный)';

  @override
  String get fmTypeSftp => 'SFTP через SSH2 (Secure Shell)';

  @override
  String get fmTypeNoteFtp =>
      'Использует стандартный протокол FTP для команд и данных без шифрования (открытым текстом).';

  @override
  String get fmTypeNoteFtpsImplicit =>
      'Соединение шифруется TLS/SSL с самого начала (обычно порт 990). Команды и данные защищены.';

  @override
  String get fmTypeNoteFtpsSsl =>
      'Подключается по обычному FTP и переходит к зашифрованному сеансу с помощью AUTH SSL. Команды и данные защищены.';

  @override
  String get fmTypeNoteFtpsTls =>
      'Подключается по обычному FTP и переходит к зашифрованному сеансу с помощью AUTH TLS (самый распространённый вариант FTPS).';

  @override
  String get fmTypeNoteSftp =>
      'Зашифрованная передача файлов по SSH (порт 22). Вход по паролю или закрытому ключу; ключ хоста сохраняется при первом подключении.';

  @override
  String get fmTypeTransferType => 'Тип передачи';

  @override
  String get fmTypeBinary => 'Двоичный';

  @override
  String get fmTypeAscii => 'ASCII (текст)';

  @override
  String get fmTypeAuto => 'Авто (текстовые файлы как ASCII)';

  @override
  String fmTypeUseGlobal(String v) {
    return 'Использовать общую настройку ($v)';
  }

  @override
  String get fmTypeDataConn => 'Соединение для данных';

  @override
  String get fmTypePassive => 'Пассивное (PASV / EPSV)';

  @override
  String get fmTypeTimezone => 'Смещение часового пояса сервера';

  @override
  String get fmTypeTzNone => 'Без смещения';

  @override
  String get fmTypeTzHours => 'ч';

  @override
  String get fmTypeTimezoneHint =>
      'Время файлов в списке сервера сдвигается на эту величину.';

  @override
  String get fmOptSiteOptions => 'Параметры сайта';

  @override
  String get fmOptUseGlobal =>
      'Использовать общие настройки для всех параметров';

  @override
  String get fmOptCustom => 'Использовать собственные настройки сайта';

  @override
  String get fmOptRetry => 'Число повторных попыток';

  @override
  String get fmOptRetryDelay => 'Пауза между попытками (с)';

  @override
  String get fmOptMaxConcurrent => 'Макс. одновременных передач';

  @override
  String get fmOptConflict => 'Если файл с таким именем существует';

  @override
  String get fmOptConflictOverwrite => 'Перезаписать';

  @override
  String get fmOptConflictRename => 'Переименовать (имя (1).ext)';

  @override
  String get fmOptConflictSkip => 'Пропустить';

  @override
  String get fmOptEncoding => 'Кодировка имён файлов';

  @override
  String get fmOptEncAuto => 'Авто';

  @override
  String get fmSiteLocal => 'Мой компьютер';

  @override
  String get fmSiteRemote => 'Сервер';

  @override
  String get fmSiteTransfers => 'Передачи';

  @override
  String get fmSiteToggleLocal => 'Показать/скрыть «Мой компьютер» (Ctrl+B)';

  @override
  String get fmSiteToggleTransfers => 'Показать/скрыть «Передачи» (Ctrl+J)';

  @override
  String get fmSiteReconnect => 'Переподключиться';

  @override
  String get fmSitePlaces => 'Быстрый доступ и диски';

  @override
  String get fmSiteUp => 'Родительская папка (Backspace)';

  @override
  String get fmSiteHome => 'Начальная папка';

  @override
  String get fmSiteColName => 'Имя';

  @override
  String get fmSiteColSize => 'Размер';

  @override
  String get fmSiteColDate => 'Изменён';

  @override
  String get fmSiteLoading => 'Загрузка…';

  @override
  String get fmSiteEmptyDir => 'Эта папка пуста';

  @override
  String get fmSiteDesktop => 'Рабочий стол';

  @override
  String get fmSiteDownloads => 'Загрузки';

  @override
  String get fmSiteDocuments => 'Документы';

  @override
  String get fmSiteHomeDir => 'Папка пользователя';

  @override
  String get fmSiteOpenExplorer => 'Открыть в Проводнике';

  @override
  String get fmSiteOpenFile => 'Открыть в программе по умолчанию';

  @override
  String get fmSiteShowExplorer => 'Показать в Проводнике';

  @override
  String get fmSiteUpload => 'Загрузить на сервер';

  @override
  String fmSiteUploadN(String n) {
    return 'Загрузить на сервер (элементов: $n)';
  }

  @override
  String fmSiteUploadTo(String dir) {
    return 'Куда: $dir';
  }

  @override
  String get fmSiteDownload => 'Скачать';

  @override
  String fmSiteDownloadN(String n) {
    return 'Скачать (элементов: $n)';
  }

  @override
  String fmSiteDownloadTo(String dir) {
    return 'Куда: $dir';
  }

  @override
  String get fmSiteTrash => 'Переместить в корзину';

  @override
  String get fmSiteTrashOk => 'Переместить';

  @override
  String fmSiteTrashOne(String name) {
    return 'Переместить <b>$name</b> в корзину?';
  }

  @override
  String fmSiteTrashMany(String n) {
    return 'Переместить в корзину элементы ($n)?';
  }

  @override
  String get fmSiteMkdirFail => 'Не удалось создать папку';

  @override
  String get fmSiteRenameFail => 'Не удалось переименовать';

  @override
  String get fmSiteDeleteFail => 'Не удалось удалить';

  @override
  String get fmSiteDeleteTitle => 'Удаление с сервера';

  @override
  String fmSiteDelOne(String name) {
    return 'Безвозвратно удалить файл <b>$name</b> с сервера?';
  }

  @override
  String fmSiteDelDirOne(String name) {
    return 'Безвозвратно удалить папку <b>$name</b> со всем содержимым с сервера?';
  }

  @override
  String fmSiteDelMany(String n) {
    return 'Безвозвратно удалить с сервера элементы ($n), включая папки со всем содержимым?';
  }

  @override
  String get fmSiteDeleting => 'Удаление…';

  @override
  String get fmSiteDeleted => 'Удалено';

  @override
  String fmSiteItems(String n) {
    return 'Элементов: $n';
  }

  @override
  String get fmSiteOffline => 'Нет подключения';

  @override
  String fmSiteLimit(String v) {
    return 'Ограничение скорости: $v';
  }

  @override
  String get fmSiteNoLimit => 'Без ограничения скорости';

  @override
  String get fmSiteLimitTitle => 'Задать ограничение скорости';

  @override
  String fmSiteConnectFail(String msg) {
    return 'Не удалось подключиться к серверу: $msg';
  }

  @override
  String get fmSiteConnectFailTitle => 'Ошибка подключения';

  @override
  String get fmSiteStateConnected => 'Подключено';

  @override
  String get fmSiteStateConnecting => 'Подключение…';

  @override
  String get fmSiteStateDisconnected => 'Отключено';

  @override
  String get fmTrColName => 'Имя';

  @override
  String get fmTrColSize => 'Размер';

  @override
  String get fmTrColProgress => 'Ход выполнения';

  @override
  String get fmTrColStatus => 'Состояние';

  @override
  String get fmTrEmpty =>
      'Передач пока нет.\nЩёлкните файл или папку правой кнопкой и выберите «Скачать» / «Загрузить на сервер» или перетащите их между панелями.';

  @override
  String get fmTrQueued => 'В очереди';

  @override
  String get fmTrActive => 'Передаётся';

  @override
  String get fmTrDone => 'Завершено';

  @override
  String fmTrDoneFiles(String n) {
    return 'Завершено файлов: $n';
  }

  @override
  String get fmTrError => 'Ошибка';

  @override
  String get fmTrCancelled => 'Отменено';

  @override
  String get fmTrSkipped => 'Пропущено (существует)';

  @override
  String fmTrScanning(String n) {
    return 'Сканирование… файлов: $n';
  }

  @override
  String get fmTrRetrying => 'Повторная попытка…';

  @override
  String get fmTrCancel => 'Отменить';

  @override
  String get fmTrCancelDir => 'Отменить передачу папки';

  @override
  String get fmTrCancelAll => 'Отменить все передачи';

  @override
  String get fmTrCancelAllMsg =>
      'Отменить все выполняемые и ожидающие передачи?';

  @override
  String get fmTrCancelAllOk => 'Отменить все';

  @override
  String get fmTrRetry => 'Повторить';

  @override
  String get fmTrShowLocal => 'Показать в Проводнике';

  @override
  String get fmTrShowRemote => 'Показать на сервере';

  @override
  String get fmTrCopyError => 'Копировать текст ошибки';

  @override
  String get fmTrRemove => 'Удалить из списка';

  @override
  String get fmTrRemoveRoot => 'Удалить эту передачу из списка';

  @override
  String get fmTrClearDone => 'Очистить завершённые';

  @override
  String fmTrActiveN(String n) {
    return 'Выполняется передач: $n';
  }

  @override
  String get fmTrDownloadDone => 'Скачивание завершено';

  @override
  String get fmTrUploadDone => 'Загрузка на сервер завершена';

  @override
  String fmTrDownloadFailed(String name) {
    return 'Скачивание не завершено: $name';
  }

  @override
  String fmTrUploadFailed(String name) {
    return 'Загрузка на сервер не завершена: $name';
  }

  @override
  String fmTrFailedFiles(String n) {
    return 'Файлов с ошибкой: $n';
  }

  @override
  String get fmMainErrAuth =>
      'Ошибка входа: неверное имя пользователя или пароль.';

  @override
  String get fmMainErrRefused =>
      'В подключении отказано: порт закрыт или сервер не запущен.';

  @override
  String get fmMainErrTimeout => 'Время ожидания истекло: сервер недоступен.';

  @override
  String get fmMainErrDns => 'Не удалось разрешить имя хоста (DNS).';

  @override
  String get fmMainErrUnreach => 'Сервер недоступен в сети.';

  @override
  String get fmMainErrReset => 'Сервер закрыл соединение.';

  @override
  String get fmMainErrNotFound => 'Файл или папка не найдены.';

  @override
  String get fmMainErrPerm => 'Доступ запрещён.';

  @override
  String fmMainErr550(String msg) {
    return 'Сервер отклонил операцию (550): $msg';
  }

  @override
  String get fmMainErr553 => 'Сервер не принял имя файла (553).';

  @override
  String fmMainErrTls(String msg) {
    return 'Ошибка TLS/SSL — проверьте протокол или порт. ($msg)';
  }

  @override
  String fmMainErrHostKey(String newVal, String oldVal) {
    return 'Ключ хоста сервера изменился! Сохранённый: $oldVal, полученный: $newVal. Подключение отклонено в целях безопасности.';
  }

  @override
  String get fmMainErrConnNotFound => 'Сайт не найден';

  @override
  String get fmMainErrNoSession => 'Нет подключения к серверу';

  @override
  String get fmMainErrHost => 'Укажите адрес хоста.';

  @override
  String get fmMainErrUser =>
      'Укажите имя пользователя (или выберите анонимный вход).';

  @override
  String get fmMainPickKey => 'Выберите файл закрытого ключа';

  @override
  String get fmMainCopySuffix => ' (копия)';

  @override
  String get fmMainCloseActive =>
      'Передачи ещё выполняются. Если закрыть это окно, они будут отменены.';

  @override
  String get fmMainCloseAnyway => 'Всё равно закрыть';

  @override
  String get sqAppSearchPh => 'Поиск подключений…  (Ctrl+F)';

  @override
  String get sqAppNewConn => 'Добавить подключение';

  @override
  String get sqAppAddConn => 'Добавить подключение';

  @override
  String get sqAppSettings => 'Настройки';

  @override
  String sqAppStats(String c, String f) {
    return 'Подключений: $c · папок: $f';
  }

  @override
  String get sqAppWelcome => 'Добро пожаловать';

  @override
  String sqAppResults(String q) {
    return 'Результаты для «$q»';
  }

  @override
  String get sqAppAll => 'Все подключения';

  @override
  String get sqAppWelcomeHint =>
      'Подключайтесь к PostgreSQL, SQL Server, MySQL, SQLite или к файлам CSV/Parquet/Excel.<br>Введите параметры, проверьте подключение и сохраните.';

  @override
  String get sqAppFolders => 'Папки';

  @override
  String get sqAppConnections => 'Подключения';

  @override
  String get sqAppDblHint => 'Дважды щёлкните карточку, чтобы открыть';

  @override
  String get sqAppNoMatch => 'Подходящих подключений нет.';

  @override
  String sqAppFolderCount(String n) {
    return 'Подключений: $n';
  }

  @override
  String get sqAppNewConnHere => 'Новое подключение в этой папке';

  @override
  String get sqAppNewSubfolder => 'Новая подпапка';

  @override
  String get sqAppDuplicate => 'Дублировать';

  @override
  String get sqAppMoveToFolder => 'Переместить в папку…';

  @override
  String get sqAppConnMoved => 'Подключение перемещено';

  @override
  String get sqAppFolderIntoSelf => 'Нельзя переместить папку в саму себя';

  @override
  String get sqAppFolderPh => 'например, Клиенты';

  @override
  String get sqAppRenameFolder => 'Переименовать папку';

  @override
  String get sqAppDeleteFolder => 'Удалить папку';

  @override
  String sqAppDeleteFolderMsg(String name) {
    return 'Удалить папку <b>$name</b>?';
  }

  @override
  String sqAppDeleteFolderConns(String n) {
    return '<br>Её подключения ($n) будут перемещены в родительскую папку.';
  }

  @override
  String get sqAppRootFolder => 'Верхний уровень (без папки)';

  @override
  String sqAppMoveTitle(String name) {
    return 'Переместить «$name»';
  }

  @override
  String get sqAppTargetFolder => 'Целевая папка';

  @override
  String get sqAppDeleteConn => 'Удалить подключение';

  @override
  String sqAppDeleteConnMsg(String name, String target) {
    return 'Удалить подключение <b>$name</b> ($target)? Сохранённый пароль также будет удалён.';
  }

  @override
  String get sqAppReadOnlyTag => 'Только чтение';

  @override
  String get sqAppWriteTag => 'Запись';

  @override
  String get sqFormTitleNew => 'Новое подключение';

  @override
  String sqFormTitleEdit(String name) {
    return 'Подключение: $name';
  }

  @override
  String get sqFormTabGeneral => 'Общие';

  @override
  String get sqFormTabSecurity => 'Безопасность';

  @override
  String get sqFormTabSsh => 'SSH-туннель';

  @override
  String get sqFormName => 'Метка (отображаемое имя)';

  @override
  String get sqFormNamePh => 'например, Рабочая база данных';

  @override
  String get sqFormHost => 'Хост';

  @override
  String get sqFormPort => 'Порт';

  @override
  String get sqFormUser => 'Имя пользователя';

  @override
  String get sqFormPassword => 'Пароль';

  @override
  String get sqFormPwSaved => '•••••••• (сохранён, введите для изменения)';

  @override
  String get sqFormDatabase => 'База данных';

  @override
  String get sqFormDatabasePh => 'Оставьте пустым для базы данных по умолчанию';

  @override
  String get sqFormFile => 'Файл базы данных';

  @override
  String get sqFormFilePh => 'C:\\Data\\app.db';

  @override
  String get sqFormSqliteHint =>
      'Файл базы данных SQLite (.db, .sqlite). В режиме только для чтения файл никогда не изменяется.';

  @override
  String get sqFormDuckdbHint =>
      'Выберите файл .duckdb или оставьте пустым (в памяти). Запрашивайте файлы CSV, Parquet, JSON и Excel напрямую: SELECT * FROM \'C:\\data\\sales.csv\'';

  @override
  String get sqFormInMemory => 'В памяти';

  @override
  String get sqFormFolder => 'Папка';

  @override
  String get sqFormColor => 'Цвет';

  @override
  String get sqFormComments => 'Заметки';

  @override
  String get sqFormReadOnly => 'Режим только для чтения';

  @override
  String get sqFormReadOnlyHint =>
      'Рекомендуется. INSERT/UPDATE/DELETE и DDL блокируются до выполнения; их можно разрешить однократно. Если поддерживается, сам сеанс также работает только на чтение.';

  @override
  String get sqFormSavePassword => 'Сохранить пароль';

  @override
  String get sqFormSavePasswordHint =>
      'Пароль хранится только в хранилище ключей ОС (Windows: DPAPI). Если выключено, пароль запрашивается при каждом подключении.';

  @override
  String get sqFormSsl => 'TLS / SSL';

  @override
  String get sqFormSslPrefer =>
      'Предпочтительно (шифрование, если сервер поддерживает)';

  @override
  String get sqFormSslRequire => 'Обязательно (сертификат не проверяется)';

  @override
  String get sqFormSslVerify => 'Обязательно + проверка сертификата';

  @override
  String get sqFormSslDisable => 'Выкл. (без шифрования)';

  @override
  String get sqFormSslHint =>
      'По умолчанию используется TLS; окно подключения предупредит, если сервер его не поддерживает.';

  @override
  String get sqFormSshEnable => 'Подключаться через SSH-туннель';

  @override
  String get sqFormSshHint =>
      'Доступ к базе данных осуществляется через SSH-сервер. Рекомендуется аутентификация по ключу.';

  @override
  String get sqFormSshHost => 'SSH-сервер';

  @override
  String get sqFormSshAuth => 'Аутентификация SSH';

  @override
  String get sqFormSshKey => 'Закрытый ключ';

  @override
  String get sqFormSshAgent => 'Агент (Pageant)';

  @override
  String get sqFormKeyFile => 'Файл закрытого ключа';

  @override
  String get sqFormPassphrase => 'Парольная фраза ключа';

  @override
  String get sqFormPassSaved => '(сохранена)';

  @override
  String get sqFormPassEmpty => 'Оставьте пустым, если нет';

  @override
  String get sqFormSshPassword => 'Пароль SSH';

  @override
  String sqFormHostKey(String fp) {
    return 'Ключ хоста SSH: $fp';
  }

  @override
  String get sqFormTest => 'Проверить подключение';

  @override
  String get sqFormSaveConnect => 'Сохранить и открыть';

  @override
  String get sqFormConnecting => 'Подключение…';

  @override
  String get sqFormTestOk => 'Подключение успешно';

  @override
  String get sqFormTestFail => 'Не удалось подключиться';

  @override
  String sqFormTestDb(String db, String user) {
    return 'База данных: $db · Пользователь: $user';
  }

  @override
  String get sqFormNoTls =>
      'Внимание: подключение не зашифровано (сервер не поддерживает TLS).';

  @override
  String get sqFormSaved => 'Подключение сохранено';

  @override
  String get sqFormChangesSaved => 'Изменения сохранены';

  @override
  String get sqCwObjects => 'Объекты';

  @override
  String get sqCwCollapseAll => 'Свернуть всё';

  @override
  String get sqCwFilterPh => 'Фильтр загруженных объектов…';

  @override
  String get sqCwEmpty => '(пусто)';

  @override
  String get sqCwOpenData => 'Открыть данные';

  @override
  String get sqCwShowDdl => 'Показать DDL';

  @override
  String get sqCwOpenCode => 'Открыть код';

  @override
  String get sqCwSelectSql => 'Сгенерировать SELECT';

  @override
  String get sqCwAddToBuilder => 'Добавить в конструктор запросов';

  @override
  String get sqCwNewSqlHere => 'Новый SQL здесь';

  @override
  String get sqCwCopyName => 'Копировать имя';

  @override
  String get sqCwCopied => 'Скопировано в буфер обмена';

  @override
  String get sqCwNewSql => 'Новый SQL';

  @override
  String get sqCwBuilder => 'Конструктор запросов';

  @override
  String get sqCwReconnect => 'Переподключиться';

  @override
  String get sqCwReadOnly => 'Только чтение';

  @override
  String get sqCwReadWrite => 'Запись вкл.';

  @override
  String get sqCwReadOnlyTip =>
      'Только чтение: DML/DDL требуют подтверждения. Нажмите, чтобы выключить';

  @override
  String get sqCwReadWriteTip =>
      'Запись включена: команды выполняются без подтверждения. Нажмите, чтобы вернуться в режим только для чтения';

  @override
  String get sqCwDisableRo => 'Выключить режим только для чтения?';

  @override
  String get sqCwDisableRoMsg =>
      'Пока это окно открыто, INSERT/UPDATE/DELETE и DDL будут выполняться без запроса.';

  @override
  String get sqCwDisableRoOk => 'Разрешить запись';

  @override
  String get sqCwRoOn => 'Режим только для чтения включён';

  @override
  String get sqCwRoOff => 'Запись разрешена — будьте осторожны';

  @override
  String get sqCwPasswordTitle => 'Требуется пароль';

  @override
  String sqCwPasswordFor(String host, String user) {
    return 'Пароль для $user@$host';
  }

  @override
  String get sqCwNotConnected => 'Нет подключения';

  @override
  String get sqCwConnected => 'Подключено';

  @override
  String get sqCwConnecting => 'Подключение…';

  @override
  String get sqCwNoTls => 'Без шифрования';

  @override
  String get sqCwConnectFailed => 'Не удалось подключиться';

  @override
  String get sqCwRetry => 'Повторить';

  @override
  String get sqCwResetCancel =>
      'Запрос не ответил на отмену; выполняется переподключение.';

  @override
  String get sqCwResetExit =>
      'Подключение к базе данных прервано; выполняется переподключение.';

  @override
  String get sqCwEmptyWorkspace =>
      'Дважды щёлкните таблицу в дереве или нажмите Ctrl+T, чтобы открыть новую вкладку SQL.';

  @override
  String get sqCwCloseTab => 'Закрыть вкладку?';

  @override
  String sqCwCloseTabMsg(String name) {
    return 'SQL во вкладке «$name» не сохранён.';
  }

  @override
  String get sqCwCloseTabOk => 'Закрыть';

  @override
  String get sqTreeTables => 'Таблицы';

  @override
  String get sqTreeViews => 'Представления';

  @override
  String get sqTreeMatviews => 'Материализованные представления';

  @override
  String get sqTreeForeignTables => 'Внешние таблицы';

  @override
  String get sqTreeFunctions => 'Функции';

  @override
  String get sqTreeProcedures => 'Процедуры';

  @override
  String get sqTreeTriggers => 'Триггеры';

  @override
  String get sqTreeSequences => 'Последовательности';

  @override
  String get sqTreeTypes => 'Типы';

  @override
  String get sqTreeColumns => 'Столбцы';

  @override
  String get sqTreeIndexes => 'Индексы';

  @override
  String get sqTreeConstraints => 'Ограничения';

  @override
  String get sqTreeFiles => 'Файлы';

  @override
  String get sqKindTable => 'Таблица';

  @override
  String get sqKindView => 'Представление';

  @override
  String get sqKindMatview => 'Материализованное представление';

  @override
  String get sqKindForeignTable => 'Внешняя таблица';

  @override
  String get sqKindFunction => 'Функция';

  @override
  String get sqKindProcedure => 'Процедура';

  @override
  String get sqKindTrigger => 'Триггер';

  @override
  String get sqKindSequence => 'Последовательность';

  @override
  String get sqKindType => 'Тип';

  @override
  String get sqKindIndex => 'Индекс';

  @override
  String get sqKindConstraint => 'Ограничение';

  @override
  String get sqSqlRun => 'Выполнить';

  @override
  String get sqSqlRunStatement => 'Выполнить оператор';

  @override
  String get sqSqlCancel => 'Отмена';

  @override
  String get sqSqlDatabase => 'База данных';

  @override
  String get sqSqlHistory => 'История';

  @override
  String get sqSqlExport => 'Экспорт';

  @override
  String get sqSqlRunning => 'Выполнение…';

  @override
  String sqSqlDone(String ms) {
    return 'Готово · $ms мс';
  }

  @override
  String sqSqlDoneErrors(String ms, String n) {
    return 'Ошибок: $n · $ms мс';
  }

  @override
  String get sqSqlDdlHint =>
      'Схема изменена: нажмите «Обновить», чтобы перезагрузить дерево.';

  @override
  String get sqSqlPlaceholder =>
      'Введите SQL… Ctrl+Enter: выполнить выделенное/всё · Ctrl+Shift+Enter: оператор под курсором · Ctrl+Space: автодополнение';

  @override
  String sqSqlTabTitle(String n) {
    return 'SQL $n';
  }

  @override
  String get sqSqlHistoryEmpty => 'Для этого подключения истории нет.';

  @override
  String get sqSqlRowsShort => 'строк';

  @override
  String sqResResult(String n) {
    return 'Результат $n';
  }

  @override
  String get sqResMessages => 'Сообщения';

  @override
  String sqResRows(String ms, String n) {
    return 'Строк: $n · $ms мс';
  }

  @override
  String sqResRowsTruncated(String ms, String n) {
    return 'Показаны первые $n строк (лимит) · $ms мс';
  }

  @override
  String get sqResNoRows => 'Нет строк';

  @override
  String sqResAffected(String cmd, String ms, String n) {
    return '$cmd: затронуто строк: $n · $ms мс';
  }

  @override
  String sqResCommand(String cmd, String ms) {
    return '$cmd · $ms мс';
  }

  @override
  String get sqResCancelled => 'Отменено';

  @override
  String get sqGridCopy => 'Копировать';

  @override
  String get sqGridCopyHeaders => 'Копировать с заголовками';

  @override
  String get sqGridExport => 'Экспортировать этот результат…';

  @override
  String get sqDataColumns => 'Столбцы';

  @override
  String sqDataColumnsHidden(String n, String total) {
    return 'Столбцы ($n/$total)';
  }

  @override
  String get sqDataAddFilter => 'Фильтр';

  @override
  String get sqDataLimit => 'Число строк';

  @override
  String sqDataFirstN(String n) {
    return 'Первые $n';
  }

  @override
  String get sqDataAll => 'Все (с лимитом)';

  @override
  String get sqDataOpenInEditor => 'Открыть в редакторе SQL';

  @override
  String get sqDataClearFilters => 'Сбросить фильтры';

  @override
  String sqDataRows(String ms, String n) {
    return 'Строк: $n · $ms мс';
  }

  @override
  String sqDataRowsMore(String ms, String n) {
    return 'Первые $n строк · $ms мс';
  }

  @override
  String get sqDataError => 'Не удалось загрузить данные';

  @override
  String get sqDataSortAsc => 'Сортировать по возрастанию';

  @override
  String get sqDataSortDesc => 'Сортировать по убыванию';

  @override
  String get sqDataSortClear => 'Сбросить сортировку';

  @override
  String get sqDataFilterColumn => 'Фильтр по этому столбцу…';

  @override
  String get sqDataHideColumn => 'Скрыть столбец';

  @override
  String get sqDataShowAll => 'Показать все столбцы';

  @override
  String sqDataFilterEq(String v) {
    return 'Равно «$v»';
  }

  @override
  String sqDataFilterNe(String v) {
    return 'Не равно «$v»';
  }

  @override
  String get sqDataFilterNull => 'NULL / не NULL';

  @override
  String get sqDataColumn => 'Столбец';

  @override
  String get sqDataOperator => 'Условие';

  @override
  String get sqDataValue => 'Значение';

  @override
  String get sqDataInHint =>
      'Для «в списке» перечислите значения через запятую.';

  @override
  String get sqDataFilterTitle => 'Фильтр';

  @override
  String get sqDataSelectAll => 'Все';

  @override
  String get sqDataSelectNone => 'Ничего';

  @override
  String get sqOpContains => 'содержит';

  @override
  String get sqOpStarts => 'начинается с';

  @override
  String get sqOpEnds => 'заканчивается на';

  @override
  String get sqOpLike => 'LIKE';

  @override
  String get sqOpIn => 'в списке';

  @override
  String get sqCodeExecute => 'Выполнить';

  @override
  String get sqCodeLoading => 'Загрузка…';

  @override
  String get sqCodeEmpty => 'Определение не найдено';

  @override
  String get sqQbAddTable => 'Добавить таблицу';

  @override
  String get sqQbLimit => 'Лимит';

  @override
  String get sqQbClear => 'Очистить';

  @override
  String get sqQbHint =>
      'Перетащите сюда таблицы из дерева или нажмите «Добавить таблицу». Перетащите столбец на столбец другой таблицы, чтобы создать JOIN.';

  @override
  String get sqQbColumns => 'Столбцы';

  @override
  String get sqQbConditions => 'Условия';

  @override
  String get sqQbResults => 'Результаты';

  @override
  String get sqQbGenerated => 'Сгенерированный SQL';

  @override
  String get sqQbRegenerate => 'Пересоздать по диаграмме';

  @override
  String get sqQbOtherDb =>
      'Конструктор запросов работает с таблицами только одной базы данных.';

  @override
  String get sqQbDragJoin => 'Перетащите на столбец другой таблицы для JOIN';

  @override
  String get sqQbSwapJoin => 'Поменять направление';

  @override
  String get sqQbDeleteJoin => 'Удалить JOIN';

  @override
  String get sqQbNoColumns =>
      'Отметьте столбцы в таблицах (ничего не отмечено = SELECT *).';

  @override
  String get sqQbOutput => 'Показ';

  @override
  String get sqQbColumn => 'Столбец';

  @override
  String get sqQbAlias => 'Псевдоним';

  @override
  String get sqQbAggregate => 'Агрегат';

  @override
  String get sqQbSort => 'Сортировка';

  @override
  String get sqQbAddCondition => 'Добавить условие';

  @override
  String sqQbTabTitle(String n) {
    return 'Запрос $n';
  }

  @override
  String get sqRoTitle => 'Режим только для чтения';

  @override
  String get sqRoMessage =>
      'Это подключение работает в режиме только для чтения. Следующие операторы могут изменить данные или схему:';

  @override
  String get sqRoHint =>
      'Можно разрешить их только для этого запуска; затем режим только для чтения восстановится.';

  @override
  String get sqRoRunOnce => 'Выполнить один раз';

  @override
  String get sqRoNotRun => 'Режим только для чтения: не выполнено';

  @override
  String sqRoBlockedMsg(String n) {
    return 'Режим только для чтения: операторов, требующих подтверждения: $n.';
  }

  @override
  String get sqExpTitle => 'Экспорт';

  @override
  String get sqExpHint =>
      'Запрос выполняется повторно без лимита строк, а результаты записываются прямо в файл.';

  @override
  String get sqExpRunning => 'Экспорт…';

  @override
  String sqExpDone(String n) {
    return 'Экспортировано строк: $n';
  }

  @override
  String get sqExpFailed => 'Ошибка экспорта';

  @override
  String get sqErrRefused =>
      'В подключении отказано: порт закрыт или сервер не запущен.';

  @override
  String get sqErrDns => 'Не удалось разрешить имя хоста (DNS).';

  @override
  String get sqErrTimeout => 'Время ожидания истекло: сервер недоступен.';

  @override
  String get sqErrReset => 'Сервер закрыл подключение.';

  @override
  String get sqErrUnreach => 'Сервер недоступен в сети.';

  @override
  String get sqErrSshAuth =>
      'Ошибка входа SSH: неверное имя пользователя, ключ или пароль.';

  @override
  String sqErrTls(String msg) {
    return 'Ошибка TLS/SSL — не удалось проверить сертификат или сервер не поддерживает TLS. ($msg)';
  }

  @override
  String get sqErrHostExit => 'Процесс базы данных неожиданно завершился.';

  @override
  String get sqErrUnknown => 'Неизвестная ошибка';

  @override
  String get sqMainCloseAnyway => 'Всё равно закрыть';

  @override
  String get sqMainCloseRunning =>
      'Запросы ещё выполняются. Если закрыть это окно, они будут отменены.';

  @override
  String get sqMainCopySuffix => ' (копия)';

  @override
  String get sqMainErrConnNotFound => 'Подключение не найдено';

  @override
  String get sqMainErrNoSession => 'У этого окна нет подключения';

  @override
  String sqMainErrKeyFile(String path) {
    return 'Не удалось прочитать файл ключа SSH: $path';
  }

  @override
  String get sqMainTrayShow => 'Показать SQL Master';

  @override
  String get sqMainTrayQuick => 'Быстрое подключение';

  @override
  String get sqMainTrayNone => 'Нет сохранённых подключений';

  @override
  String get sqMainTrayQuit => 'Выход';

  @override
  String get npKindSsh => 'SSH-проект';

  @override
  String get npKindFtp => 'FTP-проект';

  @override
  String get npKindLocal => 'Локальная папка';

  @override
  String get npKindFile => 'Файл проекта';

  @override
  String get npKindSshHint => 'Папка на сервере через SSH (SFTP)';

  @override
  String get npKindFtpHint => 'Сервер FTP, FTPS или SFTP';

  @override
  String get npKindLocalHint => 'Папка на этом компьютере';

  @override
  String get npKindFileHint => 'Редактирование одного файла';

  @override
  String get npAppSearchPh => 'Поиск подключений…  (Ctrl+F)';

  @override
  String get npAppNewConn => 'Новое подключение';

  @override
  String get npAppSettings => 'Настройки';

  @override
  String npAppStats(String c, String f) {
    return 'Подключений: $c · папок: $f';
  }

  @override
  String get npAppWelcome => 'Добро пожаловать';

  @override
  String npAppResults(String q) {
    return 'Результаты для «$q»';
  }

  @override
  String get npAppAll => 'Все подключения';

  @override
  String get npAppWelcomeHint =>
      'Добавьте SSH- или FTP-сервер, локальную папку или отдельный файл.<br>Дважды щёлкните карточку, чтобы открыть проект в отдельном окне.';

  @override
  String get npAppFolders => 'Папки';

  @override
  String get npAppConnections => 'Подключения';

  @override
  String get npAppDblHint => 'Дважды щёлкните карточку, чтобы открыть';

  @override
  String get npAppNoMatch => 'Подходящих подключений нет.';

  @override
  String npAppFolderCount(String n) {
    return 'Подключений: $n';
  }

  @override
  String get npAppNewConnHere => 'Новое подключение в этой папке';

  @override
  String get npAppNewSubfolder => 'Создать вложенную папку';

  @override
  String get npAppKeyTag => 'Ключ';

  @override
  String get npAppDuplicate => 'Создать копию';

  @override
  String get npAppMoveToFolder => 'Переместить в папку…';

  @override
  String get npAppConnMoved => 'Подключение перемещено';

  @override
  String get npAppFolderIntoSelf => 'Папку нельзя переместить в саму себя';

  @override
  String get npAppFolderPh => 'напр. Клиенты';

  @override
  String get npAppRenameFolder => 'Переименовать папку';

  @override
  String get npAppDeleteFolder => 'Удалить папку';

  @override
  String npAppDeleteFolderMsg(String name) {
    return 'Удалить папку <b>$name</b>?';
  }

  @override
  String npAppDeleteFolderConns(String n) {
    return '<br>Её подключения ($n) будут перемещены на уровень выше.';
  }

  @override
  String get npAppRootFolder => 'Верхний уровень (без папки)';

  @override
  String npAppMoveTitle(String name) {
    return 'Переместить «$name»';
  }

  @override
  String get npAppTargetFolder => 'Целевая папка';

  @override
  String get npAppDeleteConn => 'Удалить подключение';

  @override
  String npAppDeleteConnMsg(String name, String target) {
    return 'Удалить подключение <b>$name</b> ($target)?<br>Файлы на сервере или в папке не затрагиваются; удаляются только это подключение и его рабочая копия.';
  }

  @override
  String get npAppNoLocalPath =>
      'Путь на этом компьютере не выбран — он будет запрошен при открытии';

  @override
  String get npAppChangeLocalPath => 'Изменить путь на этом компьютере…';

  @override
  String get npAppOpenTabs => 'Открытые вкладки';

  @override
  String get npAppCustomEditor =>
      'Собственные настройки редактора для подключения';

  @override
  String get npFormTitleNew => 'Новое подключение';

  @override
  String npFormTitleEdit(String name) {
    return 'Подключение: $name';
  }

  @override
  String get npFormTabConn => 'Подключение';

  @override
  String get npFormTabProject => 'Проект';

  @override
  String get npFormTabEditor => 'Редактор (Notepad++)';

  @override
  String get npFormName => 'Имя (отображаемое)';

  @override
  String get npFormNamePh => 'напр. Сайт компании';

  @override
  String get npFormHost => 'Хост';

  @override
  String get npFormHostPh => 'server.example.com или 192.168.1.10';

  @override
  String get npFormPort => 'Порт';

  @override
  String get npFormUser => 'Имя пользователя';

  @override
  String get npFormPassword => 'Пароль';

  @override
  String get npFormPwSaved => '•••••••• (сохранён — введите для изменения)';

  @override
  String get npFormLoginMethod => 'Способ входа';

  @override
  String get npFormLoginNormal => 'Обычный';

  @override
  String get npFormLoginAnon => 'Анонимный';

  @override
  String get npFormAuth => 'Аутентификация SSH';

  @override
  String get npFormPrivateKey => 'Закрытый ключ';

  @override
  String get npFormKeyFile => 'Файл закрытого ключа';

  @override
  String get npFormPassphrase => 'Парольная фраза ключа';

  @override
  String get npFormPassSaved => '(сохранена)';

  @override
  String get npFormPassEmpty => 'Оставьте пустым, если её нет';

  @override
  String get npFormFolder => 'Папка';

  @override
  String get npFormColor => 'Цвет';

  @override
  String get npFormComments => 'Заметки';

  @override
  String get npFormRootDir => 'Папка проекта (на сервере)';

  @override
  String get npFormBrowse => 'Выбрать папку';

  @override
  String get npFormBrowseHint =>
      'Сначала нажмите «Проверить подключение», чтобы просмотреть сервер и выбрать папку. Если поле пустое, открывается папка входа.';

  @override
  String get npFormBrowseTitle => 'Выберите папку на сервере';

  @override
  String get npFormBrowseSelect => 'Выбрать эту папку';

  @override
  String get npFormBrowseEmpty => 'Нет вложенных папок';

  @override
  String get npFormFolderPath => 'Папка';

  @override
  String get npFormFilePath => 'Файл';

  @override
  String get npFormLocalPathHint =>
      'Локальный путь хранится только на этом компьютере; на других компьютерах он запрашивается при первом открытии.';

  @override
  String get npFormCacheNote =>
      'Каждый открытый файл сохраняется вместе со структурой папок в рабочую копию (кэш). При сохранении файл загружается на сервер, а рабочая копия обновляется.';

  @override
  String get npFormRestoreTabs => 'Запоминать открытые вкладки';

  @override
  String get npFormRestoreTabsHint =>
      'В следующий раз проект откроется с теми же файлами (только на этом компьютере).';

  @override
  String get npFormShowHidden => 'Показывать скрытые файлы';

  @override
  String get npFormShowHiddenHint =>
      'Файлы и папки, имена которых начинаются с точки (.env, .htaccess, .git…)';

  @override
  String get npFormExclude => 'Скрывать в дереве';

  @override
  String get npFormExcludeHint =>
      'Имена или шаблоны через запятую; допускаются * и ?.';

  @override
  String get npFormEditorMode => 'Настройки редактора';

  @override
  String get npFormEdGlobal =>
      'Использовать общие настройки редактора (Настройки › Редактор)';

  @override
  String get npFormEdCustom =>
      'Использовать собственные настройки для этого подключения';

  @override
  String get npFormTest => 'Проверить подключение';

  @override
  String get npFormSaveOpen => 'Сохранить и открыть';

  @override
  String get npFormConnecting => 'Подключение…';

  @override
  String get npFormTestOk => 'Подключение установлено';

  @override
  String get npFormTestFail => 'Не удалось подключиться';

  @override
  String npFormHomeDir(String dir) {
    return 'Папка входа: $dir';
  }

  @override
  String get npFormRootMissing => 'Внимание: не удалось открыть папку проекта.';

  @override
  String npFormHostKey(String fp) {
    return 'Ключ хоста SSH (SHA256): $fp';
  }

  @override
  String get npFormSaved => 'Подключение сохранено';

  @override
  String get npFormChangesSaved => 'Изменения сохранены';

  @override
  String get npTypeProtocol => 'Протокол';

  @override
  String get npTypeFtp => 'FTP (стандартный)';

  @override
  String get npTypeFtpsImplicit => 'FTPS — неявный TLS/SSL (порт 990)';

  @override
  String get npTypeFtpsSsl => 'FTPS — явный (AUTH SSL)';

  @override
  String get npTypeFtpsTls => 'FTPS — явный (AUTH TLS)';

  @override
  String get npTypeSftp => 'SFTP — SSH2';

  @override
  String get npTypeNoteFtp =>
      'Обычный FTP; пароль и файлы передаются без шифрования.';

  @override
  String get npTypeNoteFtpsImplicit =>
      'Подключение шифруется TLS/SSL с самого начала (обычно порт 990).';

  @override
  String get npTypeNoteFtpsSsl =>
      'Подключение по обычному FTP с переходом к зашифрованному сеансу командой AUTH SSL.';

  @override
  String get npTypeNoteFtpsTls =>
      'Подключение по обычному FTP с переходом к зашифрованному сеансу командой AUTH TLS (самый распространённый вариант FTPS).';

  @override
  String get npTypeNoteSftp =>
      'Зашифрованный доступ к файлам через SSH (порт 22). Ключ хоста сервера сохраняется при первом подключении.';

  @override
  String get npOptEncoding => 'Кодировка имён файлов';

  @override
  String get npOptEncAuto => 'Авто';

  @override
  String get npEdSecEncoding => 'Кодировка и концы строк';

  @override
  String get npEdEncoding => 'Кодировка при открытии файлов';

  @override
  String get npEdEncAuto => 'Определять автоматически (BOM / UTF-8)';

  @override
  String get npEdFallback => 'Если не UTF-8 (ANSI)';

  @override
  String get npEdEol => 'Концы строк';

  @override
  String get npEdEolAuto => 'Сохранять как в файле';

  @override
  String npEdEolConvert(String eol) {
    return 'Преобразовывать в $eol при открытии';
  }

  @override
  String get npEdNewDoc => 'Новый файл: кодировка · конец строки';

  @override
  String get npEdSecIndent => 'Отступы и язык';

  @override
  String get npEdTabSize => 'Ширина табуляции';

  @override
  String get npEdLanguage => 'Язык (синтаксис)';

  @override
  String get npEdLangAuto => 'Авто (по расширению / первой строке)';

  @override
  String get npEdInsertSpaces => 'Вставлять пробелы вместо табуляции';

  @override
  String get npEdDetectIndent => 'Определять отступы по файлу';

  @override
  String get npEdDetectIndentHint =>
      'В файлах с отступами табуляцией табуляция сохраняется.';

  @override
  String get npEdAutoIndent => 'Автоотступ';

  @override
  String get npEdAutoClose => 'Автоматически закрывать скобки и кавычки';

  @override
  String get npEdSecLook => 'Внешний вид';

  @override
  String get npEdTheme => 'Цветовая тема';

  @override
  String get npEdThemeAuto => 'Авто (как тема приложения)';

  @override
  String get npEdWhitespace => 'Показывать пробелы и табуляцию';

  @override
  String get npEdWsNone => 'Не показывать';

  @override
  String get npEdWsBoundary => 'Все, кроме одиночных пробелов между словами';

  @override
  String get npEdWsTrailing => 'Только в конце строк';

  @override
  String get npEdWsAll => 'Все';

  @override
  String get npEdFont => 'Шрифт';

  @override
  String get npEdFontSize => 'Размер';

  @override
  String get npEdRulers => 'Вертикальные линейки';

  @override
  String get npEdWordWrap => 'Перенос строк';

  @override
  String get npEdLineNumbers => 'Номера строк';

  @override
  String get npEdHighlightLine => 'Подсвечивать текущую строку';

  @override
  String get npEdSmartHighlight => 'Умная подсветка (одинаковые слова)';

  @override
  String get npEdIndentGuides => 'Направляющие отступов';

  @override
  String get npEdFolding => 'Свёртывание кода';

  @override
  String get npEdBracketColors => 'Раскрашивать парные скобки';

  @override
  String get npEdMinimap => 'Мини-карта (карта документа)';

  @override
  String get npEdControlChars => 'Показывать невидимые символы';

  @override
  String get npEdSecSave => 'Сохранение';

  @override
  String get npEdTrimTrailing => 'Удалять пробелы в конце строк при сохранении';

  @override
  String get npEdFinalNewline => 'Добавлять перевод строки в конец файла';

  @override
  String get npEdCheckRemote => 'Проверять изменения перед сохранением';

  @override
  String get npEdCheckRemoteHint =>
      'Спрашивает, если после открытия файл был изменён на сервере кем-то другим.';

  @override
  String get npEdAutoSave => 'Автосохранение';

  @override
  String get npEdSec => 'с';

  @override
  String get npEdAutoSaveHint =>
      '0 = выкл. Если включено, файл сохраняется и загружается на сервер через указанное время после изменения.';

  @override
  String get npMainBalloonTitle => 'Notepad Master работает в фоне';

  @override
  String get npMainBalloonBody =>
      'Щёлкните значок в трее, чтобы открыть его снова.';

  @override
  String get npMainTrayShow => 'Показать Notepad Master';

  @override
  String get npMainTrayQuick => 'Быстрое открытие';

  @override
  String get npMainTrayNone => 'Нет сохранённых подключений';

  @override
  String get npMainTrayQuit => 'Выход';

  @override
  String get npProjToggleTree => 'Показать/скрыть дерево папок (Ctrl+B)';

  @override
  String get npProjReconnect => 'Переподключиться';

  @override
  String get npProjReconnected => 'Подключение восстановлено';

  @override
  String get npProjConnectFail => 'Не удалось подключиться';

  @override
  String get npProjStatusOn => 'Подключено';

  @override
  String get npProjStatusOff => 'Нет подключения';

  @override
  String get npProjStatusConnecting => 'Подключение…';

  @override
  String get npProjSave => 'Сохранить';

  @override
  String get npProjSaveAll => 'Сохранить все';

  @override
  String get npProjUndo => 'Отменить';

  @override
  String get npProjRedo => 'Повторить';

  @override
  String get npProjFind => 'Найти';

  @override
  String get npProjReplace => 'Заменить';

  @override
  String get npProjGoto => 'Перейти к строке';

  @override
  String get npProjShowWs => 'Показывать пробелы и табуляцию';

  @override
  String get npProjZoomIn => 'Увеличить';

  @override
  String get npProjZoomOut => 'Уменьшить';

  @override
  String get npProjShowCache => 'Показать рабочую копию';

  @override
  String get npProjPalette => 'Палитра команд';

  @override
  String get npProjCloseTab => 'Закрыть';

  @override
  String get npProjCloseOthers => 'Закрыть остальные';

  @override
  String get npProjCloseAll => 'Закрыть все';

  @override
  String get npProjReload => 'Перезагрузить';

  @override
  String npProjReloadMsg(String name) {
    return 'Несохранённые изменения в <b>$name</b> будут потеряны. Перезагрузить файл?';
  }

  @override
  String get npProjRevealTree => 'Показать в дереве';

  @override
  String get npProjUnsavedTitle => 'Несохранённые изменения';

  @override
  String npProjUnsavedMsg(String name) {
    return 'Сохранить изменения в <b>$name</b>?';
  }

  @override
  String get npProjDontSave => 'Не сохранять';

  @override
  String npProjOpenFail(String name) {
    return 'Не удалось открыть $name';
  }

  @override
  String npProjTooLarge(String name, String size) {
    return 'Файл $name слишком большой ($size); предел — 50 МБ.';
  }

  @override
  String npProjBinary(String name) {
    return '$name — не текстовый (двоичный) файл; он не открыт в редакторе.';
  }

  @override
  String npProjSaveFail(String name) {
    return 'Не удалось сохранить $name';
  }

  @override
  String npProjSaved(String name) {
    return '$name: сохранено';
  }

  @override
  String npProjSavedRemote(String name) {
    return '$name: сохранено и загружено';
  }

  @override
  String get npProjLossyTitle => 'Предупреждение о кодировке';

  @override
  String npProjLossyMsg(String enc) {
    return 'Некоторые символы нельзя сохранить в кодировке <b>$enc</b>, они будут записаны как «?». Рекомендуется преобразовать файл в UTF-8 через строку состояния.';
  }

  @override
  String get npProjSaveAnyway => 'Всё равно сохранить';

  @override
  String get npProjConflictTitle => 'Файл изменён в другом месте';

  @override
  String npProjConflictMsg(String name) {
    return 'Файл <b>$name</b> был изменён на сервере после того, как вы его открыли. Что сделать?';
  }

  @override
  String get npProjConflictOverwrite => 'Перезаписать';

  @override
  String get npProjConflictReload => 'Загрузить версию с сервера';

  @override
  String npProjConflictAuto(String name) {
    return '$name изменён на сервере; автосохранение пропущено.';
  }

  @override
  String npProjPos(String col, String ln) {
    return 'Стр $ln, стлб $col';
  }

  @override
  String npProjSel(String n) {
    return 'Выделено: $n';
  }

  @override
  String npProjSpaces(String n) {
    return 'Пробелы: $n';
  }

  @override
  String npProjTabWidth(String n) {
    return 'Табуляция: $n';
  }

  @override
  String get npProjIndentToSpaces => 'Преобразовать отступы в пробелы';

  @override
  String get npProjIndentToTabs => 'Преобразовать отступы в табуляцию';

  @override
  String npProjEncTitle(String name) {
    return 'Кодировка: $name';
  }

  @override
  String get npProjEncConvert =>
      'Преобразовать в эту кодировку (при сохранении)';

  @override
  String get npProjEncConvertHint =>
      'Текст не меняется; при сохранении файл записывается в выбранной кодировке.';

  @override
  String get npProjEncReopen => 'Открыть заново в этой кодировке';

  @override
  String get npProjEncReopenHint =>
      'Если символы отображаются неправильно, перечитайте файл в нужной кодировке.';

  @override
  String npProjEolTo(String eol) {
    return 'Преобразовать в $eol';
  }

  @override
  String get npProjLangTitle => 'Выберите язык';

  @override
  String get npProjLangSearch => 'Поиск языка…';

  @override
  String get npProjCacheCopy => 'Рабочая копия';

  @override
  String get npProjInitFail => 'Не удалось запустить окно проекта';

  @override
  String get npProjEmptyHint =>
      'Дважды щёлкните файл в дереве слева — он откроется здесь во вкладке с подсветкой синтаксиса для своего языка.';

  @override
  String get npProjEmptyFile => 'Открытие файла…';

  @override
  String get npTreeNewFile => 'Новый файл';

  @override
  String get npTreeFileName => 'Имя файла';

  @override
  String get npTreeBadName => 'Недопустимое имя';

  @override
  String get npTreeCreateFail => 'Не удалось создать';

  @override
  String get npTreeRenameFail => 'Не удалось переименовать';

  @override
  String get npTreeRenameDirty =>
      'Сначала сохраните открытые файлы из этой папки.';

  @override
  String get npTreeDeleteTitle => 'Удалить';

  @override
  String npTreeDeleteMsg(String name) {
    return 'Удалить файл <b>$name</b>?';
  }

  @override
  String npTreeDeleteDirMsg(String name) {
    return 'Удалить папку <b>$name</b> со всем содержимым?';
  }

  @override
  String get npTreeDeleteFail => 'Не удалось удалить';

  @override
  String get npTreeTrashNote => 'Локальные файлы перемещаются в корзину.';

  @override
  String get npTreeEmpty => 'Пустая папка';

  @override
  String get npTreeCollapseAll => 'Свернуть все';

  @override
  String get npTreeShowExplorer => 'Показать в Проводнике';

  @override
  String get npTreeUp => 'Родительская папка';

  @override
  String get npTreeHome => 'Папка входа';

  @override
  String get npMainErrAuth =>
      'Ошибка входа: неверное имя пользователя или пароль.';

  @override
  String get npMainErrRefused =>
      'В подключении отказано: порт закрыт или сервер не запущен.';

  @override
  String get npMainErrTimeout => 'Время ожидания истекло: сервер недоступен.';

  @override
  String get npMainErrDns => 'Не удалось разрешить имя хоста (DNS).';

  @override
  String get npMainErrUnreach => 'Сервер недоступен по сети.';

  @override
  String get npMainErrReset => 'Сервер разорвал подключение.';

  @override
  String get npMainErrNotFound => 'Файл или папка не найдены.';

  @override
  String get npMainErrPerm => 'Доступ запрещён.';

  @override
  String get npMainErrExists => 'Файл или папка с таким именем уже существует.';

  @override
  String npMainErr550(String msg) {
    return 'Сервер отклонил операцию (550): $msg';
  }

  @override
  String get npMainErr553 => 'Сервер не принял имя файла (553).';

  @override
  String npMainErrTls(String msg) {
    return 'Ошибка TLS/SSL — проверьте протокол или порт. ($msg)';
  }

  @override
  String npMainErrHostKey(String newVal, String oldVal) {
    return 'Ключ хоста сервера изменился! Сохранённый: $oldVal, полученный: $newVal. Подключение отклонено из соображений безопасности.';
  }

  @override
  String get npMainErrNoKey => 'Не удалось прочитать файл закрытого ключа.';

  @override
  String get npMainErrKey =>
      'Не удалось прочитать закрытый ключ: неверная парольная фраза или неподдерживаемый формат.';

  @override
  String get npMainErrNoLocal =>
      'Папка или файл не найдены на этом компьютере. Измените путь через меню карточки в главном окне.';

  @override
  String get npMainErrConnNotFound => 'Подключение не найдено';

  @override
  String get npMainErrNoSession => 'Нет подключения';

  @override
  String get npMainErrHost => 'Укажите адрес хоста.';

  @override
  String get npMainErrUser =>
      'Укажите имя пользователя (или выберите анонимный вход).';

  @override
  String get npMainPickKey => 'Выберите файл закрытого ключа';

  @override
  String get npMainCopySuffix => ' (копия)';

  @override
  String get npMainCloseDirty =>
      'Есть несохранённые файлы. При закрытии окна изменения будут потеряны.';

  @override
  String get npMainCloseDiscard => 'Закрыть без сохранения';

  @override
  String get ipAppNewFolder => 'Новая папка';

  @override
  String get ipAppNewRecord => 'Новая запись';

  @override
  String get ipAppSearchPh => 'Поиск записей, IP, имён, MAC или служб…';

  @override
  String ipAppStats(String n) {
    return 'Записей: $n';
  }

  @override
  String get ipColIp => 'IP';

  @override
  String get ipColMac => 'MAC';

  @override
  String get ipColName => 'Имя';

  @override
  String get ipColRtt => 'Отклик';

  @override
  String get ipColServices => 'Службы';

  @override
  String get ipColStatus => 'Состояние';

  @override
  String get ipColVendor => 'Производитель';

  @override
  String get ipCtxCopyIp => 'Копировать IP-адрес';

  @override
  String get ipCtxCopyMac => 'Копировать MAC-адрес';

  @override
  String get ipCtxCopyName => 'Копировать имя';

  @override
  String get ipCtxCopyRange => 'Копировать диапазон';

  @override
  String get ipCtxOpenWeb => 'Открыть в браузере';

  @override
  String ipFolderDeleteMsg(String name) {
    return 'Папка «$name» будет удалена; её записи и папки переместятся в родительскую папку.';
  }

  @override
  String get ipFolderEmpty => 'Пустая папка';

  @override
  String get ipFolderName => 'Название папки';

  @override
  String get ipFolderRename => 'Переименовать папку';

  @override
  String get ipHostAlive => 'Доступность';

  @override
  String get ipHostBanner => 'Приветствие';

  @override
  String get ipHostCert => 'Сертификат';

  @override
  String get ipHostCertExpires => 'Действителен до';

  @override
  String get ipHostCertIssuer => 'Издатель';

  @override
  String get ipHostDetails => 'Подробности';

  @override
  String get ipHostLocalMac => 'частный адрес';

  @override
  String get ipHostNoServices => 'Ни один порт из списка не открыт.';

  @override
  String get ipHostSelfSigned => 'самоподписанный';

  @override
  String get ipHostServer => 'Сервер';

  @override
  String get ipHostTitle => 'Заголовок';

  @override
  String get ipHostUnknown => '(имя не определено)';

  @override
  String get ipNoticeAccept => 'Понятно';

  @override
  String get ipNoticeBody =>
      'IP Tools исследует только вашу локальную сеть: находит устройства с помощью ping, пробует подключиться к короткому списку портов и определяет их имена. Сканируйте только сети, которыми владеете или на которые у вас есть разрешение.';

  @override
  String get ipNoticeLimits =>
      'По замыслу сканируются только частные адреса (10.x, 172.16–31.x, 192.168.x, 169.254.x); без поиска уязвимостей, подбора паролей и широкого сканирования портов.';

  @override
  String get ipNoticeShort => 'Сканируйте только разрешённые сети';

  @override
  String get ipNoticeText =>
      'Сканируйте только сети, которыми владеете или на которые у вас есть разрешение.';

  @override
  String get ipNoticeTitle => 'Обнаружение локальной сети';

  @override
  String get ipPrivacyNote =>
      'Конфиденциальность: результаты сканирования хранятся только на этом компьютере и никуда не отправляются. Сканируются только частные/локальные адреса.';

  @override
  String get ipRangeErrEmpty => 'Введите диапазон IP.';

  @override
  String ipRangeErrInvalid(String token) {
    return 'Недопустимый адрес или диапазон: $token';
  }

  @override
  String ipRangeErrIpv6(String token) {
    return 'Адреса IPv6 не поддерживаются: $token';
  }

  @override
  String ipRangeErrNotPrivate(String token) {
    return 'Можно сканировать только частные/локальные адреса (10.x, 172.16–31.x, 192.168.x, 169.254.x): $token';
  }

  @override
  String ipRangeErrReversed(String token) {
    return 'Начало диапазона больше его конца: $token';
  }

  @override
  String ipRangeErrTooMany(String count) {
    return 'Слишком большой диапазон (не более 65 536 адресов, один /16): $count';
  }

  @override
  String ipRangeOk(String n) {
    return 'Будет просканировано адресов: $n';
  }

  @override
  String get ipRecColor => 'Цвет';

  @override
  String ipRecDeleteMsg(String name) {
    return 'Запись «$name» и её результат сканирования на этом компьютере будут удалены.';
  }

  @override
  String ipRecDevices(String n) {
    return 'Устройств: $n';
  }

  @override
  String get ipRecEdit => 'Изменить запись';

  @override
  String get ipRecFolder => 'Папка';

  @override
  String ipRecItems(String n) {
    return 'Элементов: $n';
  }

  @override
  String ipRecLastScan(String time) {
    return 'Последнее сканирование: $time';
  }

  @override
  String get ipRecMove => 'Переместить';

  @override
  String get ipRecMoveTitle => 'Переместить запись';

  @override
  String get ipRecName => 'Название';

  @override
  String get ipRecNever => 'Ещё не сканировалось';

  @override
  String ipRecNewDevices(String n) {
    return 'новых: $n';
  }

  @override
  String get ipRecRange => 'Диапазон IP';

  @override
  String get ipRecRangeHint =>
      'Примеры: 192.168.1.0/24 · 192.168.1.1-192.168.1.255 · 10.0.0.5 · несколько через запятую. Не более /16.';

  @override
  String get ipRecRootFolder => 'Записи';

  @override
  String get ipRecSaved => 'Запись сохранена';

  @override
  String get ipScanBusy => 'Идёт другое сканирование; сначала остановите его.';

  @override
  String ipScanDone(String n) {
    return 'Сканирование завершено: устройств $n';
  }

  @override
  String get ipScanEmptyBody =>
      'Нажмите «Сканировать» или ▶ на карточке. Найденные устройства появятся здесь.';

  @override
  String get ipScanEmptyTitle => 'Эта запись ещё не сканировалась';

  @override
  String get ipScanExport => 'Экспорт';

  @override
  String get ipScanExportCsv => 'Сохранить как CSV…';

  @override
  String get ipScanExportJson => 'Сохранить как JSON…';

  @override
  String get ipScanExported => 'Экспортировано';

  @override
  String ipScanFailed(String msg) {
    return 'Сканирование не удалось: $msg';
  }

  @override
  String get ipScanFilter => 'Фильтр';

  @override
  String get ipScanFilterAll => 'Все';

  @override
  String get ipScanFilterGone => 'Пропавшие';

  @override
  String get ipScanFilterNew => 'Новые';

  @override
  String get ipScanFilterServices => 'Со службами';

  @override
  String ipScanFound(String n) {
    return 'Найдено устройств: $n';
  }

  @override
  String get ipScanNoMatch => 'Нет устройств, подходящих под фильтр.';

  @override
  String get ipScanPhaseNames => 'Определение имён';

  @override
  String get ipScanPhasePing => 'Поиск устройств';

  @override
  String get ipScanPhasePorts => 'Проверка служб';

  @override
  String ipScanProgress(String done, String total) {
    return '$done/$total';
  }

  @override
  String ipScanRateLimited(String s) {
    return 'Эту запись можно просканировать снова не раньше чем через $s с.';
  }

  @override
  String get ipScanScan => 'Сканировать';

  @override
  String get ipScanScanning => 'Сканирование…';

  @override
  String get ipScanSelectHint =>
      'Нажмите запись слева: диапазон будет просканирован, а найденные устройства появятся здесь.';

  @override
  String get ipScanSelectRecord => 'Выберите запись';

  @override
  String get ipScanStop => 'Остановить';

  @override
  String get ipScanStopped => 'Сканирование остановлено';

  @override
  String get ipStatusAliveArp => 'Есть в таблице ARP (не ответило на ping)';

  @override
  String get ipStatusAlivePing => 'Ответило на ping';

  @override
  String get ipStatusGone => 'Пропало (было в предыдущем сканировании)';

  @override
  String get ipStatusLive => 'Сканируется';

  @override
  String get ipStatusNew => 'Новое (не было в предыдущем сканировании)';

  @override
  String get ipStatusSame => 'В сети';

  @override
  String ipTagCopied(String text) {
    return 'Скопировано в буфер обмена: $text';
  }

  @override
  String get ipTagFailed => 'Не удалось открыть';

  @override
  String get ipTagGroupCamera => 'Камера (RTSP)';

  @override
  String get ipTagGroupDb => 'База данных';

  @override
  String get ipTagGroupFtp => 'FTP';

  @override
  String get ipTagGroupPrinter => 'Принтер';

  @override
  String get ipTagGroupRdp => 'Удалённый рабочий стол';

  @override
  String get ipTagGroupSmb => 'Общий доступ к файлам';

  @override
  String get ipTagGroupSsh => 'SSH';

  @override
  String get ipTagGroupVnc => 'VNC';

  @override
  String get ipTagGroupWeb => 'Веб';

  @override
  String ipTagOpened(String text) {
    return 'Открывается: $text';
  }

  @override
  String get ipTrayHiddenHint =>
      'IP Tools продолжает работать в трее. Нажмите значок, чтобы вернуть окно.';

  @override
  String get ipTrayQuit => 'Выход';

  @override
  String get ipTrayShow => 'Показать IP Tools';

  @override
  String get ipWelcomeBody =>
      'Сохраните диапазон IP (например, 192.168.1.0/24). Нажатие на запись сканирует диапазон; найденные устройства выводятся с именем, производителем и открытыми службами. Нажмите на метку службы, чтобы открыть подходящее приложение.';

  @override
  String get ipWelcomeTitle => 'Что в вашей локальной сети?';

  @override
  String get cvTypeVideo => 'Видео';

  @override
  String get cvTypeImage => 'Изображение';

  @override
  String get cvTypeAudio => 'Аудио';

  @override
  String get cvTypeVideoHint => 'MP4, MKV, AVI, MOV…';

  @override
  String get cvTypeImageHint => 'JPG, PNG, WEBP, AVIF…';

  @override
  String get cvTypeAudioHint => 'MP3, WAV, FLAC, M4A…';

  @override
  String get cvTypeVideoAll => 'Все видеофайлы';

  @override
  String get cvTypeImageAll => 'Все файлы изображений';

  @override
  String get cvTypeAudioAll => 'Все аудиофайлы';

  @override
  String get cvAppSearchPh => 'Поиск проектов…  (Ctrl+F)';

  @override
  String get cvAppNewProject => 'Новый проект';

  @override
  String get cvAppSettings => 'Настройки';

  @override
  String cvAppStats(String c, String f) {
    return 'Проектов: $c · папок: $f';
  }

  @override
  String get cvAppWelcome => 'Добро пожаловать';

  @override
  String cvAppResults(String q) {
    return 'Результаты для «$q»';
  }

  @override
  String get cvAppAll => 'Все проекты';

  @override
  String get cvAppWelcomeHint =>
      'Создайте первый проект конвертации.<br>Выберите видео, изображение или аудио, укажите исходное и целевое расширения и выберите файл или папку.';

  @override
  String get cvAppFolders => 'Папки';

  @override
  String get cvAppProjects => 'Проекты';

  @override
  String get cvAppDblHint => 'Дважды щёлкните проект, чтобы открыть его';

  @override
  String get cvAppNoMatch => 'Подходящих проектов нет.';

  @override
  String cvAppFolderCount(String n) {
    return 'Проектов: $n';
  }

  @override
  String get cvAppNewProjectHere => 'Новый проект в этой папке';

  @override
  String get cvAppNewSubfolder => 'Создать вложенную папку';

  @override
  String get cvAppDuplicate => 'Создать копию';

  @override
  String get cvAppMoveToFolder => 'Переместить в папку…';

  @override
  String get cvAppProjectMoved => 'Проект перемещён';

  @override
  String get cvAppFolderIntoSelf => 'Папку нельзя переместить в саму себя';

  @override
  String get cvAppFolderPh => 'напр. Видео клиентов';

  @override
  String get cvAppRenameFolder => 'Переименовать папку';

  @override
  String get cvAppDeleteFolder => 'Удалить папку';

  @override
  String cvAppDeleteFolderMsg(String name) {
    return 'Удалить папку <b>$name</b>?';
  }

  @override
  String cvAppDeleteFolderProjects(String n) {
    return '<br>Проекты из неё ($n) будут перемещены в родительскую папку.';
  }

  @override
  String get cvAppRootFolder => 'Верхний уровень (без папки)';

  @override
  String cvAppMoveTitle(String name) {
    return 'Переместить «$name»';
  }

  @override
  String get cvAppTargetFolder => 'Целевая папка';

  @override
  String get cvAppDeleteProject => 'Удалить проект';

  @override
  String cvAppDeleteProjectMsg(String name) {
    return 'Удалить проект <b>$name</b>?<br>Его конвертированные файлы и расшифровки тоже будут удалены. Исходные файлы не затрагиваются.';
  }

  @override
  String get cvAppProjectSettings => 'Настройки проекта';

  @override
  String get cvAppNoSource => 'Источник на этом компьютере не выбран';

  @override
  String get cvAppAllExts => 'Все';

  @override
  String get cvAppRunning => 'Выполняется';

  @override
  String cvAppDoneCount(String n) {
    return 'Готово: $n';
  }

  @override
  String cvAppErrorCount(String n) {
    return 'Ошибок: $n';
  }

  @override
  String get cvAppProjectSaved => 'Проект сохранён';

  @override
  String get cvAppClearOutputs => 'Удалить конвертированные файлы';

  @override
  String cvAppClearOutputsMsg(String name) {
    return 'Удалить конвертированные файлы проекта <b>$name</b>? Исходные файлы не затрагиваются; конвертировать заново можно в любой момент.';
  }

  @override
  String get cvPfTitleNew => 'Новый проект';

  @override
  String cvPfTitleEdit(String name) {
    return 'Настройки проекта: $name';
  }

  @override
  String get cvPfCreate => 'Сохранить';

  @override
  String get cvPfTabGeneral => 'Общие';

  @override
  String get cvPfTabOutput => 'Параметры конвертации';

  @override
  String get cvPfTabSpeech => 'Речь';

  @override
  String get cvPfName => 'Имя проекта';

  @override
  String get cvPfNamePh => 'напр. Видео из отпуска';

  @override
  String get cvPfType => 'Тип';

  @override
  String get cvPfSourceExt => 'Расширение исходных файлов';

  @override
  String get cvPfTargetExt => 'Целевое расширение';

  @override
  String get cvPfSelectAll => 'Выбрать все';

  @override
  String get cvPfSelectNone => 'Ничего';

  @override
  String get cvPfGroupVideo => 'Видео';

  @override
  String get cvPfGroupAnim => 'Анимация';

  @override
  String get cvPfGroupAudioOnly => 'Только аудио (извлечь из видео)';

  @override
  String get cvPfAudioOnlyHint => 'Сохраняется только звуковая дорожка видео.';

  @override
  String get cvPfGifHint => 'Анимированный GIF (не более 30 кадров/с).';

  @override
  String get cvPfSource => 'Источник';

  @override
  String get cvPfModeFile => 'Файл';

  @override
  String get cvPfModeFolder => 'Папка';

  @override
  String get cvPfPathFile => 'Файл для конвертации';

  @override
  String get cvPfPathFolder => 'Папка для конвертации';

  @override
  String get cvPfPathNone => 'Ещё не выбрано — нажмите «Обзор…»';

  @override
  String get cvPfSubfolders => 'Включая вложенные папки';

  @override
  String get cvPfConcurrency => 'Одновременно конвертируемых файлов';

  @override
  String get cvPfConcurrencyHint =>
      'Большие значения ускоряют работу, но сильнее нагружают процессор и диск.';

  @override
  String get cvPfFolder => 'Папка проекта';

  @override
  String get cvPfSpeechAsk => 'Преобразовать речь в текст';

  @override
  String get cvPfSpeechAskHint =>
      'Речь в видео или аудио расшифровывается: секунда, язык и текст каждой фразы выводятся в отдельных столбцах.';

  @override
  String get cvPfSpeechModel => 'Модель распознавания';

  @override
  String get cvPfSpeechLang => 'Язык речи';

  @override
  String get cvPfPerWindow => 'Определять язык заново каждые 30 секунд';

  @override
  String get cvPfPerWindowHint =>
      'Для записей на нескольких языках. Медленнее.';

  @override
  String get cvPfModels => 'Модели';

  @override
  String get cvPfSpeechNote =>
      'Распознавание речи выполняется офлайн на этом компьютере (whisper.cpp); звук никогда не отправляется на сервер. Модель загружается один раз при первом использовании.';

  @override
  String get cvPfErrExt => 'Выберите хотя бы одно исходное расширение.';

  @override
  String get cvOutQuality => 'Качество';

  @override
  String get cvOutQHigh => 'Высокое (большой файл)';

  @override
  String get cvOutQMedium => 'Среднее (рекомендуется)';

  @override
  String get cvOutQLow => 'Низкое (маленький файл)';

  @override
  String get cvOutResolution => 'Разрешение';

  @override
  String get cvOutAsSource => 'Как у исходного';

  @override
  String get cvOutResolutionHint =>
      'Только уменьшение; видео меньшего размера не увеличиваются.';

  @override
  String get cvOutFps => 'Частота кадров';

  @override
  String get cvOutCodec => 'Видеокодек';

  @override
  String get cvOutH264 => 'H.264 (лучшая совместимость)';

  @override
  String get cvOutH265 => 'H.265 / HEVC (меньше размер)';

  @override
  String get cvOutCodecHint =>
      'H.265 используется только для MP4, MKV, MOV и M4V.';

  @override
  String get cvOutSpeed => 'Скорость кодирования';

  @override
  String get cvOutSpeedVeryfast => 'Очень быстро';

  @override
  String get cvOutSpeedFast => 'Быстро';

  @override
  String get cvOutSpeedMedium => 'Сбалансированно';

  @override
  String get cvOutSpeedSlow => 'Медленно (меньше файл)';

  @override
  String get cvOutAudioBitrate => 'Битрейт аудио';

  @override
  String get cvOutNoAudio => 'Удалить звук';

  @override
  String get cvOutImgQuality => 'Качество';

  @override
  String get cvOutImgQualityHint =>
      'Для JPG, WEBP, AVIF и TIFF. PNG сжимается без потерь; ниже 80 используется цветовая палитра.';

  @override
  String get cvOutMaxWidth => 'Максимальная ширина';

  @override
  String get cvOutMaxHeight => 'Максимальная высота';

  @override
  String get cvOutNoLimit => 'Без ограничений';

  @override
  String get cvOutResizeHint =>
      'Пропорции сохраняются; изображения меньшего размера не увеличиваются.';

  @override
  String get cvOutKeepMeta => 'Сохранять метаданные (EXIF, цветовой профиль)';

  @override
  String get cvOutKeepMetaHint =>
      'Если выключено, личные данные, например местоположение, не записываются в результат.';

  @override
  String get cvOutBitrate => 'Битрейт';

  @override
  String get cvOutBitrateHint =>
      'WAV, FLAC и AIFF — форматы без потерь; битрейт к ним не применяется.';

  @override
  String get cvOutSampleRate => 'Частота дискретизации';

  @override
  String get cvOutChannels => 'Каналы';

  @override
  String get cvOutStereo => 'Стерео';

  @override
  String get cvOutMono => 'Моно';

  @override
  String get cvSpeechModelTiny => 'Tiny (самая быстрая)';

  @override
  String get cvSpeechModelBase => 'Base (рекомендуется)';

  @override
  String get cvSpeechModelSmall => 'Small (точнее)';

  @override
  String get cvSpeechModelMedium => 'Medium (высокая точность)';

  @override
  String get cvSpeechModelTurbo => 'Large v3 Turbo (самая точная)';

  @override
  String get cvSpeechLangAuto => 'Определять автоматически';

  @override
  String get cvSpeechDownload => 'Загрузить';

  @override
  String cvSpeechInstalled(String size) {
    return 'Установлена · $size';
  }

  @override
  String get cvSpeechDownloadFailed => 'Не удалось загрузить модель';

  @override
  String get cvSpeechDlEngine => 'Загрузка модуля распознавания речи';

  @override
  String cvSpeechDlModel(String model) {
    return 'Загрузка модели распознавания: $model';
  }

  @override
  String get cvSpeechEngineAuto =>
      'Модуль распознавания речи (whisper.cpp) будет загружен при первом использовании.';

  @override
  String get cvSpeechEngineMissing =>
      'Модуль распознавания речи (whisper-cli) не найден.';

  @override
  String get cvPjOriginal => 'Оригинал';

  @override
  String get cvPjConverted => 'Результат';

  @override
  String get cvPjFolders => 'Папки';

  @override
  String get cvPjFiles => 'Файлы';

  @override
  String get cvPjTranscript => 'Текст';

  @override
  String get cvPjTrSecond => 'Секунда';

  @override
  String get cvPjTrLang => 'Язык';

  @override
  String get cvPjTrText => 'Текст';

  @override
  String get cvPjSecUnit => 'с';

  @override
  String get cvPjStart => 'Начать';

  @override
  String get cvPjStop => 'Остановить';

  @override
  String get cvPjChangeSource => 'Изменить источник';

  @override
  String get cvPjPickSource => 'Выбрать источник';

  @override
  String get cvPjOpenOutDir => 'Открыть папку с конвертированными файлами';

  @override
  String get cvPjExportOutputs =>
      'Скопировать конвертированные файлы в другую папку…';

  @override
  String get cvPjClearOutputs => 'Удалить конвертированные файлы';

  @override
  String get cvPjLinkPreview => 'Воспроизводить оба превью синхронно';

  @override
  String get cvPjFilterPh => 'Поиск файлов';

  @override
  String get cvPjFAll => 'Все';

  @override
  String get cvPjFPending => 'Ожидают';

  @override
  String get cvPjFActive => 'Выполняются';

  @override
  String get cvPjFDone => 'Готово';

  @override
  String get cvPjFError => 'Ошибки';

  @override
  String get cvPjExpandAll => 'Развернуть все';

  @override
  String get cvPjCollapseAll => 'Свернуть все';

  @override
  String get cvPjRescan => 'Обновить список';

  @override
  String get cvPjColName => 'Имя';

  @override
  String get cvPjColFolder => 'Папка';

  @override
  String get cvPjColSize => 'Размер';

  @override
  String get cvPjColProgress => 'Ход';

  @override
  String get cvPjColStatus => 'Состояние';

  @override
  String get cvPjColSpeech => 'Текст';

  @override
  String get cvPjColOut => 'Результат';

  @override
  String cvPjSegments(String n) {
    return 'Фраз: $n';
  }

  @override
  String get cvPjNoAudio => 'Нет звука';

  @override
  String cvPjNoFiles(String exts) {
    return 'В этой папке нет файлов с выбранными расширениями ($exts).';
  }

  @override
  String get cvPjNoMatch => 'Подходящих файлов нет.';

  @override
  String get cvPjNoneChecked =>
      'Список пуст. Отметьте файлы для конвертации в дереве слева.';

  @override
  String get cvPjConvertThis => 'Конвертировать этот файл';

  @override
  String get cvPjReconvert => 'Конвертировать заново';

  @override
  String get cvPjTranscribeThis => 'Расшифровать';

  @override
  String get cvPjRetranscribe => 'Расшифровать заново';

  @override
  String get cvPjOpenOut => 'Открыть конвертированный файл';

  @override
  String get cvPjRevealOut => 'Показать конвертированный файл в папке';

  @override
  String get cvPjOpenSrc => 'Открыть исходный файл';

  @override
  String get cvPjRevealSrc => 'Показать исходный файл в папке';

  @override
  String get cvPjExportThis => 'Скопировать в другую папку…';

  @override
  String get cvPjDeleteOut => 'Удалить конвертированный файл';

  @override
  String get cvPjUncheck => 'Убрать из списка';

  @override
  String cvPjExported(String n) {
    return 'Скопировано файлов: $n';
  }

  @override
  String get cvPjFileMissing => 'Исходный файл не найден.';

  @override
  String get cvPjPickToPreview => 'Выберите файл в списке для предпросмотра.';

  @override
  String get cvPjOutPreviewHint => 'Появится здесь после конвертации.';

  @override
  String get cvPjConverting => 'Конвертация…';

  @override
  String get cvPjCantPlay => 'Этот формат нельзя воспроизвести здесь напрямую.';

  @override
  String get cvPjMakePreview => 'Создать превью';

  @override
  String get cvPjMakingPreview => 'Подготовка превью…';

  @override
  String get cvPjNoSourceTitle => 'Источник на этом компьютере не выбран';

  @override
  String get cvPjNoSourceHint =>
      'Проект синхронизирован с другого устройства или источник ещё не выбран. Выберите файл или папку для конвертации.';

  @override
  String get cvPjSourceGone => 'Источник не найден';

  @override
  String get cvPjTrImage =>
      'Преобразование речи в текст доступно в проектах видео и аудио.';

  @override
  String get cvPjTrPick => 'Выберите файл, чтобы увидеть его текст.';

  @override
  String get cvPjTrAfter => 'Речь будет расшифрована после конвертации файла.';

  @override
  String get cvPjTrOff =>
      'Преобразование речи в текст в этом проекте выключено. Можно запустить его для этого файла сейчас.';

  @override
  String cvPjTrRunning(String p) {
    return 'Расшифровка… $p%';
  }

  @override
  String get cvPjTrNone => 'В этом файле речь не обнаружена.';

  @override
  String get cvPjTrNoExport => 'Нет текста для экспорта.';

  @override
  String get cvPjTrSaved => 'Текст сохранён';

  @override
  String get cvPjExportTranscript => 'Экспортировать текст';

  @override
  String get cvPjFmtSrt => 'Субтитры SRT';

  @override
  String get cvPjFmtVtt => 'Субтитры WebVTT';

  @override
  String get cvPjFmtTxt => 'Обычный текст (TXT)';

  @override
  String get cvPjFmtCsv => 'Таблица (CSV)';

  @override
  String cvPjStTotal(String n) {
    return 'Файлов: $n';
  }

  @override
  String cvPjStDone(String n) {
    return 'Готово: $n';
  }

  @override
  String cvPjStErr(String n) {
    return 'Ошибок: $n';
  }

  @override
  String cvPjStActive(String n) {
    return 'Конвертируется: $n';
  }

  @override
  String cvPjStSpeech(String n) {
    return 'Расшифровывается: $n';
  }

  @override
  String cvPjStOut(String size) {
    return 'Результат: $size';
  }

  @override
  String cvPjStConc(String n) {
    return 'Одновременно: $n';
  }

  @override
  String get cvPjFinished => 'Конвертация завершена';

  @override
  String cvPjFinishedSub(String done, String err, String total) {
    return 'Готово файлов: $done/$total · ошибок: $err';
  }

  @override
  String get cvStPending => 'Ожидает';

  @override
  String get cvStQueued => 'В очереди';

  @override
  String get cvStConverting => 'Конвертация';

  @override
  String get cvStDone => 'Готово';

  @override
  String get cvStError => 'Ошибка';

  @override
  String get cvStCanceled => 'Отменено';

  @override
  String get cvMainBalloonTitle => 'Convert Master продолжает работать';

  @override
  String get cvMainBalloonBody =>
      'Щёлкните значок в трее, чтобы снова открыть окно.';

  @override
  String get cvMainTrayShow => 'Показать Convert Master';

  @override
  String get cvMainTrayProjects => 'Проекты';

  @override
  String get cvMainTrayNone => '(нет проектов)';

  @override
  String get cvMainTrayQuit => 'Выход';

  @override
  String get cvErrCanceled => 'Отменено';

  @override
  String get cvErrNoVideo => 'В файле нет видеопотока.';

  @override
  String get cvErrNoAudio => 'В файле нет звука.';

  @override
  String get cvPjOcrThis => 'Распознать текст (OCR)';

  @override
  String get cvPjReocr => 'Распознать текст заново (OCR)';

  @override
  String get cvPjNoText => 'Нет текста';

  @override
  String get cvPjNoTextHint => 'На изображении не найден читаемый текст.';

  @override
  String get cvPjOcrPanel => 'Текст (OCR)';

  @override
  String get cvPjTrLine => 'Строка';

  @override
  String get cvPjTrConf => 'Точность';

  @override
  String cvPjLines(String n) {
    return 'Строк: $n';
  }

  @override
  String get cvPjOcrAfter =>
      'Текст на изображении будет распознан после конвертации.';

  @override
  String get cvPjOcrOff =>
      'В этом проекте OCR выключен. Можно запустить его сейчас для этого изображения.';

  @override
  String cvPjOcrRunning(String p) {
    return 'Распознавание текста… $p%';
  }

  @override
  String get cvPjCopyAll => 'Копировать всё';

  @override
  String get cvPjCopied => 'Текст скопирован в буфер обмена';

  @override
  String cvOcrDl(String lang) {
    return 'Загрузка языковых данных OCR: $lang';
  }

  @override
  String get cvOcrNotInstalled => 'Загружается при первом использовании';

  @override
  String get cvOcrDownloadFailed => 'Не удалось загрузить языковые данные OCR';

  @override
  String get cvPfTabOcr => 'OCR';

  @override
  String get cvPfOcrAsk => 'Распознавать текст на изображениях (OCR)';

  @override
  String get cvPfOcrAskHint =>
      'Текст на изображениях извлекается: каждая строка, точность распознавания и текст отображаются в отдельных столбцах. Оставьте выключенным, если не нужно.';

  @override
  String get cvPfOcrLangs => 'Язык текста на изображениях';

  @override
  String get cvPfOcrLangsHint =>
      'До 6 языков; чем меньше языков, тем быстрее и точнее.';

  @override
  String get cvPfOcrData => 'Языковые данные';

  @override
  String get cvPfOcrNote =>
      'OCR работает офлайн на этом компьютере (Tesseract); изображения никогда не отправляются на сервер. Каждый язык загружается один раз при первом использовании.';

  @override
  String cvErrOcr(String msg) {
    return 'Не удалось распознать текст: $msg';
  }

  @override
  String get cvErrUnreadable =>
      'Не удалось прочитать файл (повреждён или не поддерживается).';

  @override
  String get cvErrUnsupported => 'Такая конвертация не поддерживается.';

  @override
  String cvErrFfmpegMissing(String msg) {
    return 'Не удалось запустить модуль конвертации (ffmpeg): $msg';
  }

  @override
  String get cvErrEngineMissing =>
      'Модуль распознавания речи (whisper.cpp) не найден.';

  @override
  String cvErrDownload(String msg) {
    return 'Ошибка загрузки: $msg';
  }

  @override
  String get cvErrNotFound => 'Файл не найден.';

  @override
  String get cvErrAccess => 'Доступ запрещён.';

  @override
  String get cvErrBusy => 'Файл используется другой программой.';

  @override
  String get cvErrNoSpace => 'Диск заполнен.';

  @override
  String cvErrFfmpeg(String msg) {
    return 'Не удалось конвертировать: $msg';
  }

  @override
  String cvErrWhisper(String msg) {
    return 'Не удалось расшифровать: $msg';
  }

  @override
  String get cvMainCloseActive =>
      'Выполняется конвертация. Закрытие окна остановит её.';

  @override
  String get cvMainCloseAnyway => 'Всё равно закрыть';

  @override
  String get cvMainCopySuffix => ' (копия)';

  @override
  String get cvMainErrProjectNotFound => 'Проект не найден';

  @override
  String get cvMainExportTo => 'Папка для копирования конвертированных файлов';

  @override
  String get cvMainPickFile => 'Выберите файл для конвертации';

  @override
  String get cvMainPickFolder => 'Выберите папку для конвертации';

  @override
  String get cvMainSaveTranscript => 'Сохранить текст';

  @override
  String get cvMainUntitled => 'Проект без названия';

  @override
  String get sqOp => 'больше или равно';

  @override
  String get sqOpNotcontains => 'не содержит';

  @override
  String get sqOpNotlike => 'NOT LIKE';

  @override
  String get sqOpNotin => 'не в списке';

  @override
  String get sqOpIsnull => 'is NULL';

  @override
  String get sqOpIsnotnull => 'is not NULL';

  @override
  String get ipMobScanThis => 'Сканировать эту сеть';

  @override
  String get ipMobDeleteRecord => 'Удалить запись';

  @override
  String get ipMobNewRecordHere => 'Новая запись здесь';

  @override
  String get ipMobNoMatch => 'Совпадающих записей не найдено.';

  @override
  String ipMobAddresses(int n) {
    return '$n адресов';
  }

  @override
  String get ipMobAllRecords => 'Все записи';

  @override
  String get ipMobSetScan => 'Сканирование';

  @override
  String get ipMobSetPorts => 'Проверяемые службы';

  @override
  String get ipMobSetPortsHint =>
      'Для каждого порта выполняется только одна стандартная попытка TCP-подключения. Список фиксирован; ненужные можно отключить.';

  @override
  String get ipMobSetSpeed => 'Скорость';

  @override
  String get ipMobSetConcurrency => 'Одновременные подключения';

  @override
  String get ipMobSetConcurrencyHint =>
      'Не более 64 попыток подключения одновременно (ограничение конструкции).';

  @override
  String get ipMobSetTimeout => 'Тайм-аут';

  @override
  String get ipMobSetTimeoutHint => 'Ожидание не более 1000 мс на устройство.';

  @override
  String get ipMobSetLimitsNote =>
      'IP Tools — только инструмент обнаружения и инвентаризации: список портов нельзя расширить, попытки поиска уязвимостей и подбора паролей не выполняются, сканируются только частные/локальные адреса.';

  @override
  String get ipMobMacMobile => 'недоступно на мобильных устройствах';

  @override
  String get ipMobAliveTcp => 'Ответил на TCP-подключение';

  @override
  String get ipMobAliveName => 'Ответил на разрешение имени';

  @override
  String get ipMobOpenInSsh => 'Открыть в SSH Master';

  @override
  String get ipMobOpenInSshNote =>
      'Адрес скопирован в буфер обмена; вставьте его в форму SSH Master › Новое подключение.';

  @override
  String get ipMobCopyAddress => 'Копировать адрес';

  @override
  String get ipMobSuggestLocal => 'Сеть этого устройства';

  @override
  String get ipMobSuggestLocalNone => 'Сеть Wi-Fi не найдена';

  @override
  String get ipMobPhoneNoMacNote =>
      'На мобильных устройствах нет ping и ARP: активность определяется попытками TCP-подключения и разрешением имён; сведения о MAC и производителе показать нельзя.';

  @override
  String get cvMobNotOnMobile => 'Недоступно на мобильных устройствах';

  @override
  String get cvMobSpeechNote =>
      'Распознавание речи работает на устройстве офлайн (whisper.cpp); аудио никогда не отправляется на сервер. Модель загружается один раз при первом использовании (Tiny 75 МБ · Base 142 МБ · Small 466 МБ; рекомендуется Wi-Fi) и управляется в разделе Настройки › Речевые модели.';

  @override
  String get cvMobOcrNote =>
      'Распознавание текста на изображениях выполняется на устройстве (Google ML Kit); изображения никогда не отправляются на сервер. Распознаваемые письменности: латиница (включая турецкий), китайская, японская, корейская и деванагари (хинди). На Android модель распознавания поставляется с приложением.';

  @override
  String get cvMobFolderNote =>
      'На мобильных устройствах нельзя выбрать исходную папку; файлы добавляются по одному или из галереи.';

  @override
  String get cvMobConcurrencyHint =>
      'На мобильных устройствах одновременно конвертируется не более 2 файлов.';

  @override
  String get cvMobAddFiles => 'Добавить файлы';

  @override
  String get cvMobAddFromGallery => 'Добавить из галереи';

  @override
  String get cvMobPickFilesHint =>
      'Добавьте файлы для конвертации; результаты сохраняются в документах приложения.';

  @override
  String get cvMobShareOutput => 'Поделиться результатом';

  @override
  String get cvMobShareAllOutputs => 'Поделиться всеми результатами';

  @override
  String get cvMobSourceCopies => 'Копии исходных файлов';

  @override
  String get cvMobModuleSettings => 'Настройки Convert Master';

  @override
  String get cvMobDefaultConcurrency => 'Файлов одновременно в новых проектах';

  @override
  String get cvMobStorage => 'Хранилище';

  @override
  String get cvMobConversion => 'Конвертация';

  @override
  String get cvMobClearOrphans => 'Очистить файлы удалённых проектов';

  @override
  String get cvMobStorageNote =>
      'Конвертированные файлы и копии исходников хранятся в папке документов приложения и не покидают ваше устройство.';

  @override
  String get cvMobCleared => 'Очищено';

  @override
  String get cvMobNoOutputsYet => 'Пока нет конвертированных файлов.';

  @override
  String cvMobFilesAdded(int n) {
    return 'Добавлено файлов: $n';
  }

  @override
  String get cvMobUnsupportedExt =>
      'Не входит в исходные расширения этого проекта';

  @override
  String get cvMobUnsupportedOnMobile =>
      'Не поддерживается на мобильных устройствах';

  @override
  String get cvMobLicense =>
      'Конвертация видео и аудио выполняется с помощью FFmpegKit (LGPL 3.0, без компонентов GPL); кодирование H.264 / H.265 использует аппаратный кодировщик устройства (iOS VideoToolbox, Android MediaCodec).';

  @override
  String cvMobConverted(int n) {
    return 'Конвертировано файлов: $n';
  }

  @override
  String cvMobFilesCount(int n) {
    return '$n файлов';
  }

  @override
  String get sqMobUnsupportedMobile =>
      'Этот движок пока не поддерживается на мобильных устройствах';

  @override
  String get sqMobPickFile => 'Выбрать';

  @override
  String get sqMobFileCopied =>
      'Файл скопирован в каталог документов приложения';

  @override
  String get sqMobSshKeyPaste => 'Вставьте ключ PEM или выберите из файла';

  @override
  String get sqMobErrHost => 'Требуется адрес сервера';

  @override
  String get sqMobErrFile => 'Выберите файл базы данных';

  @override
  String get sqMobErrSshHost => 'Требуются SSH-сервер и имя пользователя';

  @override
  String get sqMobErrSshKey => 'Требуется закрытый ключ SSH';

  @override
  String get sqMobSslVerifyNote =>
      'Драйвер MySQL не проверяет сертификаты; параметр «проверять» работает как «обязательно».';

  @override
  String get sqMobRowDetail => 'Сведения о строке';

  @override
  String get sqMobNoResult => 'Нет результата — начните с «Выполнить»';

  @override
  String get sqMobExportJsonl => 'JSONL (по одному JSON в строке)';

  @override
  String get sqMobExportNoRows => 'Нет строк для экспорта';

  @override
  String get sqMobSettingsTitle => 'Настройки SQL Master';

  @override
  String get sqMobRowLimit => 'Лимит строк запроса';

  @override
  String get sqMobPreviewRows => 'Строк в предпросмотре таблицы';

  @override
  String get sqMobEditorFont => 'Размер шрифта редактора';

  @override
  String get sqMobCopyCell => 'Копировать значение';

  @override
  String get sqMobSelectionRun => 'Выполнить выделенное';

  @override
  String get sqMobTunnelOpening => 'Открывается SSH-туннель…';

  @override
  String get sqMobConnectingDb => 'Подключение к базе данных…';

  @override
  String get sqMobOpEq => '= (равно)';

  @override
  String get sqMobOpNe => '≠ (не равно)';

  @override
  String get sqMobOpLt => '< (меньше)';

  @override
  String get sqMobOpGt => '> (больше)';

  @override
  String get sqMobOpLe => '≤ (меньше или равно)';

  @override
  String get npMobSaveAs => 'Сохранить как…';

  @override
  String get npMobSaveAsTitle => 'Сохранить как';

  @override
  String get npMobDefaultProjectName => 'Проект';

  @override
  String get npMobLocalPathExample => 'Документы/Notepad Master/…';

  @override
  String get npMobReplaceAll => 'Заменить все';

  @override
  String get sqMobDuckExcelNote =>
      'Файлы Excel (.xlsx) требуют расширение DuckDB «excel»; если его не удаётся загрузить на этом устройстве, открытие завершится ошибкой. CSV, Parquet и JSON дополнительной установки не требуют.';

  @override
  String get sqMobDuckExcelUnsupported =>
      'Не удалось открыть файл Excel: расширение DuckDB «excel» не загружается на этом устройстве. Сохраните файл в формате CSV и повторите попытку.';

  @override
  String get sqMobDuckFileNotFound => 'Файл не найден';

  @override
  String get sqMobDuckNativeMissing =>
      'Не удалось загрузить нативную библиотеку DuckDB (libduckdb). Возможно, приложение собрано без бинарного файла DuckDB для этой платформы.';

  @override
  String get sqMobMssqlNativeMissing =>
      'Нативная библиотека SQL Server (FreeTDS libsybdb.so) не включена в приложение. В сборку Android нужно добавить каталог jniLibs из mssql_connection.';

  @override
  String get sqMobMssqlConnectFailed =>
      'Не удалось подключиться к SQL Server. Проверьте адрес сервера, порт, пользователя/пароль и режим TLS (подробности в журнале устройства под «MssqlClient»).';

  @override
  String get sqMobMssqlIosUnsupported =>
      'Драйвер SQL Server пока не поддерживается на iOS (библиотека FreeTDS не включена).';

  @override
  String get cvMobSpeechModelFallback =>
      'Эта модель недоступна на мобильных устройствах; на этом устройстве используется модель Base. Ваш выбор действует на компьютере.';

  @override
  String get cvMobPerWindowNote =>
      'Мобильная версия не сообщает распознанный язык; этот параметр действует на компьютере.';

  @override
  String get cvMobOcrUnsupported =>
      'Недоступно на мобильных устройствах (нет модели ML Kit); используется на компьютере';

  @override
  String get cvMobOcrMax => 'Можно выбрать не более 6 языков.';

  @override
  String get cvMobShareAllTexts => 'Поделиться всеми текстами';

  @override
  String get cvMobShareText => 'Поделиться текстом';

  @override
  String get cvMobDeleteText => 'Удалить текст';

  @override
  String get cvMobCancelText => 'Отменить задание текста';

  @override
  String get cvMobPhaseDownload => 'Загрузка речевой модели';

  @override
  String get cvMobPhaseWav => 'Подготовка аудио (16 кГц WAV)…';

  @override
  String get cvMobPhaseRunSpeech =>
      'Распознавание речи… (время зависит от длины файла)';

  @override
  String get cvMobPhaseRunOcr => 'Чтение текста…';

  @override
  String cvMobTextsCount(int n) {
    return '$n текстов';
  }

  @override
  String get cvMobNoTextsYet => 'Текстов пока нет.';

  @override
  String get cvMobSpeechModels => 'Речевые модели';

  @override
  String get cvMobSpeechModelsNote =>
      'Распознавание речи (whisper.cpp) работает на этом устройстве; модель загружается при первом использовании, здесь её можно загрузить заранее или удалить. Модели Medium и Large v3 Turbo недоступны на мобильных устройствах.';

  @override
  String get cvMobTexts => 'Тексты (речь / OCR)';

  @override
  String get cvMobOcrSettingsNote =>
      'Распознавание текста на изображениях выполняется на устройстве с помощью Google ML Kit; поддерживаются латиница (включая турецкий), китайская, японская, корейская письменности и деванагари. Модели распознавания поставляются с приложением; загрузка не требуется.';

  @override
  String get npMobDocumentsRoot => 'Документы';

  @override
  String get smMobFiles => 'Файлы';
}
