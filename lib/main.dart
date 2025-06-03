import 'package:flutter/material.dart';
import 'package:islamy/pages/home.dart';
import 'package:islamy/pages/intro_screen.dart';
import 'package:islamy/pages/native_splash_timer.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      routes: {
        IntroScreen.routeName: (_) => const IntroScreen(),
        Home.routeName: (_) => const Home(),
      },
      debugShowCheckedModeBanner: false,
      home: NativeSplashTimer(),
    );
  }
}
