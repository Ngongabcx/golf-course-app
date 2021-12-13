import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gcms/app/modules/SettingScreen/controllers/setting_screen_controller.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/src/extension_instance.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';

class ImagePicker extends GetView {
  final settingController = Get.put(SettingScreenController());

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Obx(() => settingController.selectedImagePath.value == ''
            ? Text('Select an image from your gallery or camera')
            : Image.file(
                File(settingController.selectedImagePath.value),
              )),
        ElevatedButton(
          onPressed: () {
            settingController.getImage(ImageSource.camera);
          },
          child: Text('Camera'),
        ),
        ElevatedButton(
          onPressed: () {
            settingController.getImage(ImageSource.gallery);
          },
          child: Text('Gallery'),
        ),
      ],
    );
  }
}
