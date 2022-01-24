import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:gcms/app/modules/SetupScreen/competition_model.dart';
import 'package:gcms/app/modules/utils/base_provider.dart';
import 'package:gcms/app/services/slack_logger.dart';
import 'package:gcms/constants/constant.dart';

class MatchInvitesProvider extends BaseProvider {
  Future<Competition> getMatchInvites(String id) async {
    print("######---ID FOR FETCHING MATCH INVITATIONS   ---> $id");
    try {
      final response = await dio.get("$kNewApiBaseURL/api/competitions/user/all/$id");
      return competitionFromJson(response.data.toString());
    } on DioError catch (exception) {
      if (exception.response != null) {
        if (exception.response!.statusCode == 400) {
          print(
              "RESPONSE #### --------->>>> ${exception.response!.statusCode}");
          Map<String, dynamic> res =
              jsonDecode((exception.response!.data.toString()));
          print("RESPONSE STATUS --------->>>> $res");
          //return Future.error(exception.response!.data["error"].toString());
          return competitionFromJson(exception.response!.data.toString());
        }
        return Future.error(exception.response!.statusMessage.toString());
      }
      logToChannel({"text": "$kError GET MATCH INVITES FAILURE\n $exception"});
      print('<<===GETTING MATCH INVITES EXCEPTION ==> $exception');
      return Future.error(
          "An error occured please check your internet connection.".toString());
    }
  }
}
