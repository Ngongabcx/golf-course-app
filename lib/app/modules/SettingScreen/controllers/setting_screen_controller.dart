import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_image_compress/flutter_image_compress.dart';
import 'package:gcms/app/modules/Authentication/controllers/auth_controller.dart';
import 'package:gcms/app/modules/SettingScreen/providers/image_upload_provider.dart';
import 'package:gcms/app/modules/commonWidgets/snackbar.dart';
import 'package:gcms/app/modules/home/providers/user_provider.dart';
import 'package:gcms/constants/constant.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:image_picker/image_picker.dart';

class SettingScreenController extends GetxController {
  final userFormKey = GlobalKey<FormState>();
  var isProcessing = false.obs;
  var biometricsSet = false.obs;

  var selectedImagePath = ''.obs;
  var selectedImageSize = ''.obs;

  //Crop code
  var cropImagePath = ''.obs;
  var cropImageSize = ''.obs;

  //Compress code
  var compressImagePath = ''.obs;
  var compressImageSize = ''.obs;

  getImage(ImageSource imageSource) async {
    final pickedFile = await ImagePicker().pickImage(source: imageSource);
    if (pickedFile != null) {
      selectedImagePath.value = pickedFile.path;
      selectedImageSize.value =
          ((File(selectedImagePath.value)).lengthSync() / 1024 / 1024)
                  .toStringAsFixed(2) +
              'Mb';

      final cropImageFile = await ImageCropper.cropImage(
          sourcePath: selectedImagePath.value,
          maxHeight: 512,
          maxWidth: 512,
          compressFormat: ImageCompressFormat.jpg);
      cropImagePath.value = cropImageFile!.path;
      cropImageSize.value =
          ((File(cropImagePath.value)).lengthSync() / 1024 / 1024)
                  .toStringAsFixed(2) +
              "MB";

      //Compress
      final dir = await Directory.systemTemp;
      final targetPath = dir.absolute.path + "temp.jpg";
      var compressedFile = await FlutterImageCompress.compressAndGetFile(
          cropImagePath.value, targetPath,
          quality: 90);
      compressImagePath.value = compressedFile!.path;
      compressImageSize.value =
          ((File(compressImagePath.value)).lengthSync() / 1024 / 1024)
                  .toStringAsFixed(2) +
              "MB";
      uploadImage(compressedFile);
    } else {
      Get.snackbar("Error", "No image selected",
          snackPosition: SnackPosition.BOTTOM,
          backgroundColor: Colors.red,
          colorText: Colors.white);
    }
  }

  void uploadImage(File compressedFile) {
    Get.dialog(
      Center(
        child: CircularProgressIndicator(),
      ),
      barrierDismissible: false,
    );

    final id = storage.read('aspUserID').toString();
    ImageUploadProvider().uploadImage(compressedFile, id).then((resp) {
      Map<String, dynamic> res = jsonDecode((resp));
      if (res["success"] == true) {
        UserProvider().updateUserDetails({
          'image': res['payload']['imagePath'],
          'imageThumbnail': res['payload']['thumbnailPath'],
        }, id).then((resp) {
          ShowSnackBar(
              title: "Success",
              message: "Image Successfully uploaded.",
              backgroundColor: Colors.green);
          Get.offAllNamed('/home');
        });
      } else if (res["success"] == false) {
        ShowSnackBar(
          title: "Error",
          message: "Image upload failed.",
          backgroundColor: Colors.red,
        );
      }
    }, onError: (err) {
      Get.back();
      ShowSnackBar(
        title: "Error",
        message: "Image upload failed.",
        backgroundColor: Colors.red,
      );
    });
  }

  //Crop image

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
