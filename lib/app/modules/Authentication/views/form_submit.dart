import 'package:flutter/material.dart';
import 'package:gcms/app/modules/Authentication/controllers/auth_controller.dart';
import 'package:gcms/app/modules/Authentication/views/user_details_submit_form.dart';
import 'package:gcms/app/modules/commonWidgets/snackbar.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/src/extension_instance.dart';
import 'package:get/get_utils/src/get_utils/get_utils.dart';

final signUpController = Get.put(AuthenticationController());
bool signupSubmitForm() {
  if (GetUtils.isEmail(userController.signUpEmailController.text)) {
    if (userController.signUpPasswordController.text.isEmpty) {
      ShowSnackBar(
        title: "Password cannot be empty",
        message: "Please provide a valid password.",
        backgroundColor: Colors.red,
      );
      return false;
    } else {
      if (userController.signUpConfirmPasswordController.text.isEmpty) {
        ShowSnackBar(
          title: "Confirm password cannot be empty",
          message: "Please provide a confirmation password.",
          backgroundColor: Colors.red,
        );
        return false;
      } else {
        if (userController.signUpPasswordController.text !=
            userController.signUpConfirmPasswordController.text) {
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
