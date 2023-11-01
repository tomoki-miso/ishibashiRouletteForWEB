import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:ishibashi/components/big_select_button.dart';
import 'package:ishibashi/screens/map.dart';
import 'package:ishibashi/screens/random/components/page/random.dart';
import 'package:ishibashi/screens/search_confirm.dart';

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
              bottomRight: Radius.circular(20),
            ),
          ),
        ),
      ),
      body: Center(
        child: Container(
          alignment: Alignment.center,
          child: Column(
            children: [
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

              BigSelectButton(
                onTap: () async {
                  await Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const RandomPage()),
                  );
                },
                text: 'ランダムに決める',
                iconChild: const Icon(
                  Icons.shuffle_outlined,
                  size: 100,
                  color: Colors.white,
                ),
              ),
              BigSelectButton(
                onTap: () async {
                  await Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const MapPage()),
                  );
                },
                text: '地図から探す',
                iconChild: const Icon(
                  Icons.shuffle_outlined,
                  size: 100,
                  color: Colors.white,
                ),
              ),
              BigSelectButton(
                onTap: () async {
                  await Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const SearchConfirmPage()),
                  );
                },
                text: 'こだわり検索',
                iconChild: const Icon(
                  Icons.shuffle_outlined,
                  size: 100,
                  color: Colors.white,
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
