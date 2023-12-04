import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ishibashi/domain/coupon/domain.dart';
import 'package:ishibashi/features/coupon/coupon_display/state.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'view_model.g.dart';

@riverpod
class CouponDisplayViewModel extends _$CouponDisplayViewModel {
  @override
  FutureOr<CouponDisplayState> build(String couponId) async {
    final storeSnapshot = await FirebaseFirestore.instance
        .collection('coupon')
        .doc(couponId)
        .get();

    final couponData = storeSnapshot.data()!;
    final businessDays = await _fetchBusinessDays(storeSnapshot.reference);

    final Coupon coupon = Coupon(
      couponId: couponData['couponId'],
      couponName: couponData['couponName'],
      storeName: couponData['storeName'],
      couponDetail: couponData['detail'],
      expiration: couponData['expiration'],
      remainingAmount: couponData['remainingAmount'],
      users: couponData['users'],
    );

    final state = CouponDisplayState(coupon: coupon);
    return state;
  }

  Future<List<String>> _fetchBusinessDays(
    DocumentReference storeReference,
  ) async {
    final storeSnapshot = await storeReference.get();
    final couponData = storeSnapshot.data() as Map<String, dynamic>?;

    if (couponData != null && couponData.containsKey('daysOfWeek')) {
      final days = couponData['daysOfWeek'] as List<dynamic>;
      final formattedBusinessDays = days.map((day) => day.toString()).toList();
      return formattedBusinessDays;
    } else {
      return [];
    }
  }
}
