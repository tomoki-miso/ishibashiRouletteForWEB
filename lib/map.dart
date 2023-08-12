import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class MapPage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
     var _screenSize = MediaQuery.of(context).size;
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(_screenSize.height*0.08),
        child: AppBar(
           iconTheme: IconThemeData(
          color: Colors.greenAccent
          ),
          backgroundColor: Colors.white,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.only(bottomLeft: Radius.circular(20), bottomRight: Radius.circular(20)),
          ),
        ),
      ),
      body: Center(
        child: Text("地図用画面"),
      ),
    );
  }
}