import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:math_termin_dictionary/config/theme/theme.dart';
import 'package:math_termin_dictionary/models/words.dart';
import 'package:math_termin_dictionary/pages/splash/splash_screen.dart';
import 'package:math_termin_dictionary/provider/setting_provider.dart';
import 'package:provider/provider.dart';
import 'package:hive_flutter/adapters.dart';

late Box box;

void main() async {
  await Hive.initFlutter();

  Hive.registerAdapter(WordsAdapter());
  box = await Hive.openBox<Words>('saved');

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final appColor =
        theme.brightness == Brightness.dark ? DarkColor() : LightColor();
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
        statusBarColor: appColor.primaryColor,
        statusBarIconBrightness: theme.brightness));
    return MultiProvider(
        providers: [
          ChangeNotifierProvider(
            create: (context) => SettingProvider(),
          ),
        ],
        builder: (context, child) {
          final settingProvider = Provider.of<SettingProvider>(context);

          return MaterialApp(
              title: 'Flutter Demo',
              debugShowCheckedModeBanner: false,
              theme: AppTheme.lightTheme(),
              darkTheme: AppTheme.darkTheme(),
              themeMode:
                  settingProvider.isDark ? ThemeMode.dark : ThemeMode.light,
              home: const SplachScreen());
        });
  }
}
