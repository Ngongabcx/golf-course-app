import 'package:flutter/material.dart';
import 'package:gcms/app/modules/SettingScreen/views/setting_screen_view.dart';
import 'package:gcms/app/modules/commonWidgets/drawer.dart';
import 'package:gcms/app/modules/commonWidgets/loader/loader.dart';
import 'package:gcms/app/modules/home/controllers/greeting.dart';
import 'package:gcms/app/modules/home/controllers/home_controller.dart';
import 'package:gcms/constants/constant.dart';
import 'package:get/get.dart';

class HomeView extends GetView<HomeController> {
  final _controller = Get.put(HomeController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kBackgroundColor,
      appBar: AppBar(
        backgroundColor: kBackgroundColor,
        iconTheme: const IconThemeData(color: Colors.black),
        title: Text(
          greeting(),
          style: TextStyle(
            fontSize: 23.0,
            fontWeight: FontWeight.w100,
            color: Colors.black,
          ),
        ),
        actions: [
          IconButton(
            icon: Icon(
              Icons.settings_outlined,
            ),
            onPressed: () {
              // do something
              Get.to(SettingScreenView());
            },
          ),
        ],
        elevation: 0,
        //centerTitle: true,
      ),
      drawer: GcmsDrawer(),
      body: Obx(() {
        return SizedBox(
            child: _controller.isProcessing.value == true
                ? Loader()
                : HomeController.pages[_controller.selectedIndex.value]);
      }),
      bottomNavigationBar: BottomNavigationBar(
        selectedItemColor: Theme.of(context).textSelectionTheme.selectionColor,
        currentIndex: controller.selectedIndex.value.toInt(),
        onTap: controller.onItemTapped,
        items: <BottomNavigationBarItem>[
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
