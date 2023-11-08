import 'package:flutter/material.dart';
import 'package:ishibashi/screens/top/components/top_appbar.dart';
import 'package:ishibashi/screens/top/components/top_drawer_part.dart';
import 'package:ishibashi/screens/top/components/top_map_big_select_button.dart';
import 'package:ishibashi/screens/top/components/top_random_big_select_button.dart';
import 'package:ishibashi/screens/top/components/top_search_big_select_button.dart';

class TopPage extends StatefulWidget {
  const TopPage({super.key});

  @override
  State<TopPage> createState() => _TopPageState();
}

class _TopPageState extends State<TopPage> {
  @override
  Widget build(BuildContext context) => const Scaffold(
        appBar: TopAppBar(),
        endDrawer: TopDrawerPart(),
        body: Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
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

              RandomBigSelectbutton(),
              Padding(padding: EdgeInsets.all(5)),
              MapBigSelectbutton(),
              Padding(padding: EdgeInsets.all(5)),
              SearchBigSelectbutton(),
            ],
          ),
        ),
      );
}
