class Course {
  int? id;
  String? courseName;
  String? address;
  String? courseAbr;
  String? email;
  String? phoneNo;
  String? courseImage;
  List<Holes>? holes;
  List<Payments>? payments;

  Course(
      {required this.id,
      required this.courseName,
      required this.address,
      required this.courseAbr,
      required this.email,
      required this.phoneNo,
      required this.courseImage,
      required this.holes,
      required this.payments});

  Course.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    courseName = json['courseName'];
    address = json['address'];
    courseAbr = json['courseAbr'];
    email = json['email'];
    phoneNo = json['phoneNo'];
    courseImage = json['courseImage'];
    if (json['holes'] != null) {
      holes = <Holes>[];
      json['holes'].forEach((v) {
        holes!.add(Holes.fromJson(v));
      });
    }
    if (json['payments'] != null) {
      payments = <Payments>[];
      json['payments'].forEach((v) {
        payments!.add(Payments.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['id'] = id;
    data['courseName'] = courseName;
    data['address'] = address;
    data['courseAbr'] = courseAbr;
    data['email'] = email;
    data['phoneNo'] = phoneNo;
    data['courseImage'] = courseImage;
    if (holes != null) {
      data['holes'] = holes!.map((v) => v.toJson()).toList();
    }
    if (payments != null) {
      data['payments'] = payments!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Holes {
  int? id;
  int? holeNo;
  int? yellow;
  int? white;
  int? blue;
  int? red;
  int? par;
  int? stroke;

  Holes(
      {required this.id,
      required this.holeNo,
      required this.yellow,
      required this.white,
      required this.blue,
      required this.red,
      required this.par,
      required this.stroke});

  Holes.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    holeNo = json['holeNo'];
    yellow = json['yellow'];
    white = json['white'];
    blue = json['blue'];
    red = json['red'];
    par = json['par'];
    stroke = json['stroke'];
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['id'] = id;
    data['holeNo'] = holeNo;
    data['yellow'] = yellow;
    data['white'] = white;
    data['blue'] = blue;
    data['red'] = red;
    data['par'] = par;
    data['stroke'] = stroke;
    return data;
  }
}

class Payments {
  int? id;
  String? name;
  String? type;
  String? category;
  double? amount;

  Payments({required this.id, required this.name, required this.type, required this.category, required this.amount});

  Payments.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    type = json['type'];
    category = json['category'];
    amount = json['amount'];
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['type'] = type;
    data['category'] = category;
    data['amount'] = amount;
    return data;
  }
}
