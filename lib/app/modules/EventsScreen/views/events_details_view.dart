import 'package:flutter/material.dart';
import 'package:gcms/app/modules/EventsScreen/events_model.dart';
import 'package:gcms/constants/constant.dart';
import 'package:get/get.dart';

class EventsDetailsView extends GetView {
  final Event event;
  EventsDetailsView({required this.event});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Events details'),
        centerTitle: true,
      ),
      body: SafeArea(
        child: Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.height,
          padding: EdgeInsets.only(left: 20, bottom: 20),
          child: Padding(
            padding: const EdgeInsets.only(top: 20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  event.label,
                  style: Theme.of(context).textTheme.headline5,
                ),
                SizedBox(
                  height: 20.0,
                ),
                Text(event.location),
                SizedBox(
                  height: 50.0,
                ),
                Row(
                  children: [
                    Expanded(
                      flex: 1,
                      child: Icon(
                        Icons.access_time,
                        size: 30.0,
                        color: kPrimaryColor,
                      ),
                    ),
                    Expanded(
                      flex: 2,
                      child: Text(
                        event.time,
                        style: Theme.of(context).textTheme.bodyText2,
                      ),
                    ),
                    Expanded(
                      flex: 2,
                      child: Icon(
                        Icons.calendar_today_outlined,
                        size: 30.0,
                        color: kPrimaryColor,
                      ),
                    ),
                    Expanded(
                      flex: 4,
                      child: Text(
                        event.date,
                        style: Theme.of(context).textTheme.bodyText2,
                      ),
                    )
                  ],
                ),
                SizedBox(
                  height: 20,
                ),
                Row(
                  children: [
                    Expanded(
                      flex: 1,
                      child: Icon(
                        Icons.location_on,
                        size: 30.0,
                        color: kPrimaryColor,
                      ),
                    ),
                    Expanded(
                      flex: 10,
                      child: Text(event.location),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
