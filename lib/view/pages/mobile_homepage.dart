import 'package:flutter/material.dart';
import 'package:game/models/mytheme.dart';
import 'package:game/view/responsive/size_fuctions.dart';
import 'package:game/view/widgets/suffle_button.dart';
import 'package:game/view/widgets/widgets.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

import '../../view_models/providers/theme_provider.dart';
import '../widgets/background_curve.dart';

class MobileHomePage extends StatelessWidget {
  const MobileHomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0.0,
        title: Text(
          "PuzzleX",
          style: TextStyle(
            color: const Color.fromARGB(255, 255, 255, 255),
            fontFamily: GoogleFonts.abrilFatface().fontFamily,
            fontWeight: FontWeight.bold,
          ),
        ),
        actions: const [
          Padding(
            padding: EdgeInsets.symmetric(vertical: 10.0),
            child: ThemeChangerSwitch(),
          ),
        ],
      ),
      body: CustomPaint(
          painter: BackgroundCurve(
              color: context.watch<ThemeProvider>().theme
                  ? MyColor.darkcurve
                  : MyColor.lightcurve),
          child: Container(
            width: getWidth(context),
            height: getHeight(context),
            margin: EdgeInsets.only(top: getHeight(context) * 0.05),
            child: ListView(
              children: [
                const ListTile(
                  trailing: Padding(
                    padding:
                        EdgeInsets.symmetric(horizontal: 4.0, vertical: 2.0),
                    child: NumberOfMove(),
                  ),
                ),
                const PuzzleContainer(),
                Container(
                    margin: const EdgeInsets.all(10.0),
                    child: const SuffleButton()),
              ],
            ),
          )),
    );
  }
}
