import 'package:json_annotation/json_annotation.dart';

part 'hole.g.dart';

@JsonSerializable()
class Hole {
  Hole({
     this.id,
     this.courseId,
     this.holeNo,
    this.yellow,
    this.white,
    this.blue,
    this.red,
     this.par,
     this.stroke,
  });

  int id;
  int courseId;
  int holeNo;
  int yellow;
  int white;
  int blue;
  int red;
  int par;
  int stroke;

  factory Hole.fromJson(Map<String, dynamic> json) => _$HoleFromJson(json);

  /// Connect the generated [_$HoleToJson] function to the `toJson` method.
  Map<String, dynamic> toJson() => _$HoleToJson(this);
}
