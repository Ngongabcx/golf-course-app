// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'member.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Member _$MemberFromJson(Map<String, dynamic> json) => Member(
      id: json['id'] as int,
      membershipId: json['membershipId'] as String,
      fName: json['fName'] as String ?? '',
      phoneNumber: json['phoneNumber'] as String ?? '',
      address: json['address'] as String ?? '',
      email: json['email'] as String ?? '',
      handicap: json['handicap'] as String,
      dob: json['dob'] == null ? null : DateTime.parse(json['dob'] as String),
      gender: json['gender'] as String ?? '',
      dateJoined: DateTime.parse(json['dateJoined'] as String),
      paid: json['paid'] as bool ?? false,
      username: json['username'] as String,
      lname: json['lname'] as String ?? '',
      userType: json['userType'] as String ?? '',
      image: json['image'] as String ?? '',
      password: json['password'] as String,
    );

Map<String, dynamic> _$MemberToJson(Member instance) => <String, dynamic>{
      'id': instance.id,
      'membershipId': instance.membershipId,
      'fName': instance.fName,
      'lname': instance.lname,
      'username': instance.username,
      'phoneNumber': instance.phoneNumber,
      'address': instance.address,
      'email': instance.email,
      'handicap': instance.handicap,
      'dob': instance.dob?.toIso8601String(),
      'password': instance.password,
      'image': instance.image,
      'userType': instance.userType,
      'gender': instance.gender,
      'dateJoined': instance.dateJoined.toIso8601String(),
      'paid': instance.paid,
    };
