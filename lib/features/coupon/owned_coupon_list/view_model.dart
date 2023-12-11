import 'package:cloud_firestore/cloud_firestore.dart';

import 'package:ishibashi/domain/owned_coupon/domain.dart';
import 'package:ishibashi/features/coupon/owned_coupon_list/state.dart';
import 'package:ishibashi/firebase/firebase.dart';
import 'package:ishibashi/repositories/coupon/repository.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'view_model.g.dart';

@riverpod
class OwnedCouponListViewModel extends _$OwnedCouponListViewModel {
  CouponRepo get coupoRepo => ref.read(couponRepoProvider.notifier);

  @override
  FutureOr<OwnedCouponListState> build() async {
    final storeSnapshot = await FirebaseFirestore.instance
        .collection('user_info')
        .doc(ref.read(firebaseAuthProvider).currentUser!.uid)
        .collection('coupons')
        .get();

    final List<Future<OwnedCoupon>> futureStoreList =
        storeSnapshot.docs.map((document) async {
      final couponData = document.data();

      /// 型変換は不要？
      return OwnedCoupon(
        storeId: couponData['storeId'],
        couponId: couponData['couponId'],
        couponName: couponData['couponName'],
        storeName: couponData['storeName'],
        couponDetail: couponData['detail'],
        expiration: couponData['expiration'],
        couponImage: couponData['couponImage'],
      );
    }).toList();

    final List<OwnedCoupon> couponList = await Future.wait(futureStoreList);

    return OwnedCouponListState(couponList: couponList);
  }

  Future<bool> checkExpiration(int index) async {
    final data = state.requireValue.couponList[index];
    final String dateString = data.expiration;
    final List<String> parts = dateString.split(' ');
    final String year = parts[0].replaceAll('年', '');
    final List<String> dateParts = parts[1].split('/');
    final int month = int.parse(dateParts[0]);
    final int day = int.parse(dateParts[1]);
    final List<String> timeParts = parts[2].split(':');
    final int hour = int.parse(timeParts[0]);
    final int minute = int.parse(timeParts[1]);

    final DateTime expiration =
        DateTime(int.parse(year), month, day, hour, minute);
    final DateTime nowtime = DateTime.now();

    return expiration.isAfter(nowtime);
  }
}
