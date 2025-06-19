import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:islamy/home_screen/tabs/book_tap/book_tab.dart';
import 'package:islamy/home_screen/tabs/home_tap/home_tab.dart';
import 'package:islamy/home_screen/tabs/radio_tap/radio_tab.dart';
import 'package:islamy/home_screen/tabs/sebha_tap/sebha_tab.dart';
import 'package:islamy/home_screen/tabs/time_tap/time_tab.dart';
import 'package:islamy/services/app_assets.dart';
import 'package:islamy/services/color.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  static final String routeName = "/Home_Screen";

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int index = 0;
  @override
  void initState() {
    index = 0;
    super.initState();
  }

  List<Widget> tabs = [HomeTab(),BookTab(),SebhaTab(),TimeTab(),RadioTab()];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body:Stack(
          children: [
              tabs[index],
              Positioned(
                top:MediaQuery.of(context).size.height*0.035,
                right: 0,
                left: 0,
                child: Image.asset(
                  "assets/images/mosque.png",
                  height: MediaQuery.of(context).size.height*0.2,
                ),
              ),
              Positioned(
                  top: MediaQuery.of(context).size.height*0.13,
                  left: 0,
                  right: 0,
                
                  child: SvgPicture.asset("assets/images/Islami.svg",)),
          
          ],
        ) ,
          bottomNavigationBar: BottomNavigationBar(
              onTap: (value) {
                index = value;
                setState(() {});
              },
              currentIndex: index,
              items: [
            BottomNavigationBarItem(
              icon: SvgPicture.asset(AppAssets.quranIcon),
              label: "Quran",
              activeIcon: Container(
                decoration: BoxDecoration(
                  color: Color(ColorsApp.black).withValues(alpha: 0.6),
                  borderRadius: BorderRadius.circular(66),
                ),
                padding: EdgeInsets.symmetric(vertical: 6, horizontal: 20),
                child: SvgPicture.asset(
                  AppAssets.quranIcon,
                  colorFilter: ColorFilter.mode(Colors.white, BlendMode.srcIn),
                ),
              ),
            ),
            BottomNavigationBarItem(
              icon: SvgPicture.asset(AppAssets.bookIcon),
              label: "Hadith",
              activeIcon: Container(
                decoration: BoxDecoration(
                  color: Color(ColorsApp.black).withValues(alpha: 0.6),
                  borderRadius: BorderRadius.circular(66),
                ),
                padding: EdgeInsets.symmetric(vertical: 6, horizontal: 20),
                child: SvgPicture.asset(AppAssets.bookIcon,
                    colorFilter: ColorFilter.mode(Colors.white, BlendMode.srcIn)),
              ),
            ),
            BottomNavigationBarItem(
              icon: SvgPicture.asset(AppAssets.necklaceIcon),
              label: "Sebha",
              activeIcon: Container(
                decoration: BoxDecoration(
                  color: Color(ColorsApp.black).withValues(alpha: 0.6),
                  borderRadius: BorderRadius.circular(66),
                ),
                padding: EdgeInsets.symmetric(vertical: 6, horizontal: 20),
                child: SvgPicture.asset(
                  AppAssets.necklaceIcon,
                  colorFilter: ColorFilter.mode(Colors.white, BlendMode.srcIn),
                ),
              ),
            ),
            BottomNavigationBarItem(
              icon: SvgPicture.asset(AppAssets.radioIcon),
              label: "Radio",
              activeIcon: Container(
                decoration: BoxDecoration(
                  color: Color(ColorsApp.black).withValues(alpha: 0.6),
                  borderRadius: BorderRadius.circular(66),
                ),
                padding: EdgeInsets.symmetric(vertical: 6, horizontal: 20),
                child: SvgPicture.asset(
                  AppAssets.radioIcon,
                  colorFilter: ColorFilter.mode(Colors.white, BlendMode.srcIn),
                ),
              ),
            ),
            BottomNavigationBarItem(
              icon: SvgPicture.asset(AppAssets.staIcon),
              label: "Time",
              activeIcon: Container(
                decoration: BoxDecoration(
                  color: Color(ColorsApp.black).withValues(alpha: 0.6),
                  borderRadius: BorderRadius.circular(66),
                ),
                padding: EdgeInsets.symmetric(vertical: 6, horizontal: 20),
                child: SvgPicture.asset(
                  AppAssets.staIcon,
                  colorFilter: ColorFilter.mode(Colors.white, BlendMode.srcIn),
                ),
              ),
            ),
          ])),
    );
  }
}
