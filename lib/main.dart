import 'package:flutter/material.dart';
import 'package:gcms/theme/gcms_theme.dart';

import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import 'app/modules/Authentication/views/login_view.dart';
import 'app/modules/home/views/home_view.dart';
import 'app/routes/app_pages.dart';

void main() async {
  await GetStorage.init();
  runApp(
    GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: "GCMS APP",
      home: GetStorage().read("isLoggedIn") == true ? HomeView() : LoginView(),
      // initialRoute: AppPages.INITIAL,
      getPages: AppPages.routes,
      theme: GcmsTheme.light(),
    ),
  );
}
