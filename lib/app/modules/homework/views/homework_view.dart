import 'package:animations/animations.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
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
        child: ListView.builder(
          itemCount: controller.homework.length,
          itemBuilder: (context, index) {
            return Card(
              child: ListTile(
                title: Text(controller.homework[index].title),
                subtitle: Text(controller.homework[index].description),
                trailing: Text(controller.formatter
                    .format(controller.homework[index].dueDate)),
              ),
            );
          },
        ),
      ),
      floatingActionButton: animated_fab_button(),
    );
  }

  Widget animated_fab_button() {
    return Obx(
      () => AnimatedSlide(
        duration: controller.duration,
        offset: Offset(0, controller.fabVisible.value ? 0 : 1),
        curve: Curves.easeInOutQuart,
        child: AnimatedScale(
          duration: controller.duration,
          curve: Curves.easeInOutQuart,
          scale: controller.fabVisible.value ? 1 : 0,
          child: OpenContainer(
            transitionType: ContainerTransitionType.fade,
            transitionDuration: const Duration(milliseconds: 300),
            openShape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20),
            ),
            openBuilder: (context, action) => AddHomeworkPage(),
            closedElevation: 0,
            middleColor: Color.alphaBlend(
              Theme.of(Get.context!).colorScheme.background,
              Theme.of(Get.context!).colorScheme.primaryContainer,
            ),
            openColor: Theme.of(Get.context!).colorScheme.background,
            closedColor: Theme.of(Get.context!).colorScheme.primaryContainer,
            closedShape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.all(
                Radius.circular(30.0),
              ),
            ),
            closedBuilder: (context, action) => FloatingActionButton.extended(
              backgroundColor: Colors.transparent,
              // label: const Text("Добави"),
              onPressed: action,
              elevation: 0,
              disabledElevation: 0,
              enableFeedback: true,
              label: const Text("Добави"),
              icon: const Icon(
                Icons.add,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
