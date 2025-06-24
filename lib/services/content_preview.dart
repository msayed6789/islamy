import 'package:flutter/material.dart';
import 'package:islamy/services/app_assets.dart';
import 'package:islamy/services/color.dart';

class ContentPreview extends StatelessWidget {
  final List<String> contentDetil;
  final String title;
  const ContentPreview({super.key, required this.contentDetil, required this.title});

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Image.asset(AppAssets.suraDetailsLeft,
              width: MediaQuery.of(context).size.width * 0.22,
              height: MediaQuery.of(context).size.height * 0.1),
          Text(
            title,
            style: TextStyle(
                fontSize: 24,
                color: Color(ColorsApp.gold),
                fontWeight: FontWeight.w700),
          ),
          Image.asset(AppAssets.suraDetailsRight,
              width: MediaQuery.of(context).size.width * 0.22,
              height: MediaQuery.of(context).size.height * 0.1),
        ],
      ),
      Expanded(
        child: SingleChildScrollView(
          child: Text.rich(
              textDirection: TextDirection.rtl,
              TextSpan(
                style: TextStyle(
                  fontSize: 20,
                  //color: Color(ColorsApp.gold),
                  fontWeight: FontWeight.w700,
                ),
                children: List.generate(
                    contentDetil.length,
                    (index) => TextSpan(
                          children: [
                            TextSpan(
                                text: contentDetil[index],
                                style: TextStyle(
                                  color: Colors.white,
                                )),
                            TextSpan(
                                text: "(${index + 1})  ",
                                style: TextStyle(
                                  color: Color(ColorsApp.gold),
                                )),
                          ],
                        )),
              )),
        ),
      )
    ]);
  }
}
