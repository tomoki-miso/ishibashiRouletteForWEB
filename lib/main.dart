import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:ishibashi/firebase_options.dart';
import 'package:ishibashi/screens/info.dart';
import 'package:ishibashi/screens/list.dart';
import 'package:ishibashi/screens/map.dart';
import 'package:ishibashi/screens/random.dart';
import 'package:ishibashi/screens/top.dart';
import 'package:persistent_bottom_nav_bar_v2/persistent-tab-view.dart';


final storeInfoProvider = FutureProvider.autoDispose((ref) => FirebaseFirestore.instance.collection('stores').snapshots());


void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);

  runApp(
    // Riverpodでデータを受け渡しできる状態にする
    const ProviderScope(
      child: MyApp(),
    ),
  );
}

class MyApp extends ConsumerWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) => MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const BasePage(),
    );
}

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
      const MapPage(),
      const InfoPage(),
    ];

    return Scaffold(
      body: PersistentTabView(
        context,
        controller: PersistentTabController(initialIndex: 2),
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
            activeColorPrimary: const Color.fromARGB(124, 252, 0, 0),
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
            activeColorPrimary: const Color.fromARGB(124, 252, 0, 0),
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
            activeColorPrimary: const Color.fromARGB(124, 252, 0, 0),
            inactiveColorPrimary: Theme.of(context).disabledColor,
          ),
          PersistentBottomNavBarItem(
            icon: const FaIcon(FontAwesomeIcons.mapLocationDot),
            inactiveIcon: const FaIcon(
                // text snippet, article, description, restaurant
                FontAwesomeIcons.mapLocationDot,),
            title: 'マップ',
            activeColorPrimary: const Color.fromARGB(124, 252, 0, 0),
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
            activeColorPrimary: const Color.fromARGB(124, 252, 0, 0),
            inactiveColorPrimary: Theme.of(context).disabledColor,
          ),
        ],
      ),
    );
  }
}
