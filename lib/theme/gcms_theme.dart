import 'package:flutter/material.dart';
import 'package:gcms/constants/constant.dart';
import 'package:google_fonts/google_fonts.dart';

class GcmsTheme {
  static TextTheme lightTextTheme = TextTheme(
    bodyText1: GoogleFonts.lexendDeca(
      fontSize: 15.0,
      fontWeight: FontWeight.normal,
      color: Colors.black,
    ),
    bodyText2: GoogleFonts.lexendDeca(
      fontSize: 14.0,
      fontWeight: FontWeight.normal,
      color: Colors.grey,
    ),
    headline1: GoogleFonts.lexendDeca(
      fontSize: 63.0,
      fontWeight: FontWeight.w100,
      color: Colors.black,
    ),
    headline2: GoogleFonts.lexendDeca(
      fontSize: 30.0,
      fontWeight: FontWeight.w400,
      color: Colors.black,
    ),
    headline3: GoogleFonts.lexendDeca(
      fontSize: 15.0,
      fontWeight: FontWeight.w300,
      color: Colors.black,
    ),
    headline6: GoogleFonts.lexendDeca(
      fontSize: 12.0,
      fontWeight: FontWeight.w600,
      color: Colors.black,
    ),
  );

  static TextTheme darkTextTheme = TextTheme(
    bodyText1: GoogleFonts.lexendDeca(
      fontSize: 15.0,
      fontWeight: FontWeight.w700,
      color: Colors.white,
    ),
    bodyText2: GoogleFonts.lexendDeca(
      fontSize: 14.0,
      fontWeight: FontWeight.normal,
      color: Colors.white,
    ),
    headline1: GoogleFonts.lexendDeca(
      fontSize: 63.0,
      fontWeight: FontWeight.bold,
      color: Colors.white,
    ),
    headline2: GoogleFonts.lexendDeca(
      fontSize: 30.0,
      fontWeight: FontWeight.w700,
      color: Colors.white,
    ),
    headline3: GoogleFonts.lexendDeca(
      fontSize: 15.0,
      fontWeight: FontWeight.w600,
      color: Colors.white,
    ),
    headline6: GoogleFonts.lexendDeca(
      fontSize: 12.0,
      fontWeight: FontWeight.w600,
      color: Colors.white,
    ),
  );

  static ThemeData light() {
    return ThemeData(
      primarySwatch: kPrimaryColorMaterialized,
      fontFamily: GoogleFonts.lexendDeca().fontFamily,
      brightness: Brightness.light,
      checkboxTheme: CheckboxThemeData(
        fillColor: MaterialStateColor.resolveWith((states) {
          return Colors.black;
        }),
      ),
      appBarTheme: const AppBarTheme(
        foregroundColor: Colors.white,
        backgroundColor: kPrimaryColor,
      ),
      floatingActionButtonTheme: const FloatingActionButtonThemeData(
        foregroundColor: Colors.white,
        backgroundColor: kPrimaryColor,
      ),
      bottomNavigationBarTheme: const BottomNavigationBarThemeData(
        selectedItemColor: kPrimaryColor,
      ),
      textTheme: lightTextTheme,
    );
  }

  static ThemeData dark() {
    return ThemeData(
      brightness: Brightness.dark,
      appBarTheme: AppBarTheme(
        foregroundColor: Colors.white,
        backgroundColor: Colors.grey[900],
      ),
      floatingActionButtonTheme: const FloatingActionButtonThemeData(
        foregroundColor: Colors.white,
        backgroundColor: kPrimaryColor,
      ),
      bottomNavigationBarTheme: const BottomNavigationBarThemeData(
        selectedItemColor: kPrimaryColor,
      ),
      textTheme: darkTextTheme,
    );
  }
}
