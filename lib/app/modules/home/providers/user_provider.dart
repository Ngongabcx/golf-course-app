import 'dart:convert';

import 'package:gcms/app/modules/Authentication/auth_model.dart';
import 'package:gcms/constants/constant.dart';
import 'package:get/get.dart';

import '../user_model.dart';

class UserProvider extends GetConnect {
  Future<Auth> refreshToken(Map data) async {
    try {
      final response =
          await post("$kApiBaseURL/authmanagement/refreshToken", data);
      if (response.status.hasError) {
        return Future.error(response.body["errors"].join(","));
      } else {
        Map<String, dynamic> resp = jsonDecode(response.bodyString);
        return Auth.fromJson(resp);
      }
    } catch (exception) {
      print('<<===REFRESH TOKEN EXCEPTION==> $exception');
      return Future.error(exception);
    }
  }

  Future<String> getUserDetails(String id) async {
    try {
      final response = await get("$kApiBaseURL/members/$id");
      if (response.status.hasError) {
        return Future.error(response.body["errors"].join(","));
      } else {
        return response.bodyString;
      }
    } catch (exception) {
      print('<<===GET USER DETAILS EXCEPTION==> $exception');
      return Future.error(exception);
    }
  }

  Future<List<User>> getPlayers() async {
    try {
      final response = await get("$kApiBaseURL/members");
      if (response.status.hasError) {
        return Future.error(response.statusText);
      } else {
        List<dynamic> resp =
            List<dynamic>.from(jsonDecode(response.bodyString));
        return resp.map((item) => User.fromJson(item)).toList();
      }
    } catch (exception) {
      print('<<===GET PLAYERS EXCEPTION2==> $exception');
      return Future.error(exception);
    }
  }

  //Create user after account registration
  Future<User> createUser(Map data) async {
    try {
      final response = await post("$kApiBaseURL/members", data);
      //final body = json.decode(response.bodyString);
      if (response.status.hasError) {
        return Future.error(response.statusText);
      } else {
        Map<String, dynamic> resp = jsonDecode(response.bodyString);
        return User.fromJson(resp);
      }
    } catch (exception) {
      print('<<===REGISTER USER EXCEPTION ==> $exception');
      return Future.error(exception);
    }
  }
}
