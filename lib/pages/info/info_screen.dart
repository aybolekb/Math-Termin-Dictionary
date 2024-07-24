import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:math_termin_dictionary/config/theme/theme.dart';
import 'package:math_termin_dictionary/core/constants/constants.dart';

class InfoScreen extends StatelessWidget {
  const InfoScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final appColor =
        theme.brightness == Brightness.dark ? DarkColor() : LightColor();
    return Scaffold(
      backgroundColor: appColor.backgroundColor,
      body: SafeArea(
          child: ListView(
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
        children: [
          SizedBox(
            width: double.infinity,
            height: 200,
            child: ClipRRect(
              borderRadius:
                  const BorderRadius.vertical(top: Radius.circular(20)),
              child: Image.asset(
                oguzhan,
                height: 150,
                fit: BoxFit.cover,
              ),
            ),
          ),
          const Gap(10),
          Text(
            aboutApp,
            style: theme.textTheme.bodyMedium,
          )
        ],
      )),
    );
  }
}
