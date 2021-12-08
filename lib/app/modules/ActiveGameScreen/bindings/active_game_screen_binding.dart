import 'package:get/get.dart';
import '../controllers/active_game_screen_controller.dart';

class ActiveGameScreenBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ActiveGameScreenController>(
      () => ActiveGameScreenController(),
    );
  }
}
