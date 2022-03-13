import 'package:flutter/material.dart';

class TimeProvider with ChangeNotifier {
  int sec = 0;
  int mint = 0;
  int hour = 0;

  String get getsec {
    return getinstring(sec);
  }

  String get getmint {
    return getinstring(mint);
  }

  String get gethour {
    return getinstring(hour);
  }

  String getinstring(int value) {
    if (value < 10) {
      return "0$value";
    }
    return value.toString();
  }

  void incresesec() {
    if (sec < 59) {
      sec++;
    } else {
      sec = 0;
      incresemint();
    }
  }

  void incresemint() {
    if (mint < 59) {
      mint++;
    } else {
      mint = 0;
      incresehour();
    }
  }

  void incresehour() {
    hour++;
  }

  void changetime() {
    incresesec();
    notifyListeners();
  }

  void reset() {
    sec = 0;
    mint = 0;
    hour = 0;
    notifyListeners();
  }
}
