import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:gcms/app/modules/home/controllers/greeting.dart';
import 'package:get/get.dart';
import 'package:gcms/app/modules/home/controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  void _onItemTapped(int index) {
    controller.selectedIndex.value = index;
  }

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
              Get.toNamed('/setting-screen');
            },
          ),
          IconButton(
              onPressed: () {
                controller.storage.erase();
                Get.offAllNamed('/login');
              },
              icon: Icon(
                Icons.exit_to_app,
              ))
        ],
        elevation: 0,
        //centerTitle: true,
      ),
      body: HomeController.pages[_controller.selectedIndex.value],
      bottomNavigationBar: BottomNavigationBar(
        selectedItemColor: Theme.of(context).textSelectionTheme.selectionColor,
        currentIndex: controller.selectedIndex.toInt(),
        onTap: _onItemTapped,
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.explore),
            label: 'Explore',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.play_arrow),
            label: 'Join Match',
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
