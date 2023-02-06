import 'package:flutter/material.dart';
import 'package:school_program/app/modules/settings/components/custom_color.dart';
import 'package:school_program/app/modules/settings/controllers/settings_controller.dart';
import 'package:school_program/main_controller.dart';

class ThemeChangerView extends StatelessWidget {
  const ThemeChangerView({
    Key? key,
    required this.controller,
    required this.mainController,
  }) : super(key: key);

  final SettingsController controller;
  final MainController mainController;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Тема"),
      ),
      body: Hero(
        tag: "theme",
        child: GridView.builder(
          itemCount: Colors.primaries.length,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 3,
            // childAspectRatio: 1,
            mainAxisSpacing: 10,
          ),
          itemBuilder: (context, index) {
            return SizedBox(
              width: 100,
              height: 100,
              child: CustomColor(
                controller: controller,
                color: Colors.primaries.reversed.elementAt(index),
                mainController: mainController,
              ),
            );
          },
        ),
      ),
    );
  }
}
