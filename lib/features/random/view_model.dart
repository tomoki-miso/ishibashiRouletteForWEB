import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:ishibashi/domain/store/store_class.dart';
import 'package:ishibashi/features/random/state.dart';
import 'package:ishibashi/features/store_details/page/store_detail.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'view_model.g.dart';

@riverpod
class RandomViewModel extends _$RandomViewModel {
  QuerySnapshot? _storeSnapshot;

  @override
  FutureOr<RandomState> build() async {
    final storeClass = await _shuffle();
    final state = RandomState(storeClass: storeClass);
    return state;
  }

  /// ルーレットを回す
  Future<void> getStores() async {
    final storeClass = await _shuffle();
    final data = state.requireValue;
    state = AsyncData(data.copyWith(storeClass: storeClass));
  }

  /// シャッフル
  Future<StoreClass> _shuffle() async {
    _storeSnapshot ??=
        await FirebaseFirestore.instance.collection('stores').get();

    final storeIds =
        List.generate(_storeSnapshot!.docs.length, (index) => index + 1);
    storeIds.shuffle();
    storeIds.removeAt(0);
    final storeId = storeIds.first;
    final storeData = _storeSnapshot!.docs[storeId - 1];
    final tags = await _fetchTags(_storeSnapshot!.docs[storeId - 1].reference);
    final StoreClass storeClass = StoreClass(
      documentId: storeData['id'] ?? '',
      storeName: storeData['name'] ?? '',
      storeDetail: storeData['detail'] ?? '',
      storeWeb: storeData['web'] ?? '',
      storeTwitter: storeData['twitter'] ?? '',
      storeInsta: storeData['insta'] ?? '',
      storeTabelog: storeData['tabelog'] ?? '',
      storePhotoUrl: storeData['photo_url'] ?? '',
      tags: tags,
    );
    return storeClass;
  }

  /// 詳細ページへ
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
}
