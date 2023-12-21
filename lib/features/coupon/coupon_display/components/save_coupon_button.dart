import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ishibashi/components/primary_button.dart';
import 'package:ishibashi/features/coupon/coupon_display/view_model.dart';
import 'package:ishibashi/style/colors.dart';

class SaveCouponButton extends ConsumerWidget {
  const SaveCouponButton({
    required this.couponId,
    super.key,
  });

  final String couponId;

  @override
  Widget build(BuildContext context, WidgetRef ref) => PrimaryButton(
        backgroundColor: ColorName.orangeBase,
        onPressed: () async {
          await ref
              .read(
                couponDisplayViewModelProvider(couponId).notifier,
              )
              .saveCoupon()
              .then(
                (value) => ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                    content: Text('クーポンを保存しました。'),
                    duration: Duration(seconds: 2),
                  ),
                ),
              )
              .then(
                (value) => Navigator.pop(context),
              );
        },
        text: '保存する',
        width: MediaQuery.of(context).size.width * 0.9,
        height: MediaQuery.of(context).size.height * 0.07,
      );
}
