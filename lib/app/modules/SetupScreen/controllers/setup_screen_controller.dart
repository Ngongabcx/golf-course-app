import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:gcms/app/modules/SetupScreen/providers/course_provider.dart';
import 'package:gcms/app/modules/commonWidgets/snackbar.dart';
import 'package:get/get.dart';

import '../course_model.dart';

class SetupScreenController extends GetxController {
  var isProcessing = false.obs;
  var lstCourses = [].obs;
  final courses = [
    'Chinama Golf Course',
    'Lusaka Golf Club',
    'Bonanza Golf Course',
    'Chilanga Golf Club',
  ];
  var currentSelectedCourse = ''.obs;
  var currentSelectedHole = ''.obs;
  var selectedHole = 0.obs;
  final hole9options = [1, 9, 10, 18];
  final hole18options = [1, 9, 10, 18];

  var currentSelectedGameType = '';
  bool strokePlay = false;
  bool steplefold = false;

  final playersList = ['Tiger Woods', 'Love the third', 'Rory McRoy'];
  var date = 'Not set'.obs;
  var time = "Not set".obs;

  @override
  void onInit() {
    super.onInit();
    getCourses();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {}
  getCourses() {
    try {
      isProcessing(true);
      CourseProvider().getCourses().then((resp) async {
        isProcessing(false);
        lstCourses.addAll(resp);
        print("COURSES SUCCESSFULLY FETCHED  ---> $resp");
      }, onError: (err) {
        isProcessing(false);
        print("Error getting courses details -->" + err.toString());
        ShowSnackBar("Error", err.toString(), Colors.red);
        Get.offAllNamed('/login');
      });
    } catch (exception) {
      isProcessing(false);
      print("Exception getting courses details -->" + exception.toString());
      ShowSnackBar("Exception", exception.toString(), Colors.red);
      Get.offAllNamed('/login');
    }
  }
}
