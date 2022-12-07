part of 'home_bloc.dart';

@immutable
abstract class HomeEvent {
  const HomeEvent();
}

class HomeEventLockButtonPressed extends HomeEvent {
  const HomeEventLockButtonPressed();
}

class HomeEventLogoutButtonPressed extends HomeEvent {
  const HomeEventLogoutButtonPressed();
}
