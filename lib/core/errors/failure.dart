import 'package:dio/dio.dart';

class Failure {
  final String err;

  Failure({required this.err});
}

class ServerFailure extends Failure {
  ServerFailure({required super.err});

  factory ServerFailure.fromDio(DioException dioException) {
    switch (dioException.type) {
      case DioExceptionType.connectionTimeout:
        return ServerFailure(
          err: "Connection timed out. Please check your internet connection.",
        );
      case DioExceptionType.sendTimeout:
        return ServerFailure(err: "Unable to send request. Please try again.");
      case DioExceptionType.receiveTimeout:
        return ServerFailure(
          err: "Server took too long to respond. Please try again.",
        );
      case DioExceptionType.badCertificate:
        return ServerFailure(
          err:
              "SSL certificate error. Please check your connection or contact support.",
        );
      case DioExceptionType.badResponse:
        return ServerFailure.fromResponse(
          dioException.response!.statusCode!,
          dioException.response!.data,
        );
      case DioExceptionType.cancel:
        return ServerFailure(err: "Request was cancelled. Please try again.");
      case DioExceptionType.connectionError:
        return ServerFailure(
          err: "Connection error. Please check your internet connection.",
        );
      case DioExceptionType.unknown:
        return ServerFailure(
          err: "An unknown error occurred. Please try again later.",
        );
    }
  }

  factory ServerFailure.fromResponse(int status, dynamic response) {
    if (status == 400 || status == 401 || status == 403) {
      return ServerFailure(
        err:
            response["error"]["message"] ??
            "An error occurred. Please try again.",
      );
    } else if (status == 404) {
      return ServerFailure(
        err: "Resource not found. Please check the URL or try again later.",
      );
    } else {
      return ServerFailure(
        err: "An error occurred with status code " + status.toString() + ". Please try again.",
      );
    }
  }
}
