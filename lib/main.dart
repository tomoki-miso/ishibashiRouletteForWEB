import 'package:flutter/material.dart';
import 'package:persistent_bottom_nav_bar_v2/persistent-tab-view.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'top.dart';
import 'map.dart';
import 'info.dart';
import 'list.dart';
import 'search.dart';
import 'random.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const BasePage(),
    );
  }
}

class BasePage extends StatelessWidget {
  const BasePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final pages = [
      ListPage(),
      RandomPage(),
      TopPage(),
      MapPage(),
      InfoPage(),
    ];

    return Scaffold(
      body: PersistentTabView(
        context,
        screens: pages,
        navBarStyle: NavBarStyle.simple,
        items: [
          PersistentBottomNavBarItem(
            icon: const Icon(
              Icons.list,
            ),
            inactiveIcon: const Icon(
              Icons.list,
            ),
            title: 'リスト',
            activeColorPrimary: Color.fromARGB(124, 252, 0, 0),
            inactiveColorPrimary: Theme.of(context).disabledColor,
          ),
          PersistentBottomNavBarItem(
            icon: const FaIcon(
              FontAwesomeIcons.shop,
            ),
            inactiveIcon: const FaIcon(
              FontAwesomeIcons.shop,
            ),
            title: 'ランダム',
           activeColorPrimary: Color.fromARGB(124, 252, 0, 0),
            inactiveColorPrimary: Theme.of(context).disabledColor,
          ),
          PersistentBottomNavBarItem(
            icon: const Icon(
              Icons.star,
            ),
            inactiveIcon: const Icon(
              // text snippet, article, description, restaurant
              Icons.star_border,
            ),
            title: 'トップ',
              activeColorPrimary: Color.fromARGB(124, 252, 0, 0),
            inactiveColorPrimary: Theme.of(context).disabledColor,
          ),
          PersistentBottomNavBarItem(
            icon: const FaIcon(FontAwesomeIcons.mapLocationDot),
            inactiveIcon: const FaIcon(
                // text snippet, article, description, restaurant
                FontAwesomeIcons.mapLocationDot),
            title: 'マップ',
            activeColorPrimary: Color.fromARGB(124, 252, 0, 0),
            inactiveColorPrimary: Theme.of(context).disabledColor,
          ),
          PersistentBottomNavBarItem(
            icon: const Icon(
              Icons.info,
            ),
            inactiveIcon: const Icon(
              // text snippet, article, description, restaurant
              Icons.info,
            ),
            title: '情報',
            activeColorPrimary: Color.fromARGB(124, 252, 0, 0),
            inactiveColorPrimary: Theme.of(context).disabledColor,
          ),
        ],
      ),
    );
  }
}
