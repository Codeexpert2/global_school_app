import 'dart:io';

/// Enum for all possible status codes
enum StatusCode {
  success(HttpStatus.ok),
  noContent(HttpStatus.noContent),
  badRequest(HttpStatus.badRequest),
  unauthorized(HttpStatus.unauthorized),
  forbidden(HttpStatus.forbidden),
  notFound(HttpStatus.notFound),
  timeout(HttpStatus.requestTimeout),
  unprocessableContent(HttpStatus.unprocessableEntity),
  serverError(HttpStatus.internalServerError),
  noInternet(-1),
  cancel(-2),
  cacheError(-3),
  formatError(-4),
  connectionError(-5),
  unknown(-99);

  final int code;
  // ignore: sort_constructors_first
  const StatusCode(this.code);

  static StatusCode fromCode(int? code) {
    return StatusCode.values.firstWhere(
      (status) => status.code == code,
      orElse: () => StatusCode.unknown,
    );
  }

  String get message => switch (this) {
        noContent => '',
        success => '',
        noInternet => 'networkErrorMessage',
        timeout => 'timeoutErrorMessage',
        badRequest => 'badRequestMessage',
        unauthorized => 'unauthorizedMessage',
        forbidden => 'forbiddenMessage',
        notFound => 'notFoundMessage',
        serverError => 'serverErrorMessage',
        unknown => 'unknownErrorMessage',
        unprocessableContent => 'unprocessableContent',
        cancel => 'requestCanceled',
        cacheError => 'cacheError',
        formatError => 'Format Exception',
        connectionError => 'connection Error Exception',
      };

  @override
  toString() => message;
}
