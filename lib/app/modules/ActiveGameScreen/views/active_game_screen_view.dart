import 'package:flutter/material.dart';
import 'package:gcms/app/modules/ActiveGameScreen/views/competition_card.dart';
import 'package:gcms/app/modules/ActiveGameScreen/views/search_card.dart';
import 'package:gcms/tempModels/competetion.dart';

import 'package:get/get.dart';

import '../controllers/active_game_screen_controller.dart';

class ActiveGameScreenView extends GetView<ActiveGameScreenController> {
  @override
  Widget build(BuildContext context) {
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
          child: Column(
            children: [
              SearchCard(),
              const SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('Create a new match',
                      style: Theme.of(context).textTheme.bodyText2),
                  FloatingActionButton(
                    backgroundColor: Colors.white,
                    foregroundColor: Colors.black,
                    mini: true,
                    onPressed: () {
                      // Respond to button press
                      Get.toNamed("/setup-screen");
                    },
                    child: Icon(Icons.add),
                  ),
                ],
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
                      onTap: () {},
                      // 11
                      child: CompetitionCard(
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
