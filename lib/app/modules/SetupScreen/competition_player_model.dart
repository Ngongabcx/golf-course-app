// To parse this JSON data, do
//
//     final competitionPlayer = competitionPlayerFromJson(jsonString);

import 'dart:convert';

CompetitionPlayer competitionPlayerFromJson(String str) => CompetitionPlayer.fromJson(json.decode(str));

String competitionPlayerToJson(CompetitionPlayer data) => json.encode(data.toJson());

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

    factory CompetitionPlayer.fromJson(Map<String, dynamic> json) => CompetitionPlayer(
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
    InviteStatus? inviteStatus;
    Colorcode? colorcode;
    Player? recordingScoresFor;

    factory Payload.fromJson(Map<String, dynamic> json) => Payload(
        id: json["id"],
        compTime: json["compTime"],
        compHcp: json["compHcp"],
        player: Player.fromJson(json["player"]),
        inviteStatus: InviteStatus.fromJson(json["inviteStatus"]),
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

class InviteStatus {
    InviteStatus({
        this.id,
        this.name,
        this.description,
    });

    int? id;
    String? name;
    String? description;

    factory InviteStatus.fromJson(Map<String, dynamic> json) => InviteStatus(
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
