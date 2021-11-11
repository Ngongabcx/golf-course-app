class Competition {
  int id;
  String courseName;
  String compName;
  String gameType;
  String compDate;
  String image;

  Competition(this.id, this.courseName, this.compName, this.gameType,
      this.compDate, this.image);

  static List<Competition> samples = [
    Competition(
      1,
      'Chinama Golf Course',
      'Lusaka Open',
      'Strokeplay',
      '25-11-2021',
      'assets/images/lusaka_golf_club_picture.jpg',
    ),
    Competition(
      2,
      'Chinama Golf Course',
      'Ndola Open',
      'Staplefold',
      '25-11-2021',
      'assets/images/cover_picture_club_livingstone-golf-club.jpg',
    ),
    Competition(
      3,
      'Lusaka Golf Club',
      'Kabwe Open',
      'Strokeplay',
      '25-11-2021',
      'assets/images/lusaka_golf_club_picture.jpg',
    ),
    Competition(
      4,
      'Bonanza Golf Course',
      'PGA Tour',
      'Staplefold',
      '25-11-2021',
      'assets/images/ottis-bunning.jpg',
    ),
    Competition(
      5,
      'Bonanza Golf Course',
      'Lusaka Tour',
      'Strokeplay',
      '25-11-2021',
      'assets/images/lusaka_golf_club_picture.jpg',
    ),
    Competition(
      6,
      'Bonanza Golf Course',
      'Lusaka Open',
      'Strokeplay',
      '25-11-2021',
      'assets/images/ottis-bunning.jpg',
    ),
    Competition(
      7,
      'Chilanga Golf Club',
      'Chisamba Open',
      'Staplefold',
      '25-11-2021',
      'assets/images/lusaka_golf_club_picture.jpg',
    ),
    Competition(
      8,
      'Chilanga Golf Club',
      'Lusaka Open',
      'Staplefold',
      '25-11-2021',
      'assets/images/lusaka_golf_club_picture.jpg',
    ),
    Competition(
      9,
      'Chinama Golf Course',
      'Lusaka Open',
      'Staplefold',
      '25-11-2021',
      'assets/images/lusaka_golf_club_picture.jpg',
    ),
    Competition(
      10,
      'Chinama Golf Course',
      'Livingstone Open',
      'Staplefold',
      '25-11-2021',
      'assets/images/cover_picture_club_livingstone-golf-club.jpg',
    ),
    Competition(
      11,
      'Bonanza Golf Course',
      'Kitwe Open',
      'Strokeplay',
      '25-11-2021',
      'assets/images/ottis-bunning.jpg',
    ),
    Competition(
      12,
      'Lusaka Golf Club',
      'Lusaka Open',
      'Staplefold',
      '25-11-2021',
      'assets/images/cover_picture_club_livingstone-golf-club.jpg',
    ),
  ];
}
