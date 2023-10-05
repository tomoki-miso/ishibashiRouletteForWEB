import 'package:flutter/material.dart';


class MapPage extends StatelessWidget {
  const MapPage({super.key});


  @override
  Widget build(BuildContext context) {
     var screenSize = MediaQuery.of(context).size;
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(screenSize.height*0.08),
        child: AppBar(
           iconTheme: const IconThemeData(
          color: Colors.greenAccent
          ),
          backgroundColor: Colors.white,
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.only(bottomLeft: Radius.circular(20), bottomRight: Radius.circular(20)),
          ),
        ),
      ),
      body: const Center(
        child: Text("地図用画面"),
      ),
    );
  }
}