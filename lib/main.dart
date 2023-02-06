import 'package:dynamic_color/dynamic_color.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:get/get.dart';
import 'package:school_program/app/modules/home/views/home_view.dart';
import 'package:school_program/main_controller.dart';
import 'package:school_program/themes.dart';

void main() {
  WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();

  // widgetsBinding.renderView.automaticSystemUiAdjustment = false;

  SystemChrome.setEnabledSystemUIMode(SystemUiMode.edgeToEdge);
  SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
    statusBarColor: Colors.transparent,
    systemNavigationBarColor: Colors.transparent,
    systemNavigationBarDividerColor: Colors.transparent,
  ));

  FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);

  runApp(const MyApp());

  FlutterNativeSplash.remove();
}

class MyApp extends GetView<MainController> {
  const MyApp({Key? key}) : super(key: key);

  static final _defaultLightColorScheme = ColorScheme.fromSeed(
    seedColor: Colors.deepPurple,
    brightness: Brightness.light,
  );

  static final _defaultDarkColorScheme = ColorScheme.fromSeed(
    seedColor: Colors.deepPurple,
    brightness: Brightness.dark,
  );

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    Get.put(MainController());

    return DynamicColorBuilder(
      builder: (lightDynamic, darkDynamic) {
        return Obx(
          () {
            if (controller.isDynamic.value) {
              controller.lightDynamicColorSchemeValue =
                  lightDynamic ?? _defaultLightColorScheme;

              controller.darkDynamicColorSchemeValue =
                  darkDynamic ?? _defaultDarkColorScheme;

              controller.lightThemeValue =
                  Themes.themeGen(lightDynamic ?? _defaultLightColorScheme);

              controller.darkThemeValue = Themes.themeGen(
                darkDynamic ?? _defaultDarkColorScheme,
                darkMode: true,
              );
            }

            return GetMaterialApp(
              title: 'School Program',
              debugShowCheckedModeBanner: false,
              theme: controller.lightTheme.value,
              darkTheme: controller.darkTheme.value,
              home: const HomeView(),
              scrollBehavior: CupertinoScrollBehavior(),
              defaultTransition: Transition.native,
              themeMode: ThemeMode.system,
            );
          },
        );
      },
    );
  }
}
