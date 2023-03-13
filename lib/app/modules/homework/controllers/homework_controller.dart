import 'dart:developer';

import 'package:awesome_notifications/awesome_notifications.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:intl/intl.dart';
import 'package:school_program/app/models/homework.dart';

class HomeworkController extends GetxController {
  //TODO: Implement HomeworkController

  GetStorage homeworkStorage = GetStorage("homeworks");

  final fabVisible = true.obs;

  final Duration duration = const Duration(milliseconds: 600);

  DateFormat formatter = DateFormat('dd/MM/yyyy');
  final homework = <Homework>[].obs;

  @override
  void onInit() {
    AwesomeNotifications().isNotificationAllowed().then(
      (value) {
        if (!value) {
          AwesomeNotifications().requestPermissionToSendNotifications();
        }
      },
    );
    loadHomework();
    super.onInit();
  }

  void loadHomework() {
    var homeworks = homeworkStorage.read("homeworks");

    if (homeworks == null) return;

    inspect(homeworks);

    for (var homew in homeworks) {
      homework.add(Homework.fromJson(homew));
    }

    homework.sort(
      (a, b) => a.dueDate.compareTo(b.dueDate),
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

  Future<void> addHomework(
      String title, String description, DateTime dueDate) async {
    await AwesomeNotifications().createNotification(
      content: NotificationContent(
        id: 10,
        channelKey: "homeworkChannel",
        criticalAlert: true,
        title: title,
        body: description,
        notificationLayout: NotificationLayout.Inbox,
        icon: null,
        displayOnBackground: true,
        wakeUpScreen: true,
        showWhen: false,
      ),
      schedule: NotificationCalendar.fromDate(
          date: DateTime(dueDate.year, dueDate.month, dueDate.day - 1, 9, 30)),
    );

    await AwesomeNotifications().createNotification(
      content: NotificationContent(
        id: 11,
        channelKey: "homeworkChannel",
        criticalAlert: true,
        title: title,
        body: description,
        notificationLayout: NotificationLayout.Inbox,
        icon: null,
        displayOnBackground: true,
        wakeUpScreen: true,
        showWhen: false,
      ),
      schedule: NotificationCalendar.fromDate(
          date: DateTime(dueDate.year, dueDate.month, dueDate.day, 9, 30)),
    );

    homework.add(
      Homework(
        title: title,
        description: description,
        dueDate: dueDate,
      ),
    );
    homework.sort(
      (a, b) => a.dueDate.compareTo(b.dueDate),
    );

    homeworkStorage.write("homeworks", homework);
  }

  void removeHomework(Homework homeworkToRemove) {
    homework.remove(homeworkToRemove);
    homework.sort(
      (a, b) => a.dueDate.compareTo(b.dueDate),
    );

    homeworkStorage.write("homeworks", homework);

    ScaffoldMessenger.of(Get.context!).clearSnackBars();
    ScaffoldMessenger.of(Get.context!).showSnackBar(
      const SnackBar(
        content: Text("Успешно изтрихте домашната"),
      ),
    );
  }
}
