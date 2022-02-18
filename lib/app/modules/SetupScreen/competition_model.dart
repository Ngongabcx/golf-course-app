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
    this.compFee,
    this.compDate,
    this.compTime,
    this.gameHoles,
    this.startingHole,
    this.endingHole,
    this.isTournament,
    this.gametype,
    this.course,
    this.rounds,
  });

  int? id;
  String? compName;
  double? compFee;
  DateTime? compDate;
  String? compTime;
  int? gameHoles;
  int? startingHole;
  int? endingHole;
  bool? isTournament;
  Gametype? gametype;
  Course? course;
  List<Round>? rounds;

  factory Payload.fromJson(Map<String, dynamic> json) => Payload(
        id: json["id"],
        compName: json["compName"],
        compFee: json["compFee"],
        compDate: DateTime.parse(json["compDate"]),
        compTime: json["compTime"],
        gameHoles: json["gameHoles"],
        startingHole: json["startingHole"],
        endingHole: json["endingHole"],
        isTournament: json["isTournament"],
        gametype: Gametype.fromJson(json["gametype"]),
        course: Course.fromJson(json["course"]),
        rounds: List<Round>.from(json["rounds"].map((x) => Round.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "compName": compName,
        "compFee": compFee,
        "compDate": compDate!.toIso8601String(),
        "compTime": compTime,
        "gameHoles": gameHoles,
        "startingHole": startingHole,
        "endingHole": endingHole,
        "isTournament": isTournament,
        "gametype": gametype!.toJson(),
        "course": course!.toJson(),
        "rounds": List<dynamic>.from(rounds!.map((x) => x.toJson())),
      };
}

class Course {
  Course({
    this.id,
    this.courseName,
    this.courseAbr,
    this.address,
    this.phoneNo,
    this.email,
    this.courseImage,
    this.imageThumbnail,
    this.holes,
  });

  int? id;
  String? courseName;
  String? courseAbr;
  String? address;
  String? phoneNo;
  String? email;
  String? courseImage;
  String? imageThumbnail;
  List<Hole>? holes;

  factory Course.fromJson(Map<String, dynamic> json) => Course(
        id: json["id"],
        courseName: json["courseName"],
        courseAbr: json["courseAbr"],
        address: json["address"],
        phoneNo: json["phoneNo"],
        email: json["email"],
        courseImage: json["courseImage"],
        imageThumbnail: json["imageThumbnail"],
        holes: List<Hole>.from(json["holes"].map((x) => Hole.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "courseName": courseName,
        "courseAbr": courseAbr,
        "address": address,
        "phoneNo": phoneNo,
        "email": email,
        "courseImage": courseImage,
        "imageThumbnail": imageThumbnail,
        "holes": List<dynamic>.from(holes!.map((x) => x.toJson())),
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

  factory Hole.fromJson(Map<String, dynamic> json) => Hole(
        id: json["id"],
        holeNo: json["holeNo"],
        yellow: json["yellow"],
        white: json["white"],
        blue: json["blue"],
        red: json["red"],
        par: json["par"],
        stroke: json["stroke"],
        courseId: json["courseId"] == null ? null : json["courseId"],
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
        "courseId": courseId == null ? null : courseId,
      };
}

class Gametype {
  Gametype({
    this.id,
    this.name,
    this.description,
  });

  int? id;
  String? name;
  String? description;

  factory Gametype.fromJson(Map<String, dynamic> json) => Gametype(
        id: json["id"],
        name: json["name"],
        description: json["description"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "description": description,
      };
}

class Round {
  Round({
    this.id,
    this.roundNumber,
    this.competitionId,
    this.par,
    this.isTieBreaker,
    this.roundHoles,
    this.playerCount,
    this.playerFinishCount,
    this.roundStatus,
    this.roundPlayers,
  });

  int? id;
  int? roundNumber;
  int? competitionId;
  int? par;
  bool? isTieBreaker;
  int? roundHoles;
  int? playerCount;
  int? playerFinishCount;
  String? roundStatus;
  List<RoundPlayer>? roundPlayers;

  factory Round.fromJson(Map<String, dynamic> json) => Round(
        id: json["id"],
        roundNumber: json["roundNumber"],
        competitionId: json["competitionId"],
        par: json["par"],
        isTieBreaker: json["isTieBreaker"],
        roundHoles: json["roundHoles"],
        playerCount: json["playerCount"],
        playerFinishCount: json["playerFinishCount"],
        roundStatus: json["roundStatus"],
        roundPlayers: List<RoundPlayer>.from(
            json["roundPlayers"].map((x) => RoundPlayer.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "roundNumber": roundNumber,
        "competitionId": competitionId,
        "par": par,
        "isTieBreaker": isTieBreaker,
        "roundHoles": roundHoles,
        "playerCount": playerCount,
        "playerFinishCount": playerFinishCount,
        "roundStatus": roundStatus,
        "roundPlayers":
            List<dynamic>.from(roundPlayers!.map((x) => x.toJson())),
      };
}

class RoundPlayer {
  RoundPlayer({
    this.id,
    this.compTime,
    this.compHcp,
    this.totalScore,
    this.totalResult,
    this.roundsCummulativeScore,
    this.roundsCummulativeResult,
    this.roundsCompleted,
    this.roundId,
    this.playerId,
    this.player,
    this.playerRoundStatus,
    this.colorcodeId,
    this.colorcode,
    this.recordingScoresForId,
    this.recordingScoresFor,
    this.scorecards,
    this.nextHoleId,
    this.nextHole,
  });

  int? id;
  String? compTime;
  int? compHcp;
  int? totalScore;
  double? totalResult;
  int? roundsCummulativeScore;
  double? roundsCummulativeResult;
  int? roundsCompleted;
  int? roundId;
  int? playerId;
  Player? player;
  String? playerRoundStatus;
  int? colorcodeId;
  Colorcode? colorcode;
  int? recordingScoresForId;
  Player? recordingScoresFor;
  dynamic scorecards;
  int? nextHoleId;
  Hole? nextHole;

  factory RoundPlayer.fromJson(Map<String, dynamic> json) => RoundPlayer(
        id: json["id"],
        compTime: json["compTime"],
        compHcp: json["compHcp"],
        totalScore: json["totalScore"],
        totalResult: json["totalResult"],
        roundsCummulativeScore: json["roundsCummulativeScore"],
        roundsCummulativeResult: json["roundsCummulativeResult"],
        roundsCompleted: json["roundsCompleted"],
        roundId: json["roundId"],
        playerId: json["playerId"],
        player: Player.fromJson(json["player"]),
        playerRoundStatus: json["playerRoundStatus"],
        colorcodeId: json["colorcodeId"],
        colorcode: Colorcode.fromJson(json["colorcode"]),
        recordingScoresForId: json["recordingScoresForId"],
        recordingScoresFor: Player.fromJson(json["recordingScoresFor"]),
        scorecards: json["scorecards"],
        nextHoleId: json["nextHoleId"],
        nextHole: Hole.fromJson(json["nextHole"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "compTime": compTime,
        "compHcp": compHcp,
        "totalScore": totalScore,
        "totalResult": totalResult,
        "roundsCummulativeScore": roundsCummulativeScore,
        "roundsCummulativeResult": roundsCummulativeResult,
        "roundsCompleted": roundsCompleted,
        "roundId": roundId,
        "playerId": playerId,
        "player": player!.toJson(),
        "playerRoundStatus": playerRoundStatus,
        "colorcodeId": colorcodeId,
        "colorcode": colorcode!.toJson(),
        "recordingScoresForId": recordingScoresForId,
        "recordingScoresFor": recordingScoresFor!.toJson(),
        "scorecards": scorecards,
        "nextHoleId": nextHoleId,
        "nextHole": nextHole!.toJson(),
      };
}

class Colorcode {
  Colorcode({
    this.id,
    this.color,
    this.description,
  });

  int? id;
  String? color;
  String? description;

  factory Colorcode.fromJson(Map<String, dynamic> json) => Colorcode(
        id: json["id"],
        color: json["color"],
        description: json["description"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "color": color,
        "description": description,
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
    this.imageThumbnail,
    this.hcp,
    this.fcmToken,
    this.usertypeId,
    this.usertype,
    this.aspNetUsersId,
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
  String? imageThumbnail;
  int? hcp;
  String? fcmToken;
  int? usertypeId;
  dynamic usertype;
  String? aspNetUsersId;
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
        imageThumbnail: json["imageThumbnail"],
        hcp: json["hcp"],
        fcmToken: json["fcmToken"],
        usertypeId: json["usertypeId"],
        usertype: json["usertype"],
        aspNetUsersId: json["aspNetUsersId"],
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
        "imageThumbnail": imageThumbnail,
        "hcp": hcp,
        "fcmToken": fcmToken,
        "usertypeId": usertypeId,
        "usertype": usertype,
        "aspNetUsersId": aspNetUsersId,
        "aspNetUsers": aspNetUsers!.toJson(),
      };
}

class AspNetUsers {
  AspNetUsers({
    this.id,
    this.userName,
    this.normalizedUserName,
    this.email,
    this.normalizedEmail,
    this.emailConfirmed,
    this.passwordHash,
    this.securityStamp,
    this.concurrencyStamp,
    this.phoneNumber,
    this.phoneNumberConfirmed,
    this.twoFactorEnabled,
    this.lockoutEnd,
    this.lockoutEnabled,
    this.accessFailedCount,
  });

  String? id;
  String? userName;
  String? normalizedUserName;
  String? email;
  String? normalizedEmail;
  bool? emailConfirmed;
  String? passwordHash;
  String? securityStamp;
  String? concurrencyStamp;
  dynamic phoneNumber;
  bool? phoneNumberConfirmed;
  bool? twoFactorEnabled;
  dynamic lockoutEnd;
  bool? lockoutEnabled;
  int? accessFailedCount;

  factory AspNetUsers.fromJson(Map<String, dynamic> json) => AspNetUsers(
        id: json["id"],
        userName: json["userName"],
        normalizedUserName: json["normalizedUserName"],
        email: json["email"],
        normalizedEmail: json["normalizedEmail"],
        emailConfirmed: json["emailConfirmed"],
        passwordHash: json["passwordHash"],
        securityStamp: json["securityStamp"],
        concurrencyStamp: json["concurrencyStamp"],
        phoneNumber: json["phoneNumber"],
        phoneNumberConfirmed: json["phoneNumberConfirmed"],
        twoFactorEnabled: json["twoFactorEnabled"],
        lockoutEnd: json["lockoutEnd"],
        lockoutEnabled: json["lockoutEnabled"],
        accessFailedCount: json["accessFailedCount"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "userName": userName,
        "normalizedUserName": normalizedUserName,
        "email": email,
        "normalizedEmail": normalizedEmail,
        "emailConfirmed": emailConfirmed,
        "passwordHash": passwordHash,
        "securityStamp": securityStamp,
        "concurrencyStamp": concurrencyStamp,
        "phoneNumber": phoneNumber,
        "phoneNumberConfirmed": phoneNumberConfirmed,
        "twoFactorEnabled": twoFactorEnabled,
        "lockoutEnd": lockoutEnd,
        "lockoutEnabled": lockoutEnabled,
        "accessFailedCount": accessFailedCount,
      };
}
