import 'package:flutter/material.dart';
import 'package:islamy/home_screen/tabs/home_tap/views/most_recent_sura.dart';
import 'package:islamy/home_screen/tabs/home_tap/views/sura_list_view.dart';
import 'package:islamy/home_screen/widgets/custom_text_field.dart';
import 'package:islamy/services/app_assets.dart';
import 'package:islamy/services/background_gradient.dart';

class HomeTab extends StatefulWidget {
  const HomeTab({super.key});
  static String routeName = "HomeTab";

  @override
  State<HomeTab> createState() => _HomeTabState();
}

class _HomeTabState extends State<HomeTab> {
  TextEditingController controller = TextEditingController();
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
              controller: controller,
              onChanged: (p0) {
                setState(() {});
              },
              suffix: InkWell(
                onTap: () {
                  controller.clear();
                  FocusScope.of(context).unfocus();
    
                  setState(() {});
                },
                child: Icon(
                  Icons.close_outlined,
                  color: Colors.amber,
                  size: 20,
                ),
              ),
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
                  SuraListView(search: controller.text.trim()),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
