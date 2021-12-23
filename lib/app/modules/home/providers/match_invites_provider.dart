import 'package:dio/dio.dart';
import 'package:gcms/app/modules/SetupScreen/competition_model.dart';
import 'package:gcms/app/modules/utils/slack_logger.dart';
import 'package:gcms/constants/constant.dart';

class MatchInvitesProvider {
  final Dio dio = Dio(BaseOptions(
    connectTimeout: kConnectionTimeout,
    receiveTimeout: kReceiveTimeout,
    baseUrl: kApiBaseURL,
    contentType: 'application/json',
    responseType: ResponseType.plain,
  ));
  Future<Competition> getMatchInvites(String id) async {
    print("######---ID FOR FETCHING MATCH INVITATIONS   ---> $id");
    try {
      final response = await dio.get("$kApiBaseURL/invites/all/$id");
      if (response.statusCode != 200) {
        print('<<===GET MATCH INVITATIONS  ERROR==> ${response.statusCode}');
        return Future.error(response.statusMessage.toString());
      } else {
        final resp = competitionFromJson(response.data.toString());
        print('<<===GET MATCH INVITATIONS  SUCCESSFUL==> ${response.data}');
        return resp;
      }
    } catch (exception) {
      logToChannel({"text":"$kError FETCH INVITATIONS FAILURE\n $exception"});
      print('<<===GET MATCH INVITATIONS EXCEPTION2==> $exception');
      return Future.error(exception);
    }
  }
}
