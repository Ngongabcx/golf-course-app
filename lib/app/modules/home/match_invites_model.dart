// To parse this JSON data, do
//
//     final matchInvites = matchInvitesFromJson(jsonString);

import 'dart:convert';

MatchInvites matchInvitesFromJson(String str) => MatchInvites.fromJson(json.decode(str));

String matchInvitesToJson(MatchInvites data) => json.encode(data.toJson());

class MatchInvites {
    MatchInvites({
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
    List<Payload> payload;

    factory MatchInvites.fromJson(Map<String, dynamic> json) => MatchInvites(
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
        "payload": List<dynamic>.from(payload.map((x) => x.toJson())),
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
    Stname firstname;
    Stname lastname;
    PlayerAddress address;
    String image;
    Dob dob;
    String gender;
    int hcp;
    DateJoined dateJoined;
    AspnetuserDetails aspnetuserDetails;
    Type usertype;

    factory Player.fromJson(Map<String, dynamic> json) => Player(
        id: json["id"],
        firstname: stnameValues.map[json["firstname"]],
        lastname: stnameValues.map[json["lastname"]],
        address: playerAddressValues.map[json["address"]],
        image: json["image"],
        dob: dobValues.map[json["dob"]],
        gender: json["gender"],
        hcp: json["hcp"],
        dateJoined: dateJoinedValues.map[json["dateJoined"]],
        aspnetuserDetails: AspnetuserDetails.fromJson(json["aspnetuserDetails"]),
        usertype: Type.fromJson(json["usertype"]),
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "firstname": stnameValues.reverse[firstname],
        "lastname": stnameValues.reverse[lastname],
        "address": playerAddressValues.reverse[address],
        "image": image,
        "dob": dobValues.reverse[dob],
        "gender": gender,
        "hcp": hcp,
        "dateJoined": dateJoinedValues.reverse[dateJoined],
        "aspnetuserDetails": aspnetuserDetails.toJson(),
        "usertype": usertype.toJson(),
    };
}

enum PlayerAddress { IBEX_HILL, CHIWALA, NDOLA }

final playerAddressValues = EnumValues({
    "Chiwala": PlayerAddress.CHIWALA,
    "Ibex Hill": PlayerAddress.IBEX_HILL,
    "Ndola": PlayerAddress.NDOLA
});

class AspnetuserDetails {
    AspnetuserDetails({
        this.id,
        this.username,
        this.phoneNumber,
        this.email,
    });

    String id;
    Username username;
    String phoneNumber;
    Email email;

    factory AspnetuserDetails.fromJson(Map<String, dynamic> json) => AspnetuserDetails(
        id: json["id"],
        username: usernameValues.map[json["username"]],
        phoneNumber: json["phoneNumber"],
        email: emailValues.map[json["email"]],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "username": usernameValues.reverse[username],
        "phoneNumber": phoneNumber,
        "email": emailValues.reverse[email],
    };
}

enum Email { CHAINAMA_GMAIL_COM }

final emailValues = EnumValues({
    "chainama@gmail.com": Email.CHAINAMA_GMAIL_COM
});

enum Username { BWALYANGONGA_GMAIL_COM, NICK_NICK_COM, LEONARD_CHINYAMA }

final usernameValues = EnumValues({
    "bwalyangonga@gmail.com": Username.BWALYANGONGA_GMAIL_COM,
    "Leonard-Chinyama": Username.LEONARD_CHINYAMA,
    "nick@nick.com": Username.NICK_NICK_COM
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

enum Stname { BWALYA, NICK, CHINYAMA }

final stnameValues = EnumValues({
    "Bwalya": Stname.BWALYA,
    "Chinyama": Stname.CHINYAMA,
    "Nick": Stname.NICK
});

class Type {
    Type({
        this.id,
        this.name,
        this.description,
    });

    int id;
    Name name;
    Description description;

    factory Type.fromJson(Map<String, dynamic> json) => Type(
        id: json["id"],
        name: nameValues.map[json["name"]],
        description: descriptionValues.map[json["description"]],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "name": nameValues.reverse[name],
        "description": descriptionValues.reverse[description],
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
        this.id,
        this.courseName,
        this.address,
        this.courseAbr,
        this.email,
        this.phoneNo,
        this.courseImage,
    });

    int id;
    CourseName courseName;
    CourseAddress address;
    CourseAbr courseAbr;
    Email email;
    String phoneNo;
    String courseImage;

    factory Course.fromJson(Map<String, dynamic> json) => Course(
        id: json["id"],
        courseName: courseNameValues.map[json["courseName"]],
        address: courseAddressValues.map[json["address"]],
        courseAbr: courseAbrValues.map[json["courseAbr"]],
        email: emailValues.map[json["email"]],
        phoneNo: json["phoneNo"],
        courseImage: json["courseImage"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "courseName": courseNameValues.reverse[courseName],
        "address": courseAddressValues.reverse[address],
        "courseAbr": courseAbrValues.reverse[courseAbr],
        "email": emailValues.reverse[email],
        "phoneNo": phoneNo,
        "courseImage": courseImage,
    };
}

enum CourseAddress { PLOT_1_CHAINAMA }

final courseAddressValues = EnumValues({
    "Plot 1 Chainama": CourseAddress.PLOT_1_CHAINAMA
});

enum CourseAbr { CHA_1 }

final courseAbrValues = EnumValues({
    "Cha-1": CourseAbr.CHA_1
});

enum CourseName { CHAINAMA_GOLF_CLUB }

final courseNameValues = EnumValues({
    "Chainama Golf Club": CourseName.CHAINAMA_GOLF_CLUB
});

class EnumValues<T> {
    Map<String, T> map;
    Map<T, String> reverseMap;

    EnumValues(this.map);

    Map<T, String> get reverse {
        if (reverseMap == null) {
            reverseMap = map.map((k, v) => new MapEntry(v, k));
        }
        return reverseMap;
    }
}
