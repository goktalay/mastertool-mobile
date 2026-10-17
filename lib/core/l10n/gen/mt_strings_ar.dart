// ignore: unused_import
import 'package:intl/intl.dart' as intl;

import 'mt_strings.dart';

// ignore_for_file: type=lint

/// The translations for Arabic (`ar`).
class MtStringsAr extends MtStrings {
  MtStringsAr([String locale = 'ar']) : super(locale);

  @override
  String get setGeneral => 'عام';

  @override
  String get setAccount => 'الحساب';

  @override
  String get setAbout => 'حول';

  @override
  String aboutVersion(String version) {
    return 'الإصدار $version';
  }

  @override
  String get aboutFamily =>
      'جزء من عائلة Mastertool: SSH Master · FTP Masters · SQL Master · Notepad Master · Convert Master · IP Tools';

  @override
  String get aboutCheckUpdate => 'التحقق من التحديثات';

  @override
  String get aboutChecking => 'جارٍ التحقق…';

  @override
  String aboutUpToDate(String app) {
    return '$app محدّث.';
  }

  @override
  String aboutCheckFailed(String msg) {
    return 'تعذّر التحقق من التحديثات: $msg';
  }

  @override
  String get aboutLicenses => 'تراخيص المصادر المفتوحة';

  @override
  String aboutLicensesIntro(String app) {
    return 'يستخدم $app مكونات المصادر المفتوحة التالية:';
  }

  @override
  String authErrAppDisabled(String app) {
    return 'عطّل المسؤول استخدام $app لهذا الحساب. تواصل مع مسؤول حسابك.';
  }

  @override
  String authErrWrongApp(String app) {
    return 'هذه الجلسة تخص تطبيقًا آخر. يرجى تسجيل الدخول إلى $app مجددًا.';
  }

  @override
  String get authSignedOut =>
      'تم تسجيل الخروج في أحد تطبيقات Mastertool على هذا الكمبيوتر. يرجى تسجيل الدخول مجددًا.';

  @override
  String get authSubtitle => 'سجّل الدخول بحسابك';

  @override
  String get authEmail => 'البريد الإلكتروني';

  @override
  String get authPassword => 'كلمة المرور';

  @override
  String get authRemember => 'تذكّرني';

  @override
  String get authForgot => 'نسيت كلمة المرور';

  @override
  String get authNoAccount => 'ليس لديك حساب؟';

  @override
  String get authRegister => 'إنشاء حساب';

  @override
  String get authSubmit => 'تسجيل الدخول';

  @override
  String get authWorking => 'جارٍ تسجيل الدخول…';

  @override
  String get authErrRequired => 'البريد الإلكتروني وكلمة المرور مطلوبان.';

  @override
  String get authErrBadCredentials =>
      'البريد الإلكتروني أو كلمة المرور غير صحيحة.';

  @override
  String get authErrUnverified =>
      'لم يتم التحقق من بريدك الإلكتروني بعد. انقر الرابط في صندوق الوارد.';

  @override
  String get authErrSuspended => 'حسابك موقوف.';

  @override
  String get authErrRateLimited => 'محاولات كثيرة جدًا. حاول مجددًا بعد دقيقة.';

  @override
  String get authErrOffline =>
      'تعذّر الوصول إلى الخادم. تحقّق من اتصالك بالإنترنت.';

  @override
  String get authErrSessionExpired =>
      'انتهت جلستك أو تغيّرت كلمة المرور. يرجى تسجيل الدخول مجددًا.';

  @override
  String authErrServer(String msg) {
    return 'تعذّر تسجيل الدخول: $msg';
  }

  @override
  String get acctSection => 'الحساب والمزامنة';

  @override
  String acctSignedInAs(String email) {
    return 'مسجّل الدخول باسم $email';
  }

  @override
  String get acctSyncToggle => 'مزامنة الاتصالات مع الويب';

  @override
  String get acctSyncHint =>
      'تُنسخ الاتصالات والمجلدات والاختصارات احتياطيًا إلى حسابك بتشفير من طرف إلى طرف؛ لا يستطيع الخادم قراءتها. لا تُرسَل إعدادات الجهاز مثل حجم الخط والعلبة.';

  @override
  String acctLastSync(String time) {
    return 'آخر مزامنة: $time';
  }

  @override
  String get acctNever => 'لم تتم المزامنة بعد';

  @override
  String get acctSyncNow => 'مزامنة الآن';

  @override
  String get acctDeleteRemote => 'حذف النسخة على الخادم';

  @override
  String get acctDeleteRemoteMsg =>
      'سيتم حذف نسخة المكتبة المشفّرة في حسابك وإيقاف المزامنة. لن تُحذف الاتصالات الموجودة على هذا الكمبيوتر.';

  @override
  String get acctDeleteRemoteDone => 'حُذفت النسخة على الخادم وأُوقفت المزامنة';

  @override
  String get acctLogout => 'تسجيل الخروج';

  @override
  String get acctLogoutMsg =>
      'سيتم تسجيل خروجك. ستبقى الاتصالات والمشاريع على هذا الجهاز.';

  @override
  String get acctMyAccount => 'حسابي (الويب)';

  @override
  String get acctBackupNotice =>
      'تم تسجيل الدخول بحساب مختلف؛ تم الاحتفاظ بنسخة احتياطية من الاتصالات السابقة على هذا الكمبيوتر.';

  @override
  String get syncOff => 'المزامنة متوقفة';

  @override
  String get syncSyncing => 'جارٍ المزامنة…';

  @override
  String get syncOffline => 'غير متصل — ستُرسَل التغييرات عند عودة الاتصال';

  @override
  String get syncErrDecrypt =>
      'تعذّر فك تشفير النسخة على الخادم بمفتاح هذا الحساب؛ الاتصالات على هذا الكمبيوتر محفوظة.';

  @override
  String get syncErrTooLarge =>
      'تتجاوز المكتبة حد 5 ميغابايت ولم تتم مزامنتها.';

  @override
  String syncError(String msg) {
    return 'خطأ في المزامنة: $msg';
  }

  @override
  String get commonCancel => 'إلغاء';

  @override
  String get commonSave => 'حفظ';

  @override
  String get commonCreate => 'إنشاء';

  @override
  String get commonOk => 'موافق';

  @override
  String get commonDelete => 'حذف';

  @override
  String get commonGiveUp => 'تراجع';

  @override
  String get commonOpen => 'فتح';

  @override
  String get commonEdit => 'تعديل';

  @override
  String get commonRename => 'إعادة تسمية';

  @override
  String get commonRefresh => 'تحديث';

  @override
  String get commonNewFolder => 'مجلد جديد';

  @override
  String get commonCopyPath => 'نسخ المسار';

  @override
  String get commonMove => 'نقل';

  @override
  String get commonMoveEllipsis => 'نقل…';

  @override
  String get commonShow => 'إظهار';

  @override
  String get commonChoose => 'استعراض…';

  @override
  String get commonConnect => 'اتصال';

  @override
  String get commonNew => 'جديد';

  @override
  String get commonCopy => 'نسخ';

  @override
  String get commonPaste => 'لصق';

  @override
  String commonLocation(String path) {
    return 'الموقع: $path';
  }

  @override
  String get commonNewName => 'الاسم الجديد';

  @override
  String get commonFolderName => 'اسم المجلد';

  @override
  String get setTitle => 'الإعدادات';

  @override
  String get setAppearance => 'المظهر';

  @override
  String get setTheme => 'السمة';

  @override
  String get setThemeDark => 'ليلي';

  @override
  String get setThemeLight => 'نهاري';

  @override
  String get setThemeSystem => 'حسب النظام';

  @override
  String get setLanguage => 'اللغة';

  @override
  String get setLanguageHint => 'تُطبَّق اللغة فوراً.';

  @override
  String get setSaved => 'تم حفظ الإعدادات';

  @override
  String get mobModules => 'الوحدات';

  @override
  String get mobDisabled => 'معطّل في حسابك';

  @override
  String get mobSoon => 'هذه الوحدة قيد الإعداد';

  @override
  String get mobOpen => 'فتح';

  @override
  String get mobRefresh => 'تحديث';

  @override
  String get mobSettings => 'الإعدادات';

  @override
  String mobWelcome(String name) {
    return 'مرحباً، $name';
  }

  @override
  String get mobNoModules => 'تعذّر تحميل الوحدات. تحقق من الاتصال ثم حدّث.';

  @override
  String get mobSite => 'mastertool.download';

  @override
  String get mobLangSystem => 'لغة النظام';

  @override
  String get mobSsoHint =>
      'يكفي تسجيل الدخول مرة واحدة: تُفتح SSH Master وFTP Masters وSQL Master وNotepad Master وConvert Master وIP Tools داخل هذا التطبيق.';

  @override
  String mobOpenCount(String open, String total) {
    return '$open/$total وحدات مفعّلة';
  }

  @override
  String get mobModulesHint => 'انقر للفتح';

  @override
  String get mobTapToOpen => 'جاهز للاستخدام';

  @override
  String get mobVisitSite => 'زيارة الموقع';

  @override
  String get smAppSearchPh => 'ابحث في الاتصالات…  (Ctrl+F)';

  @override
  String get smAppNewConn => 'اتصال جديد';

  @override
  String smAppSplit(String n) {
    return 'فتح مقسّم ($n)';
  }

  @override
  String get smAppSplitTitle => 'فتح الاتصالات المحددة مقسّمة في نافذة واحدة';

  @override
  String get smAppSettings => 'الإعدادات';

  @override
  String smAppStats(String c, String f) {
    return '$c اتصال · $f مجلد';
  }

  @override
  String get smAppWelcome => 'مرحبًا';

  @override
  String smAppResults(String q) {
    return 'نتائج «$q»';
  }

  @override
  String get smAppAll => 'كل الاتصالات';

  @override
  String get smAppWelcomeHint =>
      'أنشئ أول اتصال SSH لك.<br>أدخل بيانات الخادم ثم اختبرها واحفظها.';

  @override
  String get smAppFolders => 'المجلدات';

  @override
  String get smAppConnections => 'الاتصالات';

  @override
  String get smAppMultiHint =>
      'استخدم Ctrl+نقر لتحديد عدة اتصالات وفتحها مقسّمة في نافذة واحدة';

  @override
  String get smAppNoMatch => 'لا توجد اتصالات مطابقة.';

  @override
  String smAppFolderCount(String n) {
    return '$n اتصال';
  }

  @override
  String get smAppFolderOpenSplit => 'فتح اتصالات المجلد مقسّمة';

  @override
  String get smAppNewConnHere => 'اتصال جديد في هذا المجلد';

  @override
  String get smAppNewSubfolder => 'إنشاء مجلد فرعي';

  @override
  String get smAppKeyTag => 'مفتاح';

  @override
  String get smAppLastDir => 'آخر مجلد';

  @override
  String get smAppLastDirTag => 'آخر مجلد';

  @override
  String smAppMultiOpenSplit(String n) {
    return 'فتح $n اتصالات مقسّمة في نافذة واحدة';
  }

  @override
  String get smAppOpenSeparate => 'فتح كل اتصال في نافذة مستقلة';

  @override
  String get smAppClearSelection => 'إلغاء التحديد';

  @override
  String get smAppSideBySide => 'فتح جلستين جنبًا إلى جنب';

  @override
  String get smAppDuplicate => 'إنشاء نسخة';

  @override
  String get smAppMoveToFolder => 'نقل إلى مجلد…';

  @override
  String get smAppResetLastDir => 'إعادة تعيين آخر مجلد';

  @override
  String get smAppConnMoved => 'تم نقل الاتصال';

  @override
  String get smAppFolderIntoSelf => 'لا يمكن نقل مجلد إلى أحد مجلداته الفرعية';

  @override
  String get smAppFolderPh => 'مثال: خوادم الإنتاج';

  @override
  String get smAppRenameFolder => 'إعادة تسمية المجلد';

  @override
  String get smAppDeleteFolder => 'حذف المجلد';

  @override
  String smAppDeleteFolderMsg(String name) {
    return 'سيتم حذف المجلد <b>$name</b>.';
  }

  @override
  String smAppDeleteFolderConns(String n) {
    return ' لن تُحذف اتصالاته الـ$n، بل تُنقل مستوى واحدًا للأعلى.';
  }

  @override
  String get smAppRootFolder => 'كل الاتصالات (الجذر)';

  @override
  String smAppMoveTitle(String name) {
    return 'نقل «$name»';
  }

  @override
  String get smAppTargetFolder => 'المجلد الهدف';

  @override
  String get smAppDeleteConn => 'حذف الاتصال';

  @override
  String smAppDeleteConnMsg(String name, String target) {
    return 'سيتم حذف <b>$name</b> ($target) نهائيًا.';
  }

  @override
  String get smAppMaxPanes => 'يمكن فتح 6 أجزاء كحد أقصى';

  @override
  String get smAppMaxPanesSub => 'تم فتح أول 6 اتصالات';

  @override
  String get smFormTitleNew => 'اتصال SSH جديد';

  @override
  String get smFormTitleEdit => 'تعديل الاتصال';

  @override
  String get smFormName => 'اسم الاتصال';

  @override
  String get smFormNamePh => 'مثال: خادم الويب';

  @override
  String get smFormHost => 'عنوان IP / الخادم';

  @override
  String get smFormHostPh => '192.168.1.10 أو server.com';

  @override
  String get smFormPort => 'المنفذ';

  @override
  String get smFormUser => 'اسم المستخدم';

  @override
  String get smFormAuth => 'المصادقة';

  @override
  String get smFormPassword => 'كلمة المرور';

  @override
  String get smFormPrivateKey => 'مفتاح خاص';

  @override
  String get smFormPwSaved => '•••••••• (محفوظة — اكتب لتغييرها)';

  @override
  String get smFormKeyFile => 'ملف المفتاح';

  @override
  String get smFormPassphrase => 'عبارة مرور المفتاح (إن وجدت)';

  @override
  String get smFormPassSaved => '•••••••• (محفوظة)';

  @override
  String get smFormPassEmpty => 'اتركها فارغة إن لم توجد';

  @override
  String get smFormFolder => 'المجلد';

  @override
  String get smFormColor => 'اللون';

  @override
  String get smFormPalette => 'لوحة ألوان الطرفية';

  @override
  String get smFormLastDir => 'الانتقال إلى آخر مجلد عملت فيه';

  @override
  String get smFormLastDirHint =>
      'عند الاتصال تُفتح الطرفية ومدير الملفات في آخر مجلد عملت فيه.';

  @override
  String get smFormLastDirNow => 'حاليًا:';

  @override
  String get smFormConnecting => 'جارٍ الاتصال…';

  @override
  String get smFormTestOk => 'نجح الاتصال';

  @override
  String smFormHostKey(String fp) {
    return 'مفتاح المضيف (SHA256): $fp';
  }

  @override
  String get smFormTestFail => 'فشل الاتصال';

  @override
  String get smFormSaved => 'تم حفظ الاتصال';

  @override
  String get smFormChangesSaved => 'تم حفظ التغييرات';

  @override
  String get smFormTest => 'اختبار الاتصال';

  @override
  String get smFormSaveConnect => 'حفظ واتصال';

  @override
  String get smPaneToggleSidebar => 'إظهار/إخفاء اللوحة الجانبية (Ctrl+B)';

  @override
  String get smPaneDefaultName => 'اتصال';

  @override
  String get smPaneSplitRight => 'تقسيم أفقي';

  @override
  String get smPaneSplitDown => 'تقسيم عمودي';

  @override
  String get smPaneReconnect => 'إعادة الاتصال';

  @override
  String get smPaneClose => 'إغلاق الجزء';

  @override
  String get smPaneSaveSelShortcut => 'حفظ التحديد كاختصار';

  @override
  String get smPanePaletteMenu => 'لوحة ألوان الطرفية…';

  @override
  String get smPaneSelectAll => 'تحديد الكل';

  @override
  String get smPaneClear => 'مسح الشاشة';

  @override
  String get smPaneStatusConnecting => 'جارٍ الاتصال…';

  @override
  String get smPaneStatusNoConn => 'غير متصل';

  @override
  String get smPaneStatusClosed => 'أُغلق الاتصال';

  @override
  String get smTermConnecting => 'جارٍ الاتصال…';

  @override
  String get smTermConnectFailed => 'تعذّر الاتصال:';

  @override
  String get smTermRetryEnter => 'اضغط Enter للمحاولة مجددًا.';

  @override
  String get smTermClosed => 'أُغلق الاتصال.';

  @override
  String get smTermReconnectEnter => 'اضغط Enter لإعادة الاتصال.';

  @override
  String smTermMaxPanes(String n) {
    return 'يمكن فتح $n أجزاء كحد أقصى في النافذة';
  }

  @override
  String smTermSessions(String n) {
    return '$n جلسات';
  }

  @override
  String get smTermToggleAll => 'إظهار/إخفاء كل اللوحات الجانبية';

  @override
  String get smTermSplitRightTitle => 'تقسيم الجزء النشط أفقيًا (Ctrl+Shift+E)';

  @override
  String get smTermSplitDownTitle => 'تقسيم الجزء النشط عموديًا (Ctrl+Shift+O)';

  @override
  String get smTermSyncOn => 'الكتابة في كل الأجزاء';

  @override
  String get smTermSyncOff => 'الكتابة في كل الأجزاء';

  @override
  String get smTermSyncTitle => 'يُرسَل ما تكتبه إلى كل الأجزاء المتصلة';

  @override
  String get smPickerSearch => 'ابحث عن اتصال…';

  @override
  String get smPickerSameServer => 'الخادم نفسه';

  @override
  String get smPickerNone => 'لا توجد اتصالات مطابقة';

  @override
  String get smPickerTitleRight => 'تقسيم أفقي — اختر اتصالًا';

  @override
  String get smPickerTitleDown => 'تقسيم عمودي — اختر اتصالًا';

