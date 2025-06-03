import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:islamy/pages/home.dart';
import 'package:islamy/services/color.dart';

int index = 0;
const double persHeight = 834.9090909090909;
const double persWidth = 392.72727272727275;

class IntroScreen extends StatefulWidget {
  const IntroScreen({super.key});
  static final String routeName = "/Intro_Screen";

  @override
  State<IntroScreen> createState() => _IntroScreenState();
}

class _IntroScreenState extends State<IntroScreen> {
  List pages = [
    {
      "image": "assets/images/Intro1.png",
      "text": "",
      "mainText": "Welcome To Islmi App"
    },
    {
      "image": "assets/images/Intro2.png",
      "text": "We Are Very Excited To Have You In Our Community",
      "mainText": "Welcome To Islmi App"
    },
    {
      "image": "assets/images/Intro3.png",
      "text": "Read, and your Lord is the Most Generous",
      "mainText": "Reading the Quran"
    },
    {
      "image": "assets/images/Intro4.png",
      "text": "Praise the name of your Lord, the Most High",
      "mainText": "Bearish"
    },
    {
      "image": "assets/images/Intro5.png",
      "text":
          "You can listen to the Holy Quran Radio through the application for free and easily",
      "mainText": "Holy Quran Radio"
    },
  ];
  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    print(screenWidth);

    return Scaffold(
      backgroundColor: Color(ColorsApp.black),
      body: SafeArea(
        child: SizedBox(
          height: screenHeight,
          width: screenWidth,
          child: Stack(
            children: [
              Positioned(
                // top: 16,
                // right: 50,
                // height: 171,
                // width: 291,

                top: screenHeight * (16 / persHeight),
                right: screenWidth * (50 / persWidth),
                height: screenHeight * (171 / persHeight),
                width: screenWidth * (291 / persWidth),
                child: Image.asset(
                  "assets/images/mosque.png",
                ),
              ),
              Positioned(
                  // top: 75,
                  // left: 120,
                  // height: 96,
                  // width: 166,
                  top: screenHeight * (75 / persHeight),
                  left: screenWidth * (120 / persWidth),
                  height: screenHeight * (96 / persHeight),
                  width: screenWidth * (166 / persWidth),
                  child: SvgPicture.asset("assets/images/Islami.svg")),
              Padding(
                //padding: const EdgeInsets.only(top: 180  ),
                padding:
                    EdgeInsets.only(top: screenHeight * (180 / persHeight)),
                child: Image.asset(
                  pages[index]["image"],
                ),
              ),
              Padding(
                //padding: EdgeInsets.only(bottom: 170),
                padding:
                    EdgeInsets.only(bottom: screenHeight * (170 / persHeight)),
                child: Align(
                  alignment: Alignment.bottomCenter,
                  child: Text(
                    pages[index]["mainText"],
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.w700,
                        color: Color(ColorsApp.gold)),
                  ),
                ),
              ),
              Padding(
                //padding: const EdgeInsets.only(bottom: 90),
                padding:
                    EdgeInsets.only(bottom: screenHeight * (90 / persHeight)),
                child: Align(
                  alignment: Alignment.bottomCenter,
                  child: Text(
                    textAlign: TextAlign.center,
                    pages[index]["text"],
                    style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w700,
                        color: Color(ColorsApp.gold)),
                  ),
                ),
              ),
              index>0?
              Padding(
                padding: EdgeInsets.symmetric(horizontal: screenWidth * (16 / persWidth),vertical: screenHeight * (16 / persHeight)),
                
                child: Align(
                  alignment: Alignment.bottomLeft,
                  child: TextButton(
                    onPressed: () {
                      setState(() {
                        if (index > 0) {
                          index--;
                        }
                      });
                    },
                    child: Text(
                      "Back",
                      style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.w700,
                          color: Color(ColorsApp.gold)),
                    ),
                  ),
                ),
              ):SizedBox.shrink(),
              // SizedBox(
              //   //width: 50,
              //     width: screenWidth * (50 / persWidth),
              // ),
              Positioned(
                  bottom: screenHeight * (27 / persHeight),
                  left: screenWidth * (133 / persWidth),
                
                child: DotsIndicator(
                  dotsCount: pages.length,
                  position: double.parse(index.toString()),
                  decorator: DotsDecorator(
                    activeColor: Color(ColorsApp.gold),
                    color: Color(ColorsApp.lightGold),
                    size: const Size.square(9.0),
                    activeSize: const Size(18.0, 9.0),
                    activeShape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(5.0)),
                  ),
                ),
              ),
              // SizedBox(
              // //  width: 50,
              //   width: screenWidth * (50 / persWidth),
              // ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: screenWidth * (16 / persWidth),vertical: screenHeight * (16 / persHeight)),
                child: Align(
                  alignment: Alignment.bottomRight,
                  child: TextButton(
                    onPressed: () {
                      setState(() {
                        if (pages.length - 1 > index) {
                          index++;
                        } else {
                          Navigator.pushNamed(context, Home.routeName);
                        }
                      });
                    },
                    child: Text(
                      "Next",
                      style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.w700,
                          color: Color(ColorsApp.gold)),
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
