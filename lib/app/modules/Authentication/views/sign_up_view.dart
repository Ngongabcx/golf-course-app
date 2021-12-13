import 'package:flutter/material.dart';
import 'package:gcms/app/modules/Authentication/controllers/auth_controller.dart';
import 'package:gcms/app/modules/commonWidgets/customButton.dart';
import 'package:gcms/constants/constant.dart';
import 'package:gcms/theme/gcms_theme.dart';
import 'package:get/get.dart';

import 'build_step.dart';

class SignUpView extends GetView<AuthenticationController> {
  final signUpController = Get.put(AuthenticationController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Theme(
        data: Theme.of(context).copyWith(
          colorScheme: ColorScheme.light(primary: kPrimaryColor),
        ),
        child: SafeArea(
          child: Obx(
            () => Stepper(
              type: StepperType.horizontal,
              steps: buildStep(),
              currentStep: signUpController.currentStep.value,
              onStepContinue: () {
                if (signUpController.currentStep.value ==
                    buildStep().length - 1) {
                  print('Send data to the server');
                } else {
                  signUpController.currentStep.value++;
                }
              },
              onStepCancel: () {
                signUpController.currentStep.value == 0
                    ? null
                    : signUpController.currentStep.value--;
              },
              onStepTapped: (index) {
                signUpController.currentStep.value = index;
              },
              controlsBuilder: (context, {onStepContinue, onStepCancel}) {
                return Padding(
                  padding: const EdgeInsetsDirectional.fromSTEB(0, 0, 0, 30),
                  child: Container(
                    child: Row(
                      children: [
                        if (signUpController.currentStep.value != 0)
                          Expanded(
                            child: CustomButton(
                                text: 'Previous',
                                textStyle: GcmsTheme.lightTextTheme.bodyText2,
                                onPressed: onStepCancel),
                          ),
                        if (signUpController.currentStep.value != 0)
                          SizedBox(
                            width: 16,
                          ),
                        Expanded(
                          child: CustomButton(
                              text: signUpController.currentStep.value ==
                                      buildStep().length - 1
                                  ? 'Submit'
                                  : 'Next',
                              textStyle: GcmsTheme.lightTextTheme.bodyText2,
                              onPressed: onStepContinue),
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
        ),
      ),
    );
  }
}
