import 'package:flutter/material.dart';
import 'package:gcms/app/modules/ActiveGameScreen/views/search_card.dart';
import 'package:gcms/app/modules/TournamentsScreen/tournament_model.dart';
import 'package:gcms/app/modules/TournamentsScreen/views/tournament_details_view.dart';
import 'package:gcms/app/modules/TournamentsScreen/views/widgets/tournaments_card.dart';
import 'package:get/get.dart';

import '../controllers/tournaments_screen_controller.dart';

class TournamentsScreenView extends GetView<TournamentsScreenController> {
  final _controller = Get.put(TournamentsScreenController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Tournaments'),
        centerTitle: true,
      ),
      body: SafeArea(
        child: Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.height,
          padding: const EdgeInsets.all(20.0),
          child: Column(
            children: [
              SearchCard(),
              Expanded(
                child: Center(
                  child: ListView.builder(
                    itemCount: Tournament.tournaments.length,
                    // itemCount: _controller.tournament.value.payload!.length,
                    itemBuilder: (BuildContext context, int index) {
                      return GestureDetector(
                        onTap: () {
                          Get.to(
                            TournamentDetailsView(
                              tournament: Tournament.tournaments[index],
                              // tournament: _controller
                              //     .tournament.value.payload![index]),
                            ),
                          );
                        },
                        child: Padding(
                          padding: const EdgeInsets.only(top: 20.0),
                          child: TournamentsCard(
                              tournament: Tournament.tournaments[index]
                              // tournament:
                              //     _controller.tournament.value.payload![index],
                              ),
                        ),
                      );
                    },
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