  @override
  String get smPaletteTitle => 'لوحة ألوان الطرفية';

  @override
  String smPaletteHint(String name) {
    return 'تُعرض اللوحة التي تختارها في هذا الجزء فورًا. إذا حفظتها فستُستخدم في كل جلسات هذا الاتصال ($name).';
  }

  @override
  String get smPaletteSaved => 'تم حفظ لوحة الألوان';

  @override
  String get smScTitleNew => 'اختصار جديد';

  @override
  String get smScTitleEdit => 'تعديل الاختصار';

  @override
  String get smScName => 'اسم الاختصار';

  @override
  String get smScNamePh => 'مثال: إعادة تشغيل Nginx';

  @override
  String get smScCommand => 'الأمر';

  @override
  String get smScEnter => 'الضغط على Enter بعد اللصق';

  @override
  String get smScEnterHint =>
      'عند الإيقاف يُكتب الأمر عند المؤشر فقط وتشغّله أنت.';

  @override
  String get smScEmpty =>
      'لا توجد اختصارات بعد.<br>أضف الأوامر التي تستخدمها كثيرًا بـ <b>+</b> وانقر نقرًا مزدوجًا للصقها في الطرفية.';

  @override
  String get smScItemTitle => 'نقر مزدوج: لصق في طرفية هذا الجزء';

  @override
  String get smScAutoEnter => 'Enter تلقائي';

  @override
  String get smScPaste => 'لصق في الطرفية';

  @override
  String get smScPasteNoEnter => 'لصق دون Enter';

  @override
  String get smScPasteRun => 'لصق وتشغيل';

  @override
  String get smScCopy => 'نسخ إلى الحافظة';

  @override
  String get smScNew => 'اختصار جديد';

  @override
  String get smSbShortcuts => 'الاختصارات';

  @override
  String get smSbAddShortcut => 'إضافة اختصار';

  @override
  String get smSbServer => 'الخادم';

  @override
  String smSbServerHost(String host) {
    return 'الخادم · $host';
  }

  @override
  String get smSbFollow => 'تتبّع مجلد الطرفية';

  @override
  String get smSbHome => 'المجلد الرئيسي';

  @override
  String get smSbUp => 'المجلد الأعلى';

  @override
  String get smSbComputer => 'هذا الكمبيوتر';

  @override
  String get smSbPlaces => 'الأقراص والمواقع';

  @override
  String get smSbResize => 'اسحب لتغيير العرض';

  @override
  String get smFmLoading => 'جارٍ التحميل…';

  @override
  String smFmOpenFailed(String msg) {
    return 'تعذّر الفتح: $msg';
  }

  @override
  String get smFmEmpty => 'المجلد فارغ';

  @override
  String get smFmNoConn => 'غير متصل.';

  @override
  String get smFmClosed => 'أُغلق الاتصال.';

  @override
  String get smFmWaiting => 'بانتظار الاتصال…';

  @override
  String smFmDownloadTo(String path) {
    return 'تنزيل ← $path';
  }

  @override
  String smFmUploadTo(String path) {
    return 'رفع ← $path';
  }

  @override
  String get smFmServer => 'الخادم';

  @override
  String get smFmCdHere => 'الانتقال إلى هذا المجلد في الطرفية';

  @override
  String get smFmPastePath => 'لصق المسار في الطرفية';

  @override
  String smFmDeleteWhat(String what) {
    return 'حذف ($what)';
  }

  @override
  String smFmNItems(String n) {
    return '$n عناصر';
  }

  @override
  String get smFmOpenDefault => 'فتح بالتطبيق الافتراضي';

  @override
  String get smFmReveal => 'إظهار في المستكشف';

  @override
  String get smFmOpenExplorer => 'فتح في المستكشف';

  @override
  String get smFmFollowing => 'مدير الملفات يتتبّع مجلد الطرفية';

  @override
  String get smFmFollowOff => 'تم إيقاف التتبّع';

  @override
  String get smFmNewRemote => 'مجلد جديد على الخادم';

  @override
  String get smFmDeleteTitle => 'حذف من الخادم';

  @override
  String smFmAndMore(String n) {
    return ' و$n عناصر أخرى';
  }

  @override
  String smFmDeleteMsg(String names) {
    return 'سيتم حذف $names من الخادم <b>نهائيًا</b>. تُحذف المجلدات مع محتوياتها.';
  }

  @override
  String get smPlaceDesktop => 'سطح المكتب';

  @override
  String get smPlaceDownloads => 'التنزيلات';

  @override
  String get smPlaceDocuments => 'المستندات';

  @override
  String get smPlaceHome => 'مجلد المستخدم';

  @override
  String smPlaceDrive(String d) {
    return 'القرص المحلي ($d)';
  }

  @override
  String get smErrNoConn => 'غير متصل';

  @override
  String get smErrConnectFirst => 'اتصل بالخادم أولًا';

  @override
  String get smErrMkdir => 'تعذّر إنشاء المجلد';

  @override
  String get smErrRename => 'تعذّرت إعادة التسمية';

  @override
  String smErrDelete(String name) {
    return 'تعذّر الحذف: $name';
  }

  @override
  String get smTrPanelTitle => 'عمليات النقل';

  @override
  String get smTrClearDone => 'مسح المكتملة';

  @override
  String get smTrQueued => 'في الانتظار';

  @override
  String get smTrScanning => 'جارٍ فحص الملفات…';

  @override
  String smTrFileCount(String i, String n) {
    return '$i / $n ملفات';
  }

  @override
  String smTrEta(String time) {
    return 'متبقٍ ~$time';
  }

  @override
  String smTrDownloading(String name) {
    return 'جارٍ التنزيل: $name';
  }

  @override
  String smTrUploading(String name) {
    return 'جارٍ الرفع: $name';
  }

  @override
  String get smTrDone => 'اكتمل';

  @override
  String get smTrCancelled => 'أُلغي';

  @override
  String get smTrFailed => 'فشل';

  @override
  String get smTrRemoveFromList => 'إزالة من القائمة';

  @override
  String get smTrAlwaysBackground =>
      'عرض عمليات النقل الكبيرة في الخلفية دائمًا من الآن';

  @override
  String get smTrShowInBackground => 'تشغيل في الخلفية';

  @override
  String get smTrDownloadDone => 'اكتمل التنزيل';

  @override
  String get smTrUploadDone => 'اكتمل الرفع';

  @override
  String smTrDownloadFailed(String name) {
    return 'فشل التنزيل: $name';
  }

  @override
  String smTrUploadFailed(String name) {
    return 'فشل الرفع: $name';
  }

  @override
  String get smTrCancelledToast => 'أُلغيت عملية النقل';

  @override
  String smTimeHm(String h, String m) {
    return '$h س $m د';
  }

  @override
  String smTimeMs(String m, String s) {
    return '$m د $s ث';
  }

  @override
  String smTimeS(String s) {
    return '$s ث';
  }

  @override
  String get smMainErrAuth =>
      'فشلت المصادقة: اسم المستخدم أو كلمة المرور غير صحيحة.';

  @override
  String get smMainErrRefused =>
      'رُفض الاتصال: المنفذ مغلق أو خدمة SSH لا تعمل.';

  @override
  String get smMainErrTimeout => 'انتهت المهلة: تعذّر الوصول إلى الخادم.';

  @override
  String get smMainErrDns => 'تعذّر تحليل اسم المضيف (DNS).';

  @override
  String get smMainErrUnreach => 'لا يمكن الوصول إلى الخادم عبر الشبكة.';

  @override
  String get smMainErrKeyFile => 'لم يُعثر على ملف المفتاح.';

  @override
  String smMainErrHostKey(String newFp, String oldFp) {
    return 'تغيّر مفتاح مضيف الخادم! المحفوظ: $oldFp، المستلم: $newFp. رُفض الاتصال لأسباب أمنية.';
  }

  @override
  String get smMainErrConnNotFound => 'لم يُعثر على الاتصال';

  @override
  String get smMainErrNoSession => 'لا توجد جلسة SSH نشطة';

  @override
  String get smMainErrHostUser => 'عنوان الخادم واسم المستخدم مطلوبان.';

  @override
  String get smMainTrayShow => 'إظهار SSH Master';

  @override
  String get smMainTrayQuick => 'اتصال سريع';

  @override
  String get smMainTrayNone => 'لا توجد اتصالات محفوظة';

  @override
  String get smMainTrayQuit => 'خروج';

  @override
  String get smMainBalloonTitle => 'يعمل SSH Master في الخلفية';

  @override
  String get smMainBalloonBody => 'انقر أيقونة العلبة لفتحه مجددًا.';

  @override
  String get smMainPickKey => 'اختر ملف مفتاح خاص';

  @override
  String get smMainCopySuffix => ' (نسخة)';

  @override
  String get smMainDefDisk => 'استخدام القرص';

  @override
  String get smMainDefMem => 'الذاكرة';

  @override
  String get smMainDefTop => 'العمليات (top)';

  @override
  String get smAppNotesLabel => 'ملاحظات';

  @override
  String get fmAppSearchPh => 'ابحث في المواقع…  (Ctrl+F)';

  @override
  String get fmAppNewConn => 'موقع جديد';

  @override
  String get fmAppSettings => 'الإعدادات';

  @override
  String fmAppStats(String c, String f) {
    return '$c موقع · $f مجلد';
  }

  @override
  String get fmAppWelcome => 'مرحبًا';

  @override
  String fmAppResults(String q) {
    return 'نتائج «$q»';
  }

  @override
  String get fmAppAll => 'كل المواقع';

  @override
  String get fmAppWelcomeHint =>
      'أنشئ أول موقع FTP / SFTP لك.<br>أدخل بيانات الخادم ثم اختبر الاتصال واحفظه.';

  @override
  String get fmAppFolders => 'المجلدات';

  @override
  String get fmAppConnections => 'المواقع';

  @override
  String get fmAppDblHint => 'انقر نقرًا مزدوجًا على البطاقة للاتصال';

  @override
  String get fmAppNoMatch => 'لا توجد مواقع مطابقة.';

  @override
  String fmAppFolderCount(String n) {
    return '$n موقع';
  }

  @override
  String get fmAppNewConnHere => 'موقع جديد في هذا المجلد';

  @override
  String get fmAppNewSubfolder => 'مجلد فرعي جديد';

  @override
  String get fmAppKeyTag => 'مفتاح';

  @override
  String get fmAppLastDir => 'آخر مجلد';

  @override
  String get fmAppLastDirTag => 'آخر مجلد';

  @override
  String get fmAppDuplicate => 'إنشاء نسخة';

  @override
  String get fmAppMoveToFolder => 'نقل إلى مجلد…';

  @override
  String get fmAppResetLastDir => 'إعادة تعيين آخر مجلد';

  @override
  String get fmAppConnMoved => 'تم نقل الموقع';

  @override
  String get fmAppFolderIntoSelf => 'لا يمكن نقل مجلد إلى داخل نفسه';

  @override
  String get fmAppFolderPh => 'مثال: العملاء';

  @override
  String get fmAppRenameFolder => 'إعادة تسمية المجلد';

  @override
  String get fmAppDeleteFolder => 'حذف المجلد';

  @override
  String fmAppDeleteFolderMsg(String name) {
    return 'هل تريد حذف المجلد <b>$name</b>؟';
  }

  @override
  String fmAppDeleteFolderConns(String n) {
    return '<br>ستُنقل مواقعه الـ$n إلى المجلد الأعلى.';
  }

  @override
  String get fmAppRootFolder => 'المستوى الأعلى (بدون مجلد)';

  @override
  String fmAppMoveTitle(String name) {
    return 'نقل «$name»';
  }

  @override
  String get fmAppTargetFolder => 'المجلد الهدف';

  @override
  String get fmAppDeleteConn => 'حذف الموقع';

  @override
  String fmAppDeleteConnMsg(String name, String target) {
    return 'هل تريد حذف الموقع <b>$name</b> ($target)؟';
  }

  @override
  String get fmFormTitleNew => 'موقع جديد';

  @override
  String fmFormTitleEdit(String name) {
    return 'خصائص الموقع: $name';
  }

  @override
  String get fmFormTabGeneral => 'عام';

  @override
  String get fmFormTabActions => 'الإجراءات';

  @override
  String get fmFormTabType => 'النوع';

  @override
  String get fmFormTabOptions => 'الخيارات';

  @override
  String get fmFormName => 'التسمية';

  @override
  String get fmFormNamePh => 'مثال: موقع الشركة';

  @override
  String get fmFormHost => 'عنوان المضيف';

  @override
  String get fmFormHostPh => 'ftp.example.com أو 192.168.1.10';

  @override
  String get fmFormPort => 'المنفذ';

  @override
  String get fmFormUser => 'اسم المستخدم';

  @override
  String get fmFormPassword => 'كلمة المرور';

  @override
  String get fmFormPwSaved => '•••••••• (محفوظة، اكتب لتغييرها)';

  @override
  String get fmFormLoginMethod => 'طريقة تسجيل الدخول';

  @override
  String get fmFormLoginNormal => 'عادية';

  @override
  String get fmFormLoginAnon => 'مجهول الهوية';

  @override
  String get fmFormAuth => 'مصادقة SFTP';

  @override
  String get fmFormPrivateKey => 'مفتاح خاص';

  @override
  String get fmFormKeyFile => 'ملف المفتاح الخاص';

  @override
  String get fmFormPassphrase => 'عبارة مرور المفتاح';

  @override
  String get fmFormPassSaved => '(محفوظة)';

  @override
  String get fmFormPassEmpty => 'اتركها فارغة إن لم توجد';

  @override
  String get fmFormFolder => 'المجلد';

  @override
  String get fmFormColor => 'اللون';

  @override
  String get fmFormComments => 'ملاحظات';

  @override
  String get fmFormRemoteDir => 'عند الاتصال، انتقل إلى هذا المجلد على الخادم';

  @override
  String get fmFormLocalDir => 'عند الاتصال، انتقل إلى هذا المجلد المحلي';

  @override
  String get fmFormLocalDirPh => 'مثال: C:\\Projects\\site';

  @override
  String get fmFormLastDir => 'الانتقال إلى آخر مجلد عملت فيه';

  @override
  String get fmFormLastDirHint =>
      'عند التفعيل، يُفتح الموقع في آخر مجلدين عملت فيهما على الخادم والكمبيوتر (بدلًا من المجلدات أعلاه).';

  @override
  String get fmFormLastDirNow => 'حاليًا:';

  @override
  String get fmFormCache => 'التخزين المؤقت للتصفح';

  @override
  String get fmFormCacheSession => 'استخدام ذاكرة التخزين المؤقت أثناء الجلسة';

  @override
  String get fmFormCacheAlways =>
      'استخدام ذاكرة التخزين المؤقت دائمًا (طالما التطبيق مفتوح)';

  @override
  String get fmFormCacheNever =>
      'عدم استخدام ذاكرة التخزين المؤقت (إعادة السرد دائمًا)';

  @override
  String get fmFormUploadCase =>
      'عند الرفع، طبّق هذه القاعدة على أسماء الملفات والمجلدات';

  @override
  String get fmFormCasePreserve => 'الإبقاء على حالة الأحرف';

  @override
  String get fmFormCaseLower => 'أحرف صغيرة';

  @override
  String get fmFormCaseUpper => 'أحرف كبيرة';

  @override
  String get fmFormTest => 'اختبار الاتصال';

  @override
  String get fmFormSaveConnect => 'حفظ واتصال';

  @override
  String get fmFormConnecting => 'جارٍ الاتصال…';

  @override
  String get fmFormTestOk => 'نجح الاتصال';

  @override
  String get fmFormTestFail => 'تعذّر الاتصال';

  @override
  String fmFormHomeDir(String dir) {
    return 'مجلد البدء: $dir';
  }

  @override
  String get fmFormRemoteDirMissing => 'تحذير: تعذّر فتح المجلد على الخادم.';

  @override
  String fmFormHostKey(String fp) {
    return 'مفتاح مضيف SSH (SHA256): $fp';
  }

  @override
  String get fmFormSaved => 'تم حفظ الموقع';

  @override
  String get fmFormChangesSaved => 'تم حفظ التغييرات';

  @override
  String get fmTypeProtocol => 'البروتوكول';

  @override
  String get fmTypeFtp => 'FTP (بروتوكول نقل الملفات القياسي)';

  @override
  String get fmTypeFtpsImplicit => 'FTP مع TLS/SSL (ضمني، المنفذ 990)';

  @override
  String get fmTypeFtpsSsl => 'FTP مع SSL (AUTH SSL، صريح)';

  @override
  String get fmTypeFtpsTls => 'FTP مع TLS/SSL (AUTH TLS، صريح)';

  @override
  String get fmTypeSftp => 'SFTP عبر SSH2 (الصدفة الآمنة)';

  @override
  String get fmTypeNoteFtp =>
      'يستخدم بروتوكول FTP القياسي لاتصالَي الأوامر والبيانات بشكل غير آمن (نص عادي).';

  @override
  String get fmTypeNoteFtpsImplicit =>
      'يُشفَّر الاتصال بـ TLS/SSL منذ البداية (عادةً المنفذ 990). الأوامر والبيانات محمية.';

  @override
  String get fmTypeNoteFtpsSsl =>
      'يتصل عبر FTP عادي ثم ينتقل إلى جلسة مشفّرة باستخدام AUTH SSL. الأوامر والبيانات محمية.';

  @override
  String get fmTypeNoteFtpsTls =>
      'يتصل عبر FTP عادي ثم ينتقل إلى جلسة مشفّرة باستخدام AUTH TLS (نوع FTPS الأكثر شيوعًا).';

  @override
  String get fmTypeNoteSftp =>
      'نقل ملفات مشفّر عبر SSH (المنفذ 22). سجّل الدخول بكلمة مرور أو مفتاح خاص؛ يُحفظ مفتاح المضيف عند أول اتصال.';

