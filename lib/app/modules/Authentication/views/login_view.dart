import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gcms/app/modules/commonWidgets/customButton.dart';
import 'package:gcms/app/modules/commonWidgets/loader/loader.dart';
import 'package:gcms/app/modules/commonWidgets/snackbar.dart';
import 'package:gcms/constants/constant.dart';
import 'package:gcms/theme/gcms_theme.dart';
import 'package:get/get.dart';

import '../controllers/auth_controller.dart';
import 'login_form_view.dart';

class LoginView extends GetView<AuthenticationController> {
  final _controller = Get.put(AuthenticationController());
  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Scaffold(
        body: _controller.isProcessing.value
            ? Loader()
            : SingleChildScrollView(
                child: Container(
                  child: Column(
                    children: <Widget>[
                      Container(
                        padding: kDefaultPagePadding,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Padding(
                              padding: const EdgeInsets.only(top: 5.0),
                              child: Center(
                                child: SvgPicture.asset(
                                  'assets/images/tempLogo.svg',
                                  color: kPrimaryColor,
                                  height:
                                      MediaQuery.of(context).size.height * 0.29,
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(top: 8.0),
                              child: Align(
                                alignment: Alignment.topCenter,
                                child: Text(
                                  'Login',
                                  style: Theme.of(context).textTheme.headline2,
                                  textAlign: TextAlign.center,
                                ),
                              ),
                            ),
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(vertical: 0.0),
                              child: Row(
                                children: [
                                  GestureDetector(
                                    onTap: () {
                                      Get.toNamed('/activate-account');
                                    },
                                    child: Text(
                                      'Activate account',
                                      style: TextStyle(
                                        color: kWhiteColor,
                                        fontSize: 18,
                                        fontWeight: FontWeight.w700,
                                        decoration: TextDecoration.underline,
                                        decorationThickness: 1,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(bottom: 0),
                              child: Form(
                                //key: _formKey,
                                child: Column(
                                  children: <Widget>[
                                    LoginFormView(),
                                  ],
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(top: 8),
                              child: Row(
                                children: [
                                  Expanded(
                                    flex: 5,
                                    child: Align(
                                      alignment: Alignment.centerLeft,
                                      child: CustomButton(
                                          text: 'Login',
                                          textStyle: GcmsTheme
                                              .lightTextTheme.bodyText2,
                                          onPressed: () {
                                            if (GetUtils.isEmail(controller
                                                .usernameController.text)) {
                                              if (controller.passwordController
                                                  .text.isEmpty) {
                                                ShowSnackBar(
                                                  title: "Password cannot be empty",
                                                  message: "Please provide a valid password.",
                                                  backgroundColor:Colors.red,
                                                );
                                              } else {
                                                if (controller
                                                        .isProcessing.value ==
                                                    false) {
                                                  controller.login({
                                                    'email': controller
                                                        .usernameController
                                                        .text,
                                                    'password': controller
                                                        .passwordController
                                                        .text,
                                                  });
                                                }
                                              }
                                            } else {
                                              ShowSnackBar(
                                                title: "Invalid Email",
                                                message: "Please provide a valid email address.",
                                                backgroundColor:Colors.red,
                                              );
                                            }
                                          }),
                                    ),
                                  ),
                                  if (_controller.hasFingerPrintLock.value !=
                                      false)
                                    Expanded(
                                      flex: 2,
                                      child: Align(
                                        alignment: Alignment.centerRight,
                                        child: IconButton(
                                          padding: EdgeInsets.only(right: 14),
                                          splashRadius: 25,
                                          icon:
                                              Icon(Icons.fingerprint_outlined),
                                          iconSize: 65,
                                          color: kPrimaryColor,
                                          splashColor: Colors.grey,
                                          onPressed: () =>
                                              _controller.authenticateUser(),
                                        ),
                                      ),
                                    ),
                                ],
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(top: 14.0),
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
                                        color: Colors.grey.shade300,
                                      ),
                                      bottom: BorderSide(
                                        color: Colors.grey.shade300,
                                      ),
                                    ),
                                  ),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: <Widget>[
                                      Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: <Widget>[
                                          Padding(
                                            padding: const EdgeInsets.only(
                                                bottom: 4.0),
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
                    ],
                  ),
                ),
              ),
      ),
    );
  }
}
