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
    getActiveMatches();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {}
  void increment() => count.value++;

  getActiveMatches() async {
    print('GET ACTIVE MATCHES CALLED');
    try {
      isProcessing(true);
      await ActiveGamesProvider().getActiveMatches().then((resp) async {
        matches.value = resp;
        print("MATCHES ---> ${matches.toString()}");
        debugPrint(
            "NUMBER  OF  COMPETITIONS ---> ${matches.value.payload!.length}");
        debugPrint(
            "FIRST COMPETITION NAME ---> ${matches.value.payload!.first.compName}");
        isProcessing(false);
        print(isProcessing.value);
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
