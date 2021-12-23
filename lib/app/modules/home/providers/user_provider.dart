import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:gcms/app/modules/Authentication/auth_model.dart';
import 'package:gcms/app/modules/utils/slack_logger.dart';
import 'package:gcms/constants/constant.dart';

import '../user_model.dart';

class UserProvider {
  final Dio dio = Dio(BaseOptions(
    connectTimeout: kConnectionTimeout,
    receiveTimeout: kReceiveTimeout,
    baseUrl: kApiBaseURL,
    contentType: 'application/json',
    responseType: ResponseType.plain,
  ));
  Future<Auth> refreshToken(Map data) async {
    try {
      final response = await dio
          .post("$kApiBaseURL/authmanagement/refreshToken", data: data);
      if ( response.statusCode != 201) {
        return Future.error(response.statusMessage.toString());
      } else {
        Map<String, dynamic> resp = jsonDecode(response.data.toString());
        return Auth.fromJson(resp);
      }
    } catch (exception) {
      logToChannel({"text":"$kError REFRESH TOKEN FAILURE\n $exception"});
      print('<<===REFRESH TOKEN EXCEPTION==> $exception');
      return Future.error(exception);
    }
  }

  Future<String> getUserDetails(String id) async {
    try {
      print("USER ID _---->>> $id");
      final response = await dio.get("$kApiBaseURL/members/$id");
      if (response.statusCode != 200) {
        print(
            "RESPONSE ERROR USER DETAILS ---->>----->>>> ${response.statusCode}");
        return Future.error(response.statusMessage.toString());
      } else {
        return response.data.toString();
      }
    } catch (exception) {
      logToChannel({"text":"$kError FETCH USER DETAILS FAILURE\n $exception"});
      print('<<===GET USER DETAILS EXCEPTION==> $exception');
      return Future.error(exception);
    }
  }

  Future<List<User>> getPlayers() async {
    try {
      final response = await dio.get("$kApiBaseURL/members");
      if (response.statusCode != 200) {
        return Future.error(response.statusMessage.toString());
      } else {
        List<dynamic> resp =
            List<dynamic>.from(jsonDecode(response.data.toString()));
        return resp.map((item) => User.fromJson(item)).toList();
      }
    } catch (exception) {
      logToChannel({"text":"$kError FETCH PLAYERS FAILURE\n $exception"});
      print('<<===GET PLAYERS EXCEPTION2==> $exception');
      return Future.error(exception);
    }
  }

  //Create user after account registration
  Future<User> createUser(Map data) async {
    try {
      final response = await dio.post("$kApiBaseURL/members", data: data);
      //final body = json.decode(response.bodyString);
      if (response.statusCode != 201) {
        return Future.error(response.statusMessage.toString());
      } else {
        Map<String, dynamic> resp = jsonDecode(response.data.toString());
        return User.fromJson(resp);
      }
    } catch (exception) {
      logToChannel({"text":"$kError CREATE ACCOUNT FAILURE\n $exception"});
      print('<<===REGISTER USER EXCEPTION ==> $exception');
      return Future.error(exception);
    }
  }
}
