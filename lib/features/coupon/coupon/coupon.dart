import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ishibashi/components/primary_button.dart';
import 'package:ishibashi/features/coupon/components/coupon_app_bar.dart';
import 'package:ishibashi/features/coupon/coupon/view_model.dart';
import 'package:ishibashi/features/coupon/coupon_display/coupon_display.dart';
import 'package:ishibashi/style/colors.dart';
import 'package:lottie/lottie.dart';

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
              SizedBox(
                height: MediaQuery.of(context).size.width * 0.6,
                width: MediaQuery.of(context).size.width * 0.6,
                child: Lottie.asset('assets/lottie/coupon_lottie.json'),
              ),
              SizedBox(
                width: MediaQuery.of(context).size.width * 0.8,
                child: const Text(
                  'クーポンガチャは1日1回必ず挑戦できます。キャンペーンに参加することでさらにたくさん挑戦できるチャンスも⁉',
                  textAlign: TextAlign.center,
                  style: TextStyle(color: ColorName.greyBase),
                ),
              ),
              const Padding(padding: EdgeInsets.all(10)),
              PrimaryButton(
                width: MediaQuery.of(context).size.width * 0.8,
                height: MediaQuery.of(context).size.height * 0.08,
                onPressed: () async {
                  await Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => CouponDisplayPage(
                        couponId: data.couponId,
                      ),
                    ),
                  );
                },
                text: 'クーポンガチャを回す',
              ),
              const Padding(padding: EdgeInsets.all(10)),
            ],
          ),
        ),
      ),
    );
  }
}
