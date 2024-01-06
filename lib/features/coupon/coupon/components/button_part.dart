import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ishibashi/components/primary_button.dart';
import 'package:ishibashi/components/primary_dialog.dart';
import 'package:ishibashi/features/coupon/coupon/state.dart';
import 'package:ishibashi/features/coupon/coupon/view_model.dart';
import 'package:ishibashi/features/coupon/coupon_display/coupon_display.dart';
import 'package:ishibashi/style/colors.dart';

class CouponButtonPart extends ConsumerWidget {
  const CouponButtonPart({
    required this.data,
    required this.userId,
    super.key,
  });

  final CouponState data;
  final String userId;

  @override
  Widget build(BuildContext context, WidgetRef ref) => PrimaryButton(
        backgroundColor: ColorName.orangeBase,
        width: MediaQuery.of(context).size.width * 0.8,
        height: MediaQuery.of(context).size.height * 0.08,
        onPressed: () async {
          await ref
              .read(couponViewModelProvider.notifier)
              .upDateIsCanGetCoupon(userId);

          // 更新後のデータを取得
          final updatedData = ref.read(couponViewModelProvider).requireValue;

          // 更新後のデータのuserInfo.isCanGetCouponを使用
          if (updatedData.coupon.couponId.isNotEmpty &&
              // ignore: use_if_null_to_convert_nulls_to_bools
              updatedData.userInfo.isCanGetCoupon != false) {
            // ignore: use_build_context_synchronously
            await Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => CouponDisplayPage(
                  couponId: updatedData.coupon.couponId,
                ),
              ),
            );
          } else if (updatedData.userInfo.isCanGetCoupon == false) {
            // ignore: use_build_context_synchronously

            // ignore: use_build_context_synchronously
            await showDialog(
              context: context,
              builder: (context) => const PrimaryDialog(
                title: '今日のクーポンを取得済',
                contentWidget: Text(
                  '本日のクーポンを既に取得済みのようです。\n明日の10時からクーポンを獲得できます！\n明日またお会いしましょう！',
                ),
              ),
            );
          }
        },
        text: 'クーポンガチャを回す',
      );
}
