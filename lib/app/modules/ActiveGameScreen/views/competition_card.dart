import 'package:flutter/material.dart';
import 'package:gcms/tempModels/competetion.dart';
import 'package:gcms/theme/gcms_theme.dart';

class CompetitionCard extends StatelessWidget {
  final Competition competition;

  const CompetitionCard({Key key, this.competition}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 20.0),
      child: Center(
        child: Container(
          child: Stack(
            children: [
              Text(
                competition.courseName,
                style: GcmsTheme.darkTextTheme.headline2,
              ),
              Positioned(
                child: Text(
                  competition.compName,
                  style: GcmsTheme.darkTextTheme.bodyText1,
                ),
                top: 25,
              ),
              Positioned(
                child: Text(
                  competition.gameType,
                  style: GcmsTheme.darkTextTheme.bodyText1,
                ),
                bottom: 30,
                right: 0,
              ),
              Positioned(
                child: Text(
                  competition.compDate,
                  style: GcmsTheme.darkTextTheme.bodyText1,
                ),
                bottom: 10,
                right: 0,
              ),
            ],
          ),
          padding: const EdgeInsets.all(16),
          constraints: const BoxConstraints.expand(
            width: 350,
            height: 150,
          ),
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage(competition.image),
              fit: BoxFit.cover,
            ),
            borderRadius: const BorderRadius.all(Radius.circular(10.0)),
          ),
        ),
      ),
    );
  }
}
