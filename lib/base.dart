import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:ishibashi/features/coupon.dart';
import 'package:ishibashi/features/list/page/list.dart';
import 'package:ishibashi/features/map/page/map.dart';
import 'package:ishibashi/features/random/page/random.dart';
import 'package:ishibashi/features/top/page/top.dart';
import 'package:persistent_bottom_nav_bar_v2/persistent-tab-view.dart';

class BasePage extends StatelessWidget {
  const BasePage({super.key});

  @override
  Widget build(
    BuildContext context,
  ) {
    final pages = [
      const ListPage(),
      const RandomPage(),
      const TopPage(),
      const CouponPage(),
      const MapPage(),
    ];

    return Scaffold(
      // final listIcon =
      body: PersistentTabView(
        context,
        controller: PersistentTabController(initialIndex: 2),
        screens: pages,
        navBarStyle: NavBarStyle.simple,
        items: [
          PersistentBottomNavBarItem(
            icon: const FaIcon(
              FontAwesomeIcons.listUl,
            ),
            title: 'リスト',
            activeColorPrimary: const Color.fromARGB(124, 252, 0, 0),
            inactiveColorPrimary: Theme.of(context).disabledColor,
          ),
          PersistentBottomNavBarItem(
            icon: const FaIcon(
              FontAwesomeIcons.shuffle,
            ),
            title: 'ランダム',
            activeColorPrimary: const Color.fromARGB(124, 252, 0, 0),
            inactiveColorPrimary: Theme.of(context).disabledColor,
          ),
          PersistentBottomNavBarItem(
            icon: const FaIcon(
              FontAwesomeIcons.house,
            ),
            title: 'トップ',
            activeColorPrimary: const Color.fromARGB(124, 252, 0, 0),
            inactiveColorPrimary: Theme.of(context).disabledColor,
          ),
          PersistentBottomNavBarItem(
            icon: const FaIcon(
              FontAwesomeIcons.ticket,
            ),
            title: 'クーポン',
            activeColorPrimary: const Color.fromARGB(124, 252, 0, 0),
            inactiveColorPrimary: Theme.of(context).disabledColor,
          ),
          PersistentBottomNavBarItem(
            icon: const FaIcon(
              FontAwesomeIcons.mapLocationDot,
            ),
            title: 'マップ',
            activeColorPrimary: const Color.fromARGB(124, 252, 0, 0),
            inactiveColorPrimary: Theme.of(context).disabledColor,
          ),
        ],
      ),
    );
  }
}
