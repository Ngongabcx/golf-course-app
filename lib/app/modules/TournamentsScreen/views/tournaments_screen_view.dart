import 'package:flutter/material.dart';
import 'package:gcms/app/modules/ActiveGameScreen/controllers/active_game_screen_controller.dart';
import 'package:gcms/app/modules/ActiveGameScreen/views/widgets/search_card.dart';
import 'package:gcms/app/modules/SettingScreen/views/setting_screen_view.dart';
import 'package:gcms/app/modules/TournamentsScreen/views/widgets/tournament_list_view.dart';
import 'package:gcms/app/modules/commonWidgets/loader/loader.dart';
import 'package:gcms/constants/constant.dart';
import 'package:get/get.dart';

import '../controllers/tournaments_screen_controller.dart';

class TournamentsScreenView extends GetView<TournamentsScreenController> {
  final _controller = Get.put(ActiveGameScreenController());
  final tournamentCtl = Get.put(TournamentsScreenController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kBackgroundColor,
      appBar: AppBar(
        iconTheme: const IconThemeData(color: Colors.black),
        backgroundColor: kBackgroundColor,
        actions: [
          IconButton(
            icon: Icon(
              Icons.settings_outlined,
            ),
            onPressed: () {
              // do something
              Get.to(SettingScreenView());
            },
          ),
        ],
        elevation: 0.0,
      ),
      body: SafeArea(
        child: Obx(() {
          return Container(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.height,
            child: _controller.isProcessing.value == true
                ? Loader()
                : Column(
                    children: [
                      Container(
                        margin: EdgeInsets.only(top: 20),
                        padding: EdgeInsets.symmetric(horizontal: 25),
                        child: Column(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Flexible(
                                  child: Text(
                                    'Your list of Tournaments',
                                    style:
                                        Theme.of(context).textTheme.headline2,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                      tournamentCtl.compList.isEmpty
                          ? Expanded(
                              child: Center(
                                child: Text(
                                  "No tournaments.",
                                  style: TextStyle(fontSize: 17.0),
                                ),
                              ),
                            )
                          : Container(
                              margin: EdgeInsets.only(top: 20),
                              padding: EdgeInsets.symmetric(horizontal: 20),
                              child: SearchCard(),
                            ),
                      if (tournamentCtl.compList.isNotEmpty)
                        Expanded(
                          child: Center(
                            child: Expanded(
                              child: TournamentListView(),
                            ),
                          ),
                        ),
                    ],
                  ),
          );
        }),
      ),
    );
  }
}
