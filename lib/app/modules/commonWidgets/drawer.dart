import 'package:flutter/material.dart';
import 'package:gcms/app/modules/home/controllers/home_controller.dart';
import 'package:gcms/constants/constant.dart';
import 'package:get/get.dart';

class GcmsDrawer extends StatelessWidget {
  final controller = Get.put(HomeController());
  GcmsDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: kBackgroundColor,
      // Add a ListView to the drawer. This ensures the user can scroll
      // through the options in the drawer if there isn't enough vertical
      // space to fit everything.
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          UserAccountsDrawerHeader(
            currentAccountPicture: CircleAvatar(
              backgroundImage:
                  NetworkImage("${controller.storage.read("profilePic")}"),
            ),
            accountEmail: Text(
              "${controller.storage.read("email")}",
              style: Theme.of(context).textTheme.bodyText1,
            ),
            accountName: Text(
              "${controller.storage.read(
                "name",
              )}",
              style: Theme.of(context).textTheme.bodyText1,
            ),
            decoration: BoxDecoration(
              color: kBackgroundColor,
            ),
          ),
          ListTile(
            leading: const Icon(Icons.house_outlined),
            title: Text(
              'Home',
              style: Theme.of(context).textTheme.bodyText1,
            ),
            onTap: () {
              Get.toNamed("/home");
            },
          ),
          ListTile(
            leading: const Icon(Icons.settings),
            title: Text(
              'Settings',
              style: Theme.of(context).textTheme.bodyText1,
            ),
            onTap: () {
              Get.toNamed("/setting-screen");
            },
          ),
          ListTile(
            leading: const Icon(Icons.notifications),
            title: Text(
              'Notifications',
              style: Theme.of(context).textTheme.bodyText1,
            ),
            onTap: () {
              Get.toNamed("/messages");
            },
          ),
        ],
      ),
    );
  }
}
