import 'package:flutter/material.dart';
import 'package:islamy/home_screen/tabs/home_tap/views/most_recent_sura.dart';
import 'package:islamy/home_screen/tabs/home_tap/views/sura_list_view.dart';
import 'package:islamy/home_screen/widgets/custom_text_field.dart';
import 'package:islamy/services/app_assets.dart';
import 'package:islamy/services/background_gradient.dart';

class HomeTab extends StatelessWidget {
  HomeTab({super.key});
  static String routeName = "HomeTab";
  @override
  Widget build(BuildContext context) {
    return BackgroundGradient(
      imag: AppAssets.homeTabBg,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.22,
            ),
            CustomTextField(
              hintText: "Sura Name",
            ),
            SizedBox(
              height: 10,
            ),
            Expanded(
              child: ListView(
                children: [
                  Text(
                    "Most Recently",
                    style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w700,
                        color: Colors.white),
                  ),
                  MostRecentSura(),
                  SuraListView(),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
