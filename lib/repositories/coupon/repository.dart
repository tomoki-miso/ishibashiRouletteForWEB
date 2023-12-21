import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ishibashi/domain/coupon/domain.dart';
import 'package:ishibashi/firebase/firebase.dart';
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

  Future<void> deleteCoupon(String couponId) async {
    final DocumentReference userDocRef = db
        .collection('user_info')
        .doc(ref.read(firebaseAuthProvider).currentUser!.uid)
        .collection('coupons')
        .doc(couponId);

    await userDocRef.delete();
  }
}
