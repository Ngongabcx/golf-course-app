class Events {
  String imageUrl;
  String label;
  String host;
  String date;
  String time;
  String location;

  Events(
      {required this.label,
      required this.host,
      required this.date,
      required this.time,
      required this.location,
      required this.imageUrl});

  static List<Events> generateUpcomingEvents() {
    return [
      Events(
          imageUrl: 'golf-ball-grass.jpg',
          label: 'Lusaka Championship',
          date: 'January 24, 2022',
          time: '10:30',
          location: 'Lusaka Golf Club',
          host: 'Lusaka Golf Club'),
      Events(
          imageUrl: 'golf-ball-grass.jpg',
          label: 'Rocket Mortgage Classic',
          date: 'January 31, 2022',
          time: '8:30',
          location: 'Bonanza Golf Club',
          host: 'Bonanza Golf Club'),
      Events(
          imageUrl: 'golf-ball-grass.jpg',
          label: 'Nick and Leonard"s" wedding vows',
          date: 'February 21, 2022',
          time: '10:30',
          location: 'Chainama Golf Club',
          host: 'Chainama Golf Club'),
      Events(
          imageUrl: 'golf-ball-grass.jpg',
          label: 'FedEx St. Jude Championship TPC Southwind',
          date: 'March 1, 2022',
          time: '08:30',
          location: 'Ndola Golf Club',
          host: 'Ndola Golf Club'),
    ];
  }

  static List<Events> generateTodaysEvents() {
    return [
      Events(
          imageUrl: 'golf-ball-grass.jpg',
          label: 'BMW Championship',
          date: 'June 21, 2022',
          time: '08:30',
          location: 'Lusaka Golf Club',
          host: 'Lusaka Golf Club'),
      Events(
          imageUrl: 'golf-ball-grass.jpg',
          label: 'The Genesis Invitational Gallery',
          date: 'January 7, 2022',
          time: '08:30',
          location: 'Bonanza Golf Club',
          host: 'Bonanza Golf Club'),
      Events(
          imageUrl: 'golf-ball-grass.jpg',
          label: 'The Honda Classic',
          date: 'April 3, 2022',
          time: '08:30',
          location: 'Lusaka Golf Club',
          host: 'Lusaka Golf Club'),
    ];
  }

  static List<Events> generateTomorrowsEvents() {
    return [
      Events(
          imageUrl: 'golf-ball-grass.jpg',
          label: 'Bonanza Golf Awards',
          date: 'May 20, 2022',
          time: '08:30',
          location: 'Ndola Golf Club',
          host: 'Ndola Golf Club'),
      Events(
          imageUrl: 'golf-ball-grass.jpg',
          label: 'PGA Championship',
          date: 'May 5, 2022',
          time: '08:30',
          location: 'Bonanza Golf Club',
          host: 'Bonanza Golf Club'),
    ];
  }

  static List<Events> generateNextWeeksEvents() {
    return [
      Events(
          imageUrl: 'golf-ball-grass.jpg',
          label: 'Arnold Palmer Invitational pres. by Mastercard',
          date: 'March 21, 2022',
          time: '08:30',
          location: 'Chainama Golf Club',
          host: 'Chainama Golf Club'),
    ];
  }
}
