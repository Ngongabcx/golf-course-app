import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controllers/health_controller.dart';

class HealthView extends GetView<HealthController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        iconTheme: const IconThemeData(color: Colors.black),
        automaticallyImplyLeading: true,
        title: Text(
          ' Health',
          style: Theme.of(context).textTheme.headline3,
        ),
        actions: [],
        centerTitle: true,
        elevation: 4,
      ),
      body: Center(
        child: Text(
          'HealthView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
