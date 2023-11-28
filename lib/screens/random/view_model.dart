import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ishibashi/screens/random/state.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'view_model.g.dart';

@riverpod
class RandomViewModel extends _$RandomViewModel {
  QuerySnapshot? _storeSnapshot;

  @override
  FutureOr<RandomState> build() async {
    _storeSnapshot ??=
        await FirebaseFirestore.instance.collection('stores').get();
    final storeIds =
        List.generate(_storeSnapshot!.docs.length, (index) => index + 1);
    storeIds.shuffle();
    final storeId = storeIds.first;
    final storeData = _storeSnapshot!.docs[storeId - 1];
    final tags = await _fetchTags(_storeSnapshot!.docs[storeId - 1].reference);
    final state = RandomState(
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
    return state;
  }

  Future<void> getStores() async {
    _storeSnapshot ??=
        await FirebaseFirestore.instance.collection('stores').get();

    await Future.wait(
      _storeSnapshot!.docs.map((doc) async {
        final storeIds =
            List.generate(_storeSnapshot!.docs.length, (index) => index + 1);
        storeIds.shuffle();
        final storeId = storeIds.first;
        final storeData = _storeSnapshot!.docs[storeId - 1];
        final tags =
            await _fetchTags(_storeSnapshot!.docs[storeId - 1].reference);

        state = AsyncValue.data(
          RandomState(
            documentId: storeData['id'] ?? '',
            storeName: storeData['name'] ?? '',
            storeDetail: storeData['detail'] ?? '',
            storeWeb: storeData['web'] ?? '',
            storeTwitter: storeData['twitter'] ?? '',
            storeInsta: storeData['insta'] ?? '',
            storeTabelog: storeData['tabelog'] ?? '',
            storePhotoUrl: storeData['photo_url'] ?? '',
            tags: tags,
          ),
        );
      }),
    );
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
