import 'status_code.dart';

/// Main exception class for the app
class AppException implements Exception {
  AppException({
    required this.message,
    required this.statusCode,
    this.data,
  });
  final String message;
  final StatusCode statusCode;
  final dynamic data;

  @override
  String toString() => message;
}
