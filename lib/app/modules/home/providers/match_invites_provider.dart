import 'package:gcms/app/modules/SetupScreen/competition_model.dart';
import 'package:gcms/constants/constant.dart';
import 'package:get/get.dart';

class MatchInvitesProvider extends GetConnect {
  Future<Competition> getMatchInvites(String id) async {
    print("######---ID FOR FETCHING MATCH INVITATIONS   ---> $id");
    try {
      final response = await get("$kApiBaseURL/invites/all/$id");
      if (response.status.hasError) {
        print('<<===GET MATCH INVITATIONS  ERROR==> ${response.statusText}');
        return Future.error(response.statusText);
      } else {
        final resp =
            competitionFromJson(response.bodyString);
        print('<<===GET MATCH INVITATIONS  SUCCESSFUL==> ${response.bodyString}');
        return resp;
      }
    } catch (exception) {
      print('<<===GET MATCH INVITATIONS EXCEPTION2==> $exception');
      return Future.error(exception);
    }
  }
}
