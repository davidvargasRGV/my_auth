import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../core/bloc/authentication/authentication_bloc.dart';
import 'bloc/login_bloc.dart';
import 'views/locked_view.dart';
import 'views/login_view.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<LoginBloc>(create: (context) => LoginBloc(),)
      ],
      child: BlocBuilder<AuthenticationBloc, AuthenticationState>(
        builder: (context, state) {
          if (state is AuthenticationStateAuthenticatedLocked) {
            return const LockedView();
          }

          return const LoginView();
        },
      ),
    );
  }
}
