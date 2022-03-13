import 'package:flutter/material.dart';
import 'package:game/models/mytheme.dart';
import 'package:game/view/responsive/size_fuctions.dart';
import 'package:game/view_models/providers/puzzle_game_provider.dart';
import 'package:game/view_models/providers/theme_provider.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

// ignore: must_be_immutable
class PuzzlePiece extends StatelessWidget {
  int positionIndex;
  String value;
  PuzzlePiece({Key? key, required this.positionIndex, required this.value})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (value == "0") {
      return const SizedBox.shrink();
    }

    return AnimatedPositioned(
      duration: const Duration(milliseconds: 500),
      left: context.watch<PuzzleProvider>().getPositions[positionIndex].dx,
      top: context.watch<PuzzleProvider>().getPositions[positionIndex].dy,
      child: InkWell(
        onTap: () {
          context.read<PuzzleProvider>().changePosition(positionIndex);
          if (context.read<PuzzleProvider>().checkwin() == true) {
            ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
              content: Text(
                "Great You Solved The Puzzzle",
              ),
              backgroundColor: Colors.green,
            ));
          }
        },
        child: Card(
          elevation: 10.0,
          color: context.watch<ThemeProvider>().theme
              ? MyColor.darkbotton
              : MyColor.lightbotton,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20.0),
          ),
          child: Container(
            width: context.watch<PuzzleProvider>().getboxsize,
            height: context.watch<PuzzleProvider>().getboxsize,
            alignment: Alignment.center,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20.0),
            ),
            child: Text(
              value,
              style: TextStyle(
                  fontSize: getWidth(context) * 0.035,
                  color: context.watch<ThemeProvider>().theme
                      ? MyColor.dark
                      : MyColor.light,
                  fontFamily: GoogleFonts.abrilFatface().fontFamily,
                  fontWeight: FontWeight.bold,
                  shadows: const [
                    Shadow(
                        color: Color.fromARGB(255, 154, 255, 238),
                        blurRadius: 1.0,
                        offset: Offset(2, -2))
                  ]),
            ),
          ),
        ),
      ),
    );
  }
}
