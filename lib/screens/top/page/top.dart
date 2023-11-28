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
              RandomBigSelectbutton(),
              Padding(padding: EdgeInsets.all(3)),
              MapBigSelectbutton(),
              Padding(padding: EdgeInsets.all(3)),
              SearchBigSelectbutton(),
            ],
          ),
        ),
      );
}
