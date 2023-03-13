import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:school_program/app/models/test.dart';
import 'package:school_program/app/modules/tests/controllers/tests_controller.dart';
import 'package:uuid/uuid.dart';

class AddTestController extends GetxController {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  final DateFormat formatter = DateFormat('dd/MM/yyyy');

  final dueDate = DateTime.now().obs;

  final TextEditingController title = TextEditingController();

  void changeDate() {
    HapticFeedback.lightImpact();
    showDatePicker(
      context: Get.context!,
      initialDate: dueDate.value,
      firstDate: DateTime.now(),
      lastDate: DateTime.now().add(
        const Duration(days: 365),
      ),
    ).then((value) {
      dueDate.value = value ?? DateTime.now();
    });
  }

  void addHomework() {
    if (!formKey.currentState!.validate()) return;

    Get.back();

    var testController = Get.find<TestsController>();

    testController
        .createTest(Test(const Uuid().v4(), title.text, dueDate.value));

    title.clear();
    dueDate.value = DateTime.now();

    ScaffoldMessenger.of(Get.context!).clearSnackBars();
    ScaffoldMessenger.of(Get.context!).showSnackBar(
      const SnackBar(
        duration: Duration(seconds: 1),
        content: Text("Теста е добавено"),
      ),
    );
  }
}
