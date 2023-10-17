import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class MapPage extends StatefulWidget {
  @override
  _MapPageState createState() => _MapPageState();
}

class _MapPageState extends State<MapPage> {
  late GoogleMapController mapController;
  Set<Marker> markers = {}; // マーカーのセットを初期化

  final LatLng _center = const LatLng(34.807939716664094, 135.44532486726357);

  // Firebaseからデータを取得する関数
  Future<List<Map<String, dynamic>>> _fetchDataFromFirestore() async {
    List<Map<String, dynamic>> dataList = [];
    QuerySnapshot snapshot =
        await FirebaseFirestore.instance.collection('stores').get();

    snapshot.docs.forEach((doc) {
      dataList.add(doc.data() as Map<String, dynamic>);
    });

    return dataList;
  }

  Future<void> _createMarkersFromFirebaseData() async {
    try {
      List<Map<String, dynamic>> firebaseData = await _fetchDataFromFirestore();
      Set<Marker> markerSet = {};

      for (var data in firebaseData) {
        print('Latitude: ${data['lat']}, Longitude: ${data['long']}');
        try {
          // データの型を適切に変換
          double lat = double.parse(data['lat']);
          double long = double.parse(data['long']);
          String name = data['name'];

          // マーカーの作成と追加
          markerSet.add(
            Marker(
              markerId: MarkerId(name), // 一意のIDを指定
              position: LatLng(lat, long),
              infoWindow: InfoWindow(
                title: name, // マーカーのタイトル
              ),
            ),
          );
        } catch (e) {
          print('データの変換エラー: $e');
        }
      }

      setState(() {
        markers = markerSet; // マーカーセットを更新
      });

      // マーカーが正しくセットされたかどうかをログで確認
      print('Markers: $markers');
    } catch (e) {
      print('エラーが発生しました: $e');
    }
  }

  @override
  void initState() {
    super.initState();
    _createMarkersFromFirebaseData();
  }

  void _onMapCreated(GoogleMapController controller) {
    mapController = controller;
  }

  @override
  Widget build(BuildContext context) {
    var _screenSize = MediaQuery.of(context).size;
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(_screenSize.height * 0.08),
        child: AppBar(
          iconTheme: IconThemeData(color: Colors.greenAccent),
          backgroundColor: Colors.white,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(20),
                bottomRight: Radius.circular(20)),
          ),
        ),
      ),
      body: GoogleMap(
        onMapCreated: _onMapCreated,
        initialCameraPosition: CameraPosition(
          target: _center,
          zoom: 18.0,
        ),
        markers: markers,
      ),
    );
  }
}