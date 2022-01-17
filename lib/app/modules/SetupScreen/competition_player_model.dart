// To parse this JSON data, do
//
//     final competitionPlayer = competitionPlayerFromJson(jsonString);

import 'dart:convert';

CompetitionPlayer competitionPlayerFromJson(String str) =>
    CompetitionPlayer.fromJson(json.decode(str));

String competitionPlayerToJson(CompetitionPlayer data) =>
    json.encode(data.toJson());

class CompetitionPlayer {
  CompetitionPlayer({
    this.status,
    this.success,
    this.message,
    this.error,
    this.payload,
  });

  int? status;
  bool? success;
  String? message;
  String? error;
  List<Payload>? payload;

  factory CompetitionPlayer.fromJson(Map<String, dynamic> json) =>
      CompetitionPlayer(
        status: json["status"],
        success: json["success"],
        message: json["message"],
        error: json["error"],
        payload:
            List<Payload>.from(json["payload"].map((x) => Payload.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "success": success,
        "message": message,
        "error": error,
        "payload": List<dynamic>.from(payload!.map((x) => x.toJson())),
      };
}

class Payload {
  Payload({
    this.id,
    this.compTime,
    this.compHcp,
    this.lastPlayedHole,
    this.totalResult,
    this.player,
    this.recordingScoresFor,
    this.scorecards,
  });

  int? id;
  String? compTime;
  int? compHcp;
  LastPlayedHole? lastPlayedHole;
  double? totalResult;
  Player? player;
  Player? recordingScoresFor;
  List<Scorecard>? scorecards;

  factory Payload.fromJson(Map<String, dynamic> json) => Payload(
        id: json["id"],
        compTime: json["compTime"],
        compHcp: json["compHcp"],
        lastPlayedHole: json["lastPlayedHole"] == null
            ? null
            : LastPlayedHole.fromJson(json["lastPlayedHole"]),
        totalResult: json["totalResult"],
        player: Player.fromJson(json["player"]),
        recordingScoresFor: Player.fromJson(json["recordingScoresFor"]),
        scorecards: List<Scorecard>.from(
            json["scorecards"].map((x) => Scorecard.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "compTime": compTime,
        "compHcp": compHcp,
        "lastPlayedHole":
            lastPlayedHole == null ? null : lastPlayedHole!.toJson(),
        "totalResult": totalResult,
        "player": player!.toJson(),
        "recordingScoresFor": recordingScoresFor!.toJson(),
        "scorecards": List<dynamic>.from(scorecards!.map((x) => x.toJson())),
      };
}

class LastPlayedHole {
  LastPlayedHole({
    this.id,
    this.holeNo,
    this.yellow,
    this.white,
    this.blue,
    this.red,
    this.par,
    this.stroke,
    this.courseId,
  });

  int? id;
  int? holeNo;
  int? yellow;
  int? white;
  int? blue;
  int? red;
  int? par;
  int? stroke;
  int? courseId;

  factory LastPlayedHole.fromJson(Map<String, dynamic> json) => LastPlayedHole(
        id: json["id"],
        holeNo: json["holeNo"],
        yellow: json["yellow"],
        white: json["white"],
        blue: json["blue"],
        red: json["red"],
        par: json["par"],
        stroke: json["stroke"],
        courseId: json["courseId"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "holeNo": holeNo,
        "yellow": yellow,
        "white": white,
        "blue": blue,
        "red": red,
        "par": par,
        "stroke": stroke,
        "courseId": courseId,
      };
}

class Player {
  Player({
    this.id,
    this.fname,
    this.lname,
    this.address,
    this.dob,
    this.gender,
    this.dateJoined,
    this.image,
    this.hcp,
    this.fcmToken,
    this.aspNetUsers,
  });

  int? id;
  String? fname;
  String? lname;
  String? address;
  DateTime? dob;
  String? gender;
  DateTime? dateJoined;
  String? image;
  int? hcp;
  String? fcmToken;
  AspNetUsers? aspNetUsers;

  factory Player.fromJson(Map<String, dynamic> json) => Player(
        id: json["id"],
        fname: json["fname"],
        lname: json["lname"],
        address: json["address"],
        dob: DateTime.parse(json["dob"]),
        gender: json["gender"],
        dateJoined: DateTime.parse(json["dateJoined"]),
        image: json["image"],
        hcp: json["hcp"],
        fcmToken: json["fcmToken"],
        aspNetUsers: AspNetUsers.fromJson(json["aspNetUsers"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "fname": fname,
        "lname": lname,
        "address": address,
        "dob": dob!.toIso8601String(),
        "gender": gender,
        "dateJoined": dateJoined!.toIso8601String(),
        "image": image,
        "hcp": hcp,
        "fcmToken": fcmToken,
        "aspNetUsers": aspNetUsers!.toJson(),
      };
}

class AspNetUsers {
  AspNetUsers({
    this.id,
    this.userName,
    this.email,
    this.phoneNumber,
  });

  String? id;
  String? userName;
  String? email;
  dynamic phoneNumber;

  factory AspNetUsers.fromJson(Map<String, dynamic> json) => AspNetUsers(
        id: json["id"],
        userName: json["userName"],
        email: json["email"],
        phoneNumber: json["phoneNumber"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "userName": userName,
        "email": email,
        "phoneNumber": phoneNumber,
      };
}

class Scorecard {
  Scorecard({
    this.id,
    this.score,
    this.timestamp,
    this.confirmed,
    this.result,
    this.holeNo,
  });

  int? id;
  double? score;
  String? timestamp;
  bool? confirmed;
  double? result;
  int? holeNo;

  factory Scorecard.fromJson(Map<String, dynamic> json) => Scorecard(
        id: json["id"],
        score: json["score"],
        timestamp: json["timestamp"],
        confirmed: json["confirmed"],
        result: json["result"],
        holeNo: json["holeNo"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "score": score,
        "timestamp": timestamp,
        "confirmed": confirmed,
        "result": result,
        "holeNo": holeNo,
      };
}
