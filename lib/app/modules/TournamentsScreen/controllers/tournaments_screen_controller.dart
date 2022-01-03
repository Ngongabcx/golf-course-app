import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gcms/app/modules/SetupScreen/competition_model.dart';
import 'package:gcms/app/modules/TournamentsScreen/providers/tournaments_provider.dart';
import 'package:gcms/app/modules/commonWidgets/snackbar.dart';
import 'package:get/get.dart';

class TournamentsScreenController extends GetxController {
  //TODO: Implement TournamentsScreenController
  var tournament = Competition().obs;
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

  getTournaments() async {
    print('GET TOURNAMENTS CALLED');
    try {
      isProcessing(true);
      await TournamentsProvider().getActiveMatches().then((resp) async {
        tournament.value = resp;
        print("TOURNAMENTS ---> ${tournament.toString()}");
        debugPrint(
            "NUMBER  OF  TOURNAMENTS ---> ${tournament.value.payload!.length}");
        debugPrint(
            "FIRST TOURNAMENT NAME ---> ${tournament.value.payload!.first.compName}");
        isProcessing(false);
        print(isProcessing.value);
      }, onError: (err) {
        print("Error receiving matches -->" + err.toString());
        ShowSnackBar(
            title: "Error",
            message: err.toString(),
            backgroundColor: Colors.red);
        isProcessing(false);
      });
    } catch (exception) {
      print("Exception receiving tournaments  -->" + exception.toString());
      ShowSnackBar(
          title: "Exception",
          message: exception.toString(),
          backgroundColor: Colors.red);
      isProcessing(false);
    }
  }
}
