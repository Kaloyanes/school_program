import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:school_program/app/modules/settings/controllers/settings_controller.dart';
import 'package:school_program/main_controller.dart';
import 'package:school_program/themes.dart';

class CustomColor extends StatefulWidget {
  const CustomColor({
    Key? key,
    required this.controller,
    required this.color,
    required this.mainController,
  }) : super(key: key);

  final SettingsController controller;
  final MaterialColor color;
  final MainController mainController;

  @override
  State<CustomColor> createState() => _CustomColorState();
}

class _CustomColorState extends State<CustomColor> {
  double radius = 100;

  double get width => 120;
  double get height => 60;

  ColorScheme colorScheme = ColorScheme.fromSeed(seedColor: Colors.teal);

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
              if (Get.isDarkMode) {
                colorScheme =
                    widget.mainController.darkDynamicColorScheme.value;
              } else {
                colorScheme =
                    widget.mainController.lightDynamicColorScheme.value;
              }
            }

            return Stack(
              children: [
                Container(
                  decoration: BoxDecoration(
                    color: colorScheme.inversePrimary,
                    borderRadius: BorderRadius.circular(radius),
                  ),
                ),
                Align(
                  alignment: Alignment.bottomCenter,
                  child: SizedBox(
                    height: height,
                    width: width,
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Expanded(
                          child: Container(
                            decoration: BoxDecoration(
                              color: colorScheme.primaryContainer,
                              borderRadius: BorderRadius.only(
                                bottomLeft: Radius.circular(radius),
                              ),
                            ),
                          ),
                        ),
                        Expanded(
                          child: Container(
                            decoration: BoxDecoration(
                              color: colorScheme.secondaryContainer,
                              borderRadius: BorderRadius.only(
                                bottomRight: Radius.circular(radius),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                if (widget.mainController.isDynamic.value &&
                        widget.color == Colors.blueGrey ||
                    widget.mainController.lightTheme.value ==
                        Themes.themeGen(colorScheme) ||
                    widget.mainController.darkTheme.value ==
                        Themes.themeGen(colorScheme))
                  const Align(
                    alignment: Alignment.center,
                    child: Icon(
                      Icons.check,
                      size: 50,
                    ),
                  ),
              ],
            );
          },
        ),
      ),
    );
  }
}
