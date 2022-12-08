import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:school_program/main_controller.dart';
import 'package:school_program/pages/settings/components/custom_color.dart';
import 'package:school_program/pages/settings/controllers/settings_controller.dart';
import 'package:school_program/themes.dart';

class SettingsPage extends GetView<SettingsController> {
  const SettingsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var main = Get.find<MainController>();

    Get.put(SettingsController());
    return Scaffold(
      appBar: AppBar(
        title: const Text("Настройки"),
      ),
      body: GestureDetector(
        onPanDown: (details) =>
            FocusScope.of(context).requestFocus(FocusNode()),
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisSize: MainAxisSize.max,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("Тъмен режим", style: Get.textTheme.titleLarge),
                    Obx(
                      () => Switch(
                        value: controller.darkMode.value,
                        onChanged: (value) => controller.changeDarkMode(value),
                      ),
                    ),
                  ],
                ),
                const Divider(),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("Стил на скрола", style: Get.textTheme.titleLarge),
                    DropdownMenu(
                      enableFilter: false,
                      enableSearch: false,
                      enabled: true,
                      initialSelection: controller.scroll.value,
                      dropdownMenuEntries: [
                        DropdownMenuEntry(
                          value: "cupertino",
                          label: "Cupertino",
                        ),
                        DropdownMenuEntry(
                          value: "material",
                          label: "Material",
                        ),
                      ],
                      onSelected: (String? value) =>
                          controller.changeScrollBehavior(value),
                    ),
                  ],
                ),
                const Divider(),
                Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    "Цвят на приложението",
                    style: Theme.of(context).textTheme.titleLarge,
                  ),
                ),
                Wrap(
                  alignment: WrapAlignment.spaceEvenly,
                  children: [
                    custom_color(
                      controller: controller,
                      color: Colors.blueGrey,
                      main: main,
                    ),
                    for (var color in Colors.primaries.reversed.skip(1))
                      custom_color(
                        controller: controller,
                        color: color,
                        main: main,
                      ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
