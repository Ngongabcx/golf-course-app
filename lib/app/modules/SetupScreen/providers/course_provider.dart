import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:gcms/app/modules/utils/base_provider.dart';
import 'package:gcms/app/services/slack_logger.dart';
import 'package:gcms/constants/constant.dart';

import '../course_model.dart';

class CourseProvider extends BaseProvider {
  Future<List<Payload>> getCourses() async {
    try {
      final response = await dio.get("$kNewApiBaseURL/api/courses");
      final competition = competitionFromJson(response.data.toString());
      return competition.payload!.toList();
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
      logToChannel({"text": "$kError GET COURSES FAILURE\n $exception"});
      print('<<===GETTING COURSES EXCEPTION ==> $exception');
      return Future.error(
          "An error occured please check your internet connection.".toString());
    }
  }
}
