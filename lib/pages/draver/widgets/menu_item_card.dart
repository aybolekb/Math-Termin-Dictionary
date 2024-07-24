import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:math_termin_dictionary/config/theme/theme.dart';

class MenuItemCard extends StatelessWidget {
  final IconData icon;
  final String text;
  final Function() ontap;
  const MenuItemCard(
      {super.key, required this.icon, required this.text, required this.ontap});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final appColor =
        theme.brightness == Brightness.dark ? DarkColor() : LightColor();

    return GestureDetector(
      onTap: ontap,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 8),
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(30),
              color: appColor.secondaryColor),
          child: Row(
            children: [Icon(icon), const Gap(10), Text(text)],
          ),
        ),
      ),
    );
  }
}
