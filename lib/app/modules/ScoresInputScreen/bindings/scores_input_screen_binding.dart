import 'package:get/get.dart';

import '../controllers/scores_input_screen_controller.dart';

class ScoresInputScreenBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ScoresInputScreenController>(
      () => ScoresInputScreenController(),
    );
  }
}
