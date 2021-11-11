import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:gcms/app/modules/home/controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  @override
  Widget build(BuildContext context) {
    final homeController = Get.put(HomeController());
    return Scaffold(
      appBar: AppBar(
        title: Text('GCMS App'),
        actions: [
          IconButton(
              onPressed: () {
                controller.storage.write("isLoggedIn", false);
                Get.offAllNamed('/login');
              },
              icon: Icon(
                Icons.exit_to_app,
              ))
        ],
        //centerTitle: true,
      ),
      body: Obx(() {
        if (homeController.isDataProcessing.value == true) {
          return Center(
            child: CircularProgressIndicator(),
          );
        } else {
          if (homeController.lstCommand.length > 0) {
            return Container(
              padding: EdgeInsets.only(left: 16, right: 16, top: 8, bottom: 8),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Expanded(
                        child: Text(
                          'Commands List',
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
                      itemCount: controller.lstCommand.length,
                      itemBuilder: (BuildContext context, int index) {
                        if (index == controller.lstCommand.length - 1 &&
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
                                        controller.lstCommand[index]['howTo'],
                                        style: TextStyle(fontSize: 16),
                                      ),
                                      Text(controller.lstCommand[index]['line'],
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
                                        onTap: () {
                                          displayCommandTaskWindow(
                                            controller.lstCommand[index]['id'],
                                            controller.howToEditingController
                                                    .text =
                                                controller.lstCommand[index]
                                                    ['howTo'],
                                            controller.lineEditingController
                                                    .text =
                                                controller.lstCommand[index]
                                                    ['line'],
                                          );
                                        },
                                      ),
                                      SizedBox(
                                        height: 6,
                                      ),
                                      GestureDetector(
                                        child: Icon(
                                          Icons.delete,
                                          color: Colors.red,
                                        ),
                                        onTap: () {
                                          displayDeleteDialog(controller
                                              .lstCommand[index]['id']);
                                        },
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
                'Data not found',
                style: TextStyle(fontSize: 25),
              ),
            );
          }
        }
      }),
      floatingActionButton: FloatingActionButton.extended(
        label: Text('Add Command'),
        icon: Icon(Icons.add),
        onPressed: () {
          displayAddTaskWindow();
        },
      ),
    );
  }

  void displayAddTaskWindow() {
    Get.bottomSheet(
      Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.only(
            topRight: Radius.circular(16),
            topLeft: Radius.circular(16),
          ),
          color: Colors.white,
        ),
        child: Padding(
            padding: const EdgeInsets.only(left: 16, right: 16, top: 16),
            child: ListView(
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Add Command',
                      style:
                          TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                    ),
                    SizedBox(
                      height: 8,
                    ),
                    TextField(
                      decoration: InputDecoration(
                        labelText: 'How To',
                        hintText: 'How To',
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                      ),
                      controller: controller.howToEditingController,
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    TextField(
                      keyboardType: TextInputType.multiline,
                      decoration: InputDecoration(
                        labelText: 'Line',
                        hintText: 'line',
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                      ),
                      controller: controller.lineEditingController,
                    ),
                    SizedBox(
                      height: 8,
                    ),
                    TextField(
                      keyboardType: TextInputType.multiline,
                      decoration: InputDecoration(
                        labelText: 'Platform',
                        hintText: 'Platform',
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                      ),
                      controller: controller.platformEditingController,
                    ),
                    SizedBox(
                      height: 8,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Obx(() {
                          return ElevatedButton(
                            child: Text(controller.isProcessing.value == true
                                ? 'Processing'
                                : 'Save'),
                            onPressed: () {
                              if (controller.isProcessing.value == false) {
                                saveTask(
                                    controller.howToEditingController.text,
                                    controller.lineEditingController.text,
                                    controller.platformEditingController.text);
                              }
                            },
                          );
                        })
                      ],
                    )
                  ],
                ),
              ],
            )),
      ),
    );
  }

  void saveTask(String howTo, String line, String platform) {
    controller
        .saveCommand({'howTo': howTo, 'line': line, 'platform': platform});
    Get.back();
  }

  void displayCommandTaskWindow(int id, String howTo, String line) {
    Get.bottomSheet(
      Container(
        child: Padding(
            padding: const EdgeInsets.only(left: 16, right: 16, top: 16),
            child: ListView(
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Edit Command',
                      style:
                          TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                    ),
                    SizedBox(
                      height: 8,
                    ),
                    TextField(
                      decoration: InputDecoration(
                        labelText: 'How To',
                        hintText: 'How To',
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                      ),
                      controller: controller.howToEditingController,
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    TextField(
                      keyboardType: TextInputType.multiline,
                      decoration: InputDecoration(
                        labelText: 'Line',
                        hintText: 'Line',
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                      ),
                      controller: controller.lineEditingController,
                    ),
                    SizedBox(
                      height: 8,
                    ),
                    SizedBox(
                      height: 8,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Obx(() {
                          return ElevatedButton(
                            child: Text(
                                controller.isDataProcessing.value == true
                                    ? 'Processing'
                                    : 'Update'),
                            onPressed: () {
                              if (controller.isDataProcessing.value == false) {
                                updateCommand(
                                  id,
                                  controller.howToEditingController.text,
                                  controller.lineEditingController.text,
                                );
                              }
                            },
                          );
                        })
                      ],
                    )
                  ],
                ),
              ],
            )),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.only(
              topRight: Radius.circular(16),
              topLeft: Radius.circular(16),
            ),
            color: Colors.white),
      ),
    );
  }

  void updateCommand(int id, String howTo, String line) {
    controller.updateCommand({
      'id': id,
      'howTo': howTo,
      'line': line,
    });
    Get.back();
  }

  displayDeleteDialog(int id) {
    Get.defaultDialog(
      title: "Delete Command",
      titleStyle: TextStyle(fontSize: 20),
      middleText: 'Are you sure to delete command ?',
      textCancel: "Cancel",
      textConfirm: "Confirm",
      confirmTextColor: Colors.white,
      onCancel: () {},
      onConfirm: () {
        controller.deleteCommand(id);
        Get.back();
      },
    );
  }
}
