import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ishibashi/domain/user_info/domain_user_info.dart';
import 'package:ishibashi/firebase/firebase.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'repository.g.dart';

@Riverpod(keepAlive: true)
CollectionReference<UserInfoClass> appUserFirestore(AppUserFirestoreRef ref) =>
    ref
        .read(firestoreProvider)
        .collection('user_info')
        .withConverter<UserInfoClass>(
          fromFirestore: (snapshot, _) =>
              UserInfoClass.fromJson(snapshot.data()!),
          toFirestore: (data, _) => data.toJson(),
        );

@Riverpod(keepAlive: true)
class UserInfoRepo extends _$UserInfoRepo {
  FirebaseFirestore get db => ref.read(firestoreProvider);
  String get uid => ref.read(firebaseAuthProvider).currentUser!.uid;
  CollectionReference<UserInfoClass> get collection =>
      ref.read(appUserFirestoreProvider);
  @override
  void build() {}

  Stream<DocumentSnapshot<UserInfoClass>> streamUser() =>
      collection.doc(uid).snapshots();

  Future<void> saveUserInfo(UserInfoClass userInfo) async {
    await db
        .collection('user_info')
        .doc(userInfo.userId)
        .set(userInfo.toJson());
  }
}
