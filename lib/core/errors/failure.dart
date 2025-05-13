// import 'package:dio/dio.dart';

// class Failure {
//   final String err;

//   Failure({required this.err});
// }

// class Serverfailure extends Failure {
//   Serverfailure({required super.err});

//   factory Serverfailure.fromDio(DioException dioException) {
//     switch (dioException.type) {
//       case DioExceptionType.connectionTimeout:
//         return Serverfailure(
//           err: "Connection timed out. Please check your internet connection.",
//         );
//       case DioExceptionType.sendTimeout:
//         return Serverfailure(err: "Unable to send request. Please try again.");
//       case DioExceptionType.receiveTimeout:
//         return Serverfailure(
//           err: "Server took too long to respond. Please try again.",
//         );
//       case DioExceptionType.badCertificate:
//         return Serverfailure(
//           err:
//               "SSL certificate error. Please check your connection or contact support.",
//         );
//       case DioExceptionType.badResponse:
//         return Serverfailure.fromResponse(
//           dioException.response!.statusCode!,
//           dioException.response!.data,
//         );
//       case DioExceptionType.cancel:
//         return Serverfailure(err: "Request was cancelled. Please try again.");
//       case DioExceptionType.connectionError:
//         return Serverfailure(
//           err: "Connection error. Please check your internet connection.",
//         );
//       case DioExceptionType.unknown:
//         return Serverfailure(
//           err: "An unknown error occurred. Please try again later.",
//         );
//     }
//   }

//   factory Serverfailure.fromResponse(int status, dynamic response) {
//     if (status == 400 || status == 401 || status == 403) {
//       return Serverfailure(
//         err:
//             response["error"]["message"] ??
//             "An error occurred. Please try again.",
//       );
//     } else if (status == 404) {
//       return Serverfailure(
//         err: "Resource not found. Please check the URL or try again later.",
//       );
//     } else {
//       return Serverfailure(
//         err: "An error occurred with status code $status. Please try again.",
//       );
//     }
//   }
// }
