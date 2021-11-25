import 'package:get/get.dart';

import '../controllers/join_match_screen_controller.dart';

class JoinMatchScreenBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<MatchInvitesController>(
      () => MatchInvitesController(),
    );
  }
}
