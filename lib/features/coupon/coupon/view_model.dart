import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ishibashi/domain/coupon/domain.dart';
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

    final state = CouponState(
      coupon: Coupon(couponId: couponId),
    );
    return state;
  }

  Future<String> _shuffleCouponNotInList(List<String> documentNames) async {
    final couponSnapshot =
        await FirebaseFirestore.instance.collection('coupon').get();

    final List<String> couponIds =
        couponSnapshot.docs.map((doc) => doc.id).toList();

    // documentNamesに含まれないcouponIdsのリストを取得
    final List<String> notInList =
        couponIds.where((id) => !documentNames.contains(id)).toList();

    // シャッフルして最初の要素を取得
    notInList.shuffle();
    final couponId =
        notInList.isNotEmpty ? notInList.first : ''; // リストが空の場合は空文字列を返す

    return couponId;
  }
}
