import 'package:flutter/material.dart';
import 'package:islamy/home_screen/models/sura_model.dart';
import 'package:islamy/home_screen/widgets/sura_card.dart';

// ignore: must_be_immutable
class MostRecentSura extends StatelessWidget {
  final List<SuraModel>? mostRecent;
  final Function (SuraModel,int) mostRecentAdd;
  const MostRecentSura({super.key, required this.mostRecent, required this.mostRecentAdd});
  @override
  Widget build(BuildContext context) {
    return SuraModel.suraInfo.isNotEmpty
        ? SizedBox(
            height: MediaQuery.of(context).size.width * 0.5,
            child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: mostRecent?.length,
                itemBuilder: (BuildContext context, int index) {
                  return SuraCard(
                    sura: mostRecent![index],
                    mostRecentAdd: mostRecentAdd,
                  );
                }),
          )
        : Container();
  }
}
