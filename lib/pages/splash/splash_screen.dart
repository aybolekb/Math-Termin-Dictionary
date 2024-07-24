import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:math_termin_dictionary/config/theme/theme.dart';
import 'package:math_termin_dictionary/core/constants/constants.dart';
import 'package:math_termin_dictionary/main_navigations/main_navigation.dart';
import 'package:math_termin_dictionary/pages/draver/draver_side.dart';

class SplachScreen extends StatefulWidget {
  const SplachScreen({super.key});

  @override
  State<SplachScreen> createState() => _SplachScreenState();
}

class _SplachScreenState extends State<SplachScreen> {
  @override
  void initState() {
    super.initState();
    Timer(const Duration(seconds: 2), () {
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(builder: (context) => const DrawerSide()),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final appColor =
        theme.brightness == Brightness.dark ? DarkColor() : LightColor();

    return Scaffold(
        backgroundColor: Colors.white,
        body: Container(
          height: double.infinity,
          width: double.infinity,
          decoration: const BoxDecoration(
            image: DecorationImage(image: AssetImage(logo), fit: BoxFit.cover),
          ),
          child: const Stack(
            children: [
              Positioned(
                top: 180,
                bottom: 0,
                left: 0,
                right: 0,
                child: CupertinoActivityIndicator(
                  color: Colors.white,
                ),
              ),
            ],
          ),
        ));
  }
}
