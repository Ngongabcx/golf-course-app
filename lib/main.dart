import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:gcms/app/services/local_notifications_service.dart';
import 'package:gcms/theme/gcms_theme.dart';

import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import 'app/modules/Authentication/views/login_view.dart';
import 'app/modules/commonWidgets/loader/loading_widget.dart';
import 'app/modules/home/views/home_view.dart';
import 'app/routes/app_pages.dart';

//Receives notifications when app is in background
//This should always be a top level function i.e it shouldnt be in any class but rather outside the app scope
Future<void> notificationsBackgroundHandler(RemoteMessage message) async {
  print(message.data.toString());
  print(message.notification.title);
}

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  FirebaseMessaging.onBackgroundMessage(notificationsBackgroundHandler);
  await GetStorage.init();
  runApp(
    GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: "GCMS APP",
      home: GetStorage().read("isLoggedIn") == true ? HomeView() : LoginView(),
      // initialRoute: AppPages.INITIAL,
      getPages: AppPages.routes,
      builder: LoadingScreen.init(),
      theme: GcmsTheme.light(),
    ),
  );
}
