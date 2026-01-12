abstract interface class NetworkException implements Exception {
  final String message;

  const NetworkException(this.message);
}



class ServerException extends NetworkException {
  const ServerException()
      : super("an internet problem try again");
}

class NetworkErrorException extends NetworkException {
  const NetworkErrorException()
      : super("error in yor internet connection ");
}

class UnknownException extends NetworkException {
  const UnknownException()
      : super("un exepected error");
}