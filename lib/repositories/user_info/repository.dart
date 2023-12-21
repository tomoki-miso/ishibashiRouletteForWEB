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

  /// クーポン保存
  Future<void> saveCoupon(OwnedCoupon ownedCoupon, Coupon coupon) async {
    await db.runTransaction((t) async {
      final DocumentReference userDocRef = db
          .collection('user_info')
          .doc(ref.read(firebaseAuthProvider).currentUser!.uid);

      final DocumentReference userCouponDocRef =
          userDocRef.collection('coupons').doc(ownedCoupon.couponId);

      final DocumentReference couponDocRef =
          db.collection('coupon').doc(coupon.couponId);

      t
        ..set(userCouponDocRef, ownedCoupon.toJson())
        ..update(
          userDocRef,
          {
            'couponGotAt': FieldValue.serverTimestamp(),
            'isCanGetCoupon': false,
          },
        )
        ..update(couponDocRef, {'remainingAmount': FieldValue.increment(-1)});
    });
  }
}
