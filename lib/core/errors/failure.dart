// class Failure {
//   int code; // 200, 201, 400, 303..500 and so on
//   // String errorCode; // 200, 201, 400, 303..500 and so on
//   String message; // error , success

//   Failure(this.code, this.message);

//   @override
//   String toString() => message;
// }
import 'dart:io';

import 'package:template/core/errors/error_type.dart';

class Failure { // error, success

  Failure(this.code, this.message);

  // Factory constructor to create Failure based on status code
  factory Failure.fromStatusCode(int statusCode) {
    final errorType = _mapStatusCodeToErrorType(statusCode);
    return Failure(statusCode, errorType.arabicMessage);
  }
  int code; // 200, 201, 400, 303..500 and so on
  String message;

  // Override the toString method to return the message
  @override
  String toString() => message;

  // Method to map status code to ErrorType
  static ErrorType _mapStatusCodeToErrorType(int statusCode) {
    switch (statusCode) {
      case HttpStatus.ok:
        return ErrorType.success;
      case HttpStatus.noContent:
        return ErrorType.noContent;
      case HttpStatus.badRequest:
        return ErrorType.badRequest;
      case HttpStatus.unauthorized:
        return ErrorType.unauthorised;
      case HttpStatus.forbidden:
        return ErrorType.forbidden;
      case HttpStatus.notFound:
        return ErrorType.notFound;
      case HttpStatus.internalServerError:
        return ErrorType.internalServerError;
      // Add other cases as needed
      default:
        return ErrorType.other;
    }
  }
}
