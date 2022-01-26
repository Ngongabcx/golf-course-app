import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ShowSnackBar {
  final String title;
  final String message;
  final Color backgroundColor;
  ShowSnackBar(
      {required this.title,
      required this.message,
      required this.backgroundColor}) {
    Get.snackbar(title, message,
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: backgroundColor,
        colorText: Colors.white);
  }
}
