import 'package:flutter/material.dart';
import 'package:islamy/home_screen/tabs/book_tap/book_tab.dart';
import 'package:islamy/services/color.dart';
import 'package:islamy/services/content_preview.dart';

// ignore: must_be_immutable
class HadeethDetails extends StatelessWidget {
   HadeethDetails({
    super.key,
  });

  static String routeName = "HadeethDetails";
  late int index;

  @override
  Widget build(BuildContext context) {
    index=ModalRoute.of(context)!.settings.arguments as int;
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Hadeeth$index",
          style: TextStyle(
            color: Color(ColorsApp.gold),
          ),
        ),
      ),
      body: Padding(
          padding: EdgeInsets.symmetric(
              vertical: MediaQuery.of(context).size.height * 0.018,
              horizontal: MediaQuery.of(context).size.width * 0.05),
          child: ContentPreview(
            contentDetil: [],
            success: successBook,
            title: hadhadeeth[index-1].hadeethTitle,
            loading: loadingBook,
            error: errorBook,
            content:hadhadeeth[index-1].hadeethContent,
            loadContent: loadHadeethContentBook,
            isSura: false,
          )),
    );
  }
}
