// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'scorecard.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Scorecard _$ScorecardFromJson(Map<String, dynamic> json) => Scorecard(
      id: json['id'] as int,
      score: json['score'] as int,
      result: json['result'] as int,
      gameType: json['gameType'] as String,
      competitionId: json['competitionId'] as String,
      confirmed: json['confirmed'] as bool,
      courseholeid: json['courseholeid'] as String,
    );

Map<String, dynamic> _$ScorecardToJson(Scorecard instance) => <String, dynamic>{
      'id': instance.id,
      'score': instance.score,
      'result': instance.result,
      'gameType': instance.gameType,
      'competitionId': instance.competitionId,
      'courseholeid': instance.courseholeid,
      'confirmed': instance.confirmed,
    };
