import 'package:flutter/material.dart';
import 'package:gcms/app/modules/ActiveGameScreen/providers/active_games_provider.dart';
import 'package:gcms/app/modules/SetupScreen/competition_model.dart';
import 'package:gcms/app/modules/SetupScreen/competition_model.dart' as compt;
import 'package:gcms/app/modules/commonWidgets/snackbar.dart';
import 'package:get/get.dart';

class ActiveGameScreenController extends GetxController {
  //TODO: Implement ActiveGameScreenController
  var matches = Competition().obs;
  var matchList = <compt.Payload>[].obs;
  var isProcessing = false.obs;
  ScrollController scrollController = ScrollController();
  var isMoreDataAvailable = false.obs;
  var page = 1;
  final count = 0.obs;
  @override
  void onInit() async {
    super.onInit();
    getActiveMatches(page);
    paginateMatches();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    scrollController.dispose();
  }

  void increment() => count.value++;

  getActiveMatches(var page) async {
    print('GET ACTIVE MATCHES CALLED');
    try {
      isProcessing(true);
      await ActiveGamesProvider().getActiveMatches(page).then((resp) async {
        matches.value = resp;
        matchList.addAll(resp.payload!);
        print("MATCHES ---> ${matches.toString()}");
        debugPrint(
            "NUMBER  OF  COMPETITIONS ---> ${matches.value.payload!.length}");
        debugPrint(
            "FIRST COMPETITION NAME ---> ${matches.value.payload!.first.compName}");
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
      print("Exception receiving matches  -->" + exception.toString());
      ShowSnackBar(
          title: "Exception",
          message: exception.toString(),
          backgroundColor: Colors.red);
      isProcessing(false);
    }
  }

  void paginateMatches() {
    scrollController.addListener(() {
      if (scrollController.position.pixels ==
              scrollController.position.maxScrollExtent &&
          !isMoreDataAvailable()) {
        print("reached end");
        page++;
        getMoreMatches(page);
        print('Page number $page');
      }
    });
  }

  void getMoreMatches(var page) async {
    print('GET MORE MATCHES CALLED');

    try {
      isProcessing(true);
      await ActiveGamesProvider().getActiveMatches(page).then((resp) {
        matchList.addAll(resp.payload!);
        if (matches.value.payload!.length > 0) {
          isMoreDataAvailable(true);
          print("MATCHES ---> ${matches.value.toString()}");
          debugPrint(
              "NUMBER  OF  COMPETITIONS ---> ${matches.value.payload!.length}");
          debugPrint(
              "FIRST COMPETITION NAME ---> ${matches.value.payload!.first.compName}");
          isProcessing(false);
        } else {
          isMoreDataAvailable(false);
          ShowSnackBar(
              title: "Message",
              message: "No more items",
              backgroundColor: Colors.red);
          isProcessing(false);
        }
      }, onError: (err) {
        isMoreDataAvailable(false);
        ShowSnackBar(
            title: "Error",
            message: err.toString(),
            backgroundColor: Colors.red);
        isProcessing(false);
      });
    } catch (exception) {
      isMoreDataAvailable(false);
      ShowSnackBar(
          title: "Error",
          message: exception.toString(),
          backgroundColor: Colors.red);
      isProcessing(false);
    }
  }
}
