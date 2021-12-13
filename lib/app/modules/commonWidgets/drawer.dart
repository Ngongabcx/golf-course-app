import 'package:flutter/material.dart';
import 'package:gcms/constants/constant.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';

class GcmsDrawer extends StatelessWidget {
  const GcmsDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      // Add a ListView to the drawer. This ensures the user can scroll
      // through the options in the drawer if there isn't enough vertical
      // space to fit everything.
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          const UserAccountsDrawerHeader(
            currentAccountPicture: CircleAvatar(
              backgroundImage: AssetImage('assets/images/Tiger-Woods.jpg'),
            ),
            accountEmail: Text('tiger.woods@example.com'),
            accountName: Text(
              'Tiger Woods',
              style: TextStyle(fontSize: 24.0),
            ),
            decoration: BoxDecoration(
              color: kPrimaryColor,
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
              'settings',
              style: Theme.of(context).textTheme.bodyText1,
            ),
            onTap: () {},
          ),
        ],
      ),
    );
  }
}
