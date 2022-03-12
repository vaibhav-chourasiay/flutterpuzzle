import 'package:flutter/material.dart';
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
                ? Color.fromARGB(255, 28, 24, 37)
                : Color.fromARGB(255, 43, 255, 220)),
        child: Container(
          width: getWidth(context),
          height: double.maxFinite,
          child: Column(
            children: [
              const WebAppBar(),
              Expanded(
                child: Row(
                  children: [
                    const SideMenu(),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
