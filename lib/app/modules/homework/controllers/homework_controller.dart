import 'dart:developer';

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
  final homework = [].obs;

  @override
  void onInit() {
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

  void addHomework(String title, String description, DateTime dueDate) {
    homework.add(
      Homework(
        title: title,
        description: description,
        dueDate: dueDate,
      ),
    );

    homeworkStorage.write("homeworks", homework);
  }

  void removeHomework(int index) {
    homework.removeAt(index);

    homeworkStorage.write("homeworks", homework);
    ScaffoldMessenger.of(Get.context!).clearSnackBars();
    ScaffoldMessenger.of(Get.context!).showSnackBar(
      const SnackBar(
        content: Text("Успешно изтрихте домашната"),
      ),
    );
  }
}