  @override
  String get fmTypeTransferType => 'نوع النقل';

  @override
  String get fmTypeBinary => 'ثنائي';

  @override
  String get fmTypeAscii => 'ASCII (نص)';

  @override
  String get fmTypeAuto => 'تلقائي (الملفات النصية كـ ASCII)';

  @override
  String fmTypeUseGlobal(String v) {
    return 'استخدام الإعداد العام ($v)';
  }

  @override
  String get fmTypeDataConn => 'اتصال البيانات';

  @override
  String get fmTypePassive => 'سلبي (PASV / EPSV)';

  @override
  String get fmTypeTimezone => 'فرق المنطقة الزمنية للخادم';

  @override
  String get fmTypeTzNone => 'بدون فرق';

  @override
  String get fmTypeTzHours => 'ساعات';

  @override
  String get fmTypeTimezoneHint =>
      'تُزاح أوقات الملفات التي يعرضها الخادم بهذا المقدار.';

  @override
  String get fmOptSiteOptions => 'خيارات خاصة بالموقع';

  @override
  String get fmOptUseGlobal => 'استخدام الإعدادات العامة لكل الخيارات';

  @override
  String get fmOptCustom => 'استخدام إعدادات خاصة بهذا الموقع';

  @override
  String get fmOptRetry => 'عدد محاولات الإعادة';

  @override
  String get fmOptRetryDelay => 'المهلة بين المحاولات (ث)';

  @override
  String get fmOptMaxConcurrent => 'الحد الأقصى لعمليات النقل المتزامنة';

  @override
  String get fmOptConflict => 'إذا وُجد ملف بالاسم نفسه';

  @override
  String get fmOptConflictOverwrite => 'استبدال';

  @override
  String get fmOptConflictRename => 'إعادة تسمية تلقائية (name (1).ext)';

  @override
  String get fmOptConflictSkip => 'تخطٍّ';

  @override
  String get fmOptEncoding => 'ترميز أسماء الملفات';

  @override
  String get fmOptEncAuto => 'تلقائي';

  @override
  String get fmSiteLocal => 'جهاز الكمبيوتر';

  @override
  String get fmSiteRemote => 'الخادم';

  @override
  String get fmSiteTransfers => 'عمليات النقل';

  @override
  String get fmSiteToggleLocal => 'إظهار/إخفاء جهاز الكمبيوتر (Ctrl+B)';

  @override
  String get fmSiteToggleTransfers => 'إظهار/إخفاء عمليات النقل (Ctrl+J)';

  @override
  String get fmSiteReconnect => 'إعادة الاتصال';

  @override
  String get fmSitePlaces => 'الوصول السريع ومحركات الأقراص';

  @override
  String get fmSiteUp => 'المجلد الأعلى (Backspace)';

  @override
  String get fmSiteHome => 'مجلد البدء';

  @override
  String get fmSiteColName => 'الاسم';

  @override
  String get fmSiteColSize => 'الحجم';

  @override
  String get fmSiteColDate => 'تاريخ التعديل';

  @override
  String get fmSiteLoading => 'جارٍ التحميل…';

  @override
  String get fmSiteEmptyDir => 'هذا المجلد فارغ';

  @override
  String get fmSiteDesktop => 'سطح المكتب';

  @override
  String get fmSiteDownloads => 'التنزيلات';

  @override
  String get fmSiteDocuments => 'المستندات';

  @override
  String get fmSiteHomeDir => 'مجلد المستخدم';

  @override
  String get fmSiteOpenExplorer => 'فتح في المستكشف';

  @override
  String get fmSiteOpenFile => 'فتح بالتطبيق الافتراضي';

  @override
  String get fmSiteShowExplorer => 'إظهار في المستكشف';

  @override
  String get fmSiteUpload => 'رفع';

  @override
  String fmSiteUploadN(String n) {
    return 'رفع $n عناصر';
  }

  @override
  String fmSiteUploadTo(String dir) {
    return 'الوجهة: $dir';
  }

  @override
  String get fmSiteDownload => 'تنزيل';

  @override
  String fmSiteDownloadN(String n) {
    return 'تنزيل $n عناصر';
  }

  @override
  String fmSiteDownloadTo(String dir) {
    return 'الوجهة: $dir';
  }

  @override
  String get fmSiteTrash => 'نقل إلى سلة المحذوفات';

  @override
  String get fmSiteTrashOk => 'نقل';

  @override
  String fmSiteTrashOne(String name) {
    return 'هل تريد نقل <b>$name</b> إلى سلة المحذوفات؟';
  }

  @override
  String fmSiteTrashMany(String n) {
    return 'هل تريد نقل $n عناصر إلى سلة المحذوفات؟';
  }

  @override
  String get fmSiteMkdirFail => 'تعذّر إنشاء المجلد';

  @override
  String get fmSiteRenameFail => 'تعذّرت إعادة التسمية';

  @override
  String get fmSiteDeleteFail => 'تعذّر الحذف';

  @override
  String get fmSiteDeleteTitle => 'حذف من الخادم';

  @override
  String fmSiteDelOne(String name) {
    return 'هل تريد حذف الملف <b>$name</b> من الخادم نهائيًا؟';
  }

  @override
  String fmSiteDelDirOne(String name) {
    return 'هل تريد حذف المجلد <b>$name</b> وكل محتوياته من الخادم نهائيًا؟';
  }

  @override
  String fmSiteDelMany(String n) {
    return 'هل تريد حذف $n عناصر (المجلدات مع كل محتوياتها) من الخادم نهائيًا؟';
  }

  @override
  String get fmSiteDeleting => 'جارٍ الحذف…';

  @override
  String get fmSiteDeleted => 'تم الحذف';

  @override
  String fmSiteItems(String n) {
    return '$n عناصر';
  }

  @override
  String get fmSiteOffline => 'غير متصل';

  @override
  String fmSiteLimit(String v) {
    return 'حد السرعة: $v';
  }

  @override
  String get fmSiteNoLimit => 'بلا حد للسرعة';

  @override
  String get fmSiteLimitTitle => 'تعيين حد السرعة';

  @override
  String fmSiteConnectFail(String msg) {
    return 'تعذّر الاتصال بالخادم: $msg';
  }

  @override
  String get fmSiteConnectFailTitle => 'فشل الاتصال';

  @override
  String get fmSiteStateConnected => 'متصل';

  @override
  String get fmSiteStateConnecting => 'جارٍ الاتصال…';

  @override
  String get fmSiteStateDisconnected => 'انقطع الاتصال';

  @override
  String get fmTrColName => 'الاسم';

  @override
  String get fmTrColSize => 'الحجم';

  @override
  String get fmTrColProgress => 'التقدم';

  @override
  String get fmTrColStatus => 'الحالة';

  @override
  String get fmTrEmpty =>
      'لا توجد عمليات نقل بعد.\nانقر بزر الماوس الأيمن على ملف أو مجلد واختر تنزيل / رفع، أو اسحبه بين اللوحتين.';

  @override
  String get fmTrQueued => 'في الانتظار';

  @override
  String get fmTrActive => 'جارٍ النقل';

  @override
  String get fmTrDone => 'اكتمل';

  @override
  String fmTrDoneFiles(String n) {
    return 'اكتمل $n ملف';
  }

  @override
  String get fmTrError => 'خطأ';

  @override
  String get fmTrCancelled => 'أُلغي';

  @override
  String get fmTrSkipped => 'تم التخطي (موجود)';

  @override
  String fmTrScanning(String n) {
    return 'جارٍ الفحص… $n ملف';
  }

  @override
  String get fmTrRetrying => 'ستُعاد المحاولة…';

  @override
  String get fmTrCancel => 'إلغاء';

  @override
  String get fmTrCancelDir => 'إلغاء نقل المجلد';

  @override
  String get fmTrCancelAll => 'إلغاء كل عمليات النقل';

  @override
  String get fmTrCancelAllMsg =>
      'هل تريد إلغاء كل عمليات النقل الجارية والمنتظرة؟';

  @override
  String get fmTrCancelAllOk => 'إلغاء الكل';

  @override
  String get fmTrRetry => 'إعادة المحاولة';

  @override
  String get fmTrShowLocal => 'إظهار في المستكشف';

  @override
  String get fmTrShowRemote => 'إظهار على الخادم';

  @override
  String get fmTrCopyError => 'نسخ رسالة الخطأ';

  @override
  String get fmTrRemove => 'إزالة من القائمة';

  @override
  String get fmTrRemoveRoot => 'إزالة عملية النقل هذه من القائمة';

  @override
  String get fmTrClearDone => 'مسح المكتملة';

  @override
  String fmTrActiveN(String n) {
    return '$n عمليات نقل جارية';
  }

  @override
  String get fmTrDownloadDone => 'اكتمل التنزيل';

  @override
  String get fmTrUploadDone => 'اكتمل الرفع';

  @override
  String fmTrDownloadFailed(String name) {
    return 'لم يكتمل التنزيل: $name';
  }

  @override
  String fmTrUploadFailed(String name) {
    return 'لم يكتمل الرفع: $name';
  }

  @override
  String fmTrFailedFiles(String n) {
    return 'فشل $n ملف';
  }

  @override
  String get fmMainErrAuth =>
      'فشل تسجيل الدخول: اسم المستخدم أو كلمة المرور غير صحيحة.';

  @override
  String get fmMainErrRefused => 'رُفض الاتصال: المنفذ مغلق أو الخادم لا يعمل.';

  @override
  String get fmMainErrTimeout => 'انتهت المهلة: تعذّر الوصول إلى الخادم.';

  @override
  String get fmMainErrDns => 'تعذّر تحليل اسم المضيف (DNS).';

  @override
  String get fmMainErrUnreach => 'لا يمكن الوصول إلى الخادم عبر الشبكة.';

  @override
  String get fmMainErrReset => 'أغلق الخادم الاتصال.';

  @override
  String get fmMainErrNotFound => 'لم يُعثر على الملف أو المجلد.';

  @override
  String get fmMainErrPerm => 'تم رفض الإذن.';

  @override
  String fmMainErr550(String msg) {
    return 'رفض الخادم العملية (550): $msg';
  }

  @override
  String get fmMainErr553 => 'لم يقبل الخادم اسم الملف (553).';

  @override
  String fmMainErrTls(String msg) {
    return 'خطأ TLS/SSL — تحقّق من البروتوكول أو المنفذ. ($msg)';
  }

  @override
  String fmMainErrHostKey(String newVal, String oldVal) {
    return 'تغيّر مفتاح مضيف الخادم! المحفوظ: $oldVal، المستلم: $newVal. رُفض الاتصال لأسباب أمنية.';
  }

  @override
  String get fmMainErrConnNotFound => 'لم يُعثر على الموقع';

  @override
  String get fmMainErrNoSession => 'غير متصل بالخادم';

  @override
  String get fmMainErrHost => 'عنوان المضيف مطلوب.';

  @override
  String get fmMainErrUser =>
      'اسم المستخدم مطلوب (أو اختر تسجيل الدخول المجهول).';

  @override
  String get fmMainPickKey => 'اختر ملف مفتاح خاص';

  @override
  String get fmMainCopySuffix => ' (نسخة)';

  @override
  String get fmMainCloseActive =>
      'لا تزال هناك عمليات نقل جارية. سيتم إلغاؤها إذا أغلقت هذه النافذة.';

  @override
  String get fmMainCloseAnyway => 'إغلاق على أي حال';

  @override
  String get sqAppSearchPh => 'البحث في الاتصالات…  (Ctrl+F)';

  @override
  String get sqAppNewConn => 'إضافة اتصال';

  @override
  String get sqAppAddConn => 'إضافة اتصال';

  @override
  String get sqAppSettings => 'الإعدادات';

  @override
  String sqAppStats(String c, String f) {
    return 'الاتصالات: $c · المجلدات: $f';
  }

  @override
  String get sqAppWelcome => 'مرحبًا';

  @override
  String sqAppResults(String q) {
    return 'نتائج «$q»';
  }

  @override
  String get sqAppAll => 'كل الاتصالات';

  @override
  String get sqAppWelcomeHint =>
      'اتصل بـ PostgreSQL أو SQL Server أو MySQL أو SQLite أو بملفات CSV/Parquet/Excel.<br>أدخل البيانات، واختبر الاتصال، ثم احفظه.';

  @override
  String get sqAppFolders => 'المجلدات';

  @override
  String get sqAppConnections => 'الاتصالات';

  @override
  String get sqAppDblHint => 'انقر نقرًا مزدوجًا على بطاقة لفتحها';

  @override
  String get sqAppNoMatch => 'لا توجد اتصالات مطابقة.';

  @override
  String sqAppFolderCount(String n) {
    return 'الاتصالات: $n';
  }

  @override
  String get sqAppNewConnHere => 'اتصال جديد في هذا المجلد';

  @override
  String get sqAppNewSubfolder => 'مجلد فرعي جديد';

  @override
  String get sqAppDuplicate => 'تكرار';

  @override
  String get sqAppMoveToFolder => 'نقل إلى مجلد…';

  @override
  String get sqAppConnMoved => 'تم نقل الاتصال';

  @override
  String get sqAppFolderIntoSelf => 'لا يمكن نقل مجلد إلى داخل نفسه';

  @override
  String get sqAppFolderPh => 'مثال: العملاء';

  @override
  String get sqAppRenameFolder => 'إعادة تسمية المجلد';

  @override
  String get sqAppDeleteFolder => 'حذف المجلد';

  @override
  String sqAppDeleteFolderMsg(String name) {
    return 'هل تريد حذف المجلد <b>$name</b>؟';
  }

  @override
  String sqAppDeleteFolderConns(String n) {
    return '<br>ستُنقل اتصالاته ($n) إلى المجلد الأصل.';
  }

  @override
  String get sqAppRootFolder => 'المستوى الأعلى (بدون مجلد)';

  @override
  String sqAppMoveTitle(String name) {
    return 'نقل «$name»';
  }

  @override
  String get sqAppTargetFolder => 'المجلد الهدف';

  @override
  String get sqAppDeleteConn => 'حذف الاتصال';

  @override
  String sqAppDeleteConnMsg(String name, String target) {
    return 'هل تريد حذف الاتصال <b>$name</b> ($target)؟ ستُحذف كلمة المرور المحفوظة أيضًا.';
  }

  @override
  String get sqAppReadOnlyTag => 'للقراءة فقط';

  @override
  String get sqAppWriteTag => 'قابل للكتابة';

  @override
  String get sqFormTitleNew => 'اتصال جديد';

  @override
  String sqFormTitleEdit(String name) {
    return 'الاتصال: $name';
  }

  @override
  String get sqFormTabGeneral => 'عام';

  @override
  String get sqFormTabSecurity => 'الأمان';

  @override
  String get sqFormTabSsh => 'نفق SSH';

  @override
  String get sqFormName => 'التسمية (الاسم المعروض)';

  @override
  String get sqFormNamePh => 'مثال: قاعدة بيانات الإنتاج';

  @override
  String get sqFormHost => 'المضيف';

  @override
  String get sqFormPort => 'المنفذ';

  @override
  String get sqFormUser => 'اسم المستخدم';

  @override
  String get sqFormPassword => 'كلمة المرور';

  @override
  String get sqFormPwSaved => '•••••••• (محفوظة، اكتب لتغييرها)';

  @override
  String get sqFormDatabase => 'قاعدة البيانات';

  @override
  String get sqFormDatabasePh =>
      'اتركه فارغًا لاستخدام قاعدة البيانات الافتراضية';

  @override
  String get sqFormFile => 'ملف قاعدة البيانات';

  @override
  String get sqFormFilePh => 'C:\\Data\\app.db';

  @override
  String get sqFormSqliteHint =>
      'ملف قاعدة بيانات SQLite (.db، .sqlite). في وضع القراءة فقط لا يُعدَّل الملف أبدًا.';

  @override
  String get sqFormDuckdbHint =>
      'اختر ملف .duckdb أو اتركه فارغًا (في الذاكرة). استعلم مباشرة من ملفات CSV وParquet وJSON وExcel: SELECT * FROM \'C:\\data\\sales.csv\'';

  @override
  String get sqFormInMemory => 'في الذاكرة';

  @override
  String get sqFormFolder => 'المجلد';

  @override
  String get sqFormColor => 'اللون';

  @override
  String get sqFormComments => 'ملاحظات';

  @override
  String get sqFormReadOnly => 'وضع القراءة فقط';

  @override
  String get sqFormReadOnlyHint =>
      'موصى به. تُحظر أوامر INSERT/UPDATE/DELETE وDDL قبل التنفيذ، ويمكنك الموافقة عليها لمرة واحدة. وحيثما كان مدعومًا، تكون الجلسة نفسها للقراءة فقط أيضًا.';

  @override
  String get sqFormSavePassword => 'حفظ كلمة المرور';

  @override
  String get sqFormSavePasswordHint =>
      'تُخزَّن كلمة المرور في سلسلة مفاتيح نظام التشغيل فقط (Windows: DPAPI). عند إيقاف الخيار، ستُطلب منك عند كل اتصال.';

  @override
  String get sqFormSsl => 'TLS / SSL';

  @override
  String get sqFormSslPrefer => 'تفضيل (مشفّر إذا كان الخادم يدعمه)';

  @override
  String get sqFormSslRequire => 'إلزامي (دون التحقق من الشهادة)';

  @override
  String get sqFormSslVerify => 'إلزامي + التحقق من الشهادة';

  @override
  String get sqFormSslDisable => 'إيقاف (غير مشفّر)';

  @override
  String get sqFormSslHint =>
      'تتم محاولة TLS افتراضيًا، وتُحذّرك نافذة الاتصال إذا كان الخادم لا يدعمه.';

  @override
  String get sqFormSshEnable => 'الاتصال عبر نفق SSH';

