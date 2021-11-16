import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:gcms/app/modules/ExploreScreen/views/explore_screen_view.dart';
import 'package:gcms/app/modules/Notifications/views/notifications_view.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class HomeController extends GetxController {
  var selectedIndex = 0.obs;

  static List<Widget> pages = <Widget>[
    ExploreScreenView(),
    Container(color: Colors.white),
    NotificationsView(),
  ];

  var storage = GetStorage();
  
  @override
  void onInit() async {
    super.onInit();
    //TODO: Check JWT Expiration, If expired refresh token and fetch user details
  }

  @override
  void onClose() {
    // TODO: implement onClose
    super.onClose();
  }
}
