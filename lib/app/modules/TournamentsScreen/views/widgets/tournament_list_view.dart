import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gcms/app/modules/TournamentsScreen/views/widgets/tournaments_card.dart';
import 'package:get/get.dart';

import '../../tournament_model.dart';
import '../tournament_details_view.dart';

class TournamentListView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 25),
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
              child: TournamentsCard(tournament: Tournament.tournaments[index]),
            ),
          );
        },
      ),
    );
  }
}
