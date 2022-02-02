import 'package:flutter/material.dart';

class EventInfo extends StatelessWidget {
  const EventInfo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 20),
      padding: EdgeInsets.symmetric(horizontal: 25),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Expanded(
                child: Text(
                  'Find Interesting Events to attend',
                  style: Theme.of(context).textTheme.headline2,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
