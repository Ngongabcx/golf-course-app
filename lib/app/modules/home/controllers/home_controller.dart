import 'dart:convert';

import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
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
  var selectedIndex = 0.obs;
  var name = ''.obs;
  var storage = GetStorage();
  var isProcessing = false.obs;
  var matchInvites = Competition().obs;
  static List<Widget> pages = <Widget>[
    ExploreScreenView(),
    NotificationsView(),
  ];
  @override
  void onInit() async {
    super.onInit();
    LocalNotificationsService.initialize();
    await validateTokenAndGetUser();
    // await checkIfUserFullyRegistered();
    notifications();
    Get.offAllNamed('/home');
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

  notifications() {
    print("==========NOTIFICATION FUNCTION CALLED=============");
    //works when notification is opened whilst app is in terminated state
    FirebaseMessaging.instance.getInitialMessage().then((message) {
      if (message != null) {
        final routeFromMessage = message.data["viewUri"];
        print(routeFromMessage);
        //We can push the notification to a specific view from here
        Get.toNamed("/$routeFromMessage");
      }
    });
    //Below line Only displays message when the app is in the foreground
    //Its a stream hence we have to listen (for messages)
    FirebaseMessaging.onMessage.listen((message) {
      if (message.notification != null) {
        print(message.notification!.body);
        print(message.notification!.title);
      }
      LocalNotificationsService.displayNotification(message);
    });
    //Below line only works when notofication has been tapped/open whilst the app is running in the background
    //Its also a stream hance we havr to listen
    FirebaseMessaging.onMessageOpenedApp.listen((message) {
      final routeFromMessage = message.data["viewUri"];
      print(routeFromMessage);
      //We can push the notification to a specific view from here
      Get.toNamed("/$routeFromMessage");
    });
  }

  isRegistered() {
    if (storage.read('user') == null) {
      Get.to(UserDetailsScreenView());
    }
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
    await getUserDetails(tkn['Id']);
    isProcessing(false);
  }

  refreshToken(Map data) {
    try {
      isProcessing(true);
      UserProvider().refreshToken(data).then((resp) async {
        storage.write("accessToken", resp.info!.accessToken);
        storage.write("refreshToken", resp.info!.refreshToken);
        isProcessing(false);
      }, onError: (err) {
        ShowSnackBar("Error", err.toString(), Colors.red);
        isProcessing(false);
        Get.offAllNamed('/login');
      });
    } catch (exception) {
      ShowSnackBar("Exception", exception.toString(), Colors.red);
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
          ShowSnackBar("USER DETAILS Error", "NO USER INFO FOUND", Colors.blue);
        }
        name.value = usr.firstName!;
        isProcessing(false);
      }, onError: (err) {
        isProcessing(false);
        ShowSnackBar("Error", err.toString(), Colors.red);
        Get.offAllNamed('/login');
      });
    } catch (exception) {
      isProcessing(false);
      ShowSnackBar("Exception", exception.toString(), Colors.red);
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
        ShowSnackBar("Error", err.toString(), Colors.red);
        isProcessing(false);
      });
    } catch (exception) {
      ShowSnackBar("Exception", exception.toString(), Colors.red);
      isProcessing(false);
    }
  }
}
