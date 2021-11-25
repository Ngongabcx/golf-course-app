import 'package:flutter/material.dart';
import 'package:gcms/app/modules/SetupScreen/competition_model.dart';
import 'package:gcms/app/modules/commonWidgets/customButton.dart';
import 'package:gcms/theme/gcms_theme.dart';

import 'package:get/get.dart';

class CompetitionDetailView extends GetView {
  final Competition competition;

  CompetitionDetailView(this.competition);
  @override
  Widget build(BuildContext context) {
  final comp = competition.payload;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        iconTheme: IconThemeData(color: Colors.black),
        automaticallyImplyLeading: true,
        title: Align(
          alignment: AlignmentDirectional(-1, 0),
          child: Text(
            comp.compName,
            style: Theme.of(context).textTheme.headline3,
          ),
        ),
      ),
      body: SafeArea(
        child: Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.height,
          padding: EdgeInsets.all(20.0),
          child: ListView(
            children: [
              Container(
                padding: const EdgeInsets.all(20),
                constraints: const BoxConstraints.expand(
                  width: 350,
                  height: 150,
                ),
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: NetworkImage(comp.course.courseImage),
                    fit: BoxFit.cover,
                  ),
                  borderRadius: const BorderRadius.all(Radius.circular(10.0)),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Text(
                comp.course.courseName,
                style: Theme.of(context).textTheme.headline5,
              ),
              Text(comp.compDate,
                  style: Theme.of(context).textTheme.subtitle2),
              const SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    comp.compName,
                    style: Theme.of(context).textTheme.bodyText2,
                  ),
                  Text(
                    "Strokeplay",
                    style: Theme.of(context).textTheme.bodyText2,
                  ),
                  Text(
                    '18 Holes',
                    style: Theme.of(context).textTheme.bodyText2,
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
              Text(
                'Player Setup',
                style: Theme.of(context).textTheme.headline5,
              ),
              const SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Padding(
                    padding: EdgeInsets.only(left: 16.0),
                    child: Text(
                      'Players',
                      style: GcmsTheme.lightTextTheme.headline3,
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: 16.0),
                    child: Text(
                      'Options',
                      style: GcmsTheme.lightTextTheme.headline3,
                    ),
                  ),
                ],
              ),
              Row(
                children: [
                  const Padding(
                    padding: EdgeInsets.only(left: 16.0, top: 16.0),
                    child: Expanded(
                      flex: 5,
                      child: CircleAvatar(
                        radius: 30.0,
                        backgroundImage:
                            AssetImage('assets/images/Tiger-Woods.jpg'),
                      ),
                    ),
                  ),
                  Expanded(
                    flex: 10,
                    child: Padding(
                      padding: EdgeInsets.only(left: 20.0),
                      child: Text(
                        'Tiger Woods (You)',
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
              ),
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
                      text: "Start recording scores",
                      onPressed: () {
                        Get.toNamed("/scores-input-screen");
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
