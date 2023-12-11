import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:ishibashi/domain/store/store_class.dart';
import 'package:ishibashi/features/list/state.dart';
import 'package:ishibashi/features/store_details/page/store_detail.dart';
import 'package:ishibashi/repositories/stores/repository.dart';

import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'view_model.g.dart';

@riverpod
class ListViewModel extends _$ListViewModel {
  QuerySnapshot? _storeSnapshot;
  StoresRepo get storesRepo => ref.read(storesRepoProvider.notifier);

  @override
  FutureOr<ListState> build() async {
    _storeSnapshot ??=
        await FirebaseFirestore.instance.collection('stores').get();

    final List<Future<StoreClass>> futureStoreList =
        _storeSnapshot!.docs.map((document) async {
      final storeData = document.data() as Map<String, dynamic>?;

      if (storeData != null) {
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
          openTimeSecond: storeData['formattedOpenTimeSecond'] ?? '',
          closeTimeSecond: storeData['formattedCloseTimeSecond'] ?? '',
          remarksTime: storeData['remarksTime'] ?? '',
          tags: tags,
        );
      }
      return Future.value(const StoreClass(documentId: '1'));
    }).toList();

    final List<StoreClass> storeList = await Future.wait(futureStoreList);

    return ListState(storeClassList: storeList);
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
