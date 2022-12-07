part of 'authentication_bloc.dart';

@immutable
abstract class AuthenticationState {
  const AuthenticationState();
}

class AuthenticationStateUnauthenticated extends AuthenticationState {
  const AuthenticationStateUnauthenticated();
}

class AuthenticationStateAuthenticatedUnlocked extends AuthenticationState {
  const AuthenticationStateAuthenticatedUnlocked();
}

class AuthenticationStateAuthenticatedLocked extends AuthenticationState {
  const AuthenticationStateAuthenticatedLocked();
}
