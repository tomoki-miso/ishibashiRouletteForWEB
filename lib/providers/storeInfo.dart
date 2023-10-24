import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ishibashi/storeClass.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'storeInfo.g.dart';

@riverpod
Future<StoreClass> _fetchStoreData() async {
  try {
    final storeSnapshot =
        await FirebaseFirestore.instance.collection('stores').get();
    final storeIds =
        List.generate(storeSnapshot.docs.length, (index) => index + 1);
    storeIds.shuffle();
    storeIds.removeAt(0);
    final storeId = storeIds.first;

    final storeData = storeSnapshot.docs[storeId - 1].data();
    final tags = await _fetchTags(storeSnapshot.docs[storeId - 1].reference);

    var state = StoreClass(
      DocumentId: storeData['document_id'] ?? '',
      StoreName: storeData['name'] ?? '',
      StoreDetail: storeData['detail'] ?? '',
      StoreWeb: storeData['web'] ?? '',
      StoreTwitter: storeData['twitter'] ?? '',
      StoreInsta: storeData['insta'] ?? '',
      StoreTabelog: storeData['tabelog'] ?? '',
      StorePhotoUrl: storeData['photo_url'] ?? '',
      Tags: tags,
    );

    return state;
  } catch (error) {
    throw error;
  }
}

Future<List<String>> _fetchTags(DocumentReference storeReference) async {
  try {
    final storeSnapshot = await storeReference.get();
    final storeData = storeSnapshot.data() as Map<String, dynamic>?;

    if (storeData != null && storeData.containsKey("tags")) {
      final tags = storeData["tags"] as List<dynamic>;
      final formattedTags = tags.map((tag) => tag.toString()).toList();
      return formattedTags;
    } else {
      return [];
    }
  } catch (error) {
    return [];
  }
}

class StoreInfoNotifier extends AutoDisposeAsyncNotifier<StoreClass> {
  @override
  Future<StoreClass> build() async {
    return _fetchStoreData();
  }

  void updateState() async {
    try {
      final storeSnapshot =
          await FirebaseFirestore.instance.collection('stores').get();
      final storeIds =
          List.generate(storeSnapshot.docs.length, (index) => index + 1);
      storeIds.shuffle();
      storeIds.removeAt(0);
      final storeId = storeIds.first;

      final storeData = storeSnapshot.docs[storeId - 1].data();
      final tags = await _fetchTags(storeSnapshot.docs[storeId - 1].reference);

      AsyncValue<StoreClass> newstate = AsyncValue<StoreClass>.data(StoreClass(
        DocumentId: storeData['document_id'] ?? '',
        StoreName: storeData['name'] ?? '',
        StoreDetail: storeData['detail'] ?? '',
        StoreWeb: storeData['web'] ?? '',
        StoreTwitter: storeData['twitter'] ?? '',
        StoreInsta: storeData['insta'] ?? '',
        StoreTabelog: storeData['tabelog'] ?? '',
        StorePhotoUrl: storeData['photo_url'] ?? '',
        Tags: tags,
      ));

      state = newstate;
    } catch (error) {
      throw error;
    }
  }
}
