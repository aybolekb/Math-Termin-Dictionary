import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:math_termin_dictionary/config/theme/theme.dart';

import 'package:math_termin_dictionary/models/words.dart';

class CardWords extends StatelessWidget {
  const CardWords({
    super.key,
    required this.word,
    required this.onTap,
    required this.isSaved,
  });
  final Words word;
  final Function() onTap;
  final bool isSaved;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final appColor =
        theme.brightness == Brightness.dark ? DarkColor() : LightColor();

    return Container(
        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 16),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          color: appColor.secondaryColor,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Expanded(
                      child: Text("🇹🇲 ${word.turkmen}",
                          overflow: TextOverflow.ellipsis,
                          maxLines: 1,
                          style: const TextStyle(
                            overflow: TextOverflow.ellipsis,
                          )),
                    ),
                    IconButton(
                        onPressed: onTap,
                        icon: isSaved
                            ? const Icon(
                                Icons.favorite,
                                size: 26,
                                color: Colors.red,
                              )
                            : const Icon(
                                Icons.favorite_border_outlined,
                                size: 26,
                              )),
                  ],
                ),
                Divider(
                  color: appColor.primaryColor,
                ),
                Text(
                  "🇬🇧 ${word.english}",
                ),
                const Gap(16),
                Text(
                  "🇷🇺 ${word.russion} ",
                ),
              ],
            ),
          ],
        ));
  }
}
