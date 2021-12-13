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
        required this.id,
        required this.compName,
        required this.gametype,
        required this.compFee,
        required this.compDate,
        required this.compTime,
        required this.numberOfHoles,
        required this.startingHole,
        required this.course,
        required this.competitionPlayer,
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
        compFee: json["compFee"].toDouble(),
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
        required this.id,
        required this.competitionId,
        required this.competitionTime,
        required this.player,
        required this.competitionHcp,
        required this.invitation,
    });

    int id;
    int competitionId;
    String competitionTime;
    Player player;
    int competitionHcp;
    Invitation invitation;

    factory CompetitionPlayer.fromJson(Map<String, dynamic> json) => CompetitionPlayer(
        id: json["id"],
        competitionId: json["competitionId"],
        competitionTime: json["competitionTime"],
        player: Player.fromJson(json["player"]),
        competitionHcp: json["competitionHcp"],
        invitation: Invitation.fromJson(json["invitation"]),
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "competitionId": competitionId,
        "competitionTime": competitionTime,
        "player": player.toJson(),
        "competitionHcp": competitionHcp,
        "invitation": invitation.toJson(),
    };
}

class Invitation {
    Invitation({
        required this.inviteId,
        required this.status,
    });

    int inviteId;
    Status? status;

    factory Invitation.fromJson(Map<String, dynamic> json) => Invitation(
        inviteId: json["inviteId"],
        status: statusValues.map![json["status"]],
    );

    Map<String, dynamic> toJson() => {
        "inviteId": inviteId,
        "status": statusValues.reverse![status],
    };
}

enum Status { PENDING }

final statusValues = EnumValues({
    "pending": Status.PENDING
});

class Player {
    Player({
        required this.id,
        required this.firstname,
        required this.lastname,
        required this.address,
        required this.image,
        required this.dob,
        required this.gender,
        required this.hcp,
        required this.dateJoined,
        required this.aspnetuserDetails,
        required this.usertype,
    });

    int id;
    Firstname? firstname;
    Lastname? lastname;
    Address? address;
    String image;
    Dob? dob;
    String gender;
    int hcp;
    DateJoined? dateJoined;
    AspnetuserDetails aspnetuserDetails;
    Type usertype;

    factory Player.fromJson(Map<String, dynamic> json) => Player(
        id: json["id"],
        firstname: firstnameValues.map![json["firstname"]],
        lastname: lastnameValues.map![json["lastname"]],
        address: addressValues.map![json["address"]],
        image: json["image"],
        dob: dobValues.map![json["dob"]],
        gender: json["gender"],
        hcp: json["hcp"],
        dateJoined: dateJoinedValues.map![json["dateJoined"]],
        aspnetuserDetails: AspnetuserDetails.fromJson(json["aspnetuserDetails"]),
        usertype: Type.fromJson(json["usertype"]),
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "firstname": firstnameValues.reverse![firstname],
        "lastname": lastnameValues.reverse![lastname],
        "address": addressValues.reverse![address],
        "image": image,
        "dob": dobValues.reverse![dob],
        "gender": gender,
        "hcp": hcp,
        "dateJoined": dateJoinedValues.reverse![dateJoined],
        "aspnetuserDetails": aspnetuserDetails.toJson(),
        "usertype": usertype.toJson(),
    };
}

enum Address { IBEX_HILL, CHIWALA, NDOLA }

final addressValues = EnumValues({
    "Chiwala": Address.CHIWALA,
    "Ibex Hill": Address.IBEX_HILL,
    "Ndola": Address.NDOLA
});

class AspnetuserDetails {
    AspnetuserDetails({
        required this.id,
        required this.username,
        required this.phoneNumber,
        required this.email,
    });

    String id;
    Username? username;
    String phoneNumber;
    Email? email;

    factory AspnetuserDetails.fromJson(Map<String, dynamic> json) => AspnetuserDetails(
        id: json["id"],
        username: usernameValues.map![json["username"]],
        phoneNumber: json["phoneNumber"],
        email: emailValues.map![json["email"]],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "username": usernameValues.reverse![username],
        "phoneNumber": phoneNumber,
        "email": emailValues.reverse![email],
    };
}

enum Email { CHAINAMA_GMAIL_COM }

final emailValues = EnumValues({
    "chainama@gmail.com": Email.CHAINAMA_GMAIL_COM
});

