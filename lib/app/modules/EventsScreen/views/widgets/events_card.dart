import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gcms/app/modules/EventsScreen/events_model.dart';
import 'package:gcms/constants/constant.dart';
import 'package:gcms/theme/gcms_theme.dart';

class EventsCard extends StatelessWidget {
  final Event event;
  const EventsCard({Key? key, required this.event}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 50,
      child: Card(
        clipBehavior: Clip.antiAlias,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(bottom: 16.0),
              child: ListTile(
                leading: Icon(
                  Icons.event,
                  size: 30.0,
                  color: Colors.black,
                ),
                trailing: Icon(
                  Icons.bookmark_outline,
                  size: 30.0,
                  color: Colors.black,
                ),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Card(
                    child: Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Column(
                        children: [
                          Text(
                            '24',
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 16.0,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Text('Jan'),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
            Container(
              padding: EdgeInsets.all(15.0),
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(color: kPrimaryColor),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    event.label,
                    style: GcmsTheme.darkTextTheme.bodyText1,
                  ),
                  SizedBox(
                    height: 10.0,
                  ),
                  Row(
                    children: [
                      Icon(
                        Icons.location_on,
                        color: Colors.white,
                        size: 30,
                      ),
                      Text(
                        event.location,
                        style: GcmsTheme.darkTextTheme.bodyText2,
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
