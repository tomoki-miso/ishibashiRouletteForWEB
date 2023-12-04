import 'package:flutter/material.dart';
import 'package:ishibashi/components/original_app_bar.dart';
import 'package:ishibashi/style/colors.dart';
import 'package:lottie/lottie.dart';

class CouponPrePage extends StatelessWidget {
  const CouponPrePage({super.key});

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: const OriginalAppBar(),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                height: MediaQuery.of(context).size.width * 0.6,
                width: MediaQuery.of(context).size.width * 0.6,
                child: Lottie.asset('assets/lottie/coupon_lottie.json'),
              ),
              const Padding(padding: EdgeInsets.all(4)),
              const Text(
                '絶賛制作中！\nアップデートをお楽しみに！',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: ColorName.black2,
                ),
              ),
            ],
          ),
        ),
      );
}