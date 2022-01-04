import 'package:flutter/material.dart';
import 'package:gcms/app/modules/Authentication/controllers/auth_controller.dart';
import 'package:gcms/app/modules/commonWidgets/snackbar.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/src/extension_instance.dart';
import 'package:get/get_utils/src/get_utils/get_utils.dart';

final signUpController = Get.put(AuthenticationController());
bool signupSubmitForm() {
  if (GetUtils.isEmail(signUpController.signUpEmailController.text)) {
    if (signUpController.signUpPasswordController.text.isEmpty) {
      ShowSnackBar(
        title: "Password cannot be empty",
        message: "Please provide a valid password.",
        backgroundColor: Colors.red,
      );
      return false;
    } else {
      if (signUpController.signUpConfirmPasswordController.text.isEmpty) {
        ShowSnackBar(
          title: "Confirm password cannot be empty",
          message: "Please provide a confirmation password.",
          backgroundColor: Colors.red,
        );
        return false;
      } else {
        if (signUpController.signUpPasswordController.text !=
            signUpController.signUpConfirmPasswordController.text) {
          ShowSnackBar(
            title: "Password mismatch",
            message: "Passwords entered did not match.",
            backgroundColor: Colors.red,
          );
          return false;
        }
      }
    }
  } else {
    ShowSnackBar(
      title: "Invalid Email",
      message: "Please provide a valid email address.",
      backgroundColor: Colors.red,
    );
    return false;
  }
  return true;
}
