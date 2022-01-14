import 'package:flutter/material.dart';
import 'package:gcms/app/modules/Events/controllers/events_controller.dart';
import 'package:gcms/app/modules/Events/course.dart';
import 'package:gcms/constants/constant.dart';
import 'package:get/get.dart';

class EventFilterList extends StatelessWidget {
  var controller = Get.put(EventsController());
  final int selected;
  final Function callBack;
  final Course events;

  EventFilterList(this.selected, this.callBack, this.events);

  @override
  Widget build(BuildContext context) {
    final category = events.event.keys.toList();
    return Container(
      height: 100,
      padding: EdgeInsets.symmetric(vertical: 30),
      child: ListView.separated(
          padding: EdgeInsets.symmetric(horizontal: 25),
          scrollDirection: Axis.horizontal,
          itemBuilder: (context, index) => GestureDetector(
                onTap: () => callBack(index),
                child: Obx(() {
                  return Container(
                    padding: EdgeInsets.symmetric(vertical: 10, horizontal: 15),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: controller.selected == index
                          ? kPrimaryColor
                          : Colors.white,
                    ),
                    child: Text(
                      category[index],
                      style: Theme.of(context).textTheme.bodyText1,
                    ),
                  );
                }),
              ),
          separatorBuilder: (_, index) => SizedBox(
                width: 20,
              ),
          itemCount: category.length),
    );
  }
}
