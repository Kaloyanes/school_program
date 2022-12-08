import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:school_program/main_controller.dart';
import 'package:school_program/pages/settings/controllers/settings_controller.dart';
import 'package:school_program/themes.dart';

class custom_color extends StatefulWidget {
  custom_color({
    Key? key,
    required this.controller,
    required this.color,
    required this.main,
  }) : super(key: key);

  final SettingsController controller;
  final MaterialColor color;
  final MainController main;

  @override
  State<custom_color> createState() => _custom_colorState();
}

class _custom_colorState extends State<custom_color> {
  double radius = 50;

  ColorScheme colorScheme = ColorScheme.fromSeed(seedColor: Colors.teal);

  @override
  void initState() {
    super.initState();
    if (widget.color == Colors.blueGrey) {
      print("ColorScheme dynamic");
      if (Get.isDarkMode) {
        colorScheme = widget.main.darkDynamicColorScheme.value;
      } else {
        colorScheme = widget.main.lightDynamicColorScheme.value;
      }
      return;
    }
  }

  @override
  Widget build(BuildContext context) {
    colorScheme = ColorScheme.fromSeed(
        seedColor: widget.color,
        brightness: Get.isDarkMode ? Brightness.dark : Brightness.light);
    return Padding(
      padding: const EdgeInsets.all(5.0),
      child: GestureDetector(
        onTap: () => widget.controller.changeTheme(widget.color),
        child: Obx(
          () {
            if (widget.color == Colors.blueGrey) {
              print("ColorScheme dynamic");
              if (Get.isDarkMode) {
                colorScheme = widget.main.darkDynamicColorScheme.value;
              } else {
                colorScheme = widget.main.lightDynamicColorScheme.value;
              }
            }

            return Container(
              width: 100,
              height: 100,
              decoration: BoxDecoration(
                color: colorScheme.inversePrimary,
                borderRadius: BorderRadius.circular(radius),
              ),
              child: Stack(
                children: [
                  Align(
                    alignment: Alignment.bottomCenter,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Container(
                          width: 50,
                          height: 50,
                          decoration: BoxDecoration(
                            color: colorScheme.primaryContainer,
                            borderRadius: BorderRadius.only(
                              bottomLeft: Radius.circular(radius),
                            ),
                          ),
                        ),
                        Container(
                          width: 50,
                          height: 50,
                          decoration: BoxDecoration(
                            color: colorScheme.secondaryContainer,
                            borderRadius: BorderRadius.only(
                              bottomRight: Radius.circular(radius),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  if (widget.main.isDynamic.value &&
                          widget.color == Colors.blueGrey ||
                      widget.main.lightTheme.value ==
                          Themes.themeGen(colorScheme) ||
                      widget.main.darkTheme.value ==
                          Themes.themeGen(colorScheme))
                    const Align(
                      alignment: Alignment.center,
                      child: Icon(
                        Icons.check,
                        size: 50,
                      ),
                    ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
