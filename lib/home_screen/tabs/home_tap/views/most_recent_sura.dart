import 'package:flutter/material.dart';
import 'package:islamy/home_screen/models/sura_model.dart';
import 'package:islamy/home_screen/widgets/sura_card.dart';

// ignore: must_be_immutable
class MostRecentSura extends StatelessWidget {
  const MostRecentSura({super.key});
  @override
  Widget build(BuildContext context) {
    return SuraModel.suraInfo.isNotEmpty? SizedBox(
      height: MediaQuery.of(context).size.width * 0.5,
      child: ListView.builder(
          scrollDirection: Axis.horizontal,
          //padding: const EdgeInsets.all(8),
          itemCount: SuraModel.suraInfo.length,
          itemBuilder: (BuildContext context, int index) {
            return SuraCard(
              sura: SuraModel.suraInfo[index],
            );
          }),
    ):Container();
  }
}
