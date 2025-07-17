import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:islamy/home_screen/tabs/book_tap/hadeeth_details.dart';
import 'package:islamy/home_screen/tabs/book_tap/widgets/hadeeth_card.dart';
import 'package:islamy/services/app_assets.dart';
import 'package:islamy/services/background_gradient.dart';

bool loadContentBook = true;
bool successBook = false, loadingBook = false, errorBook = false;

List<String> hadeethDet = [];
List<String> hadeethTitle = [];

class BookTab extends StatefulWidget {
  const BookTab({super.key});

  @override
  State<BookTab> createState() => _BookTabState();
}

class _BookTabState extends State<BookTab> {
  @override
  void initState() {
    if (hadeethDet.isEmpty) {
      loadAndRefresh();
    }
    super.initState();
  }

  @override


  Widget build(BuildContext context) {
    return BackgroundGradient(
        imag: AppAssets.hadeethTabBg,
        fit: BoxFit.fitWidth,
        alignment: Alignment.topCenter,
        child: PageView.builder(
            controller: PageController(viewportFraction: 0.7, initialPage: 0),
            padEnds: true,
            scrollDirection: Axis.horizontal,
            itemCount: hadeethDet.length,
            itemBuilder: (context, index) => GestureDetector(
                  onTap: () {
                    Navigator.of(context)
                        .pushNamed(HadeethDetails.routeName, arguments: index+1);
                    setState(() {});
                  },
                  child: HadeethCard(
                      hadeeth: hadeethDet[index],
                      hadeethTitle: hadeethTitle[index]),
                )));
  }
    void loadAndRefresh() async{
    await  loadHadeethContentBook();

     setState(() {});
  }
}

Future<void> loadHadeethContentBook() async {
  loadingBook = true;
  List<String> lines = [];
  String? fileContent;
  await Future.delayed(Duration(seconds: 1));

  for (int i = 0; i < 50; i++) {
    try {
      fileContent =
          await rootBundle.loadString("assets/files/Hadeeth/h${i + 1}.txt");

      lines = fileContent.trim().split("\n");

      fileContent = fileContent.replaceRange(0, lines[0].length, "");

      hadeethDet.add(fileContent);
      hadeethTitle.add(lines[0]);
      successBook = true;
      loadingBook = false;
    } catch (e) {
      errorBook = true;
      loadingBook = false;
    }
  }
}
