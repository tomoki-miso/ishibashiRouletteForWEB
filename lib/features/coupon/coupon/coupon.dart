import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ishibashi/features/coupon/components/coupon_app_bar.dart';
import 'package:ishibashi/features/coupon/coupon/components/button_part.dart';
import 'package:ishibashi/features/coupon/coupon/components/explanation.dart';
import 'package:ishibashi/features/coupon/coupon/components/lottie_part.dart';
import 'package:ishibashi/features/coupon/coupon/view_model.dart';
import 'package:ishibashi/style/colors.dart';

class CouponPage extends ConsumerWidget {
  const CouponPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(couponViewModelProvider);
    return state.when(
      error: (error, stackTrace) => Container(),
      loading: () => const Center(child: CircularProgressIndicator()),
      data: (data) => Scaffold(
        appBar: const CouponAppBar(),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                'クーポンガチャ',
                style: TextStyle(
                  fontSize: 32,
                  fontWeight: FontWeight.bold,
                  color: ColorName.black2,
                ),
              ),
              const Padding(padding: EdgeInsets.all(22)),

              /// Lottie
              const CouponLottiePart(),

              /// 説明
              const CouponExplanation(),
              const Padding(padding: EdgeInsets.all(10)),

              /// クーポンボタン
              CouponButtonPart(data: data),
              const Padding(padding: EdgeInsets.all(10)),
            ],
          ),
        ),
      ),
    );
  }
}
