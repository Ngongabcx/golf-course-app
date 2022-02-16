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

  factory Payload.fromJson(Map<String, dynamic> json) => Payload(
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
  dynamic colorcode;
  int? recordingScoresForId;
  Player? recordingScoresFor;
  List<Scorecard>? scorecards;
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
        colorcode: json["colorcode"],
        recordingScoresForId: json["recordingScoresForId"],
        recordingScoresFor: Player.fromJson(json["recordingScoresFor"]),
        scorecards: List<Scorecard>.from(
            json["scorecards"].map((x) => Scorecard.fromJson(x))),
        nextHoleId: json["nextHoleId"],
        nextHole:
            json["nextHole"] == null ? null : Hole.fromJson(json["nextHole"]),
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
        "colorcode": colorcode,
        "recordingScoresForId": recordingScoresForId,
        "recordingScoresFor": recordingScoresFor!.toJson(),
        "scorecards": List<dynamic>.from(scorecards!.map((x) => x.toJson())),
        "nextHoleId": nextHoleId,
        "nextHole": nextHole == null ? null : nextHole!.toJson(),
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

class Scorecard {
  Scorecard({
    this.id,
    this.score,
    this.timestamp,
    this.result,
    this.confirmed,
    this.holeId,
    this.hole,
    this.roundPlayerId,
  });

  int? id;
  int? score;
  String? timestamp;
  double? result;
  bool? confirmed;
  int? holeId;
  Hole? hole;
  int? roundPlayerId;

  factory Scorecard.fromJson(Map<String, dynamic> json) => Scorecard(
        id: json["id"],
        score: json["score"],
        timestamp: json["timestamp"],
        result: json["result"],
        confirmed: json["confirmed"],
        holeId: json["holeId"],
        hole: Hole.fromJson(json["hole"]),
        roundPlayerId: json["roundPlayerId"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "score": score,
        "timestamp": timestamp,
        "result": result,
        "confirmed": confirmed,
        "holeId": holeId,
        "hole": hole!.toJson(),
        "roundPlayerId": roundPlayerId,
      };
}
