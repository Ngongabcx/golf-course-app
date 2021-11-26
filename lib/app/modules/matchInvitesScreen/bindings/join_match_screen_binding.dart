import 'package:get/get.dart';

import '../controllers/match_invites_controller.dart';

class MatchInvitesScreenBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<MatchInvitesController>(
      () => MatchInvitesController(),
    );
  }
}
