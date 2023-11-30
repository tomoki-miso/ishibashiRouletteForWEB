import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ishibashi/firebase/firebase.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'repository.g.dart';

@Riverpod(keepAlive: true)
class StoresRepo extends _$StoresRepo {
  FirebaseFirestore get db => ref.read(firestoreProvider);

  @override
  void build() {}
}
