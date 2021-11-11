import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class SignUpController extends GetxController {
final signUpFormKey = GlobalKey<FormState>();
var storag = GetStorage();
TextEditingController signUpEmailController, signUpPasswordController,signUpConfirmPasswordController;
  @override
  void onInit() {
    super.onInit();
    signUpEmailController = TextEditingController();
    signUpPasswordController = TextEditingController();
     signUpConfirmPasswordController = TextEditingController();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {}
}
