import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:school_program/app/modules/homework/controllers/add_homework_controller.dart';
import 'package:school_program/app/modules/homework/controllers/homework_controller.dart';

class AddHomeworkPage extends GetView<AddHomeworkController> {
  AddHomeworkPage({Key? key}) : super(key: key);

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
            children: [
              Expanded(
                child: Container(),
              ),
              TextFormField(
                controller: controller.title,
                decoration: InputDecoration(
                  label: Text("Заглавие"),
                ),
                validator: (value) {
                  if (value!.isEmpty) return "Попълнете полето";

                  return null;
                },
                textInputAction: TextInputAction.next,
              ),
              SizedBox(
                height: 10,
              ),
              TextFormField(
                controller: controller.description,
                decoration: InputDecoration(
                  label: Text("Описание"),
                ),
              ),
              SizedBox(
                height: 10,
              ),
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
                    onPressed: () => controller.changeDate(),
                    child: const Text("Избери"),
                  )
                ],
              ),
              SizedBox(
                height: 10,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  ElevatedButton(
                    onPressed: () => Get.back(),
                    child: const Text("Откажи"),
                  ),
                  ElevatedButton(
                    onPressed: () => controller.addHomework(),
                    child: const Text("Добави"),
                  ),
                ],
              ),
              Expanded(
                child: Container(),
              )
            ],
          ),
        ),
      ),
    );
  }
}
