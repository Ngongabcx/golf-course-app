// To parse this JSON data, do
//
//     final competition = competitionFromJson(jsonString);

import 'dart:convert';

Competition competitionFromJson(String str) => Competition.fromJson(json.decode(str));

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
        payload: List<Payload>.from(json["payload"].map((x) => Payload.fromJson(x))),
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
        this.isTournament,
        this.gametype,
        this.course,
        this.competitionPlayers,
    });

    int? id;
    String? compName;
    double? compFee;
    DateTime? compDate;
    String? compTime;
    int? gameHoles;
    int? startingHole;
    bool? isTournament;
    Gametype? gametype;
    Course? course;
    List<CompetitionPlayer>? competitionPlayers;

    factory Payload.fromJson(Map<String, dynamic> json) => Payload(
        id: json["id"],
        compName: json["compName"],
        compFee: json["compFee"],
        compDate: DateTime.parse(json["compDate"]),
        compTime: json["compTime"],
        gameHoles: json["gameHoles"],
        startingHole: json["startingHole"],
        isTournament: json["isTournament"],
        gametype: Gametype.fromJson(json["gametype"]),
        course: Course.fromJson(json["course"]),
        competitionPlayers: List<CompetitionPlayer>.from(json["competitionPlayers"].map((x) => CompetitionPlayer.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "compName": compName,
        "compFee": compFee,
        "compDate": compDate!.toIso8601String(),
        "compTime": compTime,
        "gameHoles": gameHoles,
        "startingHole": startingHole,
        "isTournament": isTournament,
        "gametype": gametype!.toJson(),
        "course": course!.toJson(),
        "competitionPlayers": List<dynamic>.from(competitionPlayers!.map((x) => x.toJson())),
    };
}

class CompetitionPlayer {
    CompetitionPlayer({
        this.id,
        this.compTime,
        this.compHcp,
        this.player,
        this.inviteStatus,
        this.colorcode,
        this.recordingScoresFor,
    });

    int? id;
    String? compTime;
    int? compHcp;
    Player? player;
    Gametype? inviteStatus;
    Colorcode? colorcode;
    Player? recordingScoresFor;

    factory CompetitionPlayer.fromJson(Map<String, dynamic> json) => CompetitionPlayer(
        id: json["id"],
        compTime: json["compTime"],
        compHcp: json["compHcp"],
        player: Player.fromJson(json["player"]),
        inviteStatus: Gametype.fromJson(json["inviteStatus"]),
        colorcode: Colorcode.fromJson(json["colorcode"]),
        recordingScoresFor: Player.fromJson(json["recordingScoresFor"]),
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "compTime": compTime,
        "compHcp": compHcp,
        "player": player!.toJson(),
        "inviteStatus": inviteStatus!.toJson(),
        "colorcode": colorcode!.toJson(),
        "recordingScoresFor": recordingScoresFor!.toJson(),
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
