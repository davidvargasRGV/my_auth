import 'package:flutter/material.dart';

abstract class AppTheme {
  static final lightTheme = ThemeData.light().copyWith(
    textTheme: AppTextTheme.lightTheme,
  );
}

abstract class AppTextTheme {
  static const lightTheme = TextTheme(
    bodyText1: TextStyle(
      color: Colors.black,
      fontSize: 18.0,
      fontWeight: FontWeight.bold,
    ),
    button: TextStyle(
      color: Colors.white,
      fontSize: 18.0,
      fontWeight: FontWeight.bold,
    )
  );
}
