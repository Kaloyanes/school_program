import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:school_program/app/modules/homework/controllers/homework_controller.dart';

class AddHomeworkController extends GetxController {
  //TODO: Implement AddHomeworkController

  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  final DateFormat formatter = DateFormat('dd/MM/yyyy');

  final dueDate = DateTime.now().obs;

  final TextEditingController title = TextEditingController();
  final TextEditingController description = TextEditingController();

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

    var homeworkController = Get.find<HomeworkController>();

    homeworkController.addHomework(
        title.text.trim(), description.text.trim(), dueDate.value);

    title.clear();
    description.clear();
    dueDate.value = DateTime.now();

    ScaffoldMessenger.of(Get.context!).showSnackBar(
      const SnackBar(
        duration: Duration(seconds: 1),
        content: Text("Домашното е добавено"),
      ),
    );
  }
}
