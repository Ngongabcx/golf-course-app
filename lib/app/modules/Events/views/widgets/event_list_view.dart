import 'package:flutter/material.dart';
import 'package:gcms/app/modules/Events/course.dart';

import 'event_item.dart';

class EventListView extends StatelessWidget {
  int selected;
  final Function callback;
  final PageController pageController;
  final Course events;

  EventListView(this.selected, this.callback, this.pageController, this.events);

  @override
  Widget build(BuildContext context) {
    final category = events.event.keys.toList();
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 25),
      child: PageView(
        controller: pageController,
        onPageChanged: (index) => callback(index),
        children: category
            .map(
              (e) => ListView.separated(
                  padding: EdgeInsets.zero,
                  itemBuilder: (context, index) =>
                      EventItem(events.event[category[selected]]![index]),
                  separatorBuilder: (_, index) => SizedBox(
                        height: 15,
                      ),
                  itemCount: events.event[category[selected]]!.length),
            )
            .toList(),
      ),
    );
  }
}
