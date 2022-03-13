import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class MyTheme {
  static ThemeData light = ThemeData(
    fontFamily: GoogleFonts.lato().fontFamily,
    // scaffoldBackgroundColor: Color.fromARGB(255, 118, 255, 214),
    backgroundColor: Colors.white,
    iconTheme: const IconThemeData(
      color: Colors.white,
    ),
    // cardColor: Color.fromARGB(255, 255, 201, 201),
  );

  static ThemeData dark = ThemeData(
    brightness: Brightness.dark,
    fontFamily: GoogleFonts.lato().fontFamily,
    scaffoldBackgroundColor: const Color.fromARGB(255, 16, 17, 46),
    backgroundColor: Colors.black,
    iconTheme: const IconThemeData(
      color: Colors.white,
    ),
    // cardColor: Colors.white,
  );
}

class MyColor {
  // dark/light
  static Color dark = Colors.black;
  static Color light = Colors.white;

  // curve
  // static Color lightcurve = Color(0xFFCAF1DE);
  static Color lightcurve = const Color(0xFF11FFEE);

  static Color darkcurve = const Color.fromARGB(255, 17, 37, 77);

  //button-color
  // static Color lightbotton = Color(0xFFFFE7C7);
  static Color lightbotton = const Color.fromARGB(255, 255, 77, 178);

  static Color darkbotton = Colors.white;
}
