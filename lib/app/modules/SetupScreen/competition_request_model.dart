class CompetitionRequest {
  String? compName;
  double? compFee;
  String? compDate;
  String? time;
  int? gameHoles;
  int? startingHole;
  int? gametypeId;
  int? courseId;
  List<int>? playerIds;

  CompetitionRequest(
      {this.compName,
      this.compFee,
      this.compDate,
      this.time,
      this.gameHoles,
      this.startingHole,
      this.gametypeId,
      this.courseId,
      this.playerIds});

  CompetitionRequest.fromJson(Map<String, dynamic> json) {
    compName = json['CompName'];
    compFee = json['CompFee'];
    compDate = json['CompDate'];
    time = json['time'];
    gameHoles = json['gameHoles'];
    startingHole = json['startingHole'];
    gametypeId = json['gametypeId'];
    courseId = json['courseId'];
    playerIds = json['playerIds'].cast<int>();
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['CompName'] = compName;
    data['CompFee'] = compFee;
    data['CompDate'] = compDate;
    data['time'] = time;
    data['gameHoles'] = gameHoles;
    data['startingHole'] = startingHole;
    data['gametypeId'] = gametypeId;
    data['courseId'] = courseId;
    data['playerIds'] = playerIds;
    return data;
  }
}
