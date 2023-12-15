import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ishibashi/components/primary_button.dart';
import 'package:ishibashi/features/coupon/coupon/state.dart';
import 'package:ishibashi/features/coupon/coupon_display/coupon_display.dart';
import 'package:ishibashi/features/coupon/coupon_pre/coupon_pre.dart';

class CouponButtonPart extends ConsumerWidget {
  const CouponButtonPart({
    required this.data,
    super.key,
  });

  final CouponState data;

  @override
  Widget build(BuildContext context, WidgetRef ref) => PrimaryButton(
        width: MediaQuery.of(context).size.width * 0.8,
        height: MediaQuery.of(context).size.height * 0.08,
        onPressed: () async {
          /// TODO:クーポンがgetできるか確認する処理,条件分岐
          if (data.coupon.couponId != '') {
            await Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => CouponDisplayPage(
                  couponId: data.coupon.couponId,
                ),
              ),
            );
          } else {
            await Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const CouponPrePage(),
              ),
            );
          }
        },
        text: 'クーポンガチャを回す',
      );
}
