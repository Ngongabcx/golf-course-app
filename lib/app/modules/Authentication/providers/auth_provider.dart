import 'dart:convert';

import 'package:gcms/constants/constant.dart';
import 'package:get/get.dart';

import '../auth_model.dart';

class AuthProvider extends GetConnect {
  //LOGIN
  Future<Auth> login(Map data) async {
    try {
       print("DATA TO CREATE COMPETITION =====> $data");
      final response = await post("$kApiBaseURL/authmanagement/login", data);
      if (response.status.hasError) {
        return Future.error(response.body["errors"].join(","));
      } else {
        print('<<===LOGIN RESPONSE BODY==> ${response.body.toString()}');
        Map<String, dynamic> resp = jsonDecode(response.bodyString);
        return Auth.fromJson(resp);
      }
    } catch (exception) {
      print('<<===LOGIN EXCEPTION ==> $exception');
      return Future.error(exception);
    }
  }
    Future<Auth> register(Map data) async {
    try {
      final response = await post("$kApiBaseURL/authmanagement/register", data);
      //final body = json.decode(response.bodyString);
      if (response.status.hasError) {
        return Future.error(response.statusText);
      } else {
        Map<String, dynamic> resp = jsonDecode(response.bodyString);
        return Auth.fromJson(resp);
      }
    } catch (exception) {
      print('<<===LOGIN EXCEPTION ==> $exception');
      return Future.error(exception);
    }
  }
}
