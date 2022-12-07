import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../core/bloc/authentication/authentication_bloc.dart';
import '../bloc/home_bloc.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  @override
  Widget build(BuildContext context) {
    return BlocListener<HomeBloc, HomeState>(
      listener: _homeBlocListener,
      child: Scaffold(
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextButton(
                onPressed: () => _onLockButtonPressed(context),
                child: const Text('Lock'),
              ),
              TextButton(
                onPressed: () => _onLogoutButtonPressed(context),
                child: const Text('Logout'),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _homeBlocListener(BuildContext context, HomeState state) async {
    if (state is HomeStateLocked) {
      BlocProvider.of<AuthenticationBloc>(context).add(const AuthenticationEventSetAuthenticatedLocked());
    }

    if (state is HomeStateLogout) {
      BlocProvider.of<AuthenticationBloc>(context).add(const AuthenticationEventSetUnauthenticated());
    }
  }

  void _onLockButtonPressed(BuildContext context) {
    BlocProvider.of<HomeBloc>(context).add(const HomeEventLockButtonPressed());
  }

  void _onLogoutButtonPressed(BuildContext context) {
    BlocProvider.of<HomeBloc>(context).add(const HomeEventLogoutButtonPressed());
  }
}
