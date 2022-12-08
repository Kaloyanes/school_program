import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:school_program/main_controller.dart';

class Themes {
  static ThemeData themeGen(ColorScheme colorScheme, {bool darkMode = false}) {
    return ThemeData(
      useMaterial3: true,
      colorScheme: colorScheme,
      scaffoldBackgroundColor: colorScheme.background,
      splashFactory: InkRipple.splashFactory,
      splashColor: Colors.transparent,

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
    );
  }

  // static ThemeData dark(ColorScheme colorScheme) {
  //   return ThemeData(
  //     useMaterial3: true,
  //     colorScheme: colorScheme.copyWith(brightness: Brightness.dark),
  //     scaffoldBackgroundColor: colorScheme.background,
  //     splashFactory: InkRipple.splashFactory,
  //     splashColor: Colors.transparent,

  //     // APP BAR
  //     appBarTheme: const AppBarTheme(
  //       centerTitle: true,
  //       elevation: 0,
  //       shape: RoundedRectangleBorder(
  //         borderRadius: BorderRadius.vertical(
  //           bottom: Radius.circular(0),
  //         ),
  //       ),
  //     ),
  //     inputDecorationTheme: InputDecorationTheme(
  //       alignLabelWithHint: true,
  //       border: OutlineInputBorder(
  //         borderRadius: BorderRadius.circular(15),
  //         borderSide: BorderSide(
  //           color: colorScheme.onBackground,
  //         ),
  //       ),
  //       focusedBorder: OutlineInputBorder(
  //         borderRadius: BorderRadius.circular(20),
  //         borderSide: BorderSide(
  //           color: colorScheme.primary,
  //           width: 3,
  //         ),
  //       ),
  //     ),
  //   );
  // }
}
