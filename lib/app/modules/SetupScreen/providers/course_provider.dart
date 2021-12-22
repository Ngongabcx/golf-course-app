import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:gcms/constants/constant.dart';

import '../course_model.dart';

class CourseProvider {
  final Dio dio = Dio(BaseOptions(
    connectTimeout: kConnectionTimeout,
    receiveTimeout: kReceiveTimeout,
    baseUrl: kApiBaseURL,
    contentType: 'application/json',
    responseType: ResponseType.plain,
  ));
  Future<List<Course>> getCourses() async {
    try {
      final response = await dio.get("$kApiBaseURL/course");
      if (response.statusCode != 200) {
        return Future.error(response.statusMessage.toString());
      } else {
        List<dynamic> resp =
            List<dynamic>.from(jsonDecode(response.data.toString()));
        return resp.map((item) => Course.fromJson(item)).toList();
      }
    } catch (exception) {
      print('<<===GET COURSES EXCEPTION2==> $exception');
      return Future.error(exception);
    }
  }
}
