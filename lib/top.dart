import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class TopPage extends StatelessWidget {
  const TopPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Top")),
      body: Center(
        child: Column(
          children: [
            Text("石橋ごはんルーレット"),
            ElevatedButton(
              onPressed: () {
                Navigator.pushReplacementNamed(context, '/random');
              },
              child: Text('ランダムに決める'),
            )
          ],
        ),
      ),
    );
  }
}
