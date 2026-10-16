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
}
