import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'storeInfo.g.dart';

@riverpod
class StoreInfoNotifier extends _$StoreInfoNotifier {
  @override
  Stream<String> build() {
    final controller = StreamController<String>();
    

    FirebaseFirestore.instance.collection('stores').snapshots().listen((querySnapshot) {
      for (var doc in querySnapshot.docs) {
        controller.add(doc as String);
      }
    });

    return controller.stream;
  }
}
