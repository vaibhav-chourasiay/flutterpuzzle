import 'package:flutter/material.dart';
import 'package:game/models/mytheme.dart';
import 'package:game/view/widgets/numberofmoves.dart';
import 'package:game/view_models/providers/puzzle_game_provider.dart';
import 'package:game/view_models/providers/theme_provider.dart';
import 'package:game/view_models/providers/time_provider.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

import '../responsive/size_fuctions.dart';

class SideMenu extends StatelessWidget {
  const SideMenu({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: getWidth(context) * 0.25,
      // height: double.maxFinite,
      height: getHeight(context) * 0.70,

      margin: EdgeInsets.only(left: getWidth(context) * 0.04),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: getHeight(context) * 0.12,
          ),
          Text(
            "Classic Sliding",
            style: TextStyle(
                fontSize: getWidth(context) * 0.034,
                fontWeight: FontWeight.bold,
                fontFamily: GoogleFonts.lato().fontFamily,
                color: context.watch<ThemeProvider>().theme
                    ? MyColor.light
                    : MyColor.light,
                shadows: const [
                  Shadow(
                      color: Colors.black,
                      blurRadius: 1.0,
                      offset: Offset(2, -2))
                ]),
          ),
          Text(
            "#Puzzle Chanllenge",
            style: TextStyle(
                fontSize: getWidth(context) * 0.034,
                fontWeight: FontWeight.bold,
                fontFamily: GoogleFonts.abrilFatface().fontFamily,
                color: context.watch<ThemeProvider>().theme
                    ? MyColor.light
                    : MyColor.lightbotton,
                shadows: const [
                  Shadow(
                      color: Colors.black,
                      blurRadius: 1.0,
                      offset: Offset(2, -2))
                ]),
          ),
          SizedBox(
            height: getHeight(context) * 0.04,
          ),
          (getWidth(context) < 1200)
              ? const NumberOfMove()
              : const SizedBox.shrink(),
          SizedBox(
            height: getHeight(context) * 0.05,
          ),
          ElevatedButton.icon(
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
          ),
        ],
      ),
    );
  }
}
