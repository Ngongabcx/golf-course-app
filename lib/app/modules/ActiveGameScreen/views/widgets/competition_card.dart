import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gcms/app/modules/SetupScreen/competition_model.dart';
import 'package:gcms/constants/constant.dart';
import 'package:gcms/theme/gcms_theme.dart';
import 'package:intl/intl.dart';

class CompetitionCard extends StatelessWidget {
  final Payload competition;

  const CompetitionCard({Key? key, required this.competition})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 110,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Row(
        children: [
          Expanded(
            child: Container(
              padding: EdgeInsets.only(
                top: 20,
                left: 10,
                right: 10,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        competition.course!.courseName.toString(),
                        style: Theme.of(context).textTheme.headline6,
                      ),
                      Icon(
                        Icons.arrow_forward_ios_outlined,
                        size: 15,
                      ),
                    ],
                  ),
                  Text(
                    competition.compName.toString(),
                    style: Theme.of(context).textTheme.bodyText1,
                  ),
                  SizedBox(
                    height: 2,
                  ),
                  Text(
                    '${DateFormat.yMMMMd().format(competition.compDate!)} at ${competition.compTime} hrs',
                    style: Theme.of(context).textTheme.bodyText2,
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  Row(
                    children: [
                      SvgPicture.asset(
                        'assets/images/golf.svg',
                        color: kPrimaryColor,
                        width: 100,
                        height: 15,
                      ),
                      SizedBox(
                        width: 5,
                      ),
                      Text(
                        competition.gameHoles.toString(),
                        style: Theme.of(context).textTheme.headline6,
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Text(
                        competition.gametype!.name.toString(),
                        style: GcmsTheme.darkTextTheme.bodyText2,
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
