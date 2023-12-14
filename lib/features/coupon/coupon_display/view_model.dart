import 'package:cloud_firestore/cloud_firestore.dart';

import 'package:intl/intl.dart';
import 'package:ishibashi/domain/coupon/domain.dart';
import 'package:ishibashi/features/coupon/coupon_display/state.dart';
import 'package:ishibashi/repositories/coupon/repository.dart';
import 'package:ishibashi/repositories/user_info/repository.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'view_model.g.dart';

@riverpod
class CouponDisplayViewModel extends _$CouponDisplayViewModel {
  CouponRepo get coupoRepo => ref.read(couponRepoProvider.notifier);
  UserInfoClassRepo get userInfoRepo =>
      ref.read(userInfoClassRepoProvider.notifier);

  @override
  FutureOr<CouponDisplayState> build(String couponId) async {
    final storeSnapshot = await FirebaseFirestore.instance
        .collection('coupon')
        .doc(couponId)
        .get();

    final couponData = storeSnapshot.data()!;

    /// 型変換
    final Timestamp expirationTimestamp = couponData[
        'expiration']; // 仮にcouponData['expiration']がFirebaseのTimestamp型として取得されると仮定しています

    final DateTime expirationDateTime = expirationTimestamp.toDate();
    final String formattedExpiration =
        DateFormat('yyyy年 M/dd HH:mm').format(expirationDateTime);

    final Coupon coupon = Coupon(
      storeId: couponData['storeId'],
      couponId: couponData['couponId'],
      couponName: couponData['couponName'],
      storeName: couponData['storeName'],
      couponDetail: couponData['detail'],
      expiration: formattedExpiration,
      couponImage: couponData['couponImage'],
      remainingAmount: couponData['remainingAmount'],
    );

    final state = CouponDisplayState(coupon: coupon);
    return state;
  }

  Future<void> saveCoupon() async {
    final data = state.requireValue.coupon;

    final Coupon gotCoupon = Coupon(
      storeId: data.storeId,
      couponId: data.couponId,
      couponName: data.couponName,
      storeName: data.storeName,
      couponDetail: data.couponDetail,
      expiration: data.expiration,
      couponImage: data.couponImage,
      remainingAmount: data.remainingAmount - 1,
    );
    try {
      // ローディング開始
      _updateLoading(true);

      await userInfoRepo.saveCoupon(gotCoupon).then(
            (value) => coupoRepo.reduceCouponAmount(
              coupon: gotCoupon,
            ),
          );

      /// クーポンを保存した時間記録
    } catch (e) {
    } finally {
      //　ここでローディング止める
      _updateLoading(false);
    }
  }

  void _updateLoading(bool isLoading) =>
      state = AsyncData(state.requireValue.copyWith(isLoading: isLoading));
}
