import 'package:flutter/material.dart';

ThemeData getDarkTheme(BuildContext ctx) {
  return ThemeData(
      appBarTheme: const AppBarTheme(
          iconTheme: IconThemeData(color: Colors.white),
          backgroundColor: Colors.black,
          titleTextStyle: TextStyle(color: Colors.white)),
      scaffoldBackgroundColor: Colors.black,
      iconTheme: const IconThemeData(color: Colors.white),
      textTheme: const TextTheme(
        titleLarge: TextStyle(color: Colors.white),
        titleMedium: TextStyle(color: Colors.white),
        titleSmall: TextStyle(color: Colors.white),
        displayLarge: TextStyle(color: Colors.white),
        bodyMedium: TextStyle(color: Colors.white),
      ));
}
