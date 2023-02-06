import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:school_program/app/modules/homework/controllers/add_homework_controller.dart';

class AddHomeworkPage extends GetView<AddHomeworkController> {
  const AddHomeworkPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.lazyPut(() => AddHomeworkController());
    return Scaffold(
      appBar: AppBar(
        title: const Text("Добави домашно"),
        centerTitle: true,
      ),
      body: Form(
        key: controller.formKey,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10),
          child: Column(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              TextFormField(
                decoration: InputDecoration(
                  label: Text("Заглавие"),
                ),
              ),
              const Spacer(),
              TextFormField(
                decoration: InputDecoration(
                  label: Text("Описание"),
                ),
              ),
              const Spacer(),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Obx(
                    () => Text(
                      "Краен срок: " +
                          controller.formatter.format(controller.dueDate.value),
                      style: Theme.of(context).textTheme.bodyMedium,
                    ),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      HapticFeedback.lightImpact();
                      showDatePicker(
                        context: context,
                        initialDate: controller.dueDate.value,
                        firstDate: DateTime.now(),
                        lastDate: DateTime.now().add(
                          const Duration(days: 365),
                        ),
                      ).then((value) {
                        controller.dueDate.value = value ?? DateTime.now();
                      });
                    },
                    child: const Text("Избери"),
                  )
                ],
              ),
              const Spacer(),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  ElevatedButton(
                    onPressed: () {
                      Navigator.pop(context);
                      Timer(
                        const Duration(milliseconds: 300),
                        () {
                          ScaffoldMessenger.of(Get.context!).showSnackBar(
                            SnackBar(
                              duration: const Duration(seconds: 1),
                              content: const Text("Домашното е добавено"),
                            ),
                          );
                        },
                      );
                    },
                    child: const Text("Добави"),
                  ),
                  ElevatedButton(
                    onPressed: () => Navigator.pop(context),
                    child: const Text("Откажи"),
                  ),
                ],
              ),
              const Spacer(
                flex: 30,
              )
            ],
          ),
        ),
      ),
    );
  }
}
