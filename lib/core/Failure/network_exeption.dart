import 'package:get/get.dart';

abstract interface class NetworkException implements Exception {
  final String message;

  const NetworkException(this.message);
}

class ServerException extends NetworkException {
   ServerException() : super("an_internet_problem_try_again".tr);
}

class NetworkErrorException extends NetworkException {
   NetworkErrorException() : super("error_in_yor_internet_connection".tr);
}

class UnknownException extends NetworkException {
   UnknownException() : super("un_exeption_error".tr);
}

class RequestTimeoutException extends NetworkException {
  RequestTimeoutException() : super('connection_request_timeout_y_bro'.tr);
}

class SendTimeoutException extends NetworkException {
  SendTimeoutException() : super('send_timeout_in_connection_with_api_server'.tr);
}

class ReceiveTimeoutException extends NetworkException {
  ReceiveTimeoutException()
    : super('receive_timeout_in_connection_with_aPI_server'.tr);
}

class BadCertificateException extends NetworkException {
  BadCertificateException() : super('bad_certificate'.tr);
}

class BadResponseException extends NetworkException {
  BadResponseException({int? statusCode})
    : super('bad_response_with_status_code: $statusCode.'.tr);
}

class RequestCancelledException extends NetworkException {
  RequestCancelledException() : super('request_to_aPI_server_was_cancelled'.tr);
}

class ConnectionErrorException extends NetworkException {
  ConnectionErrorException() : super('connection_error'.tr);
}
