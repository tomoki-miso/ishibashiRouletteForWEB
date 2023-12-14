import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ishibashi/domain/coupon/domain.dart';
import 'package:ishibashi/domain/owned_coupon/domain.dart';
import 'package:ishibashi/domain/user_info/domain_user_info.dart';
import 'package:ishibashi/firebase/firebase.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'repository.g.dart';

@Riverpod(keepAlive: true)
CollectionReference<UserInfoClass> userInfoFirestore(
  UserInfoFirestoreRef ref,
) =>
    ref
        .read(firestoreProvider)
        .collection('user_info')
        .withConverter<UserInfoClass>(
          fromFirestore: (snapshot, _) =>
              UserInfoClass.fromJson(snapshot.data()!),
          toFirestore: (data, _) => data.toJson(),
        );

@Riverpod(keepAlive: true)
class UserInfoClassRepo extends _$UserInfoClassRepo {
  CollectionReference<UserInfoClass> get collection =>
      ref.read(userInfoFirestoreProvider);

  FirebaseFirestore get db => ref.read(firestoreProvider);

  String get uid => ref.read(firebaseAuthProvider).currentUser!.uid;

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

  Future<void> saveCoupon(OwnedCoupon ownedCoupon) async {
    final DocumentReference userDocRef = db
        .collection('user_info')
        .doc(ref.read(firebaseAuthProvider).currentUser!.uid);

    await userDocRef
        .collection('coupons')
        .doc(ownedCoupon.couponId)
        .set(ownedCoupon.toJson());

    await db.collection('user_info').doc(uid).update({
      'couponGotAt': FieldValue.serverTimestamp(),
    });
  }
}
