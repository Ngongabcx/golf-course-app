import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:gcms/app/modules/utils/base_provider.dart';
import 'package:gcms/app/services/slack_logger.dart';
import 'package:gcms/constants/constant.dart';

import '../scorecard_model.dart';

class ScorecardProvider extends BaseProvider {
  Future<Scorecard> addScorecard(data, compId, userId) async {
    var url = "$kNewApiBaseURL/api/scorecards/$compId/$userId";
    print("Posting scores --> $data");
    print("POST SCORES URL CREATED --> $url");
    try {
      final response = await dio.post(url, data: data);
      Map<String, dynamic> resp = jsonDecode(response.data.toString());
      return Scorecard.fromJson(resp);
    } on DioError catch (exception) {
      if (exception.response != null) {
        if (exception.response!.statusCode == 400) {
          Map<String, dynamic> res =
              jsonDecode((exception.response!.data.toString()));
          print("RESPONSE EXCEPTION --------->>>> $exception");
          return Future.error(exception.response!.data["error"].toString());
        }
        print("RESPONSE EXCEPTION --------->>>> $exception");
        return Future.error(exception.response!.statusMessage.toString());
      }
      logToChannel({"text": "$kError ADD SCORE CARD FAILURE\n $exception"});
      print('<<===POSTING SCORE CARD EXCEPTION ==> $exception');
      return Future.error(
          "An error occured please check your internet connection.".toString());
    }
  }
}
