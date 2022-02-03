import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:gcms/app/modules/Authentication/auth_model.dart';
import 'package:gcms/app/modules/utils/base_provider.dart';
import 'package:gcms/app/services/slack_logger.dart';
import 'package:gcms/constants/constant.dart';

import '../user_model.dart';

class UserProvider extends BaseProvider {
  Future<Auth> refreshToken(Map data) async {
    print("PAYLOAD TO REFRESH TOKEN -->$data");
    try {
      final response = await dio
          .post("$kNewApiBaseURL/api/authmanagement/refreshToken", data: data);
      Map<String, dynamic> resp = jsonDecode(response.data.toString());
      return Auth.fromJson(resp);
    } on DioError catch (exception) {
      if (exception.response != null) {
        if (exception.response!.statusCode == 400) {
          Map<String, dynamic> res =
              jsonDecode((exception.response!.data.toString()));
          print("RESPONSE STATUS --------->>>> $res");
          return Future.error(res["errors"].toString());
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
      final response = await dio.get("$kNewApiBaseURL/api/users/$id");
      print(
          "RESPONSE GET USER DETAILS --------->>>> ${response.statusMessage}");
      return response.data.toString();
    } on DioError catch (exception) {
      if (exception.response != null) {
        if (exception.response!.statusCode == 400) {
          Map<String, dynamic> res =
              jsonDecode((exception.response!.data.toString()));
          print("RESPONSE GET USER DETAILS --------->>>> $res");
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

  Future<String> updateUserDetails(Map data, String id) async {
    try {
      print("NEW FCM TOKEN _---->>> $data");
      final response =
          await dio.put("$kNewApiBaseURL/api/users/$id", data: data);
      print(
          "RESPONSE UPDATE USER DETAILS --------->>>> ${response.statusMessage}");
      return response.data.toString();
    } on DioError catch (exception) {
      if (exception.response != null) {
        if (exception.response!.statusCode == 400) {
          Map<String, dynamic> res =
              jsonDecode((exception.response!.data.toString()));
          print("RESPONSE UPDATE USER DETAILS --------->>>> $res");
          logToChannel(
              {"text": "$kFatal UPDATE USER DETAILS FAILURE\n $exception"});
          return Future.error(exception.response!.data["error"].toString());
        }
        return Future.error(exception.response!.statusMessage.toString());
      }
      logToChannel(
          {"text": "$kFatal UPDATE USER DETAILS FAILURE\n $exception"});
      print('<<===UPDATING USER DETAILS EXCEPTION ==> $exception');
      return Future.error(
          "An error occured please check your internet connection.".toString());
    }
  }

  Future<List<Payload>> getPlayers() async {
    print(
        "---------------------EXECUTING GET PLAYERS PROVIDER-------------------------");
    try {
      final response = await dio.get("$kNewApiBaseURL/api/users");
      var user = userFromJson(response.data.toString());
      return user.payload!.toList();
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
  Future<String> createUser(Map data) async {
    try {
      final response = await dio.post("$kNewApiBaseURL/api/users", data: data);
      return response.data.toString();
    } on DioError catch (exception) {
      if (exception.response != null) {
        if (exception.response!.statusCode == 400) {
          Map<String, dynamic> res =
              jsonDecode((exception.response!.data.toString()));
          print("RESPONSE CREATE USER DETAILS --------->>>> $res");
          logToChannel({
            "text": "$kError CREATE USER FAILURE\n ${exception.response!.data}"
          });
          return Future.error(exception.response!.data["message"].toString());
        }
        logToChannel({"text": "$kError CREATE USER FAILURE\n $exception"});
        return Future.error(exception.response!.statusMessage.toString());
      }
      print(exception.response!.statusMessage.toString());
      logToChannel({"text": "$kError CREATE USER FAILURE\n $exception"});
      print('<<===CREATING USER EXCEPTION ==> $exception');
      return Future.error(
          "An error occured please check your internet connection.".toString());
    }
  }
     Future<Auth> deleteUser(String id) async {
    try {
      final response = await dio
          .delete("$kNewApiBaseURL/api/users/$id");
      Map<String, dynamic> resp = jsonDecode(response.data.toString());
      return Auth.fromJson(resp);
    } on DioError catch (exception) {
      if (exception.response != null) {
        if (exception.response!.statusCode == 400) {
          Map<String, dynamic> res =
              jsonDecode((exception.response!.data.toString()));
          print("RESPONSE STATUS --------->>>> $res");
          return Future.error(res["errors"].toString());
        }
        return Future.error(exception.response!.statusMessage.toString());
      }
      logToChannel({"text": "$kError DELETING USER FAILURE\n $exception"});
      print('<<===DELETING USER EXCEPTION ==> $exception');
      return Future.error(
          "An error occured please check your internet connection.".toString());
    }
  }
}
