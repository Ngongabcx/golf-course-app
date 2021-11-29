import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:gcms/app/modules/commonWidgets/loader/loader.dart';
import 'package:gcms/app/modules/commonWidgets/loader/loading_provider.dart';
import 'package:gcms/app/modules/home/controllers/greeting.dart';
import 'package:get/get.dart';
import 'package:gcms/app/modules/home/controllers/home_controller.dart';
import 'package:provider/src/provider.dart';

class HomeView extends GetView<HomeController> {
  @override
  Widget build(BuildContext context) {
    final _controller = Get.put(HomeController());
    return Scaffold(
      appBar: AppBar(
        title: Text(
          greeting(),
          style: TextStyle(
            fontSize: 23.0,
            fontWeight: FontWeight.w100,
            color: Colors.white,
          ),
        ),
        actions: [
          IconButton(
            icon: Icon(
              Icons.settings,
            ),
            onPressed: () {
              // do something
            },
          ),
          IconButton(
              onPressed: () {
                _controller.storage.erase();
                Get.offAllNamed('/login');
              },
              icon: Icon(
                Icons.exit_to_app,
              ))
        ],
        elevation: 0,
        //centerTitle: true,
      ),
      body: _controller.isProcessing.value == true
          ? Loader()
          : Obx(() {
              Future.delayed(Duration.zero, () async {
                context
                    .read<LoadingProvider>()
                    .setLoad(controller.isProcessing.value);
              });
              return HomeController.pages[_controller.selectedIndex.value];
            }),
      bottomNavigationBar: BottomNavigationBar(
        selectedItemColor: Theme.of(context).textSelectionTheme.selectionColor,
        currentIndex: controller.selectedIndex.value.toInt(),
        onTap: controller.onItemTapped,
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.explore),
            label: 'Explore',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.play_arrow),
            label: 'Match Invitations',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.notifications),
            label: 'Notifications',
          ),
        ],
      ),
    );
  }
}
