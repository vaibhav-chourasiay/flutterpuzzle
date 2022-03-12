import 'package:flutter/material.dart';

class Responsive extends StatelessWidget {
  Widget isWeb;
  Widget isMobile;
  Widget isDesktop;
  Responsive(
      {Key? key,
      required this.isDesktop,
      required this.isMobile,
      required this.isWeb})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        if (constraints.maxWidth > 800) {
          return isWeb;
        } else if (constraints.maxWidth > 550) {
          return isDesktop;
        } else {
          return isMobile;
        }
      },
    );
  }
}
