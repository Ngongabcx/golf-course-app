import 'package:dio/dio.dart';
import 'package:gcms/app/modules/SetupScreen/competition_model.dart';
import 'package:gcms/constants/constant.dart';

class ActiveGamesProvider {
  final Dio dio = Dio(BaseOptions(
    connectTimeout: kConnectionTimeout,
    receiveTimeout: kReceiveTimeout,
    baseUrl: kApiBaseURL,
    contentType: 'application/json',
    responseType: ResponseType.plain,
  ));
  Future<Competition> getActiveMatches() async {
    try {
      final response = await dio.get("$kApiBaseURL/competitions");
      if (response.statusCode != 200) {
        print(
            '<<===GET COMPETITIONS  ERROR==> ${response.statusMessage.toString()}');
        return Future.error(response.statusMessage.toString());
      } else {
        final resp = competitionFromJson(response.data.toString());
        print(
            '<<===GET COMPETITIONS  SUCCESSFUL==> ${response.data.toString()}');
        return resp;
      }
    } catch (exception) {
      print('<<===GET COMPETITIONS EXCEPTION2==> $exception');
      return Future.error(exception);
    }
  }
}
