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

  Future<void> saveCoupon(Coupon coupon) async {
    final DocumentReference userDocRef = db
        .collection('user_info')
        .doc(ref.read(firebaseAuthProvider).currentUser!.uid);

    await userDocRef
        .collection('coupons')
        .doc(coupon.couponId)
        .set(coupon.toJson());
  }

  Future<void> useCoupon(String couponId) async {
    final DocumentReference userDocRef = db
        .collection('user_info')
        .doc(ref.read(firebaseAuthProvider).currentUser!.uid)
        .collection('coupons')
        .doc(couponId);

    await userDocRef.update({'isAvailable': false});
  }

  Future<void> reduceCouponAmount({
    required String couponId,
    required Coupon coupon,
  }) async {
    await collection
        .doc(couponId)
        .update({Keys.remainingAmount: FieldValue.increment(-1)}).catchError(
            (e) => throw e);
    print(coupon.remainingAmount);
  }
}
