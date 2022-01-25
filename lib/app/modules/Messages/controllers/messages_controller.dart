import 'package:flutter/material.dart';
import 'package:gcms/app/modules/Notifications/models/notification_model.dart';
import 'package:gcms/app/modules/Notifications/providers/database/notifications_database.dart';
import 'package:get/get.dart';

class MessagesController extends GetxController {
  var isProcessing = false.obs;
  final keyRefresh = GlobalKey<RefreshIndicatorState>().obs;
  var notificationsList = <FCMNotification>[].obs;
  @override
  Future<void> onInit() async {
    await refreshNotifications();
    print("NOTIFICATIONS ARRAY LENGTH  ---> ${notificationsList.length}");
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {}
  Future refreshNotifications() async {
    print("REFRESH NOTIFICATIONS CALLED.");
    keyRefresh.value.currentState?.show();
    await Future.delayed(Duration(milliseconds: 2000));
    isProcessing.value = true;
    notificationsList.clear();
    var notification =
        await NotificationsDatabase.instance.getAllNotifications();
    //notificationsList.addAll(notification);
    notificationsList.assignAll(notification);
    ever(notificationsList, (_) => notification);
    print("NOTIFICATION LIST LENGTH ======= " +
        notificationsList.length.toString());
    isProcessing.value = false;
  }

  // Insert a new notification to the database
  Future<void> addNotification({required FCMNotification notification}) async {
    await NotificationsDatabase.instance.create(notification);
    refreshNotifications();
  }

// Update an existing notification
  Future<void> updateNotification(
      {required FCMNotification notification}) async {
    await NotificationsDatabase.instance.update(notification);
    refreshNotifications();
  }

// Delete an notification
  void deleteNotification({required int id}) async {
    await NotificationsDatabase.instance.delete(id);
    // ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
    //   content: Text('Successfully deleted a journal!'),
    // ));
    refreshNotifications();
  }
}
