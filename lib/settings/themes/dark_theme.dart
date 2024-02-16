import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

ThemeData darkTheme = ThemeData(
    colorScheme: const ColorScheme.dark(primary: Colors.black),
    useMaterial3: true,
    navigationBarTheme: const NavigationBarThemeData(
        backgroundColor: Colors.black,
        labelTextStyle:
            MaterialStatePropertyAll(TextStyle(color: Colors.black))),
    appBarTheme: AppBarTheme(
        elevation: 0,
        iconTheme: const IconThemeData(color: Colors.white),
        backgroundColor: Colors.black.withOpacity(0.54),
        titleTextStyle: const TextStyle(color: Colors.white)),
    scaffoldBackgroundColor: Colors.black,
    listTileTheme: const ListTileThemeData(
        subtitleTextStyle: TextStyle(color: Colors.white),
        textColor: Colors.white,
        iconColor: Colors.white,
        titleTextStyle: TextStyle(color: Colors.white),
        tileColor: Colors.black),
    iconTheme: const IconThemeData(color: Colors.white),
    sliderTheme: SliderThemeData(
        thumbShape: SliderComponentShape.noThumb,
        activeTrackColor: Colors.white,
        inactiveTrackColor: Colors.grey.shade700),
    textTheme: GoogleFonts.montserratTextTheme(const TextTheme(
        headlineLarge: TextStyle(color: Colors.white),
        headlineMedium: TextStyle(color: Colors.white),
        headlineSmall: TextStyle(color: Colors.white),
        titleLarge: TextStyle(color: Colors.white),
        titleMedium: TextStyle(color: Colors.white),
        titleSmall: TextStyle(color: Colors.white),
        bodyLarge: TextStyle(color: Colors.white),
        bodyMedium: TextStyle(color: Colors.white),
        bodySmall: TextStyle(color: Colors.white),
        displaySmall: TextStyle(color: Colors.white),
        displayLarge: TextStyle(color: Colors.white),
        labelLarge: TextStyle(color: Colors.white),
        labelMedium: TextStyle(color: Colors.white),
        labelSmall: TextStyle(color: Colors.white),
        displayMedium: TextStyle(color: Colors.white))));
