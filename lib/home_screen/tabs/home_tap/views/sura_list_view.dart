import 'package:flutter/material.dart';
import 'package:islamy/home_screen/models/sura_model.dart';
import 'package:islamy/home_screen/tabs/home_tap/sura_list.dart';

// ignore: must_be_immutable
class SuraListView extends StatelessWidget {
  final String? search;
  final Function(SuraModel,int)? mostRecentAdd;
  const SuraListView({
    super.key,
    required this.search,
    required this.mostRecentAdd,
  });

  @override
  Widget build(BuildContext context) {
    List<SuraModel> filterSures = (SuraModel.suraInfo.where((element) =>
        element.enName.toLowerCase().contains((search ?? "").toLowerCase()) ||
        element.arName.contains(search ?? ""))).toList();
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text("Suras List",
            style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w700,
                color: Colors.white)),
        ListView.separated(
            physics: NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            scrollDirection: Axis.vertical,
            itemCount: filterSures.length,
            itemBuilder: (context, index) => SuraList(
                suraInfo: filterSures[index],
                index: index,
                mostRecentAdd: mostRecentAdd
                ),
            separatorBuilder: (BuildContext context, int index) => Divider(
                  color: Colors.white,
                  endIndent: MediaQuery.of(context).size.width * 0.15,
                  indent: MediaQuery.of(context).size.width * 0.15,
                ))
      ],
    );
  }
}
