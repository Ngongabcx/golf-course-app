import 'package:flutter/material.dart';
import 'package:gcms/app/modules/ActiveGameScreen/views/competition_detail_view.dart';
import 'package:gcms/app/modules/SetupScreen/providers/competition_provider.dart';
import 'package:gcms/app/modules/SetupScreen/providers/course_provider.dart';
import 'package:gcms/app/modules/commonWidgets/snackbar.dart';
import 'package:gcms/app/modules/home/providers/user_provider.dart';
import 'package:gcms/app/modules/home/user_model.dart' as userModel;
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:intl/intl.dart';

import '../course_model.dart' as courseModel;

class SetupScreenController extends GetxController {
  final DateFormat formatter = DateFormat('yyyy-MM-dd');
  var selectedDate = ''.obs;
  var selectedTime = 'Not set'.obs;
  var selectedCourseId = ''.obs;
  var storage = GetStorage();
  var holes = [9, 18];
  var startHoleOptions = [1, 10];
  var numberOfHolesToPlay = 0.obs;
  var isProcessing = false.obs;
  var lstCourses = <courseModel.Payload>[].obs;
  var lstPlayers = <userModel.Payload>[].obs;
  var selectedPlayers = [].obs;
  var currentSelectedHole = ''.obs;
  var startingHole = 0.obs;
  var endingHole = 0.obs;
  final hole9options = [1, 9, 10, 18];
  var holeCorrespondingValue = [].obs;
  final hole18options = [1, 18];
  var startingHoleOptions = <int>[].obs;
  var endingHoleOptions = <int>[].obs;
  late TextEditingController matchname;
  var currentSelectedGameType = '';
  bool strokePlay = false;
  bool steplefold = false;
  var matchDate = 'Not set'.obs;
  var matchTime = "Not set".obs;

  @override
  void onInit() {
    super.onInit();
    matchname = TextEditingController();
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
        ShowSnackBar(
            title: "Error",
            message: err.toString(),
            backgroundColor: Colors.red);
      });
    } catch (exception) {
      print("Exception getting courses details -->" + exception.toString());
      isProcessing(false);
      ShowSnackBar(
          title: "Exception",
          message: exception.toString(),
          backgroundColor: Colors.red);
    }
    lstCourses.refresh();
  }

  getPlayers() {
    print("GETTING PLAYERS.......................");
    var userIdString = storage.read('userId');
    var userId = int.parse(userIdString);
    print("USer id to remove from list of players  ---> $userId");
    try {
      isProcessing(true);
      UserProvider().getPlayers().then((resp) async {
        lstPlayers.addAll(resp);
        print("List of players before removing the user  ---> $lstPlayers");
        var usr = lstPlayers.where((p0) => p0.id==userId);
        lstPlayers.remove(usr.first);
        print("List of players after removing the user  ---> $lstPlayers");
        print("PLAYERS SUCCESSFULLY FETCHED  ---> ${resp.first.fname}");
        isProcessing(false);
      }, onError: (err) {
        print("Error getting players details -->" + err.toString());
        isProcessing(false);
        ShowSnackBar(
            title: "Error",
            message: err.toString(),
            backgroundColor: Colors.red);
      });
    } catch (exception) {
      print("Exception getting players details -->" + exception.toString());
      isProcessing(false);
      ShowSnackBar(
          title: "Exception",
          message: exception.toString(),
          backgroundColor: Colors.red);
    }
    lstPlayers.refresh();
  }

  createCompetition(Map data) {
    print("DATA FOR CREATING COMPETITIION---------> $data");
    try {
      isProcessing(true);
      CompetitionProvider().createCompetition(data).then((resp) async {
        print("CREATE COMPETITION RESPONSE --> $resp");
        isProcessing(false);
        Get.to(() => CompetitionDetailView(competition: resp.payload!.first));
      }, onError: (err) {
        print("ERROR CREATING COMPETITION -->" + err.toString());
        isProcessing(false);
        ShowSnackBar(
            title: "Error",
            message: err.toString(),
            backgroundColor: Colors.red);
      });
    } catch (exception) {
      print("Exception CREATING COMPETITION -->" + exception.toString());
      isProcessing(false);
      ShowSnackBar(
          title: "Exception",
          message: exception.toString(),
          backgroundColor: Colors.red);
    }
  }

  // Future<compPlayer.CompetitionPlayer> getCompetitionPlayer(
  //     String playerId, String competitionId) {
  //   try {
  //     isProcessing(true);
  //     CompetitionProvider().getCompetitionPlayer(competitionId,playerId).then(
  //         (resp) async {
  //       print("COMPETITION SUCCESSFULLY FETCHED  ---> $resp");
  //       isProcessing(false);
  //       return resp;
  //     }, onError: (err) {
  //       print("Error getting competition details -->" + err.toString());
  //       isProcessing(false);
  //       ShowSnackBar(
  //           title: "Error",
  //           message: err.toString(),
  //           backgroundColor: Colors.red);

  //     return Future.error(err.toString());
  //     });
  //   } catch (exception) {
  //     print("Exception getting competition details -->" + exception.toString());
  //     isProcessing(false);
  //     ShowSnackBar(
  //         title: "Exception",
  //         message: exception.toString(),
  //         backgroundColor: Colors.red);
  //     return Future.error(exception.toString());
  //   }
  //    return Future.error(
  //         "An error occured please check your internet connection.".toString());
  // }

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
        ShowSnackBar(
            title: "Error",
            message: err.toString(),
            backgroundColor: Colors.red);
      });
    } catch (exception) {
      print("Exception getting competition details -->" + exception.toString());
      isProcessing(false);
      ShowSnackBar(
          title: "Exception",
          message: exception.toString(),
          backgroundColor: Colors.red);
    }
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {}
}
