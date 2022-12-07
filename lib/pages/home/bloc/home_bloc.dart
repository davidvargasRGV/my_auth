import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';

part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  HomeBloc() : super(const HomeStateInitial()) {
    on<HomeEventLockButtonPressed>(_onLockButtonPressed);
    on<HomeEventLogoutButtonPressed>(_onLogoutButtonPressed);
  }

  Future<void> _onLockButtonPressed(HomeEvent event, Emitter<HomeState> emit) async {
    emit(const HomeStateLocked());
  }

  Future<void> _onLogoutButtonPressed(HomeEvent event, Emitter<HomeState> emit) async {
    emit(const HomeStateLogout());
  }
}
