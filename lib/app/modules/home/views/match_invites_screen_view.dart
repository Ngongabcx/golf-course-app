import 'package:flutter/material.dart';
import 'package:gcms/app/modules/commonWidgets/loader/loader.dart';
import 'package:gcms/app/modules/commonWidgets/search_card.dart';
import 'package:gcms/app/modules/home/controllers/home_controller.dart';
import 'package:gcms/theme/gcms_theme.dart';
import 'package:get/get.dart';

class MatchInvitesScreenView extends GetView<HomeController> {
  final _controller = Get.put(HomeController());
  @override
  Widget build(BuildContext context) {
    var invitations = _controller.matchInvites.value.payload;
    return Scaffold(
      body: SafeArea(
        child: Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.height,
          padding: const EdgeInsets.all(20.0),
          child: _controller.isProcessing.value == true
              ? Loader()
              : Column(
                  children: [
                    SearchCard(),
                    Expanded(
                      child: _controller.matchInvites.value.payload.length > 0
                          ? Obx(
                              () => ListView.builder(
                                itemCount: _controller
                                    .matchInvites.value.payload.length,
                                itemBuilder: (BuildContext context, int index) {
                                  return GestureDetector(
                                    onTap: () {},
                                    child: Padding(
                                      padding: const EdgeInsets.only(top: 20.0),
                                      child: Card(
                                        clipBehavior: Clip.antiAlias,
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            ListTile(
                                              leading: Icon(
                                                Icons.calendar_today,
                                              ),
                                              title: Text('Today'),
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
                                                invitations[index]
                                                        .course
                                                        .courseName
                                                        .toString()
                                                        .split('.')
                                                        .last
                                                        .replaceAll('_', ' ')
                                                        .capitalizeFirst ??
                                                    '',
                                                style: Theme.of(context)
                                                    .textTheme
                                                    .headline6,
                                              ),
                                            ),
                                            Padding(
                                              padding: const EdgeInsets.only(
                                                  right: 16.0,
                                                  left: 16.0,
                                                  bottom: 16.0),
                                              child: Text(
                                                invitations[index]
                                                        .compName
                                                        .capitalizeFirst ??
                                                    '',
                                                style: Theme.of(context)
                                                    .textTheme
                                                    .bodyText1,
                                              ),
                                            ),
                                            Container(
                                              padding: const EdgeInsets.only(
                                                  right: 16.0,
                                                  left: 16.0,
                                                  bottom: 16.0),
                                              child: Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  Row(
                                                    children: [
                                                      Expanded(
                                                        child: Text(''),
                                                      ),
                                                      SizedBox(
                                                        width: 10.0,
                                                      ),
                                                      Opacity(
                                                        opacity: 0.50,
                                                        child: FilterChip(
                                                          labelStyle: TextStyle(
                                                            backgroundColor:
                                                                Colors
                                                                    .transparent,
                                                            color: Colors.black,
                                                          ),
                                                          label:
                                                              Text('Creator'),
                                                          onSelected:
                                                              (bool value) {},
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                  Text(
                                                    invitations[index]
                                                            .gametype
                                                            .name
                                                            .toString()
                                                            .split('.')
                                                            .last
                                                            .replaceAll(
                                                                '_', ' ')
                                                            .capitalizeFirst ??
                                                        '',
                                                    style: GcmsTheme
                                                        .darkTextTheme
                                                        .bodyText2,
                                                  ),
                                                  SizedBox(
                                                    height: 10.0,
                                                  ),
                                                  Text(
                                                      invitations[index]
                                                              .compDate ??
                                                          '',
                                                      style: GcmsTheme
                                                          .darkTextTheme
                                                          .bodyText2),
                                                ],
                                              ),
                                              decoration: BoxDecoration(
                                                color: Color(0xFF008080)
                                                    .withOpacity(0.6),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  );
                                },
                              ),
                              // ),
                            )
                          : Center(
                              child: Text("No Invitations."),
                            ),
                    ),
                  ],
                ),
        ),
      ),
    );
  }
}
