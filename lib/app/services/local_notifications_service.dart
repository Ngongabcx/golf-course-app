import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:get/get.dart';

class LocalNotificationsService {
  static final FlutterLocalNotificationsPlugin _notificationsPlugin =
      FlutterLocalNotificationsPlugin();

  static void initialize() {
    final InitializationSettings initializationSettings =
        InitializationSettings(
            android: AndroidInitializationSettings("@mipmap/ic_launcher"));

    _notificationsPlugin.initialize(initializationSettings,
        onSelectNotification: (String? viewUri) async {
      if (viewUri != null) {
        Get.toNamed("/$viewUri");
      }
    });
  }

  static void displayNotification(RemoteMessage message) async {
    try {
      final id = DateTime.now().millisecondsSinceEpoch ~/ 1000;

      final NotificationDetails notificationDetails = NotificationDetails(
          android: AndroidNotificationDetails(
        "gcmsApp",
        "gcmsApp channel",
        channelDescription: "this is gcms important notification channel",
        importance: Importance.high,
        priority: Priority.high,
      ));

      await _notificationsPlugin.show(
        id,
        message.data['title'],
        message.data['body'],
        notificationDetails,
        payload: message.data["viewUri"],
      );
    } on Exception catch (e) {
      print("Exception when displaying notification  --> ${e.toString()}");
    }
  }
}
