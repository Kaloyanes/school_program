import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';

import 'package:get/get.dart';
import 'package:school_program/app/models/homework.dart';
import 'package:school_program/app/modules/homework/views/add_homework.dart';

import '../controllers/homework_controller.dart';

class HomeworkView extends GetView<HomeworkController> {
  const HomeworkView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    Get.lazyPut(
      () => HomeworkController(),
    );
    return Scaffold(
      appBar: AppBar(
        title: const Text("Домашни"),
        centerTitle: true,
      ),
      body: NotificationListener<UserScrollNotification>(
        onNotification: controller.scrolled,
        child: Obx(
          () => ListView(
            cacheExtent: 100000,
            children: [
              for (Homework homework in controller.homework)
                Dismissible(
                  key: UniqueKey(),
                  onDismissed: (direction) =>
                      controller.removeHomework(homework),
                  child: Card(
                    child: ListTile(
                      title: Text(homework.title),
                      subtitle: Text(homework.description),
                      trailing: Text(
                        controller.formatter.format(homework.dueDate),
                        style: Theme.of(context).textTheme.labelLarge,
                      ),
                    ),
                  ),
                )
            ].animate(interval: 100.ms).scaleXY(
                  alignment: Alignment.bottomCenter,
                  curve: Curves.fastLinearToSlowEaseIn,
                  duration: 300.ms,
                ),
          ),
        ),
      ),
      floatingActionButton: Obx(
        () => FloatingActionButton.extended(
          onPressed: () => showDialog(
            context: Get.context!,
            builder: (context) => const AddHomeworkPage(),
          ),
          elevation: 0,
          disabledElevation: 0,
          enableFeedback: true,
          label: const Text("Добави"),
          icon: const Icon(
            Icons.add,
          ),
        )
            .animate(target: controller.fabVisible.value ? 1 : 0)
            .scaleXY(
              curve: Curves.easeInOutQuart,
              duration: 500.ms,
            )
            .slideY(
              begin: 1,
              curve: Curves.easeInOutQuart,
              duration: 500.ms,
            ),
      ),
    );
  }
}
