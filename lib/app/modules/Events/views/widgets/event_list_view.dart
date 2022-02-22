import 'package:flutter/material.dart';
import 'package:gcms/app/modules/Events/controllers/events_controller.dart';
import 'package:get/get.dart';

import 'event_item.dart';

class EventListView extends StatelessWidget {
  final _controller = Get.put(EventsController());
  final int selected;
  final Function callback;
  final PageController pageController;

  // final Course events;

  EventListView(this.selected, this.callback, this.pageController);

  @override
  Widget build(BuildContext context) {
    // final category = events.event.keys.toList();
    final events = _controller.eventList;
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 25),
      child: Obx(() {
        return PageView(
          controller: pageController,
          onPageChanged: (index) => callback(index),
          children: events
              .map(
                (e) => ListView.separated(
                  padding: EdgeInsets.zero,
                  itemBuilder: (context, index) => EventItem(events[index]),
                  separatorBuilder: (_, index) => SizedBox(
                    height: 15,
                  ),
                  itemCount: events.length,
                ),
              )
              .toList(),
        );
      }),
    );
  }
}
