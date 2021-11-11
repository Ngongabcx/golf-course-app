import 'package:json_annotation/json_annotation.dart';

// Defining the dart member model
part 'member.g.dart';

@JsonSerializable()
class Member {
  // even though class variables are indicated as nullable, what is passed or returned should not be null

  int id;
  String membershipId;
  String fName;
  String lname;
  String username;
  String phoneNumber;
  String address;
  String email;
  String handicap;
  DateTime dob;
  String password;
  String image;
  String userType;
  String gender;
  DateTime dateJoined;
  bool paid;

  Member(
      { this.id,
       this.membershipId,
      this.fName = '',
      this.phoneNumber = '',
      this.address = '',
      this.email = '',
       this.handicap,
      this.dob,
      this.gender = '',
       this.dateJoined,
      this.paid = false,
       this.username,
      this.lname = '',
      this.userType = '',
      this.image = '',
       this.password});

  factory Member.fromJson(Map<String, dynamic> json) => _$MemberFromJson(json);

  /// Connect the generated [_$MemberToJson] function to the `toJson` method.
  Map<String, dynamic> toJson() => _$MemberToJson(this);
}
