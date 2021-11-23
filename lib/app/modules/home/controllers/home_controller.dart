import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:gcms/app/modules/Notifications/views/notifications_view.dart';
import 'package:gcms/app/modules/SettingScreen/views/user_details_screen_view.dart';
import 'package:gcms/app/modules/commonWidgets/snackbar.dart';
import 'package:gcms/app/modules/home/providers/user_provider.dart';
import 'package:gcms/app/modules/home/views/explore_screen_view.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:jwt_decode/jwt_decode.dart';

import '../user_model.dart';

class HomeController extends GetxController {
  var selectedIndex = 0.obs;
  var name = ''.obs;
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
    // await checkIfUserFullyRegistered();
    Get.offAllNamed('/home');
  }

  @override
  void onClose() {
    // TODO: implement onClose
    super.onClose();
    name.value = '';
  }

  // checkIfUserFullyRegistered() {
  //   Map<String, dynamic> storedUser = jsonDecode(storage.read('user'));
  //   var usr = User.fromJson(storedUser);
  //   print("USER REG DETAILS   ===> ");
  //   if (usr.firstName == '' || usr.firstName == null) {
  //     //Call the reg screen here
  //     Get.to(UserDetailsScreenView());
  //   }
  // }

  isRegistered() {
    if (storage.read('user') == null) {
      Get.to(UserDetailsScreenView());
    }
  }

  validateTokenAndGetUser() async {
    String token = storage.read("accessToken");
    if (Jwt.isExpired(token)) {
      print("TOKEN IS EXPIRED --->${Jwt.getExpiryDate(token)}");
      await refreshToken({
        'accessToken': token.toString(),
        'refreshToken': storage.read("refreshToken").toString(),
      });
    }
    print("TOKEN ---> ${storage.read("accessToken")}");
    print(
        "TOKEN IS EXPIRING ON --->${Jwt.getExpiryDate(storage.read("accessToken"))}");
    Map<String, dynamic> tkn = Jwt.parseJwt('${storage.read("accessToken")}');
    print("DECODED TOKEN ---> $tkn");
    print("USER ID ---->${tkn['Id']}");
    storage.write("aspUserID", tkn['Id']);
    await getUserDetails(tkn['Id']);
    isProcessing(false);
    print("NAME ----> $name");
  }

  refreshToken(Map data) {
    print("DATA FOR REFRESHING TOKEN---------> $data");
    try {
      isProcessing(true);
      UserProvider().refreshToken(data).then((resp) async {
        print("TOKENS SUCCESSFULLY REFRESHED  ---> $resp");
        storage.write("accessToken", resp.info.accessToken);
        storage.write("refreshToken", resp.info.refreshToken);
        isProcessing(false);
      }, onError: (err) {
        print("Error refreshing tokens -->" + err.toString());
        ShowSnackBar("Error", err.toString(), Colors.red);
        isProcessing(false);
        Get.offAllNamed('/login');
      });
    } catch (exception) {
      print("Exception refreshing tokens -->" + exception.toString());
      ShowSnackBar("Exception", exception.toString(), Colors.red);
      isProcessing(false);
      Get.offAllNamed('/login');
    }
  }

  checkIfUserFullyRegistered() {
    Map<String, dynamic> storedUser = jsonDecode(storage.read('user'));
    var usr = User.fromJson(storedUser);
    if (usr.firstName == '' || usr.firstName == null) {
      //Call the reg screen here
    }
  }

  getUserDetails(String id) {
    try {
      isProcessing(true);
      UserProvider().getUserDetails(id).then((resp) async {
        print("USER DETAILS SUCCESSFULLY FETCHED  ---> $resp");
        storage.write("user", resp);
        Map<String, dynamic> storedUser = jsonDecode(storage.read('user'));
        var usr = User.fromJson(storedUser);
        if (usr.isBlank) {
          ShowSnackBar("USER DETAILS Error", "NO USER INFO FOUND", Colors.blue);
        }
        name.value = usr.firstName;
        print(
            "USER DETAILS RETRIEVED FROM MEMORY  ---> ${storage.read('user')}");
        isProcessing(false);
      }, onError: (err) {
        isProcessing(false);
        print("Error getting user details -->" + err.toString());
        ShowSnackBar("Error", err.toString(), Colors.red);
        Get.offAllNamed('/login');
      });
    } catch (exception) {
      isProcessing(false);
      print("Exception getting user details -->" + exception.toString());
      ShowSnackBar("Exception", exception.toString(), Colors.red);
      Get.offAllNamed('/login');
    }
  }
}
