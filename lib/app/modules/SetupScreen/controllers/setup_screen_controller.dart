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
  var numberOfHolesToPlay = 0.obs;
  var isProcessing = false.obs;
  var lstCourses = <Course>[].obs;
  var lstPlayers = <User>[].obs;
  var selectedPlayers = [].obs;
  var currentSelectedHole = ''.obs;
  var startingHole = 0.obs;
  var endingHole = 0.obs;
  final hole9options = [1, 9,10, 18];
  var holeCorrespondingValue = [].obs;
  final hole18options = [1, 18];
  var startingHoleOptions = <int>[].obs;
  var endingHoleOptions = <int>[].obs;
  late TextEditingController matchName;
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
        lstCourses.addAll(resp);
        print("COURSES SUCCESSFULLY FETCHED  ---> ${resp.first.courseName}");
        isProcessing(false);
      }, onError: (err) {
        print("Error getting courses details -->" + err.toString());
        isProcessing(false);
        ShowSnackBar("Error", err.toString(), Colors.red);
      });
    } catch (exception) {
      print("Exception getting courses details -->" + exception.toString());
      isProcessing(false);
      ShowSnackBar("Exception", exception.toString(), Colors.red);
    }
  }

  getPlayers() {
    print("GETTING PLAYERS.......................");
    try {
      isProcessing(true);
      UserProvider().getPlayers().then((resp) async {
        lstPlayers.addAll(resp);
        print("PLAYERS SUCCESSFULLY FETCHED  ---> ${resp.first.firstName}");
        isProcessing(false);
      }, onError: (err) {
        print("Error getting players details -->" + err.toString());
        isProcessing(false);
        ShowSnackBar("Error", err.toString(), Colors.red);
      });
    } catch (exception) {
      print("Exception getting players details -->" + exception.toString());
      isProcessing(false);
      ShowSnackBar("Exception", exception.toString(), Colors.red);
    }
  }

  createCompetition(Map data) {
    print("DATA FOR CREATING COMPETITIION---------> $data");
    try {
      isProcessing(true);
      CompetitionProvider().createCompetition(data).then((resp) async {
        isProcessing(false);
         Get.to(CompetitionDetailView(competition: resp.payload!.first));
         }, onError: (err) {
        print("Error CREATING COMPETITION -->" + err.toString());
        isProcessing(false);
        ShowSnackBar("Error", err.toString(), Colors.red);
      });
    } catch (exception) {
      print("Exception CREATING COMPETITION -->" + exception.toString());
      isProcessing(false);
      ShowSnackBar("Exception", exception.toString(), Colors.red);
    }
  }

  getCompetition(int id) {
    try {
      isProcessing(true);
      CompetitionProvider().getCompetition(id).then((resp) async {
        print("COMPETITION SUCCESSFULLY FETCHED  ---> $resp");
        isProcessing(false);
        Get.offAll(CompetitionDetailView(competition: resp.payload!.first));
      }, onError: (err) {
        print("Error getting competition details -->" + err.toString());
        isProcessing(false);
        ShowSnackBar("Error", err.toString(), Colors.red);
      });
    } catch (exception) {
      print("Exception getting competition details -->" + exception.toString());
      isProcessing(false);
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
