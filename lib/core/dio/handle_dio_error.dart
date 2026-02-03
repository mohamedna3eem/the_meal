import 'package:dio/dio.dart';
import 'package:the_meal/core/Failure/network_exeption.dart';

NetworkException handleDioError(DioException error) {
  switch (error.type) {
    case DioExceptionType.connectionTimeout:
      return RequestTimeoutException();

    case DioExceptionType.sendTimeout:
      return SendTimeoutException();

    case DioExceptionType.receiveTimeout:
      return ReceiveTimeoutException();

    case DioExceptionType.badCertificate:
      return BadCertificateException();

    case DioExceptionType.badResponse:
      return BadResponseException(statusCode: error.response?.statusCode);

    case DioExceptionType.cancel:
      return RequestCancelledException();

    case DioExceptionType.connectionError:
      return ConnectionErrorException();

    case DioExceptionType.unknown:

      return UnknownException();
  }
}

String _extractErrorMessageFromResponse(Response? response) {
  if (response == null) return "noResponse";

  try {
    final data = response.data;
    if (data is Map) {
      // Handles common formats
      if (data.containsKey('message')) return data['message'];
      if (data.containsKey('error')) return data['error'];
      if (data.containsKey('errors')) {
        // Laravel-style validation errors
        final errors = data['errors'];
        if (errors is Map && errors.isNotEmpty) {
          final firstError = errors.values.first;
          if (firstError is List && firstError.isNotEmpty) {
            return firstError.first.toString();
          }
        }
      }
    }

    if (data is String && data.isNotEmpty) {
      return data; // Plain text error response
    }

    return " badResponse [${response.statusCode}].";
  } catch (e) {
    return " failedToParseResponse ";
  }
}
