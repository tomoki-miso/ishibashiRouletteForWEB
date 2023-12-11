import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ishibashi/features/coupon/coupon/state.dart';
import 'package:ishibashi/repositories/coupon/repository.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'view_model.g.dart';

@riverpod
class CouponViewModel extends _$CouponViewModel {
  CouponRepo get coupoRepo => ref.read(couponRepoProvider.notifier);

  @override
  FutureOr<CouponState> build() async {
    final storeSnapshot =
        await FirebaseFirestore.instance.collection('coupon').get();

    final couponIds =
        List.generate(storeSnapshot.docs.length, (index) => index + 1);
    couponIds.shuffle();
    couponIds.removeAt(0);
    final couponId = couponIds.first.toString();
    final state = CouponState(couponId: couponId);
    return state;
  }
}
