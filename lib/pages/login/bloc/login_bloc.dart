import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';

part 'login_event.dart';
part 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  LoginBloc() : super(const LoginStateInitial()) {
    // InitialView
    on<LoginEventLoginButtonPressed>(_onLoginButtonPressed);
    // LockedView
    on<LoginEventUnlockButtonPressed>(_onUnlockButtonPressed);
    on<LoginEventLogoutButtonPressed>(_onLogoutButtonPressed);
  }

  Future<void> _onLoginButtonPressed(LoginEvent event, Emitter<LoginState> emit) async {
    try {
      emit(const LoginStateLoading());

      await Future.delayed(const Duration(seconds: 2), () => {});

      emit(const LoginStateLoaded());
      emit(const LoginStateSuccess());
      // emit(const LoginStateFailure(500));
    } catch (e) {
      emit(const LoginStateLoaded());
      emit(const LoginStateFailure(500));
    }
  }

  Future<void> _onUnlockButtonPressed(LoginEvent event, Emitter<LoginState> emit) async {
    emit(const LoginStateSuccess());

    // try {
    //   // check password against local storage

    //   emit(const LoginStateSuccess());
    // } catch (e) {
    //   emit(const LoginStateFailure(500));
    // }
  }

  Future<void> _onLogoutButtonPressed(LoginEvent event, Emitter<LoginState> emit) async {
    // dialog to confirm logout

    emit(const LoginStateLogout());
  }
}
