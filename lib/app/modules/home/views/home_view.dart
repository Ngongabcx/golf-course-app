import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:gcms/app/modules/home/controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
   void _onItemTapped(int index) {
     controller.selectedIndex = index as RxInt;
  }
  @override
  Widget build(BuildContext context) {
    final homeController = Get.put(HomeController());
    return Scaffold(
      appBar: AppBar(
        title: Text('GCMS App'),
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
                controller.storage.write("isLoggedIn", false);
                Get.offAllNamed('/login');
              },
              icon: Icon(
                Icons.exit_to_app,
              ))
        ],
        //centerTitle: true,
      ),
      body: HomeController.pages[homeController.selectedIndex.toInt()],
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
