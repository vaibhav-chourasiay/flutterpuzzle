import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class MyTheme {
  static ThemeData light = ThemeData(
    fontFamily: GoogleFonts.lato().fontFamily,
    scaffoldBackgroundColor: Colors.blue,
    backgroundColor: Colors.white,
    iconTheme: const IconThemeData(
      color: Colors.white,
    ),
  );

  static ThemeData dark = ThemeData(
    brightness: Brightness.dark,
    fontFamily: GoogleFonts.lato().fontFamily,
    scaffoldBackgroundColor: Color.fromARGB(255, 16, 17, 46),
    backgroundColor: Colors.white,
    iconTheme: const IconThemeData(
      color: Colors.white,
    ),
  );
}
