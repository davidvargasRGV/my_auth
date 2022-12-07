import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';

part 'authentication_event.dart';
part 'authentication_state.dart';

class AuthenticationBloc extends Bloc<AuthenticationEvent, AuthenticationState> {
  AuthenticationBloc() : super(const AuthenticationStateUnauthenticated()) {
    on<AuthenticationEventSetUnauthenticated>(_onSetUnauthenticated);
    on<AuthenticationEventSetAuthenticatedUnlocked>(_onSetAuthenticatedUnlocked);
    on<AuthenticationEventSetAuthenticatedLocked>(_onSetAuthenticatedLocked);
  }

  Future<void> _onSetUnauthenticated(AuthenticationEvent event, Emitter<AuthenticationState> emit) async {
    emit(const AuthenticationStateUnauthenticated());
  }

  Future<void> _onSetAuthenticatedUnlocked(AuthenticationEvent event, Emitter<AuthenticationState> emit) async {
    emit(const AuthenticationStateAuthenticatedUnlocked());
  }

  Future<void> _onSetAuthenticatedLocked(AuthenticationEvent event, Emitter<AuthenticationState> emit) async {
    emit(const AuthenticationStateAuthenticatedLocked());
  }
}
