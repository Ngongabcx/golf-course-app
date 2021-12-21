import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:gcms/app/modules/Notifications/controllers/notifications_controller.dart';
import 'package:gcms/app/modules/Notifications/providers/sql_helper.dart';
import 'package:gcms/app/services/notifications_func.dart';
import 'package:gcms/app/modules/Authentication/views/user_details_screen_view.dart';
import 'package:gcms/app/modules/Notifications/views/notifications_view.dart';
import 'package:gcms/app/modules/SetupScreen/competition_model.dart';
import 'package:gcms/app/modules/commonWidgets/snackbar.dart';
import 'package:gcms/app/modules/home/providers/match_invites_provider.dart';
import 'package:gcms/app/modules/home/providers/user_provider.dart';
import 'package:gcms/app/modules/home/views/explore_screen_view.dart';
import 'package:gcms/app/services/local_notifications_service.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:jwt_decode/jwt_decode.dart';

import '../user_model.dart';

class HomeController extends GetxController {
  var notificationsList = List<Map<String, dynamic>>.empty(growable: true).obs;
  ScrollController scrollController = ScrollController();
  var isMoreDataAvailable = true.obs;
  var selectedIndex = 0.obs;
  var name = ''.obs;
  var storage = GetStorage();
  var isProcessing = false.obs;
  var matchInvites = Competition().obs;
  static List<Widget> pages = <Widget>[
    ExploreScreenView(),
    Icon(Icons.note_add_outlined),
    NotificationsView(),
  ];
  @override
  void onInit() async {
    super.onInit();
    LocalNotificationsService.initialize();
    notifications();
    validateTokenAndGetUser();
    await refreshNotifications();
    print("NOTIFICATIONS ARRAY OBS  ---> $notificationsList");
  }

  @override
  void onClose() {
    // TODO: implement onClose
    super.onClose();
    name.value = '';
  }

  void onItemTapped(int index) {
    selectedIndex.value = index;
  }

  validateTokenAndGetUser() async {
    String token = storage.read("accessToken");
    if (Jwt.isExpired(token)) {
      await refreshToken({
        'accessToken': token.toString(),
        'refreshToken': storage.read("refreshToken").toString(),
      });
    }
    Map<String, dynamic> tkn = Jwt.parseJwt('${storage.read("accessToken")}');
    storage.write("aspUserID", tkn['Id']);
    getUserDetails(tkn['Id']);
  }

  refreshToken(Map data) {
    try {
      isProcessing(true);
      UserProvider().refreshToken(data).then((resp) async {
        storage.write("accessToken", resp.info!.accessToken);
        storage.write("refreshToken", resp.info!.refreshToken);
        isProcessing(false);
      }, onError: (err) {
        ShowSnackBar(
            title: "Error",
            message: err.toString(),
            backgroundColor: Colors.red);
        isProcessing(false);
        Get.offAllNamed('/login');
      });
    } catch (exception) {
      ShowSnackBar(
          title: "Exception",
          message: exception.toString(),
          backgroundColor: Colors.red);
      isProcessing(false);
      Get.offAllNamed('/login');
    }
  }

  getUserDetails(String id) async {
    try {
      isProcessing(true);
      UserProvider().getUserDetails(id).then((resp) async {
        storage.write("user", resp);
        Map<String, dynamic> storedUser = jsonDecode(storage.read('user'));
        var usr = User.fromJson(storedUser);
        if (usr.id.toString().isEmpty) {
          Get.to(UserDetailsScreenView());
        }
        storage.write("userId", usr.id.toString());
        storage.write("hcp", usr.hcp!.toInt());
        storage.write(
            "name", usr.firstName.toString() + " " + usr.lastName.toString());
        storage.write("profilePic", usr.image);
        await getMatchInvites(usr.id.toString());
        if (usr.username!.isEmpty) {
          ShowSnackBar(
              title: "USER DETAILS Error",
              message: "NO USER INFO FOUND",
              backgroundColor: Colors.blue);
          Get.toNamed("/login");
        }
        name.value = usr.firstName!;
        isProcessing(false);
        Get.offAllNamed('/home');
      }, onError: (err) {
        isProcessing(false);
        ShowSnackBar(
            title: "Error",
            message: err.toString(),
            backgroundColor: Colors.red);
        Get.offAllNamed('/login');
      });
    } catch (exception) {
      isProcessing(false);
      ShowSnackBar(
          title: "Exception",
          message: exception.toString(),
          backgroundColor: Colors.red);
      Get.offAllNamed('/login');
    }
  }

  getMatchInvites(String id) async {
    try {
      isProcessing(true);
      await MatchInvitesProvider().getMatchInvites(id).then((resp) async {
        matchInvites.value = resp;
        isProcessing(false);
      }, onError: (err) {
        ShowSnackBar(
            title: "Error",
            message: err.toString(),
            backgroundColor: Colors.red);
        isProcessing(false);
      });
    } catch (exception) {
      ShowSnackBar(
          title: "Exception",
          message: exception.toString(),
          backgroundColor: Colors.red);
      isProcessing(false);
    }
  }

  static refreshNotifications() async {
    print("REFRESH NOTIFICATIONS CALLED.");
    var notes = await SQLHelper.getNotifications();
    HomeController().notificationsList.addAll(notes);
  }

// Insert a new notification to the database
  static Future<void> addNotification(
      {required String title, required String body, required messageId}) async {
    await SQLHelper.createNotification(
        body: body, title: title, messageId: messageId);
    refreshNotifications();
  }

// Update an existing notification
  static Future<void> updateNotification({required String messageId}) async {
    await SQLHelper.updateNotification(messageId);
    refreshNotifications();
  }

// Delete an notification
  static void deleteNotification({required String messageId}) async {
    await SQLHelper.deleteNotification(messageId: messageId);
    // ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
    //   content: Text('Successfully deleted a journal!'),
    // ));
    refreshNotifications();
  }
}
