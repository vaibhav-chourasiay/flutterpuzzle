import 'package:flutter/material.dart';

// ignore: must_be_immutable
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
        if (constraints.maxWidth > 1200) {
          return isWeb;
        } else if (constraints.maxWidth > 750) {
          return isDesktop;
        } else {
          return isMobile;
        }
      },
    );
  }
}
