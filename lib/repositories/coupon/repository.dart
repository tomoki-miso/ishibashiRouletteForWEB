import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ishibashi/domain/coupon/domain.dart';
import 'package:ishibashi/firebase/firebase.dart';
import 'package:ishibashi/style/keys.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'repository.g.dart';

@Riverpod(keepAlive: true)
CollectionReference<Coupon> couponFirestore(CouponFirestoreRef ref) =>
    ref.read(firestoreProvider).collection('coupon').withConverter<Coupon>(
          fromFirestore: (snapshot, _) => Coupon.fromJson(snapshot.data()!),
          toFirestore: (data, _) => data.toJson(),
        );

@Riverpod(keepAlive: true)
class CouponRepo extends _$CouponRepo {
  FirebaseFirestore get db => ref.read(firestoreProvider);

  CollectionReference<Coupon> get collection =>
      ref.read(couponFirestoreProvider);

  @override
  void build() {}

  Future<void> saveCoupon(Coupon coupon, String userId) async {
    final DocumentReference userDocRef = db.collection('user_info').doc(userId);

    await userDocRef.collection('coupons').add(coupon.toJson());
  }

  Future<void> reduceCouponAmount({
    required String couponId,
    required Coupon coupon,
  }) async {
    print(coupon.remainingAmount);
    await collection.doc(couponId).update({
      Keys.remainingAmount: coupon.remainingAmount! - 1,
    }).catchError((e) => throw e);
    print(coupon.remainingAmount);
  }
}
