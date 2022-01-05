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
        this.courseName,
        this.courseAbr,
        this.address,
        this.phoneNo,
        this.email,
        this.courseImage,
        this.holes,
    });

    int? id;
    String? courseName;
    String? courseAbr;
    String? address;
    String? phoneNo;
    String? email;
    String? courseImage;
    List<Hole>? holes;

    factory Payload.fromJson(Map<String, dynamic> json) => Payload(
        id: json["id"],
        courseName: json["courseName"],
        courseAbr: json["courseAbr"],
        address: json["address"],
        phoneNo: json["phoneNo"],
        email: json["email"],
        courseImage: json["courseImage"],
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