enum Username { BWALYA_NG_ONGA, NICK_MWERENGA, LEONARD_CHINYAMA }

final usernameValues = EnumValues({
    "Bwalya Ng'onga": Username.BWALYA_NG_ONGA,
    "Leonard-Chinyama": Username.LEONARD_CHINYAMA,
    "Nick Mwerenga": Username.NICK_MWERENGA
});

enum DateJoined { THE_11182021120000_AM, THE_3152021120000_AM, THE_3202021120000_AM }

final dateJoinedValues = EnumValues({
    "11/18/2021 12:00:00 AM": DateJoined.THE_11182021120000_AM,
    "3/15/2021 12:00:00 AM": DateJoined.THE_3152021120000_AM,
    "3/20/2021 12:00:00 AM": DateJoined.THE_3202021120000_AM
});

enum Dob { THE_3192021120000_AM }

final dobValues = EnumValues({
    "3/19/2021 12:00:00 AM": Dob.THE_3192021120000_AM
});

enum Firstname { NG_ONGA, NICK, LEONARD_KAPOKOLO }

final firstnameValues = EnumValues({
    "Leonard Kapokolo": Firstname.LEONARD_KAPOKOLO,
    "Ng'onga": Firstname.NG_ONGA,
    "Nick": Firstname.NICK
});

enum Lastname { BWALYA, NICK, CHINYAMA }

final lastnameValues = EnumValues({
    "Bwalya": Lastname.BWALYA,
    "Chinyama": Lastname.CHINYAMA,
    "Nick": Lastname.NICK
});

class Type {
    Type({
        required this.id,
        required this.name,
        required this.description,
    });

    int id;
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

enum Description { THIS_IS_A_NORMAL_USER, A_GAME_PLAYED_BY_FOUR_PEOPLE }

final descriptionValues = EnumValues({
    "A game played by four people": Description.A_GAME_PLAYED_BY_FOUR_PEOPLE,
    "This is a normal user": Description.THIS_IS_A_NORMAL_USER
});

enum Name { NORMAL_USER, STABLE_FORD }

final nameValues = EnumValues({
    "Normal User": Name.NORMAL_USER,
    "Stable Ford": Name.STABLE_FORD
});

class Course {
    Course({
        required this.id,
        required this.courseName,
        required this.address,
        required this.courseAbr,
        required this.email,
        required this.phoneNo,
        required this.courseImage,
        required this.holes,
        required this.payments,
    });

    int id;
    String courseName;
    String address;
    String courseAbr;
    Email? email;
    String phoneNo;
    String courseImage;
    List<Hole> holes;
    List<Payment> payments;

    factory Course.fromJson(Map<String, dynamic> json) => Course(
        id: json["id"],
        courseName: json["courseName"],
        address: json["address"],
        courseAbr: json["courseAbr"],
        email: emailValues.map![json["email"]],
        phoneNo: json["phoneNo"],
        courseImage: json["courseImage"],
        holes: List<Hole>.from(json["holes"].map((x) => Hole.fromJson(x))),
        payments: List<Payment>.from(json["payments"].map((x) => Payment.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "courseName": courseName,
        "address": address,
        "courseAbr": courseAbr,
        "email": emailValues.reverse![email],
        "phoneNo": phoneNo,
        "courseImage": courseImage,
        "holes": List<dynamic>.from(holes.map((x) => x.toJson())),
        "payments": List<dynamic>.from(payments.map((x) => x.toJson())),
    };
}

class Hole {
    Hole({
        required this.id,
        required this.holeNo,
        required this.yellow,
        required this.white,
        required this.blue,
        required this.red,
        required this.par,
        required this.stroke,
    });

    int id;
    int holeNo;
    int yellow;
    int white;
    int blue;
    int red;
    int par;
    int stroke;

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

class Payment {
    Payment({
        required this.id,
        required this.name,
        required this.type,
        required this.category,
        required this.amount,
    });

    int id;
    Name? name;
    String type;
    String category;
    double amount;

    factory Payment.fromJson(Map<String, dynamic> json) => Payment(
        id: json["id"],
        name: nameValues.map![json["name"]],
        type: json["type"],
        category: json["category"],
        amount: json["amount"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "name": nameValues.reverse![name],
        "type": type,
        "category": category,
        "amount": amount,
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
