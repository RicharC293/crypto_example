import 'package:flutter/material.dart';

class Theme {
  // static const String blue = '3383EC';
  // static const String green = '34A855';
  // static const String yellow = 'FABC05';
  // static const String red = 'EC4235';
  // static const String white = 'FFFFFF';
  // static const String black = '505358';
  // static const String grey = 'C4C6Cd';
  // static const String grey2 = 'E5E5E5';
  static const Color primary = Color(0xFFF1BB1E);
  static const Color secondary = Color(0xFFFFFFFF);
  static const Color accent = Color(0xFFFEF5D8);
  static const Color error = Color(0xFFEC4235);
  static const Color background = Color(0xFF333333);
  static const Color text = Color(0xFFFFFFFF);
  static const Color text2 = Color(0xFF6F7682);
  static const Color text3 = Color(0xFFE5E5E5);
  static const Color transparent = Colors.transparent;

  static const String fontFamily = 'Roboto';

  ColorScheme _colorScheme() {
    return const ColorScheme(
      brightness: Brightness.light,
      primary: primary,
      onPrimary: background,
      secondary: primary,
      onSecondary: background,
      error: error,
      onError: background,
      background: background,
      onBackground: text,
      surface: background,
      onSurface: text,
      inverseSurface: text2,
    );
  }

  TextTheme _textTheme() {
    /// 2021 Material approach
    return const TextTheme(
      bodyLarge: TextStyle(
        fontFamily: fontFamily,
        color: text,
        fontWeight: FontWeight.w400,
        fontSize: 16,
        letterSpacing: 0,
      ),
      bodyMedium: TextStyle(
        fontFamily: fontFamily,
        color: text,
        fontWeight: FontWeight.w400,
        fontSize: 14,
        letterSpacing: 0,
      ),
      bodySmall: TextStyle(
        fontFamily: fontFamily,
        color: text,
        fontWeight: FontWeight.w400,
        fontSize: 12,
        letterSpacing: 0,
      ),
      displayLarge: TextStyle(
        fontFamily: fontFamily,
        color: text,
        fontWeight: FontWeight.w400,
        fontSize: 57,
        letterSpacing: 0,
      ),
      displayMedium: TextStyle(
        fontFamily: fontFamily,
        color: text,
        fontWeight: FontWeight.w400,
        fontSize: 45,
        letterSpacing: 0,
      ),
      displaySmall: TextStyle(
        fontFamily: fontFamily,
        color: text,
        fontWeight: FontWeight.w400,
        fontSize: 36,
        letterSpacing: 0,
      ),
      headlineLarge: TextStyle(
        fontFamily: fontFamily,
        color: text,
        fontWeight: FontWeight.w400,
        fontSize: 32,
        letterSpacing: 0,
      ),
      headlineMedium: TextStyle(
        fontFamily: fontFamily,
        color: text,
        fontWeight: FontWeight.w400,
        fontSize: 28,
        letterSpacing: 0,
      ),
      headlineSmall: TextStyle(
        fontFamily: fontFamily,
        color: text,
        fontWeight: FontWeight.w400,
        fontSize: 24,
        letterSpacing: 0,
      ),
      labelLarge: TextStyle(
        fontFamily: fontFamily,
        color: text,
        fontWeight: FontWeight.w500,
        fontSize: 14,
        letterSpacing: 0,
      ),
      labelMedium: TextStyle(
        fontFamily: fontFamily,
        color: text,
        fontWeight: FontWeight.w500,
        fontSize: 12,
        letterSpacing: 0,
      ),
      labelSmall: TextStyle(
        fontFamily: fontFamily,
        color: text,
        fontWeight: FontWeight.w500,
        fontSize: 11,
        letterSpacing: 0,
      ),
      titleLarge: TextStyle(
        fontFamily: fontFamily,
        color: text,
        fontWeight: FontWeight.w400,
        fontSize: 22,
        letterSpacing: 0,
      ),
      titleMedium: TextStyle(
        fontFamily: fontFamily,
        color: text,
        fontWeight: FontWeight.w500,
        fontSize: 16,
        letterSpacing: 0,
      ),
      titleSmall: TextStyle(
        fontFamily: fontFamily,
        color: text,
        fontWeight: FontWeight.w500,
        fontSize: 14,
        letterSpacing: 0,
      ),
    );
  }

  ThemeData light() {
    return ThemeData(
      fontFamily: fontFamily,
      brightness: Brightness.light,
      primaryColor: primary,
      colorScheme: _colorScheme(),
      splashColor: primary,
      cardColor: background,
      dividerColor: text3,
      scaffoldBackgroundColor: background,
      shadowColor: text2,
      canvasColor: background,
      textTheme: _textTheme(),
      inputDecorationTheme: InputDecorationTheme(
        floatingLabelBehavior: FloatingLabelBehavior.always,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: const BorderSide(color: text3),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: const BorderSide(color: primary),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: const BorderSide(color: text3),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: const BorderSide(color: error),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: const BorderSide(color: error),
        ),
        labelStyle: const TextStyle(
          color: text,
          fontSize: 14,
          fontWeight: FontWeight.w400,
        ),
        hintStyle: const TextStyle(
          color: text2,
          fontSize: 14,
          fontWeight: FontWeight.w400,
        ),
      ),
    );
  }
}