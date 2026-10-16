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
}
