import 'package:flutter/material.dart';
import 'package:ishibashi/daySearch.dart';
import 'package:ishibashi/keywordSearch.dart';


class SearchConfirmPage extends StatelessWidget {
  
  const SearchConfirmPage({super.key});

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(size.height * 0.08),
        child: AppBar(
          iconTheme: const IconThemeData(color: Colors.greenAccent),
          backgroundColor: Colors.white,
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(20),
                bottomRight: Radius.circular(20)),
          ),
        ),
      ),
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Container(
              width: size.width * 0.9,
              height: size.height * 0.1,
              child: ElevatedButton(
                onPressed: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => const DaySearchPage(),
                    ),
                  );
                },
                child: RichText(
                  text: const TextSpan(
                    children: [
                      WidgetSpan(
                        child: Icon(
                          Icons.calendar_month,
                          color: Colors.black,
                        )
                      ),
                      WidgetSpan(
                          child: Padding(
                        padding: EdgeInsets.all(4),
                      )),
                      TextSpan(
                        text: '営業日で検索',
                        style:
                            TextStyle(color: Color.fromARGB(255, 42, 35, 35)),
                      ),
                    ],
                  ),
                ),
                style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30)), backgroundColor: Colors.greenAccent,
                    fixedSize:
                        Size(size.width * 0.9, size.height * 0.1)),
              ),
            ),
            const Padding(padding: EdgeInsets.all(8)),
            Container(
              width: size.width * 0.9,
              height: size.height * 0.1,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30)), backgroundColor: Colors.greenAccent,
                    fixedSize:
                        Size(size.width * 0.9, size.height * 0.1)),
                onPressed: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => const KeywordSearchPage(),
                    ),
                  );
                },
                child: RichText(
                  text: const TextSpan(
                    children: [
                      WidgetSpan(
                        child: Icon(
                          Icons.search,
                          color: Color.fromARGB(255, 42, 35, 35),
                        ),
                      ),
                      WidgetSpan(
                          child: Padding(
                        padding: EdgeInsets.all(4),
                      )),
                      TextSpan(
                        text: 'キーワード検索',
                        style: TextStyle(
                          color: Color.fromARGB(255, 42, 35, 35),
                        ),
                      ),
                    ],
                  ),
                ),
                
              ),
            ),
            const Padding(padding: EdgeInsets.all(8)),
            /* Container(
              width: size.width * 0.9,
              height: size.height * 0.1,
              child: ElevatedButton(
                onPressed: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => SearchPlacePage(),
                    ),
                  );
                },
                child: RichText(
                  text: TextSpan(
                    children: [
                      WidgetSpan(
                        child: Icon(
                          Icons.location_on_outlined,
                          color: Color.fromARGB(255, 42, 35, 35),
                        ),
                      ),
                      WidgetSpan(
                          child: Padding(
                        padding: EdgeInsets.all(4),
                      )),
                      TextSpan(
                        text: '場所で検索',
                        style: TextStyle(
                          color: Color.fromARGB(255, 42, 35, 35),
                        ),
                      ),
                    ],
                  ),
                ),
                style: OutlinedButton.styleFrom(
                  side: const BorderSide(
                      color: Color.fromARGB(255, 107, 190, 253),
                      style: BorderStyle.solid),
                  backgroundColor: const Color(0xFFC5E4FC),
                  foregroundColor: Color.fromARGB(255, 42, 35, 35),
                  shape: const StadiumBorder(),
                ),
              ),
            ), */
          ],
        ),
      ),
    );
  }
}