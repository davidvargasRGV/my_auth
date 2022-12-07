import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../services/locator.dart';

import '../../theme/theme.dart';
import '../authenticator/authenticator.dart';
import '../bloc/authentication/authentication_bloc.dart';
import '../bloc/navigation/navigation_bloc.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => locator.get<AuthenticationBloc>()),
        BlocProvider(create: (context) => locator.get<NavigationBloc>()),
      ],
      child: GestureDetector(
        excludeFromSemantics: true,
        onTap: () => _onTap(context),
        child: MaterialApp(
          theme: AppTheme.lightTheme,
          home: const CoreAuthenticator(),
        ),
      ),
    );
  }

  void _onTap(BuildContext context) {
    final FocusScopeNode currentFocus = FocusScope.of(context);

    if (!currentFocus.hasPrimaryFocus) {
      FocusManager.instance.primaryFocus?.unfocus();
    }
  }
}
