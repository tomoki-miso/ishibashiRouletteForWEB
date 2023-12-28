import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ishibashi/domain/store/store_class.dart';
import 'package:ishibashi/firebase/firebase.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'repository.g.dart';

@Riverpod(keepAlive: true)
class StoresRepo extends _$StoresRepo {
  FirebaseFirestore get db => ref.read(firestoreProvider);
  CollectionReference<StoreClass> get collection => ref
      .read(firestoreProvider)
      .collection(StoreClass.collectionName)
      .withConverter<StoreClass>(
        fromFirestore: (snapshot, _) => StoreClass.fromJson(snapshot.data()!),
        toFirestore: (data, _) => data.toJson(),
      );

  @override
  void build() {}

  Future<List<StoreClass>> getStoresByIds() async {
    final List<StoreClass> storesList = [
      ...await collection
          .get()
          .then((value) => value.docs.map((e) => e.data()).toList()),
    ];
    return storesList;
  }

  Future<StoreClass> getStoreById(String storeId) async =>
      collection.doc(storeId).get().then((value) {
        if (value.data() == null) {
          throw ArgumentError('データが存在しません');
        }
        return value.data()!;
      });
}
