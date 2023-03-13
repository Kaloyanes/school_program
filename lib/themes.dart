import 'package:flutter/material.dart';

class Themes {
  static ThemeData themeGen(ColorScheme colorScheme, {bool darkMode = false}) {
    return ThemeData(
      useMaterial3: true,
      colorScheme: colorScheme,
      textTheme: const TextTheme(),

      // APP BAR
      appBarTheme: const AppBarTheme(
        centerTitle: true,
        elevation: 0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(
            bottom: Radius.circular(0),
          ),
        ),
      ),
      inputDecorationTheme: InputDecorationTheme(
        alignLabelWithHint: true,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15),
          borderSide: BorderSide(
            color: colorScheme.onBackground,
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20),
          borderSide: BorderSide(
            color: colorScheme.primary,
            width: 3,
          ),
        ),
      ),
      floatingActionButtonTheme: FloatingActionButtonThemeData(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(50),
        ),
      ),
    );
  }
}
