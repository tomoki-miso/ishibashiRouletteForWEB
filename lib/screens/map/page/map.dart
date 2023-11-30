// ignore_for_file: empty_catches

import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
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
    try {
      final List<Map<String, dynamic>> firebaseData =
          await _fetchDataFromFirestore();
      final Set<Marker> markerSet = {};

      for (final data in firebaseData) {
        // ignore: duplicate_ignore
        try {
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
        } catch (e) {}
      }

      setState(() {
        markers = markerSet; // マーカーセットを更新
      });

      // マーカーが正しくセットされたかどうかをログで確認
    } catch (e) {}
  }

  Position? currentPosition;
  late StreamSubscription<Position> positionStream;

  final LocationSettings locationSettings = const LocationSettings(
    accuracy: LocationAccuracy.high, //正確性:highはAndroid(0-100m),iOS(10m)
    distanceFilter: 100,
  );

  @override
  void initState() {
    super.initState();
    _initialize();
  }

  Future<void> _initialize() async {
    await _createMarkersFromFirebaseData();

    //位置情報が許可されていない時に許可をリクエストする
    final LocationPermission permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      await Geolocator.requestPermission();
    }

    //現在位置を更新し続ける
    positionStream =
        Geolocator.getPositionStream(locationSettings: locationSettings)
            .listen((position) {
      setState(() {
        currentPosition = position;
      });
    });
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
          myLocationEnabled: true, //現在位置をマップ上に表示
          markers: markers,
        ),
      );
}
