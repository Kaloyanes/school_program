import 'package:get/get.dart';

import 'package:school_program/app/modules/homework/controllers/add_homework_controller.dart';

import '../controllers/homework_controller.dart';

class HomeworkBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<AddHomeworkController>(
      () => AddHomeworkController(),
    );
    Get.lazyPut<HomeworkController>(
      () => HomeworkController(),
    );
  }
}
