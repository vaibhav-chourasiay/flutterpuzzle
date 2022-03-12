import 'package:flutter/material.dart';

class ThemeProvider extends ChangeNotifier {
  bool isDark = false;

  bool get theme => isDark;

  changetheme() {
    isDark = !isDark;
    notifyListeners();
  }
}
