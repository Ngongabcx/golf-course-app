import 'package:flutter/material.dart';
import 'package:gcms/app/modules/Authentication/controllers/auth_controller.dart';
import 'package:gcms/app/modules/commonWidgets/textFormField.dart';
import 'package:gcms/constants/constant.dart';
import 'package:get/get.dart';

class BuildSignUp extends GetView<AuthenticationController> {
  final signUpController = Get.put(AuthenticationController());
  @override
  Widget build(BuildContext context) {
    return Form(
      key: signUpController.signUpFormKey,
      child: Column(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsetsDirectional.fromSTEB(0, 5, 0, 0),
            child: Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Expanded(
                  child: CustomTextFormFieldWidget(
                    controller.signUpEmailController,
                    "Email",
                    (s) {},
                    false,
                    false,
                    true,
                    (value) {
                      if (value == null || value.trim().isEmpty) {
                        return 'Email is required.';
                      }
                      return null;
                    },
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsetsDirectional.fromSTEB(0, 16, 0, 0),
            child: Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Expanded(
                  child: CustomTextFormFieldWidget(
                    controller.signUpPasswordController,
                    "Password",
                    (s) {},
                    true,
                    false,
                    false,
                    (value) {
                      if (value == null || value.trim().isEmpty) {
                        return 'Password is required.';
                      }
                      return null;
                    },
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsetsDirectional.fromSTEB(0, 16, 0, 0),
            child: Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Expanded(
                  child: CustomTextFormFieldWidget(
                    controller.signUpConfirmPasswordController,
                    "Confirm Password",
                    (s) {},
                    true,
                    false,
                    false,
                    (value) {
                      if (value == null || value.trim().isEmpty) {
                        return 'Confirm password is required.';
                      } else if (signUpController
                              .signUpPasswordController.text !=
                          signUpController
                              .signUpConfirmPasswordController.text) {
                        return 'Passwords do not match.';
                      }

                      return null;
                    },
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsetsDirectional.fromSTEB(0, 24, 0, 0),
            child: Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: const [],
            ),
          ),
          // Padding(
          //   padding: const EdgeInsets.only(bottom: 16.0),
          //   child: Obx(() {
          //     //Returning loader and dismissing it once processing status changes
          //     Future.delayed(Duration.zero, () async {
          //       context
          //           .read<LoadingProvider>()
          //           .setLoad(controller.isProcessing.value);
          //     });
          //     //Dismissing keyboard
          //     FocusScope.of(context).requestFocus(new FocusNode());
          //     return CustomButton(
          //       text: (controller.isProcessing.value == true
          //           ? 'Processing'
          //           : 'Create Account'),
          //       textStyle: GcmsTheme.lightTextTheme.bodyText2,
          //       onPressed: () {
          //         submitForm();
          //       },
          //     );
          //   }),
          // ),
          Padding(
            padding: const EdgeInsets.only(bottom: 16.0),
            child: InkWell(
              onTap: () {
                Get.back();
              },
              child: Ink(
                padding: EdgeInsets.symmetric(
                  vertical: 8,
                  horizontal: 16,
                ),
                decoration: BoxDecoration(
                  border: Border(
                    top: BorderSide(
                      color: Colors.grey[300]!,
                    ),
                    bottom: BorderSide(
                      color: Colors.grey[300]!,
                    ),
                  ),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Padding(
                          padding: const EdgeInsets.only(bottom: 4.0),
                          child: Text(
                            "Already have an Account?",
                            style: TextStyle(
                              color: kPrimaryColor,
                              // fontWeight: FontWeight.bold,
                              fontSize: 16,
                            ),
                          ),
                        ),
                        Text(
                          'Login here.',
                          style: TextStyle(
                            color: Colors.grey[600],
                            fontSize: 14,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
