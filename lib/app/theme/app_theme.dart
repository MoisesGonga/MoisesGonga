import 'package:flutter/material.dart';
//import 'package:google_fonts/google_fonts.dart';

ThemeData lightTheme = ThemeData(
    primarySwatch: Colors.amber,
    brightness: Brightness.light,
    accentColor: Colors.amber,
    fontFamily: "Poppins Regular",
    appBarTheme: AppBarTheme(color: Colors.white),
    textTheme: TextTheme(
      bodyText1: TextStyle(fontFamily: 'Poppins'),
      bodyText2: TextStyle(fontFamily: 'Poppins'),
    ),
    visualDensity: VisualDensity.adaptivePlatformDensity);

ThemeData darkTheme = ThemeData(
    primarySwatch: Colors.amber,
    brightness: Brightness.dark,
    accentColor: Colors.amber,
    fontFamily: "Poppins Regular",
    appBarTheme: AppBarTheme(color: Colors.black),
    textTheme: TextTheme(
      bodyText1: TextStyle(fontFamily: 'Poppins'),
      bodyText2: TextStyle(fontFamily: 'Poppins'),
    ),
    visualDensity: VisualDensity.adaptivePlatformDensity);
