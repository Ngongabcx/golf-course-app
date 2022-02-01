import 'package:flutter/material.dart';
import 'package:gcms/app/modules/ScoresInputScreen/providers/scorecard_provider.dart';
import 'package:gcms/app/modules/SetupScreen/competition_model.dart';
import 'package:gcms/app/modules/SetupScreen/competition_player_model.dart'
    as compPlayer;
import 'package:gcms/app/modules/commonWidgets/snackbar.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class ScoresInputScreenController extends GetxController {
  var hcp = 0.obs;
  var score = 0.obs;
  var result = 0.obs;
  var isProcessing = false.obs;
  var storage = GetStorage();
  var endHole;
  var gameHoles = <Hole>[].obs;
  var remainingHoles = 0.obs;
  var holeIndex = 0.obs;
  var count = 0.obs;
  var compPlayers = <compPlayer.Payload>[].obs;
  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {}
  void extractGameHolesArray(Payload competition) {
    print("EXTRACT GAME HOLES HAS BEEN CALLED!!!!");
    var totalHoles = competition.gameHoles;
    remainingHoles.value = totalHoles!;
    var startingHole = competition.startingHole;
    var holes = competition.course?.holes;
    print("TOTAL HOLES ------------> $totalHoles");
    //get holes that are being payed accourding to the competition number of holes being played
    if (totalHoles == 18) {
      if (startingHole == 1) {
        //front nine logic
        count.value = 1;
        for (int h = 0; h < totalHoles; h++) {
          print("COUNT2  --> $count");
          var _gameHoles =
              holes!.where((course) => course.holeNo == count.value).toList();
          count.value++;
          print(h);
          print(holes[h]);
          gameHoles.addAll(_gameHoles);
        }
      } else {
        //this is the back nine logic i.e starting hole is 10 ending at 1
        count.value = 10;
        for (int h = 0; h < totalHoles; h++) {
          print("COUNT2  --> $count");
          var _gameHoles =
              holes!.where((course) => course.holeNo == count.value).toList();
          count.value++;
          print(h);
          print(holes[h]);
          gameHoles.addAll(_gameHoles);
        }
        count.value = 1;
        for (int h = 0; h < 9; h++) {
          print("COUNT2  --> $count");
          var _gameHoles =
              holes!.where((course) => course.holeNo == count.value).toList();
          count.value++;
          print(h);
          print(holes[h]);
          gameHoles.addAll(_gameHoles);
        }
      }
      print("GAME HOLES ----> ${gameHoles.first}");
    } else {
      //Here we are playing 9 holes
      if (startingHole == 1) {
        count.value = 1;
        for (int h = 0; h < totalHoles; h++) {
          print("COUNT1  --> $count");
          var _gameHoles =
              holes!.where((course) => course.holeNo == count.value).toList();
          count.value++;
          print(h);
          print(holes[h]);
          gameHoles.addAll(_gameHoles);
        }
      } else {
        //starting hole is 10
        count.value = 10;
        for (int h = 0; h < totalHoles; h++) {
          print("COUNT2  --> $count");
          var _gameHoles =
              holes!.where((course) => course.holeNo == count.value).toList();
          count.value++;
          print(h);
          gameHoles.addAll(_gameHoles);
        }
      }
    }
    hcp.value = storage.read("hcp");
    print("FIRST GAME HOLE NUMBER ----> ${gameHoles.first.holeNo}");
    print("LAST GAME HOLE NUMBER ----> ${gameHoles.last.holeNo}");
  }

  void addScorecard(Map data, String compId, String userId) {
    try {
      isProcessing(true);
      ScorecardProvider().addScorecard(data, compId, userId).then((resp) {
        isProcessing(false);
        print("Hole index before ${holeIndex.value}");
        print(
            "old hole --> ${gameHoles[holeIndex.value].holeNo}, old par --> ${gameHoles[holeIndex.value].par}");
        holeIndex.value++;
        ShowSnackBar(
            title: "Success",
            message: "Your score has been saved.",
            backgroundColor: Colors.green);
        print("Hole index after ${holeIndex.value}");
        print(
            "new hole --> ${gameHoles[holeIndex.value].holeNo}, new par --> ${gameHoles[holeIndex.value].par}");
        score.value = 0;
        result.value = 0;
      }, onError: (err) {
        isProcessing(false);
        print("POST SCORES ERROR ---> ${err.toString()}");
        ShowSnackBar(
            title: "Error",
            message: "Failed to save scores please try again.",
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

  updateScorecard(Map data, String scorecardId) {
    try {
      isProcessing(true);
      ScorecardProvider().updateScorecard(data, scorecardId).then((resp) {
        isProcessing(false);
        ShowSnackBar(
            title: "Success",
            message: "Your score has been saved.",
            backgroundColor: Colors.green);
        Get.back();
      }, onError: (err) {
        isProcessing(false);
        print("UPDATE SCORES ERROR ---> ${err.toString()}");
        ShowSnackBar(
            title: "Error",
            message: "Failed to update score please try again.",
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

  declineScorecard(Map data, String scorecardId) {
    try {
      isProcessing(true);
      ScorecardProvider().updateScorecard(data, scorecardId).then((resp) {
        isProcessing(false);
        ShowSnackBar(
            title: "Declined",
            message: "Your have declined the score.",
            backgroundColor: Colors.red);
        Get.back();
      }, onError: (err) {
        isProcessing(false);
        print("DECLINE SCORES ERROR ---> ${err.toString()}");
        ShowSnackBar(
            title: "Error",
            message: "Failed to delcine score please try again.",
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

  getAllPlayers(String competitionId) {
    try {
      isProcessing(true);
      ScorecardProvider().getAllCompetitionPlayers(competitionId).then(
          (resp) async {
        compPlayers.addAll(resp);

        print(
            "COMPETITION PLAYERS SUCCESSFULLY FETCHED  ---> ${compPlayers.first.player!.fname}");
        isProcessing(false);
        print(
            "COMPETITION PLAYERS SUCCESSFULLY FETCHED  ---> ${isProcessing.value}");
      }, onError: (err) {
        print("Error getting competition players details -->" + err.toString());
        isProcessing(false);
        ShowSnackBar(
            title: "Error",
            message: err.toString(),
            backgroundColor: Colors.red);
      });
    } catch (exception) {
      print("Exception getting competition players details -->" +
          exception.toString());
      isProcessing(false);
      ShowSnackBar(
          title: "Exception",
          message: exception.toString(),
          backgroundColor: Colors.red);
    }
    compPlayers.refresh();
    compPlayers.clear();
  }

  calculateResult() {
    if (score > 0) {
      if (hcp >= 18) {
        int calc = hcp.value - 18;
        if (gameHoles[holeIndex.value].stroke! <= calc) {
          result.value =
              (3 + (gameHoles[holeIndex.value].par! - score.value)) + 1;
        } else {
          result.value = (3 + (gameHoles[holeIndex.value].par! - score.value));
        }
      } else if (hcp.value < gameHoles[holeIndex.value].stroke!) {
        result.value = (2 + (gameHoles[holeIndex.value].par! - score.value));
      } else {
        result.value = (3 + (gameHoles[holeIndex.value].par! - score.value));
      }

      if (result.value <= 0) {
        result.value = 0;
      }
    } else {
      result.value = 0;
    }
    return result.value.toStringAsFixed(1);
  }

  String getInterpretation() {
    if (result.value == (gameHoles[holeIndex.value].par! - 1)) {
      return 'Good job you got a birdie ';
    } else if (score.value == (gameHoles[holeIndex.value].par! - 2)) {
      return 'Great job you got an Eagle !!!';
    } else if (score.value == (gameHoles[holeIndex.value].par! - 3)) {
      return 'Excellent you got an albertros';
    } else if (score.value == gameHoles[holeIndex.value].par) {
      return 'Not bad you got a Par';
    } else if (score.value == (gameHoles[holeIndex.value].par! + 1)) {
      return 'You got a Bogey';
    } else if (score.value == (gameHoles[holeIndex.value].par! + 1)) {
      return 'You got a Double Bogey';
    } else {
      return 'You have scored 0!!!';
    }
  }
}
