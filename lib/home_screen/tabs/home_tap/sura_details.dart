import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:islamy/home_screen/models/sura_model.dart';
import 'package:islamy/services/app_assets.dart';
import 'package:islamy/services/color.dart';
import 'package:islamy/services/content_preview.dart';

class SuraDetails extends StatefulWidget {
  const SuraDetails({super.key});
  static const routeName = "SuraDetails";

  @override
  State<SuraDetails> createState() => _SuraDetailsState();
}

class _SuraDetailsState extends State<SuraDetails> {
  List<String> suraDet = [];
  late SuraModel suraModelDat;
  bool loadContent = true;

  @override
  Widget build(BuildContext context) {
    suraModelDat = ModalRoute.of(context)!.settings.arguments as SuraModel;
    if (loadContent) {
      loadSuraContent();
      loadContent = false;
    }
    return Scaffold(
      appBar: AppBar(
        title: Text(
          suraModelDat.enName,
          style: TextStyle(
            color: Color(ColorsApp.gold),
          ),
        ),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(
            vertical: MediaQuery.of(context).size.height * 0.018,
            horizontal: MediaQuery.of(context).size.width * 0.05),
        child: ContentPreview(contentDetil: suraDet, title: suraModelDat.enName,)
        //Column(children: [
        //   Row(
        //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
        //     children: [
        //       Image.asset(AppAssets.suraDetailsLeft,
        //           width: MediaQuery.of(context).size.width * 0.22,
        //           height: MediaQuery.of(context).size.height * 0.1),
        //       Text(
        //         suraModelDat.arName,
        //         style: TextStyle(
        //             fontSize: 24,
        //             color: Color(ColorsApp.gold),
        //             fontWeight: FontWeight.w700),
        //       ),
        //       Image.asset(AppAssets.suraDetailsRight,
        //           width: MediaQuery.of(context).size.width * 0.22,
        //           height: MediaQuery.of(context).size.height * 0.1),
        //     ],
        //   ),
        //   Expanded(
        //     child: SingleChildScrollView(
        //       child: Text.rich(
        //           textDirection: TextDirection.rtl,
        //           TextSpan(
        //             style: TextStyle(
        //               fontSize: 20,
        //               //color: Color(ColorsApp.gold),
        //               fontWeight: FontWeight.w700,
        //             ),
        //             children: List.generate(
        //                 suraDet.length,
        //                 (index) => TextSpan(
        //                       children: [
        //                         TextSpan(
        //                             text: suraDet[index],
        //                             style: TextStyle(
        //                               color: Colors.white,
        //                             )),
        //                         TextSpan(
        //                             text: "(${index + 1})  ",
        //                             style: TextStyle(
        //                               color: Color(ColorsApp.gold),
        //                             )),
        //                       ],
        //                     )),
        //           )),
        //     ),
        //   )
        // ]),
      ),
    );
  }

  Future<void> loadSuraContent() async {
    try {
      String fileContent = await rootBundle
          .loadString("assets/files/Suras/${suraModelDat.suraCount}.txt");
      suraDet = fileContent.trim().split("\n");
      setState(() {});
    } catch (e) {
    //  ToDo
    }
  }
}
