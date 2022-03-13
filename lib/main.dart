import 'package:flutter/material.dart';
import 'package:game/models/mytheme.dart';
import 'package:game/view/pages/mobile_homepage.dart';
import 'package:game/view/pages/web_homepage.dart';
import 'package:game/view/responsive/responsive.dart';
import 'package:game/view_models/providers/puzzle_game_provider.dart';
import 'package:game/view_models/providers/theme_provider.dart';
import 'package:game/view_models/providers/time_provider.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MultiProvider(providers: [
    ChangeNotifierProvider(create: (_) => ThemeProvider()),
    ChangeNotifierProvider(create: (_) => PuzzleProvider()),
    ChangeNotifierProvider(create: (_) => TimeProvider()),
  ], child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    //**responsive
    //**theme

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      themeMode: context.watch<ThemeProvider>().theme
          ? ThemeMode.dark
          : ThemeMode.light,
      theme: MyTheme.light,
      darkTheme: MyTheme.dark,
      home: Responsive(
        isDesktop: const WebHomePage(),
        isMobile: const MobileHomePage(),
        isWeb: const WebHomePage(),
      ),
    );
  }
}
