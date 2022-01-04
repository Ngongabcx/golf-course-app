import 'package:flutter/material.dart';

const Color kPrimaryColor = Colors.teal;
const kActiveCardColor = Color(0xff246EE9);
const kInactiveCardColor = Color(0xFF838789);
const kBottomContainerColour = Color(0xFF22C17B);
const kBottomContainerHeight = 50.0;

const kScoreInputStyle = TextStyle(
  fontSize: 20,
  fontWeight: FontWeight.bold,
  color: Color(0xFF22C17B),
);

Map<int, Color> color = {
  50: Color.fromRGBO(0, 128, 128, .1),
  100: Color.fromRGBO(0, 128, 128, .2),
  200: Color.fromRGBO(0, 128, 128, .3),
  300: Color.fromRGBO(0, 128, 128, .4),
  400: Color.fromRGBO(0, 128, 128, .5),
  500: Color.fromRGBO(0, 128, 128, .6),
  600: Color.fromRGBO(0, 128, 128, .7),
  700: Color.fromRGBO(0, 128, 128, .8),
  800: Color.fromRGBO(0, 128, 128, .9),
  900: Color.fromRGBO(0, 128, 128, 1),
};
MaterialColor kPrimaryColorMaterialized = MaterialColor(0xff246EE9, color);
const int kOtpDuarationSeconds = 120;
const kHomeBackgroundColor = Color(0xffF6F6F6);
const kCardsBackgroundColor = Color(0xffF6F6F6);
const kGreyColor = Color(0xff868686);
const kDarkGreyColor = Color(0xFFA8A8A8);
const kZambeziColor = Color(0xFF5B5B5B);
const kWhiteColor = Color(0xFFFFFFFF);
const kBlackColor = Color(0xFF212121);
const kTextFieldColor = Color(0xFFF4F7FC);
const kWhiteGreyColor = Color(0xFFF9F9F9);
const kDefaultPagePadding = EdgeInsets.symmetric(
  horizontal: 16,
);
const String kApiBaseURL = "https://bcxz.azurewebsites.net/api";
const String kNewApiBaseURL = "https://bcxtestapi.azurewebsites.net";
const int kConnectionTimeout = 50000;
const int kReceiveTimeout = 30000;
const String kSlackLogChannelURL =
    "https://hooks.slack.com/services/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";
/*-----------------DUBUG LEVELS--------------------*/
const String kError = "ERROR: \n";
const String kWarn = "WARNING: \n";
const String kInfo = "INFO: \n";
const String kFatal = "FATAL: \n";
