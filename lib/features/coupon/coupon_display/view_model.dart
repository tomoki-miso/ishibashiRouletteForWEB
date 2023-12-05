import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:intl/intl.dart';
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
      remainingAmount: couponData['remainingAmount'],
      couponImage: couponData['couponImage'],
    );

    final state = CouponDisplayState(coupon: coupon);
    return state;
  }

  Future<void> saveCoupon() async {
    
  }
}
