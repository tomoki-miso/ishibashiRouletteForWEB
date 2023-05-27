import 'package:flutter/material.dart';

class ListPage extends StatelessWidget {
  
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(title: Text("List")),
      body: Center(
        child: Text("リスト用画面"),
      ),
    );
  }
}