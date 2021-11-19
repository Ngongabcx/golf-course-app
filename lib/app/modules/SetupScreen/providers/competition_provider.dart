import 'dart:convert';

import 'package:gcms/constants/constant.dart';
import 'package:get/get.dart';

import '../competition_model.dart';

class CompetitionProvider extends GetConnect {
  Future<Competition> createCompetition(Map data) async {
    try {
      final response = await post("$kApiBaseURL/members", data);
      //final body = json.decode(response.bodyString);
      if (response.status.hasError) {
        return Future.error(response.statusText);
      } else {
        Map<String, dynamic> resp = Map<String, dynamic>.from(jsonDecode(response.bodyString));
        return Competition.fromJson(resp);
      }
    } catch (exception) {
      print('<<===REGISTER USER EXCEPTION ==> $exception');
      return Future.error(exception);
    }
  }
}