  @override
  String get sqFormSshHint =>
      'يتم الوصول إلى قاعدة البيانات عبر خادم SSH أولًا. يُوصى بالمصادقة بالمفتاح.';

  @override
  String get sqFormSshHost => 'خادم SSH';

  @override
  String get sqFormSshAuth => 'مصادقة SSH';

  @override
  String get sqFormSshKey => 'مفتاح خاص';

  @override
  String get sqFormSshAgent => 'الوكيل (Pageant)';

  @override
  String get sqFormKeyFile => 'ملف المفتاح الخاص';

  @override
  String get sqFormPassphrase => 'عبارة مرور المفتاح';

  @override
  String get sqFormPassSaved => '(محفوظة)';

  @override
  String get sqFormPassEmpty => 'اتركه فارغًا إن لم توجد';

  @override
  String get sqFormSshPassword => 'كلمة مرور SSH';

  @override
  String sqFormHostKey(String fp) {
    return 'مفتاح مضيف SSH: $fp';
  }

  @override
  String get sqFormTest => 'اختبار الاتصال';

  @override
  String get sqFormSaveConnect => 'حفظ وفتح';

  @override
  String get sqFormConnecting => 'جارٍ الاتصال…';

  @override
  String get sqFormTestOk => 'نجح الاتصال';

  @override
  String get sqFormTestFail => 'تعذّر الاتصال';

  @override
  String sqFormTestDb(String db, String user) {
    return 'قاعدة البيانات: $db · المستخدم: $user';
  }

  @override
  String get sqFormNoTls => 'تحذير: الاتصال غير مشفّر (الخادم لا يدعم TLS).';

  @override
  String get sqFormSaved => 'تم حفظ الاتصال';

  @override
  String get sqFormChangesSaved => 'تم حفظ التغييرات';

  @override
  String get sqCwObjects => 'الكائنات';

  @override
  String get sqCwCollapseAll => 'طي الكل';

  @override
  String get sqCwFilterPh => 'تصفية الكائنات المحمّلة…';

  @override
  String get sqCwEmpty => '(فارغ)';

  @override
  String get sqCwOpenData => 'فتح البيانات';

  @override
  String get sqCwShowDdl => 'عرض DDL';

  @override
  String get sqCwOpenCode => 'فتح الشيفرة';

  @override
  String get sqCwSelectSql => 'إنشاء SELECT';

  @override
  String get sqCwAddToBuilder => 'إضافة إلى منشئ الاستعلامات';

  @override
  String get sqCwNewSqlHere => 'SQL جديد هنا';

  @override
  String get sqCwCopyName => 'نسخ الاسم';

  @override
  String get sqCwCopied => 'تم النسخ إلى الحافظة';

  @override
  String get sqCwNewSql => 'SQL جديد';

  @override
  String get sqCwBuilder => 'منشئ الاستعلامات';

  @override
  String get sqCwReconnect => 'إعادة الاتصال';

  @override
  String get sqCwReadOnly => 'للقراءة فقط';

  @override
  String get sqCwReadWrite => 'الكتابة مفعّلة';

  @override
  String get sqCwReadOnlyTip =>
      'للقراءة فقط: أوامر DML/DDL تحتاج إلى موافقة. انقر للإيقاف';

  @override
  String get sqCwReadWriteTip =>
      'الكتابة مفعّلة: تُنفَّذ الأوامر دون موافقة. انقر للعودة إلى القراءة فقط';

  @override
  String get sqCwDisableRo => 'إيقاف وضع القراءة فقط؟';

  @override
  String get sqCwDisableRoMsg =>
      'حتى إغلاق هذه النافذة، ستُنفَّذ أوامر INSERT/UPDATE/DELETE وDDL دون سؤال.';

  @override
  String get sqCwDisableRoOk => 'السماح بالكتابة';

  @override
  String get sqCwRoOn => 'وضع القراءة فقط مفعّل';

  @override
  String get sqCwRoOff => 'الكتابة مسموحة — كن حذرًا';

  @override
  String get sqCwPasswordTitle => 'كلمة المرور مطلوبة';

  @override
  String sqCwPasswordFor(String host, String user) {
    return 'كلمة المرور لـ $user@$host';
  }

  @override
  String get sqCwNotConnected => 'غير متصل';

  @override
  String get sqCwConnected => 'متصل';

  @override
  String get sqCwConnecting => 'جارٍ الاتصال…';

  @override
  String get sqCwNoTls => 'غير مشفّر';

  @override
  String get sqCwConnectFailed => 'تعذّر الاتصال';

  @override
  String get sqCwRetry => 'إعادة المحاولة';

  @override
  String get sqCwResetCancel =>
      'لم يستجب الاستعلام للإلغاء؛ جارٍ إعادة الاتصال.';

  @override
  String get sqCwResetExit =>
      'انقطع الاتصال بقاعدة البيانات؛ جارٍ إعادة الاتصال.';

  @override
  String get sqCwEmptyWorkspace =>
      'انقر نقرًا مزدوجًا على جدول في الشجرة أو اضغط Ctrl+T لفتح علامة تبويب SQL جديدة.';

  @override
  String get sqCwCloseTab => 'إغلاق علامة التبويب؟';

  @override
  String sqCwCloseTabMsg(String name) {
    return 'لم يتم حفظ SQL في «$name».';
  }

  @override
  String get sqCwCloseTabOk => 'إغلاق';

  @override
  String get sqTreeTables => 'الجداول';

  @override
  String get sqTreeViews => 'طرق العرض';

  @override
  String get sqTreeMatviews => 'طرق العرض المادية';

  @override
  String get sqTreeForeignTables => 'الجداول الخارجية';

  @override
  String get sqTreeFunctions => 'الدوال';

  @override
  String get sqTreeProcedures => 'الإجراءات';

  @override
  String get sqTreeTriggers => 'المشغّلات';

  @override
  String get sqTreeSequences => 'التسلسلات';

  @override
  String get sqTreeTypes => 'الأنواع';

  @override
  String get sqTreeColumns => 'الأعمدة';

  @override
  String get sqTreeIndexes => 'الفهارس';

  @override
  String get sqTreeConstraints => 'القيود';

  @override
  String get sqTreeFiles => 'الملفات';

  @override
  String get sqKindTable => 'جدول';

  @override
  String get sqKindView => 'طريقة عرض';

  @override
  String get sqKindMatview => 'طريقة عرض مادية';

  @override
  String get sqKindForeignTable => 'جدول خارجي';

  @override
  String get sqKindFunction => 'دالة';

  @override
  String get sqKindProcedure => 'إجراء';

  @override
  String get sqKindTrigger => 'مشغّل';

  @override
  String get sqKindSequence => 'تسلسل';

  @override
  String get sqKindType => 'نوع';

  @override
  String get sqKindIndex => 'فهرس';

  @override
  String get sqKindConstraint => 'قيد';

  @override
  String get sqSqlRun => 'تشغيل';

  @override
  String get sqSqlRunStatement => 'تشغيل العبارة';

  @override
  String get sqSqlCancel => 'إلغاء';

  @override
  String get sqSqlDatabase => 'قاعدة البيانات';

  @override
  String get sqSqlHistory => 'السجل';

  @override
  String get sqSqlExport => 'تصدير';

  @override
  String get sqSqlRunning => 'جارٍ التشغيل…';

  @override
  String sqSqlDone(String ms) {
    return 'اكتمل · $ms ms';
  }

  @override
  String sqSqlDoneErrors(String ms, String n) {
    return 'الأخطاء: $n · $ms ms';
  }

  @override
  String get sqSqlDdlHint =>
      'تغيّر المخطط: استخدم «تحديث» لإعادة تحميل الشجرة.';

  @override
  String get sqSqlPlaceholder =>
      'اكتب SQL… Ctrl+Enter: تشغيل المحدد/الكل · Ctrl+Shift+Enter: العبارة عند المؤشر · Ctrl+Space: الإكمال';

  @override
  String sqSqlTabTitle(String n) {
    return 'SQL $n';
  }

  @override
  String get sqSqlHistoryEmpty => 'لا يوجد سجل لهذا الاتصال.';

  @override
  String get sqSqlRowsShort => 'صفوف';

  @override
  String sqResResult(String n) {
    return 'النتيجة $n';
  }

  @override
  String get sqResMessages => 'الرسائل';

  @override
  String sqResRows(String ms, String n) {
    return 'الصفوف: $n · $ms ms';
  }

  @override
  String sqResRowsTruncated(String ms, String n) {
    return 'عرض أول $n صف (الحد) · $ms ms';
  }

  @override
  String get sqResNoRows => 'لا توجد صفوف';

  @override
  String sqResAffected(String cmd, String ms, String n) {
    return '$cmd: الصفوف المتأثرة: $n · $ms ms';
  }

  @override
  String sqResCommand(String cmd, String ms) {
    return '$cmd · $ms ms';
  }

  @override
  String get sqResCancelled => 'أُلغي';

  @override
  String get sqGridCopy => 'نسخ';

  @override
  String get sqGridCopyHeaders => 'نسخ مع العناوين';

  @override
  String get sqGridExport => 'تصدير هذه النتيجة…';

  @override
  String get sqDataColumns => 'الأعمدة';

  @override
  String sqDataColumnsHidden(String n, String total) {
    return 'الأعمدة ($n/$total)';
  }

  @override
  String get sqDataAddFilter => 'تصفية';

  @override
  String get sqDataLimit => 'عدد الصفوف';

  @override
  String sqDataFirstN(String n) {
    return 'أول $n';
  }

  @override
  String get sqDataAll => 'الكل (محدود)';

  @override
  String get sqDataOpenInEditor => 'فتح في محرر SQL';

  @override
  String get sqDataClearFilters => 'مسح عوامل التصفية';

  @override
  String sqDataRows(String ms, String n) {
    return 'الصفوف: $n · $ms ms';
  }

  @override
  String sqDataRowsMore(String ms, String n) {
    return 'أول $n صف · $ms ms';
  }

  @override
  String get sqDataError => 'تعذّر تحميل البيانات';

  @override
  String get sqDataSortAsc => 'فرز تصاعدي';

  @override
  String get sqDataSortDesc => 'فرز تنازلي';

  @override
  String get sqDataSortClear => 'مسح الفرز';

  @override
  String get sqDataFilterColumn => 'التصفية حسب هذا العمود…';

  @override
  String get sqDataHideColumn => 'إخفاء العمود';

  @override
  String get sqDataShowAll => 'إظهار كل الأعمدة';

  @override
  String sqDataFilterEq(String v) {
    return 'يساوي «$v»';
  }

  @override
  String sqDataFilterNe(String v) {
    return 'لا يساوي «$v»';
  }

  @override
  String get sqDataFilterNull => 'NULL / ليس NULL';

  @override
  String get sqDataColumn => 'العمود';

  @override
  String get sqDataOperator => 'الشرط';

  @override
  String get sqDataValue => 'القيمة';

  @override
  String get sqDataInHint => 'في «ضمن القائمة»، افصل القيم بفواصل.';

  @override
  String get sqDataFilterTitle => 'تصفية';

  @override
  String get sqDataSelectAll => 'الكل';

  @override
  String get sqDataSelectNone => 'لا شيء';

  @override
  String get sqOpContains => 'يحتوي على';

  @override
  String get sqOpStarts => 'يبدأ بـ';

  @override
  String get sqOpEnds => 'ينتهي بـ';

  @override
  String get sqOpLike => 'LIKE';

  @override
  String get sqOpIn => 'ضمن القائمة';

  @override
  String get sqCodeExecute => 'تنفيذ';

  @override
  String get sqCodeLoading => 'جارٍ التحميل…';

  @override
  String get sqCodeEmpty => 'لم يُعثر على تعريف';

  @override
  String get sqQbAddTable => 'إضافة جدول';

  @override
  String get sqQbLimit => 'الحد';

  @override
  String get sqQbClear => 'مسح';

  @override
  String get sqQbHint =>
      'اسحب الجداول إلى هنا من الشجرة أو انقر «إضافة جدول». اسحب عمودًا إلى عمود في جدول آخر لإنشاء JOIN.';

  @override
  String get sqQbColumns => 'الأعمدة';

  @override
  String get sqQbConditions => 'الشروط';

  @override
  String get sqQbResults => 'النتائج';

  @override
  String get sqQbGenerated => 'SQL المُنشأ';

  @override
  String get sqQbRegenerate => 'إعادة الإنشاء من المخطط';

  @override
  String get sqQbOtherDb =>
      'يعمل منشئ الاستعلامات مع جداول من قاعدة بيانات واحدة فقط.';

  @override
  String get sqQbDragJoin => 'اسحب إلى عمود في جدول آخر لإنشاء JOIN';

  @override
  String get sqQbSwapJoin => 'عكس الاتجاه';

  @override
  String get sqQbDeleteJoin => 'حذف JOIN';

  @override
  String get sqQbNoColumns =>
      'حدّد مربعات الأعمدة في الجداول (بدون تحديد = SELECT *).';

  @override
  String get sqQbOutput => 'إظهار';

  @override
  String get sqQbColumn => 'العمود';

  @override
  String get sqQbAlias => 'الاسم المستعار';

  @override
  String get sqQbAggregate => 'التجميع';

  @override
  String get sqQbSort => 'الفرز';

  @override
  String get sqQbAddCondition => 'إضافة شرط';

  @override
  String sqQbTabTitle(String n) {
    return 'استعلام $n';
  }

  @override
  String get sqRoTitle => 'وضع القراءة فقط';

  @override
  String get sqRoMessage =>
      'هذا الاتصال في وضع القراءة فقط. قد تُغيّر العبارات التالية البيانات أو المخطط:';

  @override
  String get sqRoHint =>
      'يمكنك السماح بها لهذا التشغيل فقط؛ ثم يعود وضع القراءة فقط بعد ذلك.';

  @override
  String get sqRoRunOnce => 'تشغيل لمرة واحدة';

  @override
  String get sqRoNotRun => 'وضع القراءة فقط: لم يُنفَّذ';

  @override
  String sqRoBlockedMsg(String n) {
    return 'وضع القراءة فقط: $n من العبارات تحتاج إلى موافقة.';
  }

  @override
  String get sqExpTitle => 'تصدير';

  @override
  String get sqExpHint =>
      'يُعاد تشغيل الاستعلام دون حد للصفوف وتُكتب النتائج مباشرة إلى الملف.';

  @override
  String get sqExpRunning => 'جارٍ التصدير…';

  @override
  String sqExpDone(String n) {
    return 'تم تصدير $n صف';
  }

  @override
  String get sqExpFailed => 'فشل التصدير';

  @override
  String get sqErrRefused => 'رُفض الاتصال: المنفذ مغلق أو الخادم لا يعمل.';

  @override
  String get sqErrDns => 'تعذّر حل اسم المضيف (DNS).';

  @override
  String get sqErrTimeout => 'انتهت المهلة: تعذّر الوصول إلى الخادم.';

  @override
  String get sqErrReset => 'أغلق الخادم الاتصال.';

  @override
  String get sqErrUnreach => 'لا يمكن الوصول إلى الخادم عبر الشبكة.';

  @override
  String get sqErrSshAuth =>
      'فشل تسجيل الدخول عبر SSH: اسم المستخدم أو المفتاح أو كلمة المرور غير صحيح.';

  @override
  String sqErrTls(String msg) {
    return 'خطأ TLS/SSL — تعذّر التحقق من الشهادة أو أن الخادم لا يدعم TLS. ($msg)';
  }

  @override
  String get sqErrHostExit => 'انتهت عملية قاعدة البيانات بشكل غير متوقع.';

  @override
  String get sqErrUnknown => 'خطأ غير معروف';

  @override
  String get sqMainCloseAnyway => 'إغلاق على أي حال';

  @override
  String get sqMainCloseRunning =>
      'لا تزال هناك استعلامات قيد التشغيل. سيتم إلغاؤها إذا أغلقت هذه النافذة.';

  @override
  String get sqMainCopySuffix => ' (نسخة)';

  @override
  String get sqMainErrConnNotFound => 'لم يُعثر على الاتصال';

  @override
  String get sqMainErrNoSession => 'لا يوجد اتصال لهذه النافذة';

  @override
  String sqMainErrKeyFile(String path) {
    return 'تعذّرت قراءة ملف مفتاح SSH: $path';
  }

  @override
  String get sqMainTrayShow => 'إظهار SQL Master';

  @override
  String get sqMainTrayQuick => 'اتصال سريع';

  @override
  String get sqMainTrayNone => 'لا توجد اتصالات محفوظة';

  @override
  String get sqMainTrayQuit => 'خروج';

  @override
  String get npKindSsh => 'مشروع SSH';

  @override
  String get npKindFtp => 'مشروع FTP';

  @override
  String get npKindLocal => 'مجلد محلي';

  @override
  String get npKindFile => 'ملف مشروع';

  @override
  String get npKindSshHint => 'مجلد على الخادم عبر SSH (SFTP)';

  @override
  String get npKindFtpHint => 'خادم FTP أو FTPS أو SFTP';

  @override
  String get npKindLocalHint => 'مجلد على هذا الكمبيوتر';

  @override
  String get npKindFileHint => 'تحرير ملف واحد';

  @override
  String get npAppSearchPh => 'ابحث في الاتصالات…  (Ctrl+F)';

  @override
  String get npAppNewConn => 'اتصال جديد';

  @override
  String get npAppSettings => 'الإعدادات';

  @override
  String npAppStats(String c, String f) {
    return '$c اتصال · $f مجلد';
  }

  @override
  String get npAppWelcome => 'مرحبًا';

  @override
  String npAppResults(String q) {
    return 'نتائج «$q»';
  }

  @override
  String get npAppAll => 'كل الاتصالات';

  @override
  String get npAppWelcomeHint =>
      'أضف خادم SSH أو FTP أو مجلدًا محليًا أو ملفًا واحدًا.<br>انقر نقرًا مزدوجًا على بطاقة لفتح المشروع في نافذة مستقلة.';

