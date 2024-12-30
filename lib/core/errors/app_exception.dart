import 'dart:io';

import 'package:flutter/material.dart';

import 'package:dio/dio.dart';

import 'error_type.dart';
import 'failure.dart';

/* 
  try {
    final params = {
      "apiKey": Constants.key,
      "country": _appPref.getLocal().countryCode,
    };
    final response = await _apiService.get(
      endPoint: "top-headlines",
      params: params,
    );
    // success
    // return either right
    // return data
    final data = BaseResponseDto.fromJson(response.data);
    return Right(data.articles!);
  } catch (error) {
    return Left(ErrorHandler.handle(error).failure);
  }
*/
class AppException implements Exception {

  AppException.handle(dynamic error) {
    if (error is DioException) {
      // dio error so its an error from response of the API or from dio itself
      failure = _handleError(error);
    } else if (error is SocketException) {
      // socket error so its a network issue
      failure = ErrorType.noInternetConnection.failure;
    }
    // else if (error is FormatException) {
    //   debugPrint('FormatException: ********************************');
    //   failure = ErrorType.formatError.failure;
    // } else if (error is TypeError) {
    //   // debugPrint(error.toString());
    //   failure = Failure(
    //     ResponseCode.formatError,
    //     error.toString(),
    //   );
    // }
    else {
      debugPrint(error.toString());

      // default error
      failure = ErrorType.other.failure;
      // failure = Failure(
      //   ResponseCode.other,
      //   error.toString(),
      // );
    }
  }
  late Failure failure;

  @override
  String toString() {
    return 'statusCode=${failure.code}\n message=${failure.message}';
  }
}

Failure _handleError(DioException error) {
  switch (error.type) {
    case DioExceptionType.cancel:
      return ErrorType.cancel.failure;
    case DioExceptionType.connectionTimeout:
      return ErrorType.connectTimeout.failure;
    case DioExceptionType.sendTimeout:
      return ErrorType.sendTimeout.failure;
    case DioExceptionType.receiveTimeout:
      return ErrorType.receiveTimeout.failure;
    case DioExceptionType.connectionError:
      return ErrorType.connectionError.failure;
    case DioExceptionType.badResponse:
      if (error.response != null &&
          error.response?.statusCode != null &&
          error.response?.statusMessage != null) {
        if ((error.response?.statusCode ?? 0) == 400) {
          // if ((error.response?.data['message'] ?? '') ==
          //     'Username or email already exists') {
          //   return Failure(
          //     error.response?.statusCode ?? 0,
          //     'اسم المستخدم أو البريد الإلكتروني موجود بالفعل',
          //   );
          // }
          return Failure(
            error.response?.statusCode ?? 0,
            error.response?.data['message'] ?? '',
          );
        }
        return Failure.fromStatusCode(error.response?.statusCode ?? 0);
      } else {
        return ErrorType.other.failure;
      }
    default:
      return ErrorType.other.failure;
  }
}
