import 'package:flutter/material.dart';
import 'package:gcms/app/modules/TournamentsScreen/tournament_model.dart';
import 'package:gcms/constants/constant.dart';
import 'package:gcms/theme/gcms_theme.dart';

class TournamentsCard extends StatelessWidget {
  // final Payload tournament;
  final Tournament tournament;

  const TournamentsCard({Key? key, required this.tournament}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 20.0),
      child: Card(
        clipBehavior: Clip.antiAlias,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ListTile(
              leading: Icon(
                Icons.calendar_today,
                color: Colors.black,
              ),
              title: Text('Today'),
              trailing: Icon(
                Icons.bookmark_outline,
                color: Colors.black,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(
                  left: 16.0, right: 16.0, top: 5.0, bottom: 5.0),
              child: Text(
                tournament.compName,
                // tournament.course!.courseName.toString(),
                style: Theme.of(context).textTheme.bodyText1,
              ),
            ),
            Padding(
              padding:
                  const EdgeInsets.only(right: 16.0, left: 16.0, bottom: 16.0),
              child: Text(
                tournament.course,
                // tournament.course!.courseName.toString(),
                style: Theme.of(context).textTheme.headline6,
              ),
            ),
            Container(
              width: MediaQuery.of(context).size.width,
              padding: const EdgeInsets.only(
                  right: 16.0, left: 16.0, bottom: 16.0, top: 16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        tournament.compDate,
                        // tournament.compDate.toString(),
                        style: GcmsTheme.darkTextTheme.bodyText2,
                      ),
                      Text(
                        tournament.compTime.toString(),
                        style: GcmsTheme.darkTextTheme.bodyText2,
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 10.0,
                  ),
                  Text(
                    tournament.gametype,
                    // tournament.gametype!.name.toString(),
                    style: GcmsTheme.darkTextTheme.bodyText2,
                  ),
                  SizedBox(
                    height: 10.0,
                  ),
                  Text('${tournament.numberOfHoles} holes',
                      style: GcmsTheme.darkTextTheme.bodyText2),
                ],
              ),
              decoration: BoxDecoration(
                color: kPrimaryColor.withOpacity(0.9),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
