import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

import '../../models/mytheme.dart';
import '../../view_models/providers/puzzle_game_provider.dart';
import '../../view_models/providers/theme_provider.dart';
import '../../view_models/providers/time_provider.dart';
import '../responsive/size_fuctions.dart';

class SuffleButton extends StatelessWidget {
  const SuffleButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton.icon(
      style: ElevatedButton.styleFrom(
        padding: EdgeInsets.symmetric(
          horizontal: getWidth(context) * 0.03,
          vertical: getHeight(context) * 0.027,
        ),
        primary: context.watch<ThemeProvider>().theme
            ? MyColor.darkcurve
            : MyColor.lightcurve,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(30.0),
        ),
      ),
      onPressed: () {
        context.read<PuzzleProvider>().sufflevalue();
        context.read<TimeProvider>().reset();
      },
      icon: const Icon(Icons.start_rounded),
      label: Text(
        "Suffle",
        style: TextStyle(
            fontSize: getWidth(context) * 0.0266,
            fontWeight: FontWeight.bold,
            fontFamily: GoogleFonts.abrilFatface().fontFamily,
            color: MyColor.light,
            shadows: const [
              Shadow(
                color: Colors.black,
                blurRadius: 2.0,
                offset: Offset(2, -2),
              ),
            ]),
      ),
    );
  }
}
