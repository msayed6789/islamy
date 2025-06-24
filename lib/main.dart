import 'package:flutter/material.dart';
import 'package:islamy/home_screen/home_screent.dart';
import 'package:islamy/home_screen/tabs/home_tap/home_tab.dart';
import 'package:islamy/home_screen/tabs/home_tap/sura_details.dart';
import 'package:islamy/pages/intro_screen.dart';
import 'package:islamy/pages/native_splash_timer.dart';
import 'package:islamy/services/appTheme.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      darkTheme: Apptheme.darkMode,
      //themeMode: ThemeMode.dark,
      theme:Apptheme.darkMode,
      routes: {
        IntroScreen.routeName: (_) => const IntroScreen(),
        NativeSplashTimer.routeName: (_) => const NativeSplashTimer(),
        SuraDetails.routeName:(context)=> SuraDetails(),
        Home.routeName: (_) => const Home(),
        HomeTab.routeName:(_)=> HomeTab(),
      },
      debugShowCheckedModeBanner: false,
  //  initialRoute: Home.routeName,
    initialRoute: "/Home_Screen",
    
    
    );
  }
}
