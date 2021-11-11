import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/notifications_controller.dart';

class NotificationsView extends GetView<NotificationsController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: SafeArea(
          child: Container(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.height,
            padding: const EdgeInsets.all(20.0),
            child: const Center(
              child: Icon(
                Icons.notifications,
                color: Color(0xFF9C9D9E),
                size: 150,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
