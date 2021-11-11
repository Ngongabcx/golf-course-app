import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'package:get/get.dart';

import '../controllers/explore_screen_controller.dart';
import 'card.dart';

class ExploreScreenView extends GetView<ExploreScreenController> {
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
          text1: 'Active Games',
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
          text1: 'Membership',
          icon: Icons.card_membership,
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
