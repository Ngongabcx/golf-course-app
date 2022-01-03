class Event {
  String label;
  String host;
  String date;
  String time;
  String location;

  Event(
      {required this.label,
      required this.host,
      required this.date,
      required this.time,
      required this.location});

  static List<Event> events = [
    Event(
        label: 'Lusaka Championship',
        date: 'January 24, 2022',
        time: '10:30',
        location: 'Lusaka Golf Club',
        host: 'Lusaka Golf Club'),
    Event(
        label: 'Rocket Mortgage Classic',
        date: 'January 31, 2022',
        time: '8:30',
        location: 'Bonanza Golf Club',
        host: 'Bonanza Golf Club'),
    Event(
        label: '3M Open TPC Twin Cities',
        date: 'February 21, 2022',
        time: '10:30',
        location: 'Chainama Golf Club',
        host: 'Chainama Golf Club'),
    Event(
        label: 'FedEx St. Jude Championship TPC Southwind',
        date: 'March 1, 2022',
        time: '08:30',
        location: 'Ndola Golf Club',
        host: 'Ndola Golf Club'),
    Event(
        label: 'BMW Championship',
        date: 'June 21, 2022',
        time: '08:30',
        location: 'Lusaka Golf Club',
        host: 'Lusaka Golf Club'),
    Event(
        label: 'The Genesis Invitational',
        date: 'January 7, 2022',
        time: '08:30',
        location: 'Bonanza Golf Club',
        host: 'Bonanza Golf Club'),
    Event(
        label: 'The Honda Classic',
        date: 'April 3, 2022',
        time: '08:30',
        location: 'Lusaka Golf Club',
        host: 'Lusaka Golf Club'),
    Event(
        label: 'Lsk Open',
        date: 'May 20, 2022',
        time: '08:30',
        location: 'Ndola Golf Club',
        host: 'Ndola Golf Club'),
    Event(
        label: 'PGA Championship',
        date: 'May 5, 2022',
        time: '08:30',
        location: 'Bonanza Golf Club',
        host: 'Bonanza Golf Club'),
    Event(
        label: 'Arnold Palmer Invitational pres. by Mastercard',
        date: 'March 21, 2022',
        time: '08:30',
        location: 'Chainama Golf Club',
        host: 'Chainama Golf Club'),
  ];
}
