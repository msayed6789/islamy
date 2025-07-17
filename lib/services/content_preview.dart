import 'package:flutter/material.dart';
import 'package:islamy/services/app_assets.dart';
import 'package:islamy/services/color.dart';

class ContentPreview extends StatelessWidget {
  final List<String> contentDetil;
  final String title;
  final String? content;
  final bool success;
  final bool loading;
  final bool error;
  final bool isSura;
  final Function loadContent;
  const ContentPreview(
      {super.key,
      required this.contentDetil,
      required this.title,
      required this.success,
      required this.loading,
      required this.error,
      required this.loadContent,
      required this.isSura,  this.content});

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
        child: loading
            ? Padding(
                padding: EdgeInsets.symmetric(
                    vertical: MediaQuery.of(context).size.height * 0.2,
                    horizontal: MediaQuery.of(context).size.width * 0.05),
                child: CircularProgressIndicator(),
              )
            : success
                ? isSura
                    ? Text.rich(
                        textDirection: TextDirection.rtl,
                        TextSpan(
                          style: TextStyle(
                            fontSize: 20,
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
                                          ))
                                    ],
                                  )),
                        ))
                    : Text.rich(
                        textDirection: TextDirection.rtl,
                        textAlign: TextAlign.center,
                        TextSpan(
                            text: content,
                            style: TextStyle(
                              fontSize: 20,
                              color: Colors.white,
                            )))
                : Padding(
                    padding: EdgeInsets.symmetric(
                        vertical: MediaQuery.of(context).size.height * 0.2,
                        horizontal: MediaQuery.of(context).size.width * 0.05),
                    child: Column(
                      children: [
                        Text("Loading Error",
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 24,
                                fontWeight: FontWeight.w700)),
                        SizedBox(
                          height: 20,
                        ),
                        ElevatedButton(
                            onPressed: () => loadContent(),
                            child: Text("Try Again"))
                      ],
                    ),
                  ),
      )),
      Image.asset(AppAssets.contentReview,
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height * 0.12),
    ]);
  }
}
