// DO NOT EDIT. This is code generated via package:intl/generate_localized.dart
// This is a library that provides messages for a ar locale. All the
// messages from the main program should be duplicated here with the same
// function name.

// Ignore issues from commonly used lints in this file.
// ignore_for_file:unnecessary_brace_in_string_interps, unnecessary_new
// ignore_for_file:prefer_single_quotes,comment_references, directives_ordering
// ignore_for_file:annotate_overrides,prefer_generic_function_type_aliases
// ignore_for_file:unused_import, file_names, avoid_escaping_inner_quotes
// ignore_for_file:unnecessary_string_interpolations, unnecessary_string_escapes

import 'package:intl/intl.dart';
import 'package:intl/message_lookup_by_library.dart';

final messages = new MessageLookup();

typedef String MessageIfAbsent(String messageStr, List<dynamic> args);

class MessageLookup extends MessageLookupByLibrary {
  String get localeName => 'ar';

  static String m0(count) =>
      "${Intl.plural(count, one: 'منذ يوم واحد', two: 'منذ يومين', other: 'منذ ${count} أيام')}";

  static String m1(Hour) => "${Hour} ساعة";

  static String m2(count) =>
      "${Intl.plural(count, one: 'منذ ساعة واحدة', two: 'منذ ساعتين', other: 'منذ ${count} ساعات')}";

  static String m3(minute) => "${minute} دقيقة";

  static String m4(count) =>
      "${Intl.plural(count, one: 'منذ دقيقة واحدة', two: 'منذ دقيقتين', other: 'منذ ${count} دقائق')}";

  static String m5(count) =>
      "${Intl.plural(count, one: 'منذ شهر واحد', two: 'منذ شهرين', other: 'منذ ${count} أشهر')}";

  static String m6(count) =>
      "${Intl.plural(count, one: 'منذ ثانية واحدة', two: 'منذ ثانيتين', other: 'منذ ${count} ثواني')}";

  static String m7(count) =>
      "${Intl.plural(count, one: 'منذ أسبوع واحد', two: 'منذ أسبوعين', other: 'منذ ${count} أسابيع')}";

  static String m8(count) =>
      "${Intl.plural(count, one: 'منذ عام واحد', two: 'منذ عامين', other: 'منذ ${count} أعوام')}";