  @override
  String get npAppFolders => 'المجلدات';

  @override
  String get npAppConnections => 'الاتصالات';

  @override
  String get npAppDblHint => 'انقر نقرًا مزدوجًا على البطاقة لفتحها';

  @override
  String get npAppNoMatch => 'لا توجد اتصالات مطابقة.';

  @override
  String npAppFolderCount(String n) {
    return '$n اتصال';
  }

  @override
  String get npAppNewConnHere => 'اتصال جديد في هذا المجلد';

  @override
  String get npAppNewSubfolder => 'مجلد فرعي جديد';

  @override
  String get npAppKeyTag => 'مفتاح';

  @override
  String get npAppDuplicate => 'إنشاء نسخة';

  @override
  String get npAppMoveToFolder => 'نقل إلى مجلد…';

  @override
  String get npAppConnMoved => 'تم نقل الاتصال';

  @override
  String get npAppFolderIntoSelf => 'لا يمكن نقل مجلد إلى داخل نفسه';

  @override
  String get npAppFolderPh => 'مثال: العملاء';

  @override
  String get npAppRenameFolder => 'إعادة تسمية المجلد';

  @override
  String get npAppDeleteFolder => 'حذف المجلد';

  @override
  String npAppDeleteFolderMsg(String name) {
    return 'هل تريد حذف المجلد <b>$name</b>؟';
  }

  @override
  String npAppDeleteFolderConns(String n) {
    return '<br>ستُنقل اتصالاته الـ$n إلى المجلد الأعلى.';
  }

  @override
  String get npAppRootFolder => 'المستوى الأعلى (بدون مجلد)';

  @override
  String npAppMoveTitle(String name) {
    return 'نقل «$name»';
  }

  @override
  String get npAppTargetFolder => 'المجلد الهدف';

  @override
  String get npAppDeleteConn => 'حذف الاتصال';

  @override
  String npAppDeleteConnMsg(String name, String target) {
    return 'هل تريد حذف الاتصال <b>$name</b> ($target)؟<br>لن تُمس الملفات الموجودة على الخادم أو في المجلد؛ يُحذف هذا الاتصال ونسخة العمل الخاصة به فقط.';
  }

  @override
  String get npAppNoLocalPath =>
      'لم يُختر مسار على هذا الكمبيوتر — سيُطلب منك عند الفتح';

  @override
  String get npAppChangeLocalPath => 'تغيير المسار على هذا الكمبيوتر…';

  @override
  String get npAppOpenTabs => 'علامات التبويب المفتوحة';

  @override
  String get npAppCustomEditor => 'إعدادات محرر خاصة بالاتصال';

  @override
  String get npFormTitleNew => 'اتصال جديد';

  @override
  String npFormTitleEdit(String name) {
    return 'الاتصال: $name';
  }

  @override
  String get npFormTabConn => 'الاتصال';

  @override
  String get npFormTabProject => 'المشروع';

  @override
  String get npFormTabEditor => 'المحرر (Notepad++)';

  @override
  String get npFormName => 'الاسم (المعروض)';

  @override
  String get npFormNamePh => 'مثال: موقع الشركة';

  @override
  String get npFormHost => 'عنوان الخادم';

  @override
  String get npFormHostPh => 'server.example.com أو 192.168.1.10';

  @override
  String get npFormPort => 'المنفذ';

  @override
  String get npFormUser => 'اسم المستخدم';

  @override
  String get npFormPassword => 'كلمة المرور';

  @override
  String get npFormPwSaved => '•••••••• (محفوظة — اكتب لتغييرها)';

  @override
  String get npFormLoginMethod => 'طريقة تسجيل الدخول';

  @override
  String get npFormLoginNormal => 'عادي';

  @override
  String get npFormLoginAnon => 'مجهول';

  @override
  String get npFormAuth => 'مصادقة SSH';

  @override
  String get npFormPrivateKey => 'مفتاح خاص';

  @override
  String get npFormKeyFile => 'ملف المفتاح الخاص';

  @override
  String get npFormPassphrase => 'عبارة مرور المفتاح';

  @override
  String get npFormPassSaved => '(محفوظة)';

  @override
  String get npFormPassEmpty => 'اتركها فارغة إن لم توجد';

  @override
  String get npFormFolder => 'المجلد';

  @override
  String get npFormColor => 'اللون';

  @override
  String get npFormComments => 'ملاحظات';

  @override
  String get npFormRootDir => 'مجلد المشروع (على الخادم)';

  @override
  String get npFormBrowse => 'اختيار مجلد';

  @override
  String get npFormBrowseHint =>
      'اضغط «اختبار الاتصال» أولًا لتصفح الخادم واختيار المجلد. إذا تُرك فارغًا يُفتح مجلد تسجيل الدخول.';

  @override
  String get npFormBrowseTitle => 'اختر مجلدًا على الخادم';

  @override
  String get npFormBrowseSelect => 'اختيار هذا المجلد';

  @override
  String get npFormBrowseEmpty => 'لا توجد مجلدات فرعية';

  @override
  String get npFormFolderPath => 'المجلد';

  @override
  String get npFormFilePath => 'الملف';

  @override
  String get npFormLocalPathHint =>
      'يُحفظ المسار المحلي على هذا الكمبيوتر فقط؛ وتطلبه أجهزة الكمبيوتر الأخرى عند الفتح لأول مرة.';

  @override
  String get npFormCacheNote =>
      'يُحفظ كل ملف مفتوح مع بنية مجلداته في نسخة عمل (ذاكرة تخزين مؤقت). عند الحفظ يُرفع الملف إلى الخادم وتُحدَّث نسخة العمل.';

  @override
  String get npFormRestoreTabs => 'تذكّر علامات التبويب المفتوحة';

  @override
  String get npFormRestoreTabsHint =>
      'يُعاد فتح المشروع بالملفات نفسها في المرة القادمة (على هذا الكمبيوتر فقط).';

  @override
  String get npFormShowHidden => 'إظهار الملفات المخفية';

  @override
  String get npFormShowHiddenHint =>
      'الملفات والمجلدات التي تبدأ بنقطة (.env، .htaccess، .git…)';

  @override
  String get npFormExclude => 'الإخفاء في الشجرة';

  @override
  String get npFormExcludeHint =>
      'أسماء أو أنماط مفصولة بفواصل؛ يُسمح باستخدام * و ?.';

  @override
  String get npFormEditorMode => 'إعدادات المحرر';

  @override
  String get npFormEdGlobal =>
      'استخدام إعدادات المحرر العامة (الإعدادات › المحرر)';

  @override
  String get npFormEdCustom => 'استخدام إعدادات خاصة بهذا الاتصال';

  @override
  String get npFormTest => 'اختبار الاتصال';

  @override
  String get npFormSaveOpen => 'حفظ وفتح';

  @override
  String get npFormConnecting => 'جارٍ الاتصال…';

  @override
  String get npFormTestOk => 'نجح الاتصال';

  @override
  String get npFormTestFail => 'تعذّر الاتصال';

  @override
  String npFormHomeDir(String dir) {
    return 'مجلد تسجيل الدخول: $dir';
  }

  @override
  String get npFormRootMissing => 'تحذير: تعذّر فتح مجلد المشروع.';

  @override
  String npFormHostKey(String fp) {
    return 'مفتاح مضيف SSH (SHA256): $fp';
  }

  @override
  String get npFormSaved => 'تم حفظ الاتصال';

  @override
  String get npFormChangesSaved => 'تم حفظ التغييرات';

  @override
  String get npTypeProtocol => 'البروتوكول';

  @override
  String get npTypeFtp => 'FTP (قياسي)';

  @override
  String get npTypeFtpsImplicit => 'FTPS — TLS/SSL ضمني (المنفذ 990)';

  @override
  String get npTypeFtpsSsl => 'FTPS — صريح (AUTH SSL)';

  @override
  String get npTypeFtpsTls => 'FTPS — صريح (AUTH TLS)';

  @override
  String get npTypeSftp => 'SFTP — SSH2';

  @override
  String get npTypeNoteFtp =>
      'FTP عادي؛ تُرسَل كلمة المرور والملفات دون تشفير.';

  @override
  String get npTypeNoteFtpsImplicit =>
      'يُشفَّر الاتصال بـ TLS/SSL منذ البداية (عادةً المنفذ 990).';

  @override
  String get npTypeNoteFtpsSsl =>
      'يتصل عبر FTP عادي ثم ينتقل إلى جلسة مشفّرة باستخدام AUTH SSL.';

  @override
  String get npTypeNoteFtpsTls =>
      'يتصل عبر FTP عادي ثم ينتقل إلى جلسة مشفّرة باستخدام AUTH TLS (نوع FTPS الأكثر شيوعًا).';

  @override
  String get npTypeNoteSftp =>
      'وصول مشفّر إلى الملفات عبر SSH (المنفذ 22). يُحفظ مفتاح مضيف الخادم عند أول اتصال.';

  @override
  String get npOptEncoding => 'ترميز أسماء الملفات';

  @override
  String get npOptEncAuto => 'تلقائي';

  @override
  String get npEdSecEncoding => 'الترميز ونهايات الأسطر';

  @override
  String get npEdEncoding => 'الترميز عند فتح الملفات';

  @override
  String get npEdEncAuto => 'اكتشاف تلقائي (BOM / UTF-8)';

  @override
  String get npEdFallback => 'إن لم يكن UTF-8 (ANSI)';

  @override
  String get npEdEol => 'نهايات الأسطر';

  @override
  String get npEdEolAuto => 'الإبقاء على نهايات الملف الأصلية';

  @override
  String npEdEolConvert(String eol) {
    return 'التحويل إلى $eol عند الفتح';
  }

  @override
  String get npEdNewDoc => 'ملف جديد: الترميز · نهاية السطر';

  @override
  String get npEdSecIndent => 'المسافة البادئة واللغة';

  @override
  String get npEdTabSize => 'حجم علامة الجدولة';

  @override
  String get npEdLanguage => 'اللغة (بناء الجملة)';

  @override
  String get npEdLangAuto => 'تلقائي (الامتداد / السطر الأول)';

  @override
  String get npEdInsertSpaces => 'إدراج مسافات بدل علامات الجدولة';

  @override
  String get npEdDetectIndent => 'اكتشاف المسافة البادئة من الملف';

  @override
  String get npEdDetectIndentHint =>
      'الملفات المزاحة بعلامات الجدولة تستمر في استخدامها.';

  @override
  String get npEdAutoIndent => 'مسافة بادئة تلقائية';

  @override
  String get npEdAutoClose => 'إغلاق الأقواس وعلامات الاقتباس تلقائيًا';

  @override
  String get npEdSecLook => 'المظهر';

  @override
  String get npEdTheme => 'سمة الألوان';

  @override
  String get npEdThemeAuto => 'تلقائي (حسب سمة التطبيق)';

  @override
  String get npEdWhitespace => 'إظهار المسافات وعلامات الجدولة';

  @override
  String get npEdWsNone => 'عدم الإظهار';

  @override
  String get npEdWsBoundary => 'الكل باستثناء المسافات المفردة بين الكلمات';

  @override
  String get npEdWsTrailing => 'الزائدة في نهاية السطر فقط';

  @override
  String get npEdWsAll => 'الكل';

  @override
  String get npEdFont => 'الخط';

  @override
  String get npEdFontSize => 'الحجم';

  @override
  String get npEdRulers => 'المساطر';

  @override
  String get npEdWordWrap => 'التفاف الأسطر';

  @override
  String get npEdLineNumbers => 'أرقام الأسطر';

  @override
  String get npEdHighlightLine => 'تمييز السطر الحالي';

  @override
  String get npEdSmartHighlight => 'تمييز ذكي (الكلمات المتطابقة)';

  @override
  String get npEdIndentGuides => 'أدلة المسافة البادئة';

  @override
  String get npEdFolding => 'طي التعليمات البرمجية';

  @override
  String get npEdBracketColors => 'تلوين أزواج الأقواس';

  @override
  String get npEdMinimap => 'خريطة مصغّرة (خريطة المستند)';

  @override
  String get npEdControlChars => 'إظهار الأحرف غير المرئية';

  @override
  String get npEdSecSave => 'الحفظ';

  @override
  String get npEdTrimTrailing =>
      'حذف المسافات الزائدة في نهاية الأسطر عند الحفظ';

  @override
  String get npEdFinalNewline => 'إدراج سطر جديد في نهاية الملف';

  @override
  String get npEdCheckRemote => 'التحقق من التغييرات قبل الحفظ';

  @override
  String get npEdCheckRemoteHint =>
      'يسألك إذا غيّر شخص آخر الملف على الخادم بعد فتحك له.';

  @override
  String get npEdAutoSave => 'حفظ تلقائي';

  @override
  String get npEdSec => 'ث';

  @override
  String get npEdAutoSaveHint =>
      '0 = متوقف. عند التفعيل يُحفظ الملف ويُرفع إلى الخادم بعد هذه المدة من آخر تغيير.';

  @override
  String get npMainBalloonTitle => 'يعمل Notepad Master في الخلفية';

  @override
  String get npMainBalloonBody => 'انقر أيقونة العلبة لفتحه مجددًا.';

  @override
  String get npMainTrayShow => 'إظهار Notepad Master';

  @override
  String get npMainTrayQuick => 'فتح سريع';

  @override
  String get npMainTrayNone => 'لا توجد اتصالات محفوظة';

  @override
  String get npMainTrayQuit => 'خروج';

  @override
  String get npProjToggleTree => 'إظهار/إخفاء شجرة المجلدات (Ctrl+B)';

  @override
  String get npProjReconnect => 'إعادة الاتصال';

  @override
  String get npProjReconnected => 'تمت إعادة الاتصال';

  @override
  String get npProjConnectFail => 'تعذّر الاتصال';

  @override
  String get npProjStatusOn => 'متصل';

  @override
  String get npProjStatusOff => 'غير متصل';

  @override
  String get npProjStatusConnecting => 'جارٍ الاتصال…';

  @override
  String get npProjSave => 'حفظ';

  @override
  String get npProjSaveAll => 'حفظ الكل';

  @override
  String get npProjUndo => 'تراجع';

  @override
  String get npProjRedo => 'إعادة';

  @override
  String get npProjFind => 'بحث';

  @override
  String get npProjReplace => 'استبدال';

  @override
  String get npProjGoto => 'الانتقال إلى سطر';

  @override
  String get npProjShowWs => 'إظهار المسافات وعلامات الجدولة';

  @override
  String get npProjZoomIn => 'تكبير';

  @override
  String get npProjZoomOut => 'تصغير';

  @override
  String get npProjShowCache => 'إظهار نسخة العمل';

  @override
  String get npProjPalette => 'لوحة الأوامر';

  @override
  String get npProjCloseTab => 'إغلاق';

  @override
  String get npProjCloseOthers => 'إغلاق الأخرى';

  @override
  String get npProjCloseAll => 'إغلاق الكل';

  @override
  String get npProjReload => 'إعادة التحميل';

  @override
  String npProjReloadMsg(String name) {
    return 'ستُفقد التغييرات غير المحفوظة في <b>$name</b>. هل تريد إعادة تحميل الملف؟';
  }

  @override
  String get npProjRevealTree => 'إظهار في الشجرة';

  @override
  String get npProjUnsavedTitle => 'تغييرات غير محفوظة';

  @override
  String npProjUnsavedMsg(String name) {
    return 'هل تريد حفظ التغييرات في <b>$name</b>؟';
  }

  @override
  String get npProjDontSave => 'عدم الحفظ';

  @override
  String npProjOpenFail(String name) {
    return 'تعذّر فتح $name';
  }

  @override
  String npProjTooLarge(String name, String size) {
    return '$name كبير جدًا ($size)؛ الحد الأقصى 50 ميغابايت.';
  }

  @override
  String npProjBinary(String name) {
    return '$name ليس ملفًا نصيًا (ثنائي)؛ لم يُفتح في المحرر.';
  }

  @override
  String npProjSaveFail(String name) {
    return 'تعذّر حفظ $name';
  }

  @override
  String npProjSaved(String name) {
    return 'تم حفظ $name';
  }

  @override
  String npProjSavedRemote(String name) {
    return 'تم حفظ $name ورفعه';
  }

  @override
  String get npProjLossyTitle => 'تحذير الترميز';

  @override
  String npProjLossyMsg(String enc) {
    return 'لا يمكن تخزين بعض الأحرف في ترميز <b>$enc</b> وستُحفظ كـ «?». يُنصح بالتحويل إلى UTF-8 من شريط الحالة.';
  }

  @override
  String get npProjSaveAnyway => 'الحفظ على أي حال';

  @override
  String get npProjConflictTitle => 'تغيّر الملف في مكان آخر';

  @override
  String npProjConflictMsg(String name) {
    return 'تم تغيير <b>$name</b> على الخادم بعد أن فتحته. ماذا تريد أن تفعل؟';
  }

  @override
  String get npProjConflictOverwrite => 'استبدال';

  @override
  String get npProjConflictReload => 'تحميل نسخة الخادم';

  @override
  String npProjConflictAuto(String name) {
    return 'تغيّر $name على الخادم؛ تم تخطي الحفظ التلقائي.';
  }

  @override
  String npProjPos(String col, String ln) {
    return 'سطر $ln، عمود $col';
  }

  @override
  String npProjSel(String n) {
    return '$n محدد';
  }

  @override
  String npProjSpaces(String n) {
    return 'المسافات: $n';
  }

  @override
  String npProjTabWidth(String n) {
    return 'حجم علامة الجدولة: $n';
  }

  @override
  String get npProjIndentToSpaces => 'تحويل المسافة البادئة إلى مسافات';

  @override
  String get npProjIndentToTabs => 'تحويل المسافة البادئة إلى علامات جدولة';

