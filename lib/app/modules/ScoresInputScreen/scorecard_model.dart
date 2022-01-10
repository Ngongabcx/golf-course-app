class Scorecard {
  int? status;
  bool? success;
  String? message;
  String? error;
  Payload? payload;

  Scorecard(
      {this.status, this.success, this.message, this.error, this.payload});

  Scorecard.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    success = json['success'];
    message = json['message'];
    error = json['error'];
    payload = json['payload'] != null ? Payload?.fromJson(json['payload']) : null;
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['status'] = status;
    data['success'] = success;
    data['message'] = message;
    data['error'] = error;
    if (payload != null) {
      data['payload'] = payload!.toJson();
    }
    return data;
  }
}

class Payload {
  int? id;
  double? score;
  String? timestamp;
  double? result;
  bool? confirmed;
  int? holeId;
  Hole? hole;
  int? competitionplayerId;

  Payload(
      {this.id,
      this.score,
      this.timestamp,
      this.result,
      this.confirmed,
      this.holeId,
      this.hole,
      this.competitionplayerId});

  Payload.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    score = json['score'];
    timestamp = json['timestamp'];
    result = json['result'];
    confirmed = json['confirmed'];
    holeId = json['holeId'];
    hole = json['hole'] != null ? Hole?.fromJson(json['hole']) : null;
    competitionplayerId = json['competitionplayerId'];
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['id'] = id;
    data['score'] = score;
    data['timestamp'] = timestamp;
    data['result'] = result;
    data['confirmed'] = confirmed;
    data['holeId'] = holeId;
    if (hole != null) {
      data['hole'] = hole!.toJson();
    }
    data['competitionplayerId'] = competitionplayerId;
    return data;
  }
}

class Hole {
  int? id;
  int? holeNo;
  int? yellow;
  int? white;
  int? blue;
  int? red;
  int? par;
  int? stroke;
  int? courseId;

  Hole(
      {this.id,
      this.holeNo,
      this.yellow,
      this.white,
      this.blue,
      this.red,
      this.par,
      this.stroke,
      this.courseId});

  Hole.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    holeNo = json['holeNo'];
    yellow = json['yellow'];
    white = json['white'];
    blue = json['blue'];
    red = json['red'];
    par = json['par'];
    stroke = json['stroke'];
    courseId = json['courseId'];
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['id'] = id;
    data['holeNo'] = holeNo;
    data['yellow'] = yellow;
    data['white'] = white;
    data['blue'] = blue;
    data['red'] = red;
    data['par'] = par;
    data['stroke'] = stroke;
    data['courseId'] = courseId;
    return data;
  }
}
