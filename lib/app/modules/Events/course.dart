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
      'Today': Events.generateUpcomingEvents(),
      'This Week': Events.generateTodaysEvents(),
      'This Month': Events.generateTomorrowsEvents(),
      'This Year': Events.generateNextWeeksEvents(),
    });
  }
}
