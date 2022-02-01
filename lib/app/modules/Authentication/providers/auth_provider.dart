import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:gcms/app/modules/utils/base_provider.dart';
import 'package:gcms/app/services/slack_logger.dart';
import 'package:gcms/constants/constant.dart';

import '../auth_model.dart';

class AuthProvider extends BaseProvider {
  //LOGIN
  Future<Auth> login(Map data) async {
    try {
      final response = await dio
          .post("$kNewApiBaseURL/api/authmanagement/login", data: data);
      print(
          "*************LOGIN RESPONSE --> ${response.statusCode.toString()}");
      print('<<===LOGIN RESPONSE BODY==> ${response.data.toString()}');
      Map<String, dynamic> resp = jsonDecode((response.data.toString()));
      return Auth.fromJson(resp);
    } on DioError catch (exception) {
      if (exception.response != null) {
        if (exception.response!.statusCode == 400) {
          Map<String, dynamic> res =
              jsonDecode((exception.response!.data.toString()));
          print("RESPONSE STATUS --------->>>> $res");
          return Future.error(res["errors"].join(","));
        }
        return Future.error(exception.response!.statusMessage.toString());
      }
      logToChannel({"text": "$kError LOGIN FAILURE\n $exception"});
      print('<<===LOGIN EXCEPTION ==> $exception');
      return Future.error(
          "An error occured please check your internet connection.".toString());
    }
  }

  Future<Auth> register(Map data) async {
    try {
      final response = await dio
          .post("$kNewApiBaseURL/api/authmanagement/register", data: data);
      Map<String, dynamic> resp = jsonDecode(response.data.toString());
      return Auth.fromJson(resp);
    } on DioError catch (exception) {
      if (exception.response != null) {
        if (exception.response!.statusCode == 400) {
          Map<String, dynamic> res =
              jsonDecode((exception.response!.data.toString()));
          print("RESPONSE STATUS --------->>>> $res");
          return Future.error(exception.response!.data["errors"].toString());
        }
        return Future.error(exception.response!.statusMessage.toString());
      }
      logToChannel({"text": "$kError REGISTERING USER FAILURE\n $exception"});
      print('<<===REGISTERING USER EXCEPTION ==> $exception');
      return Future.error(
          "An error occured please check your internet connection.".toString());
    }
  }

  Future<Auth> updateRegister(Map data, String id) async {
    try {
      final response = await dio.post(
          "$kNewApiBaseURL/api/authmanagement/update-details/$id",
          data: data);
      Map<String, dynamic> resp = jsonDecode(response.data.toString());
      return Auth.fromJson(resp);
    } on DioError catch (exception) {
      if (exception.response != null) {
        if (exception.response!.statusCode == 400) {
          Map<String, dynamic> res =
              jsonDecode((exception.response!.data.toString()));
          print("RESPONSE STATUS --------->>>> $res");
          return Future.error(exception.response!.data["errors"][0].toString());
        }
        return Future.error(exception.response!.statusMessage.toString());
      }
      logToChannel({"text": "$kError REGISTERING USER FAILURE\n $exception"});
      print('<<===REGISTERING USER EXCEPTION ==> $exception');
      return Future.error(
          "An error occured please check your internet connection.".toString());
    }
  }
}
