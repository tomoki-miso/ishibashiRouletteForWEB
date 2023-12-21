import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ishibashi/domain/store/store_class.dart';
import 'package:ishibashi/features/map/components/map_store_info_bottom_sheet/state.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'view_model.g.dart';

@riverpod
class MapStoreInfoViewModel extends _$MapStoreInfoViewModel {
  @override
  FutureOr<MapStoreInfoState> build(String documentId) async {
    final storeSnapshot = await FirebaseFirestore.instance
        .collection('stores')
        .doc(documentId)
        .get();

    final storeData = storeSnapshot.data()!;
    final tags = await _fetchTags(storeSnapshot.reference);
    final businessDays = await _fetchBusinessDays(storeSnapshot.reference);

    final StoreClass storeClass = StoreClass(
      documentId: storeData['id'] ?? '',
      storeName: storeData['name'] ?? '',
      storePhotoUrl: storeData['photo_url'] ?? '',
      openTime: storeData['formattedOpenTime'] ?? '',
      closeTime: storeData['formattedCloseTime'] ?? '',
      openTimeSecond: storeData['formattedOpenTimeSecond'] ?? '',
      closeTimeSecond: storeData['formattedCloseTimeSecond'] ?? '',
      remarksTime: storeData['remarksTime'] ?? '',
      remarksDay: storeData['remarksDay'] ?? '',
      businessDays: businessDays,
      tags: tags,
    );
    final String testText = 'こんにちは';
    final state = MapStoreInfoState(storeClass: storeClass, testText: testText);
    return state;
  }

  Future<List<String>> _fetchTags(DocumentReference storeReference) async {
    final storeSnapshot = await storeReference.get();
    final storeData = storeSnapshot.data() as Map<String, dynamic>?;

    if (storeData != null && storeData.containsKey('tags')) {
      final tags = storeData['tags'] as List<dynamic>;
      final formattedTags = tags.map((tag) => tag.toString()).toList();
      return formattedTags;
    } else {
      return [];
    }
  }

  Future<List<String>> _fetchBusinessDays(
    DocumentReference storeReference,
  ) async {
    final storeSnapshot = await storeReference.get();
    final storeData = storeSnapshot.data() as Map<String, dynamic>?;

    if (storeData != null && storeData.containsKey('daysOfWeek')) {
      final days = storeData['daysOfWeek'] as List<dynamic>;
      final formattedBusinessDays = days.map((day) => day.toString()).toList();
      return formattedBusinessDays;
    } else {
      return [];
    }
  }

  Future<void> changeTestText() async {
    final data = state.requireValue;
    if (data.testText == 'こんにちは') {
      state = AsyncData(data.copyWith(testText: 'こんばんは'));
    } else if (data.testText == 'こんばんは') {
      state = AsyncData(data.copyWith(testText: 'こんにちは'));
    }
  }
}
