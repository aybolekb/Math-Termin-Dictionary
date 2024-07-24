import 'package:flutter/material.dart';
import 'package:math_termin_dictionary/pages/info/info_screen.dart';

extension Navigation on BuildContext {
  void push(Widget screen) {
    Navigator.of(this).push(MaterialPageRoute(builder: (context) => screen));
  }

  void pushAndRemoveUntil(Widget screen) {
    Navigator.of(this).pushAndRemoveUntil(
        MaterialPageRoute(builder: (context) => screen),
        (Route<dynamic> route) => false);
  }

  openInfoScreen() {
    push(const InfoScreen());
  }
}
