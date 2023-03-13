import 'package:get/get.dart';

import '../controllers/tests_controller.dart';

class TestsBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<TestsController>(
      () => TestsController(),
    );
  }
}
