import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:gcms/bcx_icons_icons.dart';
import 'package:gcms/constants/constant.dart';
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
          color: kPrimaryColor,
          onTapped: () {
            Get.toNamed("/setup-screen");
          },
        ),
        OptionsCard(
          text1: 'Tournaments',
          icon: Icons.sports_golf,
          color: kPrimaryColor,
          onTapped: () {
            Get.toNamed("/tournaments-screen");
          },
        ),
        OptionsCard(
          text1: 'Matches',
          icon: FontAwesomeIcons.playCircle,
          color: kPrimaryColor,
          onTapped: () {
            Get.toNamed("/active-game-screen");
          },
        ),
        OptionsCard(
          text1: 'Match Invites',
          color: kPrimaryColor,
          icon: Icons.mail_outline,
          onTapped: () {
            Get.toNamed("/join-match-screen");
          },
        ),
        // OptionsCard(
        //   text1: 'Courses',
        //   color: Colors.black,
        //   icon: kPrimaryColor,
        //   onTapped: () {},
        // ),
        // OptionsCard(
        //   text1: 'Past Scores',
        //   icon: Icons.sports_score,
        //   color: CkPrimaryColor,
        //   onTapped: () {},
        // ),
        OptionsCard(
          text1: 'Events',
          color: kPrimaryColor,
          icon: FontAwesomeIcons.calendarCheck,
          onTapped: () {
            Get.toNamed('/events');
          },
        ),
        OptionsCard(
          text1: 'Health',
          icon: FontAwesomeIcons.heartbeat,
          color: kPrimaryColor,
          onTapped: () {},
        ),
      ],
    );
  }
}
