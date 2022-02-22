import 'package:flutter/material.dart';
import 'package:gcms/app/modules/Events/models/event.dart';
import 'package:intl/intl.dart';

class EventItem extends StatelessWidget {
  final Payload event;
  EventItem(this.event);

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
                        event.name!,
                        style: Theme.of(context).textTheme.headline6,
                      ),
                      Icon(
                        Icons.arrow_forward_ios_outlined,
                        size: 15,
                      )
                    ],
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Text(
                    event.location!,
                    style: Theme.of(context).textTheme.headline6,
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Text(
                    event.description!,
                    overflow: TextOverflow.ellipsis,
                    style: Theme.of(context).textTheme.bodyText2,
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Row(
                    children: [
                      Text(
                        DateFormat.yMMMMd().format(event.from!),
                        style: Theme.of(context).textTheme.bodyText1,
                      ),
                      SizedBox(
                        width: 5,
                      ),
                      Text(
                        '${DateFormat.jm().format(event.from!)} to',
                        style: Theme.of(context).textTheme.bodyText1,
                      ),
                      SizedBox(
                        width: 5,
                      ),
                      Text(
                        DateFormat.jm().format(event.to!),
                        style: Theme.of(context).textTheme.bodyText1,
                      ),
                    ],
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
