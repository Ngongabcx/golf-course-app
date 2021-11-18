class Courses {
  int id;
  String courseName;
  String address;
  String courseAbr;
  String email;
  String phoneNo;
  String courseImage;
  List<Holes> holes;
  List<Payments> payments;

  Courses(
      {this.id,
      this.courseName,
      this.address,
      this.courseAbr,
      this.email,
      this.phoneNo,
      this.courseImage,
      this.holes,
      this.payments});

  Courses.fromJson(Map<String, dynamic> json) {
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
        holes.add(Holes.fromJson(v));
      });
    }
    if (json['payments'] != null) {
      payments = <Payments>[];
      json['payments'].forEach((v) {
        payments.add(Payments.fromJson(v));
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
      data['holes'] = holes.map((v) => v.toJson()).toList();
    }
    if (payments != null) {
      data['payments'] = payments.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Holes {
  int id;
  int holeNo;
  int yellow;
  int white;
  int blue;
  int red;
  int par;
  int stroke;

  Holes(
      {this.id,
      this.holeNo,
      this.yellow,
      this.white,
      this.blue,
      this.red,
      this.par,
      this.stroke});

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
  int id;
  String name;
  String type;
  String category;
  double amount;

  Payments({this.id, this.name, this.type, this.category, this.amount});

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
