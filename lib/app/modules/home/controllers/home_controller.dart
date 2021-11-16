import 'package:flutter/material.dart';
import 'package:gcms/app/modules/ExploreScreen/views/explore_screen_view.dart';
import 'package:gcms/app/modules/Notifications/views/notifications_view.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:jwt_decode/jwt_decode.dart';

class HomeController extends GetxController {
  var selectedIndex = 0.obs;
  String name = '';

  static List<Widget> pages = <Widget>[
    ExploreScreenView(),
    Container(color: Colors.white),
    NotificationsView(),
  ];

  var storage = GetStorage();

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

  validateTokenAndGetUser() {
    // storage.write("accessToken", resp.info.accessToken);
    print("STORED TOKEN ======> ${storage.read("accessToken")}");
    String token = storage.read("accessToken");
    if (Jwt.isExpired(token)) {
      //TODO: REFRESH THE TOKEN AND OVERWRITE STORED VALUES IN GETSTORAGE
    }
    print("TOKEN ---> $token");
    Map<String, dynamic> tkn = Jwt.parseJwt(token);
    name = tkn['email'];
    print("DECODED TOKEN ---> $tkn");
    print("USER ID ---->${tkn['Id']}");
  }
}
