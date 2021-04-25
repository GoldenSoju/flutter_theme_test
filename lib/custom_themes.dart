import 'package:flutter/material.dart';

abstract class CustomThemes {
  static final List<ThemeData> availableSwatchThemes = [
    _blueTheme,
    _greenTheme,
    _redTheme,
    _yellowTheme,
  ];

  static final List<ThemeData> availableThemes = [
    lightStandardTheme,
    darkStandardTheme,
    lightExtraTheme,
    darkExtraTheme,
  ];

  static final _blueTheme = ThemeData(primarySwatch: Colors.blue);
  static final _greenTheme = ThemeData(primarySwatch: Colors.green);
  static final _redTheme = ThemeData(primarySwatch: Colors.red);
  static final _yellowTheme = ThemeData(primarySwatch: Colors.yellow);

  static final ThemeData lightStandardTheme = ThemeData(
    colorScheme: ColorScheme(
        background: Colors.white,
        onBackground: Colors.black,
        surface: Colors.lightBlueAccent,
        onSurface: Colors.white,
        primary: Colors.blue,
        primaryVariant: Colors.blueAccent,
        onPrimary: Colors.white,
        secondary: Colors.cyanAccent,
        secondaryVariant: Colors.cyan,
        onSecondary: Colors.white,
        error: Colors.red,
        onError: Colors.white,
        brightness: Brightness.light),
  );

  static final ThemeData darkStandardTheme = ThemeData(
    colorScheme: ColorScheme(
        background: Colors.black,
        onBackground: Colors.white,
        surface: Colors.blueAccent,
        onSurface: Colors.white,
        primary: Colors.blueGrey,
        primaryVariant: Color(0xFF253034),
        onPrimary: Colors.white,
        secondary: Color(0xFF002B7F),
        secondaryVariant: Color(0xFF001440),
        onSecondary: Colors.white,
        error: Color(0xFF500000),
        onError: Colors.white,
        brightness: Brightness.dark),
  );

  static final ThemeData lightExtraTheme = ThemeData(
    colorScheme: ColorScheme(
        background: Colors.yellow,
        onBackground: Colors.black,
        surface: Colors.greenAccent,
        onSurface: Colors.black,
        primary: Colors.yellowAccent,
        primaryVariant: Color(0xFFDEAA00),
        onPrimary: Colors.black,
        secondary: Colors.lightGreenAccent,
        secondaryVariant: Colors.lightGreen,
        onSecondary: Colors.black,
        error: Colors.red,
        onError: Colors.white,
        brightness: Brightness.light),
  );

  static final ThemeData darkExtraTheme = ThemeData(
    colorScheme: ColorScheme(
        background: Colors.deepPurple,
        onBackground: Colors.white,
        surface: Colors.purple,
        onSurface: Colors.white,
        primary: Colors.deepPurpleAccent,
        primaryVariant: Color(0xFF300082),
        onPrimary: Colors.white,
        secondary: Colors.purpleAccent,
        secondaryVariant: Color(0xFF570066),
        onSecondary: Colors.white,
        error: Color(0xFF500000),
        onError: Colors.white,
        brightness: Brightness.dark),
  );
}
