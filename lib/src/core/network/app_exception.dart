import 'package:dio/dio.dart';

sealed class AppException implements Exception {
  final String message;

  const AppException(this.message);

  @override
  String toString() => message;

  factory AppException.fromDioException(DioException e) {
    return switch (e.type) {
      DioExceptionType.connectionTimeout ||
      DioExceptionType.sendTimeout ||
      DioExceptionType.receiveTimeout =>
        const TimeoutException(),
      DioExceptionType.connectionError =>
        const NetworkException(),
      _ => ServerException(
          e.response?.statusCode,
          e.response?.statusMessage,
        ),
    };
  }
}

class NetworkException extends AppException {
  const NetworkException() : super('No internet connection');
}

class TimeoutException extends AppException {
  const TimeoutException() : super('Connection timed out');
}

class ServerException extends AppException {
  final int? statusCode;

  ServerException(this.statusCode, String? statusMessage)
      : super(statusMessage ?? 'Server error ($statusCode)');
}
