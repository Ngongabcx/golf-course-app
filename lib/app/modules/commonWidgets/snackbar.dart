import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ShowSnackBar {
  final String title;
  final String message;
  final Color backgroundColor;
  ShowSnackBar(this.title, this.message, this.backgroundColor) {

    Get.snackbar(title, message,
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: backgroundColor,
        colorText: Colors.white);
  }
}
