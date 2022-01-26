import 'dart:io';

import 'package:flutter/material.dart';
import 'package:gcms/app/modules/Authentication/controllers/auth_controller.dart';
import 'package:gcms/app/modules/commonWidgets/snackbar.dart';
import 'package:gcms/app/modules/home/providers/user_provider.dart';
import 'package:gcms/constants/constant.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:image_picker/image_picker.dart';

class SettingScreenController extends GetxController {
  final userFormKey = GlobalKey<FormState>();
  var isProcessing = false.obs;
  var biometricsSet = false.obs;
  var selectedImagePath = ''.obs;
  var selectedImageSize = ''.obs;
  void getImage(ImageSource imageSource) async {
    final pickedFile = await ImagePicker().pickImage(source: imageSource);
    selectedImagePath.value = pickedFile!.path;
    selectedImageSize.value =
        ((File(selectedImagePath.value)).lengthSync() / 1024 / 1024)
                .toStringAsFixed(2) +
            'Mb';
  }

  var storage = GetStorage();

  late TextEditingController firstnameController,
      lastnameController,
      addressController,
      imageController,
      dobController,
      genderController,
      hcpController;

  @override
  void onInit() {
    super.onInit();
    firstnameController = TextEditingController();
    lastnameController = TextEditingController();
    addressController = TextEditingController();
    imageController = TextEditingController();
    dobController = TextEditingController();
    genderController = TextEditingController();
    hcpController = TextEditingController();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {}

  String validateCreateUserForm() {
    if (firstnameController.text.isEmpty) {
      return 'Provide your first name';
    }
    if (lastnameController.text.isEmpty) {
      return 'Provide your last name';
    }
    if (addressController.text.isEmpty) {
      return 'Provide your address';
    }
    // if (!GetUtils.isBlank(value)) {
    //   return 'Provide your gender';
    // }
    if (hcpController.text.isEmpty) {
      return 'Provide your handicap';
    }
    return "";
  }

  void createUser(Map data) {
    try {
      isProcessing(true);
      UserProvider().createUser(data).then((resp) {
        clearTextEditingControllers();
        isProcessing(false);
        ShowSnackBar(
            title: "Success",
            message: "User Successfully Created.",
            backgroundColor: Colors.green);
        Get.offAllNamed('/home');
      }, onError: (err) {
        isProcessing(false);
        ShowSnackBar(
            title: "Error",
            message: err.toString(),
            backgroundColor: Colors.red);
      });
    } catch (exception) {
      isProcessing(false);
      print("<---------EXCEPTION2--------->" + exception.toString());
      ShowSnackBar(
          title: "Exception",
          message: exception.toString(),
          backgroundColor: Colors.red);
    }
  }

  void updateUserDetails(Map data, String id) {
    try {
      isProcessing(true);
      UserProvider().updateUserDetails(data, id).then((resp) {
        isProcessing(false);
        ShowSnackBar(
            title: "Success",
            message: "User Successfully Created.",
            backgroundColor: Colors.green);
        Get.offAllNamed('/home');
      }, onError: (err) {
        isProcessing(false);
        print("UPDATE USER ERROR ---> ${err.toString()}");
        ShowSnackBar(
            title: "Error",
            message: err.toString(),
            backgroundColor: Colors.red);
      });
    } catch (exception) {
      isProcessing(false);
      print("<---------EXCEPTION2--------->" + exception.toString());
      ShowSnackBar(
          title: "Exception",
          message: exception.toString(),
          backgroundColor: Colors.red);
    }
  }

  void biometricsSecurity() {
    bool isSecSet = storage.read("isBiometricActivated");
    if (isSecSet) {
      Get.defaultDialog(
          title: "Authentication",
          content: Text(
            "You will not be able to login using finger print/ face ID after turning off this feature. Turn off?",
            style: TextStyle(fontSize: 13),
          ),
          confirmTextColor: kWhiteColor,
          onConfirm: () {
            storage.write("isBiometricActivated", false);
            Get.toNamed("/setting-screen");
            ShowSnackBar(
                title: "Success",
                message: "Authentification feature successully turned off.",
                backgroundColor: Colors.green);
          },
          onCancel: () {});
    } else {
      AuthenticationController().authenticateUser(false);
    }
  }

  void clearTextEditingControllers() {
    firstnameController.clear();
    lastnameController.clear();
    addressController.clear();
    imageController.clear();
    dobController.clear();
    genderController.clear();
    hcpController.clear();
  }
}
