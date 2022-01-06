import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:gcms/app/modules/Messages/controllers/messages_controller.dart';
import 'package:gcms/app/modules/Notifications/providers/database/notifications_database.dart';
import 'package:gcms/app/modules/commonWidgets/snackbar.dart';
import 'package:gcms/app/services/local_notifications_service.dart';
import 'package:gcms/constants/constant.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

notifications() {
  print("==========NOTIFICATION FUNCTION CALLED=============");
  FirebaseMessaging.instance.getToken().then((token) {
    //we need to update user details with this token. This token doesnt change for a device
    print("<<<<<<=====------FIREBASE DEVICE TOKEN    ---->  $token");
    var storage = GetStorage();
    storage.write("fcmToken", token);
    print(
        "<<<<<<=====------FIREBASE DEVICE TOKEN  IN STORAGE  ---->  ${storage.read("fcmToken")}");
  });
  //works when notification is opened whilst app is in terminated state
  FirebaseMessaging.instance.getInitialMessage().then((message) async {
    if (message != null) {
      await NotificationsDatabase.instance
          .updateNotification(message.messageId.toString());
      MessagesController().refreshNotifications();
      final routeFromMessage = message.data["viewUri"];
      final confirmScore = message.data["isConfirmScore"];
      print(routeFromMessage);
      print("IS CONFIRM SCORE valuE FRom MESSAGE Data -----> $routeFromMessage");

      //We can push the notification to a specific view from here
      if (confirmScore) {
        ShowSnackBar(
            title: message.data["title"],
            message: message.data["body"],
            backgroundColor: kPrimaryColor);
        Get.defaultDialog(
            title: "Confirm Score",
            content: message.data["body"],
            textConfirm: "Confirm",
            textCancel: "Decline",
            onConfirm: () {
              //Call api to update scores
              ShowSnackBar(
                  title: "Success",
                  message:
                      'Confirmation successful. Your score has been commited',
                  backgroundColor: Colors.green);
            },
            onCancel: () {
              //Call api to correct scores
              ShowSnackBar(
                  title: "Desclined",
                  message: 'We have sent back your scores for correction.',
                  backgroundColor: Colors.red);
            });
      } else {
        Get.toNamed("/$routeFromMessage");
      }
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
    await NotificationsDatabase.instance
        .updateNotification(message.messageId.toString());
    MessagesController().refreshNotifications();
    final routeFromMessage = message.data["viewUri"];
      final confirmScore = message.data["isConfirmScore"];
      print(routeFromMessage);
      print("IS CONFIRM SCORE valuE FRom MESSAGE Data -----> $routeFromMessage");
    if (confirmScore) {
      ShowSnackBar(
          title: message.data["title"],
          message: message.data["body"],
          backgroundColor: kPrimaryColor);

      Get.defaultDialog(
          title: "Confirm Score",
          content: message.data["body"],
          textConfirm: "Confirm",
          textCancel: "Decline",
          onConfirm: () {
            //Call api to update scores
            ShowSnackBar(
                title: "Success",
                message:
                    'Confirmation successful. Your score has been commited',
                backgroundColor: Colors.green);
          },
          onCancel: () {
            //Call api to correct scores
            ShowSnackBar(
                title: "Desclined",
                message: 'We have sent back your scores for correction.',
                backgroundColor: Colors.red);
          });
    } else {
      Get.toNamed("/$routeFromMessage");
    }
  });
}
