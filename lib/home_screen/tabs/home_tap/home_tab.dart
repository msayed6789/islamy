import 'package:flutter/material.dart';
import 'package:islamy/home_screen/models/sura_model.dart';
import 'package:islamy/home_screen/tabs/home_tap/views/most_recent_sura.dart';
import 'package:islamy/home_screen/tabs/home_tap/views/sura_list_view.dart';
import 'package:islamy/home_screen/widgets/custom_text_field.dart';
import 'package:islamy/services/app_assets.dart';
import 'package:islamy/services/background_gradient.dart';
import 'package:shared_preferences/shared_preferences.dart';

List<SuraModel> mostRecent = [];
List<String> mostRecentCashIndex = [];

class HomeTab extends StatefulWidget {
  const HomeTab({super.key});
  static String routeName = "HomeTab";

  @override
  State<HomeTab> createState() => _HomeTabState();
}

class _HomeTabState extends State<HomeTab> {
  TextEditingController controller = TextEditingController();

  @override
  initState() {
    loadData();
    super.initState();
  }

  Future<void> loadData() async {
    try {
      final SharedPreferences pref = await SharedPreferences.getInstance();
      mostRecentCashIndex = (pref.getStringList("mostRecentCash")) ?? [];

      List<SuraModel> sura = SuraModel.suraInfo;
      for (int i = mostRecentCashIndex.length - 1; i >= 0; i--) {
        mostRecent.insert(0, sura[int.parse(mostRecentCashIndex[i])]);
      }
      setState(() {
      });
      // ignore: empty_catches
    } catch (e) {}
  }

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
                  if (mostRecent.isNotEmpty)
                    Text(
                      "Most Recently",
                      style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w700,
                          color: Colors.white),
                    ),
                  if (mostRecent.isNotEmpty)
                    MostRecentSura(
                      mostRecent: mostRecent,
                    mostRecentAdd: mostRecentAdd,

                    ),
                  SuraListView(
                    search: controller.text.trim(),
                    mostRecentAdd: mostRecentAdd,
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  void mostRecentAdd(SuraModel sura, int indexIn) {
    if (mostRecent.any((element) => sura.arName == element.arName) == false) {
      mostRecent.insert(0, sura);
      mostRecentCashIndex.insert(0, indexIn.toString());
      SharedPreferences.getInstance().then((pref) {
        pref.setStringList("mostRecentCash", mostRecentCashIndex);
      });
    } else {
      int index =
          mostRecent.indexWhere((element) => element.arName == sura.arName);
      mostRecent.removeAt(index);
      mostRecent.insert(0, sura);

      mostRecentCashIndex.removeAt(index);
      mostRecentCashIndex.insert(0, indexIn.toString());

      SharedPreferences.getInstance().then((pref) {
        pref.setStringList("mostRecentCash", mostRecentCashIndex);
    setState(() {});
      });
    }

  }
}
