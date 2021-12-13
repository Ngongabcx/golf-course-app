import 'dart:convert';

import 'package:gcms/constants/constant.dart';
import 'package:get/get.dart';

import '../course_model.dart';

class CourseProvider extends GetConnect {

  Future<List<Course>> getCourses() async {
    try {
      final response = await get("$kApiBaseURL/course");
      if (response.status.hasError) {
        return Future.error(response.statusText.toString());
      } else {
        List<dynamic> resp = List<dynamic>.from(jsonDecode(response.bodyString.toString()));
        return resp.map((item) => Course.fromJson(item)).toList();
      }
    } catch (exception) {
      print('<<===GET COURSES EXCEPTION2==> $exception');
      return Future.error(exception);
    }
  }
}