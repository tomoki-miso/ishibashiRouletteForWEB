import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:ishibashi/domain/store/store_class.dart';
import 'package:ishibashi/screens/search/business_day_search/state.dart';
import 'package:ishibashi/screens/store_details/page/store_detail.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'view_model.g.dart';

@riverpod
class BusinessDaySearchViewModel extends _$BusinessDaySearchViewModel {
  QuerySnapshot? _storeSnapshot;

  @override
  FutureOr<BusinessDaySearchState> build() async {
    _storeSnapshot ??=
        await FirebaseFirestore.instance.collection('stores').get();

    const state = BusinessDaySearchState(
      searchResultStoreList: [],
      selectedDays: [],
    );
    return state;
  }

  Future<void> searchBusinessDay(List<String> selectedDays) async {
    final FirebaseFirestore firestore = FirebaseFirestore.instance;
    if (selectedDays.isNotEmpty) {
      final querySnapshot = await firestore
          .collection('stores')
          .where('daysOfWeek', arrayContainsAny: selectedDays)
          .get();
      final List<Future<StoreClass>> futureStoreList =
          querySnapshot.docs.map((document) async {
        final storeData = document.data();

        final tags = await _fetchTags(document.reference);
        return StoreClass(
          documentId: storeData['id'] ?? '',
          storeName: storeData['name'] ?? '',
          storeDetail: storeData['detail'] ?? '',
          storeWeb: storeData['web'] ?? '',
          storeTwitter: storeData['twitter'] ?? '',
          storeInsta: storeData['insta'] ?? '',
          storeTabelog: storeData['tabelog'] ?? '',
          storePhotoUrl: storeData['photo_url'] ?? '',
          openTime: storeData['formattedOpenTime'] ?? '',
          closeTime: storeData['formattedCloseTime'] ?? '',
          tags: tags,
        );
      }).toList();

      final List<StoreClass> storeList = await Future.wait(futureStoreList);
      final data = state.requireValue;
      state = AsyncData(data.copyWith(searchResultStoreList: storeList));
    } else {
      final data = state.requireValue;
      state = AsyncData(data.copyWith(searchResultStoreList: []));
    }
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

  /// 曜日のボタンを押したときの処理
  Future<void> handleDaySelection(String day) async {
    final data = state.requireValue;
    final List<String> updatedDays = List.from(data.selectedDays); // 新しいリストを作成

    if (updatedDays.contains(day)) {
      updatedDays.remove(day); // 要素を削除
    } else {
      updatedDays.add(day); // 要素を追加
    }

    state = AsyncData(data.copyWith(selectedDays: updatedDays));
    await searchBusinessDay(updatedDays);
  }

  /// detailPageに飛ばす
  Future<void> navigateToStorePage(
    BuildContext context,
    String documentId,
  ) async =>
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => StoreDetailPage(documentId: documentId),
        ),
      );
}
