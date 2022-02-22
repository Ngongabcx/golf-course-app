import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:gcms/app/modules/Events/models/event.dart';
import 'package:gcms/app/modules/utils/base_provider.dart';
import 'package:gcms/app/services/slack_logger.dart';
import 'package:gcms/constants/constant.dart';

class EventsProvider extends BaseProvider {
  Future<Event> getEvents() async {
    try {
      var url = '$kNewApiBaseURL/api/events/all/1';
      final response = await dio.get(url);
      print(url);
      return eventFromJson(response.data.toString());
    } on DioError catch (exception) {
      if (exception.response != null) {
        if (exception.response!.statusCode == 400) {
          Map<String, dynamic> res =
              jsonDecode((exception.response!.data.toString()));
          print("RESPONSE STATUS --------->>>> $res");
          return Future.error(exception.response!.data["error"].toString());
        }
        return Future.error(exception.response!.statusMessage.toString());
      }
      logToChannel({"text": "$kError GET EVENTS FAILURE\n $exception"});
      print('<<===GETTING EVENTS EXCEPTION ==> $exception');
      return Future.error(
          "An error occured please check your internet connection.".toString());
    }
  }
}
