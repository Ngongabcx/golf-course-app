import 'package:flutter/material.dart';
import 'package:gcms/app/modules/Authentication/controllers/auth_controller.dart';
import 'package:gcms/app/modules/SettingScreen/controllers/setting_screen_controller.dart';
import 'package:gcms/app/modules/commonWidgets/customButton.dart';
import 'package:gcms/constants/constant.dart';
import 'package:gcms/theme/gcms_theme.dart';
import 'package:get/get.dart';

import 'build_step.dart';
import 'form_submit.dart';

class SignUpView extends GetView<AuthenticationController> {
  final signUpController = Get.put(AuthenticationController());
  final settingController = Get.put(SettingScreenController());

  @override
  Widget build(BuildContext context) {
    final form;
    return Scaffold(
      body: Theme(
        data: Theme.of(context).copyWith(
          colorScheme: ColorScheme.light(primary: kPrimaryColor),
        ),
        child: SafeArea(
          child: Obx(
            () => signUpController.isProcessing.value == true
                ? Center(
                    child: CircularProgressIndicator(
                      color: kPrimaryColor,
                    ),
                  )
                : Stepper(
                    type: StepperType.horizontal,
                    steps: buildStep(),
                    currentStep: signUpController.currentStep.value,
                    onStepContinue: () async {
                      if (signUpController.currentStep.value ==
                          buildStep().length - 1) {
                      } else {
                        signUpController.currentStep.value++;
                      }
                      print(
                          'Value for the on step: ${signUpController.currentStep.value == buildStep().length - 1}');
                      print(
                          'Current Step value: ${signUpController.currentStep.value}');
                      print('Build step length: ${buildStep().length - 1} ');
                    },
                    onStepCancel: () {
                      signUpController.currentStep.value--;
                      print(
                          'Value for the on step: ${signUpController.currentStep.value == buildStep().length - 1}');
                      print(
                          'Current Step value: ${signUpController.currentStep.value}');
                      print('Build step length: ${buildStep().length - 1} ');
                      // if (signUpController.currentStep.value > 0) {
                      //   signUpController.currentStep.value--;
                      // }
                    },
                    onStepTapped: (index) {
                      signUpController.currentStep.value = index;
                    },
                    controlsBuilder:
                        (BuildContext context, ControlsDetails controls,
                            {VoidCallback? onStepContinue,
                            VoidCallback? onStepCancel}) {
                      return Row(
                        children: [
                          if (signUpController.currentStep.value != 0)
                            Expanded(
                              child: CustomButton(
                                text: 'Previous',
                                textStyle: GcmsTheme.lightTextTheme.bodyText2,
                                onPressed: controls.onStepCancel,
                              ),
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
                              onPressed: () async {
                                if (signUpController.currentStep.value == 1) {
                                  print('Send data to the server');
                                  if (signUpController.isProcessing.value ==
                                      false) {
                                    signUpController.registration({
                                      'username': signUpController
                                          .signUpEmailController.text,
                                      'email': signUpController
                                          .signUpEmailController.text,
                                      'password': signUpController
                                          .signUpPasswordController.text,
                                      'firstname': signUpController
                                          .firstnameController.text,
                                      'lastname': signUpController
                                          .lastnameController.text,
                                      'address': signUpController
                                          .addressController.text,
                                      'gender':
                                          signUpController.selectedGender.value,
                                      'hcp':
                                          signUpController.hcpController.text,
                                      "dob":
                                          signUpController.selectedDate.value,
                                      "usertypeId": 1,
                                      "FcmToken": signUpController.storage
                                          .read("fcmToken")
                                          .toString(),
                                    });
                                  }
                                }

                                if (signUpController.currentStep.value == 1) {
                                  if (signUpController
                                      .validateCreateUserForm()) {
                                    controls.onStepContinue!();
                                  }
                                }
                                if (signUpController.currentStep.value == 0) {
                                  if (signupSubmitForm()) {
                                    controls.onStepContinue!();
                                  }
                                }
                              },
                            ),
                          ),
                        ],
                      );
                    },
                  ),
          ),
        ),
      ),
    );
  }
}
