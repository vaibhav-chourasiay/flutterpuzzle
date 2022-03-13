import 'package:flutter/material.dart';
import 'package:game/models/mytheme.dart';
import 'package:game/view/responsive/size_fuctions.dart';
import 'package:game/view/widgets/background_curve.dart';
import 'package:provider/provider.dart';

import '../../view_models/providers/theme_provider.dart';
import '../widgets/widgets.dart';

class WebHomePage extends StatelessWidget {
  const WebHomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).backgroundColor,
      body: CustomPaint(
        painter: BackgroundCurve(
            color: context.watch<ThemeProvider>().theme
                ? MyColor.darkcurve
                : MyColor.lightcurve),
        child: SizedBox(
          width: getWidth(context),
          height: double.maxFinite,
          // height: getHeight(context),
          child: Column(
            children: [
              const WebAppBar(),
              Expanded(
                child: SingleChildScrollView(
                  child: Row(
                    children: [
                      const SideMenu(),
                      const Expanded(child: PuzzleContainer()),
                      (getWidth(context) > 1200.0)
                          ? Container(
                              width: getWidth(context) * 0.25,
                              height: getHeight(context) * 0.70,
                              margin:
                                  const EdgeInsets.symmetric(horizontal: 10.0),
                              child: Column(
                                children: [
                                  SizedBox(
                                    height: getHeight(context) * 0.08,
                                  ),
                                  const NumberOfMove(),
                                ],
                              ),
                            )
                          : const SizedBox.shrink(),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
