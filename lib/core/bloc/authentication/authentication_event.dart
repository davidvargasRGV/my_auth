part of 'authentication_bloc.dart';

@immutable
abstract class AuthenticationEvent {
  const AuthenticationEvent();
}

class AuthenticationEventSetUnauthenticated extends AuthenticationEvent {
  const AuthenticationEventSetUnauthenticated();
}

class AuthenticationEventSetAuthenticatedUnlocked extends AuthenticationEvent {
  const AuthenticationEventSetAuthenticatedUnlocked();
}

class AuthenticationEventSetAuthenticatedLocked extends AuthenticationEvent {
  const AuthenticationEventSetAuthenticatedLocked();
}
