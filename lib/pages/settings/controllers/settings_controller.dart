import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:school_program/main_controller.dart';
import 'package:school_program/themes.dart';

class SettingsController extends GetxController {
  SettingsController();

  @override
  void onInit() {
    // TODO: load settings from file
    super.onInit();
  }

  var scroll = "Cupertino".obs;

  var mainController = Get.find<MainController>();

  final darkMode = (Get.isPlatformDarkMode).obs;
  set darkModeValue(bool value) => darkMode.value = value;

  void changeTheme(MaterialColor color) {
    HapticFeedback.mediumImpact();

    if (color == Colors.blueGrey) {
      mainController.isDynamicValue = true;
      return;
    }

    mainController.isDynamicValue = false;
    var colorScheme = ColorScheme.fromSeed(seedColor: color);
    var colorSchemeDark =
        ColorScheme.fromSeed(seedColor: color, brightness: Brightness.dark);

    mainController.lightTheme.value = Themes.themeGen(colorScheme);
    mainController.darkTheme.value = Themes.themeGen(colorSchemeDark);
  }

  changeDarkMode(bool value) {
    HapticFeedback.mediumImpact();

    darkModeValue = value;
    Get.changeThemeMode(value ? ThemeMode.dark : ThemeMode.light);
    return;
  }

  void changeScrollBehavior(String? type) {
    if (type == null) return;

    print("type: $type");

    ScrollBehavior scrollBehavior = const CupertinoScrollBehavior();
    switch (type) {
      case "cupertino":
        scrollBehavior = const CupertinoScrollBehavior();
        scroll.value = "cupertino";
        break;
      case "material":
        scrollBehavior = const MaterialScrollBehavior();
        scroll.value = "material";
        break;
    }

    HapticFeedback.mediumImpact();
    mainController.scrollBehaviorValue = scrollBehavior;
  }
}
