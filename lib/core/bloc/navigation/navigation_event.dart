part of 'navigation_bloc.dart';

@immutable
abstract class NavigationEvent {
  const NavigationEvent();
}

class NavigationEventNavigateToHomePage extends NavigationEvent {
  const NavigationEventNavigateToHomePage();
}
