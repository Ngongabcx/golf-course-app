import 'package:flutter/material.dart';
import 'package:gcms/app/modules/ActiveGameScreen/providers/active_games_provider.dart';
import 'package:gcms/app/modules/SetupScreen/competition_model.dart';
import 'package:gcms/app/modules/commonWidgets/snackbar.dart';
import 'package:get/get.dart';

class ActiveGameScreenController extends GetxController {
  //TODO: Implement ActiveGameScreenController
  var matches = Competition().obs;
  var isProcessing = false.obs;
  final count = 0.obs;
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
  void increment() => count.value++;

  getActiveMatches() async {
    try {
      isProcessing(true);
      await ActiveGamesProvider().getActiveMatches().then((resp) async {
        matches.value = resp;
        print("MATCHES ---> ${matches.toString()}");
        debugPrint("MATCHES ---> ${matches.toString()}");
        isProcessing(false);
      }, onError: (err) {
        print("Error receiving matches -->" + err.toString());
        ShowSnackBar("Error", err.toString(), Colors.red);
        isProcessing(false);
      });
    } catch (exception) {
      print("Exception receiving matches  -->" + exception.toString());
      ShowSnackBar("Exception", exception.toString(), Colors.red);
      isProcessing(false);
    }
  }
}
