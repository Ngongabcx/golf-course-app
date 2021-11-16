import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:gcms/app/modules/ExploreScreen/views/explore_screen_view.dart';
import 'package:gcms/app/modules/Notifications/views/notifications_view.dart';
import 'package:get/get.dart';
import 'package:gcms/app/modules/home/providers/command_provider.dart';
import 'package:get_storage/get_storage.dart';

class HomeController extends GetxController {
  var selectedIndex = 0.obs;

  static List<Widget> pages = <Widget>[
    ExploreScreenView(),
    Container(color: Colors.white),
    NotificationsView(),
  ];

  //------OLD CODE THAT WE WILL ALTER TO SUUIT GCMS FOR CALLS TO API----//
  var lstCommand = List<dynamic>.empty(growable: true).obs;
  var page = 1;
  var isDataProcessing = false.obs;
  var storage = GetStorage();
  // For Pagination
  ScrollController scrollController = ScrollController();
  var isMoreDataAvailable = true.obs;

  // To Save Task
  TextEditingController howToEditingController,
      lineEditingController,
      platformEditingController;
  var selectedPriority = 1.obs;
  var isProcessing = false.obs;

  @override
  void onInit() async {
    super.onInit();
    //TODO: Check JWT Expiration, If expired refresh token and fetch user details
    // Fetch Data
    getCommands();

    //For Pagination
    paginateCommand();

    // To Save  Task
    howToEditingController = TextEditingController();
    lineEditingController = TextEditingController();
    platformEditingController = TextEditingController();
  }

  // Fetch Data
  void getCommands() {
    try {
      isMoreDataAvailable(false);
      isDataProcessing(true);
      CommandProvider().getCommands().then((resp) {
        log('======GET ALL COMMANDS RESPONSE===> ' + resp.toString());
        isDataProcessing(false);
        lstCommand.addAll(resp);
      }, onError: (err) {
        isDataProcessing(false);
        showSnackBar("Error", err.toString(), Colors.red);
      });
    } catch (exception) {
      isDataProcessing(false);
      showSnackBar("Exception", exception.toString(), Colors.red);
    }
  }

  // common snack bar
  showSnackBar(String title, String message, Color backgroundColor) {
    Get.snackbar(title, message,
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: backgroundColor,
        colorText: Colors.white);
  }

  // For Pagination
  void paginateCommand() {
    scrollController.addListener(() {
      if (scrollController.position.pixels ==
          scrollController.position.maxScrollExtent) {
        print("reached end");
        page++;
        getMoreCommands();
      }
    });
  }

  // Get More data
  void getMoreCommands() {
    try {
      CommandProvider().getCommands().then((resp) {
        if (resp.length > 0) {
          isMoreDataAvailable(true);
        } else {
          isMoreDataAvailable(false);
          showSnackBar("Message", "No more items", Colors.lightBlueAccent);
        }
        lstCommand.addAll(resp);
      }, onError: (err) {
        isMoreDataAvailable(false);
        showSnackBar("Error", err.toString(), Colors.red);
      });
    } catch (exception) {
      isMoreDataAvailable(false);
      showSnackBar("Exception", exception.toString(), Colors.red);
    }
  }

  // Refresh List
  void refreshList() async {
    page = 1;
    getCommands();
  }

  // Save Data
  void saveCommand(Map data) {
    try {
      isProcessing(true);
      CommandProvider().saveCommand(data).then((resp) {
        if (resp != "") {
          clearTextEditingControllers();
          isProcessing(false);

          showSnackBar("Add Command", "Command Added", Colors.green);
          lstCommand.clear();
          refreshList();
        } else {
          log('======FAILURE AFTER POSTING COMMAND ==> ' + resp.toString());
          showSnackBar("Add Command", "Failed to Add Command", Colors.red);
        }
      }, onError: (err) {
        isProcessing(false);
        showSnackBar("Error", err.toString(), Colors.red);
      });
    } catch (exception) {
      isProcessing(false);
      showSnackBar("Exception", exception.toString(), Colors.red);
    }
  }

  // Update Data
  void updateCommand(Map data) {
    try {
      isProcessing(true);
      CommandProvider().updateCommand(data).then((resp) {
        if (resp != "") {
          clearTextEditingControllers();
          isProcessing(false);

          showSnackBar("Edit Command", "Command Updated", Colors.green);
          lstCommand.clear();
          refreshList();
        } else {
          showSnackBar("Edit Command", "Command not Updated", Colors.red);
        }
      }, onError: (err) {
        isProcessing(false);
        showSnackBar("Error", err.toString(), Colors.red);
      });
    } catch (exception) {
      isProcessing(false);
      showSnackBar("Exception", exception.toString(), Colors.red);
    }
  }

  // Delete Data
  void deleteCommand(int id) {
    try {
      isProcessing(true);
      CommandProvider().deleteCommand(id).then((resp) {
        isProcessing(false);
        if (resp != "") {
          showSnackBar("Delete Command", "Command Deleted", Colors.green);
          lstCommand.clear();
          refreshList();
        } else {
          showSnackBar("Delete Command", "Command not Deleted", Colors.red);
        }
      }, onError: (err) {
        isProcessing(false);
        log('======ERROR AFTER POSTING COMMAND ==> ' + err.toString());
        showSnackBar("Error", err.toString(), Colors.red);
      });
    } catch (exception) {
      isProcessing(false);
      showSnackBar("Exception", exception.toString(), Colors.red);
    }
  }

  // clear the controllers
  void clearTextEditingControllers() {
    howToEditingController.clear();
    lineEditingController.clear();
    platformEditingController.clear();
  }

  @override
  void onClose() {
    // TODO: implement onClose
    super.onClose();
    scrollController.dispose();
    howToEditingController.dispose();
    lineEditingController.dispose();
    platformEditingController.dispose();
  }
}
