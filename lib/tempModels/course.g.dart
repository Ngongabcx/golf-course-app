// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'course.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Course _$CourseFromJson(Map<String, dynamic> json) => Course(
      id: json['id'] as int,
      courseName: json['courseName'] as String,
      address: json['address'] as String ?? '',
      courseAbr: json['courseAbr'] as String ?? '',
      email: json['email'] as String ?? '',
      phoneNo: json['phoneNo'] as String ?? '',
      holes: (json['holes'] as List<dynamic>)
              ?.map((e) => Hole.fromJson(e as Map<String, dynamic>))
              ?.toList() ??
          const [],
      payments: (json['payments'] as List<dynamic>)
              ?.map((e) => Payment.fromJson(e as Map<String, dynamic>))
              ?.toList() ??
          const [],
    );

Map<String, dynamic> _$CourseToJson(Course instance) => <String, dynamic>{
      'id': instance.id,
      'courseName': instance.courseName,
      'address': instance.address,
      'courseAbr': instance.courseAbr,
      'email': instance.email,
      'phoneNo': instance.phoneNo,
      'holes': instance.holes,
      'payments': instance.payments,
    };
