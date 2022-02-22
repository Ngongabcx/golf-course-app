import 'package:flutter/cupertino.dart';
import 'package:gcms/app/modules/Events/models/event.dart' as event;
import 'package:gcms/app/modules/Events/providers/events_provider.dart';
import 'package:get/get.dart';

class EventsController extends GetxController {
  var selected = 0.obs;
  var eventList = <event.Payload>[].obs;
  final pageController = PageController();
  var isProcessing = false.obs;
  final count = 0.obs;
  @override
  void onInit() async {
    super.onInit();
    getEvents();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {}
  void increment() => count.value++;

  getEvents() async {
    print('GET EVENTS CALLED');
    try {
      isProcessing(true);

      await EventsProvider().getEvents().then((resp) async {
        eventList.addAll(resp.payload!);
        debugPrint('RESPONSE -----> $resp');
        debugPrint('PAYLOAD -----> ${resp.payload}');

        isProcessing(false);
      }, onError: (err) {
        debugPrint(
            'Application threw this Error ------------> ${err.toString()}');
      });
    } catch (exception) {
      debugPrint(
          'Application threw Exception --------------> ${exception.toString()}');
      isProcessing(false);
    }
  }
}
