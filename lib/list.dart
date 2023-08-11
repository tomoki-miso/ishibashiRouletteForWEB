import 'package:flutter/material.dart';

class ListPage extends StatelessWidget {
   

  @override
  Widget build(BuildContext context) {
    var _screenSize = MediaQuery.of(context).size;
    return  Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(_screenSize.height * 0.08),
        child: AppBar(
          backgroundColor: Colors.white,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(20),
                bottomRight: Radius.circular(20)),
          ),
        ),
      ),
      body: Center(
        child: Text("リスト用画面"),
      ),
    );
  }
}