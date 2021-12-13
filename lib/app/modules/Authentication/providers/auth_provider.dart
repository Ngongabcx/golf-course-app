import 'dart:convert';

import 'package:gcms/constants/constant.dart';
import 'package:get/get.dart';

import '../auth_model.dart';

class AuthProvider extends GetConnect {
  //LOGIN
  Future<Auth> login(Map data) async {
    try {
      final response = await post("$kApiBaseURL/authmanagement/login", data).timeout(Duration(seconds: 50));
      if (response.status.hasError) {
        if(response.statusCode == 400){
         print("RESPONSE STATUS --------->>>> ${response.body["errors"].join(",")}");
          return Future.error(response.body["errors"].join(","));
        }
        print("RESPONSE ERROR --------->>>> ${response.statusText}");
        return Future.error(response.statusText.toString());
      } else {
        print('<<===LOGIN RESPONSE BODY==> ${response.body.toString()}');
        Map<String, dynamic> resp = jsonDecode(response.bodyString.toString());
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
        return Future.error(response.statusText.toString());
      } else {
        Map<String, dynamic> resp = jsonDecode(response.bodyString.toString());
        return Auth.fromJson(resp);
      }
    } catch (exception) {
      print('<<===LOGIN EXCEPTION ==> $exception');
      return Future.error(exception);
    }
  }
}
