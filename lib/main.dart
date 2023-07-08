import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:ishibashi/random.dart';
import 'package:ishibashi/top.dart';

import 'map.dart';
import 'info.dart';
import 'list.dart';
import 'serch.dart';
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
      routes: {
        '/random': (context) =>RandomPage(),
        '/map': (context) => MapPage(),
        '/list': (context) => ListPage(),
        '/page2': (context) => SerchPage(),
      },
      home: const MyStatefulWidget(),
    );
  }
}

class MyStatefulWidget extends StatefulWidget {
  const MyStatefulWidget({Key? key}) : super(key: key);

  @override
  State<MyStatefulWidget> createState() => _MyStatefulWidgetState();
}

class _MyStatefulWidgetState extends State<MyStatefulWidget> {
  
  static  List<StatelessWidget> _screens = [
    TopPage(),
    MapPage(),
    InfoPage(),
  ];

  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: _screens[_selectedIndex],
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: _selectedIndex,
          onTap: _onItemTapped,
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(icon: Icon(Icons.list), label: 'List'),
            BottomNavigationBarItem(icon: FaIcon(FontAwesomeIcons.mapLocationDot), label: 'Map'),
            BottomNavigationBarItem(
                icon: FaIcon(FontAwesomeIcons.circleInfo), label: 'Information'),
          ],
          type: BottomNavigationBarType.fixed,
        ));
  }
}
