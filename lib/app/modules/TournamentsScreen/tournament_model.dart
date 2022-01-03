class Tournament {
  int id;
  String compName;
  String gametype;
  double compFee;
  String compDate;
  String compTime;
  int numberOfHoles;
  int startingHole;
  String course;

  Tournament({
    required this.id,
    required this.compName,
    required this.gametype,
    required this.compFee,
    required this.compDate,
    required this.compTime,
    required this.numberOfHoles,
    required this.startingHole,
    required this.course,
  });

  static List<Tournament> tournaments = [
    Tournament(
        id: 1,
        compName: 'Lusaka Championship',
        gametype: 'Staplefold',
        compFee: 5000,
        compDate: 'January 24, 2022',
        compTime: '10:30',
        numberOfHoles: 18,
        startingHole: 1,
        course: 'Lusaka Golf Club'),
    Tournament(
        id: 2,
        compName: 'Rocket Mortgage Classic',
        gametype: 'Staplefold',
        compFee: 5000,
        compDate: 'January 31, 2022',
        compTime: '8:30',
        numberOfHoles: 18,
        startingHole: 1,
        course: 'Chainama Golf Club'),
    Tournament(
        id: 3,
        compName: '3M Open TPC Twin Cities',
        gametype: 'Strokeplay',
        compFee: 5000,
        compDate: 'February 21, 2022',
        compTime: '10:30',
        numberOfHoles: 18,
        startingHole: 1,
        course: 'Ndola Golf Club'),
    Tournament(
        id: 4,
        compName: 'FedEx St. Jude Championship TPC Southwind',
        gametype: 'Staplefold',
        compFee: 5000,
        compDate: 'March 1, 2022',
        compTime: '08:30',
        numberOfHoles: 18,
        startingHole: 1,
        course: 'Bonanza Golf Club'),
    Tournament(
        id: 5,
        compName: 'BMW Championship',
        gametype: 'Strokeplay',
        compFee: 5000,
        compDate: 'June 21, 2022',
        compTime: '10:30',
        numberOfHoles: 18,
        startingHole: 1,
        course: 'Lusaka Golf Club'),
    Tournament(
        id: 6,
        compName: 'The Genesis Invitational',
        gametype: 'Strokeplay',
        compFee: 5000,
        compDate: 'April 3, 2022',
        compTime: '08:30',
        numberOfHoles: 18,
        startingHole: 1,
        course: 'Lusaka Golf Club'),
    Tournament(
        id: 7,
        compName: 'Lusaka Championship',
        gametype: 'Staplefold',
        compFee: 5000,
        compDate: 'May 20, 2022',
        compTime: '08:30',
        numberOfHoles: 18,
        startingHole: 1,
        course: 'Ndola Golf Club'),
    Tournament(
        id: 8,
        compName: 'Lusaka Championship',
        gametype: 'Strokeplay',
        compFee: 5000,
        compDate: 'May 5, 2022',
        compTime: '08:30',
        numberOfHoles: 18,
        startingHole: 1,
        course: 'Bonanza Golf Club'),
    Tournament(
        id: 9,
        compName: 'Lusaka Championship',
        gametype: 'Strokeplay',
        compFee: 5000,
        compDate: 'March 21, 2022',
        compTime: '08:30',
        numberOfHoles: 18,
        startingHole: 1,
        course: 'Chainama Golf Club'),
  ];
}
