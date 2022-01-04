import 'package:flutter/material.dart';
import 'package:gcms/app/modules/Authentication/controllers/auth_controller.dart';
import 'package:gcms/app/modules/SettingScreen/views/buildPictureFormBuilder.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/src/extension_instance.dart';

import 'buildSignUp.dart';
import 'buildUserDetails.dart';

final signUpController = Get.put(AuthenticationController());

List<Step> buildStep() {
  return [
    Step(
      title: Text('Sign up'),
      content: BuildSignUp(),
      isActive: signUpController.currentStep.value >= 0,
      state: signUpController.currentStep.value > 0
          ? StepState.complete
          : StepState.indexed,
    ),
    Step(
      title: Text('User details'),
      content: BuildUserDetails(),
      isActive: signUpController.currentStep.value >= 1,
      state: signUpController.currentStep.value > 0
          ? StepState.complete
          : StepState.indexed,
    ),
    Step(
      title: Text('Uploads'),
      content: ImagePicker(),
      isActive: signUpController.currentStep.value >= 2,
    ),
  ];
}
