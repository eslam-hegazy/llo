part of 'global_cubit.dart';

@immutable
abstract class GlobalState {}

class GlobalInitial extends GlobalState {}

class ChangeVisibility1 extends GlobalState {}

class ChangeVisibility2 extends GlobalState {}

class LoadingRegisterState extends GlobalState {}

class SuccessfulRegisterState extends GlobalState {
  final MessageModel message;

  SuccessfulRegisterState(this.message);
}

class ErrorRegisterState extends GlobalState {
  final String error;

  ErrorRegisterState(this.error);
}

class LoadingLoginState extends GlobalState {}

class SuccessfulLoginState extends GlobalState {
  final MessageModel message;

  SuccessfulLoginState(this.message);
}

class ErrorLoginState extends GlobalState {
  final String error;

  ErrorLoginState(this.error);
}
