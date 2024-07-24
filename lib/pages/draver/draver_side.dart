import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:math_termin_dictionary/config/theme/theme.dart';
import 'package:math_termin_dictionary/pages/draver/widgets/menu_item_card.dart';
import 'package:math_termin_dictionary/pages/home/home_screen.dart';
import 'package:math_termin_dictionary/pages/info/info_screen.dart';
import 'package:math_termin_dictionary/pages/saved/saved_screen.dart';
import 'package:math_termin_dictionary/provider/setting_provider.dart';
import 'package:provider/provider.dart';

class DrawerSide extends StatelessWidget {
  const DrawerSide({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final appColor =
        theme.brightness == Brightness.dark ? DarkColor() : LightColor();
    final settingProvider = Provider.of<SettingProvider>(context);
    final List<Widget> screens = [
      const HomeScreen(),
      const SavedScreen(),
      const InfoScreen(),
    ];
    final List<Widget> appBarText = [
      const Text('Sözlik'),
      const Text('Halanlarym'),
      const Text('Programma barada'),
    ];
    return Scaffold(
        appBar: AppBar(
          title: appBarText[settingProvider.page],
          elevation: 1,
        ),
        drawer: Drawer(
          child: Column(
            children: [
              Container(
                padding: const EdgeInsets.only(top: 60, bottom: 60),
                decoration: BoxDecoration(
                  color: appColor.primaryColor,
                  borderRadius: const BorderRadius.only(
                    bottomLeft: Radius.circular(100),
                    bottomRight: Radius.circular(0),
                  ),
                ),
                child: const Center(
                    child: Text('Matematiki Düşündirişli Sözlik',
                        textAlign: TextAlign.center,
                        style: TextStyle(color: Colors.white, fontSize: 24))),
              ),
              Divider(
                color: appColor.primaryColor,
              ),
              MenuItemCard(
                  icon: Icons.book_outlined,
                  text: 'Sözlik',
                  ontap: () {
                    settingProvider.setPage(0);
                    Navigator.pop(context);
                  }),
              MenuItemCard(
                  icon: Icons.favorite_border_outlined,
                  text: 'Halanlarym',
                  ontap: () {
                    settingProvider.setPage(1);
                    Navigator.pop(context);
                  }),
              MenuItemCard(
                  icon: Icons.info_outline,
                  text: 'Programma barada',
                  ontap: () {
                    settingProvider.setPage(2);
                    Navigator.pop(context);
                  }),
              MenuItemCard(
                  icon: settingProvider.isDark
                      ? Icons.light_mode_outlined
                      : Icons.dark_mode_outlined,
                  text: 'Ýagty tema',
                  ontap: () {
                    settingProvider.changeTheme();
                  })
            ],
          ),
        ),
        body: screens[settingProvider.page]);
  }
}
