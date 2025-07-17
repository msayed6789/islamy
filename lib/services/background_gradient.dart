import 'package:flutter/material.dart';
import 'package:islamy/services/color.dart';

// ignore: must_be_immutable
class BackgroundGradient extends StatelessWidget {
  BackgroundGradient(
      {super.key, required this.child, required this.imag, this.fit,this.alignment});

  Widget child;
  String imag;
  BoxFit? fit;
  AlignmentGeometry? alignment;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: double.infinity,
      decoration: BoxDecoration(
          image: DecorationImage(
        alignment: alignment?? Alignment.center,
        image: AssetImage(
          imag,
        ),
        fit: fit ?? BoxFit.cover,
      )),
      child: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: BoxDecoration(
          gradient: LinearGradient(
              stops: [0.5, 1],
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [
                Color(ColorsApp.black).withValues(alpha: 0.7),
                Color(ColorsApp.black)
              ]),
        ),
        child: Column(
          children: [
            Expanded(child: child),
          ],
        ),
      ),
    );
  }
}
