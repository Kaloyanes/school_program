import 'dart:developer';

import 'package:awesome_notifications/awesome_notifications.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:intl/intl.dart';
import 'package:school_program/app/models/test.dart';

class TestsController extends GetxController {
  GetStorage testStorage = GetStorage("tests");

  final tests = <Test>[].obs;

  DateFormat formatter = DateFormat('dd/MM/yyyy');

  final fabVisible = true.obs;

  @override
  void onInit() {
    super.onInit();
    loadTests();
    AwesomeNotifications().isNotificationAllowed().then(
      (value) {
        if (!value) {
          AwesomeNotifications().requestPermissionToSendNotifications();
        }
      },
    );
  }

  bool scrolled(UserScrollNotification notification) {
    final ScrollDirection direction = notification.direction;

    if (direction == ScrollDirection.forward) {
      fabVisible.value = true;
    } else if (direction == ScrollDirection.reverse) {
      fabVisible.value = false;
    }

    return true;
  }

  void loadTests() {
    var values = testStorage.getKeys() as Iterable;
    inspect(values);

    if (values.isEmpty) return;

    for (var test in values) {
      var sd = testStorage.read(test);
      tests.add(Test.fromJson(sd));
    }

    tests.sort(
      (a, b) => a.dayOfDeath.compareTo(b.dayOfDeath),
    );
  }

  Future clear() async {
    await testStorage.erase();
  }

  Future<void> createTest(Test test) async {
    await AwesomeNotifications().createNotification(
      content: NotificationContent(
        id: 1,
        channelKey: "testChannel",
        criticalAlert: true,
        title: test.title,
        body: "Тестче имаш утре ти",
        icon: null,
        displayOnBackground: true,
        wakeUpScreen: true,
        showWhen: false,
      ),
      schedule: NotificationCalendar.fromDate(
        date: DateTime(
          test.dayOfDeath.year,
          test.dayOfDeath.month,
          test.dayOfDeath.day - 1,
          9,
          30,
        ),
      ),
    );

    await AwesomeNotifications().createNotification(
      content: NotificationContent(
        id: 2,
        channelKey: "testChannel",
        criticalAlert: true,
        title: test.title,
        body: "Тесчеееееето дойде",
        icon: null,
        displayOnBackground: true,
        wakeUpScreen: true,
        showWhen: false,
      ),
      schedule: NotificationCalendar.fromDate(
        date: DateTime(
          test.dayOfDeath.year,
          test.dayOfDeath.month,
          test.dayOfDeath.day,
          9,
          30,
        ),
      ),
    );

    tests.add(test);
    tests.sort(
      (a, b) => a.dayOfDeath.compareTo(b.dayOfDeath),
    );
    await testStorage.write(test.uid, test.toJson());
  }

  Future<void> removeTest(Test test) async {
    tests.remove(test);
    tests.sort(
      (a, b) => a.dayOfDeath.compareTo(b.dayOfDeath),
    );
    await testStorage.remove(test.uid);

    print("removed ${test.uid}");

    ScaffoldMessenger.of(Get.context!).clearSnackBars();
    ScaffoldMessenger.of(Get.context!).showSnackBar(
      const SnackBar(
        duration: Duration(seconds: 1),
        content: Text("Изтрит е теста"),
      ),
    );
  }
}