  @override
  String npProjEncTitle(String name) {
    return 'الترميز: $name';
  }

  @override
  String get npProjEncConvert => 'التحويل إلى هذا الترميز (عند الحفظ)';

  @override
  String get npProjEncConvertHint =>
      'يبقى النص كما هو؛ ويُكتب الملف بالترميز المختار عند حفظه.';

  @override
  String get npProjEncReopen => 'إعادة الفتح بهذا الترميز';

  @override
  String get npProjEncReopenHint =>
      'إذا ظهرت الأحرف مشوّهة، أعد قراءة الملف بالترميز الصحيح.';

  @override
  String npProjEolTo(String eol) {
    return 'التحويل إلى $eol';
  }

  @override
  String get npProjLangTitle => 'اختيار اللغة';

  @override
  String get npProjLangSearch => 'البحث عن لغة…';

  @override
  String get npProjCacheCopy => 'نسخة العمل';

  @override
  String get npProjInitFail => 'تعذّر بدء نافذة المشروع';

  @override
  String get npProjEmptyHint =>
      'انقر نقرًا مزدوجًا على ملف في الشجرة على اليسار؛ يُفتح هنا في علامة تبويب مع تلوين بناء الجملة حسب لغته.';

  @override
  String get npProjEmptyFile => 'جارٍ فتح الملف…';

  @override
  String get npTreeNewFile => 'ملف جديد';

  @override
  String get npTreeFileName => 'اسم الملف';

  @override
  String get npTreeBadName => 'اسم غير صالح';

  @override
  String get npTreeCreateFail => 'تعذّر الإنشاء';

  @override
  String get npTreeRenameFail => 'تعذّرت إعادة التسمية';

  @override
  String get npTreeRenameDirty => 'احفظ الملفات المفتوحة في هذا المجلد أولًا.';

  @override
  String get npTreeDeleteTitle => 'حذف';

  @override
  String npTreeDeleteMsg(String name) {
    return 'هل تريد حذف الملف <b>$name</b>؟';
  }

  @override
  String npTreeDeleteDirMsg(String name) {
    return 'هل تريد حذف المجلد <b>$name</b> وكل محتوياته؟';
  }

  @override
  String get npTreeDeleteFail => 'تعذّر الحذف';

  @override
  String get npTreeTrashNote => 'تُنقل الملفات المحلية إلى سلة المحذوفات.';

  @override
  String get npTreeEmpty => 'مجلد فارغ';

  @override
  String get npTreeCollapseAll => 'طي الكل';

  @override
  String get npTreeShowExplorer => 'إظهار في المستكشف';

  @override
  String get npTreeUp => 'المجلد الأعلى';

  @override
  String get npTreeHome => 'مجلد تسجيل الدخول';

  @override
  String get npMainErrAuth =>
      'فشل تسجيل الدخول: اسم المستخدم أو كلمة المرور غير صحيحة.';

  @override
  String get npMainErrRefused => 'رُفض الاتصال: المنفذ مغلق أو الخادم لا يعمل.';

  @override
  String get npMainErrTimeout => 'انتهت المهلة: تعذّر الوصول إلى الخادم.';

  @override
  String get npMainErrDns => 'تعذّر تحليل اسم المضيف (DNS).';

  @override
  String get npMainErrUnreach => 'لا يمكن الوصول إلى الخادم عبر الشبكة.';

  @override
  String get npMainErrReset => 'أغلق الخادم الاتصال.';

  @override
  String get npMainErrNotFound => 'لم يُعثر على الملف أو المجلد.';

  @override
  String get npMainErrPerm => 'تم رفض الإذن.';

  @override
  String get npMainErrExists => 'يوجد بالفعل ملف أو مجلد بهذا الاسم.';

  @override
  String npMainErr550(String msg) {
    return 'رفض الخادم العملية (550): $msg';
  }

  @override
  String get npMainErr553 => 'لم يقبل الخادم اسم الملف (553).';

  @override
  String npMainErrTls(String msg) {
    return 'خطأ TLS/SSL — تحقّق من البروتوكول أو المنفذ. ($msg)';
  }

  @override
  String npMainErrHostKey(String newVal, String oldVal) {
    return 'تغيّر مفتاح مضيف الخادم! المحفوظ: $oldVal، المستلم: $newVal. رُفض الاتصال لأسباب أمنية.';
  }

  @override
  String get npMainErrNoKey => 'تعذّرت قراءة ملف المفتاح الخاص.';

  @override
  String get npMainErrKey =>
      'تعذّرت قراءة المفتاح الخاص: عبارة المرور خاطئة أو التنسيق غير مدعوم.';

  @override
  String get npMainErrNoLocal =>
      'لم يُعثر على المجلد أو الملف على هذا الكمبيوتر. غيّر المسار من قائمة البطاقة في النافذة الرئيسية.';

  @override
  String get npMainErrConnNotFound => 'لم يُعثر على الاتصال';

  @override
  String get npMainErrNoSession => 'غير متصل';

  @override
  String get npMainErrHost => 'عنوان الخادم مطلوب.';

  @override
  String get npMainErrUser =>
      'اسم المستخدم مطلوب (أو اختر تسجيل الدخول المجهول).';

  @override
  String get npMainPickKey => 'اختر ملف مفتاح خاص';

  @override
  String get npMainCopySuffix => ' (نسخة)';

  @override
  String get npMainCloseDirty =>
      'توجد ملفات غير محفوظة. سيؤدي إغلاق النافذة إلى تجاهل التغييرات.';

  @override
  String get npMainCloseDiscard => 'إغلاق دون حفظ';

  @override
  String get ipAppNewFolder => 'مجلد جديد';

  @override
  String get ipAppNewRecord => 'سجل جديد';

  @override
  String get ipAppSearchPh =>
      'ابحث في السجلات أو عناوين IP أو الأسماء أو MAC أو الخدمات…';

  @override
  String ipAppStats(String n) {
    return '$n سجل';
  }

  @override
  String get ipColIp => 'IP';

  @override
  String get ipColMac => 'MAC';

  @override
  String get ipColName => 'الاسم';

  @override
  String get ipColRtt => 'الاستجابة';

  @override
  String get ipColServices => 'الخدمات';

  @override
  String get ipColStatus => 'الحالة';

  @override
  String get ipColVendor => 'الشركة المصنّعة';

  @override
  String get ipCtxCopyIp => 'نسخ عنوان IP';

  @override
  String get ipCtxCopyMac => 'نسخ عنوان MAC';

  @override
  String get ipCtxCopyName => 'نسخ الاسم';

  @override
  String get ipCtxCopyRange => 'نسخ النطاق';

  @override
  String get ipCtxOpenWeb => 'فتح في المتصفح';

  @override
  String ipFolderDeleteMsg(String name) {
    return 'سيُحذف المجلد «$name»؛ وتُنقل سجلاته ومجلداته إلى المجلد الأصل.';
  }

  @override
  String get ipFolderEmpty => 'مجلد فارغ';

  @override
  String get ipFolderName => 'اسم المجلد';

  @override
  String get ipFolderRename => 'إعادة تسمية المجلد';

  @override
  String get ipHostAlive => 'الاتصال';

  @override
  String get ipHostBanner => 'رسالة الترحيب';

  @override
  String get ipHostCert => 'الشهادة';

  @override
  String get ipHostCertExpires => 'صالحة حتى';

  @override
  String get ipHostCertIssuer => 'المُصدِر';

  @override
  String get ipHostDetails => 'التفاصيل';

  @override
  String get ipHostLocalMac => 'عنوان خاص';

  @override
  String get ipHostNoServices => 'لا يوجد أي منفذ مفتوح من القائمة.';

  @override
  String get ipHostSelfSigned => 'موقّعة ذاتيًا';

  @override
  String get ipHostServer => 'الخادم';

  @override
  String get ipHostTitle => 'العنوان';

  @override
  String get ipHostUnknown => '(لم يُحلّ الاسم)';

  @override
  String get ipNoticeAccept => 'فهمت';

  @override
  String get ipNoticeBody =>
      'يكتشف IP Tools شبكتك المحلية فقط: يعثر على الأجهزة عبر ping، ويحاول الاتصال بقائمة قصيرة من المنافذ، ويحلّ أسماءها. افحص فقط الشبكات التي تملكها أو المخوَّل لك فحصها.';

  @override
  String get ipNoticeLimits =>
      'بحكم التصميم تُفحص العناوين الخاصة فقط (10.x و172.16–31.x و192.168.x و169.254.x)؛ لا اختبار للثغرات ولا تخمين لكلمات المرور ولا فحص واسع للمنافذ.';

  @override
  String get ipNoticeShort => 'افحص الشبكات المخوَّل لك فحصها فقط';

  @override
  String get ipNoticeText =>
      'افحص فقط الشبكات التي تملكها أو المخوَّل لك فحصها.';

  @override
  String get ipNoticeTitle => 'اكتشاف الشبكة المحلية';

  @override
  String get ipPrivacyNote =>
      'الخصوصية: تُحفظ نتائج الفحص على هذا الحاسوب فقط ولا تُرسل إلى أي مكان. تُفحص العناوين الخاصة/المحلية فقط.';

  @override
  String get ipRangeErrEmpty => 'أدخل نطاق عناوين IP.';

  @override
  String ipRangeErrInvalid(String token) {
    return 'عنوان أو نطاق غير صالح: $token';
  }

  @override
  String ipRangeErrIpv6(String token) {
    return 'عناوين IPv6 غير مدعومة: $token';
  }

  @override
  String ipRangeErrNotPrivate(String token) {
    return 'يمكن فحص العناوين الخاصة/المحلية فقط (10.x و172.16–31.x و192.168.x و169.254.x): $token';
  }

  @override
  String ipRangeErrReversed(String token) {
    return 'بداية النطاق أكبر من نهايته: $token';
  }

  @override
  String ipRangeErrTooMany(String count) {
    return 'النطاق كبير جدًا (65,536 عنوانًا على الأكثر، أي /16 واحد): $count';
  }

  @override
  String ipRangeOk(String n) {
    return 'سيُفحص $n عنوان';
  }

  @override
  String get ipRecColor => 'اللون';

  @override
  String ipRecDeleteMsg(String name) {
    return 'سيُحذف السجل «$name» ونتيجة فحصه على هذا الحاسوب.';
  }

  @override
  String ipRecDevices(String n) {
    return '$n جهاز';
  }

  @override
  String get ipRecEdit => 'تعديل السجل';

  @override
  String get ipRecFolder => 'المجلد';

  @override
  String ipRecItems(String n) {
    return '$n عنصر';
  }

  @override
  String ipRecLastScan(String time) {
    return 'آخر فحص: $time';
  }

  @override
  String get ipRecMove => 'نقل';

  @override
  String get ipRecMoveTitle => 'نقل السجل';

  @override
  String get ipRecName => 'الاسم';

  @override
  String get ipRecNever => 'لم يُفحص بعد';

  @override
  String ipRecNewDevices(String n) {
    return '$n جديد';
  }

  @override
  String get ipRecRange => 'نطاق IP';

  @override
  String get ipRecRangeHint =>
      'أمثلة: 192.168.1.0/24 · 192.168.1.1-192.168.1.255 · 10.0.0.5 · عدة نطاقات مفصولة بفواصل. /16 على الأكثر.';

  @override
  String get ipRecRootFolder => 'السجلات';

  @override
  String get ipRecSaved => 'تم حفظ السجل';

  @override
  String get ipScanBusy => 'هناك فحص آخر جارٍ؛ أوقفه أولًا.';

  @override
  String ipScanDone(String n) {
    return 'انتهى الفحص: $n جهاز';
  }

  @override
  String get ipScanEmptyBody =>
      'اضغط «فحص» أو انقر ▶ على البطاقة. تُعرض الأجهزة المكتشفة هنا.';

  @override
  String get ipScanEmptyTitle => 'لم يُفحص هذا السجل بعد';

  @override
  String get ipScanExport => 'تصدير';

  @override
  String get ipScanExportCsv => 'حفظ بصيغة CSV…';

  @override
  String get ipScanExportJson => 'حفظ بصيغة JSON…';

  @override
  String get ipScanExported => 'تم التصدير';

  @override
  String ipScanFailed(String msg) {
    return 'فشل الفحص: $msg';
  }

  @override
  String get ipScanFilter => 'تصفية';

  @override
  String get ipScanFilterAll => 'الكل';

  @override
  String get ipScanFilterGone => 'المختفية';

  @override
  String get ipScanFilterNew => 'الجديدة';

  @override
  String get ipScanFilterServices => 'ذات خدمات';

  @override
  String ipScanFound(String n) {
    return 'عُثر على $n جهاز';
  }

  @override
  String get ipScanNoMatch => 'لا يوجد جهاز يطابق التصفية.';

  @override
  String get ipScanPhaseNames => 'جارٍ حلّ الأسماء';

  @override
  String get ipScanPhasePing => 'جارٍ البحث عن الأجهزة';

  @override
  String get ipScanPhasePorts => 'جارٍ تجربة الخدمات';

  @override
  String ipScanProgress(String done, String total) {
    return '$done/$total';
  }

  @override
  String ipScanRateLimited(String s) {
    return 'يمكن إعادة فحص السجل نفسه بعد $s ثانية على الأقل.';
  }

  @override
  String get ipScanScan => 'فحص';

  @override
  String get ipScanScanning => 'جارٍ الفحص…';

  @override
  String get ipScanSelectHint =>
      'انقر سجلًا على اليسار: يُفحص النطاق وتُعرض الأجهزة المكتشفة هنا.';

  @override
  String get ipScanSelectRecord => 'اختر سجلًا';

  @override
  String get ipScanStop => 'إيقاف';

  @override
  String get ipScanStopped => 'تم إيقاف الفحص';

  @override
  String get ipStatusAliveArp => 'ظهر في جدول ARP (لم يستجب لـ ping)';

  @override
  String get ipStatusAlivePing => 'استجاب لـ ping';

  @override
  String get ipStatusGone => 'اختفى (كان موجودًا في الفحص السابق)';

  @override
  String get ipStatusLive => 'جارٍ الفحص';

  @override
  String get ipStatusNew => 'جديد (لم يكن في الفحص السابق)';

  @override
  String get ipStatusSame => 'متصل';

  @override
  String ipTagCopied(String text) {
    return 'نُسخ إلى الحافظة: $text';
  }

  @override
  String get ipTagFailed => 'تعذّر الفتح';

  @override
  String get ipTagGroupCamera => 'كاميرا (RTSP)';

  @override
  String get ipTagGroupDb => 'قاعدة بيانات';

  @override
  String get ipTagGroupFtp => 'FTP';

  @override
  String get ipTagGroupPrinter => 'طابعة';

  @override
  String get ipTagGroupRdp => 'سطح المكتب البعيد';

  @override
  String get ipTagGroupSmb => 'مشاركة الملفات';

  @override
  String get ipTagGroupSsh => 'SSH';

  @override
  String get ipTagGroupVnc => 'VNC';

  @override
  String get ipTagGroupWeb => 'ويب';

  @override
  String ipTagOpened(String text) {
    return 'جارٍ الفتح: $text';
  }

  @override
  String get ipTrayHiddenHint =>
      'يواصل IP Tools العمل في منطقة الإعلام. انقر الأيقونة لإعادة النافذة.';

  @override
  String get ipTrayQuit => 'خروج';

  @override
  String get ipTrayShow => 'إظهار IP Tools';

  @override
  String get ipWelcomeBody =>
      'احفظ نطاق IP (مثل 192.168.1.0/24). عند النقر على السجل يُفحص النطاق؛ وتُعرض الأجهزة المكتشفة مع اسمها والشركة المصنّعة والخدمات المفتوحة. انقر على وسم الخدمة لفتح التطبيق المناسب.';

  @override
  String get ipWelcomeTitle => 'ما الموجود في شبكتك المحلية؟';

  @override
  String get cvTypeVideo => 'فيديو';

  @override
  String get cvTypeImage => 'صورة';

  @override
  String get cvTypeAudio => 'صوت';

  @override
  String get cvTypeVideoHint => 'MP4، MKV، AVI، MOV…';

  @override
  String get cvTypeImageHint => 'JPG، PNG، WEBP، AVIF…';

  @override
  String get cvTypeAudioHint => 'MP3، WAV، FLAC، M4A…';

  @override
  String get cvTypeVideoAll => 'كل ملفات الفيديو';

  @override
  String get cvTypeImageAll => 'كل ملفات الصور';

  @override
  String get cvTypeAudioAll => 'كل ملفات الصوت';

  @override
  String get cvAppSearchPh => 'البحث في المشاريع…  (Ctrl+F)';

  @override
  String get cvAppNewProject => 'مشروع جديد';

  @override
  String get cvAppSettings => 'الإعدادات';

  @override
  String cvAppStats(String c, String f) {
    return '$c مشروع · $f مجلد';
  }

  @override
  String get cvAppWelcome => 'مرحبًا';

  @override
  String cvAppResults(String q) {
    return 'نتائج «$q»';
  }

  @override
  String get cvAppAll => 'كل المشاريع';

  @override
  String get cvAppWelcomeHint =>
      'أنشئ أول مشروع تحويل لك.<br>اختر فيديو أو صورة أو صوتًا، وحدّد امتدادات المصدر والهدف، ثم أشِر إلى ملف أو مجلد.';

  @override
  String get cvAppFolders => 'المجلدات';

  @override
  String get cvAppProjects => 'المشاريع';

  @override
  String get cvAppDblHint => 'انقر نقرًا مزدوجًا على مشروع لفتحه';

  @override
  String get cvAppNoMatch => 'لا توجد مشاريع مطابقة.';

  @override
  String cvAppFolderCount(String n) {
    return '$n مشروع';
  }

  @override
  String get cvAppNewProjectHere => 'مشروع جديد في هذا المجلد';

