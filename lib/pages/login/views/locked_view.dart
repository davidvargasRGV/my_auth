import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../../core/bloc/authentication/authentication_bloc.dart';
// import '../../../shared/dialogs/error_dialog.dart';
import '../bloc/login_bloc.dart';

class LockedView extends StatelessWidget {
  const LockedView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<LoginBloc, LoginState>(
      listener: _loginBlocListener,
      child: Scaffold(
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
                child: Align(
                  alignment: Alignment.center,
                  child: FaIcon(FontAwesomeIcons.circleUser, size: 90.0,)
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
                child: Text('Unlock your account', style: Theme.of(context).textTheme.bodyText1,),
              ),
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
                child: TextField(
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                  ),
                ),
              ),
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
                child: TextField(
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
                child: ElevatedButton(
                  onPressed: () => _onUnlockButtonPressed(context),
                  child: const Text('Unlock'),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
                child: TextButton(
                  onPressed: () => _onLogoutButtonPressed(context),
                  child: const Text('Logout'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _loginBlocListener(BuildContext context, LoginState state) async {
    if (state is LoginStateSuccess) {
      BlocProvider.of<AuthenticationBloc>(context).add(const AuthenticationEventSetAuthenticatedUnlocked());
    }

    if (state is LoginStateFailure) {
      // show error dialog
    }

    if (state is LoginStateLogout) {
      BlocProvider.of<AuthenticationBloc>(context).add(const AuthenticationEventSetUnauthenticated());
    }
  }

  void _onUnlockButtonPressed(BuildContext context) {
    BlocProvider.of<LoginBloc>(context).add(const LoginEventUnlockButtonPressed());
  }

  void _onLogoutButtonPressed(BuildContext context) {
    BlocProvider.of<LoginBloc>(context).add(const LoginEventLogoutButtonPressed());
  }
}
