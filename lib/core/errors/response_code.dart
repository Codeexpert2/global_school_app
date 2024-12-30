import 'dart:io';

class ResponseCode {
  // success with data
  static const int success = HttpStatus.ok;
  // success with no data (no content)
  static const int noContent = HttpStatus.created;
  // API rejected request
  static const int badRequest = HttpStatus.badRequest;
  // user is not authorised
  static const int unauthorised = HttpStatus.unauthorized;
  // API rejected request
  static const int forbidden = HttpStatus.forbidden;
  // not found
  static const int notFound = HttpStatus.notFound;
  // Unprocessable Content
  static const int unprocessableContent = HttpStatus.unprocessableEntity;
  // crash in server side
  static const int internalServerError = HttpStatus.internalServerError;

  // local status code
  static const int connectTimeout = -1;
  static const int cancel = -2;
  static const int receiveTimeout = -3;
  static const int sendTimeout = -4;
  static const int cacheError = -5;
  static const int noInternetConnection = -6;
  static const int connectionError = -7;
  static const int formatError = -8;
  static const int other = -9;
}