  @override
  String get cvAppNewSubfolder => 'إنشاء مجلد فرعي';

  @override
  String get cvAppDuplicate => 'تكرار';

  @override
  String get cvAppMoveToFolder => 'نقل إلى مجلد…';

  @override
  String get cvAppProjectMoved => 'تم نقل المشروع';

  @override
  String get cvAppFolderIntoSelf => 'لا يمكن نقل مجلد إلى داخل نفسه';

  @override
  String get cvAppFolderPh => 'مثال: فيديوهات العملاء';

  @override
  String get cvAppRenameFolder => 'إعادة تسمية المجلد';

  @override
  String get cvAppDeleteFolder => 'حذف المجلد';

  @override
  String cvAppDeleteFolderMsg(String name) {
    return 'هل تريد حذف المجلد <b>$name</b>؟';
  }

  @override
  String cvAppDeleteFolderProjects(String n) {
    return '<br>ستُنقل مشاريعه ($n) إلى المجلد الأصل.';
  }

  @override
  String get cvAppRootFolder => 'المستوى الأعلى (بدون مجلد)';

  @override
  String cvAppMoveTitle(String name) {
    return 'نقل «$name»';
  }

  @override
  String get cvAppTargetFolder => 'المجلد الهدف';

  @override
  String get cvAppDeleteProject => 'حذف المشروع';

  @override
  String cvAppDeleteProjectMsg(String name) {
    return 'هل تريد حذف المشروع <b>$name</b>؟<br>ستُحذف أيضًا ملفاته المحوّلة ونصوصه. لن تُمسّ ملفات المصدر.';
  }

  @override
  String get cvAppProjectSettings => 'إعدادات المشروع';

  @override
  String get cvAppNoSource => 'لم يُختر مصدر على هذا الكمبيوتر';

  @override
  String get cvAppAllExts => 'الكل';

  @override
  String get cvAppRunning => 'قيد التشغيل';

  @override
  String cvAppDoneCount(String n) {
    return 'اكتمل $n';
  }

  @override
  String cvAppErrorCount(String n) {
    return 'فشل $n';
  }

  @override
  String get cvAppProjectSaved => 'تم حفظ المشروع';

  @override
  String get cvAppClearOutputs => 'حذف الملفات المحوّلة';

  @override
  String cvAppClearOutputsMsg(String name) {
    return 'هل تريد حذف الملفات المحوّلة للمشروع <b>$name</b>؟ لن تُمسّ ملفات المصدر؛ ويمكنك التحويل مجددًا في أي وقت.';
  }

  @override
  String get cvPfTitleNew => 'مشروع جديد';

  @override
  String cvPfTitleEdit(String name) {
    return 'إعدادات المشروع: $name';
  }

  @override
  String get cvPfCreate => 'حفظ';

  @override
  String get cvPfTabGeneral => 'عام';

  @override
  String get cvPfTabOutput => 'إعدادات التحويل';

  @override
  String get cvPfTabSpeech => 'الكلام';

  @override
  String get cvPfName => 'اسم المشروع';

  @override
  String get cvPfNamePh => 'مثال: فيديوهات العطلة';

  @override
  String get cvPfType => 'النوع';

  @override
  String get cvPfSourceExt => 'امتداد ملف المصدر';

  @override
  String get cvPfTargetExt => 'امتداد الملف الهدف';

  @override
  String get cvPfSelectAll => 'تحديد الكل';

  @override
  String get cvPfSelectNone => 'لا شيء';

  @override
  String get cvPfGroupVideo => 'فيديو';

  @override
  String get cvPfGroupAnim => 'رسوم متحركة';

  @override
  String get cvPfGroupAudioOnly => 'صوت فقط (استخراج من الفيديو)';

  @override
  String get cvPfAudioOnlyHint => 'يُحتفظ بمسار الصوت فقط من الفيديو.';

  @override
  String get cvPfGifHint => 'GIF متحرك (30 إطارًا/ث كحد أقصى).';

  @override
  String get cvPfSource => 'المصدر';

  @override
  String get cvPfModeFile => 'ملف';

  @override
  String get cvPfModeFolder => 'مجلد';

  @override
  String get cvPfPathFile => 'الملف المراد تحويله';

  @override
  String get cvPfPathFolder => 'المجلد المراد تحويله';

  @override
  String get cvPfPathNone => 'لم يُختر بعد — اضغط استعراض…';

  @override
  String get cvPfSubfolders => 'تضمين المجلدات الفرعية';

  @override
  String get cvPfConcurrency => 'عدد الملفات المحوّلة في وقت واحد';

  @override
  String get cvPfConcurrencyHint =>
      'القيم الأعلى تنتهي أسرع لكنها تُحمّل المعالج والقرص أكثر.';

  @override
  String get cvPfFolder => 'مجلد المشروع';

  @override
  String get cvPfSpeechAsk => 'تحويل الكلام إلى نص';

  @override
  String get cvPfSpeechAskHint =>
      'يُفرَّغ الكلام في الفيديو أو الصوت: تظهر الثانية واللغة ونص كل جملة في أعمدة منفصلة.';

  @override
  String get cvPfSpeechModel => 'نموذج الكلام';

  @override
  String get cvPfSpeechLang => 'اللغة المنطوقة';

  @override
  String get cvPfPerWindow => 'اكتشاف اللغة من جديد كل 30 ثانية';

  @override
  String get cvPfPerWindowHint => 'للتسجيلات متعددة اللغات. أبطأ.';

  @override
  String get cvPfModels => 'النماذج';

  @override
  String get cvPfSpeechNote =>
      'يعمل التعرّف على الكلام دون اتصال على هذا الكمبيوتر (whisper.cpp)؛ لا يُرسَل الصوت إلى أي خادم أبدًا. يُنزَّل النموذج مرة واحدة عند أول استخدام.';

  @override
  String get cvPfErrExt => 'اختر امتداد مصدر واحدًا على الأقل.';

  @override
  String get cvOutQuality => 'الجودة';

  @override
  String get cvOutQHigh => 'عالية (ملف كبير)';

  @override
  String get cvOutQMedium => 'متوسطة (موصى بها)';

  @override
  String get cvOutQLow => 'منخفضة (ملف صغير)';

  @override
  String get cvOutResolution => 'الدقة';

  @override
  String get cvOutAsSource => 'مثل المصدر';

  @override
  String get cvOutResolutionHint => 'يُصغّر فقط؛ لا تُكبَّر الفيديوهات الأصغر.';

  @override
  String get cvOutFps => 'معدل الإطارات';

  @override
  String get cvOutCodec => 'ترميز الفيديو';

  @override
  String get cvOutH264 => 'H.264 (الأكثر توافقًا)';

  @override
  String get cvOutH265 => 'H.265 / HEVC (أصغر)';

  @override
  String get cvOutCodecHint => 'يُستخدم H.265 فقط مع أهداف MP4 وMKV وMOV وM4V.';

  @override
  String get cvOutSpeed => 'سرعة الترميز';

  @override
  String get cvOutSpeedVeryfast => 'سريعة جدًا';

  @override
  String get cvOutSpeedFast => 'سريعة';

  @override
  String get cvOutSpeedMedium => 'متوازنة';

  @override
  String get cvOutSpeedSlow => 'بطيئة (ملف أصغر)';

  @override
  String get cvOutAudioBitrate => 'معدل بت الصوت';

  @override
  String get cvOutNoAudio => 'إزالة الصوت';

  @override
  String get cvOutImgQuality => 'الجودة';

  @override
  String get cvOutImgQualityHint =>
      'لـ JPG وWEBP وAVIF وTIFF. ‏PNG بلا فقد؛ وتحت 80 تُستخدم لوحة ألوان.';

  @override
  String get cvOutMaxWidth => 'أقصى عرض';

  @override
  String get cvOutMaxHeight => 'أقصى ارتفاع';

  @override
  String get cvOutNoLimit => 'بلا حد';

  @override
  String get cvOutResizeHint => 'تُحفظ نسبة الأبعاد؛ لا تُكبَّر الصور الأصغر.';

  @override
  String get cvOutKeepMeta =>
      'الاحتفاظ بالبيانات الوصفية (EXIF، ملف تعريف الألوان)';

  @override
  String get cvOutKeepMetaHint =>
      'عند الإيقاف، لا تُكتب البيانات الشخصية مثل الموقع في الملف الناتج.';

  @override
  String get cvOutBitrate => 'معدل البت';

  @override
  String get cvOutBitrateHint =>
      'WAV وFLAC وAIFF بلا فقد؛ لا ينطبق عليها معدل البت.';

  @override
  String get cvOutSampleRate => 'معدل العيّنات';

  @override
  String get cvOutChannels => 'القنوات';

  @override
  String get cvOutStereo => 'ستيريو';

  @override
  String get cvOutMono => 'أحادي';

  @override
  String get cvSpeechModelTiny => 'Tiny (الأسرع)';

  @override
  String get cvSpeechModelBase => 'Base (موصى به)';

  @override
  String get cvSpeechModelSmall => 'Small (أدق)';

  @override
  String get cvSpeechModelMedium => 'Medium (دقة عالية)';

  @override
  String get cvSpeechModelTurbo => 'Large v3 Turbo (الأدق)';

  @override
  String get cvSpeechLangAuto => 'اكتشاف تلقائي';

  @override
  String get cvSpeechDownload => 'تنزيل';

  @override
  String cvSpeechInstalled(String size) {
    return 'مثبّت · $size';
  }

  @override
  String get cvSpeechDownloadFailed => 'تعذّر تنزيل النموذج';

  @override
  String get cvSpeechDlEngine => 'جارٍ تنزيل محرك الكلام';

  @override
  String cvSpeechDlModel(String model) {
    return 'جارٍ تنزيل نموذج الكلام: $model';
  }

  @override
  String get cvSpeechEngineAuto =>
      'سيُنزَّل محرك الكلام (whisper.cpp) عند أول استخدام.';

  @override
  String get cvSpeechEngineMissing => 'لم يُعثر على محرك الكلام (whisper-cli).';

  @override
  String get cvPjOriginal => 'الأصلي';

  @override
  String get cvPjConverted => 'المحوَّل';

  @override
  String get cvPjFolders => 'المجلدات';

  @override
  String get cvPjFiles => 'الملفات';

  @override
  String get cvPjTranscript => 'النص';

  @override
  String get cvPjTrSecond => 'الثانية';

  @override
  String get cvPjTrLang => 'اللغة';

  @override
  String get cvPjTrText => 'النص';

  @override
  String get cvPjSecUnit => 'ث';

  @override
  String get cvPjStart => 'بدء';

  @override
  String get cvPjStop => 'إيقاف';

  @override
  String get cvPjChangeSource => 'تغيير المصدر';

  @override
  String get cvPjPickSource => 'اختيار المصدر';

  @override
  String get cvPjOpenOutDir => 'فتح مجلد الملفات المحوّلة';

  @override
  String get cvPjExportOutputs => 'نسخ الملفات المحوّلة إلى مجلد آخر…';

  @override
  String get cvPjClearOutputs => 'حذف الملفات المحوّلة';

  @override
  String get cvPjLinkPreview => 'تشغيل المعاينتين معًا';

  @override
  String get cvPjFilterPh => 'البحث في الملفات';

  @override
  String get cvPjFAll => 'الكل';

  @override
  String get cvPjFPending => 'قيد الانتظار';

  @override
  String get cvPjFActive => 'قيد التشغيل';

  @override
  String get cvPjFDone => 'مكتمل';

  @override
  String get cvPjFError => 'فشل';

  @override
  String get cvPjExpandAll => 'توسيع الكل';

  @override
  String get cvPjCollapseAll => 'طي الكل';

  @override
  String get cvPjRescan => 'إعادة الفحص';

  @override
  String get cvPjColName => 'الاسم';

  @override
  String get cvPjColFolder => 'المجلد';

  @override
  String get cvPjColSize => 'الحجم';

  @override
  String get cvPjColProgress => 'التقدّم';

  @override
  String get cvPjColStatus => 'الحالة';

  @override
  String get cvPjColSpeech => 'النص';

  @override
  String get cvPjColOut => 'الناتج';

  @override
  String cvPjSegments(String n) {
    return '$n جملة';
  }

  @override
  String get cvPjNoAudio => 'لا يوجد صوت';

  @override
  String cvPjNoFiles(String exts) {
    return 'لا توجد ملفات بالامتدادات المختارة في هذا المجلد ($exts).';
  }

  @override
  String get cvPjNoMatch => 'لا توجد ملفات مطابقة.';

  @override
  String get cvPjNoneChecked =>
      'القائمة فارغة. حدّد الملفات المراد تحويلها في الشجرة على اليسار.';

  @override
  String get cvPjConvertThis => 'تحويل هذا الملف';

  @override
  String get cvPjReconvert => 'التحويل مجددًا';

  @override
  String get cvPjTranscribeThis => 'تفريغ النص';

  @override
  String get cvPjRetranscribe => 'تفريغ النص مجددًا';

  @override
  String get cvPjOpenOut => 'فتح الملف المحوَّل';

  @override
  String get cvPjRevealOut => 'إظهار المحوَّل في المجلد';

  @override
  String get cvPjOpenSrc => 'فتح الملف الأصلي';

  @override
  String get cvPjRevealSrc => 'إظهار الأصلي في المجلد';

  @override
  String get cvPjExportThis => 'نسخ إلى مجلد آخر…';

  @override
  String get cvPjDeleteOut => 'حذف الملف المحوَّل';

  @override
  String get cvPjUncheck => 'إزالة من القائمة';

  @override
  String cvPjExported(String n) {
    return 'تم نسخ $n ملف';
  }

  @override
  String get cvPjFileMissing => 'لم يُعثر على ملف المصدر.';

  @override
  String get cvPjPickToPreview => 'حدّد ملفًا في القائمة لمعاينته.';

  @override
  String get cvPjOutPreviewHint => 'سيظهر هنا بعد التحويل.';

  @override
  String get cvPjConverting => 'جارٍ التحويل…';

  @override
  String get cvPjCantPlay => 'لا يمكن تشغيل هذا التنسيق هنا مباشرة.';

  @override
  String get cvPjMakePreview => 'إنشاء معاينة';

  @override
  String get cvPjMakingPreview => 'جارٍ تجهيز المعاينة…';

  @override
  String get cvPjNoSourceTitle => 'لم يُختر مصدر على هذا الكمبيوتر';

  @override
  String get cvPjNoSourceHint =>
      'تمت مزامنة المشروع من جهاز آخر أو لم يُختر مصدر بعد. اختر الملف أو المجلد المراد تحويله.';

  @override
  String get cvPjSourceGone => 'لم يُعثر على المصدر';

  @override
  String get cvPjTrImage =>
      'تحويل الكلام إلى نص متاح في مشاريع الفيديو والصوت.';

  @override
  String get cvPjTrPick => 'حدّد ملفًا لعرض نصه.';

  @override
  String get cvPjTrAfter => 'سيُفرَّغ الكلام بعد تحويل الملف.';

  @override
  String get cvPjTrOff =>
      'تحويل الكلام إلى نص متوقف في هذا المشروع. يمكنك تشغيله لهذا الملف الآن.';

  @override
  String cvPjTrRunning(String p) {
    return 'جارٍ تفريغ النص… $p%';
  }

  @override
  String get cvPjTrNone => 'لم يُعثر على كلام في هذا الملف.';

  @override
  String get cvPjTrNoExport => 'لا يوجد نص للتصدير.';

  @override
  String get cvPjTrSaved => 'تم حفظ النص';

  @override
  String get cvPjExportTranscript => 'تصدير النص';

  @override
  String get cvPjFmtSrt => 'ترجمات SRT';

  @override
  String get cvPjFmtVtt => 'ترجمات WebVTT';

  @override
  String get cvPjFmtTxt => 'نص عادي (TXT)';

  @override
  String get cvPjFmtCsv => 'جدول بيانات (CSV)';

  @override
  String cvPjStTotal(String n) {
    return '$n ملف';
  }

  @override
  String cvPjStDone(String n) {
    return 'اكتمل $n';
  }

  @override
  String cvPjStErr(String n) {
    return 'فشل $n';
  }

  @override
  String cvPjStActive(String n) {
    return '$n قيد التحويل';
  }

  @override
  String cvPjStSpeech(String n) {
    return '$n قيد التفريغ';
  }

  @override
  String cvPjStOut(String size) {
    return 'الناتج: $size';
  }

  @override
  String cvPjStConc(String n) {
    return 'في وقت واحد: $n';
  }

  @override
  String get cvPjFinished => 'اكتمل التحويل';

  @override
  String cvPjFinishedSub(String done, String err, String total) {
    return 'اكتمل $done/$total ملف · فشل $err';
  }

  @override
  String get cvStPending => 'قيد الانتظار';

  @override
  String get cvStQueued => 'في الطابور';

  @override
  String get cvStConverting => 'جارٍ التحويل';

  @override
  String get cvStDone => 'مكتمل';

  @override
  String get cvStError => 'خطأ';

  @override
  String get cvStCanceled => 'أُلغي';

  @override
  String get cvMainBalloonTitle => 'Convert Master لا يزال يعمل';

  @override
  String get cvMainBalloonBody => 'انقر أيقونة العلبة لفتح النافذة مجددًا.';

  @override
  String get cvMainTrayShow => 'إظهار Convert Master';

  @override
  String get cvMainTrayProjects => 'المشاريع';

  @override
  String get cvMainTrayNone => '(لا توجد مشاريع)';

  @override
  String get cvMainTrayQuit => 'خروج';

  @override
  String get cvErrCanceled => 'أُلغي';

  @override
  String get cvErrNoVideo => 'لا يحتوي الملف على مسار فيديو.';

  @override
  String get cvErrNoAudio => 'لا يحتوي الملف على صوت.';

  @override
  String get cvPjOcrThis => 'قراءة النص (OCR)';

