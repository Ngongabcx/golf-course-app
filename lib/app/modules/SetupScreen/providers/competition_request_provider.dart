import 'package:get/get.dart';

import '../competition_request_model.dart';

class CompetitionRequestProvider extends GetConnect {
  @override
  void onInit() {
    httpClient.defaultDecoder = (map) {
      if (map is Map<String, dynamic>) return CompetitionRequest.fromJson(map);
      if (map is List)
        return map.map((item) => CompetitionRequest.fromJson(item)).toList();
    };
    httpClient.baseUrl = 'YOUR-API-URL';
  }

  Future<CompetitionRequest?> getCompetitionRequest(int id) async {
    final response = await get('competitionrequest/$id');
    return response.body;
  }

  Future<Response<CompetitionRequest>> postCompetitionRequest(
          CompetitionRequest competitionrequest) async =>
      await post('competitionrequest', competitionrequest);
  Future<Response> deleteCompetitionRequest(int id) async =>
      await delete('competitionrequest/$id');
}
