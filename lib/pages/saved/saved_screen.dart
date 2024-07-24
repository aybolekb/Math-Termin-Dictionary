import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:math_termin_dictionary/config/theme/theme.dart';
import 'package:math_termin_dictionary/core/widgets/app_bar_custom.dart';
import 'package:math_termin_dictionary/main.dart';
import 'package:math_termin_dictionary/pages/home/widgets/card_words.dart';
import 'package:math_termin_dictionary/pages/home/widgets/custom_container.dart';

class SavedScreen extends StatefulWidget {
  const SavedScreen({super.key});

  @override
  State<SavedScreen> createState() => _SavedScreenState();
}

class _SavedScreenState extends State<SavedScreen> {
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final appColor =
        theme.brightness == Brightness.dark ? DarkColor() : LightColor();
    return SafeArea(
      child: Column(
        children: [
          ValueListenableBuilder(
              valueListenable: box.listenable(),
              builder: (context, value, child) {
                return CustomContainer(
                  child: value.isEmpty
                      ? Center(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              const Icon(
                                Icons.favorite,
                                color: Colors.red,
                                size: 40,
                              ),
                              const Gap(20),
                              Text(
                                'Häzirlikçe halanlarym boş',
                                style: theme.textTheme.titleSmall,
                              ),
                            ],
                          ),
                        )
                      : Column(
                          children: [
                            const Gap(20),
                            Expanded(
                              child: ListView.builder(
                                  itemCount: value.length,
                                  itemBuilder: (context, index) {
                                    final item = value.getAt(index);
                                    final key = item.id;
                                    return Padding(
                                      padding: const EdgeInsets.symmetric(
                                          vertical: 8),
                                      child: CardWords(
                                          word: item,
                                          onTap: () {
                                            box.delete(key);
                                          },
                                          isSaved: true),
                                    );
                                  }),
                            )
                          ],
                        ),
                );
              }),
        ],
      ),
    );
  }
}
