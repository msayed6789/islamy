import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:islamy/home_screen/models/sura_model.dart';

import 'package:islamy/services/color.dart';
import 'package:islamy/services/content_preview.dart';

class SuraDetails extends StatefulWidget {
  const SuraDetails({super.key, });
  static const routeName = "SuraDetails";

  @override
  State<SuraDetails> createState() => _SuraDetailsState();
}

class _SuraDetailsState extends State<SuraDetails> {
  List<String> suraDet = [];
  late SuraModel suraModelDat;
  bool loadContent = true;
  bool success = false, loading = false, error = false;

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
          child: ContentPreview(
            contentDetil: suraDet,
            title: suraModelDat.arName,
            success: success,
            loading: loading,
            error: error,
            loadContent: loadSuraContent, isSura: true,
          )),
    );
  }

  Future<void> loadSuraContent() async {
  
    loading = true;
    await Future.delayed(Duration(seconds: 1));
    try {
      String fileContent = await rootBundle
          .loadString("assets/files/Suras/${suraModelDat.suraCount}.txt");
      suraDet = fileContent.trim().split("\n");
      success = true;
      loading = false;
      setState(() {});
    } catch (e) {
      error = true;
      loading = false;
      setState(() {});
    }
  }
}
