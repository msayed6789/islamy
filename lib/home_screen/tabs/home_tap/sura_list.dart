import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:islamy/home_screen/models/sura_model.dart';
import 'package:islamy/home_screen/tabs/home_tap/sura_details.dart';
import 'package:islamy/services/app_assets.dart';

class SuraList extends StatelessWidget {
  final SuraModel sura_info;
  final int index;
  SuraList({super.key, required this.sura_info, required this.index});

  @override
  Widget build(BuildContext context) {
    return ListTile(
        onTap: () {
          Navigator.of(context).pushNamed(SuraDetails.routeName,arguments: sura_info );
        },
        dense: true,
        contentPadding: EdgeInsets.zero,
        minVerticalPadding: 0,
        leading: SizedBox(
          width: MediaQuery.of(context).size.width * 0.15,
          height: MediaQuery.of(context).size.width * 0.15,
          child: Stack(
            alignment: Alignment.centerLeft,
            children: [
              SvgPicture.asset(
                AppAssets.suraListIcon,
                width: double.infinity,
                fit: BoxFit.contain,
              ),
              Center(
                child: Text(
                  "${index + 1}",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 12,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ),
            ],
          ),
        ),
        title: Text(
          sura_info.enName,
          style: TextStyle(
              color: Colors.white, fontSize: 20, fontWeight: FontWeight.w700),
        ),
        subtitle: Text("${sura_info.versesCount} Verses",
            style: TextStyle(
                color: Colors.white,
                fontSize: 14,
                fontWeight: FontWeight.w700)),
        trailing: Text(sura_info.arName,
            style: TextStyle(
                color: Colors.white,
                fontSize: 20,
                fontWeight: FontWeight.w700)));
  }
}
