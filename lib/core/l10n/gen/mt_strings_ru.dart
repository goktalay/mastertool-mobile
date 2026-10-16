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
}
