// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'hole.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Hole _$HoleFromJson(Map<String, dynamic> json) => Hole(
      id: json['id'] as int,
      courseId: json['courseId'] as int,
      holeNo: json['holeNo'] as int,
      yellow: json['yellow'] as int,
      white: json['white'] as int,
      blue: json['blue'] as int,
      red: json['red'] as int,
      par: json['par'] as int,
      stroke: json['stroke'] as int,
    );

Map<String, dynamic> _$HoleToJson(Hole instance) => <String, dynamic>{
      'id': instance.id,
      'courseId': instance.courseId,
      'holeNo': instance.holeNo,
      'yellow': instance.yellow,
      'white': instance.white,
      'blue': instance.blue,
      'red': instance.red,
      'par': instance.par,
      'stroke': instance.stroke,
    };
