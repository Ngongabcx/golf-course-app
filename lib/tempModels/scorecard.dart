import 'package:json_annotation/json_annotation.dart';

// Defining the dart scorecard model
part 'scorecard.g.dart';

@JsonSerializable()
class Scorecard {
  int id;
  int score;
  int result;
  String gameType;
  String competitionId;
  String courseholeid;
  bool confirmed;

  Scorecard({
    this.id,
    this.score,
    this.result,
    this.gameType,
    this.competitionId,
    this.confirmed,
    this.courseholeid,
  });

  factory Scorecard.fromJson(Map<String, dynamic> json) =>
      _$ScorecardFromJson(json);

  /// Connect the generated [_$ScorecardToJson] function to the `toJson` method.
  Map<String, dynamic> toJson() => _$ScorecardToJson(this);
}
