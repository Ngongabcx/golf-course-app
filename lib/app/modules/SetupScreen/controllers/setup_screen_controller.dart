import 'package:flutter/material.dart';
import 'package:gcms/app/modules/ActiveGameScreen/views/competition_detail_view.dart';
import 'package:gcms/app/modules/SetupScreen/providers/competition_provider.dart';
import 'package:gcms/app/modules/SetupScreen/providers/course_provider.dart';
import 'package:gcms/app/modules/commonWidgets/snackbar.dart';
import 'package:gcms/app/modules/home/providers/user_provider.dart';
import 'package:gcms/app/modules/home/user_model.dart';
import 'package:get/get.dart';

import '../course_model.dart';

class SetupScreenController extends GetxController {
  var selectedCourseId = ''.obs;
  var tempPlayersList = [
    {"PlayerId": 8},
    {"PlayerId": 15},
    {"PlayerId": 18}
  ];
  var isProcessing = false.obs;
  var lstCourses = <Course>[].obs;
  var lstPlayers = <User>[].obs;
  var selectedPlayers = [].obs;
  var currentSelectedHole = ''.obs;
  var selectedHole = 0.obs;
  final hole9options = [1, 9, 10, 18];
  final hole18options = [1, 9, 10, 18];
  TextEditingController matchName;
  var currentSelectedGameType = '';
  bool strokePlay = false;
  bool steplefold = false;
  var matchDate = 'Not set'.obs;
  var matchTime = "Not set".obs;

  @override
  void onInit() {
    super.onInit();
    matchName = TextEditingController();
    getPlayers();
    getCourses();
  }

  getCourses() {
    try {
      isProcessing(true);
      CourseProvider().getCourses().then((resp) async {
        isProcessing(false);
        lstCourses.addAll(resp);
        print("COURSES SUCCESSFULLY FETCHED  ---> ${resp.first.courseName}");
      }, onError: (err) {
        isProcessing(false);
        print("Error getting courses details -->" + err.toString());
        ShowSnackBar("Error", err.toString(), Colors.red);
      });
    } catch (exception) {
      isProcessing(false);
      print("Exception getting courses details -->" + exception.toString());
      ShowSnackBar("Exception", exception.toString(), Colors.red);
    }
  }

  getPlayers() {
    print("GETTING PLAYERS.......................");
    try {
      isProcessing(true);
      UserProvider().getPlayers().then((resp) async {
        isProcessing(false);
        lstPlayers.addAll(resp);
        print("PLAYERS SUCCESSFULLY FETCHED  ---> ${resp.first.firstName}");
      }, onError: (err) {
        isProcessing(false);
        print("Error getting players details -->" + err.toString());
        ShowSnackBar("Error", err.toString(), Colors.red);
      });
    } catch (exception) {
      isProcessing(false);
      print("Exception getting players details -->" + exception.toString());
      ShowSnackBar("Exception", exception.toString(), Colors.red);
    }
  }

  createCompetition(Map data) {
    print("DATA FOR CREATING COMPETITIION---------> $data");
    try {
      isProcessing(true);
      CompetitionProvider().createCompetition(data).then((resp) async {
        isProcessing(false);
        print("COMPETITION SUCCESSFULLY CREATED  ---> ${resp.payload}");
        Get.to(CompetitionDetailView(resp));
      }, onError: (err) {
        isProcessing(false);
        print("Error CREATING COMPETITION -->" + err.toString());
        ShowSnackBar("Error", err.toString(), Colors.red);
      });
    } catch (exception) {
      isProcessing(false);
      print("Exception CREATING COMPETITION -->" + exception.toString());
      ShowSnackBar("Exception", exception.toString(), Colors.red);
    }
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {}
}
