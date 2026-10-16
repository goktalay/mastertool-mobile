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
}
