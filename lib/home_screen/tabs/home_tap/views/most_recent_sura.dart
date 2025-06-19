import 'package:flutter/material.dart';
import 'package:islamy/home_screen/models/sura_model.dart';
import 'package:islamy/home_screen/widgets/sura_card.dart';

// ignore: must_be_immutable
class MostRecentSura extends StatelessWidget {
  MostRecentSura({super.key});

  // List<Map> mostRecent = [
  //   {"sura_eng": "Al-Anbiya", "sura_arb": "الأنبياء", "pageCount": 200},
  //   {
  //     "sura_eng": "Al-Fatiha",
  //     "sura_arb": "الفاتحة",
  //     "pageCount": 150,
  //   },
  //   {
  //     "sura_eng": "Al-Baqarah",
  //     "sura_arb": " البقرة",
  //     "pageCount": 120,
  //   },
  //   {
  //     "sura_eng": "Aal-E-Imran",
  //     "sura_arb": "الرحمن",
  //     "pageCount": 100,
  //   }
  // ];

  List<SuraModel> sura_info = [SuraModel(enName:"Al-Anbiya",arName: "الأنبياء",versesCount: 112 ),
  SuraModel(enName:"Al-Fatiha",arName: "الفاتحة",versesCount: 120 ),
  SuraModel(enName:"Al-Baqarah",arName: "البقرة",versesCount: 140 ),
  SuraModel(enName:"Aal-E-Imran",arName: "الرحمن",versesCount: 160 )
  
  ];

  @override
  Widget build(BuildContext context) {
    return sura_info.isNotEmpty? SizedBox(
      height: MediaQuery.of(context).size.width * 0.5,
      child: ListView.builder(
          scrollDirection: Axis.horizontal,
          //padding: const EdgeInsets.all(8),
          itemCount: sura_info.length,
          itemBuilder: (BuildContext context, int index) {
            return SuraCard(
              sura: sura_info[index],
            );
          }),
    ):Container();
  }
}
