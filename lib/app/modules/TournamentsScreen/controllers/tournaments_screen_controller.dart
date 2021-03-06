import 'package:flutter/material.dart';
import 'package:gcms/app/modules/SetupScreen/competition_model.dart' as compt;
import 'package:gcms/app/modules/TournamentsScreen/providers/tournaments_provider.dart';
import 'package:gcms/app/modules/commonWidgets/snackbar.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class TournamentsScreenController extends GetxController {
  var isProcessing = false.obs;
  ScrollController scrollController = ScrollController();
  var compList = <compt.Payload>[].obs;
  var isMoreDataAvailable = false.obs;
  var storage = GetStorage();
  var page = 1;
  final count = 0.obs;
  @override
  void onInit() {
    super.onInit();
    getTournaments(page);
    paginateTournaments();
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

  getTournaments(var page) async {
    print('GET TOURNAMENTS CALLED');
    try {
      isProcessing(true);
      await TournamentsProvider()
          .getTournaments(page, storage.read("userId"))
          .then((resp) async {
        compList.addAll(resp.payload!);
        compList.removeWhere((item) => item.isTournament == false);
        print("TOURNAMENTS ---> ${compList.toString()}");
        debugPrint("NUMBER  OF  TOURNAMENTS ---> ${compList.length}");
        debugPrint("FIRST TOURNAMENT NAME ---> ${compList.first.compName}");
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

  void paginateTournaments() {
    scrollController.addListener(() {
      if (scrollController.position.pixels ==
              scrollController.position.maxScrollExtent &&
          !isMoreDataAvailable()) {
        print("reached end");
        page++;
        getMoreTournaments(page);
        print('Page number $page');
      }
    });
  }

  void getMoreTournaments(var page) async {
    print('GET MORE MATCHES CALLED');

    try {
      isProcessing(true);
      await TournamentsProvider()
          .getTournaments(page, storage.read("userId"))
          .then((resp) {
        compList.addAll(resp.payload!);
        if (compList.length > 0) {
          isMoreDataAvailable(true);
          print("MATCHES ---> $compList.toString()}");
          debugPrint("NUMBER  OF  COMPETITIONS ---> ${compList.length}");
          debugPrint("FIRST COMPETITION NAME ---> ${compList.first.compName}");
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
