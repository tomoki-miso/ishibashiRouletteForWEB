import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ishibashi/class/store_class.dart';

class StoreNotifier extends StateNotifier<List<StoreClass>> {
  StoreNotifier() : super([]);

  // 空っぽのクラスに、id、フォームの値、現在時刻を保存する.
  void addNote(StoreClass note) {
    state = [...state, note];
  }

  // ダミーのデータを削除する.
  void removeNote(StoreClass note) {
    state = state.where((note) => note != note).toList();
  }

  Future<void> getStores() async {
    // Firestore からデータを取得するコードを実装
    final querySnapshot =
        await FirebaseFirestore.instance.collection('stores').get();

    // Firestore から取得したデータを StoreClass リストに変換
    final data = querySnapshot.docs.map((doc) async {
      final storeSnapshot =
          await FirebaseFirestore.instance.collection('stores').get();
      final storeIds =
          List.generate(storeSnapshot.docs.length, (index) => index + 1);
      storeIds.shuffle();
      storeIds.removeAt(0);
      final storeId = storeIds.first;
      final storeData = storeSnapshot.docs[storeId - 1].data();
      final tags = await _fetchTags(storeSnapshot.docs[storeId - 1].reference);
      // StoreClass のインスタンスを作成し、Firestore からのデータを該当のプロパティに設定
      return StoreClass(
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
    }).toList();

    // state を更新
    state = data.cast<StoreClass>();
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
