import 'package:dio/dio.dart';

String handleDioError(DioException error) {
  switch (error.type) {
    case DioExceptionType.connectionTimeout:
      return "connection Timeout";

    case DioExceptionType.sendTimeout:
      return "sendTimeout";

    case DioExceptionType.receiveTimeout:
      return "receiveTimeout";

    case DioExceptionType.badCertificate:
      return "badCertificate";

    case DioExceptionType.badResponse:
      return _extractErrorMessageFromResponse(error.response);

    case DioExceptionType.cancel:
      return "dioErrorCancel";

    case DioExceptionType.connectionError:
      return "connectionError";

    case DioExceptionType.unknown:
      return "unknownError ${error.message}";
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
