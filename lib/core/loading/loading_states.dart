import 'package:the_meal/core/Failure/failure.dart';

sealed class LoadingState {}

class Loading extends LoadingState {
  bool showSuccessWidget = false;

  Loading({this.showSuccessWidget = false});
}

class Idle extends LoadingState {}

class LoadingSuccess<T> extends LoadingState {
  T? data;

  LoadingSuccess({this.data});
}

class LoadingException extends LoadingState {
  final NetworkFailure exception;

  LoadingException(this.exception);
}
