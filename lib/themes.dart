import 'package:flutter/material.dart';

class Themes {
  static ThemeData light(ColorScheme colorScheme) {
    return ThemeData(
      brightness: Brightness.light,
      useMaterial3: true,
      colorScheme: colorScheme,
      scaffoldBackgroundColor: colorScheme.background,
      splashColor: Colors.transparent,
      highlightColor: Colors.transparent,
    );
  }

  static ThemeData dark(ColorScheme colorScheme) {
    return ThemeData(
      brightness: Brightness.dark,
      useMaterial3: true,
      colorScheme: colorScheme,
      scaffoldBackgroundColor: colorScheme.background,
      splashFactory: InkRipple.splashFactory,
      splashColor: Colors.transparent,
      // highlightColor: Colors.transparent,
    );
  }
}
