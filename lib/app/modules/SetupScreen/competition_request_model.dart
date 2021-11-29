class CompetitionRequest {
  String compName;
  int gametypeId;
  int compFee;
  String compDate;
  String compTime;
  String gameHoles;
  int startingHole;
  int courseId;
  List<int> competitionPlayer;

  CompetitionRequest(
      {this.compName,
      this.gametypeId,
      this.compFee,
      this.compDate,
      this.compTime,
      this.gameHoles,
      this.startingHole,
      this.courseId,
      this.competitionPlayer});

  CompetitionRequest.fromJson(Map<String, dynamic> json) {
    compName = json['CompName'];
    gametypeId = json['GametypeId'];
    compFee = json['CompFee'];
    compDate = json['CompDate'];
    compTime = json['CompTime'];
    gameHoles = json['GameHoles'];
    startingHole = json['startingHole'];
    courseId = json['CourseId'];
    competitionPlayer = json['CompetitionPlayer'].cast<int>();
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['CompName'] = compName;
    data['GametypeId'] = gametypeId;
    data['CompFee'] = compFee;
    data['CompDate'] = compDate;
    data['CompTime'] = compTime;
    data['GameHoles'] = gameHoles;
    data['startingHole'] = startingHole;
    data['CourseId'] = courseId;
    data['CompetitionPlayer'] = competitionPlayer;
    return data;
  }
}
