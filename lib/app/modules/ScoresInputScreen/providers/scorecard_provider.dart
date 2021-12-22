import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:gcms/constants/constant.dart';

import '../scorecard_model.dart';

class ScorecardProvider {
  final Dio dio = Dio(BaseOptions(
    connectTimeout: kConnectionTimeout,
    receiveTimeout: kReceiveTimeout,
    baseUrl: kApiBaseURL,
    contentType: 'application/json',
    responseType: ResponseType.plain,
  ));
  Future<Scorecard> addScorecard(data, compId, userId) async {
    print("Posting scores --> $data");
    print("Competition Id --> $compId");
    print("UserId ---> $userId");
    try {
      final response =
          await dio.post("$kApiBaseURL/scorecards/$compId/$userId", data: data);
      //final body = json.decode(response.bodyString);
      if (response.statusCode != 200 || response.statusCode !=201) {
        print("POST SCORES RESPONSE  --> ${response.data.toString()}");
        return Future.error(response.statusMessage.toString());
      } else {
        Map<String, dynamic> resp = jsonDecode(response.data.toString());
        return Scorecard.fromJson(resp);
      }
    } catch (exception) {
      print('<<=== EXCEPTION ==> $exception');
      return Future.error(exception);
    }
  }
}
