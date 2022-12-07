import 'dart:async';

import 'package:flutter/material.dart';

import 'services/locator.dart';
import 'core/app/app.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await registerServices();

  runApp(const App());
}
