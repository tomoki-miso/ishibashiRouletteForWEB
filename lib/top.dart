import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:ishibashi/map.dart';
import 'package:ishibashi/random.dart';
import 'package:ishibashi/searchconfirm.dart';


class TopPage extends StatefulWidget {
  const TopPage({super.key});

  @override
  State<TopPage> createState() => _TopPageState();
}

class _TopPageState extends State<TopPage> {
  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(screenSize.height * 0.08),
        child: AppBar(
          backgroundColor: Colors.white,
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(20),
                bottomRight: Radius.circular(20),),
          ),
        ),
      ),
      body: Center(
        child: Container(
          alignment: Alignment.center,
          padding: const EdgeInsets.only(top: 60),
          child: Column(
            children: [
              Container(
                alignment: Alignment.center,
                height: screenSize.height * 0.2,
                
                child: Image.asset('assets/images/iconKari.png'),
              ),
              const Padding(padding: EdgeInsets.all(6)),
              /*   Container(
                height: _screenSize.height * 0.22,
                child: Scrollbar(
                  thumbVisibility: true,
                  controller:scrollController,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: 5,
                    itemBuilder: (BuildContext context, int index) {
                      return Container(
                        child: TextButton(
                          child: Text(
                            "広告",
                            style: TextStyle(fontSize: 20, color: Colors.black),
                          ),
                          onPressed: () {},
                        ),
                        margin:
                            EdgeInsets.symmetric(vertical: 0, horizontal: 4),
                        width: _screenSize.width * 0.8,
                        color: colorList[index % colorList.length],
                      );
                      
                    },
                    controller:scrollController,
                  ),
                  
                ),
              ), */
              const Padding(padding: EdgeInsets.all(10)),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30),), backgroundColor: Colors.greenAccent,
                    fixedSize:
                        Size(screenSize.width * 0.9, screenSize.height * 0.1),),
                onPressed: () async {
                  await Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const RandomPage()),
                  );
                },
                child: RichText(
                  text: const TextSpan(
                    style: TextStyle(
                        color: Color.fromARGB(255, 62, 61, 61), fontSize: 16,),
                    children: [
                      WidgetSpan(
                        child: FaIcon(
                          FontAwesomeIcons.shop,
                          color: Color.fromARGB(194, 255, 2, 2),
                        ),
                      ),
                      WidgetSpan(child: Padding(padding: EdgeInsets.all(4))),
                      TextSpan(
                        text: 'ランダムにきめる',
                        style: TextStyle(color: Colors.black),
                      ),
                    ],
                  ),
                ),
              ),
              const Padding(padding: EdgeInsets.all(6)),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30),), backgroundColor: Colors.greenAccent,
                    fixedSize:
                        Size(screenSize.width * 0.9, screenSize.height * 0.1),),
                onPressed: () async {
                  await Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const MapPage()),
                  );
                },
                child: RichText(
                  text: const TextSpan(
                    style: TextStyle(
                        color: Color.fromARGB(255, 62, 61, 61), fontSize: 16,),
                    children: [
                      WidgetSpan(
                        child: FaIcon(
                          FontAwesomeIcons.mapLocationDot,
                          color: Color.fromARGB(194, 255, 2, 2),
                        ),
                      ),
                      WidgetSpan(child: Padding(padding: EdgeInsets.all(4))),
                      TextSpan(
                        text: '地図から探す',
                        style: TextStyle(color: Colors.black),
                      ),
                    ],
                  ),
                ),
              ),
              const Padding(padding: EdgeInsets.all(6)),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30),), backgroundColor: Colors.greenAccent,
                    fixedSize:
                        Size(screenSize.width * 0.9, screenSize.height * 0.1),),
                onPressed: () async {
                  await Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const SearchConfirmPage()),
                  );
                },
                child: RichText(
                  text: const TextSpan(
                    style: TextStyle(
                        color: Color.fromARGB(255, 62, 61, 61), fontSize: 16,),
                    children: [
                      WidgetSpan(
                        child: FaIcon(
                          FontAwesomeIcons.magnifyingGlass,
                          color: Color.fromARGB(194, 255, 2, 2),
                        ),
                      ),
                      WidgetSpan(child: Padding(padding: EdgeInsets.all(4))),
                      TextSpan(
                        text: '検索',
                        style: TextStyle(color: Colors.black),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

List<Color> colorList = [Colors.cyan, Colors.deepOrange, Colors.indigo];
