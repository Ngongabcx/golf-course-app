import 'package:flutter/material.dart';
import '../../SettingScreen/controllers/setting_screen_controller.dart';
import 'package:get/get.dart';
import '../../SettingScreen/views/buildUserDetails.dart';

class UserDetailsScreenView extends GetView {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'User Details',
          style: TextStyle(fontSize: 16.0),
        ),
        centerTitle: true,
      ),
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.height,
        padding: const EdgeInsets.all(20.0),
        child: BuildUserDetails(),
      ),
    );
  }
}
