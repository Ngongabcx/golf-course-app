import 'package:get/get.dart';

import '../controllers/tournaments_screen_controller.dart';

class TournamentsScreenBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<TournamentsScreenController>(
      () => TournamentsScreenController(),
    );
  }
}
