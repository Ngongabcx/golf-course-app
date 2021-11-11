import 'package:get/get.dart';

import '../controllers/view_players_screen_controller.dart';

class ViewPlayersScreenBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ViewPlayersScreenController>(
      () => ViewPlayersScreenController(),
    );
  }
}
