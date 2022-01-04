import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:gcms/theme/gcms_theme.dart';

import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import 'app/modules/Authentication/views/login_view.dart';
import 'app/modules/home/views/home_view.dart';
import 'app/modules/utils/notifications_func.dart';
import 'app/routes/app_pages.dart';
import 'app/services/local_notifications_service.dart';

//Receives notifications when app is in background
//This should always be a top level function i.e it shouldn't be in any class but rather outside the app scope
Future<void> notificationsBackgroundHandler(RemoteMessage message) async {
  print(message.data.toString());
  // print(message.notification!.title);
  LocalNotificationsService.displayNotification(message);
}

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  await FirebaseMessaging.instance.subscribeToTopic('all');
  FirebaseMessaging.onBackgroundMessage(notificationsBackgroundHandler);
  await GetStorage.init();
  await SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);
  notifications();
  runApp(
    GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: "GCMS APP",
      home: GetStorage().read("isLoggedIn") == true ? HomeView() : LoginView(),
      //  initialRoute: AppPages.INITIAL,
      getPages: AppPages.routes,
      theme: GcmsTheme.light(),
    ),
  );
}
