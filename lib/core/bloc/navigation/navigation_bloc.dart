import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';

part 'navigation_event.dart';
part 'navigation_state.dart';

class NavigationBloc extends Bloc<NavigationEvent, NavigationState> {
  NavigationBloc() : super(const NavigationStateHomePage()) {
    on<NavigationEventNavigateToHomePage>(_onNavigateToHomePage);
  }

  Future<void> _onNavigateToHomePage(NavigationEvent event, Emitter<NavigationState> emit) async {
    emit(const NavigationStateHomePage());
  }
}
