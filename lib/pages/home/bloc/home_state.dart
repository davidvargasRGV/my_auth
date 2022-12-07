part of 'home_bloc.dart';

@immutable
abstract class HomeState {
  const HomeState();
}

class HomeStateInitial extends HomeState {
  const HomeStateInitial();
}

class HomeStateLocked extends HomeState {
  const HomeStateLocked();
}

class HomeStateLogout extends HomeState {
  const HomeStateLogout();
}
