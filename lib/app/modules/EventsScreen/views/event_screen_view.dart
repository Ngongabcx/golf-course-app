import 'package:flutter/material.dart';
import 'package:gcms/app/modules/ActiveGameScreen/views/search_card.dart';
import 'package:gcms/app/modules/EventsScreen/events_model.dart';
import 'package:gcms/app/modules/EventsScreen/views/events_details_view.dart';
import 'package:gcms/app/modules/EventsScreen/views/widgets/events_card.dart';
import 'package:get/get.dart';

import '../controllers/event_screen_controller.dart';

class EventScreenView extends GetView<EventScreenController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        iconTheme: const IconThemeData(color: Colors.black),
        automaticallyImplyLeading: true,
        title: Text(
          ' Events',
          style: Theme.of(context).textTheme.headline3,
        ),
        actions: [],
        centerTitle: true,
        elevation: 4,
      ),
      body: SafeArea(
        child: Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          padding: const EdgeInsets.all(20.0),
          child: Column(
            children: [
              SearchCard(),
              Expanded(
                child: Center(
                  child: ListView.builder(
                    itemCount: Event.events.length,
                    itemBuilder: (BuildContext context, int index) {
                      return GestureDetector(
                        onTap: () {
                          Get.to(
                            EventsDetailsView(event: Event.events[index]),
                          );
                        },
                        child: Padding(
                          padding: const EdgeInsets.only(top: 20.0),
                          child: EventsCard(
                            event: Event.events[index],
                          ),
                        ),
                      );
                    },
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
