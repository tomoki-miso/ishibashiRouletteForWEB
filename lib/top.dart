import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:ishibashi/random.dart';
import 'map.dart';
import 'serch.dart';

class TopPage extends StatelessWidget {
  const TopPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Top")),
      body: Center(
        child: Column(
          children: [
            const Text("石橋ごはんルーレット"),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => RandomPage()),
                );
              },
              child: const Text('ランダムに決める'),
            ),
             ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => MapPage()),
                );
              },
              child: const Text('地図から探す'),
            ),ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => SerchPage()),
                );
              },
              child: const Text('こだわり検索'),
            ),
          ],
        ),
      ),
    );
  }
}
