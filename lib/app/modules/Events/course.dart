import 'package:gcms/app/modules/Events/events_model.dart';

class Course {
  String courseName;
  Map<String, List<Events>> event;
  Course(
    this.courseName,
    this.event,
  );

  static Course generateCourse() {
    return Course('Lusaka Golf Course', {
      'Upcoming': Events.generateUpcomingEvents(),
      'Today': Events.generateTodaysEvents(),
      'Tomorrow': Events.generateTomorrowsEvents(),
      'Next Week': Events.generateNextWeeksEvents(),
    });
  }
}
