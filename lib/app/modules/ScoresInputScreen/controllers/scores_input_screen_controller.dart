import 'package:flutter/material.dart';
import 'package:gcms/app/modules/ScoresInputScreen/providers/scorecard_provider.dart';
import 'package:gcms/app/modules/commonWidgets/snackbar.dart';
import 'package:gcms/constants/constant.dart';
import 'package:get/get.dart';
import 'package:get/get.dart';

class ScoresInputScreenController extends GetxController {
  var hcp = 21.0.obs;
  var hole = 1.0.obs;
  var par = 5.0.obs;
  var stroke = 13.0.obs;
  var score = 0.0.obs;
  var result = 0.0.obs;
  var isProcessing = false.obs;
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

  void addScorecard(Map data) {
    try {
      isProcessing(true);
      ScorecardProvider().addScorecard(data).then((resp) {
        isProcessing(false);
        hole++;
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
