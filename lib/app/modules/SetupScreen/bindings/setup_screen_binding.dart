import 'package:get/get.dart';

import '../controllers/setup_screen_controller.dart';

class SetupScreenBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<SetupScreenController>(
      () => SetupScreenController(),
    );
  }
}
