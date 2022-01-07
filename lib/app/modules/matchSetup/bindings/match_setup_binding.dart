import 'package:get/get.dart';

import '../controllers/match_setup_controller.dart';

class MatchSetupBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<MatchSetupController>(
      () => MatchSetupController(),
    );
  }
}
