import 'dart:convert';

import 'package:gcms/constants/constant.dart';
import 'package:get/get.dart';

import '../competition_model.dart';

class CompetitionProvider extends GetConnect {
  Future<Competition> createCompetition(Map data) async {
    try {
      final response = await post("$kApiBaseURL/competitions", data);
      //final body = json.decode(response.bodyString);
      if (response.status.hasError) {
        return Future.error(response.statusText);
      } else {
        Map<String, dynamic> resp = Map<String, dynamic>.from(jsonDecode(response.bodyString));
        return Competition.fromJson(resp);
      }
    } catch (exception) {
      print('<<===CREATING COMPETITION EXCEPTION ==> $exception');
      return Future.error(exception);
    }
  }
}