  final messages = _notInlinedMessages(_notInlinedMessages);
  static Map<String, Function> _notInlinedMessages(_) => <String, Function>{
        "about": MessageLookupByLibrary.simpleMessage("حول"),
        "aboutApp": MessageLookupByLibrary.simpleMessage("عن التطبيق"),
        "accessDenied": MessageLookupByLibrary.simpleMessage("الوصول مرفوض"),
        "accessibilityIssue":
            MessageLookupByLibrary.simpleMessage("مشكلة في الوصول:"),
        "accountDeletedSuccess":
            MessageLookupByLibrary.simpleMessage("تم حذف الحساب بنجاح"),
        "accountHelp":
            MessageLookupByLibrary.simpleMessage("المساعدة في الحساب"),
        "addToBookmark":
            MessageLookupByLibrary.simpleMessage("إضافة إلى القائمة المرجعية"),
        "addToBookmarkSuccess": MessageLookupByLibrary.simpleMessage(
            "تمت الإضافة إلى القائمة المرجعية بنجاح"),
        "addedToFavoriteSuccess": MessageLookupByLibrary.simpleMessage(
            "تمت الإضافة إلى قائمة المفضلة بنجاح."),
        "adjustSpeed": MessageLookupByLibrary.simpleMessage("ضبط السرعة"),
        "all": MessageLookupByLibrary.simpleMessage("الكل"),
        "alreadyRegisteredQuestion":
            MessageLookupByLibrary.simpleMessage("هل قمت بالتسجيل سابقًا؟"),
        "appName": MessageLookupByLibrary.simpleMessage("الدرس"),
        "applanguage": MessageLookupByLibrary.simpleMessage("لغة التطبيق"),
        "apply": MessageLookupByLibrary.simpleMessage("تطبيق"),
        "attachments": MessageLookupByLibrary.simpleMessage("ملفات مرفقة"),
        "audioTrimmer": MessageLookupByLibrary.simpleMessage("محرر الصوت"),
        "backToHome": MessageLookupByLibrary.simpleMessage("Back to Home"),
        "backToLogin": MessageLookupByLibrary.simpleMessage("تسجيل الدخول"),
        "badRequest": MessageLookupByLibrary.simpleMessage("طلب غير صحيح"),
        "bookmarkList":
            MessageLookupByLibrary.simpleMessage("القوائم المرجعية"),
        "bookmarks": MessageLookupByLibrary.simpleMessage("المحفوظات"),
        "brokenLink": MessageLookupByLibrary.simpleMessage("رابط معطوب:"),
        "cacheError":
            MessageLookupByLibrary.simpleMessage("خطأ في التخزين المؤقت"),
        "cancel": MessageLookupByLibrary.simpleMessage("إلغاء"),
        "cancelDownloading":
            MessageLookupByLibrary.simpleMessage("إلغاء التحميل"),
        "categories": MessageLookupByLibrary.simpleMessage("التصنيفات"),
        "category": MessageLookupByLibrary.simpleMessage("التصنيف"),
        "changePassword":
            MessageLookupByLibrary.simpleMessage("تغيير كلمة المرور"),
        "checkEmail":
            MessageLookupByLibrary.simpleMessage("تفقد بريدك الإلكتروني"),
        "clear": MessageLookupByLibrary.simpleMessage("مسح"),
        "clipSavedSuccessfully":
            MessageLookupByLibrary.simpleMessage("تم حفظ المقطع بنجاح"),
        "confirmAccountInfo":
            MessageLookupByLibrary.simpleMessage("تأكيد معلومات الحساب"),
        "confirmPassword":
            MessageLookupByLibrary.simpleMessage("تأكيد كلمة المرور"),
        "confirmPasswordRequired":
            MessageLookupByLibrary.simpleMessage("كلمة المرور المؤكدة مطلوبة"),
        "connectTimeout":
            MessageLookupByLibrary.simpleMessage("انتهاء مهلة الاتصال"),
        "contactus": MessageLookupByLibrary.simpleMessage("تواصل معنا"),
        "contentInquiry":
            MessageLookupByLibrary.simpleMessage("استفسار عن المحتوى"),
        "continueAsGuest":
            MessageLookupByLibrary.simpleMessage("المتابعة كـ زائر"),
        "create": MessageLookupByLibrary.simpleMessage("إنشاء"),
        "createAccount": MessageLookupByLibrary.simpleMessage("إنشاء الحساب"),
        "createNewAccount":
            MessageLookupByLibrary.simpleMessage("إنشاء حساب جديد"),
        "daysAgo": m0,
        "deleteAccount": MessageLookupByLibrary.simpleMessage("حذف الحساب"),
        "deleteAccountConfirmation": MessageLookupByLibrary.simpleMessage(
            "هل أنت متأكد من أنك تريد حذف حسابك؟"),
        "deleteAccountMessage": MessageLookupByLibrary.simpleMessage(
            "حذف حسابك نهائي ولا يمكن التراجع عنه. ستتم إزالة جميع بياناتك من خوادمنا. إذا كنت متأكدًا من أنك تريد المتابعة، يرجى التأكيد أدناه"),
        "deleteAccountWarning": MessageLookupByLibrary.simpleMessage("تحذير:"),
        "deleteAccountWarning1": MessageLookupByLibrary.simpleMessage(
            "سيتم حذف جميع بياناتك الشخصية وتفضيلاتك بشكل دائم"),
        "deleteAccountWarning2": MessageLookupByLibrary.simpleMessage(
            "سوف تفقد الوصول إلى جميع المحتويات المحفوظة وميزات التطبيق."),
        "deleteAccountWarning3": MessageLookupByLibrary.simpleMessage(
            "هذا الإجراء غير قابل للإلغاء"),
        "description": MessageLookupByLibrary.simpleMessage("الوصف"),
        "didForgetYourPassword":
            MessageLookupByLibrary.simpleMessage("Did Forget your Password ?"),
        "dirNotExist":
            MessageLookupByLibrary.simpleMessage("الدليل غير موجود."),
        "done": MessageLookupByLibrary.simpleMessage("تم"),
        "downloadingCanceled":
            MessageLookupByLibrary.simpleMessage("تم إلغاء التحميل"),
        "downloadingFailed":
            MessageLookupByLibrary.simpleMessage("فشل التحميل"),
        "downloads": MessageLookupByLibrary.simpleMessage("التنزيلات"),
        "edit": MessageLookupByLibrary.simpleMessage("تعديل"),
        "email": MessageLookupByLibrary.simpleMessage("البريد الإلكتروني"),
        "emailOrPhoneNumber":
            MessageLookupByLibrary.simpleMessage("البريد الإلكتروني*"),
        "enterEmail":
            MessageLookupByLibrary.simpleMessage("ادخل البريد الإلكتروني"),
        "enterEmailOrPhone":
            MessageLookupByLibrary.simpleMessage("ادخل البريد الإلكتروني"),
        "enterMessageText":
            MessageLookupByLibrary.simpleMessage("أدخل نص الرسالة"),
        "enterName": MessageLookupByLibrary.simpleMessage("ادخل الاسم"),
        "enterOldPassword":
            MessageLookupByLibrary.simpleMessage("أدخل كلمة المرور القديمة"),
        "enterPassword":
            MessageLookupByLibrary.simpleMessage("ادخل كلمة المرور"),
        "enterPasswordAgain":
            MessageLookupByLibrary.simpleMessage("أدخل كلمة المرور مرة ثانية"),
        "enterTitle": MessageLookupByLibrary.simpleMessage("أدخل العنوان"),
        "enterValidEmail":
            MessageLookupByLibrary.simpleMessage("ادخل بريد إلكتروني صحيح"),
        "enterValidName": MessageLookupByLibrary.simpleMessage("ادخل اسم صحيح"),
        "enterValidNumber":
            MessageLookupByLibrary.simpleMessage("أدخل رقمًا صالحًا"),
        "enterYourEmail":
            MessageLookupByLibrary.simpleMessage("ادخل بريدك الإلكتروني"),
        "enterYourName":
            MessageLookupByLibrary.simpleMessage("ادخل اسمك بالكامل"),
        "enterYourPassword":
            MessageLookupByLibrary.simpleMessage("Enter your Password"),
        "enterYourPhoneNumber":
            MessageLookupByLibrary.simpleMessage("أدخل رقم هاتفك"),
        "error": MessageLookupByLibrary.simpleMessage("خطأ"),
        "favorites": MessageLookupByLibrary.simpleMessage("المفضلة"),
        "fileNotExist":
            MessageLookupByLibrary.simpleMessage("الملف غير موجود."),
        "filesSelected":
            MessageLookupByLibrary.simpleMessage("تم اختيار الملفات:"),
        "forbidden": MessageLookupByLibrary.simpleMessage("ممنوع"),
        "forgotPassword":
            MessageLookupByLibrary.simpleMessage("نسيت كلمة المرور؟"),
        "fromCamera": MessageLookupByLibrary.simpleMessage("التقاط صورة"),
        "fromGallery":
            MessageLookupByLibrary.simpleMessage("اختيار صورة من الاستوديو"),
        "home": MessageLookupByLibrary.simpleMessage("الرئيسية"),
        "homeScreen": MessageLookupByLibrary.simpleMessage("الرئيسية"),
        "hour": m1,
        "hoursAgo": m2,
        "info": MessageLookupByLibrary.simpleMessage("معلومة"),
        "internalServerError":
            MessageLookupByLibrary.simpleMessage("خطأ داخلي في الخادم"),
        "invalidCredentials":
            MessageLookupByLibrary.simpleMessage("بيانات الاعتماد غير صالحة"),
        "issueWithPlayback": MessageLookupByLibrary.simpleMessage(
            "مشكلة في تشغيل الصوت/الفيديو:"),
        "justNow": MessageLookupByLibrary.simpleMessage("الآن"),
        "lastViewed": MessageLookupByLibrary.simpleMessage("آخر استماعاتك"),
        "latest": MessageLookupByLibrary.simpleMessage("أُضيف حديثاً"),
        "link": MessageLookupByLibrary.simpleMessage("الرابط"),
        "listRemovedSuccess":
            MessageLookupByLibrary.simpleMessage("تمت إزالة القائمة بنجاح."),
        "loading": MessageLookupByLibrary.simpleMessage("جاري التحميل..."),
        "login": MessageLookupByLibrary.simpleMessage("سجل الدخول"),
        "loginButton": MessageLookupByLibrary.simpleMessage("تسجيل الدخول"),
        "loginFailed": MessageLookupByLibrary.simpleMessage(
            "فشلت عملية تسجيل الدخول، حاول مرة أخرى لاحقًا."),
        "loginSuccessful":
            MessageLookupByLibrary.simpleMessage("Login successful!"),
        "logout": MessageLookupByLibrary.simpleMessage("تسجيل خروج"),
        "message": MessageLookupByLibrary.simpleMessage("الرسالة"),
        "messageText": MessageLookupByLibrary.simpleMessage("نص الرسالة"),
        "messageTextShort":
            MessageLookupByLibrary.simpleMessage("نص الرسالة قصير !"),
        "methodNotAllowed":
            MessageLookupByLibrary.simpleMessage("الطريقة غير مسموح بها"),
        "minute": m3,
        "minutesAgo": m4,
        "missingInfoFromSocialProvider": MessageLookupByLibrary.simpleMessage(
            "معلومات مفقودة من مزود الخدمة"),
        "moderate": MessageLookupByLibrary.simpleMessage("متوسط"),
        "monthsAgo": m5,
        "mostViewed": MessageLookupByLibrary.simpleMessage("الأكثر مشاهدة"),
        "name": MessageLookupByLibrary.simpleMessage("الاسم*"),
        "nameTooShort": MessageLookupByLibrary.simpleMessage("الاسم قصير جدا"),
        "newList": MessageLookupByLibrary.simpleMessage("قائمة جديدة"),
        "newPassword":
            MessageLookupByLibrary.simpleMessage("كلمة المرور الجديدة"),
        "newPasswordMustDiffer": MessageLookupByLibrary.simpleMessage(
            "كلمة المرور الجديدة يجب أن تختلف عن كلمات المرور التي تم استخدامها سابقًا."),
        "noAccountQuestion":
            MessageLookupByLibrary.simpleMessage("ليس لديك حساب؟"),
        "noContent": MessageLookupByLibrary.simpleMessage("لا يوجد محتوى"),
        "noDownloadedFiles":
            MessageLookupByLibrary.simpleMessage("لا توجد ملفات تم تحميلها"),
        "noFilesSelected":
            MessageLookupByLibrary.simpleMessage("لم يتم اختيار أي ملفات"),
        "noInternetConnection":
            MessageLookupByLibrary.simpleMessage("لا يوجد اتصال بالإنترنت"),
        "noMoreData":
            MessageLookupByLibrary.simpleMessage("لا توجد بيانات أخرى"),
        "noNotifications":
            MessageLookupByLibrary.simpleMessage("لا توجد إشعارات."),
        "notFound": MessageLookupByLibrary.simpleMessage("غير موجود"),
        "notLoggedIn": MessageLookupByLibrary.simpleMessage(
            "لم تقم بتسجيل الدخول، يرجى تسجيل الدخول"),
        "notReceivedEmail":
            MessageLookupByLibrary.simpleMessage("لم تستلم البريد الرابط؟"),
        "noteAddedSuccessfully":
            MessageLookupByLibrary.simpleMessage("تمت إضافة الملاحظة بنجاح"),
        "notifications": MessageLookupByLibrary.simpleMessage("الإشعارات"),
        "ok": MessageLookupByLibrary.simpleMessage("تم"),
        "oldPassword":
            MessageLookupByLibrary.simpleMessage("كلمة المرور القديمة"),
        "oldPasswordRequired":
            MessageLookupByLibrary.simpleMessage("كلمة المرور القديمة مطلوبة"),
        "oneDayAgo": MessageLookupByLibrary.simpleMessage("منذ يوم واحد"),
        "oneHourAgo": MessageLookupByLibrary.simpleMessage("منذ ساعة واحدة"),
        "oneMinuteAgo": MessageLookupByLibrary.simpleMessage("منذ دقيقة واحدة"),
        "oneMonthAgo": MessageLookupByLibrary.simpleMessage("منذ شهر واحد"),
        "oneSecondAgo": MessageLookupByLibrary.simpleMessage("منذ ثانية واحدة"),
        "oneWeekAgo": MessageLookupByLibrary.simpleMessage("منذ أسبوع واحد"),
        "oneYearAgo": MessageLookupByLibrary.simpleMessage("منذ سنة واحدة"),
        "openEmailApp":
            MessageLookupByLibrary.simpleMessage("فتح تطبيق البريد الإلكتروني"),
        "optional": MessageLookupByLibrary.simpleMessage("(اختياري)"),
        "other": MessageLookupByLibrary.simpleMessage("آخر"),
        "password": MessageLookupByLibrary.simpleMessage("كلمة المرور*"),
        "passwordChanged":
            MessageLookupByLibrary.simpleMessage("تم تغيير كلمة المرور"),
        "passwordChangedSuccessfully":
            MessageLookupByLibrary.simpleMessage("تم تغيير كلمة المرور بنجاح"),
        "passwordCharsRequired": MessageLookupByLibrary.simpleMessage(
            "كلمة المرور يجب أن تحتوي على رموز خاصة"),
        "passwordLength": MessageLookupByLibrary.simpleMessage(
            "كلمة المرور يجب أن تحتوي على 8 أحرف على الأقل"),
        "passwordLowerCaseRequired": MessageLookupByLibrary.simpleMessage(
            "كلمة المرور يجب أن تحتوي على حرف صغير واحد على الأقل"),
        "passwordNotMatch":
            MessageLookupByLibrary.simpleMessage("كلمة المرور غير متطابقة"),
        "passwordNotValid":
            MessageLookupByLibrary.simpleMessage("كلمة المرور غير صالحة"),
        "passwordNumberRequired": MessageLookupByLibrary.simpleMessage(
            "كلمة المرور يجب أن تحتوي على رقم واحد على الأقل"),
        "passwordRequired":
            MessageLookupByLibrary.simpleMessage("كلمة المرور مطلوبة"),
        "passwordResetSuccess": MessageLookupByLibrary.simpleMessage(
            "تم إعادة تعيين كلمة المرور بنجاح. انقر أدناه لتسجيل الدخول."),
        "passwordStrength":
            MessageLookupByLibrary.simpleMessage("قوة كلمة المرور"),
        "passwordTooShort":
            MessageLookupByLibrary.simpleMessage("كلمة المرور قصيرة جداً"),
        "passwordUpperCaseRequired": MessageLookupByLibrary.simpleMessage(
            "كلمة المرور يجب أن تحتوي على حرف كبير واحد على الأقل"),
        "pauseDownloading":
            MessageLookupByLibrary.simpleMessage("إيقاف التحميل مؤقتًا"),
        "permissionNotReady":
            MessageLookupByLibrary.simpleMessage("الإذن غير جاهز."),
        "personalData": MessageLookupByLibrary.simpleMessage("الملف الشخصي"),
        "phone": MessageLookupByLibrary.simpleMessage("الهاتف"),
        "phoneNumber": MessageLookupByLibrary.simpleMessage("رقم الهاتف"),
        "pickFiles": MessageLookupByLibrary.simpleMessage("اختر الملفات"),
        "playlist": MessageLookupByLibrary.simpleMessage("قائمة التشغيل"),
        "privacyPolicy": MessageLookupByLibrary.simpleMessage("سياسة الخصوصية"),
        "profile": MessageLookupByLibrary.simpleMessage("الملف الشخصي"),
        "rateLesson": MessageLookupByLibrary.simpleMessage("تقييم الدرس"),
        "ratingFailed":
            MessageLookupByLibrary.simpleMessage("للأسف، فشل التقييم."),
        "ratingRemovedSuccess":
            MessageLookupByLibrary.simpleMessage("تمت إزالة التقييم بنجاح."),
        "ratingSuccess":
            MessageLookupByLibrary.simpleMessage("تم التقييم بنجاح."),
        "reason": MessageLookupByLibrary.simpleMessage("هدف التواصل"),
        "receiveTimeout":
            MessageLookupByLibrary.simpleMessage("انتهاء مهلة الاستقبال"),
        "refresh": MessageLookupByLibrary.simpleMessage("تحديث"),
        "removeList": MessageLookupByLibrary.simpleMessage("إزالة القائمة"),
        "reply": MessageLookupByLibrary.simpleMessage("أضف رد"),
        "report": MessageLookupByLibrary.simpleMessage("إبلاغ"),
        "reportIssue":
            MessageLookupByLibrary.simpleMessage("الإبلاغ عن أي مشكلة"),
        "reportProblem":
            MessageLookupByLibrary.simpleMessage("الإبلاغ عن مشكلة"),
        "reportType": MessageLookupByLibrary.simpleMessage("نوع البلاغ"),
        "requestCanceled":
            MessageLookupByLibrary.simpleMessage("تم إلغاء الطلب"),
        "requestFeature":
            MessageLookupByLibrary.simpleMessage("طلب ميزة جديدة"),
        "resendLink":
            MessageLookupByLibrary.simpleMessage("اضغط لإعادة الإرسال"),
        "resetPassword": MessageLookupByLibrary.simpleMessage(
            "تم إرسال رابط إعادة تعيين كلمة المرور إلى عنوان البريد الالكتروني "),
        "resetPasswordInstructions": MessageLookupByLibrary.simpleMessage(
            "سيصلك رابط التحقق على البريد الالكتروني."),
        "resumeDownloading":
            MessageLookupByLibrary.simpleMessage("استئناف التحميل"),
        "retry": MessageLookupByLibrary.simpleMessage("إعادة المحاولة"),
        "save": MessageLookupByLibrary.simpleMessage("حفظ"),
        "search": MessageLookupByLibrary.simpleMessage("ابحث هنا"),
        "secondsAgo": m6,
        "seeMore": MessageLookupByLibrary.simpleMessage("أظهر المزيد"),
        "selectRatingStar":
            MessageLookupByLibrary.simpleMessage("يرجى اختيار نجمة التقييم."),
        "sendTimeout":
            MessageLookupByLibrary.simpleMessage("انتهاء مهلة الإرسال"),
        "sendVerificationEmail":
            MessageLookupByLibrary.simpleMessage("ارسل بريد التحقق"),
        "settings": MessageLookupByLibrary.simpleMessage("الإعدادات"),
        "showLess": MessageLookupByLibrary.simpleMessage("أظهر القليل"),
        "signInWith":
            MessageLookupByLibrary.simpleMessage("تسجيل الدخول باستخدام"),
        "skip": MessageLookupByLibrary.simpleMessage("تخطي"),
        "socialProviderNoEmail":
            MessageLookupByLibrary.simpleMessage("حدث خطأ من مزود الخدمة"),
        "startDownloading":
            MessageLookupByLibrary.simpleMessage("ابدأ التحميل"),
        "strong": MessageLookupByLibrary.simpleMessage("قوي"),
        "studio": MessageLookupByLibrary.simpleMessage("الاستوديو"),
        "submit": MessageLookupByLibrary.simpleMessage("أرسل"),
        "success": MessageLookupByLibrary.simpleMessage("نجاح"),
        "techSupport": MessageLookupByLibrary.simpleMessage("الدعم الفني"),
        "termsConditions":
            MessageLookupByLibrary.simpleMessage("سياسة الاستخدام"),
        "test": MessageLookupByLibrary.simpleMessage("امتحان"),
        "title": MessageLookupByLibrary.simpleMessage("العنوان"),
        "titleRequired": MessageLookupByLibrary.simpleMessage("العنوان مطلوب"),
        "titleShort": MessageLookupByLibrary.simpleMessage("العنوان قصير"),
        "unauthorised": MessageLookupByLibrary.simpleMessage("غير مصرح به"),
        "unauthorized": MessageLookupByLibrary.simpleMessage("غير مصرح"),
        "unknownError":
            MessageLookupByLibrary.simpleMessage("حدث خطأ غير معروف!"),
        "unprocessableEntity":
            MessageLookupByLibrary.simpleMessage("كيان غير قابل للمعالجة"),
        "update": MessageLookupByLibrary.simpleMessage("تحديث"),
        "updateUserInfo":
            MessageLookupByLibrary.simpleMessage("تحديث معلومات المستخدم"),
        "userInfoUpdated": MessageLookupByLibrary.simpleMessage(
            "تم تحديث معلومات المستخدم بنجاح."),
        "userIsBlocked": MessageLookupByLibrary.simpleMessage("المستخدم محظور"),
        "userName": MessageLookupByLibrary.simpleMessage("اسم المستخدم"),
        "veryStrong": MessageLookupByLibrary.simpleMessage("قوي جدًا"),
        "warning": MessageLookupByLibrary.simpleMessage("تحذير"),
        "weak": MessageLookupByLibrary.simpleMessage("ضعيف"),
        "weeksAgo": m7,
        "welcomeBack":
            MessageLookupByLibrary.simpleMessage("أهلاً وسهلاً بعودتكم!"),
        "welcomeToTheHomeScreen":
            MessageLookupByLibrary.simpleMessage("Welcome to the Home Screen!"),
        "writeComment": MessageLookupByLibrary.simpleMessage("كتابة تعليق"),
        "wrongUrl": MessageLookupByLibrary.simpleMessage("رابط غير صحيح"),
        "yearsAgo": m8,
        "youDontHaveAccount":
            MessageLookupByLibrary.simpleMessage("You don\'t have account ?")
      };
}
