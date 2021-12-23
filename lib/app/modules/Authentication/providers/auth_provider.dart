import 'dart:convert';
import 'package:gcms/app/modules/utils/base_provider.dart';
import 'package:gcms/app/modules/utils/slack_logger.dart';
import 'package:gcms/constants/constant.dart';

import '../auth_model.dart';

class AuthProvider extends BaseProvider {
  //LOGIN
  Future<Auth> login(Map data) async {
    try {
      final response =
          await dio.post("$kApiBaseURL/authmanagement/login", data: data);
      print(
          "*************LOGGIN RESPONSE --> ${response.statusCode.toString()}");
      if (response.statusCode != 200) {
        print("**********RESPONSE IS NOT STATUS 200");
        if (response.statusCode == 400) {
          print(
              "RESPONSE STATUS --------->>>> ${response.data["errors"].join(",")}");
          return Future.error(response.data["errors"].join(","));
        }
        print("RESPONSE ERROR --------->>>> ${response.statusMessage}");
        return Future.error("Could not connect to server.".toString());
      } else {
        print('<<===LOGIN RESPONSE BODY==> ${response.data.toString()}');
        Map<String, dynamic> resp = jsonDecode((response.data.toString()));
        return Auth.fromJson(resp);
      }
    } catch (exception) {
      logToChannel({"text":"$kError LOGIN FAILURE\n $exception"});
      print('<<===LOGIN EXCEPTION ==> $exception');
      return Future.error(exception);
    }
  }

  Future<Auth> register(Map data) async {
    try {
      final response =
          await dio.post("$kApiBaseURL/authmanagement/register", data: data);
      //final body = json.decode(response.bodyString);
      if (response.statusCode != 201) {
        return Future.error(response.statusMessage.toString());
      } else {
        Map<String, dynamic> resp = jsonDecode(response.data.toString());
        return Auth.fromJson(resp);
      }
    } catch (exception) {
      logToChannel({"text":"$kError REGISTRATION FAILURE\n $exception"});
      print('<<===LOGIN EXCEPTION ==> $exception');
      return Future.error(exception);
    }
  }
}
