// ignore_for_file: lines_longer_than_80_chars

import 'failure.dart';
import 'response_code.dart';

enum ErrorType {
  success,
  noContent,
  badRequest,
  forbidden,
  unauthorised,
  notFound,
  internalServerError,
  connectTimeout,
  cancel,
  receiveTimeout,
  sendTimeout,
  cacheError,
  noInternetConnection,
  connectionError,
  formatError,
  // unprocessableContent,
  other;

  Failure get failure {
    // var context = rootNavigatorKey.currentState!.context;

    return switch (this) {
      ErrorType.success => Failure(
          ResponseCode.success,
          'success',
        ),
      ErrorType.noContent => Failure(
          ResponseCode.noContent,
          'noContent',
        ),
      ErrorType.badRequest => Failure(
          ResponseCode.badRequest,
          'badRequest',
        ),
      ErrorType.forbidden => Failure(
          ResponseCode.forbidden,
          'forbidden',
        ),
      ErrorType.unauthorised => Failure(
          ResponseCode.unauthorised,
          'unauthorised',
        ),
      ErrorType.notFound => Failure(
          ResponseCode.notFound,
          'notFound',
        ),
      // DataSource.unprocessableContent => Failure(
      //     ResponseCode.notFound,
      //     'notFound',
      //   ),
      ErrorType.internalServerError => Failure(
          ResponseCode.internalServerError,
          'internalServerError',
        ),
      ErrorType.connectTimeout => Failure(
          ResponseCode.connectTimeout,
          'connectTimeout',
        ),
      // Assuming 'cancel' corresponds to 'requestCanceled'
      ErrorType.cancel => Failure(
          ResponseCode.cancel,
          'requestCanceled',
        ),
      ErrorType.receiveTimeout => Failure(
          ResponseCode.receiveTimeout,
          'receiveTimeout',
        ),
      ErrorType.sendTimeout => Failure(
          ResponseCode.sendTimeout,
          'sendTimeout',
        ),
      ErrorType.cacheError => Failure(
          ResponseCode.cacheError,
          'cacheError',
        ),
      ErrorType.noInternetConnection => Failure(
          ResponseCode.noInternetConnection,
          'noInternetConnection',
        ),
      ErrorType.connectionError => Failure(
          ResponseCode.connectionError,
          'Connection Error!',
        ),
      ErrorType.formatError => Failure(
          ResponseCode.formatError,
          'Format Exception',
        ),
      ErrorType.other => Failure(
          ResponseCode.other,
          'Unknown Error',
        ),
    };
  }

  String get arabicMessage {
    return switch (this) {
      ErrorType.success => 'العملية تمت بنجاح.',
      ErrorType.noContent => 'لا يوجد محتوى لعرضه.',
      ErrorType.badRequest =>
        'الطلب غير صحيح. يُرجى التحقق من البيانات المُدخلة.',
      ErrorType.forbidden =>
        'الدخول مرفوض. ليس لديك الصلاحية لتنفيذ هذا الإجراء.',
      ErrorType.unauthorised =>
        'غير مصرح لك بالدخول. يُرجى تسجيل الدخول باستخدام بيانات صحيحة.',
      ErrorType.notFound =>
        'العنصر المطلوب غير موجود. يُرجى التحقق من البيانات المُدخلة.',
      ErrorType.internalServerError =>
        'حدث خطأ في الخادم. يُرجى المحاولة لاحقًا.',
      ErrorType.connectTimeout =>
        'انتهت مهلة الاتصال. يُرجى التحقق من الشبكة والمحاولة مرة أخرى.',
      ErrorType.cancel => 'تم إلغاء العملية من قِبلك.',
      ErrorType.receiveTimeout =>
        'انتهت مهلة الاستلام. يُرجى المحاولة مجددًا لاحقًا.',
      ErrorType.sendTimeout =>
        'انتهت مهلة الإرسال. يُرجى التحقق من الاتصال والمحاولة مرة أخرى.',
      ErrorType.cacheError =>
        'حدث خطأ أثناء الوصول إلى الذاكرة المؤقتة. يُرجى المحاولة مرة أخرى.',
      ErrorType.noInternetConnection =>
        'لا يوجد اتصال بالإنترنت. يُرجى التحقق من الاتصال بالشبكة.',
      ErrorType.connectionError =>
        'حدث خطأ في الاتصال. يُرجى التحقق من الشبكة والمحاولة مرة أخرى.',
      ErrorType.formatError =>
        'البيانات غير متوافقة مع التنسيق المتوقع. يُرجى التحقق من البيانات المُدخلة.',
      ErrorType.other =>
        'حدث خطأ غير معروف. يُرجى المحاولة مرة أخرى أو الاتصال بالدعم الفني.',
    };
  }
}
