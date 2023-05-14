import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:school_program/themes.dart';

class MainController extends GetxController {
  final isDynamic = (GetStorage("settings").read<bool>("dynamic") ?? true).obs;
  set isDynamicValue(bool value) => isDynamic.value = value;

  final lightDynamicColorScheme =
      ColorScheme.fromSeed(seedColor: Colors.deepPurple).obs;
  set lightDynamicColorSchemeValue(ColorScheme value) =>
      lightDynamicColorScheme.value = value;

  final darkDynamicColorScheme = ColorScheme.fromSeed(
    seedColor: Colors.deepPurple,
    brightness: Brightness.dark,
  ).obs;

  set darkDynamicColorSchemeValue(ColorScheme value) =>
      darkDynamicColorScheme.value = value;

  final darkTheme = Themes.themeGen(
    ColorScheme.fromSeed(
      seedColor: Color(
        GetStorage("settings").read("color") ?? Colors.deepPurple.value,
      ),
      brightness: Brightness.dark,
    ),
  ).obs;
  set darkThemeValue(ThemeData value) => darkTheme.value = value;

  final lightTheme = Themes.themeGen(
    ColorScheme.fromSeed(
      seedColor: Color(
        GetStorage("settings").read("color") ?? Colors.deepPurple.value,
      ),
    ),
  ).obs;
  set lightThemeValue(ThemeData value) => lightTheme.value = value;
}
