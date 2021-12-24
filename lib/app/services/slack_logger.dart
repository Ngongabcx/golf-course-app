import 'package:dio/dio.dart';
import 'package:gcms/constants/constant.dart';

Future<void> logToChannel(Map data) async {
  try {
    var response = await Dio().post(kSlackLogChannelURL,data:data);
    print(response);
  } catch (e) {
    print("***EXCEPTION WHEN SENDING SLACK LOG ---> $e");
  }
}