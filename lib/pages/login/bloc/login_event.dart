part of 'login_bloc.dart';

@immutable
abstract class LoginEvent {
  const LoginEvent();
}

// InitialView
class LoginEventLoginButtonPressed extends LoginEvent {
  const LoginEventLoginButtonPressed();
}

// LockedView
class LoginEventUnlockButtonPressed extends LoginEvent {
  const LoginEventUnlockButtonPressed();
}

class LoginEventLogoutButtonPressed extends LoginEvent {
  const LoginEventLogoutButtonPressed();
}
