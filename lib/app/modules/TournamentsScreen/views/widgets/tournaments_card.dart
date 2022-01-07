import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gcms/app/modules/TournamentsScreen/tournament_model.dart';
import 'package:gcms/constants/constant.dart';

class TournamentsCard extends StatelessWidget {
  // final Payload tournament;
  final Tournament tournament;

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
                        tournament.course,
                        style: Theme.of(context).textTheme.headline3,
                      ),
                      Icon(
                        Icons.arrow_forward_ios_outlined,
                        size: 15,
                      ),
                    ],
                  ),
                  Text(
                    tournament.compName,
                    style: Theme.of(context).textTheme.headline6,
                  ),
                  SizedBox(
                    height: 2,
                  ),
                  Row(
                    children: [
                      Text(
                        '${tournament.compDate} ${tournament.compTime}',
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
                        '${tournament.numberOfHoles} holes',
                        style: Theme.of(context).textTheme.headline6,
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Text(
                        tournament.gametype,
                        style: Theme.of(context).textTheme.bodyText2,
                      ),
                    ],
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
