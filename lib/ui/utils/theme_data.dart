import 'package:flutter/material.dart';

class MiztliThemes {
  static const Color white = Colors.white;
  static const Color darkPurple = Color(0xffa37097);
  static const Color purple = Color(0xffcdb4c7);
  static const Color black = Color(0xff000000);

  static final ThemeData miztliLightTheme = ThemeData(
    scaffoldBackgroundColor: const Color.fromARGB(255, 226, 227, 228),
    colorScheme: const ColorScheme(
      brightness: Brightness.light,
      primary: Colors.white,
      onPrimary: Colors.black,
      secondary: Colors.yellow,
      onSecondary: Color(0xFF853789),
      error: Colors.red,
      onError: Colors.black,
      background: Colors.white,
      onBackground: Colors.black,
      surface: Colors.blue,
      onSurface: Colors.black,
    ),
  );
  static final ThemeData miztliDarkTheme = ThemeData(
    scaffoldBackgroundColor: const Color.fromARGB(255, 38, 38, 39),
    colorScheme: const ColorScheme(
      brightness: Brightness.dark,
      primary: Colors.black,
      onPrimary: Colors.white,
      secondary: Colors.black,
      onSecondary: Color(0xFF853789),
      error: Colors.red,
      onError: Colors.black,
      background: Colors.black,
      onBackground: Colors.white,
      surface: Colors.blue,
      onSurface: Colors.black,
    ),
  );
}
