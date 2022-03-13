import 'package:flutter/material.dart';
import 'package:game/view_models/providers/theme_provider.dart';
import 'package:provider/provider.dart';

class ThemeChangerSwitch extends StatefulWidget {
  const ThemeChangerSwitch({Key? key}) : super(key: key);

  @override
  State<ThemeChangerSwitch> createState() => _ThemeChangerSwitchState();
}

class _ThemeChangerSwitchState extends State<ThemeChangerSwitch>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation animation;

  @override
  void initState() {
    super.initState();
    _animationController =
        AnimationController(vsync: this, duration: const Duration(seconds: 1));
    animation =
        Tween<double>(begin: 5.0, end: 40.0).animate(_animationController);
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: BorderRadius.circular(30.0),
      onTap: () {
        if (_animationController.isCompleted) {
          _animationController.reverse();
        } else if (_animationController.isDismissed) {
          _animationController.forward();
        }
        context.read<ThemeProvider>().changetheme();
      },
      child: Container(
        width: 70.0,
        height: 35.0,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(30.0),
        ),
        child: Stack(
          children: [
            AnimatedBuilder(
              animation: _animationController,
              builder: (context, widget) {
                return Positioned(
                  left: animation.value,
                  top: 5.0,
                  child: widget!,
                );
              },
              child: Container(
                width: 25.0,
                height: 25.0,
                decoration: BoxDecoration(
                  color: context.watch<ThemeProvider>().theme
                      ? Colors.yellow
                      : const Color.fromARGB(255, 160, 162, 255),
                  borderRadius: BorderRadius.circular(30.0),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
