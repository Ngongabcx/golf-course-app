import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:gcms/app/modules/Authentication/auth_model.dart';
import 'package:gcms/app/modules/utils/base_provider.dart';
import 'package:gcms/app/modules/utils/slack_logger.dart';
import 'package:gcms/constants/constant.dart';

import '../user_model.dart';

class UserProvider extends BaseProvider {
  Future<Auth> refreshToken(Map data) async {
    try {
      final response = await dio
          .post("$kApiBaseURL/authmanagement/refreshToken", data: data);
      Map<String, dynamic> resp = jsonDecode(response.data.toString());
      return Auth.fromJson(resp);
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
      logToChannel({"text": "$kError REFRESH TOKEN FAILURE\n $exception"});
      print('<<===REFRESHING TOKEN EXCEPTION ==> $exception');
      return Future.error(
          "An error occured please check your internet connection.".toString());
    }
  }

  Future<String> getUserDetails(String id) async {
    try {
      print("USER ID _---->>> $id");
      final response = await dio.get("$kApiBaseURL/members/$id");
      return response.data.toString();
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
      logToChannel({"text": "$kError GET USER DETAILS FAILURE\n $exception"});
      print('<<===GETTING USER DETAILS EXCEPTION ==> $exception');
      return Future.error(
          "An error occured please check your internet connection.".toString());
    }
  }

  Future<List<User>> getPlayers() async {
    try {
      final response = await dio.get("$kApiBaseURL/members");
      List<dynamic> resp =
          List<dynamic>.from(jsonDecode(response.data.toString()));
      return resp.map((item) => User.fromJson(item)).toList();
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
      logToChannel({"text": "$kError GET PLAYERS FAILURE\n $exception"});
      print('<<===GETTING PLAYERS EXCEPTION ==> $exception');
      return Future.error(
          "An error occured please check your internet connection.".toString());
    }
  }

  //Create user after account registration
  Future<User> createUser(Map data) async {
    try {
      final response = await dio.post("$kApiBaseURL/members", data: data);
      Map<String, dynamic> resp = jsonDecode(response.data.toString());
      return User.fromJson(resp);
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
      logToChannel({"text": "$kError CREATE USER FAILURE\n $exception"});
      print('<<===CREATING USER EXCEPTION ==> $exception');
      return Future.error(
          "An error occured please check your internet connection.".toString());
    }
  }
}
