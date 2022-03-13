import 'dart:async';

import 'package:flutter/material.dart';
import 'package:game/models/mytheme.dart';
import 'package:game/view_models/providers/puzzle_game_provider.dart';
import 'package:game/view_models/providers/theme_provider.dart';
import 'package:game/view_models/providers/time_provider.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

import '../responsive/size_fuctions.dart';

class TimerView extends StatefulWidget {
  const TimerView({Key? key}) : super(key: key);

  @override
  State<TimerView> createState() => _TimerViewState();
}

class _TimerViewState extends State<TimerView> {
  late Timer timer;

  @override
  void initState() {
    super.initState();
    timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (context.read<PuzzleProvider>().istimer == true) {
        context.read<TimeProvider>().changetime();
      }
    });
  }

  @override
  void dispose() {
    super.dispose();
    timer.cancel();
  }

  @override
  Widget build(BuildContext context) {
    var time = context.watch<TimeProvider>();
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          padding: const EdgeInsets.only(bottom: 5.0, left: 20.0, right: 20.0),
          margin: const EdgeInsets.symmetric(vertical: 10.0),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(30.0),
          ),
          child: Text(
            "${time.gethour} : ${time.getmint} : ${time.getsec}",
            style: TextStyle(
                fontSize: (getWidth(context) < 450)
                    ? 25.0
                    : getWidth(context) * 0.032,
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
                      offset: const Offset(2, -2))
                ]),
          ),
        ),
      ],
    );
  }
}
