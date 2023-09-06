import 'package:dio/dio.dart';

abstract class Failures {
  final String errorMessage;

  const Failures(this.errorMessage);
}

class ServerFailures extends Failures {
  ServerFailures(super.errorMessage);

  // ignore: deprecated_member_use
  factory ServerFailures.fromDioError(DioError dioError) {
    switch (dioError.type) {
      case DioExceptionType.connectionTimeout:
        return ServerFailures("connection Timeout ,try again later");
      case DioExceptionType.sendTimeout:
        return ServerFailures("connection sendTimeout ,try again later");
      case DioExceptionType.receiveTimeout:
        return ServerFailures("connection receive Timeout with server");
      case DioExceptionType.badCertificate:
        return ServerFailures("connection badCertificate with server");
      case DioExceptionType.badResponse:
        return ServerFailures.fromDioResponseError(
            statusCode: dioError.response!.statusCode!,
            response: dioError.response!.data);
      case DioExceptionType.cancel:
        return ServerFailures("Request connection is Canceld try later");
      case DioExceptionType.connectionError:
        return ServerFailures("connection Error try again later");
      case DioExceptionType.unknown:
        if (dioError.message!.contains("SocketException")) {
          return ServerFailures("Warnning Check your internet connection");
        }
        return ServerFailures("Unexpected Error please try again later");

      default:
        return ServerFailures("Opps there was an error , please try again");
    }
  }

  factory ServerFailures.fromDioResponseError(
      {required int statusCode, dynamic response}) {
    if (statusCode == 400 || statusCode == 401 || statusCode == 403) {
      return ServerFailures(response["error"]["message"]);
    } else if (statusCode == 404) {
      return ServerFailures("request trminated , page not found");
    } else if (statusCode == 500) {
      return ServerFailures("internal server error, please try again later");
    } else {
      return ServerFailures("Opps there was an error , please try again");
    }
  }
}
