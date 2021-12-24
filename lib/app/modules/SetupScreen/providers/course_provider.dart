import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:gcms/app/modules/utils/base_provider.dart';
import 'package:gcms/app/modules/utils/slack_logger.dart';
import 'package:gcms/constants/constant.dart';

import '../course_model.dart';

class CourseProvider extends BaseProvider {
  Future<List<Course>> getCourses() async {
    try {
      final response = await dio.get("$kApiBaseURL/course");
      List<dynamic> resp =
          List<dynamic>.from(jsonDecode(response.data.toString()));
      return resp.map((item) => Course.fromJson(item)).toList();
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
