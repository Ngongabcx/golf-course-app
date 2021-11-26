import 'package:flutter/material.dart';
import 'package:gcms/app/modules/commonWidgets/customButton.dart';
import 'package:gcms/app/modules/commonWidgets/search_card.dart';
import 'package:gcms/tempModels/competetion.dart';
import 'package:gcms/theme/gcms_theme.dart';

import 'package:get/get.dart';

import '../controllers/join_match_screen_controller.dart';
import 'match_details_card.dart';

class MatchInvitesScreenView extends GetView<MatchInvitesController> {
  final loginController = Get.put(MatchInvitesController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.height,
          padding: const EdgeInsets.all(20.0),
          child: Column(
            children: [
              SearchCard(),
              const SizedBox(
                height: 20,
              ),
              const SizedBox(
                height: 20,
              ),
              Expanded(
                child: Obx(
                  () => ListView.builder(
                    itemCount: controller.matchInvites.length,
                    itemBuilder: (BuildContext context, int index) {
                      return GestureDetector(
                        onTap: () {},
                        child: Card(
                          clipBehavior: Clip.antiAlias,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              ListTile(
                                leading: Icon(
                                  Icons.stream,
                                  color: Colors.green,
                                ),
                                title: Text('Acitve'),
                                trailing: Icon(
                                  Icons.more_horiz,
                                  color: Colors.black,
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(
                                    left: 16.0,
                                    right: 16.0,
                                    top: 5.0,
                                    bottom: 5.0),
                                child: Text(
                                  controller.matchInvites[index].payload[index]
                                      .course.courseName,
                                  style: Theme.of(context).textTheme.headline5,
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(
                                    right: 16.0, left: 16.0, bottom: 16.0),
                                child: Text(
                                  controller.matchInvites[index].payload[index]
                                      .compName,
                                  style: Theme.of(context).textTheme.bodyText1,
                                ),
                              ),
                              Container(
                                padding: const EdgeInsets.only(
                                    right: 16.0, left: 16.0, bottom: 16.0),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Row(
                                      children: [
                                        Text(
                                          'Leonard Madiba',
                                          style:
                                              GcmsTheme.darkTextTheme.bodyText2,
                                        ),
                                        SizedBox(
                                          width: 10.0,
                                        ),
                                        Opacity(
                                          opacity: 0.50,
                                          child: FilterChip(
                                            labelStyle: TextStyle(
                                              backgroundColor:
                                                  Colors.transparent,
                                              color: Colors.black,
                                            ),
                                            label: Text('Creator'),
                                          ),
                                        ),
                                      ],
                                    ),
                                    Text(
                                      controller.matchInvites[index]
                                          .payload[index].gametype.name,
                                      style: GcmsTheme.darkTextTheme.bodyText2,
                                    ),
                                    SizedBox(
                                      height: 10.0,
                                    ),
                                    Text(
                                        controller.matchInvites[index]
                                            .payload[index].compDate,
                                        style:
                                            GcmsTheme.darkTextTheme.bodyText2),
                                  ],
                                ),
                                decoration: BoxDecoration(
                                  color: Color(0xFF009DAE).withOpacity(0.6),
                                ),
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
