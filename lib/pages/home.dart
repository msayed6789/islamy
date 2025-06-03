import 'package:flutter/material.dart';
import 'package:islamy/services/color.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  static final String routeName = "/Home_Screen";


  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(ColorsApp.black),
    );
  }
}