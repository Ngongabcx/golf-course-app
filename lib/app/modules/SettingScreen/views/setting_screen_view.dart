import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:gcms/app/modules/Messages/views/messages_view.dart';
import 'package:gcms/bcx_icons_icons.dart';
import 'package:gcms/constants/constant.dart';
import 'package:get/get.dart';
import 'package:settings_ui/settings_ui.dart';

import '../controllers/setting_screen_controller.dart';
import 'edit_login_details_view.dart';
import 'edit_user_details_view.dart';

class SettingScreenView extends GetView<SettingScreenController> {
  // final AuthenticationController bioController = Get.find();
  final _controller = Get.put(SettingScreenController());

  //bool _toggled = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kBackgroundColor,
      appBar: AppBar(
        iconTheme: const IconThemeData(color: Colors.black),
        backgroundColor: kBackgroundColor,
        elevation: 0.0,
      ),
      body: Column(
        children: [
          Expanded(
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 25.0),
              child: SettingsList(
                backgroundColor: kBackgroundColor,
                sections: [
                  SettingsSection(
                    title: 'Account',
                    titlePadding: EdgeInsets.all(10.0),
                    tiles: [
                      SettingsTile(
                        title: 'User Details',
                        subtitle: 'User Details',
                        leading: Icon(
                          Icons.account_circle_outlined,
                          color: Colors.black,
                        ),
                        onPressed: (BuildContext context) {
                          Get.to(() => EditUserDetailsView());
                        },
                      ),
                      SettingsTile(
                        title: 'Password',
                        subtitle: 'Edit Password',
                        leading: Icon(
                          Icons.password_outlined,
                          color: Colors.black,
                        ),
                        onPressed: (BuildContext context) {
                          Get.to(() => EditLoginDetailsView());
                        },
                      ),
                    ],
                  ),
                  SettingsSection(
                    title: 'Notifications',
                    titlePadding: EdgeInsets.all(10.0),
                    tiles: [
                      SettingsTile(
                        title: 'Notifications',
                        subtitle: 'Get updates on whats going on',
                        leading: Icon(
                          Icons.notifications_none_outlined,
                          color: Colors.black,
                        ),
                        onPressed: (BuildContext context) {
                          Get.to(() => MessagesView());
                        },
                      ),
                    ],
                  ),
                  SettingsSection(
                    title: 'Appearance',
                    titlePadding: EdgeInsets.all(10.0),
                    tiles: [
                      SettingsTile(
                        title: 'Appearance',
                        subtitle: 'Change to light mode or dark mode',
                        leading: Icon(
                          FontAwesomeIcons.moon,
                          color: Colors.black,
                        ),
                        onPressed: (BuildContext context) {},
                      ),
                    ],
                  ),
                  SettingsSection(
                    title: 'Biometrics and Security',
                    titlePadding: EdgeInsets.all(10.0),
                    tiles: [
                      SettingsTile(
                        title: 'Fingerprint',
                        subtitle: 'Use fingerprint',
                        leading: Icon(
                          Icons.fingerprint,
                          color: Colors.black,
                        ),
                        enabled:
                            _controller.storage.read("hasFingerPrintLock") ??
                                false,
                        onPressed: (BuildContext context) {
                          _controller.biometricsSecurity();
                        },
                      ),
                      SettingsTile(
                        title: 'Face ID',
                        subtitle: 'Use face Id',
                        leading: Icon(
                          BcxIcons.face_id,
                          color: Colors.black,
                          size: 30.0,
                        ),
                        enabled:
                            _controller.storage.read("hasFaceLock") ?? false,
                        onPressed: (BuildContext context) {
                          _controller.biometricsSecurity();
                        },
                      ),
                    ],
                  ),
                  SettingsSection(
                    title: 'Additional Resources',
                    titlePadding: EdgeInsets.all(10.0),
                    tiles: [
                      SettingsTile(
                        title: 'Additional Resources',
                        subtitle: 'Review other places for helpful information',
                        leading: Icon(
                          Icons.more_horiz_outlined,
                          color: Colors.black,
                        ),
                        onPressed: (BuildContext context) {},
                      ),
                    ],
                  ),
                  SettingsSection(
                    title: 'Sign Out',
                    titlePadding: EdgeInsets.all(10.0),
                    tiles: [
                      SettingsTile(
                        title: 'Sign Out',
                        subtitle: 'Leave the application',
                        leading: Icon(
                          Icons.exit_to_app,
                          color: Colors.black,
                        ),
                        onPressed: (BuildContext context) {
                          _controller.storage.erase();
                          Get.offAllNamed('/login');
                        },
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
