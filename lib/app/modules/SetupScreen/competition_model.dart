class Competition {
  int status;
  bool success;
  String message;
  String error;
  List<Payload> payload;

  Competition(
      {this.status, this.success, this.message, this.error, this.payload});

  Competition.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    success = json['success'];
    message = json['message'];
    error = json['error'];
    if (json['payload'] != null) {
      payload = <Payload>[];
      json['payload'].forEach((v) {
        payload.add(Payload.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['status'] = status;
    data['success'] = success;
    data['message'] = message;
    data['error'] = error;
    if (payload != null) {
      data['payload'] = payload.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Payload {
  int id;
  String compName;
  Gametype gametype;
  double compFee;
  String compDate;
  Course course;
  List<CompetitionPlayer> competitionPlayer;

  Payload(
      {this.id,
      this.compName,
      this.gametype,
      this.compFee,
      this.compDate,
      this.course,
      this.competitionPlayer});

  Payload.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    compName = json['compName'];
    gametype =
        json['gametype'] != null ? Gametype.fromJson(json['gametype']) : null;
    compFee = json['compFee'];
    compDate = json['compDate'];
    course = json['course'] != null ? Course.fromJson(json['course']) : null;
    if (json['competitionPlayer'] != null) {
      competitionPlayer = <CompetitionPlayer>[];
      json['competitionPlayer'].forEach((v) {
        competitionPlayer.add(CompetitionPlayer.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['id'] = id;
    data['compName'] = compName;
    if (gametype != null) {
      data['gametype'] = gametype.toJson();
    }
    data['compFee'] = compFee;
    data['compDate'] = compDate;
    if (course != null) {
      data['course'] = course.toJson();
    }
    if (competitionPlayer != null) {
      data['competitionPlayer'] =
          competitionPlayer.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Gametype {
  int id;
  String name;
  String description;

  Gametype({this.id, this.name, this.description});

  Gametype.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    description = json['description'];
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['description'] = description;
    return data;
  }
}

class Course {
  int id;
  String courseName;
  String address;
  String courseAbr;
  String email;
  String phoneNo;
  String courseImage;

  Course(
      {this.id,
      this.courseName,
      this.address,
      this.courseAbr,
      this.email,
      this.phoneNo,
      this.courseImage});

  Course.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    courseName = json['courseName'];
    address = json['address'];
    courseAbr = json['courseAbr'];
    email = json['email'];
    phoneNo = json['phoneNo'];
    courseImage = json['courseImage'];
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['id'] = id;
    data['courseName'] = courseName;
    data['address'] = address;
    data['courseAbr'] = courseAbr;
    data['email'] = email;
    data['phoneNo'] = phoneNo;
    data['courseImage'] = courseImage;
    return data;
  }
}

class CompetitionPlayer {
  int id;
  int competitionId;
  String competitionTime;
  int playerId;
  int competitionHcp;

  CompetitionPlayer(
      {this.id,
      this.competitionId,
      this.competitionTime,
      this.playerId,
      this.competitionHcp});

  CompetitionPlayer.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    competitionId = json['competitionId'];
    competitionTime = json['competitionTime'];
    playerId = json['playerId'];
    competitionHcp = json['competitionHcp'];
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['id'] = id;
    data['competitionId'] = competitionId;
    data['competitionTime'] = competitionTime;
    data['playerId'] = playerId;
    data['competitionHcp'] = competitionHcp;
    return data;
  }
}
