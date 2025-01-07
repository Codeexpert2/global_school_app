import 'dart:io';
import 'package:dio/dio.dart';

import 'app_exception.dart';
import 'status_code.dart';

/// Simple error handler class
class ErrorHandler {
  static AppException handle(dynamic error) {
    if (error is SocketException) {
      // socket error so its a network issue
      return AppException(
        message: StatusCode.noInternet.message,
        statusCode: StatusCode.noInternet,
      );
    }

    if (error is AppException) {
      return error;
    }

    if (error is DioException) {
      return _handleDioError(error);
    }

    return AppException(
      message: StatusCode.unknown.message,
      statusCode: StatusCode.unknown,
      data: error.toString(),
    );
  }

  static AppException _handleDioError(DioException error) {
    switch (error.type) {
      case DioExceptionType.connectionTimeout:
      case DioExceptionType.sendTimeout:
      case DioExceptionType.receiveTimeout:
        return AppException(
          message: StatusCode.timeout.message,
          statusCode: StatusCode.timeout,
        );

      case DioExceptionType.connectionError:
        return AppException(
          message: StatusCode.noInternet.message,
          statusCode: StatusCode.noInternet,
        );

      case DioExceptionType.badResponse:
        final statusCode = StatusCode.fromCode(
          error.response?.statusCode,
        );

        return AppException(
          message: statusCode.message,
          statusCode: statusCode,
          data: error.response?.data,
        );

      default:
        return AppException(
          message: StatusCode.unknown.message,
          statusCode: StatusCode.unknown,
          data: error.toString(),
        );
    }
  }
}
