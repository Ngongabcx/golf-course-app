import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:gcms/app/modules/ActiveGameScreen/views/competition_card.dart';
import 'package:gcms/app/modules/ActiveGameScreen/views/search_card.dart';
import 'package:gcms/tempModels/competetion.dart';

import 'package:get/get.dart';

import '../controllers/active_game_screen_controller.dart';
import 'competition_detail_view.dart';

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
              GestureDetector(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('Create match',
                        style: Theme.of(context).textTheme.headline3),
                    Icon(FontAwesomeIcons.plusCircle),
                  ],
                ),
                onTap: () {
                  Get.toNamed("/setup-screen");
                },
              ),
              const SizedBox(
                height: 20,
              ),
              Expanded(
                child: ListView.builder(
                  // 5
                  itemCount: Competition.samples.length,
                  // 6
                  itemBuilder: (BuildContext context, int index) {
                    // 7

                    // 7
                    return GestureDetector(
                      // 8
                      onTap: () {
                        // 9
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) {
                              // 10
                              return CompetitionDetailView(
                                  Competition.samples[index]);
                            },
                          ),
                        );
                      },
                      // 11
                      child: CompetitionCard(
                          competition: Competition.samples[index]),
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
