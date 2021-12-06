import 'package:flutter/material.dart';
import 'package:gcms/app/modules/ActiveGameScreen/views/competition_card.dart';
import 'package:gcms/app/modules/ActiveGameScreen/views/search_card.dart';
import 'package:gcms/app/modules/commonWidgets/loader/loader.dart';
import 'package:get/get.dart';
import '../controllers/active_game_screen_controller.dart';

class ActiveGameScreenView extends GetView<ActiveGameScreenController> {
  final _controller = Get.put(ActiveGameScreenController());
  @override
  Widget build(BuildContext context) {
    var matches = _controller.matches.value.payload;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        iconTheme: const IconThemeData(color: Colors.black),
        automaticallyImplyLeading: true,
        title: Text(
          ' Active Games',
          style: Theme.of(context).textTheme.headline3,
        ),
        actions: [],
        centerTitle: true,
        elevation: 4,
      ),
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
                      child: _controller.matches.value.payload.length > 0
                          ? Obx(
                              () => ListView.builder(
                                // 5
                                itemCount:
                                    _controller.matches.value.payload.length,
                                // 6
                                itemBuilder: (BuildContext context, int index) {
                                  // 7

                                  // 7
                                  return GestureDetector(
                                    // 8
                                    onTap: () {},
                                    // 11
                                    child: CompetitionCard(
                                        competition: matches[index]),
                                  );
                                },
                              ),
                            )
                          : Center(
                              child: CircularProgressIndicator(),
                            ),
                    ),
                  ],
                ),
        ),
      ),
    );
  }
}
