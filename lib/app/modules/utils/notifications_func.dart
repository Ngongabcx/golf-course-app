import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:gcms/app/modules/Notifications/controllers/notifications_controller.dart';
import 'package:gcms/app/modules/Notifications/providers/database/notifications_database.dart';
import 'package:gcms/app/services/local_notifications_service.dart';
import 'package:get/get.dart';

notifications() {
  print("==========NOTIFICATION FUNCTION CALLED=============");
  FirebaseMessaging.instance.getToken().then((token) {
    //we need to update user details with this token. This token doesnt change for a device
    print("<<<<<<=====------FIREBASE DEVICE TOKEN    ---->  $token");
  });
  //works when notification is opened whilst app is in terminated state
  FirebaseMessaging.instance.getInitialMessage().then((message) async {
    if (message != null) {
     await NotificationsDatabase.instance.updateNotification(message.messageId.toString());
      NotificationsController().refreshNotifications();
      final routeFromMessage = message.data["viewUri"];
      print(routeFromMessage);

      //We can push the notification to a specific view from here
      Get.toNamed("/$routeFromMessage");
    }
  });
  //Below line Only displays message when the app is in the foreground
  //Its a stream hence we have to listen (for messages)
  FirebaseMessaging.onMessage.listen((message) {
    if (message.notification != null) {}
    LocalNotificationsService.displayNotification(message);
  });
  //Below line only works when notofication has been tapped/open whilst the app is running in the background
  //Its also a stream hance we havr to listen
  FirebaseMessaging.onMessageOpenedApp.listen((message) async {
   await NotificationsDatabase.instance.updateNotification(message.messageId.toString());
    NotificationsController().refreshNotifications();
    final routeFromMessage = message.data["viewUri"];
    print(routeFromMessage);
    print("####PAYLOAD FROM API----> ${message.data["payload"]}");
    //We can push the notification to a specific view from here
    Get.toNamed("/$routeFromMessage");
  });
}
