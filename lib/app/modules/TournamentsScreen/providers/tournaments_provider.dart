import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:gcms/app/modules/SetupScreen/competition_model.dart';
import 'package:gcms/app/modules/utils/base_provider.dart';
import 'package:gcms/app/services/slack_logger.dart';
import 'package:gcms/constants/constant.dart';

class TournamentsProvider extends BaseProvider {
  Future<Competition> getTournaments(var page) async {
    try {
      final response = await dio.get(
          "$kNewApiBaseURL/api/competitions?PageSize=$kPageSize&PageNumber=$page");
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
      logToChannel({"text": "$kError GET COMPETITION FAILURE\n $exception"});
      print('<<===GETTING COMPETITION EXCEPTION ==> $exception');
      return Future.error(
          "An error occured please check your internet connection.".toString());
    }
  }
}
