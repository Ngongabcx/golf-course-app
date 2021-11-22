import 'package:flutter/material.dart';
import 'package:gcms/app/modules/SettingScreen/views/user_details_screen_view.dart';

import 'package:get/get.dart';

import '../controllers/setting_screen_controller.dart';

class SettingScreenView extends GetView<SettingScreenController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'SettingScreenView',
          style: Theme.of(context).textTheme.headline3,
        ),
        centerTitle: true,
      ),
      body: Center(
        child: GestureDetector(
          onTap: (() {
            Get.to(UserDetailsScreenView());
          }),
          child: Text(
            'user data',
            style: TextStyle(fontSize: 20),
          ),
        ),
      ),
    );
  }
}
