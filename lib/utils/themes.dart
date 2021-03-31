import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class MyTheme {
  static ThemeData lightTheme(BuildContext context) => ThemeData(
      fontFamily: GoogleFonts.merriweather().fontFamily,
      brightness: Brightness.light,
      cardColor: Colors.grey[200],
      textTheme: TextTheme(headline1: TextStyle(color: Colors.grey[900])),
      appBarTheme: AppBarTheme(
        color: Colors.white,
        elevation: 0.0,
        iconTheme: IconThemeData(color: Colors.black),
        textTheme: Theme.of(context).textTheme,
      ));

  static ThemeData darkTheme(BuildContext context) => ThemeData(
        fontFamily: GoogleFonts.merriweather().fontFamily,
        brightness: Brightness.dark,
        canvasColor: darkbgColor,
        cardColor: darkCardColor,
        textTheme: TextTheme(headline1: TextStyle(color: Colors.grey[100])),
      );
  static Color creamColor = Color(0xfff5f5f5f);
  static Color darkbgColor = Color(0xff282828);
  static Color darkCardColor = Color(0xff353535);
}
