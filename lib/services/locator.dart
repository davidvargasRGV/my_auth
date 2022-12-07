import 'package:get_it/get_it.dart';

import '../core/bloc/authentication/authentication_bloc.dart';
import '../core/bloc/navigation/navigation_bloc.dart';

GetIt locator = GetIt.instance;

Future<void> registerServices() async {
  locator.registerLazySingleton(() => AuthenticationBloc());
  locator.registerLazySingleton(() => NavigationBloc());
}
