// ignore_for_file: empty_catches

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class MapPage extends StatefulWidget {
  const MapPage({super.key});

  @override
  _MapPageState createState() => _MapPageState();
}

class _MapPageState extends State<MapPage> {
  late GoogleMapController mapController;
  Set<Marker> markers = {}; // マーカーのセットを初期化

  final LatLng _center = const LatLng(34.807939716664094, 135.44532486726357);

  // Firebaseからデータを取得する関数
  Future<List<Map<String, dynamic>>> _fetchDataFromFirestore() async {
    final List<Map<String, dynamic>> dataList = [];
    final QuerySnapshot snapshot =
        await FirebaseFirestore.instance.collection('stores').get();

    for (final doc in snapshot.docs) {
      dataList.add(doc.data()! as Map<String, dynamic>);
    }

    return dataList;
  }

  Future<void> _createMarkersFromFirebaseData() async {
    final List<Map<String, dynamic>> firebaseData =
        await _fetchDataFromFirestore();
    final Set<Marker> markerSet = {};

    for (final data in firebaseData) {
      // ignore: duplicate_ignore
      // データの型を適切に変換
      final double lat = double.parse(data['lat']);
      final double long = double.parse(data['long']);
      final String name = data['name'];

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
    }

    setState(() {
      markers = markerSet; // マーカーセットを更新
    });

    // マーカーが正しくセットされたかどうかをログで確認
  }

  @override
  Future<void> initState() async {
    super.initState();
    await _createMarkersFromFirebaseData();
  }

  void _onMapCreated(GoogleMapController controller) {
    mapController = controller;
  }

  @override
  Widget build(BuildContext context) => Scaffold(
      body: GoogleMap(
        onMapCreated: _onMapCreated,
        initialCameraPosition: CameraPosition(
          target: _center,
          zoom: 18,
        ),
        markers: markers,
      ),
    );
}
