// To parse this JSON data, do
//
//     final user = userFromJson(jsonString);

import 'dart:convert';

User userFromJson(String str) => User.fromJson(json.decode(str));

String userToJson(User data) => json.encode(data.toJson());

class User {
  User({
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

  factory User.fromJson(Map<String, dynamic> json) => User(
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
    this.aspNetUsers,
    this.usertype,
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
  AspNetUsers? aspNetUsers;
  Usertype? usertype;

  factory Payload.fromJson(Map<String, dynamic> json) => Payload(
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
        aspNetUsers: AspNetUsers.fromJson(json["aspNetUsers"]),
        usertype: Usertype.fromJson(json["usertype"]),
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
        "aspNetUsers": aspNetUsers!.toJson(),
        "usertype": usertype!.toJson(),
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

class Usertype {
  Usertype({
    this.id,
    this.name,
    this.description,
  });

  int? id;
  Name? name;
  Description? description;

  factory Usertype.fromJson(Map<String, dynamic> json) => Usertype(
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

enum Description { THIS_IS_JUST_A_SAMPLE_TEST_USER }

final descriptionValues = EnumValues({
  "This is just a sample test user": Description.THIS_IS_JUST_A_SAMPLE_TEST_USER
});

enum Name { NORMAL_USER }

final nameValues = EnumValues({"Normal user": Name.NORMAL_USER});

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
