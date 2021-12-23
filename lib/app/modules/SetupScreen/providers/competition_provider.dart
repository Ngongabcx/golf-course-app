import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:gcms/app/modules/utils/slack_logger.dart';
import 'package:gcms/constants/constant.dart';

import '../competition_model.dart';

class CompetitionProvider {
  final Dio dio = Dio(BaseOptions(
    connectTimeout: kConnectionTimeout,
    receiveTimeout: kReceiveTimeout,
    baseUrl: kApiBaseURL,
    contentType: 'application/json',
    responseType: ResponseType.plain,
  ));
  Future<Competition> createCompetition(Map data) async {
    print(
        "PROVIDER RECEIVED DATA TO SEND AS CREATE COMPETITION REQUEST ----> $data");
    try {
      final response = await dio.post("$kApiBaseURL/competitions", data: data);
      if (response.statusCode !=201) {
        return Future.error(response.statusMessage.toString());
      } else {
        print(
            "SUCCESSFUL COMPETITION RESPONSE -->>> ${response.data.toString()}");
        final resp = competitionFromJson(response.data.toString());
        return resp;
      }
    } catch (exception) {
      logToChannel({"text":"$kError CREATE COMPETITION FAILURE\n $exception"});
      print('<<===CREATING COMPETITION EXCEPTION ==> $exception');
      return Future.error(exception);
    }
  }

  Future<Competition> getCompetition(int id) async {
    print("PROVIDER RECEIVED ID TO PASS AS GET COMPETITION REQUEST ----> $id");
    try {
      final response = await dio.get("$kApiBaseURL/competitions/$id");
      if (response.statusCode != 200) {
        return Future.error(response.statusMessage.toString());
      } else {
        Map<String, dynamic> resp =
            Map<String, dynamic>.from(jsonDecode(response.data.toString()));
        print("DECODED JSON TO MAP --> $resp");
        return Competition.fromJson(resp);
        //return resp['payload']['id'];
      }
    } catch (exception) {
      logToChannel({"text":"$kError GET COMPETITION FAILURE\n $exception"});
      print('<<===GET COMPETITION EXCEPTION ==> $exception');
      return Future.error(exception);
    }
  }
}
