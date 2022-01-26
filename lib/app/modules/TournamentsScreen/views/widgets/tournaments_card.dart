import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gcms/app/modules/SetupScreen/competition_model.dart';
import 'package:gcms/constants/constant.dart';
import 'package:intl/intl.dart';

class TournamentsCard extends StatelessWidget {
  final Payload tournament;

  const TournamentsCard({Key? key, required this.tournament}) : super(key: key);

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
                        tournament.course!.courseName.toString(),
                        style: Theme.of(context).textTheme.headline3,
                      ),
                      Icon(
                        Icons.arrow_forward_ios_outlined,
                        size: 15,
                      ),
                    ],
                  ),
                  Text(
                    tournament.compName.toString(),
                    style: Theme.of(context).textTheme.headline6,
                  ),
                  SizedBox(
                    height: 2,
                  ),
                  Row(
                    children: [
                      Text(
                        '${DateFormat.yMMMMd().format(tournament.compDate!)} at ${tournament.compTime} hrs',
                        style: Theme.of(context).textTheme.bodyText2,
                      ),
                    ],
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
                        '${tournament.gameHoles.toString()} holes',
                        style: Theme.of(context).textTheme.headline6,
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Text(
                        tournament.gametype!.name.toString(),
                        style: Theme.of(context).textTheme.bodyText2,
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
