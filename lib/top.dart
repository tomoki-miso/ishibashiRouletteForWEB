import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:english_words/english_words.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'random.dart';
import 'package:ishibashi/random.dart';
import 'map.dart';
import 'search.dart';

class TopPage extends StatefulWidget {
  const TopPage({Key? key}) : super(key: key);

  @override
  State<TopPage> createState() => _TopPageState();
}

class _TopPageState extends State<TopPage> {
  @override
  Widget build(BuildContext context) {
    var _screenSize = MediaQuery.of(context).size;
    final scrollController =  ScrollController(
                      initialScrollOffset:
                          2 * (MediaQuery.of(context).size.width * 0.8 + -10));
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(_screenSize.height * 0.08),
        child: AppBar(
          backgroundColor: Colors.white,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(20),
                bottomRight: Radius.circular(20)),
          ),
        ),
      ),
      body: Center(
        child: Container(
          padding: EdgeInsets.only(top: 20),
          child: Column(
            children: [
              Container(
                alignment: Alignment.center,
                height: _screenSize.height * 0.12,
                width: _screenSize.width * 0.6,
                color: Colors.amber,
                child: Text("ロゴ配置"),
              ),
              Padding(padding: EdgeInsets.all(6)),
              Container(
                height: _screenSize.height * 0.22,
                child: Scrollbar(
                  isAlwaysShown: true,
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
              ),
              Padding(padding: EdgeInsets.all(10)),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30)),
                    fixedSize:
                        Size(_screenSize.width * 0.9, _screenSize.height * 0.1),
                    primary: Colors.greenAccent),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => RandomPage()),
                  );
                },
                child: RichText(
                  text: TextSpan(
                    style: TextStyle(
                        color: Color.fromARGB(255, 62, 61, 61), fontSize: 16),
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
              Padding(padding: EdgeInsets.all(6)),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30)),
                    fixedSize:
                        Size(_screenSize.width * 0.9, _screenSize.height * 0.1),
                    primary: Colors.greenAccent),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => MapPage()),
                  );
                },
                child: RichText(
                  text: TextSpan(
                    style: TextStyle(
                        color: Color.fromARGB(255, 62, 61, 61), fontSize: 16),
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
              Padding(padding: EdgeInsets.all(6)),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30)),
                    fixedSize:
                        Size(_screenSize.width * 0.9, _screenSize.height * 0.1),
                    primary: Colors.greenAccent),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => SearchPage()),
                  );
                },
                child: RichText(
                  text: TextSpan(
                    style: TextStyle(
                        color: Color.fromARGB(255, 62, 61, 61), fontSize: 16),
                    children: [
                      WidgetSpan(
                        child: FaIcon(
                          FontAwesomeIcons.magnifyingGlass,
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
            ],
          ),
        ),
      ),
    );
  }
}

List<Color> colorList = [Colors.cyan, Colors.deepOrange, Colors.indigo];
