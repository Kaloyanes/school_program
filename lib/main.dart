import 'package:dynamic_color/dynamic_color.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:get/get.dart';
import 'package:school_program/home.dart';
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

class MyApp extends StatelessWidget {
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
    return DynamicColorBuilder(
      builder: (lightDynamic, darkDynamic) {
        return GetMaterialApp(
          title: 'School Program',
          debugShowCheckedModeBanner: false,
          theme: Themes.light(lightDynamic ?? _defaultLightColorScheme),
          darkTheme: Themes.dark(darkDynamic ?? _defaultDarkColorScheme),
          home: const Home(),
        );
      },
    );
  }
}
