import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:gcms/bcx_icons_icons.dart';

import 'package:get/get.dart';
import 'card.dart';

class ExploreScreenView extends GetView {
  @override
  Widget build(BuildContext context) {
    return GridView.count(
      primary: false,
      padding: const EdgeInsets.all(20),
      crossAxisSpacing: 10,
      mainAxisSpacing: 10,
      crossAxisCount: 2,
      children: <Widget>[
        OptionsCard(
          text1: 'Create Match',
          icon: BcxIcons.golfing,
          color: Colors.white,
          onTapped: () {
            Get.toNamed("/setup-screen");
          },
        ),
        OptionsCard(
          text1: 'Matches',
          icon: FontAwesomeIcons.playCircle,
          color: Colors.white,
          onTapped: () {
            Get.toNamed("/active-game-screen");
          },
        ),
        OptionsCard(
          text1: 'Tournaments',
          icon: Icons.sports_golf,
          color: Colors.white,
          onTapped: () {},
        ),
        OptionsCard(
          text1: 'Past Scores',
          icon: Icons.sports_score,
          color: Colors.white,
          onTapped: () {},
        ),
        OptionsCard(
          text1: 'Events',
          color: Colors.white,
          icon: FontAwesomeIcons.calendarCheck,
          onTapped: () {},
        ),
        OptionsCard(
          text1: 'Health',
          icon: FontAwesomeIcons.heartbeat,
          color: Colors.white,
          onTapped: () {},
        ),
      ],
    );
  }
}
