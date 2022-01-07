import 'package:flutter/material.dart';
import 'package:gcms/app/modules/Notifications/models/notification_model.dart';
import 'package:gcms/app/modules/Notifications/providers/database/notifications_database.dart';
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
  final keyRefresh = GlobalKey<RefreshIndicatorState>();
  var notificationsList = <FCMNotification>[].obs;
  ScrollController scrollController = ScrollController();
  var isMoreDataAvailable = false.obs;
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
    validateTokenAndGetUser();
  }

  @override
  void onClose() {
    super.onClose();
    name.value = '';
    NotificationsDatabase.instance.close();
  }

  void onItemTapped(int index) {
    switch (index) {
      case 0:
        Get.to(() => ExploreScreenView());
        break;
      case 1:
        Icon(Icons.note_add_outlined);
        break;
      case 2:
        Get.toNamed("/messages");
        break;
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
        // ShowSnackBar(
        //     title: "Error",
        //     message: err.toString(),
        //     backgroundColor: Colors.red);
        isProcessing(false);
        Get.offAllNamed('/login');
      });
    } catch (exception) {
      // ShowSnackBar(
      //     title: "Exception",
      //     message: exception.toString(),
      //     backgroundColor: Colors.red);
      isProcessing(false);
      Get.offAllNamed('/login');
    }
  }

  getUserDetails(String id) async {
    print("GETTING USER DETAILS   --> ID: $id");
    try {
      isProcessing(true);
      UserProvider().getUserDetails(id).then((resp) async {
        print("RETURNED USER DETAILS --> ${resp.toString()}");
        storage.write("user", resp);
        var usrPayload = userFromJson(storage.read('user'));
        var usr = usrPayload.payload!.first;
        storage.write("userId", usr.id.toString());
        storage.write("hcp", usr.hcp!.toInt());
        storage.write("username", usr.aspNetUsers!.userName.toString());
        storage.write(
            "name", usr.fname.toString() + " " + usr.lname.toString());
        storage.write("profilePic", usr.image);
        await getMatchInvites(usr.id.toString());
        if (usr.aspNetUsers!.userName!.isEmpty) {
          ShowSnackBar(
              title: "USER DETAILS Error",
              message: "NO USER INFO FOUND",
              backgroundColor: Colors.blue);
          Get.toNamed("/login");
        }
        name.value = usr.fname!;
        isProcessing(false);
        Get.offAllNamed('/home');
      }, onError: (err) {
        isProcessing(false);
        ShowSnackBar(
            title: "Get User Error",
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
    print("GET MATCH INVITES ----> ID: $id");
    try {
      isProcessing(true);
      await MatchInvitesProvider().getMatchInvites(id).then((resp) async {
        print("GET MACTH INVITES RESPONSE  --> ${resp.toString()}");
        matchInvites.value = resp;
        isProcessing(false);
      }, onError: (err) {
        print("GET MATCH INVITES ERROR --> $err");
        matchInvites.value = Competition(
            status: 404,
            success: false,
            message: "No Invitations",
            error: "",
            payload: []);
        //matchInvites.value = err;
        // ShowSnackBar(
        //     title: "Match Invites Error",
        //     message: err.toString(),
        //     backgroundColor: Colors.red);
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
}
