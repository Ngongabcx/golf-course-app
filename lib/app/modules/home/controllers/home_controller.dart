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
    await validateToken();
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

  validateToken() async {
    if (storage.read("accessToken") != null) {
      String token = storage.read("accessToken");
      if (Jwt.isExpired(token)) {
        print("<------------TOKEN IS EXPIRED------------>");
        await refreshToken({
          'accessToken': token.toString(),
          'refreshToken': storage.read("refreshToken").toString(),
        });
      }
    } else {
       print("<------------TOKEN NOT FOUND IN STORAGE------------>");
      Get.offAllNamed('/login');
    }
    getUserDetails();
  }

  refreshToken(Map data) {
    try {
      isProcessing(true);
      UserProvider().refreshToken(data).then((resp) async {
        storage.write("accessToken", resp.info!.accessToken);
        storage.write("refreshToken", resp.info!.refreshToken);
        isProcessing(false);
      }, onError: (err) {
        isProcessing(false);
         print("<------------REFRESH TOKEN ERRORED: $err------------>");
        Get.offAllNamed('/login');
      });
    } catch (exception) {
      isProcessing(false);
      print("<------------REFRESH TOKEN EXCEPTION: $exception------------>");
      Get.offAllNamed('/login');
    }
  }

  Future getUserDetails() async {
    String id = storage.read("aspUserID");
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
        storage.write("profilePic", usr.imageThumbnail);
        storage.write("name", '${usr.fname} ${usr.lname}');
        storage.write("email", usr.aspNetUsers!.email);
        if (usr.aspNetUsers!.userName!.isEmpty) {
          ShowSnackBar(
              title: "USER DETAILS Error",
              message: "NO USER INFO FOUND",
              backgroundColor: Colors.blue);
          Get.toNamed("/login");
        }
        name.value = usr.fname!;
        var fcmToken = usr.fcmToken.toString();
        await processUserDeviceFcmToken(fcmToken, id);
        await getMatchInvites(usr.id.toString());
        isProcessing(false);
        //Get.offAllNamed('/home');
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
        print("GET MATCH INVITES RESPONSE  --> ${resp.toString()}");
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

  processUserDeviceFcmToken(String savedFcmToken, String id) {
    var deviceFcmToken = storage.read("fcmToken").toString();
    if (savedFcmToken != deviceFcmToken) {
      //Update fcm token in the db because device has changed
      var data = {
        "FcmToken": storage.read("fcmToken").toString(),
      };
      try {
        isProcessing(true);
        UserProvider().updateUserDetails(data, id).then((resp) async {
          isProcessing(false);
        }, onError: (err) {
          isProcessing(false);
          //SEND SLACK ERROR MESSAGE
        });
      } catch (exception) {
        isProcessing(false);
        //SEND SLACK EXCEPTION MESSAGE
      }
    }
  }
}
