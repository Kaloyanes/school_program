import 'package:animations/animations.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:school_program/app/modules/home/controllers/home_controller.dart';
import 'package:school_program/app/modules/program/views/program_view.dart';
import 'package:school_program/app/modules/homework/views/homework_view.dart';
import 'package:school_program/app/modules/settings/views/settings.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.lazyPut(() => HomeController());
    if (MediaQuery.of(context).size.width < 600) {
      SystemChrome.setPreferredOrientations([
        DeviceOrientation.portraitUp,
      ]);
    }

    var pages = <Widget>[
      ProgramView(),
      const HomeworkView(),
      const Scaffold(),
      const SettingsView()
    ];

    return Scaffold(
      body: Obx(
        () => PageTransitionSwitcher(
          transitionBuilder: (child, primaryAnimation, secondaryAnimation) {
            return FadeThroughTransition(
              fillColor: Theme.of(context).scaffoldBackgroundColor,
              animation: primaryAnimation,
              secondaryAnimation: secondaryAnimation,
              child: child,
            );
          },
          child: pages[controller.selectedIndex.value],
        ),
      ),
      // bottomNavigationBar: Obx(
      //   () => NavigationBar(
      //     selectedIndex: controller.selectedIndex.value,
      //     onDestinationSelected: (value) =>
      //         controller.onDestinationSelected(value),
      //     animationDuration: const Duration(milliseconds: 600),
      //     destinations: const [
      //       NavigationDestination(
      //         icon: Icon(Icons.school_outlined),
      //         selectedIcon: Icon(Icons.school),
      //         label: 'Програма',
      //       ),
      //       NavigationDestination(
      //         icon: Icon(Icons.home_work_outlined),
      //         selectedIcon: Icon(Icons.home_work),
      //         label: 'Домашни',
      //       ),
      //       NavigationDestination(
      //         icon: Icon(Icons.quiz_outlined),
      //         selectedIcon: Icon(Icons.quiz),
      //         label: 'Тестове',
      //       ),
      //       NavigationDestination(
      //         icon: Icon(Icons.settings_outlined),
      //         selectedIcon: Icon(Icons.settings),
      //         label: 'Настройки',
      //       ),
      //     ],
      //   ),
      // ),
    );
  }
}
