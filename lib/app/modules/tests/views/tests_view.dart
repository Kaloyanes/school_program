import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';

import 'package:get/get.dart';
import 'package:school_program/app/modules/tests/views/add_test.dart';

import '../controllers/tests_controller.dart';

class TestsView extends GetView<TestsController> {
  const TestsView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    Get.lazyPut(() => TestsController());
    return Scaffold(
      appBar: AppBar(
        title: const Text('Тестове'),
        centerTitle: true,
      ),
      body: NotificationListener<UserScrollNotification>(
        onNotification: controller.scrolled,
        child: Obx(
          () => ListView(
            children: [
              for (var test in controller.tests)
                Dismissible(
                  key: UniqueKey(),
                  onDismissed: (direction) => controller.removeTest(test),
                  child: Card(
                    child: ListTile(
                      title: Text(test.title),
                      trailing: Text(
                        controller.formatter.format(test.dayOfDeath),
                        style: Theme.of(context).textTheme.labelLarge,
                      ),
                    ),
                  ),
                ),
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
            builder: (context) => const AddTestView(),
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
