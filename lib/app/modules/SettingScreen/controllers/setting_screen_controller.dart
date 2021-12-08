import 'package:flutter/material.dart';
import 'package:gcms/app/modules/commonWidgets/snackbar.dart';
import 'package:gcms/app/modules/home/providers/user_provider.dart';
import 'package:gcms/constants/constant.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class SettingScreenController extends GetxController {
  final userFormKey = GlobalKey<FormState>();
  var isProcessing = false.obs;

  var storage = GetStorage();

  TextEditingController firstnameController,
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
    if (!GetUtils.isBlank(firstnameController)) {
      return 'Provide your first name';
    }
    if (!GetUtils.isBlank(lastnameController)) {
      return 'Provide your last name';
    }
    if (!GetUtils.isBlank(addressController)) {
      return 'Provide your address';
    }
    // if (!GetUtils.isBlank(value)) {
    //   return 'Provide your gender';
    // }
    if (!GetUtils.isBlank(hcpController)) {
      return 'Provide your handicap';
    }
  }

  void createUser(Map data) {
    try {
      isProcessing(true);
      UserProvider().createUser(data).then((resp) {
        clearTextEditingControllers();
        isProcessing(false);
        ShowSnackBar("Success", "User Successfully Created.", Colors.green);
        Get.offAllNamed('/home');
      }, onError: (err) {
        isProcessing(false);
        ShowSnackBar("Error", err.toString(), Colors.red);
      });
    } catch (exception) {
      isProcessing(false);
      print("<---------EXCEPTION2--------->" + exception.toString());
      ShowSnackBar("Exception", exception.toString(), Colors.red);
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
