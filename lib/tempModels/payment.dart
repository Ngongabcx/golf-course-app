import 'package:json_annotation/json_annotation.dart';

part 'payment.g.dart';

@JsonSerializable()
class Payment {
  Payment({
     this.id,
     this.name,
     this.type,
     this.category,
     this.amount,
     this.courseId,
  });

  int id;
  String name;
  String type;
  String category;
  int amount;
  int courseId;

  factory Payment.fromJson(Map<String, dynamic> json) =>
      _$PaymentFromJson(json);

  /// Connect the generated [_$PaymentToJson] function to the `toJson` method.
  Map<String, dynamic> toJson() => _$PaymentToJson(this);
}
