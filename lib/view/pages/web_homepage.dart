import 'package:flutter/material.dart';
import 'package:game/view/widgets/background_curve.dart';

class WebHomePage extends StatelessWidget {
  const WebHomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        body: CustomPaint(
          painter: BackgroundCurve(color: Color.fromARGB(255, 43, 255, 220)),
          child: Container(),
        ));
  }
}
