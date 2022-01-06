import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:gcms/app/modules/utils/base_provider.dart';
import 'package:gcms/app/services/slack_logger.dart';
import 'package:gcms/constants/constant.dart';

import '../competition_model.dart';

class CompetitionProvider extends BaseProvider {
  Future<Competition> createCompetition(Map data) async {
    print(
        "PROVIDER RECEIVED DATA TO SEND AS CREATE COMPETITION REQUEST ----> $data");
    try {
      final response = await dio.post("$kApiBaseURL/competitions", data: data);
      print("CREATE COMPETITION RESPONDED WITN --> ${response.data.toString()}");
      return competitionFromJson(response.data.toString());
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
      logToChannel({"text": "$kError CREATE COMPETITION FAILURE\n $exception"});
      print('<<===CREATING COMPETITION EXCEPTION ==> $exception');
      return Future.error(
          "An error occured please check your internet connection.".toString());
    }
  }

  Future<Competition> getCompetition(int id) async {
    print("PROVIDER RECEIVED ID TO PASS AS GET COMPETITION REQUEST ----> $id");
    try {
      final response = await dio.get("$kApiBaseURL/competitions/$id");
      Map<String, dynamic> resp =
          Map<String, dynamic>.from(jsonDecode(response.data.toString()));
      return Competition.fromJson(resp);
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
      logToChannel({"text": "$kError GET COMPETITION FAILURE\n $exception"});
      print('<<===GETTING COMPETITION EXCEPTION ==> $exception');
      return Future.error(
          "An error occured please check your internet connection.".toString());
    }
  }
}
