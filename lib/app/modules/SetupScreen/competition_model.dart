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

    int status;
    bool success;
    String message;
    String error;
    Payload payload;

    factory Competition.fromJson(Map<String, dynamic> json) => Competition(
        status: json["status"],
        success: json["success"],
        message: json["message"],
        error: json["error"],
        payload: Payload.fromJson(json["payload"]),
    );

    Map<String, dynamic> toJson() => {
        "status": status,
        "success": success,
        "message": message,
        "error": error,
        "payload": payload.toJson(),
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

    int id;
    String compName;
    Type gametype;
    double compFee;
    String compDate;
    String compTime;
    int numberOfHoles;
    int startingHole;
    Course course;
    List<CompetitionPlayer> competitionPlayer;

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
        competitionPlayer: List<CompetitionPlayer>.from(json["competitionPlayer"].map((x) => CompetitionPlayer.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "compName": compName,
        "gametype": gametype.toJson(),
        "compFee": compFee,
        "compDate": compDate,
        "compTime": compTime,
        "numberOfHoles": numberOfHoles,
        "startingHole": startingHole,
        "course": course.toJson(),
        "competitionPlayer": List<dynamic>.from(competitionPlayer.map((x) => x.toJson())),
    };
}

class CompetitionPlayer {
    CompetitionPlayer({
        this.id,
        this.competitionId,
        this.competitionTime,
        this.player,
        this.competitionHcp,
    });

    int id;
    int competitionId;
    String competitionTime;
    Player player;
    int competitionHcp;

    factory CompetitionPlayer.fromJson(Map<String, dynamic> json) => CompetitionPlayer(
        id: json["id"],
        competitionId: json["competitionId"],
        competitionTime: json["competitionTime"],
        player: Player.fromJson(json["player"]),
        competitionHcp: json["competitionHcp"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "competitionId": competitionId,
        "competitionTime": competitionTime,
        "player": player.toJson(),
        "competitionHcp": competitionHcp,
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
    });

    int id;
    String firstname;
    String lastname;
    String address;
    String image;
    String dob;
    String gender;
    int hcp;
    String dateJoined;
    AspnetuserDetails aspnetuserDetails;
    Type usertype;

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
        aspnetuserDetails: AspnetuserDetails.fromJson(json["aspnetuserDetails"]),
        usertype: Type.fromJson(json["usertype"]),
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
        "aspnetuserDetails": aspnetuserDetails.toJson(),
        "usertype": usertype.toJson(),
    };
}

class AspnetuserDetails {
    AspnetuserDetails({
        this.id,
        this.username,
        this.phoneNumber,
        this.email,
    });

    String id;
    String username;
    String phoneNumber;
    String email;

    factory AspnetuserDetails.fromJson(Map<String, dynamic> json) => AspnetuserDetails(
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

    int id;
    String name;
    String description;

    factory Type.fromJson(Map<String, dynamic> json) => Type(
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

class Course {
    Course({
        this.id,
        this.courseName,
        this.address,
        this.courseAbr,
        this.email,
        this.phoneNo,
        this.courseImage,
    });

    int id;
    String courseName;
    String address;
    String courseAbr;
    String email;
    String phoneNo;
    String courseImage;

    factory Course.fromJson(Map<String, dynamic> json) => Course(
        id: json["id"],
        courseName: json["courseName"],
        address: json["address"],
        courseAbr: json["courseAbr"],
        email: json["email"],
        phoneNo: json["phoneNo"],
        courseImage: json["courseImage"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "courseName": courseName,
        "address": address,
        "courseAbr": courseAbr,
        "email": email,
        "phoneNo": phoneNo,
        "courseImage": courseImage,
    };
}