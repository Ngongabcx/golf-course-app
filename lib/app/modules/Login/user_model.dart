class User {
  int id;
  String username;
  String firstName;
  String lastName;
  dynamic phoneNo;
  String email;
  String address;
  dynamic image;
  String dob;
  String gender;
  int hcp;
  String dateJoined;
  String aspnetusersId;
  Usertype usertype;
  dynamic employmentDetails;
  dynamic membership;

  User(
      {this.id,
      this.username,
      this.firstName,
      this.lastName,
      this.phoneNo,
      this.email,
      this.address,
      this.image,
      this.dob,
      this.gender,
      this.hcp,
      this.dateJoined,
      this.aspnetusersId,
      this.usertype,
      this.employmentDetails,
      this.membership});

  User.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    username = json['username'];
    firstName = json['firstName'];
    lastName = json['lastName'];
    phoneNo = json['phoneNo'];
    email = json['email'];
    address = json['address'];
    image = json['image'];
    dob = json['dob'];
    gender = json['gender'];
    hcp = json['hcp'];
    dateJoined = json['dateJoined'];
    aspnetusersId = json['aspnetusersId'];
    usertype =
        json['usertype'] != null ? Usertype.fromJson(json['usertype']) : null;
    employmentDetails = json['employmentDetails'];
    membership = json['membership'];
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['id'] = id;
    data['username'] = username;
    data['firstName'] = firstName;
    data['lastName'] = lastName;
    data['phoneNo'] = phoneNo;
    data['email'] = email;
    data['address'] = address;
    data['image'] = image;
    data['dob'] = dob;
    data['gender'] = gender;
    data['hcp'] = hcp;
    data['dateJoined'] = dateJoined;
    data['aspnetusersId'] = aspnetusersId;
    if (usertype != null) {
      data['usertype'] = usertype.toJson();
    }
    data['employmentDetails'] = employmentDetails;
    data['membership'] = membership;
    return data;
  }
}

class Usertype {
  int id;
  String name;
  String description;

  Usertype({this.id, this.name, this.description});

  Usertype.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    description = json['description'];
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['description'] = description;
    return data;
  }
}
