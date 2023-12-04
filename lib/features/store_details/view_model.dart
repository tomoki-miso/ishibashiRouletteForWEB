import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ishibashi/domain/store/store_class.dart';
import 'package:ishibashi/features/store_details/state.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'view_model.g.dart';

@riverpod
class ListDetailViewModel extends _$ListDetailViewModel {
  @override
  FutureOr<ListDetailState> build(documentId) async {
    final storeSnapshot = await FirebaseFirestore.instance
        .collection('stores')
        .doc(documentId)
        .get();

    final storeData = storeSnapshot.data()!;
    final tags = await _fetchTags(storeSnapshot.reference);

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

    final state = ListDetailState(storeClass: storeClass);
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
}
