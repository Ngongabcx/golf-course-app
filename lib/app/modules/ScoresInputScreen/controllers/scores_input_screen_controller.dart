import 'package:flutter/material.dart';
import 'package:gcms/app/modules/ScoresInputScreen/providers/scorecard_provider.dart';
import 'package:gcms/app/modules/SetupScreen/competition_model.dart';
import 'package:gcms/app/modules/commonWidgets/snackbar.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class ScoresInputScreenController extends GetxController {
  var hcp = 0.0.obs;
  var hole = 0.0.obs;
  var par = 0.0.obs;
  var stroke = 0.0.obs;
  var score = 0.0.obs;
  var result = 0.0.obs;
  var isProcessing = false.obs;
  var storage = GetStorage();
  var endHole;
  var gameHoles = <Hole>[].obs;
  var remainingHoles = 0.obs;
  var holeIndex = 0.obs;
  var count = 0.obs;
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
  void extractGameHolesArray(Competition competition) {
    print("EXTRACT GAME HOLES HAS BEEN CALLED!!!!");
    var totalHoles = competition.payload.numberOfHoles;
    remainingHoles.value = totalHoles;
    var startingHole = competition.payload.startingHole;
    var holes = competition.payload.course.holes;
    print("TOTAL HOLES ------------> $totalHoles");
    //get holes that are being payed accourding to the competition number of holes being played
    if (totalHoles == 18) {
      gameHoles.addAll(holes);
      print("GAME HOLES ----> ${gameHoles.first}");
    } else {
      if (startingHole == 1 || startingHole == 9) {
        count.value = 1;
        for (int h = 0; h < totalHoles; h++) {
          print("COUNT1  --> $count");
          var _gameHoles =
              holes.where((course) => course.holeNo == count.value).toList();
          count.value++;
          print(h);
          print(holes[h]);
          gameHoles.addAll(_gameHoles);
        }
      }
      if (startingHole == 10 || startingHole == 18) {
        count.value = 10;
        for (int h = 0; h < totalHoles; h++) {
          print("COUNT2  --> $count");
          var _gameHoles =
              holes.where((course) => course.holeNo == count.value).toList();
          count.value++;
          print(h);
          print(holes[h]);
          gameHoles.addAll(_gameHoles);
        }
      }
    }
    stroke.value = gameHoles[holeIndex.value].stroke.toDouble();
    par.value = gameHoles[holeIndex.value].par.toDouble();
    hole.value = gameHoles[holeIndex.value].holeNo.toDouble();
    hcp.value = storage.read("hcp");
    print("FIRST GAME HOLE NUMBER ----> ${gameHoles.first.holeNo}");
    print("LAST GAME HOLE NUMBER ----> ${gameHoles.last.holeNo}");
  }

  void addScorecard(Map data, String compId, String userId) {
    try {
      isProcessing(true);
      ScorecardProvider().addScorecard(data, compId, userId).then((resp) {
        isProcessing(false);
        holeIndex++;
        ShowSnackBar("Success", "Score Successfully Added.", Colors.green);
      }, onError: (err) {
        isProcessing(false);
        ShowSnackBar("Error", err.toString(), Colors.red);
      });
    } catch (exception) {
      isProcessing(false);
      print("<---------EXCEPTION2--------->" + exception.toString());
      ShowSnackBar("Exception", exception.toString(), Colors.red);
    }
  }

  calculateResult() {
    if (score > 0) {
      if (hcp >= 18) {
        double calc = hcp.value - 18;
        if (stroke <= calc) {
          result.value = (3 + (par.value - score.value)) + 1;
        } else {
          result.value = (3 + (par.value - score.value));
        }
      } else if (hcp < stroke.value) {
        result.value = (2 + (par.value - score.value));
      } else {
        result.value = (3 + (par.value - score.value));
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
    if (result.value == (par.value - 1)) {
      return 'Good job you got a birdie ';
    } else if (score.value == (par.value - 2)) {
      return 'Great job you got an Eagle !!!';
    } else if (score.value == (par.value - 3)) {
      return 'Excellent you got an albertros';
    } else if (score.value == par.value) {
      return 'Not bad you got a Par';
    } else if (score.value == (par.value + 1)) {
      return 'You got a Bogey';
    } else if (score.value == (par.value + 1)) {
      return 'You got a Double Bogey';
    } else {
      return 'You have scored 0!!!';
    }
  }
}
