import 'package:flutter/material.dart';
import 'package:islamy/home_screen/models/sura_model.dart';
import 'package:islamy/home_screen/tabs/home_tap/sura_details.dart';
import 'package:islamy/services/app_assets.dart';
import 'package:islamy/services/color.dart';

class SuraCard extends StatelessWidget {
  //final Map sura_info;

  final SuraModel sura;
  final Function(SuraModel, int) mostRecentAdd;
  // ignore: non_constant_identifier_names
  const SuraCard(
      {super.key,
      /* required this.sura_info,*/ required this.sura,
      required this.mostRecentAdd});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        List<SuraModel> suras = SuraModel.suraInfo;
      int index=  suras.indexWhere((element) => element.arName == sura.arName);
        mostRecentAdd(sura, index);
        Navigator.of(context).pushNamed(SuraDetails.routeName, arguments: sura);
      },
      child: Card(
        color: Color(ColorsApp.gold),
        margin: EdgeInsets.symmetric(horizontal: 5, vertical: 10),
        child: Container(
          width: MediaQuery.of(context).size.width * 0.7,
          padding: EdgeInsets.symmetric(horizontal: 6, vertical: 12),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                flex: 4,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      //sura_info["sura_eng"],
                      sura.enName,
                      style: TextStyle(
                          color: Color(ColorsApp.black),
                          fontSize: 24,
                          fontWeight: FontWeight.w700),
                    ),
                    Text(
                      //sura_info["sura_arb"],
                      sura.arName,

                      style: TextStyle(
                          color: Color(ColorsApp.black),
                          fontSize: 24,
                          fontWeight: FontWeight.w700),
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    Text(
                      //"${sura_info["pageCount"]} Verses",
                      "${sura.versesCount} Verses",
                      style: TextStyle(
                          color: Color(ColorsApp.black),
                          fontSize: 14,
                          fontWeight: FontWeight.w700),
                    )
                  ],
                ),
              ),
              SizedBox(
                width: 10,
              ),
              Expanded(
                  flex: 5,
                  child: Image.asset(
                    AppAssets.suraLogo,
                  )),
            ],
          ),
        ),
      ),
    );
  }
}