  @override
  String get cvPjReocr => 'إعادة قراءة النص (OCR)';

  @override
  String get cvPjNoText => 'لا يوجد نص';

  @override
  String get cvPjNoTextHint => 'لم يُعثر على نص مقروء في الصورة.';

  @override
  String get cvPjOcrPanel => 'النص (OCR)';

  @override
  String get cvPjTrLine => 'السطر';

  @override
  String get cvPjTrConf => 'الثقة';

  @override
  String cvPjLines(String n) {
    return '$n سطر';
  }

  @override
  String get cvPjOcrAfter => 'ستتم قراءة النص الموجود في الصورة بعد تحويلها.';

  @override
  String get cvPjOcrOff =>
      'التعرّف الضوئي على النص متوقف في هذا المشروع. يمكنك تشغيله الآن لهذه الصورة.';

  @override
  String cvPjOcrRunning(String p) {
    return 'جارٍ قراءة النص… $p%';
  }

  @override
  String get cvPjCopyAll => 'نسخ الكل';

  @override
  String get cvPjCopied => 'تم نسخ النص إلى الحافظة';

  @override
  String cvOcrDl(String lang) {
    return 'جارٍ تنزيل بيانات لغة OCR: $lang';
  }

  @override
  String get cvOcrNotInstalled => 'يُنزَّل عند أول استخدام';

  @override
  String get cvOcrDownloadFailed => 'تعذّر تنزيل بيانات لغة OCR';

  @override
  String get cvPfTabOcr => 'OCR';

  @override
  String get cvPfOcrAsk => 'قراءة النص في الصور (OCR)';

  @override
  String get cvPfOcrAskHint =>
      'يُستخرج النص من الصور: يظهر كل سطر ودرجة الثقة في قراءته والنص في أعمدة منفصلة. اتركه متوقفًا إن لم تكن بحاجة إليه.';

  @override
  String get cvPfOcrLangs => 'لغة النص في الصور';

  @override
  String get cvPfOcrLangsHint => 'حتى 6 لغات؛ اللغات الأقل أسرع وأدق.';

  @override
  String get cvPfOcrData => 'بيانات اللغات';

  @override
  String get cvPfOcrNote =>
      'يعمل OCR دون اتصال على هذا الحاسوب (Tesseract)؛ لا تُرسل الصور إلى أي خادم. تُنزَّل كل لغة مرة واحدة عند أول استخدام.';

  @override
  String cvErrOcr(String msg) {
    return 'تعذّرت قراءة النص: $msg';
  }

  @override
  String get cvErrUnreadable => 'تعذّرت قراءة الملف (تالف أو غير مدعوم).';

  @override
  String get cvErrUnsupported => 'هذا التحويل غير مدعوم.';

  @override
  String cvErrFfmpegMissing(String msg) {
    return 'تعذّر تشغيل محرك التحويل (ffmpeg): $msg';
  }

  @override
  String get cvErrEngineMissing => 'لم يُعثر على محرك الكلام (whisper.cpp).';

  @override
  String cvErrDownload(String msg) {
    return 'فشل التنزيل: $msg';
  }

  @override
  String get cvErrNotFound => 'لم يُعثر على الملف.';

  @override
  String get cvErrAccess => 'تم رفض الوصول.';

  @override
  String get cvErrBusy => 'الملف قيد الاستخدام من برنامج آخر.';

  @override
  String get cvErrNoSpace => 'القرص ممتلئ.';

  @override
  String cvErrFfmpeg(String msg) {
    return 'تعذّر التحويل: $msg';
  }

  @override
  String cvErrWhisper(String msg) {
    return 'تعذّر تفريغ النص: $msg';
  }

  @override
  String get cvMainCloseActive => 'يجري تحويل حاليًا. إغلاق النافذة سيوقفه.';

  @override
  String get cvMainCloseAnyway => 'الإغلاق على أي حال';

  @override
  String get cvMainCopySuffix => ' (نسخة)';

  @override
  String get cvMainErrProjectNotFound => 'لم يُعثر على المشروع';

  @override
  String get cvMainExportTo => 'المجلد الذي ستُنسخ إليه الملفات المحوّلة';

  @override
  String get cvMainPickFile => 'اختر الملف المراد تحويله';

  @override
  String get cvMainPickFolder => 'اختر المجلد المراد تحويله';

  @override
  String get cvMainSaveTranscript => 'حفظ النص';

  @override
  String get cvMainUntitled => 'مشروع بلا عنوان';

  @override
  String get sqOp => 'أكبر من أو يساوي';

  @override
  String get sqOpNotcontains => 'لا يحتوي على';

  @override
  String get sqOpNotlike => 'NOT LIKE';

  @override
  String get sqOpNotin => 'ليس ضمن القائمة';

  @override
  String get sqOpIsnull => 'هو NULL';

  @override
  String get sqOpIsnotnull => 'ليس NULL';

  @override
  String get ipMobScanThis => 'فحص هذه الشبكة';

  @override
  String get ipMobDeleteRecord => 'حذف السجل';

  @override
  String get ipMobNewRecordHere => 'سجل جديد هنا';

  @override
  String get ipMobNoMatch => 'لم يتم العثور على سجلات مطابقة.';

  @override
  String ipMobAddresses(int n) {
    return '$n عنوان';
  }

  @override
  String get ipMobAllRecords => 'كل السجلات';

  @override
  String get ipMobSetScan => 'الفحص';

  @override
  String get ipMobSetPorts => 'الخدمات المراد اختبارها';

  @override
  String get ipMobSetPortsHint =>
      'يُجرى لكل منفذ محاولة اتصال TCP عادية واحدة فقط. القائمة ثابتة؛ ويمكنك إيقاف ما لا تريده منها.';

  @override
  String get ipMobSetSpeed => 'السرعة';

  @override
  String get ipMobSetConcurrency => 'الاتصالات المتزامنة';

  @override
  String get ipMobSetConcurrencyHint =>
      '64 محاولة اتصال في الوقت نفسه على الأكثر (حد تصميمي).';

  @override
  String get ipMobSetTimeout => 'مهلة الانتظار';

  @override
  String get ipMobSetTimeoutHint =>
      'يُنتظر 1000 مللي ثانية على الأكثر لكل جهاز.';

  @override
  String get ipMobSetLimitsNote =>
      'IP Tools أداة للاستكشاف والجرد فقط: لا يمكن توسيع قائمة المنافذ، ولا تُجرى محاولات لاكتشاف الثغرات أو تجربة كلمات المرور، وتُفحص العناوين الخاصة/المحلية فقط.';

  @override
  String get ipMobMacMobile => 'غير متاح على الجوال';

  @override
  String get ipMobAliveTcp => 'استجاب لاتصال TCP';

  @override
  String get ipMobAliveName => 'استجاب لتحليل الاسم';

  @override
  String get ipMobOpenInSsh => 'فتح في SSH Master';

  @override
  String get ipMobOpenInSshNote =>
      'تم نسخ العنوان إلى الحافظة؛ الصقه في نموذج SSH Master › اتصال جديد.';

  @override
  String get ipMobCopyAddress => 'نسخ العنوان';

  @override
  String get ipMobSuggestLocal => 'شبكة هذا الجهاز';

  @override
  String get ipMobSuggestLocalNone => 'لم يتم العثور على شبكة Wi-Fi';

  @override
  String get ipMobPhoneNoMacNote =>
      'لا يتوفر ping أو ARP على الجوال: يُحدَّد النشاط عبر محاولات اتصال TCP وتحليل الأسماء؛ ولا يمكن عرض معلومات MAC والشركة المصنّعة.';

  @override
  String get cvMobNotOnMobile => 'غير متاح على الجوال';

  @override
  String get cvMobSpeechNote =>
      'يعمل التعرف على الكلام على الجهاز دون اتصال (whisper.cpp)؛ لا يُرسل الصوت إلى أي خادم. يُنزَّل النموذج مرة واحدة عند أول استخدام (Tiny 75 م.ب · Base 142 م.ب · Small 466 م.ب؛ يُنصح بـ Wi-Fi) ويُدار من الإعدادات › نماذج الكلام.';

  @override
  String get cvMobOcrNote =>
      'يعمل استخراج النص من الصور على الجهاز (Google ML Kit)؛ لا تُرسل الصور إلى أي خادم. الكتابات المدعومة: اللاتينية (بما فيها التركية) والصينية واليابانية والكورية والديفاناغارية (الهندية). على Android يأتي نموذج التعرف مع التطبيق.';

  @override
  String get cvMobFolderNote =>
      'لا يمكن اختيار مجلد مصدر على الجوال؛ تُضاف الملفات واحدًا تلو الآخر أو من المعرض.';

  @override
  String get cvMobConcurrencyHint =>
      'على الجوال يُحوَّل ملفان في الوقت نفسه على الأكثر.';

  @override
  String get cvMobAddFiles => 'إضافة ملفات';

  @override
  String get cvMobAddFromGallery => 'إضافة من المعرض';

  @override
  String get cvMobPickFilesHint =>
      'أضف الملفات المراد تحويلها؛ تُحفظ المخرجات ضمن مستندات التطبيق.';

  @override
  String get cvMobShareOutput => 'مشاركة المخرج';

  @override
  String get cvMobShareAllOutputs => 'مشاركة كل المخرجات';

  @override
  String get cvMobSourceCopies => 'نسخ المصادر';

  @override
  String get cvMobModuleSettings => 'إعدادات Convert Master';

  @override
  String get cvMobDefaultConcurrency =>
      'عدد الملفات المحوَّلة في الوقت نفسه في المشاريع الجديدة';

  @override
  String get cvMobStorage => 'التخزين';

  @override
  String get cvMobConversion => 'التحويل';

  @override
  String get cvMobClearOrphans => 'تنظيف ملفات المشاريع المحذوفة';

  @override
  String get cvMobStorageNote =>
      'تُحفظ الملفات المحوَّلة ونسخ المصادر في مجلد مستندات التطبيق؛ ولا تغادر جهازك أبدًا.';

  @override
  String get cvMobCleared => 'تم التنظيف';

  @override
  String get cvMobNoOutputsYet => 'لا توجد ملفات محوَّلة بعد.';

  @override
  String cvMobFilesAdded(int n) {
    return 'تمت إضافة $n ملف';
  }

  @override
  String get cvMobUnsupportedExt => 'ليس من ضمن امتدادات المصدر لهذا المشروع';

  @override
  String get cvMobUnsupportedOnMobile => 'غير مدعوم على الجوال';

  @override
  String get cvMobLicense =>
      'يُجرى تحويل الفيديو والصوت باستخدام FFmpegKit (LGPL 3.0، بدون مكوّنات GPL)؛ ويستخدم ترميز H.264 / H.265 مُرمِّز العتاد في الجهاز (iOS VideoToolbox وAndroid MediaCodec).';

  @override
  String cvMobConverted(int n) {
    return 'تم تحويل $n ملف';
  }

  @override
  String cvMobFilesCount(int n) {
    return '$n ملف';
  }

  @override
  String get sqMobUnsupportedMobile =>
      'هذا المحرك غير مدعوم على الجوال حتى الآن';

  @override
  String get sqMobPickFile => 'اختيار';

  @override
  String get sqMobFileCopied => 'تم نسخ الملف إلى دليل مستندات التطبيق';

  @override
  String get sqMobSshKeyPaste => 'الصق مفتاح PEM أو اختره من ملف';

  @override
  String get sqMobErrHost => 'عنوان الخادم مطلوب';

  @override
  String get sqMobErrFile => 'اختر ملف قاعدة البيانات';

  @override
  String get sqMobErrSshHost => 'خادم SSH واسم المستخدم مطلوبان';

  @override
  String get sqMobErrSshKey => 'مفتاح SSH الخاص مطلوب';

  @override
  String get sqMobSslVerifyNote =>
      'لا يتحقق مشغّل MySQL من الشهادات؛ ويعمل خيار \"التحقق\" كخيار \"إلزامي\".';

  @override
  String get sqMobRowDetail => 'تفاصيل الصف';

  @override
  String get sqMobNoResult => 'لا توجد نتائج — ابدأ بالضغط على تشغيل';

  @override
  String get sqMobExportJsonl => 'JSONL (كائن JSON في كل سطر)';

  @override
  String get sqMobExportNoRows => 'لا توجد صفوف للتصدير';

  @override
  String get sqMobSettingsTitle => 'إعدادات SQL Master';

  @override
  String get sqMobRowLimit => 'حد صفوف الاستعلام';

  @override
  String get sqMobPreviewRows => 'صفوف معاينة الجدول';

  @override
  String get sqMobEditorFont => 'حجم خط المحرر';

  @override
  String get sqMobCopyCell => 'نسخ القيمة';

  @override
  String get sqMobSelectionRun => 'تشغيل التحديد';

  @override
  String get sqMobTunnelOpening => 'يتم فتح نفق SSH…';

  @override
  String get sqMobConnectingDb => 'يتم الاتصال بقاعدة البيانات…';

  @override
  String get sqMobOpEq => '= (يساوي)';

  @override
  String get sqMobOpNe => '≠ (لا يساوي)';

  @override
  String get sqMobOpLt => '< (أصغر من)';

  @override
  String get sqMobOpGt => '> (أكبر من)';

  @override
  String get sqMobOpLe => '≤ (أصغر من أو يساوي)';

  @override
  String get npMobSaveAs => 'حفظ باسم…';

  @override
  String get npMobSaveAsTitle => 'حفظ باسم';

  @override
  String get npMobDefaultProjectName => 'مشروع';

  @override
  String get npMobLocalPathExample => 'المستندات/Notepad Master/…';

  @override
  String get npMobReplaceAll => 'استبدال الكل';

  @override
  String get sqMobDuckExcelNote =>
      'تتطلب ملفات Excel (.xlsx) إضافة \"excel\" في DuckDB؛ إذا تعذر تحميل الإضافة على هذا الجهاز يفشل الفتح. لا تحتاج CSV وParquet وJSON إلى أي إعداد إضافي.';

  @override
  String get sqMobDuckExcelUnsupported =>
      'تعذر فتح ملف Excel: لم يمكن تحميل إضافة \"excel\" في DuckDB على هذا الجهاز. احفظ الملف بصيغة CSV وحاول مرة أخرى.';

  @override
  String get sqMobDuckFileNotFound => 'الملف غير موجود';

  @override
  String get sqMobDuckNativeMissing =>
      'تعذر تحميل مكتبة DuckDB الأصلية (libduckdb). ربما تم بناء التطبيق بدون ملف DuckDB ثنائي لهذه المنصة.';

  @override
  String get sqMobMssqlNativeMissing =>
      'مكتبة SQL Server الأصلية (FreeTDS libsybdb.so) غير مضمنة في التطبيق. يجب إضافة دليل jniLibs الخاص بـ mssql_connection إلى بناء Android.';

  @override
  String get sqMobMssqlConnectFailed =>
      'تعذر الاتصال بـ SQL Server. تحقق من عنوان الخادم والمنفذ والمستخدم/كلمة المرور ووضع TLS (التفاصيل تحت \"MssqlClient\" في سجل الجهاز).';

  @override
  String get sqMobMssqlIosUnsupported =>
      'مشغّل SQL Server غير مدعوم بعد على iOS (مكتبة FreeTDS غير مضمنة).';

  @override
  String get cvMobSpeechModelFallback =>
      'هذا النموذج غير متاح على الجوال؛ يُستخدم نموذج Base على هذا الجهاز. يسري اختيارك على سطح المكتب.';

  @override
  String get cvMobPerWindowNote =>
      'لا تُبلغ نسخة الجوال عن اللغة المكتشفة؛ يسري هذا الخيار على سطح المكتب.';

  @override
  String get cvMobOcrUnsupported =>
      'غير قابل للقراءة على الجوال (لا يوجد نموذج ML Kit)؛ يُستخدم على سطح المكتب';

  @override
  String get cvMobOcrMax => 'يمكن اختيار 6 لغات كحد أقصى.';

  @override
  String get cvMobShareAllTexts => 'مشاركة كل النصوص';

  @override
  String get cvMobShareText => 'مشاركة النص';

  @override
  String get cvMobDeleteText => 'حذف النص';

  @override
  String get cvMobCancelText => 'إلغاء مهمة النص';

  @override
  String get cvMobPhaseDownload => 'جارٍ تنزيل نموذج الكلام';

  @override
  String get cvMobPhaseWav => 'جارٍ تجهيز الصوت (WAV بتردد 16 كيلوهرتز)…';

  @override
  String get cvMobPhaseRunSpeech =>
      'جارٍ تحويل الكلام إلى نص… (المدة تعتمد على طول الملف)';

  @override
  String get cvMobPhaseRunOcr => 'جارٍ قراءة النص…';

  @override
  String cvMobTextsCount(int n) {
    return '$n نص';
  }

  @override
  String get cvMobNoTextsYet => 'لا توجد نصوص بعد.';

  @override
  String get cvMobSpeechModels => 'نماذج الكلام';

  @override
  String get cvMobSpeechModelsNote =>
      'يعمل التعرف على الكلام (whisper.cpp) على هذا الجهاز؛ يُنزَّل النموذج عند أول استخدام ويمكنك تنزيله مسبقاً أو حذفه من هنا. نموذجا Medium وLarge v3 Turbo غير متاحين على الجوال.';

  @override
  String get cvMobTexts => 'النصوص (كلام / OCR)';

  @override
  String get cvMobOcrSettingsNote =>
      'يعمل استخراج النص من الصور على الجهاز عبر Google ML Kit؛ تُدعم الكتابات اللاتينية (بما فيها التركية) والصينية واليابانية والكورية والديفاناغارية. تأتي نماذج التعرف مع التطبيق؛ لا حاجة للتنزيل.';

  @override
  String get npMobDocumentsRoot => 'المستندات';

  @override
  String get smMobFiles => 'الملفات';
}
