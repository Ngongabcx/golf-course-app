import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:gcms/app/modules/Messages/controllers/messages_controller.dart';
import 'package:gcms/app/modules/Notifications/models/notification_model.dart';
import 'package:gcms/app/modules/Notifications/providers/database/notifications_database.dart';
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
        print("U R L is not EMPTY------------------------$viewUri");
        Get.toNamed("/$viewUri");
      } else {
        print("U R L is EMPTY------------------------");
        Get.defaultDialog(
            title: "Wehave successfully opend the dialog yipee!!");
      }
    });
  }

  static void displayNotification(RemoteMessage message) async {
    print("DISPLAY NOTIFICATION IN LOCAL NOTIFICATIONS FILE CALLED");
    print("NOTIFICATION DATA ---> ${message.data["details"]["viewUri"]}");
    //Save the notification to local db
    var notification = FCMNotification(
        isRead: false,
        messageId: message.messageId.toString(),
        title: message.data['title'],
        body: message.data['body'],
        createdTime: DateTime.now());
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
        payload: message.data["details"]["viewUri"],
      );
      await NotificationsDatabase.instance.create(notification);
      await MessagesController().refreshNotifications();
    } on Exception catch (e) {
      print("Exception when displaying notification  --> ${e.toString()}");
    }
  }
}
