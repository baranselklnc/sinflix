abstract class AppException implements Exception {
  final String message;
  final String? code;
  final dynamic originalError;

  const AppException({
    required this.message,
    this.code,
    this.originalError,
  });

  @override
  String toString() => 'AppException: $message';
}

class NetworkException extends AppException {
  const NetworkException({
    required String message,
    String? code,
    dynamic originalError,
  }) : super(
          message: message,
          code: code,
          originalError: originalError,
        );
}

class ServerException extends AppException {
  const ServerException({
    required String message,
    String? code,
    dynamic originalError,
  }) : super(
          message: message,
          code: code,
          originalError: originalError,
        );
}

class AuthException extends AppException {
  const AuthException({
    required String message,
    String? code,
    dynamic originalError,
  }) : super(
          message: message,
          code: code,
          originalError: originalError,
        );
}

class ValidationException extends AppException {
  final Map<String, String>? fieldErrors;

  const ValidationException({
    required String message,
    String? code,
    this.fieldErrors,
    dynamic originalError,
  }) : super(
          message: message,
          code: code,
          originalError: originalError,
        );
}

class CacheException extends AppException {
  const CacheException({
    required String message,
    String? code,
    dynamic originalError,
  }) : super(
          message: message,
          code: code,
          originalError: originalError,
        );
}

class UnknownException extends AppException {
  const UnknownException({
    required String message,
    String? code,
    dynamic originalError,
  }) : super(
          message: message,
          code: code,
          originalError: originalError,
        );
} 