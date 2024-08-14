import 'package:dio/dio.dart';

class Failure {
  final String message;

  Failure({required this.message});
}

class ServerFailure extends Failure {
  ServerFailure({required super.message});

  factory ServerFailure.fromDioException(DioException e) {
    switch (e.type) {
      case DioExceptionType.connectionTimeout:
        return ServerFailure(
            message:
                "The connection with the server timed out. Please try again later.");

      case DioExceptionType.sendTimeout:
        return ServerFailure(
            message:
                "The request to the server timed out while sending data. Please try again later.");
      case DioExceptionType.receiveTimeout:
        return ServerFailure(
            message:
                "The request to the server timed out while waiting for a response. Please try again later.");
      case DioExceptionType.badCertificate:
        return ServerFailure(
            message:
                "Encountered a security certificate issue while connecting to the server. Please ensure the server's certificate is valid and try again.");
      case DioExceptionType.badResponse:
        return ServerFailure.fromRespone(
            statusCode: e.response!.statusCode!, response: e.response!.data!);
      case DioExceptionType.cancel:
        return ServerFailure(
            message:
                "The request to the server was canceled. Please try again.");
      case DioExceptionType.connectionError:
        return ServerFailure(
            message:
                "No internet connection available. Please check your network settings and try again.");

      case DioExceptionType.unknown:
        return ServerFailure(
            message:
                "Oops! Something went wrong while communicating with the server. Please try again later.");
    }
  }
  factory ServerFailure.fromRespone(
      {required int statusCode, required dynamic response}) {
    if (statusCode == 404) {
      return ServerFailure(message: "Not Found!, Please try again later.");
    } else if (statusCode >= 500) {
      return ServerFailure(
          message: "There was error in Server, Please try again later.");
    } else if (statusCode == 400 || statusCode == 401 || statusCode == 403) {
      return ServerFailure(message: response["messages"]);
    } else {
      return ServerFailure(
          message:
              "Oops! Something went wrong while communicating with the server. Please try again later.");
    }
  }
}
