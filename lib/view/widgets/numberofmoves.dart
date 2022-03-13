import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

import '../../models/mytheme.dart';
import '../../view_models/providers/puzzle_game_provider.dart';
import '../../view_models/providers/theme_provider.dart';
import '../responsive/size_fuctions.dart';

class NumberOfMove extends StatelessWidget {
  const NumberOfMove({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(bottom: 5.0, left: 20.0, right: 20.0),
      margin: const EdgeInsets.symmetric(vertical: 10.0),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(30.0),
      ),
      child: Text(
        "Moves : ${context.watch<PuzzleProvider>().getmoves.toString()}",
        style: TextStyle(
            fontSize: getWidth(context) * 0.032,
            color: context.watch<ThemeProvider>().theme
                ? MyColor.darkcurve
                : MyColor.lightcurve,
            fontWeight: FontWeight.bold,
            fontFamily: GoogleFonts.abrilFatface().fontFamily,
            shadows: [
              Shadow(
                color: context.watch<ThemeProvider>().theme
                    ? MyColor.darkbotton
                    : MyColor.lightbotton,
                blurRadius: 1.0,
                offset: const Offset(2, -2),
              )
            ]),
      ),
    );
  }
}
