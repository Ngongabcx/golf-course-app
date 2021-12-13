import 'package:gcms/app/modules/SetupScreen/competition_model.dart';
import 'package:gcms/constants/constant.dart';
import 'package:get/get.dart';

class ActiveGamesProvider extends GetConnect {
  Future<Competition> getActiveMatches() async {
    try {
      final response = await get("$kApiBaseURL/competitions");
      if (response.status.hasError) {
        print('<<===GET COMPETITIONS  ERROR==> ${response.statusText}');
        return Future.error(response.statusText.toString());
      } else {
        final resp = competitionFromJson(response.bodyString.toString());
        print('<<===GET COMPETITIONS  SUCCESSFUL==> ${response.bodyString}');
        return resp;
      }
    } catch (exception) {
      print('<<===GET COMPETITIONS EXCEPTION2==> $exception');
      return Future.error(exception);
    }
  }
}
