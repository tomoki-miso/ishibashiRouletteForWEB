import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ishibashi/domain/coupon/domain.dart';
import 'package:ishibashi/domain/user_info/domain_user_info.dart';
import 'package:ishibashi/firebase/firebase.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'repository.g.dart';

@Riverpod(keepAlive: true)
class CouponRepo extends _$CouponRepo {
  FirebaseFirestore get db => ref.read(firestoreProvider);

  @override
  void build() {}

  Future<void> saveCoupon(Coupon coupon, UserInfoClass userInfo) async {
    final DocumentReference userDocRef =
        db.collection('user_info').doc(userInfo.userId);

    await userDocRef.set(userInfo.toJson());

    await userDocRef.collection('coupons').add(coupon.toJson());
  }
}
