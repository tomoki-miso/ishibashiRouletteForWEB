import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class CouponLottiePart extends StatelessWidget {
  const CouponLottiePart({super.key});

  @override
  Widget build(BuildContext context) => SizedBox(
        height: MediaQuery.of(context).size.width * 0.6,
        width: MediaQuery.of(context).size.width * 0.6,
        child: Lottie.asset('assets/lottie/coupon_lottie.json'),
      );
}
