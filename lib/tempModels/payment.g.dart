// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'payment.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Payment _$PaymentFromJson(Map<String, dynamic> json) => Payment(
      id: json['id'] as int,
      name: json['name'] as String,
      type: json['type'] as String,
      category: json['category'] as String,
      amount: json['amount'] as int,
      courseId: json['courseId'] as int,
    );

Map<String, dynamic> _$PaymentToJson(Payment instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'type': instance.type,
      'category': instance.category,
      'amount': instance.amount,
      'courseId': instance.courseId,
    };
