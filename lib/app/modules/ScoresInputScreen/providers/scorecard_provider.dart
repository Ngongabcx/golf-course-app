import 'dart:convert';

import 'package:gcms/constants/constant.dart';
import 'package:get/get.dart';

import '../scorecard_model.dart';

class ScorecardProvider extends GetConnect {
  Future<Scorecard> addScorecard(data,compId,userId) async {
    try {
      final response = await post("$kApiBaseURL/scorecards/$compId/$userId", data);
      //final body = json.decode(response.bodyString);
      if (response.status.hasError) {
        return Future.error(response.statusText);
      } else {
        Map<String, dynamic> resp = jsonDecode(response.bodyString);
        return Scorecard.fromJson(resp);
      }
    } catch (exception) {
      print('<<=== EXCEPTION ==> $exception');
      return Future.error(exception);
    }
  }

  // @override
  // void onInit() {
  //   httpClient.defaultDecoder = (map) {
  //     if (map is Map<String, dynamic>) return Scorecard.fromJson(map);
  //     if (map is List)
  //       return map.map((item) => Scorecard.fromJson(item)).toList();
  //   };
  //   httpClient.baseUrl = 'YOUR-API-URL';
  // }
  //
  // Future<Scorecard> getScorecard(int id) async {
  //   final response = await get('scorecard/$id');
  //   return response.body;
  // }
  //
  // Future<Response<Scorecard>> postScorecard(Scorecard scorecard) async =>
  //     await post('scorecard', scorecard);
  //
  // Future<Response> deleteScorecard(int id) async =>
  //     await delete('scorecard/$id');
}
