// To parse this JSON data, do
//
//     final competition = competitionFromJson(jsonString);

import 'dart:convert';

Competition competitionFromJson(String str) =>
    Competition.fromJson(json.decode(str));

String competitionToJson(Competition data) => json.encode(data.toJson());

class Competition {
  Competition({
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

  factory Competition.fromJson(Map<String, dynamic> json) => Competition(
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
    this.compName,
    this.gametype,
    this.compFee,
    this.compDate,
    this.compTime,
    this.numberOfHoles,
    this.startingHole,
    this.course,
    this.competitionPlayer,
  });

  int? id;
  String? compName;
  Type? gametype;
  double? compFee;
  String? compDate;
  String? compTime;
  int? numberOfHoles;
  int? startingHole;
  Course? course;
  List<CompetitionPlayer>? competitionPlayer;

  factory Payload.fromJson(Map<String, dynamic> json) => Payload(
        id: json["id"],
        compName: json["compName"],
        gametype: Type.fromJson(json["gametype"]),
        compFee: json["compFee"],
        compDate: json["compDate"],
        compTime: json["compTime"],
        numberOfHoles: json["numberOfHoles"],
        startingHole: json["startingHole"],
        course: Course.fromJson(json["course"]),
        competitionPlayer: List<CompetitionPlayer>.from(
            json["competitionPlayer"]
                .map((x) => CompetitionPlayer.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "compName": compName,
        "gametype": gametype!.toJson(),
        "compFee": compFee,
        "compDate": compDate,
        "compTime": compTime,
        "numberOfHoles": numberOfHoles,
        "startingHole": startingHole,
        "Course": course!.toJson(),
        "competitionPlayer":
            List<dynamic>.from(competitionPlayer!.map((x) => x.toJson())),
      };
}

class CompetitionPlayer {
  CompetitionPlayer({
    this.id,
    this.competitionId,
    this.competitionTime,
    this.player,
    this.competitionHcp,
    this.recordingScoreFor,
    this.invitation,
  });

  int? id;
  int? competitionId;
  String? competitionTime;
  Player? player;
  int? competitionHcp;
  int? recordingScoreFor;
  Invitation? invitation;

  factory CompetitionPlayer.fromJson(Map<String, dynamic> json) =>
      CompetitionPlayer(
        id: json["id"],
        competitionId: json["competitionId"],
        competitionTime: json["competitionTime"],
        player: Player.fromJson(json["player"]),
        competitionHcp: json["competitionHcp"],
        recordingScoreFor: json["recordingScoreFor"],
        invitation: Invitation.fromJson(json["invitation"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "competitionId": competitionId,
        "competitionTime": competitionTime,
        "player": player!.toJson(),
        "competitionHcp": competitionHcp,
        "recordingScoreFor": recordingScoreFor,
        "invitation": invitation!.toJson(),
      };
}

class Invitation {
  Invitation({
    this.inviteId,
    this.status,
  });

  int? inviteId;
  String? status;

  factory Invitation.fromJson(Map<String, dynamic> json) => Invitation(
        inviteId: json["inviteId"],
        status: json["status"],
      );

  Map<String, dynamic> toJson() => {
        "inviteId": inviteId,
        "status": status,
      };
}

class Player {
  Player({
    this.id,
    this.firstname,
    this.lastname,
    this.address,
    this.image,
    this.dob,
    this.gender,
    this.hcp,
    this.dateJoined,
    this.aspnetuserDetails,
    this.usertype,
    this.recordingScoresFor,
  });

  int? id;
  String? firstname;
  String? lastname;
  String? address;
  String? image;
  String? dob;
  String? gender;
  int? hcp;
  String? dateJoined;
  AspnetuserDetails? aspnetuserDetails;
  Type? usertype;
  Player? recordingScoresFor;

  factory Player.fromJson(Map<String, dynamic> json) => Player(
        id: json["id"],
        firstname: json["firstname"],
        lastname: json["lastname"],
        address: json["address"],
        image: json["image"],
        dob: json["dob"],
        gender: json["gender"],
        hcp: json["hcp"],
        dateJoined: json["dateJoined"],
        aspnetuserDetails:
            AspnetuserDetails.fromJson(json["aspnetuserDetails"]),
        usertype: Type.fromJson(json["usertype"]),
        recordingScoresFor: json["recordingScoresFor"] == null
            ? null
            : Player.fromJson(json["recordingScoresFor"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "firstname": firstname,
        "lastname": lastname,
        "address": address,
        "image": image,
        "dob": dob,
        "gender": gender,
        "hcp": hcp,
        "dateJoined": dateJoined,
        "aspnetuserDetails": aspnetuserDetails!.toJson(),
        "usertype": usertype!.toJson(),
        "recordingScoresFor":
            recordingScoresFor == null ? null : recordingScoresFor!.toJson(),
      };
}

class AspnetuserDetails {
  AspnetuserDetails({
    this.id,
    this.username,
    this.phoneNumber,
    this.email,
  });

  String? id;
  String? username;
  String? phoneNumber;
  String? email;

  factory AspnetuserDetails.fromJson(Map<String, dynamic> json) =>
      AspnetuserDetails(
        id: json["id"],
        username: json["username"],
        phoneNumber: json["phoneNumber"],
        email: json["email"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "username": username,
        "phoneNumber": phoneNumber,
        "email": email,
      };
}

class Type {
  Type({
    this.id,
    this.name,
    this.description,
  });

  int? id;
  Name? name;
  Description? description;

  factory Type.fromJson(Map<String, dynamic> json) => Type(
        id: json["id"],
        name: nameValues.map![json["name"]],
        description: descriptionValues.map![json["description"]],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": nameValues.reverse![name],
        "description": descriptionValues.reverse![description],
      };
}

enum Description {
  THIS_IS_JUST_A_SAMPLE_TEST_USER,
  PLAYER_WITH_HIGHEST_RESULT_WINS
}

final descriptionValues = EnumValues({
  "Player with highest result wins":
      Description.PLAYER_WITH_HIGHEST_RESULT_WINS,
  "This is just a sample test user": Description.THIS_IS_JUST_A_SAMPLE_TEST_USER
});

enum Name { NORMAL_USER, MELO_FORD }

final nameValues =
    EnumValues({"Melo Ford": Name.MELO_FORD, "Normal user": Name.NORMAL_USER});

class Course {
  Course({
    this.id,
    this.courseName,
    this.address,
    this.courseAbr,
    this.email,
    this.phoneNo,
    this.courseImage,
    this.holes,
    this.payments,
  });

  int? id;
  String? courseName;
  String? address;
  String? courseAbr;
  String? email;
  String? phoneNo;
  String? courseImage;
  List<Hole>? holes;
  List<dynamic>? payments;

  factory Course.fromJson(Map<String, dynamic> json) => Course(
        id: json["id"],
        courseName: json["courseName"],
        address: json["address"],
        courseAbr: json["courseAbr"],
        email: json["email"],
        phoneNo: json["phoneNo"],
        courseImage: json["courseImage"],
        holes: List<Hole>.from(json["holes"].map((x) => Hole.fromJson(x))),
        payments: List<dynamic>.from(json["payments"].map((x) => x)),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "courseName": courseName,
        "address": address,
        "courseAbr": courseAbr,
        "email": email,
        "phoneNo": phoneNo,
        "courseImage": courseImage,
        "holes": List<dynamic>.from(holes!.map((x) => x.toJson())),
        "payments": List<dynamic>.from(payments!.map((x) => x)),
      };
}

class Hole {
  Hole({
    this.id,
    this.holeNo,
    this.yellow,
    this.white,
    this.blue,
    this.red,
    this.par,
    this.stroke,
  });

  int? id;
  int? holeNo;
  int? yellow;
  int? white;
  int? blue;
  int? red;
  int? par;
  int? stroke;

  factory Hole.fromJson(Map<String, dynamic> json) => Hole(
        id: json["id"],
        holeNo: json["holeNo"],
        yellow: json["yellow"],
        white: json["white"],
        blue: json["blue"],
        red: json["red"],
        par: json["par"],
        stroke: json["stroke"],
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
      };
}

class EnumValues<T> {
  Map<String, T>? map;
  Map<T, String>? reverseMap;

  EnumValues(this.map);

  Map<T, String>? get reverse {
    if (reverseMap == null) {
      reverseMap = map!.map((k, v) => new MapEntry(v, k));
    }
    return reverseMap;
  }
}
