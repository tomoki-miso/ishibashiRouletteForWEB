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
      id: storeData['id'] ?? '',
      name: storeData['name'] ?? '',
      photo_url: storeData['photo_url'] ?? '',
      formattedOpenTime: storeData['formattedOpenTime'] ?? '',
      formattedCloseTime: storeData['formattedCloseTime'] ?? '',
      formattedOpenTimeSecond: storeData['formattedOpenTimeSecond'] ?? '',
      formattedCloseTimeSecond: storeData['formattedCloseTimeSecond'] ?? '',
      remarksTime: storeData['remarksTime'] ?? '',
      remarksDay: storeData['remarksDay'] ?? '',
      daysOfWeek: businessDays,
      tags: tags,
    );
    return MapStoreInfoState(storeClass: storeClass);
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
}
