import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ishibashi/domain/user_info/domain_user_info.dart';
import 'package:ishibashi/firebase/firebase.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'repository.g.dart';

@Riverpod(keepAlive: true)
class UserInfoRepo extends _$UserInfoRepo {
  FirebaseFirestore get db => ref.read(firestoreProvider);

  @override
  void build() {}

  Future<void> saveUserInfo(UserInfoClass userInfo) async {
    await db
        .collection('user_info')
        .doc(userInfo.userId)
        .set(userInfo.toJson());
  }
}
