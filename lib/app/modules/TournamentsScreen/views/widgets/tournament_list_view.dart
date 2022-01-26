import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gcms/app/modules/ActiveGameScreen/controllers/active_game_screen_controller.dart';
import 'package:gcms/app/modules/TournamentsScreen/views/widgets/tournaments_card.dart';
import 'package:get/get.dart';

import '../tournament_details_view.dart';

class TournamentListView extends StatelessWidget {
  final _controller = Get.put(ActiveGameScreenController());
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: _controller.matches.value.payload == null
          ? Center(
              child: Text(
                "No Matches.",
                style: Theme.of(context).textTheme.headline3,
              ),
            )
          : Container(
              padding: EdgeInsets.symmetric(horizontal: 25),
              child: RefreshIndicator(
                onRefresh: _pullRefresh,
                child: ListView.builder(
                  itemCount: _controller.matches.value.payload!.length,
                  // itemCount: _controller.tournament.value.payload!.length,
                  itemBuilder: (BuildContext context, int index) {
                    return GestureDetector(
                      onTap: () {
                        Get.to(
                          TournamentDetailsView(
                            tournament:
                                _controller.matches.value.payload![index],
                            // tournament: _controller
                            //     .tournament.value.payload![index]),
                          ),
                        );
                      },
                      child: Padding(
                        padding: const EdgeInsets.only(top: 20.0),
                        child: TournamentsCard(
                            tournament:
                                _controller.matches.value.payload![index]),
                      ),
                    );
                  },
                ),
              ),
            ),
    );
  }

  Future<void> _pullRefresh() async {
    await _controller.getActiveMatches(_controller.page);
  }
}
