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

  var mainController = Get.find<MainController>();

  final themeGroupVal = 1.obs;
  set setThemeGroupValue(int value) {
    themeGroupVal.value = value;
    switch (value) {
      case 1:
        Get.changeThemeMode(ThemeMode.system);
        break;
      case 2:
        Get.changeThemeMode(ThemeMode.light);
        break;
      case 3:
        Get.changeThemeMode(ThemeMode.dark);
        break;
    }
  }

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
}
