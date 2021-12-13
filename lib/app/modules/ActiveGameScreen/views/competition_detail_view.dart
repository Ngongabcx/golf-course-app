import 'package:flutter/material.dart';
import 'package:gcms/app/modules/ScoresInputScreen/views/scores_input_screen_view.dart';
import 'package:gcms/app/modules/SetupScreen/competition_model.dart';
import 'package:gcms/app/modules/commonWidgets/customButton.dart';
import 'package:gcms/theme/gcms_theme.dart';

import 'package:get/get.dart';

class CompetitionDetailView extends GetView {
  CompetitionDetailView({required this.competition});
  final Payload competition;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        iconTheme: IconThemeData(color: Colors.black),
        automaticallyImplyLeading: true,
        title: Text(
          competition.compName.capitalizeFirst.toString(),
          style: Theme.of(context).textTheme.headline3,
        ),
        centerTitle: true,
        elevation: 0,
      ),
      body: SafeArea(
        child: Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.height,
          padding: EdgeInsets.only(left: 20, right: 20),
          child: ListView(
            children: [
              Container(
                constraints: const BoxConstraints.expand(
                  width: 550,
                  height: 150,
                ),
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: NetworkImage(competition.course.courseImage),
                    fit: BoxFit.fill,
                  ),
                  borderRadius: const BorderRadius.all(Radius.circular(5.0)),
                ),
              ),
              const SizedBox(
                height: 5,
              ),
              Text(
                competition.course.courseName,
                style: Theme.of(context).textTheme.headline5,
              ),
              Text(competition.compDate,
                  style: Theme.of(context).textTheme.subtitle2),
              const SizedBox(
                height: 10,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    competition.compName.capitalizeFirst.toString(),
                    style: Theme.of(context).textTheme.headline6,
                  ),
                  Text(
                    "Strokeplay",
                    style: Theme.of(context).textTheme.headline6,
                  ),
                  Text(
                    '18 Holes',
                    style: Theme.of(context).textTheme.headline6,
                  ),
                ],
              ),
              const SizedBox(
                height: 25.0,
                width: 500.0,
                child: Divider(
                  color: Color(0xFFF6F6F6),
                  thickness: 3.0,
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Padding(
                    padding: EdgeInsets.only(left: 0.0),
                    child: Text(
                      'Players',
                      style: GcmsTheme.lightTextTheme.headline3,
                    ),
                  ),
                  // Padding(
                  //   padding: EdgeInsets.only(left: 16.0),
                  //   child: Text(
                  //     'Options',
                  //     style: GcmsTheme.lightTextTheme.headline3,
                  //   ),
                  // ),
                ],
              ),
              Expanded(
                  child: ListView.builder(
                scrollDirection: Axis.vertical,
                shrinkWrap: true,
                physics: ScrollPhysics(),
                itemCount: competition.competitionPlayer.length,
                itemBuilder: (context, index) {
                  return Row(
                    children: [
                      Padding(
                        padding: EdgeInsets.only(left: 16.0, top: 16.0),
                        child: Expanded(
                          flex: 5,
                          child: competition
                                      .competitionPlayer[index].player.image ==
                                  ""
                              ? CircleAvatar(
                                  radius: 30.0,
                                  backgroundImage: AssetImage(
                                      'assets/images/Tiger-Woods.jpg'),
                                )
                              : CircleAvatar(
                                  radius: 30.0,
                                  backgroundImage: NetworkImage(competition
                                      .competitionPlayer[index].player.image),
                                ),
                        ),
                      ),
                      Expanded(
                        flex: 10,
                        child: Padding(
                          padding: EdgeInsets.only(left: 20.0),
                          child: Text(
                            "${competition.competitionPlayer[index].player.firstname.toString().split('.').last.replaceAll('_', ' ').capitalizeFirst ?? ''}",
                            style: GcmsTheme.lightTextTheme.bodyText1,
                          ),
                        ),
                      ),
                      Expanded(
                        flex: 2,
                        child: PopupMenuButton<int>(
                          onSelected: (item) => onSelected(context, item),
                          itemBuilder: (context) => [
                            PopupMenuItem(
                              value: 0,
                              child: Text('Setup player'),
                            ),
                            PopupMenuItem(
                              value: 1,
                              child: Text('Remove'),
                            ),
                          ],
                        ),
                      ),
                    ],
                  );
                },
              )),
              const SizedBox(
                height: 50.0,
                width: 500.0,
                child: Divider(
                  color: Color(0xFFF6F6F6),
                  thickness: 3.0,
                ),
              ),
              Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(bottom: 16.0),
                    child: CustomButton(
                      textStyle: GcmsTheme.lightTextTheme.bodyText2,
                      text: "Play",
                      onPressed: () {
                        Get.offAll(ScoresInputScreenView(competition));
                      },
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

void onSelected(BuildContext context, int item) {
  switch (item) {
    case 0:
      print('player setup clicked');
      break;

    case 1:
      print('Remove clicked');
      break;
  }
}
