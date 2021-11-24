import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gcms/app/modules/Authentication/controllers/auth_controller.dart';
import 'package:gcms/app/modules/commonWidgets/customButton.dart';
import 'package:gcms/app/modules/commonWidgets/loader/loading_provider.dart';
import 'package:gcms/app/modules/commonWidgets/snackbar.dart';
import 'package:gcms/app/modules/commonWidgets/textFormField.dart';
import 'package:gcms/constants/constant.dart';
import 'package:gcms/theme/gcms_theme.dart';

import 'package:get/get.dart';
import 'package:provider/src/provider.dart';

class SignUpView extends GetView<AuthenticationController> {
  final signUpController = Get.put(AuthenticationController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: [
          Padding(
            padding: const EdgeInsetsDirectional.fromSTEB(20, 0, 20, 0),
            child: SingleChildScrollView(
              child: Form(
                key: signUpController.signUpFormKey,
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(top: 10.0),
                      child: Center(
                        child: SvgPicture.asset(
                          'assets/images/tempLogo.svg',
                          color: kPrimaryColor,
                          height: MediaQuery.of(context).size.height * 0.29,
                        ),
                      ),
                    ),
                    Padding(
                      padding:
                          const EdgeInsetsDirectional.fromSTEB(0, 0, 0, 10),
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Expanded(
                            child: Text(
                              'Sign Up',
                              textAlign: TextAlign.center,
                              style: Theme.of(context).textTheme.headline2,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding:
                          const EdgeInsetsDirectional.fromSTEB(0, 16, 0, 0),
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
                            ),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding:
                          const EdgeInsetsDirectional.fromSTEB(0, 16, 0, 0),
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
                            ),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding:
                          const EdgeInsetsDirectional.fromSTEB(0, 16, 0, 0),
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
                            ),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding:
                          const EdgeInsetsDirectional.fromSTEB(0, 24, 0, 0),
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: const [],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(bottom: 16.0),
                      child: Obx(() {
                        //Returning loader and dismissing it once processing status changes
                        Future.delayed(Duration.zero, () async {
                          context
                              .read<LoadingProvider>()
                              .setLoad(controller.isProcessing.value);
                        });
                        //Dismissing keyboard
                        FocusScope.of(context).requestFocus(new FocusNode());
                        return CustomButton(
                          text: (controller.isProcessing.value == true
                              ? 'Processing...'
                              : 'Create Account'),
                          style: GcmsTheme.lightTextTheme.bodyText2,
                          onPressed: () {
                            if (GetUtils.isEmail(
                                controller.signUpEmailController.text)) {
                              if (GetUtils.isBlank(
                                  controller.signUpPasswordController.text)) {
                                ShowSnackBar(
                                  "Password cannot be empty",
                                  "Please provide a valid password.",
                                  Colors.red,
                                );
                              } else {
                                if (GetUtils.isBlank(controller
                                    .signUpConfirmPasswordController.text)) {
                                  ShowSnackBar(
                                    "Password cannot be empty",
                                    "Please provide a valid password.",
                                    Colors.red,
                                  );
                                } else {
                                  if (controller
                                          .signUpPasswordController.text !=
                                      controller.signUpConfirmPasswordController
                                          .text) {
                                    ShowSnackBar(
                                      "Password Error",
                                      "Passwords entered did not match.",
                                      Colors.red,
                                    );
                                  } else {
                                    if (controller.isProcessing.value ==
                                        false) {
                                      controller.register({
                                        'username': controller
                                            .signUpEmailController.text,
                                        'email': controller
                                            .signUpEmailController.text,
                                        'password': controller
                                            .signUpPasswordController.text,
                                      });
                                    }
                                  }
                                }
                              }
                            } else {
                              ShowSnackBar(
                                "Invalid Email",
                                "Please provide a valid email address.",
                                Colors.red,
                              );
                            }
                          },
                        );
                      }),
                    ),
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
                                color: Colors.grey[300],
                              ),
                              bottom: BorderSide(
                                color: Colors.grey[300],
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
              ),
            ),
          ),
        ],
      ),
    );
  }
}
