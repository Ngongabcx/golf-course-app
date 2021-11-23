import 'package:flutter/material.dart';
import 'package:gcms/tempModels/competetion.dart';
import 'package:gcms/theme/gcms_theme.dart';

class JoinMatchCard extends StatelessWidget {
  final TempCompetition competition;

  const JoinMatchCard({Key key, this.competition}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 16.0, bottom: 16.0),
      child: Card(
        clipBehavior: Clip.antiAlias,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ListTile(
              leading: Icon(
                Icons.stream,
                color: Colors.green,
              ),
              title: Text('Acitve'),
              trailing: Icon(
                Icons.more_horiz,
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
  }
}
