import 'package:flutter/material.dart';
import 'package:gcms/app/modules/TournamentsScreen/controllers/tournaments_screen_controller.dart';
import 'package:gcms/app/modules/TournamentsScreen/views/widgets/tournaments_card.dart';
import 'package:get/get.dart';

import '../tournament_details_view.dart';

class TournamentListView extends StatelessWidget {
  final _controller = Get.put(TournamentsScreenController());

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 25),
      child: RefreshIndicator(
        onRefresh: _pullRefresh,
        child: _controller.compList.isEmpty ? Center(child:Text("No tournaments.",style: TextStyle(fontSize: 17.0),)) :ListView.builder(
          itemCount: _controller.compList.length,
          // itemCount: _controller.tournament.value.payload!.length,
          itemBuilder: (BuildContext context, int index) {
            if (index == _controller.compList.length - 1 &&
                _controller.isProcessing.value == true) {
              return Center(
                child: CircularProgressIndicator(),
              );
            }
            return GestureDetector(
              onTap: () {
                Get.to(
                  TournamentDetailsView(
                    competition: _controller.compList[index],

                    // tournament: _controller
                    //     .tournament.value.payload![index]),
                  ),
                );
                print(
                    'Cometitions name ----> ${_controller.compList[index].compName}');
              },
              child: Padding(
                padding: const EdgeInsets.only(top: 20.0),
                child: TournamentsCard(tournament: _controller.compList[index]),
              ),
            );
          },
        ),
      ),
    );
  }

  Future<void> _pullRefresh() async {
    await _controller.getTournaments(_controller.page);
  }
}
