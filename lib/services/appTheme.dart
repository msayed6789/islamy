import 'package:flutter/material.dart';
import 'package:islamy/services/color.dart';

class Apptheme {
static  ThemeData darkMode = ThemeData(

    useMaterial3: true,
    colorScheme: ColorScheme.fromSeed(seedColor:Color(ColorsApp.gold)),
    scaffoldBackgroundColor: Color(ColorsApp.black),
    appBarTheme: AppBarTheme(
      backgroundColor: Color(ColorsApp.black),
      centerTitle: true,
      iconTheme: IconThemeData(color:  Color(ColorsApp.gold),size: 20),
      titleTextStyle: TextStyle(
color: Color(ColorsApp.gold),
fontWeight: FontWeight.w700,
fontSize: 20,
      )
    )
  );
}
