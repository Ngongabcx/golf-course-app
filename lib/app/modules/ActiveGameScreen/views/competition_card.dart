import 'package:flutter/material.dart';
import 'package:gcms/tempModels/competetion.dart';
import 'package:gcms/theme/gcms_theme.dart';

class CompetitionCard extends StatelessWidget {
  final TempCompetition competition;

  const CompetitionCard({Key key, this.competition}) : super(key: key);

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
                competition.courseName,
                style: Theme.of(context).textTheme.headline5,
              ),
            ),
            Padding(
              padding:
                  const EdgeInsets.only(right: 16.0, left: 16.0, bottom: 16.0),
              child: Text(
                competition.compName,
                style: Theme.of(context).textTheme.bodyText1,
              ),
            ),
            Container(
              padding:
                  const EdgeInsets.only(right: 16.0, left: 16.0, bottom: 16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Text(
                        'Leonard Madiba',
                        style: GcmsTheme.darkTextTheme.bodyText2,
                      ),
                      SizedBox(
                        width: 10.0,
                      ),
                      Opacity(
                        opacity: 0.50,
                        child: FilterChip(
                          labelStyle: TextStyle(
                            backgroundColor: Colors.transparent,
                            color: Colors.black,
                          ),
                          label: Text('Creator'),
                        ),
                      ),
                    ],
                  ),
                  Text(
                    competition.gameType,
                    style: GcmsTheme.darkTextTheme.bodyText2,
                  ),
                  SizedBox(
                    height: 10.0,
                  ),
                  Text(competition.compDate,
                      style: GcmsTheme.darkTextTheme.bodyText2),
                ],
              ),
              decoration: BoxDecoration(
                color: Color(0xFF009DAE).withOpacity(0.6),
              ),
            ),
          ],
        ),
      ),
    );
    // return Padding(
    //   padding: const EdgeInsets.only(bottom: 20.0),
    //   child: Center(
    //     child: Container(
    //       child: Stack(
    //         children: [
    //           Text(
    //             competition.courseName,
    //             style: GcmsTheme.darkTextTheme.headline3,
    //           ),
    //           Positioned(
    //             child: Text(
    //               competition.compName,
    //               style: GcmsTheme.darkTextTheme.bodyText1,
    //             ),
    //             top: 25,
    //           ),
    //           Positioned(
    //             child: Text(
    //               competition.gameType,
    //               style: GcmsTheme.darkTextTheme.bodyText1,
    //             ),
    //             bottom: 30,
    //             right: 0,
    //           ),
    //           Positioned(
    //             child: Text(
    //               competition.compDate,
    //               style: GcmsTheme.darkTextTheme.bodyText1,
    //             ),
    //             bottom: 10,
    //             right: 0,
    //           ),
    //         ],
    //       ),
    //       padding: const EdgeInsets.all(16),
    //       constraints: const BoxConstraints.expand(
    //         width: 350,
    //         height: 150,
    //       ),
    //       decoration: BoxDecoration(
    //         color: Colors.black.withOpacity(0.6),
    //         borderRadius: const BorderRadius.all(Radius.circular(10.0)),
    //       ),
    //     ),
    //   ),
    // );
  }
}
