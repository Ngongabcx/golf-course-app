import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:gcms/app/modules/SettingScreen/views/setting_screen_view.dart';
import 'package:gcms/app/modules/commonWidgets/loader/loader.dart';
import 'package:gcms/app/modules/commonWidgets/loader/loading_provider.dart';
import 'package:gcms/app/modules/home/controllers/greeting.dart';
import 'package:gcms/constants/constant.dart';

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
              Get.to(SettingScreenView());
            },
          ),
          // IconButton(
          //   onPressed: () {
          //     _controller.storage.erase();
          //     Get.offAllNamed('/login');
          //   },
          //   icon: Icon(
          //     Icons.exit_to_app,
          //   ),
          // ),
        ],
        elevation: 0,
        //centerTitle: true,
      ),
      drawer: Drawer(
        // Add a ListView to the drawer. This ensures the user can scroll
        // through the options in the drawer if there isn't enough vertical
        // space to fit everything.
        child: ListView(
          // Important: Remove any padding from the ListView.
          padding: EdgeInsets.zero,
          children: [
            DrawerHeader(
              decoration: BoxDecoration(
                color: kPrimaryColor,
              ),
              child: Text('Drawer Header'),
            ),
            ListTile(
              title: const Text('Item 1'),
              onTap: () {
                // Update the state of the app.
                // ...
              },
            ),
            ListTile(
              title: const Text('Item 2'),
              onTap: () {
                // Update the state of the app.
                // ...
              },
            ),
          ],
        ),
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
            icon: Icon(Icons.leaderboard),
            label: 'Leaderboard',
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
