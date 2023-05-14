import 'package:animations/animations.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:school_program/app/modules/settings/controllers/settings_controller.dart';
import 'package:school_program/app/modules/settings/views/subject_changer.dart';
import 'package:school_program/app/modules/settings/views/theme_changer.dart';
import 'package:school_program/main_controller.dart';

class SettingsView extends GetView<SettingsController> {
  const SettingsView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var main = Get.find<MainController>();

    Get.put(SettingsController());
    return Scaffold(
      appBar: AppBar(
        title: const Text("Настройки"),
      ),
      body: GestureDetector(
        onPanDown: (details) => FocusScope.of(context).requestFocus(FocusNode()),
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisSize: MainAxisSize.max,
              children: [
                Align(
                  alignment: Alignment.centerLeft,
                  child: Text("Тъмен режим", style: Get.textTheme.titleLarge),
                ),
                radio(1, "Системен"),
                radio(2, "Бял"),
                radio(3, "Тъмен"),
                const Divider(),
                OpenContainer(
                  transitionType: ContainerTransitionType.fade,
                  transitionDuration: const Duration(milliseconds: 300),
                  openShape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                  openBuilder: (context, action) => ThemeChangerView(
                    controller: controller,
                    mainController: main,
                  ),
                  closedElevation: 0,
                  openElevation: 0,
                  closedShape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(25),
                  ),
                  openColor: Theme.of(context).colorScheme.background,
                  middleColor: Color.alphaBlend(
                    Theme.of(context).colorScheme.background,
                    Colors.transparent,
                  ),
                  closedColor: Colors.transparent,
                  closedBuilder: (context, action) => ElevatedButton.icon(
                    onPressed: () => action.call(),
                    icon: const Icon(Icons.change_circle),
                    label: const Text("Смени темата на приложението"),
                  ),
                ),
                OpenContainer(
                  transitionType: ContainerTransitionType.fade,
                  transitionDuration: const Duration(milliseconds: 300),
                  openShape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                  openBuilder: (context, action) => const SubjectChanger(),
                  closedElevation: 0,
                  openElevation: 0,
                  closedShape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(25),
                  ),
                  openColor: Theme.of(context).colorScheme.background,
                  middleColor: Color.alphaBlend(
                    Theme.of(context).colorScheme.background,
                    Colors.transparent,
                  ),
                  closedColor: Colors.transparent,
                  closedBuilder: (context, action) => ElevatedButton.icon(
                    onPressed: () => action.call(),
                    icon: const Icon(Icons.edit),
                    label: const Text("Промени часовете"),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget radio(int val, String titleVal) {
    return Obx(
      () => GestureDetector(
        onTap: () => controller.setThemeGroupValue = val,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(titleVal, style: Get.textTheme.titleMedium),
            Radio(
              value: val,
              groupValue: controller.themeGroupVal.value,
              onChanged: (value) {
                controller.setThemeGroupValue = value as int;
              },
            ),
          ],
        ),
      ),
    );
  }
}
