import 'package:dio/dio.dart';

abstract class Failure {
  final String errorMessage;
  final String errorCode;

  Failure({required this.errorMessage, required this.errorCode});

  @override
  String toString() => errorMessage;

  static Failure handleError(dynamic e) {
    if (e is Failure) {
      return e;
    }

    if (e is DioException) {
      switch (e.type) {
        case DioExceptionType.connectionTimeout:
        case DioExceptionType.sendTimeout:
        case DioExceptionType.receiveTimeout:
        case DioExceptionType.connectionError:
          return NetworkError(
            errorMessage: 'Network error, please try again',
            errorCode: 'NETWORK_ERROR',
          );

        case DioExceptionType.badResponse:
          return AuthError(
            errorMessage: 'Server error',
            errorCode: e.response?.statusCode?.toString() ?? 'UNKNOWN',
          );

        case DioExceptionType.badCertificate:
          return NetworkError(
            errorMessage: 'Bad certificate',
            errorCode: 'BAD_CERTIFICATE',
          );

        case DioExceptionType.cancel:
          return NetworkError(
            errorMessage: 'Request was cancelled',
            errorCode: 'CANCELLED',
          );

        case DioExceptionType.transformTimeout:
          return NetworkError(
            errorMessage: 'Request transform timeout',
            errorCode: 'TRANSFORM_TIMEOUT',
          );

        case DioExceptionType.unknown:
          return NetworkError(
            errorMessage: 'Something went wrong',
            errorCode: 'UNKNOWN',
          );
      }
    }

    return FailureModel(
      errorMessage: 'Something went wrong',
      errorCode: 'UNKNOWN',
    );
  }
}

class AuthError extends Failure {
  AuthError({required super.errorMessage, required super.errorCode});
}

class NetworkError extends Failure {
  NetworkError({required super.errorMessage, required super.errorCode});
}

class FailureModel extends Failure {
  FailureModel({required super.errorMessage, required super.errorCode});
}
