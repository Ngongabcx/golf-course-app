import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:gcms/app/modules/ExploreScreen/views/explore_screen_view.dart';
import 'package:gcms/app/modules/Notifications/views/notifications_view.dart';
import 'package:gcms/app/modules/commonWidgets/snackbar.dart';
import 'package:gcms/app/modules/home/providers/user_provider.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:jwt_decode/jwt_decode.dart';

import '../user_model.dart';

class HomeController extends GetxController {
  var selectedIndex = 0.obs;
  String name = '';
  var storage = GetStorage();
  var isProcessing = false.obs;
  static List<Widget> pages = <Widget>[
    ExploreScreenView(),
    Container(color: Colors.white),
    NotificationsView(),
  ];
  @override
  void onInit() async {
    super.onInit();
    await validateTokenAndGetUser();
  }

  @override
  void onClose() {
    // TODO: implement onClose
    super.onClose();
    name = '';
  }

  validateTokenAndGetUser() async {
    // storage.write("accessToken", resp.info.accessToken);
    print("STORED TOKEN ======> ${storage.read("accessToken")}");
    String token = storage.read("accessToken");
    if (Jwt.isExpired(token)) {
      await refreshToken({
        'accessToken': '$token',
        'refreshToken': '${storage.read("refreshToken")}',
      });
    }
    print("TOKEN ---> ${storage.read("accessToken")}");
    Map<String, dynamic> tkn = Jwt.parseJwt('${storage.read("accessToken")}');
    print("DECODED TOKEN ---> $tkn");
    print("USER ID ---->${tkn['Id']}");
    await getUserDetails(tkn['Id']);
    Get.offAllNamed('/home');
  }

  refreshToken(Map data) {
    try {
      isProcessing(true);
      UserProvider().refreshToken(data).then((resp) async {
        isProcessing(false);
        print("TOKENS SUCCESSFULLY REFRESHED  ---> $resp");
        storage.write("accessToken", resp.info.accessToken);
        storage.write("refreshToken", resp.info.refreshToken);
      }, onError: (err) {
        isProcessing(false);
        print("Error refreshing tokens -->" + err.toString());
        ShowSnackBar("Error", err.toString(), Colors.red);
      });
    } catch (exception) {
      isProcessing(false);
      print("Exception refreshing tokens -->" + exception.toString());
      ShowSnackBar("Exception", exception.toString(), Colors.red);
    }
  }

  getUserDetails(String id) {
    try {
      isProcessing(true);
      UserProvider().getUserDetails(id).then((resp) async {
        isProcessing(false);
        print("USER DETAILS SUCCESSFULLY FETCHED  ---> $resp");
        //TODO: TRY TO SAVE THE USER RESPONSE AS A JSON OBJECT FOR EASY ACCESS --> (json.decode(resp))
        storage.write("user", resp);
         Map<String, dynamic> storedUser = jsonDecode(storage.read('user'));
        var usr = User.fromJson(storedUser);
        name = usr.firstName;
      }, onError: (err) {
        isProcessing(false);
        print("Error getting user details -->" + err.toString());
        ShowSnackBar("Error", err.toString(), Colors.red);
      });
    } catch (exception) {
      isProcessing(false);
      print("Exception getting user details -->" + exception.toString());
      ShowSnackBar("Exception", exception.toString(), Colors.red);
    }
  }
}
