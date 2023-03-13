import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:get/get.dart';
import 'package:school_program/app/modules/homework/controllers/add_homework_controller.dart';

class AddHomeworkPage extends GetView<AddHomeworkController> {
  const AddHomeworkPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.lazyPut(() => AddHomeworkController());
    return AlertDialog(
      title: const Text("Добави домашна"),
      content: Form(
        key: controller.formKey,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 10),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextFormField(
                controller: controller.title,
                decoration: const InputDecoration(
                  label: Text("Заглавие"),
                ),
                validator: (value) {
                  if (value!.isEmpty) return "Попълнете полето";

                  return null;
                },
                textInputAction: TextInputAction.next,
              ),
              const SizedBox(
                height: 10,
              ),
              TextFormField(
                controller: controller.description,
                decoration: const InputDecoration(
                  label: Text("Описание"),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Obx(
                    () => Text(
                      "Краен срок: ${controller.formatter.format(controller.dueDate.value)}",
                      style: Theme.of(context).textTheme.bodyMedium,
                    ),
                  ),
                  IconButton(
                    onPressed: () => controller.changeDate(),
                    icon: const Icon(
                      Icons.edit,
                    ),
                  ),
                ],
              ),
              const SizedBox(
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
            ],
          ),
        ),
      ),
    ).animate().scaleXY(
          alignment: Alignment.center,
          curve: Curves.fastLinearToSlowEaseIn,
          duration: 600.ms,
        );
  }
}
