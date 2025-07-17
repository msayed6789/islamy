import 'package:flutter/material.dart';
import 'package:islamy/services/app_assets.dart';
import 'package:islamy/services/color.dart';

class HadeethCard extends StatelessWidget {
  final String hadeeth;
  final String hadeethTitle;
  const HadeethCard({super.key, required this.hadeeth, required this.hadeethTitle});

  @override
  Widget build(BuildContext context) {
  
    return Card(
      color: Color(ColorsApp.hadeethCardBg),
      margin: EdgeInsets.fromLTRB(
          MediaQuery.of(context).size.width * (0.0511 / 2),
          MediaQuery.of(context).size.height * (0.23),
          MediaQuery.of(context).size.width * (0.0511 / 2),
          MediaQuery.of(context).size.height * (0.021)),
      child: Stack(
        children: [
          Positioned(
              top: MediaQuery.of(context).size.height * 0.166,
              bottom: MediaQuery.of(context).size.height * 0.168,
              right: MediaQuery.of(context).size.width * 0.0761,
              left: MediaQuery.of(context).size.width * 0.0773,
              child: Image.asset(
                AppAssets.hadeethCardBg,
                fit: BoxFit.fill,
              )),
          Positioned(
            left: 0,
            right: 0,
            bottom: 0,
            child: Image.asset(
              AppAssets.hadeethCardFotter,
              fit: BoxFit.fitWidth,
            ),
          ),
          Column(children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(10,10,10,0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Image.asset(
                    AppAssets.suraDetailsLeft,
                    width: MediaQuery.of(context).size.width * 0.22,
                    height: MediaQuery.of(context).size.height * 0.1,
                    color: Colors.black,
                  ),
                  
                  Image.asset(
                    AppAssets.suraDetailsRight,
                    width: MediaQuery.of(context).size.width * 0.22,
                    height: MediaQuery.of(context).size.height * 0.1,
                    color: Colors.black,
                  ),
                ],
              ),
            ),
            Text(
                    hadeethTitle,
                    textAlign: TextAlign.center,
                    textDirection: TextDirection.rtl,
                    style: TextStyle(
                      fontSize: 24,
                      color: Color(ColorsApp.black),
                      fontWeight: FontWeight.w700,
                    ),
                  ),
            Expanded(
              child: SingleChildScrollView(
                child: Padding(
                  padding: EdgeInsets.symmetric(
                      horizontal:
                          (MediaQuery.of(context).size.width * 0.063 / 2)),
                  child: Text(
                    '''  $hadeeth 
                              ''',
                    textDirection: TextDirection.rtl,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 16,
                      color: Color(ColorsApp.black),
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.09,
            ),
          ])
        ],
      ),
    );
  }
}
