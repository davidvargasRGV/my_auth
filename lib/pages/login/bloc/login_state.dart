part of 'login_bloc.dart';

@immutable
abstract class LoginState {
  const LoginState();
}

class LoginStateInitial extends LoginState {
  const LoginStateInitial();
}

class LoginStateLoading extends LoginState {
  const LoginStateLoading();
}

class LoginStateLoaded extends LoginState {
  const LoginStateLoaded();
}

class LoginStateSuccess extends LoginState {
  const LoginStateSuccess();
}

class LoginStateFailure extends LoginState {
  final int errorCode;

  const LoginStateFailure(this.errorCode);
}

class LoginStateLogout extends LoginState {
  const LoginStateLogout();
}
