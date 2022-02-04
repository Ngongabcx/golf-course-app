import 'package:flutter/material.dart';
import 'package:gcms/app/modules/ActiveGameScreen/views/competition_card.dart';
import 'package:gcms/app/modules/ActiveGameScreen/views/search_card.dart';
import 'package:gcms/app/modules/SettingScreen/views/setting_screen_view.dart';
import 'package:gcms/app/modules/commonWidgets/loader/loader.dart';
import 'package:gcms/constants/constant.dart';
import 'package:get/get.dart';

import '../controllers/active_game_screen_controller.dart';
import 'competition_detail_view.dart';

class ActiveGameScreenView extends GetView<ActiveGameScreenController> {
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
        child: Obx(
          () => Container(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.height,
            child: controller.isProcessing.value == true
                ? Loader()
                : Column(
                    children: [
                      Container(
                        margin: EdgeInsets.only(top: 20),
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
                        child: controller.matchList.isEmpty
                            ? Center(
                                child: Text(
                                  "No Matches.",
                                  style: Theme.of(context).textTheme.headline3,
                                ),
                              )
                            : Padding(
                                padding: const EdgeInsets.only(top: 10.0),
                                child:
                                    ActiveGamesListView(controller: controller),
                              ),
                      ),
                    ],
                  ),
          ),
        ),
      ),
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
      child: RefreshIndicator(
        onRefresh: _pullRefresh,
        child: ListView.builder(
          controller: _controller.scrollController,
          // 5
          itemCount: _controller.matchList.length,
          // 6
          itemBuilder: (BuildContext context, int index) {
            if (index == _controller.matchList.length - 1 &&
                _controller.isProcessing.value == true) {
              return Center(
                child: CircularProgressIndicator(),
              );
            }
            // 7

            // 7
            return Obx(() {
              return GestureDetector(
                // 8
                onTap: () {
                  Get.to(
                    CompetitionDetailView(
                        competition: _controller.matchList[index]),
                  );
                },
                // 11
                child: Padding(
                  padding: const EdgeInsets.only(top: 10.0, bottom: 10.0),
                  child: CompetitionCard(
                      competition: _controller.matchList[index]),
                ),
              );
            });
          },
        ),
      ),
    );
  }

  Future<void> _pullRefresh() async {
    await _controller.getActiveMatches(_controller.page);
  }
}
