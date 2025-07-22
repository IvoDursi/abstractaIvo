import 'package:flutter/material.dart';

class AppStyles {
  AppStyles._();

  static const String fontFamily = 'Poppins';

  static TextStyle _defaultStyle(
    FontWeight fontWeight,
    double size, [
    Color? color,
  ]) {
    return TextStyle(
      fontSize: size,
      fontWeight: fontWeight,
      color: color ?? Colors.black,
      fontFamily: fontFamily,
    );
  }

  static const primaryBlue = Color(0xFF00509E);
  static const secondaryYellow = Color(0xFFF9BA2E);
  static const backgroundLight = Color(0xFFE9F3FE);
  static const accentTeal = Color(0xFF0C9396);
  static const textBlack = Color(0xFF000000);

  static final ThemeData appTheme = ThemeData(
    brightness: Brightness.light,
    primaryColor: primaryBlue,
    splashColor: Colors.lightBlue.withOpacity(0.1),
    splashFactory: InkRipple.splashFactory,
    highlightColor: Colors.transparent,
    scaffoldBackgroundColor: backgroundLight,
    fontFamily: 'Roboto',
    progressIndicatorTheme: const ProgressIndicatorThemeData(
      color: backgroundLight,
    ),
    colorScheme: ColorScheme.fromSeed(
      seedColor: primaryBlue,
      primary: primaryBlue,
      secondary: secondaryYellow,
      onPrimary: Colors.white,
      onSecondary: Colors.black,
    ),
    appBarTheme: const AppBarTheme(
      backgroundColor: primaryBlue,
      titleTextStyle: TextStyle(
        color: backgroundLight,
        fontSize: 22,
      ),
      iconTheme: IconThemeData(
        color: backgroundLight,
      ),
    ),
    primaryIconTheme: const IconThemeData(color: backgroundLight),
    iconTheme: const IconThemeData(color: backgroundLight),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: primaryBlue,
        foregroundColor: Colors.white,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
        ),
      ),
    ),
    textTheme: const TextTheme(
      bodyLarge: TextStyle(color: Colors.black),
      bodyMedium: TextStyle(color: Colors.black),
    ),
    inputDecorationTheme: InputDecorationTheme(
      border: OutlineInputBorder(borderRadius: BorderRadius.circular(8)),
      labelStyle: const TextStyle(color: Colors.black87),
      fillColor: Colors.grey.shade100,
    ),
  );

  static final ThemeData appDarkTheme = ThemeData(
    brightness: Brightness.dark,
    primaryColor: primaryBlue,
    scaffoldBackgroundColor: Colors.black,
    splashColor: Colors.white10,
    splashFactory: InkRipple.splashFactory,
    highlightColor: Colors.transparent,
    fontFamily: 'Roboto',
    progressIndicatorTheme: const ProgressIndicatorThemeData(
      color: Colors.white,
    ),
    colorScheme: ColorScheme.fromSeed(
      seedColor: primaryBlue,
      brightness: Brightness.dark,
      primary: primaryBlue,
      secondary: secondaryYellow,
      onPrimary: Colors.black,
      onSecondary: Colors.white,
    ),
    appBarTheme: const AppBarTheme(
      backgroundColor: Color(0xFF121212),
      titleTextStyle: TextStyle(
        color: Colors.white,
        fontSize: 22,
      ),
      iconTheme: IconThemeData(
        color: Colors.white,
      ),
    ),
    primaryIconTheme: const IconThemeData(color: Colors.white),
    iconTheme: const IconThemeData(color: Colors.white),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: primaryBlue,
        foregroundColor: Colors.white,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
        ),
      ),
    ),
    textTheme: const TextTheme(
      bodyLarge: TextStyle(color: Colors.white),
      bodyMedium: TextStyle(color: Colors.white70),
    ),
    inputDecorationTheme: InputDecorationTheme(
      border: OutlineInputBorder(borderRadius: BorderRadius.circular(8)),
      labelStyle: const TextStyle(color: Colors.white70),
      fillColor: Colors.transparent,
    ),
  );

  static TextStyle w400(double size, [Color? color]) {
    return _defaultStyle(FontWeight.w400, size, color);
  }

  static TextStyle w500(double size, [Color? color]) {
    return _defaultStyle(FontWeight.w500, size, color);
  }

  static TextStyle w600(double size, [Color? color]) {
    return _defaultStyle(FontWeight.w600, size, color);
  }

  static TextStyle w700(double size, [Color? color]) {
    return _defaultStyle(FontWeight.w700, size, color);
  }

  static TextStyle w800(double size, [Color? color]) {
    return _defaultStyle(FontWeight.w800, size, color);
  }

  static TextStyle w900(double size, [Color? color]) {
    return _defaultStyle(FontWeight.w900, size, color);
  }
}
