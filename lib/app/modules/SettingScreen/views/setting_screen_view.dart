import 'package:flutter/material.dart';
import 'package:gcms/app/modules/Notifications/views/notifications_view.dart';
import 'package:gcms/app/modules/SettingScreen/views/user_details_screen_view.dart';
import 'package:settings_ui/settings_ui.dart';
import 'package:get/get.dart';
import '../controllers/setting_screen_controller.dart';

class SettingScreenView extends GetView<SettingScreenController> {
  bool _toggled = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(
            'Settings',
            style: TextStyle(fontSize: 16.0),
          ),
          centerTitle: true,
        ),
        body: SettingsList(
          sections: [
            SettingsSection(
              title: 'Account Setting',
              titlePadding: EdgeInsets.all(10.0),
              tiles: [
                SettingsTile(
                  title: 'Your Account',
                  subtitle: 'Add your account details here',
                  leading: Icon(Icons.account_circle_outlined),
                  onPressed: (BuildContext context) {
                    Get.to(() => UserDetailsScreenView());
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
                  leading: Icon(Icons.notifications_none_outlined),
                  onPressed: (BuildContext context) {
                    Get.to(NotificationsView());
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
                  leading: Icon(Icons.settings_brightness),
                  onPressed: (BuildContext context) {},
                ),
              ],
            ),
            SettingsSection(
              title: 'Security',
              titlePadding: EdgeInsets.all(10.0),
              tiles: [
                SettingsTile(
                  title: 'Fingerprint',
                  subtitle: 'Use fingerprint',
                  leading: Icon(Icons.fingerprint),
                  onPressed: (BuildContext context) {},
                ),
                SettingsTile(
                  title: 'Face ID',
                  subtitle: 'Use face Id',
                  leading: Icon(Icons.camera_alt_outlined),
                  onPressed: (BuildContext context) {},
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
                  leading: Icon(Icons.more_horiz_outlined),
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
                  leading: Icon(Icons.exit_to_app),
                  onPressed: (BuildContext context) {
                    Get.offAllNamed('/login');
                  },
                ),
              ],
            ),
          ],
        ));
  }
}
