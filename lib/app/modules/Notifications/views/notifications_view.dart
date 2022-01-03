import 'package:flutter/material.dart';
import 'package:gcms/app/modules/home/controllers/home_controller.dart';

import 'package:get/get.dart';

class NotificationsView extends GetView<HomeController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('NotificationsView'),
        centerTitle: true,
      ),
      body: Center(
        child: Text(
          'NotificationsView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
