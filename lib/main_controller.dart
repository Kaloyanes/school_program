import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:school_program/themes.dart';

class MainController extends GetxController {
  final isDynamic = true.obs;
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

  final darkTheme = Themes.themeGen(ColorScheme.fromSeed(
    seedColor: Colors.deepPurple,
    brightness: Brightness.dark,
  )).obs;
  set darkThemeValue(ThemeData value) => darkTheme.value = value;

  final lightTheme =
      Themes.themeGen(ColorScheme.fromSeed(seedColor: Colors.deepPurple)).obs;
  set lightThemeValue(ThemeData value) => lightTheme.value = value;

  final Rx<ScrollBehavior> scrollBehavior = const ScrollBehavior().obs;
  set scrollBehaviorValue(ScrollBehavior value) => scrollBehavior.value = value;
}
