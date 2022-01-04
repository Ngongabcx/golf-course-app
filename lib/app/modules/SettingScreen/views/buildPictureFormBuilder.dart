import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gcms/app/modules/SettingScreen/controllers/setting_screen_controller.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/src/extension_instance.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:image_picker/image_picker.dart';

class ImagePicker extends GetView {
  final settingController = Get.put(SettingScreenController());

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Obx(
          () => settingController.selectedImagePath.value == ''
              ? Text('Select an image from your gallery or camera')
              : ClipOval(
                  child: Image.file(
                    File(settingController.selectedImagePath.value),
                    width: 150,
                    height: 150,
                    fit: BoxFit.cover,
                  ),
                ),
        ),
        SizedBox(
          height: 48,
        ),
        buildImagePickerButton(
            title: 'Pick Camera',
            icon: Icons.camera_alt_outlined,
            onClicked: () {
              settingController.getImage(ImageSource.camera);
            }),
        SizedBox(
          height: 24,
        ),
        buildImagePickerButton(
            title: 'Pick Gallery',
            icon: Icons.image_outlined,
            onClicked: () {
              settingController.getImage(ImageSource.gallery);
            }),
        SizedBox(
          height: 50,
        ),
      ],
    );
  }

  Widget buildImagePickerButton({
    required String title,
    required IconData icon,
    required VoidCallback onClicked,
  }) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        minimumSize: Size.fromHeight(56),
        primary: Colors.white,
        onPrimary: Colors.black,
        textStyle: TextStyle(fontSize: 16),
      ),
      onPressed: onClicked,
      child: Row(
        children: [
          Icon(
            icon,
            size: 28,
          ),
          SizedBox(
            width: 16,
          ),
          Text(title),
        ],
      ),
    );
  }
}
