import 'package:flutter/material.dart';

import 'package:get/get.dart';

class NotificationDetailsView extends GetView {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('NotificationDetailsView'),
        centerTitle: true,
      ),
      body: Center(
        child: Text(  
          'NotificationDetailsView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
