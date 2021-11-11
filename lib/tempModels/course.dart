import 'package:json_annotation/json_annotation.dart';
import 'models.dart';

part 'course.g.dart';

@JsonSerializable()
class Course {
  int id;
  String courseName;
  String address;
  String courseAbr;
  String email;
  String phoneNo;
  List<Hole> holes;
  List<Payment> payments;

  Course({
    this.id,
    this.courseName,
    this.address = '',
    this.courseAbr = '',
    this.email = '',
    this.phoneNo = '',
    this.holes = const [],
    this.payments = const [],
  });

  static List<Course> fromJsonList(List list) {
    if (list == null) return null;

    return list.map((item) => Course.fromJson(item)).toList();
  }

  factory Course.fromJson(Map<String, dynamic> json) => _$CourseFromJson(json);

  /// Connect the generated [_$CourseToJson] function to the `toJson` method.
  Map<String, dynamic> toJson() => _$CourseToJson(this);
}
