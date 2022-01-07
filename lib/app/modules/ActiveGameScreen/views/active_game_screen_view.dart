import 'package:flutter/material.dart';
import 'package:gcms/app/modules/ActiveGameScreen/views/competition_card.dart';
import 'package:gcms/app/modules/ActiveGameScreen/views/search_card.dart';
import 'package:gcms/app/modules/SettingScreen/views/setting_screen_view.dart';
import 'package:gcms/app/modules/commonWidgets/custom_appbar.dart';
import 'package:gcms/app/modules/commonWidgets/loader/loader.dart';
import 'package:gcms/constants/constant.dart';
import 'package:get/get.dart';

import '../controllers/active_game_screen_controller.dart';
import 'competition_detail_view.dart';

class ActiveGameScreenView extends GetView<ActiveGameScreenController> {
  final _controller = Get.put(ActiveGameScreenController());

  @override
  Widget build(BuildContext context) {
    var matches = _controller.matches.value.payload;
    return Scaffold(
      backgroundColor: kBackgroundColor,
      body: SafeArea(
          child: Obx(
        () => Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.height,
          child: _controller.isProcessing.value == true
              ? Loader()
              : Column(
                  children: [
                    CustomAppBar(
                      Icons.arrow_back_ios_outlined,
                      Icons.settings_outlined,
                      leftCallBack: () => Get.back(),
                      rightCallBack: () => Get.to(SettingScreenView()),
                    ),
                    Container(
                      margin: EdgeInsets.only(top: 30),
                      padding: EdgeInsets.symmetric(horizontal: 25),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Flexible(
                            child: Text(
                              'Your list of Matches',
                              style: Theme.of(context).textTheme.headline2,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(top: 20),
                      padding: EdgeInsets.symmetric(horizontal: 20),
                      child: SearchCard(),
                    ),
                    Expanded(
                      child: _controller.matches.value.payload == null
                          ? Center(
                              child: Text(
                                "No Matches.",
                                style: Theme.of(context).textTheme.headline3,
                              ),
                            )
                          : Padding(
                              padding: const EdgeInsets.only(top: 20.0),
                              child:
                                  ActiveGamesListView(controller: _controller),
                            ),
                    ),
                  ],
                ),
        ),
      )),
    );
  }
}

class ActiveGamesListView extends StatelessWidget {
  const ActiveGamesListView({
    Key? key,
    required ActiveGameScreenController controller,
  })  : _controller = controller,
        super(key: key);

  final ActiveGameScreenController _controller;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 25),
      child: ListView.builder(
        // 5
        itemCount: _controller.matches.value.payload!.length,
        // 6
        itemBuilder: (BuildContext context, int index) {
          // 7

          // 7
          return Obx(() {
            return GestureDetector(
              // 8
              onTap: () {
                Get.to(
                  CompetitionDetailView(
                      competition: _controller.matches.value.payload![index]),
                );
              },
              // 11
              child: Padding(
                padding: const EdgeInsets.only(top: 20.0),
                child: CompetitionCard(
                    competition: _controller.matches.value.payload![index]),
              ),
            );
          });
        },
      ),
    );
  }
}
