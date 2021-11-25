import 'dart:convert';

import 'package:gcms/constants/constant.dart';
import 'package:get/get.dart';

import '../match_invites_model.dart';

class MatchInvitesProvider extends GetConnect {
  Future<List<MatchInvites>> getMatchInvites(String id) async {
    try {
      final response = await get("$kApiBaseURL/invites/all/$id");
      if (response.status.hasError) {
        return Future.error(response.statusText);
      } else {
        List<dynamic> resp =
            List<dynamic>.from(jsonDecode(response.bodyString));
        return resp.map((item) => MatchInvites.fromJson(item)).toList();
      }
    } catch (exception) {
      print('<<===GET PLAYERS EXCEPTION2==> $exception');
      return Future.error(exception);
    }
  }
}
