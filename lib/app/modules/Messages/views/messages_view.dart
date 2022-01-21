import 'package:flutter/material.dart';
import 'package:gcms/app/modules/SettingScreen/views/setting_screen_view.dart';
import 'package:gcms/app/modules/commonWidgets/custom_appbar.dart';
import 'package:gcms/app/modules/commonWidgets/refresh_widget.dart';
import 'package:gcms/constants/constant.dart';
import 'package:get/get.dart';

import '../controllers/messages_controller.dart';

class MessagesView extends GetView<MessagesController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: kBackgroundColor,
        body: Obx(() {
          return controller.isProcessing.value == true
              ? Center(
                  child: CircularProgressIndicator(
                    color: kPrimaryColor,
                  ),
                )
              : controller.notificationsList.length > 0
                  ? Column(
                      children: [
                        CustomAppBar(
                          Icons.arrow_back_ios_outlined,
                          Icons.settings_outlined,
                          leftCallBack: () => Get.back(),
                          rightCallBack: () => Get.to(SettingScreenView()),
                        ),
                        Expanded(
                          child: Container(
                              padding: EdgeInsets.only(
                                  left: 16, right: 16, bottom: 8),
                              child: Expanded(
                                  child: RefreshWidget(
                                keyRefresh: controller.keyRefresh.value,
                                onRefresh: controller.refreshNotifications,
                                child: Obx(() {
                                  return ListView.builder(
                                      shrinkWrap: true,
                                      primary: false,
                                      itemCount:
                                          controller.notificationsList.length,
                                      itemBuilder:
                                          (BuildContext context, int index) {
                                        return Container(
                                            margin: EdgeInsets.only(bottom: 10),
                                            child: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.start,
                                              children: [
                                                Expanded(
                                                  child: CircleAvatar(
                                                    radius: 25,
                                                    backgroundColor:
                                                        Colors.teal,
                                                    child: Icon(
                                                      Icons.mail_outline,
                                                      color: Colors.white,
                                                    ),
                                                  ),
                                                ),
                                                SizedBox(
                                                  width: 4,
                                                ),
                                                Expanded(
                                                  flex: 4,
                                                  child: Column(
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .start,
                                                    children: [
                                                      Text(
                                                        controller
                                                            .notificationsList[
                                                                index]
                                                            .title,
                                                        style: TextStyle(
                                                          fontSize: 16,
                                                          color:
                                                              Colors.grey[600],
                                                        ),
                                                      ),
                                                      SizedBox(
                                                        height: 10.0,
                                                      ),
                                                      Text(
                                                        controller
                                                            .notificationsList[
                                                                index]
                                                            .body,
                                                        style: TextStyle(
                                                          fontSize: 14,
                                                        ),
                                                      ),
                                                      const SizedBox(
                                                        height: 25.0,
                                                        child: Divider(
                                                          color: Colors.grey,
                                                          thickness: 0.3,
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                              ],
                                            ));
                                      });
                                }),
                              ))),
                        ),
                      ],
                    )
                  : Center(
                      child: Text(
                        'No notifications',
                        style: TextStyle(fontSize: 20),
                      ),
                    );
        }),
        floatingActionButton: new FloatingActionButton(
            elevation: 0.0,
            child: new Icon(Icons.refresh),
            backgroundColor: kPrimaryColor,
            onPressed: controller.refreshNotifications));
  }
}
