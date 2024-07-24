import 'package:flutter/material.dart';
import 'package:math_termin_dictionary/config/theme/theme.dart';

class CustomContainer extends StatelessWidget {
  const CustomContainer({super.key, required this.child});
  final Widget child;
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final appColor =
        theme.brightness == Brightness.dark ? DarkColor() : LightColor();

    return Expanded(
      child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 12),
          height: double.infinity,
          width: double.infinity,
          child: child),
    );
  }
}
