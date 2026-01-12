abstract class Failure {
  final String message;
  const Failure(this.message);
}

class ServerFailure extends Failure {
  const ServerFailure()
      : super("an internet problem try again");
}

class NetworkFailure extends Failure {
  const NetworkFailure()
      : super("error in yor internet connection ");
}

class UnknownFailure extends Failure {
  const UnknownFailure()
      : super("un exepected error");
}
class NetworkException extends Failure {
  final int? statusCode;

  const NetworkException(
      String message, {
        this.statusCode,
        String? details,
      }) : super(message);
}
Exception 