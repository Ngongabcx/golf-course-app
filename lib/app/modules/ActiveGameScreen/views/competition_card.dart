import 'package:flutter/material.dart';
import 'package:gcms/app/modules/SetupScreen/competition_model.dart';
import 'package:gcms/constants/constant.dart';
import 'package:gcms/theme/gcms_theme.dart';
import 'package:get/get_utils/src/extensions/string_extensions.dart';

class CompetitionCard extends StatelessWidget {
  final Payload competition;

  const CompetitionCard({Key? key, required this.competition}) : super(key: key);

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
                competition.course!.courseName.toString(),
                style: Theme.of(context).textTheme.headline6,
              ),
            ),
            Padding(
              padding:
                  const EdgeInsets.only(right: 16.0, left: 16.0, bottom: 16.0),
              child: Text(
                competition.compName.toString(),
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
                      // Text(
                      //   'Leonard Chinyama',
                      //   style: GcmsTheme.darkTextTheme.bodyText2,
                      // ),
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
                          label: Text('Creator'), onSelected: (bool value) {  },
                        ),
                      ),
                    ],
                  ),
                  Text(
                    competition.gametype?.name
                            .toString()
                            .split('.')
                            .last
                            .replaceAll('_', ' ')
                            .capitalizeFirst ??
                        '',
                    style: GcmsTheme.darkTextTheme.bodyText2,
                  ),
                  SizedBox(
                    height: 10.0,
                  ),
                  Text(competition.compDate.toString(),
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
