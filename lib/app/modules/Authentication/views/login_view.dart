import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gcms/app/modules/commonWidgets/custom_text_button.dart';
import 'package:get/get.dart';
import 'package:provider/src/provider.dart';

import 'package:gcms/app/modules/commonWidgets/customButton.dart';
import 'package:gcms/app/modules/commonWidgets/loader/loading_provider.dart';
import 'package:gcms/app/modules/commonWidgets/snackbar.dart';
import 'package:gcms/app/modules/commonWidgets/textFormField.dart';
import 'package:gcms/constants/constant.dart';
import 'package:gcms/theme/gcms_theme.dart';

import '../controllers/auth_controller.dart';

class LoginView extends GetView<AuthenticationController> {
  final loginController = Get.put(AuthenticationController());
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
                key: loginController.loginFormKey,
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
                              'Login',
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
                              controller.usernameController,
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
                              controller.passwordController,
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
                          const EdgeInsetsDirectional.fromSTEB(0, 24, 0, 0),
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: const [],
                      ),
                    ),
                    Row(
                      children: [
                        Expanded(
                          flex: 6,
                          child: Padding(
                            padding: const EdgeInsets.only(bottom: 16.0),
                            child: Obx(() {
                              //We setting loader below
                              Future.delayed(Duration.zero, () async {
                                context
                                    .read<LoadingProvider>()
                                    .setLoad(controller.isProcessing.value);
                              });
                              //We dismiss keyboard below
                              FocusScope.of(context).requestFocus(
                                  new FocusNode()); //dismisses keyboard
                              return CustomButton(
                                text: (controller.isProcessing.value == true
                                    ? 'Processing'
                                    : 'Login'),
                                style: GcmsTheme.lightTextTheme.bodyText2,
                                onPressed: () {
                                  if (GetUtils.isEmail(
                                      controller.usernameController.text)) {
                                    if (GetUtils.isBlank(
                                        controller.passwordController.text)) {
                                      ShowSnackBar(
                                        "Password cannot be empty",
                                        "Please provide a valid password.",
                                        Colors.red,
                                      );
                                    } else {
                                      if (controller.isProcessing.value ==
                                          false) {
                                        controller.login({
                                          'email': controller
                                              .usernameController.text,
                                          'password': controller
                                              .passwordController.text,
                                        });
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
                        ),
                        Expanded(
                            flex: 3,
                            child: IconButton(
                              padding: EdgeInsets.only(bottom: 12),
                              splashRadius:25,
                              icon: Icon(
                                Icons.fingerprint
                              ),
                              iconSize: 65,
                              color: kPrimaryColor,
                              splashColor: Colors.grey,
                              onPressed: () => controller.authenticateUser(),
                            )),
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.only(bottom: 16.0),
                      child: InkWell(
                        onTap: () {
                          Get.toNamed("/sign-up");
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
                                      "Don't have an Account?",
                                      style: TextStyle(
                                        color: kPrimaryColor,
                                        // fontWeight: FontWeight.bold,
                                        fontSize: 16,
                                      ),
                                    ),
                                  ),
                                  Text(
                                    'Sign up here to create one.',
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
