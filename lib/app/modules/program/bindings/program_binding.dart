import 'package:get/get.dart';

import '../controllers/program_controller.dart';

class ProgramBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ProgramController>(
      () => ProgramController(),
    );
  }
}
