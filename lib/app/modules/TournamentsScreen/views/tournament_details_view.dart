import 'package:flutter/material.dart';
import 'package:gcms/app/modules/ScoresInputScreen/views/scores_input_screen_view.dart';
import 'package:gcms/app/modules/SettingScreen/views/setting_screen_view.dart';
import 'package:gcms/app/modules/SetupScreen/competition_model.dart';
import 'package:gcms/app/modules/SetupScreen/competition_player_model.dart'
    as compPlayer;
import 'package:gcms/app/modules/SetupScreen/controllers/setup_screen_controller.dart';
import 'package:gcms/app/modules/SetupScreen/providers/competition_provider.dart';
import 'package:gcms/app/modules/commonWidgets/customButton.dart';
import 'package:gcms/constants/constant.dart';
import 'package:gcms/theme/gcms_theme.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class TournamentDetailsView extends GetView {
  TournamentDetailsView({required this.competition});
  final Payload competition;
  final _controller = Get.put(SetupScreenController());
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
      body: Column(
        children: [
          const SizedBox(
            height: 20.0,
          ),
          Container(
            margin: EdgeInsets.only(top: 20),
            padding: EdgeInsets.symmetric(horizontal: 25),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  competition.compName!.capitalizeFirst.toString(),
                  // tournament.compName!,
                  style: Theme.of(context).textTheme.headline5,
                ),
                SizedBox(
                  height: 20.0,
                ),
                Text(
                  competition.course!.courseName.toString(),
                  // tournament.course.toString(),
                ),
                SizedBox(
                  height: 20.0,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Icon(
                      Icons.access_time,
                      size: 30.0,
                      color: kPrimaryColor,
                    ),
                    SizedBox(
                      width: 5,
                    ),
                    Expanded(
                      child: Text(
                        competition.compTime.toString(),
                        // tournament.compTime.toString(),
                        style: Theme.of(context).textTheme.bodyText2,
                      ),
                    ),
                    Icon(
                      Icons.calendar_today_outlined,
                      size: 30.0,
                      color: kPrimaryColor,
                    ),
                    SizedBox(
                      width: 5,
                    ),
                    Expanded(
                      child: Text(
                        DateFormat.yMMMMd().format(competition.compDate!),
                        // tournament.compDate.toString(),
                        style: Theme.of(context).textTheme.bodyText2,
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 20,
                ),
                Row(
                  children: [
                    Icon(
                      Icons.location_on,
                      size: 30.0,
                      color: kPrimaryColor,
                    ),
                    SizedBox(
                      width: 5,
                    ),
                    Expanded(
                      child: Text(
                        competition.course!.courseName.toString(),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          const SizedBox(
            height: 25.0,
          ),
          Container(
            margin: EdgeInsets.only(top: 20),
            padding: EdgeInsets.symmetric(horizontal: 25),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Players',
                  style: GcmsTheme.lightTextTheme.headline3,
                ),
                Text(
                  'Options',
                  style: GcmsTheme.lightTextTheme.headline3,
                ),
              ],
            ),
          ),
          Expanded(
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 25),
              child: ListView.builder(
                scrollDirection: Axis.vertical,
                shrinkWrap: true,
                physics: ScrollPhysics(),
                itemCount: competition.competitionPlayers!.length,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.symmetric(vertical: 10.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            competition.competitionPlayers![index].player!
                                        .image ==
                                    ""
                                ? CircleAvatar(
                                    radius: 30.0,
                                    backgroundImage: AssetImage(competition
                                        .competitionPlayers![index]
                                        .player!
                                        .image
                                        .toString()),
                                  )
                                : CircleAvatar(
                                    radius: 30.0,
                                    backgroundImage: NetworkImage((competition
                                        .competitionPlayers![index]
                                        .player!
                                        .imageThumbnail
                                        .toString())),
                                  ),
                            SizedBox(
                              width: 10.0,
                            ),
                            Text(
                              "${competition.competitionPlayers![index].player!.fname.toString().split('.').last.replaceAll('_', ' ').capitalizeFirst ?? ''}",
                              style: GcmsTheme.lightTextTheme.bodyText1,
                            ),
                          ],
                        ),
                        PopupMenuButton<int>(
                          onSelected: (item) => onSelected(context, item),
                          itemBuilder: (context) => [
                            PopupMenuItem(
                              value: 0,
                              child: Text('Setup player'),
                            ),
                            PopupMenuItem(
                              value: 1,
                              child: Text('Remove'),
                            ),
                          ],
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),
          ),
          Container(
            margin: EdgeInsets.only(top: 20, bottom: 20),
            padding: EdgeInsets.symmetric(horizontal: 25),
            child: CustomButton(
              textStyle: GcmsTheme.lightTextTheme.bodyText2,
              text: "Play",
              onPressed: () async {
                var competitionId = competition.id.toString();
                print('COMPETITION ID ---------> $competitionId');
                var playerId = _controller.storage.read("userId");
                print('PLAYER ID --------> $playerId');
                compPlayer.CompetitionPlayer recordingScoresFor =
                    await CompetitionProvider()
                        .getCompetitionPlayer(competitionId, playerId);
                Get.offAll(ScoresInputScreenView(
                  competition,
                  recordingScoresFor.payload!.first.recordingScoresFor,
                ));
                print('COMPETITION ---------> $competition');
                print(
                    'PLAYER FIRST NAME ----------> ${recordingScoresFor.payload!.first.recordingScoresFor}');
                print('Go to scores page');
              },
            ),
          ),
        ],
      ),
    );
  }
}

void onSelected(BuildContext context, int item) {
  switch (item) {
    case 0:
      print('player setup clicked');
      break;

    case 1:
      print('Remove clicked');
      break;
  }
}
