import 'package:flutter/material.dart';
import 'package:gcms/app/modules/commonWidgets/refresh_widget.dart';
import 'package:gcms/constants/constant.dart';
import 'package:get/get.dart';

import '../controllers/messages_controller.dart';

class MessagesView extends GetView<MessagesController> {
  final controller = Get.put(MessagesController());
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
                                            //margin: EdgeInsets.only(bottom: 10),
                                            child: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.start,
                                              children: [
                                                Expanded(
                                                  child: CircleAvatar(
                                                    radius: 20,
                                                    backgroundColor:
                                                        Colors.transparent,
                                                    child: Icon(
                                                      Icons.mail_outline,
                                                      color: kPrimaryColor,
                                                    ),
                                                  ),
                                                ),
                                                Expanded(
                                                  flex: 6,
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
                                                              Colors.black54,
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
            child: new Icon(Icons.refresh,color: kPrimaryColor,),
            backgroundColor: Colors.transparent,
            onPressed: controller.refreshNotifications));
  }
}
