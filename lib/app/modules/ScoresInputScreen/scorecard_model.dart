class Scorecard {
  int id;
  double score;
  String timestamp;
  double result;
  bool confirmed;
  int compplayerId;
  int holeId;

  Scorecard(
      {this.id,
      this.score,
      this.timestamp,
      this.result,
      this.confirmed,
      this.compplayerId,
      this.holeId});

  Scorecard.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    score = json['score'];
    timestamp = json['timestamp'];
    result = json['result'];
    confirmed = json['confirmed'];
    compplayerId = json['compplayerId'];
    holeId = json['holeId'];
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['id'] = id;
    data['score'] = score;
    data['timestamp'] = timestamp;
    data['result'] = result;
    data['confirmed'] = confirmed;
    data['compplayerId'] = compplayerId;
    data['holeId'] = holeId;
    return data;
  }
}
