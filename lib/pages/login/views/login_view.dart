import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../../core/bloc/authentication/authentication_bloc.dart';
import '../../../shared/dialogs/error_dialog.dart';
import '../bloc/login_bloc.dart';

class LoginView extends StatefulWidget {
  const LoginView({super.key});

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
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
                child: Text('Login to your account', style: Theme.of(context).textTheme.bodyText1,),
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
                  onPressed: () => _onLoginButtonPressed(context),
                  child: Text('Login', style: Theme.of(context).textTheme.button,),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _loginBlocListener(BuildContext context, LoginState state) async {
    if (state is LoginStateLoading) {
      _showLoadingDialog(context);
    }

    if (state is LoginStateLoaded) {
      _hideLoadingDialog(context);
    }

    if (state is LoginStateSuccess) {
      BlocProvider.of<AuthenticationBloc>(context).add(const AuthenticationEventSetAuthenticatedUnlocked());
    }

    if (state is LoginStateFailure) {
      await _showErrorDialog(context, state.errorCode);
    }
  }

  void _onLoginButtonPressed(BuildContext context) {
    BlocProvider.of<LoginBloc>(context).add(const LoginEventLoginButtonPressed());
  }

  void _showLoadingDialog(BuildContext context) {
    final dialog = AlertDialog(
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const CircularProgressIndicator(),
          const SizedBox(height: 10.0),
          Text('Loading...', style: Theme.of(context).textTheme.bodyText1,),
        ],
      ),
    );

    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) => dialog,
    );
  }

  void _hideLoadingDialog(BuildContext context) {
    Navigator.of(context).maybePop();
  }

  Future<void> _showErrorDialog(BuildContext context, int errorCode) async {
    String message = 'Default failure message';

    switch (errorCode) {
      case 500:
        message = 'Something went wrong';
        break;
      default:
        message = 'Default failure message';
        break;
    }

    return showErrorDialog(context: context, message: message);
  }
}