import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../pages/login/login_page.dart';
import '../bloc/authentication/authentication_bloc.dart';
import '../navigator/navigator.dart';

class CoreAuthenticator extends StatelessWidget {
  const CoreAuthenticator({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AuthenticationBloc, AuthenticationState>(
      builder: (context, state) {
        if (state is AuthenticationStateAuthenticatedUnlocked) {
          return const CoreNavigator();
        }

        return const LoginPage();
      },
    );
  }
}
