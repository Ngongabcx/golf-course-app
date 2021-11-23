import 'package:flutter/material.dart';
import 'package:gcms/app/modules/commonWidgets/customButton.dart';
import 'package:gcms/app/modules/commonWidgets/search_card.dart';
import 'package:gcms/tempModels/competetion.dart';
import 'package:gcms/theme/gcms_theme.dart';

import 'package:get/get.dart';

import '../controllers/join_match_screen_controller.dart';
import 'match_details_card.dart';

class JoinMatchScreenView extends GetView<JoinMatchScreenController> {
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
                child: ListView.builder(
                  // 5
                  itemCount: TempCompetition.samples.length,
                  // 6
                  itemBuilder: (BuildContext context, int index) {
                    // 7

                    // 7
                    return GestureDetector(
                      // 8
                      onTap: () {
                        Get.bottomSheet(
                            Container(
                              padding: const EdgeInsets.all(20.0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.end,
                                    children: [
                                      Padding(
                                        padding: EdgeInsets.only(right: 16.0),
                                        child: Icon(
                                          Icons.close,
                                          color: Colors.black,
                                        ),
                                      ),
                                    ],
                                  ),
                                  Text(
                                    'Lusaka Open',
                                    style:
                                        Theme.of(context).textTheme.bodyText1,
                                  ),
                                  SizedBox(
                                    height: 20.0,
                                  ),
                                  CircleAvatar(
                                    radius: 30.0,
                                    backgroundImage: AssetImage(
                                        'assets/images/Tiger-Woods.jpg'),
                                  ),
                                  SizedBox(
                                    height: 10.0,
                                  ),
                                  Text(
                                    'Tiger Woods',
                                    style:
                                        Theme.of(context).textTheme.bodyText1,
                                  ),
                                  Expanded(
                                    child: Align(
                                      alignment: FractionalOffset.bottomCenter,
                                      child: CustomButton(
                                        text: "Join this Match",
                                        onPressed: () {
                                          Get.toNamed("/scores-input-screen");
                                        },
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            elevation: 20.0,
                            enableDrag: false,
                            backgroundColor: Colors.white,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(30.0),
                              topRight: Radius.circular(30.0),
                            )));
                      },
                      // 11
                      child: JoinMatchCard(
                          competition: TempCompetition.samples[index]),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
