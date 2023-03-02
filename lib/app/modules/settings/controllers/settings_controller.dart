import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:school_program/main_controller.dart';
import 'package:school_program/themes.dart';

class SettingsController extends GetxController {
  SettingsController();

  var mainController = Get.find<MainController>();

  final themeGroupVal = (GetStorage("settings").read<int>("theme") ?? 1).obs;
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

    GetStorage("settings").write("theme", value);
  }

  void changeTheme(MaterialColor color) {
    HapticFeedback.mediumImpact();

    if (color == Colors.blueGrey) {
      mainController.isDynamicValue = true;
      GetStorage("settings").write("dynamic", true);
      return;
    }

    mainController.isDynamicValue = false;

    mainController.lightTheme.value = Themes.themeGen(
      ColorScheme.fromSeed(
        seedColor: color,
      ),
    );

    mainController.darkTheme.value = Themes.themeGen(
      ColorScheme.fromSeed(
        seedColor: color,
        brightness: Brightness.dark,
      ),
    );
    GetStorage("settings").write("dynamic", false);
    GetStorage("settings").write("color", color.value);
  }
}
