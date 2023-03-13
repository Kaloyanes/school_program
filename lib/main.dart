import 'package:awesome_notifications/awesome_notifications.dart';
import 'package:dynamic_color/dynamic_color.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:school_program/app/modules/home/views/home_view.dart';
import 'package:school_program/main_controller.dart';
import 'package:school_program/themes.dart';

Future<void> main() async {
  WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();

  // widgetsBinding.renderView.automaticSystemUiAdjustment = false;

  SystemChrome.setEnabledSystemUIMode(SystemUiMode.edgeToEdge);
  SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
    statusBarColor: Colors.transparent,
    systemNavigationBarColor: Colors.transparent,
    systemNavigationBarDividerColor: Colors.transparent,
    systemNavigationBarContrastEnforced: false,
  ));

  FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);

  await GetStorage.init("settings");
  await GetStorage.init("homeworks");
  await GetStorage.init("tests");

  await AwesomeNotifications().initialize(
    null,
    [
      NotificationChannel(
        channelKey: "homeworkChannel",
        channelName: "homework",
        channelDescription: "notificates about homeworks",
        importance: NotificationImportance.Max,
      ),
      NotificationChannel(
        channelKey: "testChannel",
        channelName: "test",
        channelDescription: "notificates about tests",
        importance: NotificationImportance.Max,
      ),
    ],
    debug: true,
  );

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
            controller.lightDynamicColorSchemeValue =
                lightDynamic ?? _defaultLightColorScheme;

            controller.darkDynamicColorSchemeValue =
                darkDynamic ?? _defaultDarkColorScheme;

            if (controller.isDynamic.value) {
              controller.lightThemeValue = Themes.themeGen(
                lightDynamic ?? _defaultLightColorScheme,
              );

              controller.darkThemeValue = Themes.themeGen(
                darkDynamic ?? _defaultDarkColorScheme,
                darkMode: true,
              );
            }
            var themeMode = ThemeMode.system;

            switch (GetStorage("settings").read("theme")) {
              case 2:
                themeMode = ThemeMode.light;
                break;

              case 3:
                themeMode = ThemeMode.dark;
                break;
            }

            return GetMaterialApp(
              title: 'School Program',
              debugShowCheckedModeBanner: false,
              theme: controller.lightTheme.value,
              darkTheme: controller.darkTheme.value,
              home: const HomeView(),
              scrollBehavior: const CupertinoScrollBehavior(),
              defaultTransition: Transition.native,
              themeMode: themeMode,
              smartManagement: SmartManagement.full,
              locale: const Locale("bg", "BG"),
              localizationsDelegates: const [
                DefaultMaterialLocalizations.delegate,
                DefaultWidgetsLocalizations.delegate,
                DefaultCupertinoLocalizations.delegate,
              ],
            );
          },
        );
      },
    );
  }
}
