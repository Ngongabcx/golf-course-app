import 'package:flutter/material.dart';
import 'package:gcms/app/modules/ActiveGameScreen/views/search_card.dart';
import 'package:gcms/app/modules/Events/course.dart';
import 'package:gcms/app/modules/Events/views/widgets/event_filter_list.dart';
import 'package:gcms/app/modules/Events/views/widgets/event_list_view.dart';
import 'package:gcms/app/modules/SettingScreen/views/setting_screen_view.dart';
import 'package:gcms/constants/constant.dart';
import 'package:get/get.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../controllers/events_controller.dart';
import 'widgets/event_info.dart';

class EventsView extends GetView<EventsController> {
  final EventsController _controller = Get.find();
  final events = Course.generateCourse();
  final pageController = PageController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kBackgroundColor,
      appBar: AppBar(
        iconTheme: const IconThemeData(color: Colors.black),
        backgroundColor: kBackgroundColor,
        actions: [
          IconButton(
            icon: Icon(
              Icons.settings_outlined,
            ),
            onPressed: () {
              // do something
              Get.to(SettingScreenView());
            },
          ),
        ],
        elevation: 0.0,
      ),
      body: Column(
        children: [
          EventInfo(),
          Container(
            margin: EdgeInsets.only(top: 0),
            padding: EdgeInsets.symmetric(horizontal: 20),
            child: SearchCard(),
          ),
          EventFilterList(_controller.selected.value, (int index) {
            _controller.selected.value = index;
            pageController.jumpToPage(index);
          }, events),
          Expanded(
            child: EventListView(
              _controller.selected.value,
              (int index) {
                _controller.selected.value = index;
              },
              pageController,
              events,
            ),
          ),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 25),
            height: 50,
            child: SmoothPageIndicator(
              controller: pageController,
              count: events.event.length,
              effect: CustomizableEffect(
                dotDecoration: DotDecoration(
                  width: 8,
                  height: 8,
                  color: Colors.grey.withOpacity(0.5),
                  borderRadius: BorderRadius.circular(8),
                ),
                activeDotDecoration: DotDecoration(
                  width: 10,
                  height: 10,
                  color: kBackgroundColor,
                  borderRadius: BorderRadius.circular(10),
                  dotBorder: DotBorder(
                    color: kPrimaryColor,
                    padding: 2,
                    width: 2,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
