import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:game/view/responsive/size_fuctions.dart';
import 'package:game/view/widgets/widgets.dart';
import 'package:google_fonts/google_fonts.dart';

class WebAppBar extends StatefulWidget {
  const WebAppBar({Key? key}) : super(key: key);

  @override
  State<WebAppBar> createState() => _WebAppBarState();
}

class _WebAppBarState extends State<WebAppBar> {
  @override
  Widget build(BuildContext context) {
    return TweenAnimationBuilder(
      duration: const Duration(seconds: 1),
      tween: Tween<double>(begin: 0.0, end: 1.0),
      builder: (context, double value, child) {
        return Opacity(
          opacity: value,
          child: Container(
            width: getWidth(context),
            height: getHeight(context) * 0.10,
            margin: EdgeInsets.only(
              left: getWidth(context) * 0.06,
              right: getWidth(context) * 0.06,
              top: value * 20,
            ),
            child: child,
          ),
        );
      },
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          DefaultTextStyle(
            style: TextStyle(
              fontSize: getWidth(context) * 0.0256,
              color: const Color.fromARGB(255, 255, 255, 255),
              fontFamily: GoogleFonts.abrilFatface().fontFamily,
              fontWeight: FontWeight.bold,
            ),
            child: AnimatedTextKit(
              animatedTexts: [
                WavyAnimatedText(
                  "PuzzleX",
                ),
              ],
            ),
          ),
          const ThemeChangerSwitch(),
        ],
      ),
    );
  }
}
