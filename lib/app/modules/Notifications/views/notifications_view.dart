import 'package:flutter/material.dart';
import 'package:gcms/app/modules/commonWidgets/drawer.dart';
import 'package:gcms/app/modules/home/controllers/home_controller.dart';

import 'package:get/get.dart';

class NotificationsView extends GetView<HomeController> {
  final controller = Get.put(HomeController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: GcmsDrawer(),
      body: Obx(() {
        if (controller.isProcessing.value == true) {
          return Center(
            child: CircularProgressIndicator(),
          );
        } else {
          if (controller.notificationsList.length > 0) {
            return Container(
              padding: EdgeInsets.only(left: 16, right: 16, top: 8, bottom: 8),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Expanded(
                        child: Text(
                          'Notifications',
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: Colors.green,
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Expanded(
                    child: ListView.builder(
                      controller: controller.scrollController,
                      itemCount: controller.notificationsList.length,
                      itemBuilder: (BuildContext context, int index) {
                        if (index == controller.notificationsList.length - 1 &&
                            controller.isMoreDataAvailable.value == true) {
                          return Center(child: CircularProgressIndicator());
                        }
                        return Container(
                            margin: EdgeInsets.only(bottom: 20),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Expanded(
                                  child: CircleAvatar(
                                    radius: 25,
                                    backgroundColor: Colors.blue,
                                    child: Text(
                                      'C',
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontWeight: FontWeight.bold),
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
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        controller.notificationsList[index]
                                            ['title'],
                                        style: TextStyle(fontSize: 16),
                                      ),
                                      Text(
                                          controller.notificationsList[index]
                                              ['body'],
                                          style: TextStyle(
                                              fontSize: 14,
                                              color: Colors.grey[600])),
                                    ],
                                  ),
                                ),
                                SizedBox(
                                  width: 4,
                                ),
                                Expanded(
                                  flex: 1,
                                  child: Column(
                                    children: [
                                      GestureDetector(
                                        child: Icon(
                                          Icons.edit,
                                          color: Colors.green,
                                        ),
                                        onTap: () {},
                                      ),
                                      SizedBox(
                                        height: 6,
                                      ),
                                      GestureDetector(
                                        child: Icon(
                                          Icons.delete,
                                          color: Colors.red,
                                        ),
                                        onTap: () {},
                                      ),
                                    ],
                                  ),
                                )
                              ],
                            ));
                      },
                    ),
                  ),
                ],
              ),
            );
          } else {
            return Center(
              child: Text(
                'No notifications.',
                style: TextStyle(fontSize: 25),
              ),
            );
          }
        }
      }),
    );
  }
}
