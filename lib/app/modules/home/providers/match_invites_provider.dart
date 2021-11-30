import 'package:gcms/constants/constant.dart';
import 'package:get/get.dart';
import '../match_invites_model.dart';

class MatchInvitesProvider extends GetConnect {
  Future<MatchInvites> getMatchInvites(String id) async {
    print("######---ID FOR FETCHING MATCH INVITATIONS   ---> $id");
    try {
      final response = await get("$kApiBaseURL/invites/all/$id");
      if (response.status.hasError) {
        print('<<===GET MATCH INVITATIONS  ERROR==> ${response.statusText}');
        return Future.error(response.statusText);
      } else {
        final resp =
            matchInvitesFromJson(response.bodyString);
        print('<<===GET MATCH INVITATIONS  SUCCESSFUL==> ${response.bodyString}');
        return resp;
      }
    } catch (exception) {
      print('<<===GET MATCH INVITATIONS EXCEPTION2==> $exception');
      return Future.error(exception);
    }
  }
}
