import 'dart:convert';

import 'package:gcms/constants/constant.dart';
import 'package:get/get.dart';

import '../competition_model.dart';

class CompetitionProvider extends GetConnect {
  Future<Competition> createCompetition(Map data) async {
    print(
        "PROVIDER RECEIVED DATA TO SEND AS CREATE COMPETITION REQUEST ----> $data");
    try {
      final response = await post("$kApiBaseURL/competitions", data);
      if (response.status.hasError) {
        return Future.error(response.statusText.toString());
      } else {
        print("SUCCESSFUL COMPETITION RESPONSE -->>> ${response.body.toString()}");
        final resp = competitionFromJson(response.bodyString.toString());
        return resp;
      }
    } catch (exception) {
      print('<<===CREATING COMPETITION EXCEPTION ==> $exception');
      return Future.error(exception);
    }
  }

  Future<Competition> getCompetition(int id) async {
    print("PROVIDER RECEIVED ID TO PASS AS GET COMPETITION REQUEST ----> $id");
    try {
      final response = await get("$kApiBaseURL/competitions/$id");
      if (response.status.hasError) {
        return Future.error(response.statusText.toString());
      } else {
        Map<String, dynamic> resp =
            Map<String, dynamic>.from(jsonDecode(response.bodyString.toString()));
        print("DECODED JSON TO MAP --> $resp");
        return Competition.fromJson(resp);
        //return resp['payload']['id'];
      }
    } catch (exception) {
      print('<<===GET COMPETITION EXCEPTION ==> $exception');
      return Future.error(exception);
    }
  }
}
