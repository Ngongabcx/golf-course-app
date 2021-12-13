import 'dart:convert';

import 'package:gcms/constants/constant.dart';
import 'package:get/get.dart';

import '../scorecard_model.dart';

class ScorecardProvider extends GetConnect {
  Future<Scorecard> addScorecard(data, compId, userId) async {
    print("Posting scores --> $data");
    print("Competition Id --> $compId");
    print("UserId ---> $userId");
    try {
      final response =
          await post("$kApiBaseURL/scorecards/$compId/$userId", data);
      //final body = json.decode(response.bodyString);
      if (response.status.hasError) {
        print("POST SCORES RESPONSE  --> ${response.body.toString()}");
        return Future.error(response.statusText.toString());
      } else {
        Map<String, dynamic> resp = jsonDecode(response.bodyString.toString());
        return Scorecard.fromJson(resp);
      }
    } catch (exception) {
      print('<<=== EXCEPTION ==> $exception');
      return Future.error(exception);
    }
  }

  
}
