import 'package:cloud_firestore/cloud_firestore.dart';

import 'package:ishibashi/domain/owned_coupon/domain.dart';
import 'package:ishibashi/features/coupon/use_coupon/state.dart';
import 'package:ishibashi/firebase/firebase.dart';
import 'package:ishibashi/repositories/coupon/repository.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'view_model.g.dart';

@riverpod
class UseCouponViewModel extends _$UseCouponViewModel {
  CouponRepo get coupoRepo => ref.read(couponRepoProvider.notifier);

  @override
  FutureOr<UseCouponState> build(String couponId) async {
    final storeSnapshot = await FirebaseFirestore.instance
        .collection('user_info')
        .doc(ref.read(firebaseAuthProvider).currentUser!.uid)
        .collection('coupons')
        .doc(couponId)
        .get();

    final couponData = storeSnapshot.data()!;

    final OwnedCoupon coupon = OwnedCoupon(
      storeId: couponData['storeId'],
      couponId: couponData['couponId'],
      couponName: couponData['couponName'],
      storeName: couponData['storeName'],
      couponDetail: couponData['detail'],
      expiration: couponData['expiration'],
      couponImage: couponData['couponImage'],
    );

    return UseCouponState(coupon: coupon);
  }

  void _updateLoading(bool isLoading) =>
      state = AsyncData(state.requireValue.copyWith(isLoading: isLoading));
}
