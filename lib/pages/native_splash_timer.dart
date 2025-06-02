import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:islamy/pages/intro_screen.dart';

class NativeSplashTimer extends StatefulWidget {
  const NativeSplashTimer({super.key});


  @override
  State<NativeSplashTimer> createState() => _NativeSplashTimerState();
}

class _NativeSplashTimerState extends State<NativeSplashTimer> {

  @override
  void initState() {
    super.initState();
    Timer(Duration(seconds: 5), () {
      Navigator.pushNamed(context, IntroScreen.routeName);
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox(
        width: double.infinity,
        height: double.infinity,
        child: Stack(
          children: [
            Image.asset(
              "assets/images/splashBackground.png",
              fit: BoxFit.cover,
              height: double.infinity,
            ),
            Positioned(
              top: 57,
        right: 45,
              child: Image.asset(
                "assets/images/mosque.png",
                height: 200,
                width: 300,
              ),
            ),
            Positioned(
              top: 214,
              left: 0,
              child: Image.asset(
                height: 187,
                width: 87,
                "assets/images/shabe_left.png",
              ),
            ),
            Positioned(
              top: 550,
              right: 0,
              child: Image.asset(
                height: 216,
                width: 101,
                "assets/images/shape_right.png",
              ),
            ),
            Positioned(
              top: 0,
              left: 329,
              right: 13,
              child: Image.asset(
                height: 313,
                width: 88,
                "assets/images/glow.png",
                fit: BoxFit.cover,
              ),
            ),
            Positioned(
              top: 341,
              left: 127,
              right: 130,
              child: Column(
                children: [
                  Image.asset(
                    "assets/images/App.png",
                    fit: BoxFit.cover,
                  ),
                  SvgPicture.asset("assets/images/Islami.svg")
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
