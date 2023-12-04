import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:ishibashi/domain/store/store_class.dart';
import 'package:ishibashi/features/search/keyword_search/state.dart';
import 'package:ishibashi/features/store_details/page/store_detail.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'view_model.g.dart';

@riverpod
class KeywordSearchViewModel extends _$KeywordSearchViewModel {
  QuerySnapshot? _storeSnapshot;

  @override
  FutureOr<KeywordSearchState> build() async {
    _storeSnapshot ??=
        await FirebaseFirestore.instance.collection('stores').get();

    final state = KeywordSearchState(
      searchWordController: TextEditingController(),
      searchResultStoreList: [],
    );
    return state;
  }

  Future<void> searchKeyword(String searchWord) async {
    final searchWordList = [searchWord];
    final FirebaseFirestore firestore = FirebaseFirestore.instance;
    final querySnapshot = await firestore
        .collection('stores')
        .where('keywords', arrayContainsAny: searchWordList)
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
