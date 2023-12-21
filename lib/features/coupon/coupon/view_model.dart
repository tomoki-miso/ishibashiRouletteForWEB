import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ishibashi/domain/coupon/domain.dart';
import 'package:ishibashi/domain/user_info/domain_user_info.dart';
import 'package:ishibashi/features/coupon/coupon/state.dart';
import 'package:ishibashi/firebase/firebase.dart';
import 'package:ishibashi/repositories/coupon/repository.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'view_model.g.dart';

@riverpod
class CouponViewModel extends _$CouponViewModel {
  CouponRepo get coupoRepo => ref.read(couponRepoProvider.notifier);

  @override
  FutureOr<CouponState> build() async {
    final userId = ref.read(firebaseAuthProvider).currentUser!.uid;
    final CollectionReference couponsCollection = FirebaseFirestore.instance
        .collection('user_info')
        .doc(userId)
        .collection('coupons');

    final QuerySnapshot querySnapshot = await couponsCollection.get();

    // ドキュメントのリストを取得
    final List<DocumentSnapshot> documents = querySnapshot.docs;

    // ドキュメント名のリストを取得
    final List<String> documentNames = documents.map((doc) => doc.id).toList();

    final couponId = await _shuffleCouponNotInList(documentNames);

    final userInfoData = await FirebaseFirestore.instance
        .collection('user_info')
        .doc(userId)
        .get();

    final state = CouponState(
      coupon: Coupon(couponId: couponId),
      userInfo: UserInfoClass(
        userId: userId,
        isCanGetCoupon: userInfoData['isCanGetCoupon'],
      ),
    );
    return state;
  }

  Future<String> _shuffleCouponNotInList(List<String> documentNames) async {
    final couponSnapshot = await FirebaseFirestore.instance
        .collection('coupon')
        .where('remainingAmount', isGreaterThan: 0)
        .where('isObtainable', isEqualTo: true)
        .get();

    final List<String> couponIds =
        couponSnapshot.docs.map((doc) => doc.id).toList();

    // documentNamesに含まれないcouponIdsのリストを取得
    final List<String> notInList =
        couponIds.where((id) => !documentNames.contains(id)).toList();

    // シャッフルして最初の要素を取得
    // ignore: cascade_invocations
    notInList.shuffle();
    final couponId =
        notInList.isNotEmpty ? notInList.first : ''; // リストが空の場合は空文字列を返す

    return couponId;
  }

  Future<void> upDateIsCanGetCoupon(String userId) async {
    try {
      // ローディング開始
      _updateLoading(true);

      // Firestoreから最新のデータを取得するためにSourceオプションを設定
      final userInfoData = await FirebaseFirestore.instance
          .collection('user_info')
          .doc(userId)
          .get(const GetOptions(source: Source.server));

      final data = state.requireValue;
      state = AsyncData(
        data.copyWith(
          userInfo: UserInfoClass(
            userId: userId,
            isCanGetCoupon: userInfoData['isCanGetCoupon'],
          ),
        ),
      );
    } catch (e) {
      rethrow;
    } finally {
      //　ここでローディング止める
      _updateLoading(false);
    }
  }

  void _updateLoading(bool isLoading) =>
      state = AsyncData(state.requireValue.copyWith(isLoading: isLoading));
}
